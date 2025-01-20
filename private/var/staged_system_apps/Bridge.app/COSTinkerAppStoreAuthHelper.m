@interface COSTinkerAppStoreAuthHelper
+ (id)satelliteStoreAccountForFamilyMember:(id)a3;
+ (id)storeAccountWithDSID:(id)a3 altDSID:(id)a4 username:(id)a5;
- (ACAccount)satelliteAppStoreAccount;
- (AKDevice)satelliteAKDevice;
- (COSTinkerAppStoreAuthHelper)initWithContext:(id)a3;
- (UIViewController)presentingViewController;
- (void)authenticateWithCompletion:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setSatelliteAKDevice:(id)a3;
- (void)setSatelliteAppStoreAccount:(id)a3;
@end

@implementation COSTinkerAppStoreAuthHelper

- (COSTinkerAppStoreAuthHelper)initWithContext:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)COSTinkerAppStoreAuthHelper;
  v5 = [(COSTinkerAppStoreAuthHelper *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 presentingViewController];
    presentingViewController = v5->_presentingViewController;
    v5->_presentingViewController = (UIViewController *)v6;

    uint64_t v8 = [v4 satelliteAppStoreAccount];
    satelliteAppStoreAccount = v5->_satelliteAppStoreAccount;
    v5->_satelliteAppStoreAccount = (ACAccount *)v8;

    uint64_t v10 = [v4 satelliteAKDevice];
    satelliteAKDevice = v5->_satelliteAKDevice;
    v5->_satelliteAKDevice = (AKDevice *)v10;
  }
  return v5;
}

+ (id)satelliteStoreAccountForFamilyMember:(id)a3
{
  id v3 = a3;
  if ([v3 hasLinkediTunesAccount])
  {
    id v4 = [v3 iTunesAccountDSID];
    v5 = [v3 iTunesAccountUsername];
    uint64_t v6 = 0;
  }
  else
  {
    id v4 = [v3 dsid];
    v5 = [v3 appleID];
    uint64_t v6 = [v3 altDSID];
  }

  v7 = [(id)objc_opt_class() storeAccountWithDSID:v4 altDSID:v6 username:v5];

  return v7;
}

+ (id)storeAccountWithDSID:(id)a3 altDSID:(id)a4 username:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[ACAccountStore ams_sharedAccountStore];
  [v10 ams_iTunesAccountWithAltDSID:v8 DSID:v7 username:v9];
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if (v7 || v8 || v9)
    {
      v12 = pbb_accountsignin_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315138;
        v17 = "+[COSTinkerAppStoreAuthHelper storeAccountWithDSID:altDSID:username:]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s creatring satellite account", (uint8_t *)&v16, 0xCu);
      }

      objc_super v13 = +[ACAccountStore ams_sharedAccountStore];
      v14 = [v13 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifieriTunesStore];

      id v11 = [objc_alloc((Class)ACAccount) initWithAccountType:v14];
      [v11 setUsername:v9];
      [v11 ams_setDSID:v7];
      [v11 ams_setAltDSID:v8];
    }
    else
    {
      id v11 = 0;
    }
  }

  return v11;
}

- (void)authenticateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)AMSAuthenticateOptions);
  [v5 setAllowServerDialogs:1];
  [v5 setAuthenticationType:1];
  [v5 setCanMakeAccountActive:0];
  uint64_t v6 = AMSLogKey();
  [v5 setLogKey:v6];

  id v7 = pbb_accountsignin_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating new AMS authenticate request", buf, 2u);
  }

  id v8 = objc_alloc_init((Class)AKAppleIDAuthenticationInAppContext);
  [v8 setPresentingViewController:self->_presentingViewController];
  [v8 setServiceType:2];
  [v8 _setProxyingForApp:1];
  [v8 setAppProvidedContext:@"tinker"];
  id v9 = +[CDPAccount sharedInstance];
  uint64_t v10 = [v9 primaryAccountAltDSID];
  [v8 setAltDSID:v10];

  id v11 = [(ACAccount *)self->_satelliteAppStoreAccount username];
  [v8 setUsername:v11];

  [v8 setProxiedDevice:self->_satelliteAKDevice];
  [v8 setIsUsernameEditable:0];
  v12 = objc_opt_new();
  objc_super v13 = [(COSTinkerAppStoreAuthHelper *)self presentingViewController];
  [v12 setPresentingController:v13];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10012FF74;
  v16[3] = &unk_100247E68;
  id v17 = v5;
  id v18 = v4;
  v16[4] = self;
  id v14 = v5;
  id v15 = v4;
  [v12 authenticateWithContext:v8 completion:v16];
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (ACAccount)satelliteAppStoreAccount
{
  return self->_satelliteAppStoreAccount;
}

- (void)setSatelliteAppStoreAccount:(id)a3
{
}

- (AKDevice)satelliteAKDevice
{
  return self->_satelliteAKDevice;
}

- (void)setSatelliteAKDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_satelliteAKDevice, 0);
  objc_storeStrong((id *)&self->_satelliteAppStoreAccount, 0);

  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end