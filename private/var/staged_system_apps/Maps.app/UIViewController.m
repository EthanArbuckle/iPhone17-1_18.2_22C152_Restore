@interface UIViewController
+ (id)_maps_viewControllerForRenamingMapItem:(id)a3 saveHandler:(id)a4 cancelHandler:(id)a5;
- (MapsTheme)theme;
- (UIViewController)topMostPresentedViewController;
- (id)_maps_carSceneDelegate;
- (id)_maps_mapsSceneDelegate;
- (id)_maps_platformController;
- (id)_maps_uiScene;
- (id)carSceneDelegateForViewController:(id)a3;
- (id)mapsSceneDelegateForViewController:(id)a3;
- (void)_createAndPresentAlertControllerWithTitle:(id)a3 descriptionText:(id)a4 cancelString:(id)a5 cancelHandler:(id)a6;
- (void)_maps_presentSimpleAlertWithTitle:(id)a3 message:(id)a4 dismissalActionTitle:(id)a5;
- (void)_maps_presentSimpleAlertWithTitle:(id)a3 message:(id)a4 dismissalActionTitle:(id)a5 dismissalHandler:(id)a6;
- (void)_maps_topMostPresentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_presentInternalInstallRadarPromptAlertForUserInfo:(id)a3 response:(id)a4;
- (void)presentLoginFailureAlertWithCancelHandler:(id)a3;
- (void)presentLookupFailureAlertWithCancelHandler:(id)a3;
- (void)presentSavedReportTooNewAlertWithCancelHandler:(id)a3;
- (void)presentSubmissionFailureAlertForResponse:(id)a3 withCancelHandler:(id)a4;
@end

@implementation UIViewController

- (void)_maps_topMostPresentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(UIViewController *)self topMostPresentedViewController];
  [v10 presentViewController:v9 animated:v5 completion:v8];
}

- (UIViewController)topMostPresentedViewController
{
  v2 = self;
  v3 = [(UIViewController *)v2 presentedViewController];

  if (v3)
  {
    do
    {
      v4 = [(UIViewController *)v2 presentedViewController];

      BOOL v5 = [(UIViewController *)v4 presentedViewController];

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    v4 = v2;
  }

  return v4;
}

- (id)_maps_uiScene
{
  v2 = [(UIViewController *)self view];
  v3 = [v2 window];
  v4 = [v3 windowScene];

  return v4;
}

- (id)mapsSceneDelegateForViewController:(id)a3
{
  v3 = [a3 view];
  v4 = [v3 _maps_mapsSceneDelegate];

  return v4;
}

- (MapsTheme)theme
{
  v3 = [(UIViewController *)self traitCollection];
  id v4 = [v3 userInterfaceStyle];

  if (v4)
  {
    BOOL v5 = [(UIViewController *)self traitCollection];
    BOOL v6 = [v5 userInterfaceStyle] != (id)1;

    v7 = +[MapsTheme sharedTheme];
    [v7 setMapsThemeStyle:v6];
  }

  return (MapsTheme *)+[MapsTheme sharedTheme];
}

- (id)_maps_mapsSceneDelegate
{
  return [(UIViewController *)self mapsSceneDelegateForViewController:self];
}

- (void)_maps_presentSimpleAlertWithTitle:(id)a3 message:(id)a4 dismissalActionTitle:(id)a5 dismissalHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v14 = +[UIAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  v12 = [v14 view];
  [v12 setAccessibilityIdentifier:@"SimpleAlert"];

  v13 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v10];

  [v13 setAccessibilityIdentifier:@"AlertAction"];
  [v14 addAction:v13];
  [(UIViewController *)self _maps_topMostPresentViewController:v14 animated:1 completion:0];
}

- (void)_maps_presentSimpleAlertWithTitle:(id)a3 message:(id)a4 dismissalActionTitle:(id)a5
{
}

- (id)_maps_carSceneDelegate
{
  return [(UIViewController *)self carSceneDelegateForViewController:self];
}

- (id)carSceneDelegateForViewController:(id)a3
{
  v3 = [a3 view];
  id v4 = [v3 _maps_carSceneDelegate];

  return v4;
}

- (id)_maps_platformController
{
  v2 = [(UIViewController *)self _maps_mapsSceneDelegate];
  v3 = [v2 platformController];

  return v3;
}

+ (id)_maps_viewControllerForRenamingMapItem:(id)a3 saveHandler:(id)a4 cancelHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[UIDevice currentDevice];
  id v11 = [v10 userInterfaceIdiom];

  if (v11 == (id)5)
  {
    v12 = [[MacCollectionRenameViewController alloc] initWithMapItem:v7 saveHandler:v8 cancelHandler:v9];
    [(MacCollectionRenameViewController *)v12 setModalPresentationStyle:2];
  }
  else
  {
    v13 = +[NSBundle mainBundle];
    v24 = [v13 localizedStringForKey:@"Name_this_Location" value:@"localized string not found" table:0];

    v12 = +[UIAlertController alertControllerWithTitle:v24 message:0 preferredStyle:1];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1009259D8;
    v30[3] = &unk_1013022D8;
    id v31 = v7;
    [(MacCollectionRenameViewController *)v12 addTextFieldWithConfigurationHandler:v30];
    id v14 = [(MacCollectionRenameViewController *)v12 textFields];
    v15 = [v14 firstObject];

    v16 = +[NSBundle mainBundle];
    v17 = [v16 localizedStringForKey:@"Cancel_Editing_Name_Favorites" value:@"localized string not found" table:0];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100925A50;
    v28[3] = &unk_1012E6E08;
    id v29 = v9;
    v18 = +[UIAlertAction actionWithTitle:v17 style:1 handler:v28];

    v19 = +[NSBundle mainBundle];
    v20 = [v19 localizedStringForKey:@"Save_Editing_Name_Favorites" value:@"localized string not found" table:0];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100925A68;
    v25[3] = &unk_1012E8D68;
    id v26 = v15;
    id v27 = v8;
    id v21 = v15;
    v22 = +[UIAlertAction actionWithTitle:v20 style:0 handler:v25];

    [(MacCollectionRenameViewController *)v12 addAction:v18];
    [(MacCollectionRenameViewController *)v12 addAction:v22];
    [(MacCollectionRenameViewController *)v12 setPreferredAction:v22];
  }

  return v12;
}

- (void)presentSubmissionFailureAlertForResponse:(id)a3 withCancelHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[UGCErrorStringBuilder buildFailToSubmitErrorTitle];
  id v9 = +[UGCErrorStringBuilder buildFailToSubmitErrorDescription];
  id v10 = +[NSBundle mainBundle];
  id v11 = [v10 localizedStringForKey:@"OK [UGC]" value:@"localized string not found" table:0];

  uint64_t v16 = 0;
  v12 = +[UGCCredentialsBuilder buildICloudUserCredentialsWithError:&v16];
  uint64_t v13 = v16;
  id v14 = +[MKSystemController sharedInstance];
  unsigned int v15 = [v14 isInternalInstall];

  if (v15 && v13) {
    [(UIViewController *)self _presentInternalInstallRadarPromptAlertForUserInfo:v12 response:v6];
  }
  else {
    [(UIViewController *)self _createAndPresentAlertControllerWithTitle:v8 descriptionText:v9 cancelString:v11 cancelHandler:v7];
  }
}

- (void)presentSavedReportTooNewAlertWithCancelHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSBundle mainBundle];
  id v12 = [v5 localizedStringForKey:@"Error Saved Report Too New - iOS [UGC]" value:@"localized string not found" table:0];

  if (sub_1000BBB44(self) == 1)
  {
    id v6 = +[NSBundle mainBundle];
    id v7 = v6;
    CFStringRef v8 = @"Error Saved Report Too New - iPadOS [UGC]";
  }
  else
  {
    if (sub_1000BBB44(self) != 5) {
      goto LABEL_6;
    }
    id v6 = +[NSBundle mainBundle];
    id v7 = v6;
    CFStringRef v8 = @"Error Saved Report Too New - macOS [UGC]";
  }
  uint64_t v9 = [v6 localizedStringForKey:v8 value:@"localized string not found" table:0];

  id v12 = (id)v9;
LABEL_6:
  id v10 = +[NSBundle mainBundle];
  id v11 = [v10 localizedStringForKey:@"OK [UGC]" value:@"localized string not found" table:0];

  [(UIViewController *)self _createAndPresentAlertControllerWithTitle:0 descriptionText:v12 cancelString:v11 cancelHandler:v4];
}

- (void)presentLookupFailureAlertWithCancelHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSBundle mainBundle];
  id v9 = [v5 localizedStringForKey:@"Error Fetching Submission [UGC]" value:@"localized string not found" table:0];

  id v6 = +[UGCErrorStringBuilder buildBestErrorStringForCurrentNetworkState];
  id v7 = +[NSBundle mainBundle];
  CFStringRef v8 = [v7 localizedStringForKey:@"OK [UGC]" value:@"localized string not found" table:0];

  [(UIViewController *)self _createAndPresentAlertControllerWithTitle:v9 descriptionText:v6 cancelString:v8 cancelHandler:v4];
}

- (void)presentLoginFailureAlertWithCancelHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSBundle mainBundle];
  id v10 = [v5 localizedStringForKey:@"Error Signing In [UGC]" value:@"localized string not found" table:0];

  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"Error Signing In Description [UGC]" value:@"localized string not found" table:0];

  CFStringRef v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"OK [UGC]" value:@"localized string not found" table:0];

  [(UIViewController *)self _createAndPresentAlertControllerWithTitle:v10 descriptionText:v7 cancelString:v9 cancelHandler:v4];
}

- (void)_createAndPresentAlertControllerWithTitle:(id)a3 descriptionText:(id)a4 cancelString:(id)a5 cancelHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = +[UIAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100AF5CC4;
  v15[3] = &unk_1012E6E08;
  id v16 = v10;
  id v13 = v10;
  id v14 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v15];

  [v12 addAction:v14];
  [(UIViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)_presentInternalInstallRadarPromptAlertForUserInfo:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = +[MKSystemController sharedInstance];
  unsigned int v9 = [v8 isInternalInstall];

  if (v9)
  {
    id v10 = objc_opt_new();
    [v10 setTitle:@"[ARP] Submission failure"];
    id v11 = [v6 userCredentials];
    id v12 = [v11 icloudUserPersonId];
    id v13 = [v6 userCredentials];
    id v14 = [v13 icloudUserMapsAuthToken];
    unsigned int v15 = +[NSString stringWithFormat:@"DSID: %@\nMaps auth token: %@\nResponse: %@", v12, v14, v7];
    [v10 setDescriptionText:v15];

    [v10 setClassification:6];
    id v16 = +[MapsRadarComponent mapsAppCoreUIComponent];
    [v10 setComponent:v16];

    v17 = sub_100109EF8();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = [v10 descriptionText];
      *(_DWORD *)buf = 138412290;
      id v21 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Presenting internal alert to file a radar: %@", buf, 0xCu);
    }
    v19 = +[MapsRadarController sharedInstance];
    [v19 launchTTRWithRadar:v10 promptTitle:@"ratings and photos failed to submit" fromViewController:self];
  }
}

@end