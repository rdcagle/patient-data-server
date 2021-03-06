require 'test_helper'

class UsersControllerTest < ActionController::TestCase
 include Devise::TestHelpers

  setup do
    @request.env["devise.mapping"] = Devise.mappings

    @user = FactoryGirl.create(:user)
    sign_in @user

  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    u = Factory.attributes_for(:user)

    assert_difference('User.count') do
      post :create, user: u
    end
    # need to change the email so it is unique
    u[:email]= "foo1@foo.com"

    assert_difference('User.count') do
      post :create, user: u
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: @user.attributes
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
