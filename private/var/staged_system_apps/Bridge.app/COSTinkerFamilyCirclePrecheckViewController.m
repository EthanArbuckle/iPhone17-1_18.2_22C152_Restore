@interface COSTinkerFamilyCirclePrecheckViewController
- (BOOL)controllerAllowsNavigatingBackTo;
- (BOOL)holdBeforeDisplaying;
- (BOOL)holdWithWaitScreen;
- (COSBuddyControllerDelegate)delegate;
- (FACircleStateController)circleStateController;
- (double)waitScreenPushGracePeriod;
- (id)holdActivityIdentifier;
- (id)localizedWaitScreenDescription;
- (void)_fetchFamilyCircle;
- (void)didPushWaitScreen;
- (void)failPrecheckWithTitle:(id)a3 body:(id)a4 withPresentingController:(id)a5;
- (void)handleRepairFailureWithError:(id)a3;
- (void)setCircleStateController:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation COSTinkerFamilyCirclePrecheckViewController

- (BOOL)holdBeforeDisplaying
{
  return 1;
}

- (BOOL)holdWithWaitScreen
{
  return 1;
}

- (double)waitScreenPushGracePeriod
{
  return 0.0;
}

- (id)localizedWaitScreenDescription
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"FAMILY_CIRCLE_INIT_HOLD_DESCRIPTION" value:&stru_100249230 table:@"SetupFlowLocalizable-tinker"];

  return v3;
}

- (void)failPrecheckWithTitle:(id)a3 body:(id)a4 withPresentingController:(id)a5
{
  id v7 = a5;
  id v11 = +[UIAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Localizable"];
  v10 = +[UIAlertAction actionWithTitle:v9 style:0 handler:&stru_100247830];
  [v11 addAction:v10];

  [v7 presentViewController:v11 animated:1 completion:0];
}

- (void)handleRepairFailureWithError:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100115898;
  v5[3] = &unk_100243908;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)setDelegate:(id)a3
{
}

- (void)didPushWaitScreen
{
  id v3 = objc_alloc((Class)FACircleContext);
  id v4 = [v3 initWithEventType:FACircleEventTypeInitiate];
  [v4 setAdditionalParameters:&off_10025C550];
  v5 = pbb_accountsignin_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Performing FamilyCircle Pre-Check", (uint8_t *)buf, 2u);
  }

  id v6 = [UIApp setupController];
  id v7 = [v6 tinkerAuthenticationController];

  objc_initWeak(buf, self);
  v8 = +[UIApplication sharedApplication];
  v9 = [v8 bridgeController];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100115BC8;
  v12[3] = &unk_1002478A8;
  id v10 = v7;
  id v13 = v10;
  objc_copyWeak(&v15, buf);
  id v11 = v4;
  id v14 = v11;
  [v9 requestProxiedDeviceForWatchWithCompletion:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

- (void)_fetchFamilyCircle
{
  if (sub_100008380() && _os_feature_enabled_impl())
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001160E0;
    block[3] = &unk_1002438A0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    id v3 = objc_alloc_init((Class)FAFetchFamilyCircleRequest);
    [v3 setCachePolicy:2];
    id v4 = pbb_accountsignin_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FAFetchFamilyCircleRequest start", buf, 2u);
    }

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10011614C;
    v5[3] = &unk_1002478F8;
    void v5[4] = self;
    [v3 startRequestWithCompletionHandler:v5];
  }
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  return 0;
}

- (id)holdActivityIdentifier
{
  return @"FamilyInitCheck";
}

- (COSBuddyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSBuddyControllerDelegate *)WeakRetained;
}

- (FACircleStateController)circleStateController
{
  return self->_circleStateController;
}

- (void)setCircleStateController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleStateController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end