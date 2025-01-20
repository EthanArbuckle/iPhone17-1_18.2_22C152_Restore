@interface BKApplication
+ (BOOL)isRunningInStoreDemoMode;
+ (int64_t)intValueForProcessArgument:(id)a3;
- (BOOL)isConnectedToInternet;
- (BOOL)isRunningInStoreDemoMode;
- (BOOL)runTest:(id)a3 options:(id)a4;
- (id)_accessibilitySpeakThisPreferredHighlightColor;
- (id)_accessibilitySpeakThisPreferredUnderlineColor;
- (id)_mainViewControllerForTransaction:(id)a3;
- (id)clientApplicationController;
- (id)osBuildVersion;
- (void)_accessibilitySetUpQuickSpeak;
- (void)_loadWebKitOverrides;
- (void)accessibilityInitialize;
- (void)prepareForDefaultImageSnapshotForScreen:(id)a3;
- (void)presentViewController:(id)a3 transaction:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)presentViewControllerOverMainCanvas:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation BKApplication

- (id)osBuildVersion
{
  if (![(NSString *)self->_osBuildVersion length])
  {
    v3 = +[UIDevice currentDevice];
    v4 = [v3 buildVersion];
    osBuildVersion = self->_osBuildVersion;
    self->_osBuildVersion = v4;
  }
  v6 = self->_osBuildVersion;

  return v6;
}

+ (BOOL)isRunningInStoreDemoMode
{
  return +[UIApplication isRunningInStoreDemoMode];
}

- (BOOL)isRunningInStoreDemoMode
{
  return +[BKApplication isRunningInStoreDemoMode];
}

+ (int64_t)intValueForProcessArgument:(id)a3
{
  id v3 = a3;
  v4 = +[NSProcessInfo processInfo];
  v5 = [v4 arguments];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  v7 = (char *)[v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    uint64_t v10 = *(void *)v18;
LABEL_3:
    uint64_t v11 = 0;
    v12 = &v8[(void)v9];
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v6);
      }
      if (objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v11), "isEqualToString:", v3, (void)v17)) {
        break;
      }
      if (v8 == (char *)++v11)
      {
        v8 = (char *)[v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        v9 = v12;
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    if (&v9[v11] >= (char *)[v6 count] - 1)
    {
      int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_16;
    }
    v15 = [v6 objectAtIndex:&v9[v11 + 1]];
    v14 = v15;
    if (v15) {
      int64_t v13 = (int)[v15 intValue];
    }
    else {
      int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
LABEL_9:
    int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    v14 = v6;
  }

LABEL_16:
  return v13;
}

- (void)presentViewController:(id)a3 transaction:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = +[BKAppDelegate sceneManager];
  id v13 = [v12 defaultSceneControllerForTransaction:v10];

  [v13 presentViewController:v11 animated:v6 completion:v9];
}

- (void)presentViewControllerOverMainCanvas:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = +[BKAppDelegate sceneManager];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000B6728;
  v12[3] = &unk_100A44F40;
  BOOL v15 = a4;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 requestPrimaryScene:v12];
}

- (id)_mainViewControllerForTransaction:(id)a3
{
  id v3 = a3;
  v4 = +[BKAppDelegate sceneManager];
  v5 = [v4 defaultSceneControllerForTransaction:v3];

  BOOL v6 = [v5 _mainViewControllerForModalPresenting];

  return v6;
}

- (id)clientApplicationController
{
  objc_opt_class();
  v2 = BCGetUnsafeAppDelegateReference();
  id v3 = BUDynamicCast();

  v4 = [v3 storeController];

  return v4;
}

- (BOOL)isConnectedToInternet
{
  v2 = [(BKApplication *)self delegate];
  unsigned __int8 v3 = [v2 isConnectedToInternet];

  return v3;
}

- (void)prepareForDefaultImageSnapshotForScreen:(id)a3
{
  id v4 = a3;
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"BKApplicationWillTakeSnapshot" object:self];

  v7.receiver = self;
  v7.super_class = (Class)BKApplication;
  [(BKApplication *)&v7 prepareForDefaultImageSnapshotForScreen:v4];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B694C;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[AETestDriver prewarm];
  +[BKTestDriver prewarm];
  +[BKTestDriverDispatcher prewarm];
  id v8 = +[PPTRunner shared];
  id v9 = +[AETestDriver shared];
  [v9 setTestStateProvider:v8];

  id v10 = +[PPTRunner shared];
  uint64_t v11 = +[BETestDriver shared];
  [(id)v11 setTestStateProvider:v10];

  v12 = +[PPTRunner shared];
  LOBYTE(v11) = [v12 runTestWithName:v6 options:v7];

  if (v11)
  {
    BOOL v13 = 1;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)BKApplication;
    BOOL v13 = [(BKApplication *)&v15 runTest:v6 options:v7];
  }

  return v13;
}

- (void).cxx_destruct
{
}

- (void)accessibilityInitialize
{
  unsigned __int8 v3 = +[IMCommonCoreAccessibility sharedInstance];
  [v3 loadAccessibilitySupport];

  IMAccessibilityInitialize();
  AEAccessibilityInitialize();
  qword_100B754D8 = 0x1000000000000;
  qword_100B754E0 = 0x400000000000;
  dword_100B754E8 = 1007;
  if (CFPreferencesGetAppBooleanValue(@"ReportValidationErrors", @"com.apple.Accessibility", 0))
  {
    __IMAccessibilityValidateClass();
    __IMAccessibilityValidateIsKindOfClass();
    __IMAccessibilityValidateIsKindOfClass();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateIvar();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateClassMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateProtocolMethod();
    __IMAccessibilityValidateProtocolMethod();
    __IMAccessibilityValidateIsKindOfClass();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateIsKindOfClass();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateIvarType();
    __IMAccessibilityValidateIvarType();
    __IMAccessibilityValidateIvarType();
    __IMAccessibilityValidateIvarType();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateIsKindOfClass();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateIsKindOfClass();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateIsKindOfClass();
    __IMAccessibilityValidateIsKindOfClass();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateIsKindOfClass();
    __IMAccessibilityValidateIsKindOfClass();
    __IMAccessibilityValidateIsKindOfClass();
    __IMAccessibilityValidateIvarType();
    __IMAccessibilityValidateIvarType();
    __IMAccessibilityValidateIvar();
    __IMAccessibilityValidateIvar();
    __IMAccessibilityValidateIvar();
    __IMAccessibilityValidateIvar();
    __IMAccessibilityValidateIvar();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateProtocolMethod();
    __IMAccessibilityValidateProtocolMethod();
    __IMAccessibilityValidateProtocolMethod();
    __IMAccessibilityValidateProtocolMethod();
    __IMAccessibilityValidateIvarType();
    __IMAccessibilityValidateIvarType();
    __IMAccessibilityValidateIvar();
    __IMAccessibilityValidateIvar();
    __IMAccessibilityValidateIvar();
    __IMAccessibilityValidateIvar();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateIvar();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateIvarType();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateInstanceMethod();
    __IMAccessibilityValidateIsKindOfClass();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
    __IMAccessibilityValidateInstanceMethodComplete();
  }
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  IMAccessibilityInstallSafeCategory();
  id v4 = [NSClassFromString(@"THAccessibility") imaxValueForKey:@"sharedInstance"];
  id v5 = [v4 imaxValueForKey:@"loadAccessibilitySupport"];

  [(BKApplication *)self _loadWebKitOverrides];
}

- (void)_loadWebKitOverrides
{
  dispatch_time_t v2 = dispatch_time(0, 6000000000);

  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, &stru_100A44F60);
}

- (void)_accessibilitySetUpQuickSpeak
{
  v2.receiver = self;
  v2.super_class = (Class)BKApplication;
  [(BKApplication *)&v2 _accessibilitySetUpQuickSpeak];
  +[THAccessibility2 loadQuickSpeakSupport];
}

- (id)_accessibilitySpeakThisPreferredHighlightColor
{
  objc_super v2 = +[IMCommonCoreAccessibility sharedInstance];
  unsigned __int8 v3 = [v2 preferredSpeakScreenHighlightColor];

  return v3;
}

- (id)_accessibilitySpeakThisPreferredUnderlineColor
{
  objc_super v2 = +[IMCommonCoreAccessibility sharedInstance];
  unsigned __int8 v3 = [v2 preferredSpeakScreenUnderlineColor];

  return v3;
}

@end