@interface PhoneApplication
+ (id)sharedNumberFormatter;
- (BOOL)_activeFaceTimeCallExists;
- (BOOL)_faceTimeInvitationExists;
- (BOOL)activeFaceTimeCallExists;
- (BOOL)alwaysShowLocalVideo;
- (BOOL)application:(id)a3 willContinueUserActivityWithType:(id)a4;
- (BOOL)applicationSuspendWithSettings:(id)a3;
- (BOOL)audioButtonAllowsPhoneCallsAndFaceTimeAudio;
- (BOOL)badgesMissedFaceTimeAudio;
- (BOOL)badgesMissedFaceTimeVideo;
- (BOOL)badgesMissedTelephonyCalls;
- (BOOL)contentViewAnimationsFadeInsteadOfMove;
- (BOOL)contentViewCanRotate;
- (BOOL)defaultActionIsFaceTimeAudio;
- (BOOL)defaultActionIsFaceTimeVideo;
- (BOOL)dialVoicemail;
- (BOOL)dialVoicemailWithAccountID:(id)a3;
- (BOOL)faceTimeAudioIsAvailable;
- (BOOL)faceTimeInvitationExists;
- (BOOL)faceTimeVideoIsAvailable;
- (BOOL)hasEnhancedVoicemail;
- (BOOL)headerViewShowsAllRecentCalls;
- (BOOL)inCall;
- (BOOL)inFaceTime;
- (BOOL)isDeviceCapableOfFaceTimeAudio;
- (BOOL)isDeviceCapableOfFaceTimeVideo;
- (BOOL)isDeviceCapableOfTelephonyCalls;
- (BOOL)isLowGraphicsPerformanceDevice;
- (BOOL)openURL:(id)a3;
- (BOOL)resumingApplication;
- (BOOL)shouldSnapshot;
- (BOOL)shouldUseCompactHorizontalLayout;
- (BOOL)showSplashScreenOnSignin;
- (BOOL)showsCallsFromService:(int)a3;
- (BOOL)showsFaceTimeAudio;
- (BOOL)showsFaceTimeAudioFavorites;
- (BOOL)showsFaceTimeAudioRecents;
- (BOOL)showsFaceTimeVideo;
- (BOOL)showsFaceTimeVideoFavorites;
- (BOOL)showsFaceTimeVideoRecents;
- (BOOL)showsPhoneDialer;
- (BOOL)showsPhoneVoicemail;
- (BOOL)showsTelephonyCalls;
- (BOOL)showsTelephonyFavorites;
- (BOOL)showsTelephonyRecents;
- (BOOL)showsThirdPartyRecents;
- (BOOL)suspendingApplication;
- (BOOL)tabBarCanSlide;
- (BOOL)tabBarFillsScreen;
- (BOOL)telephonyCallingIsAvailable;
- (BOOL)usesBlendModes;
- (BOOL)usesUnifiedInterface;
- (CGRect)phoneViewTabBarContentFrame;
- (PHRecentsController)recentsController;
- (PhoneApplication)init;
- (PhoneRootViewController)rootViewController;
- (TUFeatureFlags)featureFlags;
- (UIColor)applicationTintColor;
- (double)launchTime;
- (id)callHistoryController;
- (id)callHistoryControllerWithCoalescingStrategy:(unint64_t)a3;
- (id)nameOfDefaultImageToUpdateAtSuspension;
- (id)swiftui_rootViewForSimplifiedApplicationProvider;
- (int)defaultAction;
- (int)userInterfaceScreenType;
- (int64_t)backdropStyle;
- (int64_t)headerViewNumberOfCallsToShow;
- (unint64_t)callHistoryControllerOptions;
- (unsigned)contentViewOffscreenEdge;
- (unsigned)userInterfaceStyle;
- (void)_localeChangedNotification:(id)a3;
- (void)_resetCurrentViewController;
- (void)applicationDidFinishLaunching:(id)a3;
- (void)applicationOpenURL:(id)a3;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)handleApplicationFinishedSnapshottingNotification:(id)a3;
- (void)handleIDSServiceAvailabilityDidChangeNotification:(id)a3;
- (void)openURL:(id)a3 withCompletionHandler:(id)a4;
- (void)prepareForDefaultImageSnapshotForScreen:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)showInitialView;
- (void)tabBarControllerViewDidAppear:(id)a3;
- (void)warmInCallServiceIfNecessary;
@end

@implementation PhoneApplication

- (PhoneApplication)init
{
  v6.receiver = self;
  v6.super_class = (Class)PhoneApplication;
  v2 = [(PhoneApplication *)&v6 init];
  if (v2)
  {
    v3 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v2->_featureFlags;
    v2->_featureFlags = v3;
  }
  return v2;
}

- (void)warmInCallServiceIfNecessary
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 bundleIdentifier];
  unsigned int v4 = [v3 isEqualToString:TUBundleIdentifierMobilePhoneApplication];

  v5 = sub_100012C68();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "asking to prewarm InCallService...", buf, 2u);
    }

    v5 = dispatch_get_global_queue(-32768, 0);
    dispatch_async(v5, &stru_1000A1E90);
  }
  else if (v6)
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "prewarming InCallService...", v7, 2u);
  }
}

- (void)applicationDidFinishLaunching:(id)a3
{
  id v12 = a3;
  if ((byte_1000BBF68 & 1) == 0)
  {
    unsigned int v4 = +[IDSServiceAvailabilityController sharedInstance];
    [v4 addListenerID:@"com.apple.mobilephone.FTCServiceAvailabilityListenerID" forService:IDSServiceNameCalling];

    v5 = +[IDSServiceAvailabilityController sharedInstance];
    [v5 addListenerID:@"com.apple.mobilephone.FTCServiceAvailabilityListenerID" forService:IDSServiceNameFaceTime];

    BOOL v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:self selector:"_localeChangedNotification:" name:NSCurrentLocaleDidChangeNotification object:0];
    [v6 addObserver:self selector:"handleIDSServiceAvailabilityDidChangeNotification:" name:IDSServiceAvailabilityDidChangeNotification object:0];
    [v6 addObserver:self selector:"handleApplicationFinishedSnapshottingNotification:" name:_UIApplicationDidFinishSuspensionSnapshotNotification object:0];
    [(PhoneApplication *)self setReceivesMemoryWarnings:1];
    v7 = +[UIApplication sharedApplication];
    [v7 setDelegate:self];

    getenv("LogPhoneTransitionTimes");
    self->_launchTime = CFAbsoluteTimeGetCurrent();
    byte_1000BBF68 = 1;
  }
  v8 = +[NSUserDefaults standardUserDefaults];
  [v8 registerDefaults:&off_1000A5FE0];

  v9 = +[UIDevice currentDevice];
  id v10 = [v9 userInterfaceIdiom];

  if (v10 != (id)1) {
    ABAddressBookSetAutorotationEnabled();
  }
  if ([UIApp userInterfaceStyle] == 1)
  {
    v11 = +[UIColor clearColor];
    [(PhoneApplication *)self _setDefaultTopNavBarTintColor:v11];
  }
}

- (BOOL)inCall
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = +[TUCallCenter sharedInstance];
  v3 = [v2 displayedCalls];

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(UIApp, "showsCallsFromService:", objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "service")))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (PhoneRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
}

- (BOOL)isDeviceCapableOfTelephonyCalls
{
  return +[TUCallCapabilities supportsPrimaryCalling];
}

- (BOOL)isDeviceCapableOfFaceTimeVideo
{
  return +[TUCallCapabilities supportsDisplayingFaceTimeVideoCalls];
}

- (BOOL)isDeviceCapableOfFaceTimeAudio
{
  return +[TUCallCapabilities supportsDisplayingFaceTimeAudioCalls];
}

- (id)callHistoryControllerWithCoalescingStrategy:(unint64_t)a3
{
  unint64_t v4 = [(PhoneApplication *)self callHistoryControllerOptions];

  return +[TUCallHistoryController sharedControllerWithCoalescingStrategy:a3 options:v4];
}

- (unint64_t)callHistoryControllerOptions
{
  unint64_t v3 = [(PhoneApplication *)self showsFaceTimeAudioRecents];
  if ([(PhoneApplication *)self showsFaceTimeVideoRecents]) {
    v3 |= 2uLL;
  }
  if ([(PhoneApplication *)self showsTelephonyRecents]) {
    v3 |= 4uLL;
  }
  if ([(PhoneApplication *)self showsThirdPartyRecents]) {
    return v3 | 8;
  }
  else {
    return v3;
  }
}

- (UIColor)applicationTintColor
{
  return +[UIColor systemBlueColor];
}

- (BOOL)shouldSnapshot
{
  return ![UIApp alwaysShowLocalVideo]
      || ([UIApp tabBarCanSlide] & 1) == 0;
}

- (id)nameOfDefaultImageToUpdateAtSuspension
{
  if ([(PhoneApplication *)self shouldSnapshot])
  {
    unint64_t v3 = [(PhoneApplication *)self rootViewController];
    unint64_t v4 = [v3 baseViewController];

    if ([v4 shouldSnapshot])
    {
      uint64_t v5 = [(id)objc_opt_class() defaultPNGName];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)prepareForDefaultImageSnapshotForScreen:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100012C68();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "-prepareForDefaultImageShapshotForScreen:%@", (uint8_t *)&v14, 0xCu);
  }

  id v6 = +[UIScreen mainScreen];

  if (v6 == v4)
  {
    unsigned int v7 = [(PhoneApplication *)self shouldSnapshot];
    long long v8 = sub_100012C68();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 67109120;
      LODWORD(v15) = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "-prepareForDefaultImageShapshotForScreen: is considering snapshotting for main screen, shouldSnapshot=%d", (uint8_t *)&v14, 8u);
    }

    if (v7)
    {
      long long v9 = [(PhoneApplication *)self rootViewController];
      long long v10 = [v9 baseViewController];

      unsigned int v11 = [v10 shouldSnapshot];
      id v12 = sub_100012C68();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        id v15 = v10;
        __int16 v16 = 1024;
        unsigned int v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "-prepareForDefaultImageShapshotForScreen: view controller %@ should snapshot=%d", (uint8_t *)&v14, 0x12u);
      }

      if (v11) {
        [v10 prepareForSnapshot];
      }
      if ([(PhoneApplication *)self alwaysShowLocalVideo])
      {
        v13 = [(PhoneRootViewController *)self->_rootController localVideoViewController];
        [v13 fadeOutAnimated:0];
      }
    }
  }
}

- (void)handleApplicationFinishedSnapshottingNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100012C68();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "-handleApplicationFinishedSnapshottingNotification:%@", (uint8_t *)&v6, 0xCu);
  }

  [(PhoneApplication *)self _resetCurrentViewController];
}

- (BOOL)applicationSuspendWithSettings:(id)a3
{
  id v4 = a3;
  if ([UIApp usesUnifiedInterface])
  {
    uint64_t v5 = @"Default";
  }
  else
  {
    int v6 = [(PhoneRootViewController *)self->_rootController baseViewController];
    uint64_t v5 = [(id)objc_opt_class() defaultPNGName];

    if (!v5)
    {
      [v4 removeObjectForKey:kUISuspendedDefaultPNGKey];
      goto LABEL_6;
    }
  }
  [v4 setObject:v5 forKey:kUISuspendedDefaultPNGKey];

LABEL_6:
  return 0;
}

- (void)_resetCurrentViewController
{
  if ([UIApp alwaysShowLocalVideo])
  {
    id v3 = [(PhoneRootViewController *)self->_rootController localVideoViewController];
    [v3 fadeOutAnimated:0];
  }
}

- (void)showInitialView
{
}

- (CGRect)phoneViewTabBarContentFrame
{
  v2 = [(PhoneRootViewController *)self->_rootController contentView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)dealloc
{
  [(PhoneApplication *)self _resetCurrentViewController];
  double v3 = +[IDSServiceAvailabilityController sharedInstance];
  [v3 removeListenerID:@"com.apple.mobilephone.FTCServiceAvailabilityListenerID" forService:IDSServiceNameCalling];

  double v4 = +[IDSServiceAvailabilityController sharedInstance];
  [v4 removeListenerID:@"com.apple.mobilephone.FTCServiceAvailabilityListenerID" forService:IDSServiceNameFaceTime];

  CTTelephonyCenterGetDefault();
  CTTelephonyCenterRemoveObserver();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  double v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)PhoneApplication;
  [(PhoneApplication *)&v7 dealloc];
}

- (double)launchTime
{
  return self->_launchTime;
}

- (void)_localeChangedNotification:(id)a3
{
  double v3 = (void *)qword_1000BBF60;
  qword_1000BBF60 = 0;

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"PhoneApplicationLocaleChangedNotification" object:0];
}

- (void)handleIDSServiceAvailabilityDidChangeNotification:(id)a3
{
  unint64_t v4 = [(PhoneApplication *)self callHistoryControllerOptions];
  double v5 = [(PhoneApplication *)self callHistoryController];
  [v5 setOptions:v4];

  if ((![(PhoneApplication *)self showsTelephonyCalls]
     || ![(PhoneApplication *)self telephonyCallingIsAvailable])
    && (![(PhoneApplication *)self showsFaceTimeAudio]
     || ![(PhoneApplication *)self faceTimeAudioIsAvailable])
    && (![(PhoneApplication *)self showsFaceTimeVideo]
     || ![(PhoneApplication *)self faceTimeVideoIsAvailable]))
  {
    rootController = self->_rootController;
    [(PhoneRootViewController *)rootController showFaceTimeFirstRunViewIfNeeded];
  }
}

- (void)didReceiveMemoryWarning
{
  double v3 = sub_100012C68();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PhoneApplication didReceiveMemoryWarning", v5, 2u);
  }

  if ([(PhoneApplication *)self isSuspended])
  {
    if (([(PhoneApplication *)self isSuspendedEventsOnly] & 1) == 0)
    {
      unint64_t v4 = (void *)qword_1000BBF60;
      qword_1000BBF60 = 0;
    }
  }
}

- (void)tabBarControllerViewDidAppear:(id)a3
{
  unint64_t v4 = [a3 object];
  unsigned int v5 = [v4 currentTabViewType];

  double v6 = sub_100012C68();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "tabBarControllerViewDidAppear with tab: %d", (uint8_t *)v7, 8u);
  }

  if (v5 == 2) {
    [(PhoneApplication *)self warmInCallServiceIfNecessary];
  }
}

- (BOOL)openURL:(id)a3
{
  return 1;
}

- (void)openURL:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = sub_100012C68();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"non-nil";
    if (!v7) {
      CFStringRef v9 = @"nil";
    }
    *(_DWORD *)buf = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    CFStringRef v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);
  }

  v10.receiver = self;
  v10.super_class = (Class)PhoneApplication;
  [(PhoneApplication *)&v10 openURL:v6 withCompletionHandler:v7];
}

- (void)applicationOpenURL:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_100012C68();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "applicationOpenURL %@", buf, 0xCu);
  }

  id v6 = [v4 scheme];
  id v7 = [v6 lowercaseString];

  double v8 = [(PhoneApplication *)self rootViewController];
  CFStringRef v9 = [v8 baseViewController];

  if ([v7 isEqualToString:@"vmshow"])
  {
    objc_super v10 = [v4 voicemailMessageUUID];
    if (![(PhoneApplication *)self hasEnhancedVoicemail] && !v10)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002126C;
      block[3] = &unk_1000A1D50;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      CFStringRef v9 = 0;
    }
  }
  if (v9)
  {
    double v11 = [(PhoneApplication *)self rootViewController];
    id v12 = [v11 view];
    [v12 setAlpha:1.0];

    if (objc_opt_respondsToSelector()) {
      [v9 handleURL:v4];
    }
  }
}

- (BOOL)dialVoicemail
{
  return [(PhoneApplication *)self dialVoicemailWithAccountID:0];
}

- (BOOL)dialVoicemailWithAccountID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)TUCallProviderManager);
  id v6 = objc_alloc((Class)TUDialRequest);
  id v7 = [v5 telephonyProvider];
  id v8 = [v6 initWithProvider:v7];

  [v8 setDialType:2];
  if (v4) {
    [v8 setLocalSenderIdentityAccountUUID:v4];
  }
  [v8 setOriginatingUIType:41];
  uint64_t v9 = (uint64_t)[v8 dialType];
  objc_super v10 = [v8 localSenderIdentityUUID];
  LOBYTE(v9) = sub_100027724(v9, v10);

  if ((v9 & 1) == 0)
  {
    CFStringRef v14 = sub_100012C68();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Aborting voicemail call, the device is in airplane mode", v18, 2u);
    }

    id v15 = [v8 provider];
    double v11 = +[UIAlertController networkUnavailableAlertControllerWithCallProvider:dialType:senderIdentityUUID:](UIAlertController, "networkUnavailableAlertControllerWithCallProvider:dialType:senderIdentityUUID:", v15, [v8 dialType], 0);

    if (!v11) {
      goto LABEL_16;
    }
    __int16 v16 = [(PhoneApplication *)self rootViewController];
    [v16 presentViewController:v11 animated:1 completion:0];
    goto LABEL_15;
  }
  if (![v8 isValid])
  {
    double v11 = sub_100012C68();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10006A55C((uint64_t)v8, v11);
    }
    goto LABEL_16;
  }
  double v11 = [v8 URL];
  if (!v11)
  {
    __int16 v16 = sub_100012C68();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10006A4E4((uint64_t)v8, v16);
    }
LABEL_15:

LABEL_16:
    BOOL v13 = 0;
    goto LABEL_17;
  }
  id v12 = +[UIApplication sharedApplication];
  [v12 openURL:v11 withCompletionHandler:0];

  BOOL v13 = 1;
LABEL_17:

  return v13;
}

- (int)userInterfaceScreenType
{
  if (qword_1000BBF70 != -1) {
    dispatch_once(&qword_1000BBF70, &stru_1000A1EF0);
  }
  return byte_1000BBF6C;
}

- (BOOL)faceTimeVideoIsAvailable
{
  if (![(PhoneApplication *)self isDeviceCapableOfFaceTimeVideo]) {
    return 0;
  }
  v2 = +[IDSServiceAvailabilityController sharedInstance];
  BOOL v3 = [v2 availabilityForListenerID:@"com.apple.mobilephone.FTCServiceAvailabilityListenerID" forService:IDSServiceNameFaceTime] == (id)1;

  return v3;
}

- (BOOL)telephonyCallingIsAvailable
{
  return [UIApp isDeviceCapableOfTelephonyCalls];
}

- (BOOL)faceTimeAudioIsAvailable
{
  if (![(PhoneApplication *)self isDeviceCapableOfFaceTimeAudio]) {
    return 0;
  }
  v2 = +[IDSServiceAvailabilityController sharedInstance];
  BOOL v3 = [v2 availabilityForListenerID:@"com.apple.mobilephone.FTCServiceAvailabilityListenerID" forService:IDSServiceNameCalling] == (id)1;

  return v3;
}

- (BOOL)isLowGraphicsPerformanceDevice
{
  if (qword_1000BBF80 != -1) {
    dispatch_once(&qword_1000BBF80, &stru_1000A1F10);
  }
  return qword_1000BBF78 == 10;
}

- (unsigned)userInterfaceStyle
{
  return 0;
}

- (int64_t)backdropStyle
{
  return -2;
}

- (int)defaultAction
{
  return 0;
}

- (BOOL)defaultActionIsFaceTimeAudio
{
  return [UIApp defaultAction] == 2;
}

- (BOOL)defaultActionIsFaceTimeVideo
{
  return [UIApp defaultAction] == 1;
}

- (BOOL)showsCallsFromService:(int)a3
{
  if (a3 == 2) {
    return [UIApp showsFaceTimeAudio];
  }
  if (a3 == 1) {
    return [UIApp showsTelephonyCalls];
  }
  return 0;
}

- (BOOL)usesUnifiedInterface
{
  return 0;
}

- (unsigned)contentViewOffscreenEdge
{
  return 0;
}

- (BOOL)contentViewAnimationsFadeInsteadOfMove
{
  return 0;
}

- (BOOL)shouldUseCompactHorizontalLayout
{
  return 0;
}

- (BOOL)usesBlendModes
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("usesBlendModes");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 531, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)alwaysShowLocalVideo
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("alwaysShowLocalVideo");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 532, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)contentViewCanRotate
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("contentViewCanRotate");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 533, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)tabBarFillsScreen
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("tabBarFillsScreen");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 534, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)tabBarCanSlide
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("tabBarCanSlide");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 535, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showSplashScreenOnSignin
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("showSplashScreenOnSignin");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 536, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsTelephonyCalls
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("showsTelephonyCalls");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 537, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsFaceTimeAudio
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("showsFaceTimeAudio");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 538, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsFaceTimeVideo
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("showsFaceTimeVideo");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 539, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsTelephonyFavorites
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("showsTelephonyFavorites");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 540, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsFaceTimeAudioFavorites
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("showsFaceTimeAudioFavorites");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 541, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsFaceTimeVideoFavorites
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("showsFaceTimeVideoFavorites");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 542, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsTelephonyRecents
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("showsTelephonyRecents");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 543, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsThirdPartyRecents
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("showsThirdPartyRecents");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 544, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsFaceTimeAudioRecents
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("showsFaceTimeAudioRecents");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 545, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsFaceTimeVideoRecents
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("showsFaceTimeVideoRecents");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 546, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)badgesMissedTelephonyCalls
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("badgesMissedTelephonyCalls");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 547, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)badgesMissedFaceTimeAudio
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("badgesMissedFaceTimeAudio");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 548, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)badgesMissedFaceTimeVideo
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("badgesMissedFaceTimeVideo");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 549, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsPhoneDialer
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("showsPhoneDialer");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 550, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)showsPhoneVoicemail
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("showsPhoneVoicemail");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 551, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

- (BOOL)hasEnhancedVoicemail
{
  id v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("hasEnhancedVoicemail");
  [v4 handleFailureInMethod:a2, self, @"PhoneApplication.m", 552, @"Subclass of PhoneApplication should implement %@", v5 object file lineNumber description];

  return 0;
}

+ (id)sharedNumberFormatter
{
  v2 = (void *)qword_1000BBF60;
  if (!qword_1000BBF60)
  {
    id v3 = objc_alloc_init((Class)NSNumberFormatter);
    id v4 = (void *)qword_1000BBF60;
    qword_1000BBF60 = (uint64_t)v3;

    v2 = (void *)qword_1000BBF60;
  }

  return v2;
}

- (id)callHistoryController
{
  return [(PhoneApplication *)self callHistoryControllerWithCoalescingStrategy:1];
}

- (BOOL)application:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v4 = a4;
  id v5 = sub_100012C68();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activity continuity - Will continue with type = %@", (uint8_t *)&v7, 0xCu);
  }

  return 1;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (BOOL)headerViewShowsAllRecentCalls
{
  return self->_headerViewShowsAllRecentCalls;
}

- (int64_t)headerViewNumberOfCallsToShow
{
  return self->_headerViewNumberOfCallsToShow;
}

- (BOOL)audioButtonAllowsPhoneCallsAndFaceTimeAudio
{
  return self->_audioButtonAllowsPhoneCallsAndFaceTimeAudio;
}

- (BOOL)suspendingApplication
{
  return self->_suspendingApplication;
}

- (BOOL)resumingApplication
{
  return self->_resumingApplication;
}

- (PHRecentsController)recentsController
{
  return self->_recentsController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_recentsController, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_cachedApplicationBadgeString, 0);

  objc_storeStrong((id *)&self->_rootController, 0);
}

- (BOOL)_faceTimeInvitationExists
{
  v2 = +[TUCallCenter sharedInstance];
  id v3 = [v2 incomingVideoCall];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_activeFaceTimeCallExists
{
  v2 = +[TUCallCenter sharedInstance];
  id v3 = [v2 activeVideoCall];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)inFaceTime
{
  unsigned int v2 = [UIApp showsFaceTimeVideo];
  if (v2)
  {
    if ([UIApp _faceTimeInvitationExists])
    {
      LOBYTE(v2) = 1;
    }
    else
    {
      id v3 = (void *)UIApp;
      LOBYTE(v2) = _[v3 _activeFaceTimeCallExists];
    }
  }
  return v2;
}

- (BOOL)faceTimeInvitationExists
{
  unsigned int v2 = [UIApp showsFaceTimeVideo];
  if (v2)
  {
    id v3 = (void *)UIApp;
    LOBYTE(v2) = [v3 _faceTimeInvitationExists];
  }
  return v2;
}

- (BOOL)activeFaceTimeCallExists
{
  unsigned int v2 = [UIApp showsFaceTimeVideo];
  if (v2)
  {
    id v3 = (void *)UIApp;
    LOBYTE(v2) = _[v3 _activeFaceTimeCallExists];
  }
  return v2;
}

- (id)swiftui_rootViewForSimplifiedApplicationProvider
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v3 = self;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }

  swift_release();
  BOOL v4 = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
  swift_release();

  return v4;
}

@end