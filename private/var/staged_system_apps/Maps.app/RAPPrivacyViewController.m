@interface RAPPrivacyViewController
- (RAPPrivacyViewController)initWithUserEnteredEmailAddress:(id)a3;
- (void)_presentPrivacyController:(id)a3;
- (void)presentPrivacyScreen:(id)a3;
- (void)presentPrivacyScreenForShortcutType:(int64_t)a3 completion:(id)a4;
@end

@implementation RAPPrivacyViewController

- (RAPPrivacyViewController)initWithUserEnteredEmailAddress:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPPrivacyViewController;
  v6 = [(RAPPrivacyViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userEnteredEmailAddress, a3);
  }

  return v7;
}

- (void)presentPrivacyScreenForShortcutType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [[_RAPPrivacyInformationController alloc] initWithShortcutType:a3 completion:v6];
  objc_initWeak(&location, v7);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100CF71A8;
  v9[3] = &unk_1012F6748;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [(_RAPPrivacyInformationController *)v7 setCompletion:v9];
  [(RAPPrivacyViewController *)self _presentPrivacyController:v7];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)presentPrivacyScreen:(id)a3
{
  id v4 = a3;
  userEnteredEmailAddress = self->_userEnteredEmailAddress;
  if (userEnteredEmailAddress)
  {
    id v6 = userEnteredEmailAddress;
  }
  else
  {
    sub_100521AB8();
    id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  id v8 = objc_alloc_init(RAPReportComposerNavigationController);
  objc_super v9 = [[_RAPPrivacyInformationController alloc] initWithCompletion:v4 emailAddress:v7 isUserEnteredEmailAddress:userEnteredEmailAddress != 0];
  id v11 = v9;
  id v10 = +[NSArray arrayWithObjects:&v11 count:1];
  [(RAPReportComposerNavigationController *)v8 setViewControllers:v10];

  [(RAPPrivacyViewController *)self _presentPrivacyController:v8];
}

- (void)_presentPrivacyController:(id)a3
{
  id v13 = a3;
  v3 = +[UIApplication sharedApplication];
  id v4 = [v3 keyWindow];
  id v5 = [v4 rootViewController];

  id v6 = [v5 presentedViewController];

  if (v6)
  {
    do
    {
      v7 = [v5 presentedViewController];

      id v8 = [v7 presentedViewController];

      id v5 = v7;
    }
    while (v8);
  }
  else
  {
    v7 = v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && sub_1000BBB44(v7) == 5)
  {
    [v13 setModalPresentationStyle:2];
    [v13 setModalInPresentation:1];
    objc_super v9 = [v7 _maps_mapsSceneDelegate];
    id v10 = [v9 rapPresenter];
    [v10 presentViewController:v13 animated:1];
  }
  else if ([v7 isViewLoaded])
  {
    id v11 = [v7 view];
    v12 = [v11 window];

    if (v12)
    {
      [v13 setModalPresentationStyle:2];
      [v13 setModalInPresentation:1];
      [v7 presentViewController:v13 animated:1 completion:0];
    }
  }
}

- (void).cxx_destruct
{
}

@end