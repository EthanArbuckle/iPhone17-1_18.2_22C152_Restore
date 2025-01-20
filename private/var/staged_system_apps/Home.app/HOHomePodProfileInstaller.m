@interface HOHomePodProfileInstaller
- (id)_cancelAction;
- (void)_handleProfileInstallationForHome:(id)a3;
- (void)_installProfileForHomePod:(id)a3;
- (void)_installProfileForHomePods:(id)a3;
- (void)_presentCompletionAlert;
- (void)_presentErrorAlert;
- (void)_presentHomePodSelectionAlertWithHomePods:(id)a3;
- (void)_presentHomeSelectionAlertWithHomes:(id)a3;
- (void)_presentManagedConfigurationProfileInstallation;
- (void)_presentPartialErrorAlertForHomePods:(id)a3;
- (void)_showProfileInstallationFlow;
- (void)_startProfileInstallation;
- (void)deviceProfileCompletedNotification:(id)a3;
- (void)installProfileWithCompletionHandler:(id)a3;
- (void)showProfileInstallationFlowFromViewController:(id)a3 withSenderURLString:(id)a4;
@end

@implementation HOHomePodProfileInstaller

- (void)showProfileInstallationFlowFromViewController:(id)a3 withSenderURLString:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(HOProfileInstaller *)self dismissInstallProfileViewControllerWithAnimation:0];
  [(HOProfileInstaller *)self setBaseViewController:v7];

  [(HOProfileInstaller *)self setSenderURLString:v6];

  [(HOHomePodProfileInstaller *)self _showProfileInstallationFlow];
}

- (void)_showProfileInstallationFlow
{
  v3 = +[HOManagedConfigurationUtilities popProfileDataFromHeadOfInstallationQueue];
  [(HOProfileInstaller *)self setProfileData:v3];

  v4 = [(HOProfileInstaller *)self profileData];

  if (v4)
  {
    if (+[HOManagedConfigurationUtilities isProfileInstallationUIAllowed])
    {
      id v5 = objc_alloc((Class)MCInstallProfileViewController);
      id v6 = [(HOProfileInstaller *)self profileData];
      id v12 = [v5 initWithProfileDataFromSettingsJump:v6];

      [(HOProfileInstaller *)self setInstallProfileViewController:v12];
      [v12 setDelegate:self];
      id v7 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v12];
      v8 = [(HOProfileInstaller *)self baseViewController];
      [v8 presentViewController:v7 animated:1 completion:0];
    }
    else
    {
      sub_100050114(@"HOProfileUINotAllowedTitle");
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      sub_100050114(@"HOProfileUINotAllowedMessage");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      [(HOProfileInstaller *)self showProfileInstallationAlertViewWithTitle:v12 message:v7 shouldGoBackToSenderURL:1];
    }
  }
  else
  {
    v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[HOHomePodProfileInstaller _showProfileInstallationFlow]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(%s) popped profile data is nil", buf, 0xCu);
    }

    v10 = sub_100050114(@"HOProfileDataNotFoundDisplayTitle");
    v11 = sub_100050114(@"HOProfileDataNotFoundDisplayMessage");
    [(HOProfileInstaller *)self showProfileInstallationAlertViewWithTitle:v10 message:v11 shouldGoBackToSenderURL:1];
  }
}

- (void)installProfileWithCompletionHandler:(id)a3
{
  [(HOProfileInstaller *)self setInstallProfileVCCompletionBlock:a3];

  [(HOHomePodProfileInstaller *)self _startProfileInstallation];
}

- (void)deviceProfileCompletedNotification:(id)a3
{
  v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"errorCode"];

  id v6 = [v5 integerValue];
  id v7 = [v5 integerValue];
  v8 = [(HOProfileInstaller *)self installProfileVCCompletionBlock];

  if (v8)
  {
    v9 = [(HOProfileInstaller *)self installProfileVCCompletionBlock];
    v9[2](v9, 0);
  }
  if (v6)
  {
    v10 = HFLogForCategory();
    v11 = v10;
    if (v7 == (id)-6723)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[HOHomePodProfileInstaller deviceProfileCompletedNotification:]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(%s) profile installation canceled", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      sub_100083EDC(v11);
    }

    [(HOProfileInstaller *)self dismissInstallProfileViewControllerWithAnimation:1 shouldOpenSenderURL:1];
  }
  else
  {
    [(HOProfileInstaller *)self setInstallProfileVCCompletionBlock:0];
    id v12 = [(HOProfileInstaller *)self profileData];
    id v18 = 0;
    v13 = +[MCProfile profileWithData:v12 outError:&v18];
    id v14 = v18;

    if ([v13 needsReboot])
    {
      v15 = sub_100050114(@"HOProfileInstallHomePodRebootTitle");
      v16 = sub_100050114(@"HOProfileInstallHomePodRebootMessage");
      [(HOProfileInstaller *)self showProfileInstallationAlertViewWithTitle:v15 message:v16 shouldGoBackToSenderURL:0];
    }
    else if (v14)
    {
      v17 = HFLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100083E60();
      }
    }
    else
    {
      [(HOProfileInstaller *)self openSenderURL];
    }
  }
}

- (void)_startProfileInstallation
{
  v3 = +[HFHomeKitDispatcher sharedDispatcher];
  v4 = [v3 allHomesFuture];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100050658;
  v6[3] = &unk_1000C2070;
  v6[4] = self;
  id v5 = [v4 addCompletionBlock:v6];
}

- (void)_handleProfileInstallationForHome:(id)a3
{
  id v5 = a3;
  if (objc_msgSend(v5, "hf_allHomePodsSupportRemoteProfileInstallation"))
  {
    v4 = [v5 hf_homePods];
    [(HOHomePodProfileInstaller *)self _presentHomePodSelectionAlertWithHomePods:v4];
  }
  else
  {
    [(HOHomePodProfileInstaller *)self _presentManagedConfigurationProfileInstallation];
  }
}

- (void)_installProfileForHomePod:(id)a3
{
  id v4 = a3;
  id v5 = [(HOProfileInstaller *)self profileData];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100050884;
  v7[3] = &unk_1000C3B90;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v6 installManagedConfigurationProfileWithData:v5 completionHandler:v7];
}

- (void)_installProfileForHomePods:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100050B44;
  v7[3] = &unk_1000C4318;
  void v7[4] = self;
  id v8 = (id)objc_opt_new();
  id v9 = v4;
  id v5 = v4;
  id v6 = v8;
  [v5 na_each:v7];
}

- (void)_presentManagedConfigurationProfileInstallation
{
  objc_initWeak(&location, self);
  v3 = objc_opt_new();
  CFStringRef v9 = @"profileData";
  id v4 = [(HOProfileInstaller *)self profileData];
  v10 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100051028;
  v6[3] = &unk_1000C4340;
  objc_copyWeak(&v7, &location);
  [v3 showDevicePickerWithInfo:v5 completion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_presentHomeSelectionAlertWithHomes:(id)a3
{
  id v4 = a3;
  id v5 = sub_100050114(@"HOProfileInstallChooseHomeTitle");
  id v6 = +[UIAlertController alertControllerWithTitle:v5 message:0 preferredStyle:1];

  id v7 = [v4 sortedArrayUsingComparator:&stru_1000C4380];

  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_10005129C;
  id v14 = &unk_1000C29D0;
  v15 = self;
  id v16 = v6;
  id v8 = v6;
  [v7 na_each:&v11];
  CFStringRef v9 = [(HOHomePodProfileInstaller *)self _cancelAction];
  [v8 addAction:v9];

  v10 = [(HOProfileInstaller *)self installProfileViewController];
  [v10 presentViewController:v8 animated:1 completion:0];
}

- (void)_presentHomePodSelectionAlertWithHomePods:(id)a3
{
  id v4 = a3;
  id v5 = sub_100050114(@"HOProfileInstallChooseHomePodTitle");
  id v6 = sub_100050114(@"HOProfileInstallChooseHomePodMessage");
  id v7 = +[UIAlertController alertControllerWithTitle:v5 message:v6 preferredStyle:1];
  id v8 = sub_100050114(@"HOProfileInstallAlertAllButton");
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10005158C;
  v21[3] = &unk_1000C3B68;
  v21[4] = self;
  id v22 = v4;
  id v9 = v4;
  v10 = +[UIAlertAction actionWithTitle:v8 style:0 handler:v21];

  [v7 addAction:v10];
  v11 = [v9 sortedArrayUsingComparator:&stru_1000C43A0];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_100051608;
  id v18 = &unk_1000C43C8;
  v19 = self;
  id v20 = v7;
  id v12 = v7;
  [v11 na_each:&v15];
  v13 = [(HOHomePodProfileInstaller *)self _cancelAction];
  [v12 addAction:v13];

  id v14 = [(HOProfileInstaller *)self installProfileViewController];
  [v14 presentViewController:v12 animated:1 completion:0];
}

- (void)_presentCompletionAlert
{
  v3 = sub_100050114(@"HOProfileInstallCompletedTitle");
  id v4 = +[UIAlertController alertControllerWithTitle:v3 message:0 preferredStyle:1];

  id v5 = sub_100050114(@"HOProfileInstallAlertOKButton");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100051818;
  v8[3] = &unk_1000C23E8;
  v8[4] = self;
  id v6 = +[UIAlertAction actionWithTitle:v5 style:0 handler:v8];
  [v4 addAction:v6];

  id v7 = [(HOProfileInstaller *)self installProfileViewController];
  [v7 presentViewController:v4 animated:1 completion:0];
}

- (void)_presentErrorAlert
{
  v3 = sub_100050114(@"HOProfileHomePodSearchFailedTitle");
  id v4 = sub_100050114(@"HOProfileHomePodSearchFailedMessage");
  id v5 = +[UIAlertController alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  id v6 = sub_100050114(@"HOProfileInstallAlertOKButton");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100051968;
  v9[3] = &unk_1000C23E8;
  v9[4] = self;
  id v7 = +[UIAlertAction actionWithTitle:v6 style:0 handler:v9];
  [v5 addAction:v7];

  id v8 = [(HOProfileInstaller *)self installProfileViewController];
  [v8 presentViewController:v5 animated:1 completion:0];
}

- (void)_presentPartialErrorAlertForHomePods:(id)a3
{
  id v4 = a3;
  id v5 = sub_100050114(@"HOProfileHomePodsInstallFailedMessage");
  id v20 = 0;
  id v6 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, @"%lu", &v20, [v4 count]);
  id v7 = v20;
  if ([v4 count] == (id)1)
  {
    id v8 = sub_100050114(@"HOProfileHomePodInstallFailedMessage");
    id v19 = v7;
    id v9 = [v4 firstObject];
    v10 = [v9 hf_displayName];
    uint64_t v11 = +[NSString stringWithValidatedFormat:v8, @"%@", &v19, v10 validFormatSpecifiers error];
    id v12 = v19;

    id v6 = (void *)v11;
    id v7 = v12;
  }
  v13 = sub_100050114(@"HOProfileInstallCompletedTitle");
  id v14 = +[UIAlertController alertControllerWithTitle:v13 message:v6 preferredStyle:1];

  v15 = sub_100050114(@"HOProfileInstallAlertOKButton");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100051BBC;
  v18[3] = &unk_1000C23E8;
  v18[4] = self;
  uint64_t v16 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v18];
  [v14 addAction:v16];

  v17 = [(HOProfileInstaller *)self installProfileViewController];
  [v17 presentViewController:v14 animated:1 completion:0];
}

- (id)_cancelAction
{
  v3 = sub_100050114(@"HOProfileInstallAlertCancelButton");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100051C94;
  v6[3] = &unk_1000C23E8;
  void v6[4] = self;
  id v4 = +[UIAlertAction actionWithTitle:v3 style:1 handler:v6];

  return v4;
}

@end