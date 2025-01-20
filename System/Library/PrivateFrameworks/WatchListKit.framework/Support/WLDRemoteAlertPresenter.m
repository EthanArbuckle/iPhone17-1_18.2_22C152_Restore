@interface WLDRemoteAlertPresenter
+ (BOOL)isPresenting;
+ (BOOL)isUnlocked;
- (BOOL)_isPad;
- (BOOL)promptForBundleID:(id)a3;
- (WLDRemoteAlertPresenter)init;
@end

@implementation WLDRemoteAlertPresenter

- (WLDRemoteAlertPresenter)init
{
  v3.receiver = self;
  v3.super_class = (Class)WLDRemoteAlertPresenter;
  return [(WLDRemoteAlertPresenter *)&v3 init];
}

+ (BOOL)isPresenting
{
  return SBSUIIsNamedRemoteAlertCurrentlyActive() != 0;
}

+ (BOOL)isUnlocked
{
  uint64_t v2 = MKBGetDeviceLockState();
  int v3 = v2;
  NSLog(@"WLDRemoteAlertPresenter: MKBGetDeviceLockState returned: %d", v2);
  return !v3 || v3 == 3;
}

- (BOOL)promptForBundleID:(id)a3
{
  id v4 = a3;
  if (([(id)objc_opt_class() isUnlocked] & 1) == 0)
  {
    NSLog(@"WLDRemoteAlertPresenter: security does not allow prompting");
    goto LABEL_5;
  }
  if ([(id)objc_opt_class() isPresenting])
  {
    NSLog(@"WLDRemoteAlertPresenter: already prompting");
LABEL_5:
    BOOL v5 = 0;
    goto LABEL_9;
  }
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  NSLog(@"WLDRemoteAlertPresenter: promptForBundleID: %@", v4);
  uint64_t v7 = [(WLDRemoteAlertPresenter *)self _isPad];
  v8 = +[ACAccountStore ams_sharedAccountStore];
  v9 = objc_msgSend(v8, "ams_activeiTunesAccount");
  v10 = [v9 username];

  v25[0] = v10;
  v24[0] = WLKViewServiceAccountNameKey;
  v24[1] = WLKViewServiceAppBundlesKey;
  id v23 = v4;
  v11 = +[NSArray arrayWithObjects:&v23 count:1];
  v25[1] = v11;
  v12 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

  v22[0] = @"TVAccessViewServiceViewController";
  v21[0] = SBSUIRemoteAlertOptionViewControllerClass;
  v21[1] = SBSUIRemoteAlertOptionStatusBarStyle;
  v13 = +[NSNumber numberWithInteger:v7];
  v21[2] = SBSUIRemoteAlertOptionUserInfo;
  v22[1] = v13;
  v22[2] = v12;
  v14 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __45__WLDRemoteAlertPresenter_promptForBundleID___block_invoke;
  v19[3] = &unk_100045CD8;
  v15 = v6;
  v20 = v15;
  v16 = objc_retainBlock(v19);
  int v17 = SBSUIActivateRemoteAlertWithLifecycleNotifications();
  BOOL v5 = v17 != 0;
  if (v17) {
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  }

LABEL_9:
  return v5;
}

intptr_t __45__WLDRemoteAlertPresenter_promptForBundleID___block_invoke(uint64_t a1)
{
  NSLog(@"WLDRemoteAlertPresenter deactivated");
  uint64_t v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

- (BOOL)_isPad
{
  uint64_t v2 = (const void *)MGCopyAnswer();
  if (!v2) {
    return 0;
  }
  int v3 = v2;
  CFTypeID v4 = CFGetTypeID(v2);
  BOOL v5 = v4 == CFStringGetTypeID() && CFEqual(v3, @"iPad") != 0;
  CFRelease(v3);
  return v5;
}

@end