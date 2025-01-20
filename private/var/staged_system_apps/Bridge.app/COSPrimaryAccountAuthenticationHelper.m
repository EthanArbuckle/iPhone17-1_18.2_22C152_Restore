@interface COSPrimaryAccountAuthenticationHelper
+ (id)_contextForPrimaryAccountWithController:(id)a3;
- (AKAppleIDAuthenticationController)authenticationController;
- (void)_authWithContext:(id)a3 completion:(id)a4;
- (void)authenticatePrimaryAccountWithController:(id)a3 completion:(id)a4;
- (void)authenticatePrimaryAccountWithController:(id)a3 withReason:(id)a4 completion:(id)a5;
- (void)setAuthenticationController:(id)a3;
@end

@implementation COSPrimaryAccountAuthenticationHelper

+ (id)_contextForPrimaryAccountWithController:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)AKAppleIDAuthenticationInAppContext);
  v5 = +[CDPAccount sharedInstance];
  v6 = [v5 primaryAccountAltDSID];
  [v4 setAltDSID:v6];

  v7 = +[CDPAccount sharedInstance];
  v8 = [v7 primaryAccountUsername];
  [v4 setUsername:v8];

  [v4 setIsUsernameEditable:0];
  [v4 setPresentingViewController:v3];

  return v4;
}

- (void)_authWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  v7 = (AKAppleIDAuthenticationController *)objc_alloc_init((Class)AKAppleIDAuthenticationController);
  authenticationController = self->_authenticationController;
  self->_authenticationController = v7;

  [(AKAppleIDAuthenticationController *)self->_authenticationController authenticateWithContext:v9 completion:v6];
}

- (void)authenticatePrimaryAccountWithController:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() _contextForPrimaryAccountWithController:v7];

  [(COSPrimaryAccountAuthenticationHelper *)self _authWithContext:v8 completion:v6];
}

- (void)authenticatePrimaryAccountWithController:(id)a3 withReason:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(id)objc_opt_class() _contextForPrimaryAccountWithController:v10];

  [v11 setReason:v9];
  [(COSPrimaryAccountAuthenticationHelper *)self _authWithContext:v11 completion:v8];
}

- (AKAppleIDAuthenticationController)authenticationController
{
  return self->_authenticationController;
}

- (void)setAuthenticationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end