@interface AppLaunchNotifcationPrewarmAlert
- (void)_alertDidFinishProcessing;
- (void)_presentAlertUIWithStatus:(int64_t)a3 repeatPrompt:(BOOL)a4;
- (void)displayAlertIfNecessaryWithCompletionHandler:(id)a3;
@end

@implementation AppLaunchNotifcationPrewarmAlert

- (void)displayAlertIfNecessaryWithCompletionHandler:(id)a3
{
  id v4 = [a3 copy];
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v4;

  if (!qword_10160F160)
  {
    v6 = +[UNUserNotificationCenter currentNotificationCenter];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10057F178;
    v7[3] = &unk_1012EDF48;
    v7[4] = self;
    [v6 getNotificationSettingsWithCompletionHandler:v7];
  }
}

- (void)_presentAlertUIWithStatus:(int64_t)a3 repeatPrompt:(BOOL)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10057F4C8;
  v8[3] = &unk_1012E5D08;
  v8[4] = self;
  id v4 = [[PushNotificationPrompt alloc] initWithReason:a4 authorizationStatus:a3 completion:v8];
  v5 = (void *)qword_10160F160;
  qword_10160F160 = (uint64_t)v4;

  v6 = +[UIApplication sharedMapsDelegate];
  v7 = [v6 chromeViewController];
  [v7 _maps_topMostPresentViewController:qword_10160F160 animated:1 completion:0];
}

- (void)_alertDidFinishProcessing
{
  id completionBlock = self->_completionBlock;
  if (completionBlock)
  {
    v5 = (void (**)(void))objc_retainBlock(completionBlock);
    id v4 = self->_completionBlock;
    self->_id completionBlock = 0;

    v5[2]();
  }
}

- (void).cxx_destruct
{
}

@end