@interface COSTinkerAppleIDAuthenticationController
- (COSPrimaryAccountAuthenticationHelper)primaryAccountAuthenticationHelper;
- (UIViewController)presentingController;
- (void)authenticateWithContext:(id)a3 completion:(id)a4;
- (void)setPresentingController:(id)a3;
- (void)setPrimaryAccountAuthenticationHelper:(id)a3;
@end

@implementation COSTinkerAppleIDAuthenticationController

- (void)authenticateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100118C9C;
  v17[3] = &unk_100247940;
  v19 = self;
  id v20 = a4;
  id v18 = v6;
  id v7 = v6;
  id v8 = v20;
  v9 = objc_retainBlock(v17);
  v10 = objc_alloc_init(COSPrimaryAccountAuthenticationHelper);
  primaryAccountAuthenticationHelper = self->_primaryAccountAuthenticationHelper;
  self->_primaryAccountAuthenticationHelper = v10;

  v12 = self->_primaryAccountAuthenticationHelper;
  v13 = [(COSTinkerAppleIDAuthenticationController *)self presentingController];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100118DBC;
  v15[3] = &unk_100246400;
  id v16 = v9;
  v14 = v9;
  [(COSPrimaryAccountAuthenticationHelper *)v12 authenticatePrimaryAccountWithController:v13 completion:v15];
}

- (UIViewController)presentingController
{
  return self->_presentingController;
}

- (void)setPresentingController:(id)a3
{
}

- (COSPrimaryAccountAuthenticationHelper)primaryAccountAuthenticationHelper
{
  return self->_primaryAccountAuthenticationHelper;
}

- (void)setPrimaryAccountAuthenticationHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAccountAuthenticationHelper, 0);

  objc_storeStrong((id *)&self->_presentingController, 0);
}

@end