@interface HOProfileInstaller
- (BOOL)isInstallNavigationControllerPresented;
- (HOProfileInstaller)init;
- (MCInstallProfileViewController)installProfileViewController;
- (NSData)profileData;
- (NSString)senderURLString;
- (UIViewController)baseViewController;
- (id)installProfileVCCompletionBlock;
- (void)dealloc;
- (void)deviceProfileCompletedNotification:(id)a3;
- (void)dismissInstallProfileViewControllerWithAnimation:(BOOL)a3;
- (void)dismissInstallProfileViewControllerWithAnimation:(BOOL)a3 shouldOpenSenderURL:(BOOL)a4;
- (void)installProfileWithCompletionHandler:(id)a3;
- (void)openSenderURL;
- (void)setBaseViewController:(id)a3;
- (void)setInstallProfileVCCompletionBlock:(id)a3;
- (void)setInstallProfileViewController:(id)a3;
- (void)setProfileData:(id)a3;
- (void)setSenderURLString:(id)a3;
- (void)showProfileInstallationAlertViewWithTitle:(id)a3 message:(id)a4 shouldGoBackToSenderURL:(BOOL)a5;
- (void)showProfileInstallationFlowFromViewController:(id)a3 withSenderURLString:(id)a4;
- (void)showRebootAlertAndReboot;
@end

@implementation HOProfileInstaller

- (HOProfileInstaller)init
{
  v5.receiver = self;
  v5.super_class = (Class)HOProfileInstaller;
  v2 = [(HOProfileInstaller *)&v5 init];
  if (v2)
  {
    v3 = +[NSDistributedNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"deviceProfileCompletedNotification:" name:@"com.apple.sharing.DeviceProfile" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HOProfileInstaller;
  [(HOProfileInstaller *)&v4 dealloc];
}

- (void)showProfileInstallationAlertViewWithTitle:(id)a3 message:(id)a4 shouldGoBackToSenderURL:(BOOL)a5
{
  id v18 = a3;
  id v19 = a4;
  v22 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v18);
  objc_initWeak(&location, self);
  v6 = +[NSBundle mainBundle];
  v7 = @"HOProfileInstallAlertOKButton";
  v8 = [v6 localizedStringForKey:@"HOProfileInstallAlertOKButton" value:@"_" table:@"HOLocalizable"];

  if ([@"_" isEqualToString:v8])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v9 = sub_10004F9FC();
    id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v28;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * v12);
        v14 = +[NSBundle mainBundle];
        v15 = [v14 localizedStringForKey:@"HOProfileInstallAlertOKButton" value:@"HOProfileInstallAlertOKButton" table:v13];

        if (![(__CFString *)v15 isEqualToString:@"HOProfileInstallAlertOKButton"])break; {
        if (v10 == (id)++v12)
        }
        {
          id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v15 = @"_";
    }
  }
  else
  {
    v15 = v8;
  }
  if ([@"_" isEqualToString:v15]) {
    NSLog(@"Sensitive key '%@' not found!", @"HOProfileInstallAlertOKButton");
  }
  else {
    v7 = v15;
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10004F13C;
  v23[3] = &unk_1000C4240;
  objc_copyWeak(&v24, &location);
  BOOL v25 = a5;
  v16 = +[UIAlertAction actionWithTitle:v7 style:0 handler:v23];

  [v22 addAction:v16];
  v17 = [(HOProfileInstaller *)self baseViewController];
  [v17 presentViewController:v22 animated:1 completion:0];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)openSenderURL
{
  v3 = [(HOProfileInstaller *)self senderURLString];
  id v4 = [v3 length];

  if (v4)
  {
    objc_super v5 = [(HOProfileInstaller *)self senderURLString];
    v6 = [(HOProfileInstaller *)self senderURLString];
    unsigned __int8 v7 = [v6 hasSuffix:@"://"];

    if ((v7 & 1) == 0)
    {
      v8 = [(HOProfileInstaller *)self senderURLString];
      uint64_t v9 = +[NSString stringWithFormat:@"%@://", v8];

      objc_super v5 = v9;
    }
    id v10 = +[NSURL URLWithString:v5];
    uint64_t v11 = +[UIApplication sharedApplication];
    unsigned int v12 = [v11 canOpenURL:v10];

    if (v12)
    {
      id v13 = +[UIApplication sharedApplication];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10004F4C8;
      v25[3] = &unk_1000C3060;
      v25[4] = self;
      [v13 openURL:v10 withCompletionHandler:v25];
LABEL_6:

LABEL_18:
      goto LABEL_19;
    }
    v14 = +[LSApplicationWorkspace defaultWorkspace];
    id v24 = 0;
    int v15 = [v14 openURL:v10 withOptions:0 error:&v24];
    id v16 = v24;

    if ((v15 & 1) == 0)
    {
      v17 = HFLogForCategory();
      id v18 = v17;
      if (v16)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100083D48();
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        long long v27 = "-[HOProfileInstaller openSenderURL]";
        __int16 v28 = 2112;
        long long v29 = v10;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "(%s) url %@ could not be opened, trying sensitive URL", buf, 0x16u);
      }

      id v19 = +[LSApplicationWorkspace defaultWorkspace];
      id v23 = v16;
      unsigned __int8 v20 = [v19 openSensitiveURL:v10 withOptions:0 error:&v23];
      id v13 = v23;

      if ((v20 & 1) == 0)
      {
        v21 = HFLogForCategory();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
        if (v13)
        {
          if (v22) {
            sub_100083CD4();
          }
        }
        else if (v22)
        {
          sub_100083C54();
        }

        goto LABEL_6;
      }
      id v16 = v13;
    }

    goto LABEL_18;
  }
  objc_super v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100083BD0(v5);
  }
LABEL_19:
}

- (void)showProfileInstallationFlowFromViewController:(id)a3 withSenderURLString:(id)a4
{
  id v6 = +[NSAssertionHandler currentHandler];
  [v6 handleFailureInMethod:a2, self, @"HOProfileInstaller.m", 118, @"%s is an abstract method that must be overriden by subclass %@", "-[HOProfileInstaller showProfileInstallationFlowFromViewController:withSenderURLString:]", objc_opt_class() object file lineNumber description];
}

- (void)deviceProfileCompletedNotification:(id)a3
{
  id v5 = +[NSAssertionHandler currentHandler];
  [v5 handleFailureInMethod:a2, self, @"HOProfileInstaller.m", 125, @"%s is an abstract method that must be overriden by subclass %@", "-[HOProfileInstaller deviceProfileCompletedNotification:]", objc_opt_class() object file lineNumber description];
}

- (void)showRebootAlertAndReboot
{
  id v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HOProfileInstaller.m", 133, @"%s is an abstract method that must be overriden by subclass %@", "-[HOProfileInstaller showRebootAlertAndReboot]", objc_opt_class() object file lineNumber description];
}

- (void)installProfileWithCompletionHandler:(id)a3
{
  id v5 = +[NSAssertionHandler currentHandler];
  [v5 handleFailureInMethod:a2, self, @"HOProfileInstaller.m", 139, @"%s is an abstract method that must be overriden by subclass %@", "-[HOProfileInstaller installProfileWithCompletionHandler:]", objc_opt_class() object file lineNumber description];
}

- (BOOL)isInstallNavigationControllerPresented
{
  v2 = [(HOProfileInstaller *)self installProfileViewController];
  v3 = [v2 navigationController];
  id v4 = [v3 presentingViewController];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)dismissInstallProfileViewControllerWithAnimation:(BOOL)a3
{
}

- (void)dismissInstallProfileViewControllerWithAnimation:(BOOL)a3 shouldOpenSenderURL:(BOOL)a4
{
  BOOL v5 = a3;
  unsigned __int8 v7 = [(HOProfileInstaller *)self installProfileViewController];
  v8 = [v7 navigationController];

  if (v8)
  {
    uint64_t v9 = [(HOProfileInstaller *)self installProfileVCCompletionBlock];

    if (v9)
    {
      id v10 = [(HOProfileInstaller *)self installProfileVCCompletionBlock];
      v10[2](v10, 0);
    }
    uint64_t v11 = [(HOProfileInstaller *)self installProfileViewController];
    unsigned int v12 = [v11 navigationController];
    id v13 = [v12 presentingViewController];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10004F8E0;
    v14[3] = &unk_1000C4218;
    v14[4] = self;
    BOOL v15 = a4;
    [v13 dismissViewControllerAnimated:v5 completion:v14];
  }
}

- (NSData)profileData
{
  return self->_profileData;
}

- (void)setProfileData:(id)a3
{
}

- (UIViewController)baseViewController
{
  return self->_baseViewController;
}

- (void)setBaseViewController:(id)a3
{
}

- (NSString)senderURLString
{
  return self->_senderURLString;
}

- (void)setSenderURLString:(id)a3
{
}

- (MCInstallProfileViewController)installProfileViewController
{
  return self->_installProfileViewController;
}

- (void)setInstallProfileViewController:(id)a3
{
}

- (id)installProfileVCCompletionBlock
{
  return self->_installProfileVCCompletionBlock;
}

- (void)setInstallProfileVCCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_installProfileVCCompletionBlock, 0);
  objc_storeStrong((id *)&self->_installProfileViewController, 0);
  objc_storeStrong((id *)&self->_senderURLString, 0);
  objc_storeStrong((id *)&self->_baseViewController, 0);

  objc_storeStrong((id *)&self->_profileData, 0);
}

@end