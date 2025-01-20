@interface PLPhotosApplication
+ (void)initialize;
- (BOOL)isOnWifi;
- (BOOL)isReachable;
- (BOOL)useCompatibleSuspensionAnimation;
- (NSDictionary)currentTestOptions;
- (NSSet)notificationSuppressionContexts;
- (NSString)currentTestName;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_networkReachabilityDidChange:(id)a3;
- (void)_registerForPhotoStreamActivityNotifications;
- (void)_startObservingReachabilityChanges;
- (void)_stopObservingReachabilityChanges;
- (void)_unregisterForPhotoStreamActivityNotifications;
- (void)_updateSuspensionSettings;
- (void)applicationDidFinishLaunching:(id)a3;
- (void)dealloc;
- (void)disableNetworkObservation;
- (void)enableNetworkObservation;
- (void)photosPreferencesChanged;
- (void)setCurrentTestName:(id)a3;
- (void)setCurrentTestOptions:(id)a3;
- (void)setNotificationSuppressionContexts:(id)a3;
- (void)setReceivingRemoteControlEvents:(BOOL)a3;
@end

@implementation PLPhotosApplication

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    srandomdev();
    originalUncaughtExceptionHandler = NSGetUncaughtExceptionHandler();
    NSSetUncaughtExceptionHandler((NSUncaughtExceptionHandler *)myUncaughtExceptionHandler);
  }
}

- (void)photosPreferencesChanged
{
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  v2 = +[PLPhotosDefaults sharedInstance];
  [(PLPhotosDefaults *)v2 reloadPhotoDefaultValues];
}

- (void)applicationDidFinishLaunching:(id)a3
{
  PLDebugEnableCoreDataMultithreadedAsserts();
  dispatch_get_global_queue(25, 0);
  pl_dispatch_async();
  if (MGGetBoolAnswer()) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "registerDefaults:", &unk_1F1A1C6C8);
  }
  PLSetShouldCacheIOSurfaces();
  CFPreferencesGetAppBooleanValue(@"LogJPEGDecodeTime", @"com.apple.mobileslideshow", 0);
  PLSetShouldLogImageDecodeTime();
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "_setRotationDisabledDuringTouch:", 1);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)photosPreferenceChanged, @"com.apple.mobileslideshow.PreferenceChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  _signal_nobind();
  v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x1E4F43708] object:0];
  v6 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x1E4F43660] object:0];
  v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v8 = *MEMORY[0x1E4F43648];
  [v7 addObserver:self selector:sel__applicationDidBecomeActive_ name:v8 object:0];
}

- (NSString)currentTestName
{
  return self->_currentTestName;
}

- (void)_applicationDidBecomeActive:(id)a3
{
  [(PLPhotosApplication *)self _displayAndRemovePhoneInvitationFailures];
  [(PLPhotosApplication *)self prepareForApplicationDidBecomeActive];
}

- (void)_applicationWillEnterForeground:(id)a3
{
  [(PLPhotosApplication *)self _registerForPhotoStreamActivityNotifications];
  [(PLPhotosApplication *)self prepareForApplicationWillEnterForeground];
  objc_msgSend(MEMORY[0x1E4F8AAB0], "applicationIsInForeground:photoLibraryURL:", 1, objc_msgSend(MEMORY[0x1E4F8B980], "systemLibraryURL"));
  if (_applicationWillEnterForeground__isInitialLaunch)
  {
    v4 = (void *)[MEMORY[0x1E4F8AA78] systemPhotoLibrary];
    [v4 clientApplicationWillEnterForeground];
  }
  else
  {
    _applicationWillEnterForeground__isInitialLaunch = 1;
  }
}

uint64_t __53__PLPhotosApplication_applicationDidFinishLaunching___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F8AAB0];
  uint64_t v1 = [MEMORY[0x1E4F8B980] systemLibraryURL];
  return [v0 sharedStreamsExplictlyDisabledForPhotoLibraryURL:v1];
}

- (void)_registerForPhotoStreamActivityNotifications
{
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v2 = pl_notify_register_dispatch();
  if (v2) {
    NSLog(&cfstr_FailedToRegist.isa, v2, v3, 3221225472, __67__PLPhotosApplication__registerForPhotoStreamActivityNotifications__block_invoke, &unk_1E63D2228, self);
  }
}

- (void)setNotificationSuppressionContexts:(id)a3
{
}

- (NSSet)notificationSuppressionContexts
{
  return self->_notificationSuppressionContexts;
}

- (void)setCurrentTestOptions:(id)a3
{
}

- (NSDictionary)currentTestOptions
{
  return self->_currentTestOptions;
}

- (void)setCurrentTestName:(id)a3
{
}

- (BOOL)isOnWifi
{
  return self->_isOnWifi;
}

- (BOOL)isReachable
{
  return self->_isReachable;
}

- (void)_unregisterForPhotoStreamActivityNotifications
{
  uint64_t v2 = notify_cancel(self->_sharedPhotoStreamInvitationFailureToken);
  if (v2) {
    NSLog(&cfstr_NotifyCancelFa.isa, v2);
  }
}

uint64_t __67__PLPhotosApplication__registerForPhotoStreamActivityNotifications__block_invoke()
{
  return pl_dispatch_after();
}

uint64_t __67__PLPhotosApplication__registerForPhotoStreamActivityNotifications__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _displayAndRemovePhoneInvitationFailures];
}

- (void)disableNetworkObservation
{
  int v2 = self->_observeForRechabilityChanges - 1;
  self->_observeForRechabilityChanges = v2;
  if (!v2) {
    [(PLPhotosApplication *)self _stopObservingReachabilityChanges];
  }
}

- (void)enableNetworkObservation
{
  int observeForRechabilityChanges = self->_observeForRechabilityChanges;
  self->_int observeForRechabilityChanges = observeForRechabilityChanges + 1;
  if (!observeForRechabilityChanges) {
    [(PLPhotosApplication *)self _startObservingReachabilityChanges];
  }
}

- (void)_stopObservingReachabilityChanges
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  [v3 removeObserver:self forHostname:@"0.0.0.0"];
}

- (void)_startObservingReachabilityChanges
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  [v3 addObserver:self selector:sel__networkReachabilityDidChange_ forHostname:@"0.0.0.0"];
}

- (void)_networkReachabilityDidChange:(id)a3
{
  v5 = (void *)[a3 userInfo];
  v6 = (void *)[v5 objectForKey:*MEMORY[0x1E4F4BDB0]];
  v7 = (void *)[a3 userInfo];
  self->_isReachable = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E4F4BDA8]), "BOOLValue");
  BOOL v8 = (*(unsigned char *)([v6 bytes] + 2) & 4) == 0 && self->_isReachable;
  self->_isOnWifi = v8;
  v9 = (void *)[objc_alloc(NSNumber) initWithBool:self->_isReachable];
  v10 = (void *)[objc_alloc(NSNumber) initWithBool:self->_isOnWifi];
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v9, *MEMORY[0x1E4F8AE48], v10, *MEMORY[0x1E4F8AE40], 0);

  v12 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v13 = *MEMORY[0x1E4F8AE38];
  [v12 postNotificationName:v13 object:0 userInfo:v11];
}

- (void)setReceivingRemoteControlEvents:(BOOL)a3
{
  if (a3)
  {
    if (!self->_receivingRemoteControlEvents)
    {
      PLMRMediaRemoteSetNowPlayingApplicationOverrideEnabled(1);
      [(PLPhotosApplication *)self beginReceivingRemoteControlEvents];
      self->_receivingRemoteControlEvents = 1;
    }
  }
  else if (self->_receivingRemoteControlEvents)
  {
    self->_receivingRemoteControlEvents = 0;
    [(PLPhotosApplication *)self endReceivingRemoteControlEvents];
    PLMRMediaRemoteSetNowPlayingApplicationOverrideEnabled(0);
  }
}

- (void)_updateSuspensionSettings
{
  if (([MEMORY[0x1E4F42738] shouldMakeUIForDefaultPNG] & 1) == 0)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v3 setObject:*MEMORY[0x1E4F43638] forKey:*MEMORY[0x1E4F442D0]];
    [(PLPhotosApplication *)self updateSuspendedSettings:v3];
  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  [(PLPhotosApplication *)self setReceivingRemoteControlEvents:0];
  [(PLPhotosApplication *)self setStatusBarShowsProgress:0];
  [(PLPhotosApplication *)self _updateSuspensionSettings];
  [(PLPhotosApplication *)self _unregisterForPhotoStreamActivityNotifications];
  objc_msgSend(MEMORY[0x1E4F8AAB0], "applicationIsInForeground:photoLibraryURL:", 0, objc_msgSend(MEMORY[0x1E4F8B980], "systemLibraryURL"));
  [MEMORY[0x1E4F8AC68] userDidLeavePhotosApplication];
  [(PLPhotosApplication *)self prepareForApplicationDidEnterBackground];
}

- (BOOL)useCompatibleSuspensionAnimation
{
  return 1;
}

- (void)dealloc
{
  [(PLPhotosApplication *)self _stopObservingReachabilityChanges];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);

  v4.receiver = self;
  v4.super_class = (Class)PLPhotosApplication;
  [(PLPhotosApplication *)&v4 dealloc];
}

@end