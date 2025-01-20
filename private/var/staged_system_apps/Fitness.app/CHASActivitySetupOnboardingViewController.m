@interface CHASActivitySetupOnboardingViewController
+ (BOOL)controllerNeedsToRun;
+ (void)performEndToEndCloudSyncOnSkippingSetupForHealthStore:(id)a3;
- (BOOL)holdBeforeDisplaying;
- (BOOL)holdWithWaitScreen;
- (BOOL)legacyButtonStyles;
- (BOOL)wantsLightenBlendedScreen;
- (CHASActivitySetupOnboardingViewController)initWithPresentationContext:(int64_t)a3;
- (NSTimer)hasExistingMoveGoalTimer;
- (OS_dispatch_queue)healthQueue;
- (double)waitScreenPushGracePeriod;
- (id)alternateButtonString;
- (id)detailString;
- (id)detailTitleString;
- (id)imageResource;
- (id)imageResourceBundleIdentifier;
- (id)localizedWaitScreenDescription;
- (id)moreOptionsButtonString;
- (id)okayButtonTitle;
- (id)privacyBundles;
- (id)suggestedButtonTitle;
- (id)tapToRadarMetadata;
- (id)titleString;
- (int64_t)presentationContext;
- (void)_timeoutAndMoveOn:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)okayButtonPressed:(id)a3;
- (void)setHasExistingMoveGoalTimer:(id)a3;
- (void)setHealthQueue:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
- (void)viewDidLoad;
@end

@implementation CHASActivitySetupOnboardingViewController

+ (BOOL)controllerNeedsToRun
{
  return 1;
}

- (CHASActivitySetupOnboardingViewController)initWithPresentationContext:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CHASActivitySetupOnboardingViewController;
  v4 = [(CHASActivitySetupOnboardingViewController *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_presentationContext = a3;
    [(CHASActivitySetupOnboardingViewController *)v4 setStyle:98];
  }
  return v5;
}

- (BOOL)legacyButtonStyles
{
  return 1;
}

- (BOOL)wantsLightenBlendedScreen
{
  return 1;
}

- (id)titleString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"HEALTH_TITLE" value:&stru_1008D8AB8 table:@"ActivitySetup"];

  return v3;
}

- (id)imageResourceBundleIdentifier
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)imageResource
{
  return @"activitySetup";
}

- (id)privacyBundles
{
  CFStringRef v4 = @"com.apple.onboarding.activity";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"HEALTH_CHOICE_OK" value:&stru_1008D8AB8 table:@"ActivitySetup"];

  return v3;
}

- (id)alternateButtonString
{
  return &stru_1008D8AB8;
}

- (id)okayButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"SKIP_THIS_STEP" value:&stru_1008D8AB8 table:@"ActivitySetup"];

  return v3;
}

- (id)detailTitleString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"WHAT_IS_HEALTH" value:&stru_1008D8AB8 table:@"ActivitySetup"];

  return v3;
}

- (id)detailString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"HEALTH_DETAIL_FYI" value:&stru_1008D8AB8 table:@"ActivitySetup"];

  return v3;
}

- (id)moreOptionsButtonString
{
  return 0;
}

- (void)suggestedButtonPressed:(id)a3
{
  _HKInitializeLogging();
  CFStringRef v4 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Started Health Setup", v6, 2u);
  }
  v5 = [(CHASActivitySetupOnboardingViewController *)self delegate];
  [v5 buddyControllerDone:self nextControllerClass:objc_opt_class()];
}

- (void)okayButtonPressed:(id)a3
{
  _HKInitializeLogging();
  CFStringRef v4 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Skipped Health Setup", v9, 2u);
  }
  v5 = [(CHASActivitySetupOnboardingViewController *)self delegate];
  v6 = [v5 activePairingDevice];

  objc_super v7 = FIUIHealthStoreForDevice();
  +[CHASActivitySetupOnboardingViewController performEndToEndCloudSyncOnSkippingSetupForHealthStore:v7];
  v8 = [(CHASActivitySetupOnboardingViewController *)self delegate];
  [v8 buddyControllerDone:self];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)CHASActivitySetupOnboardingViewController;
  [(CHASActivitySetupOnboardingViewController *)&v2 viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)CHASActivitySetupOnboardingViewController;
  [(CHASActivitySetupOnboardingViewController *)&v2 didReceiveMemoryWarning];
}

+ (void)performEndToEndCloudSyncOnSkippingSetupForHealthStore:(id)a3
{
  id v4 = a3;
  v5 = FIGetActivePairedDevice();
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  v6 = (void *)qword_10096B410;
  uint64_t v18 = qword_10096B410;
  if (!qword_10096B410)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000F93F8;
    v14[3] = &unk_1008ABB60;
    v14[4] = &v15;
    sub_1000F93F8((uint64_t)v14);
    v6 = (void *)v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v6)
  {
    sub_10071BE08();
    v12 = v11;
    _Block_object_dispose(&v15, 8);
    _Unwind_Resume(v12);
  }
  objc_super v7 = [v5 valueForProperty:*v6];
  unsigned int v8 = [v7 BOOLValue];

  if (v8)
  {
    id v9 = [objc_alloc((Class)HKSecondaryDevicePairingAgent) initWithHealthStore:v4];
    v10 = [v5 pairingID];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000F8D9C;
    v13[3] = &unk_1008ABAC0;
    v13[4] = a1;
    [v9 performEndToEndCloudSyncWithNRDeviceUUID:v10 syncParticipantFirst:1 completion:v13];
  }
}

- (id)tapToRadarMetadata
{
  id v2 = [objc_alloc((Class)BPSTTRMetadata) initWithComponent:2];

  return v2;
}

- (BOOL)holdBeforeDisplaying
{
  v3 = [(CHASActivitySetupOnboardingViewController *)self delegate];
  id v4 = [v3 activePairingDevice];

  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"DB36394D-9CED-4841-BA1D-84B029EA25BB"];
  unsigned int v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    if (!self->_healthQueue)
    {
      objc_super v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Bridge.healthqueue", 0);
      healthQueue = self->_healthQueue;
      self->_healthQueue = v7;
    }
    id v9 = +[NSTimer timerWithTimeInterval:self target:"_timeoutAndMoveOn:" selector:0 userInfo:0 repeats:5.0];
    hasExistingMoveGoalTimer = self->_hasExistingMoveGoalTimer;
    self->_hasExistingMoveGoalTimer = v9;

    v11 = +[NSRunLoop currentRunLoop];
    [v11 addTimer:self->_hasExistingMoveGoalTimer forMode:NSRunLoopCommonModes];

    v12 = self->_healthQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000F9050;
    v14[3] = &unk_1008ABB38;
    id v15 = v4;
    v16 = self;
    dispatch_async(v12, v14);
  }
  return v6;
}

- (void)_timeoutAndMoveOn:(id)a3
{
  _HKInitializeLogging();
  id v4 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_FAULT)) {
    sub_10071BF30(v4);
  }
  id v5 = [(CHASActivitySetupOnboardingViewController *)self delegate];
  unsigned int v6 = [v5 activePairingDevice];

  objc_super v7 = FIUIHealthStoreForDevice();
  +[CHASActivitySetupOnboardingViewController performEndToEndCloudSyncOnSkippingSetupForHealthStore:v7];
  unsigned int v8 = [(CHASActivitySetupOnboardingViewController *)self delegate];
  [v8 buddyControllerReleaseHoldAndSkip:self];
}

- (BOOL)holdWithWaitScreen
{
  return 0;
}

- (double)waitScreenPushGracePeriod
{
  return 5.0;
}

- (id)localizedWaitScreenDescription
{
  return 0;
}

- (int64_t)presentationContext
{
  return self->_presentationContext;
}

- (NSTimer)hasExistingMoveGoalTimer
{
  return self->_hasExistingMoveGoalTimer;
}

- (void)setHasExistingMoveGoalTimer:(id)a3
{
}

- (OS_dispatch_queue)healthQueue
{
  return self->_healthQueue;
}

- (void)setHealthQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthQueue, 0);

  objc_storeStrong((id *)&self->_hasExistingMoveGoalTimer, 0);
}

@end