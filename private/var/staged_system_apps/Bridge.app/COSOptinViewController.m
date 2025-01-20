@interface COSOptinViewController
- (BOOL)holdBeforeDisplaying;
- (BOOL)requiresActivationCheck;
- (BOOL)wantsDefaultImageResource;
- (COSOptinViewController)init;
- (HKHealthStore)healthStore;
- (HKHeartRhythmAvailability)heartRhythmAvailability;
- (id)defaultImageResource;
- (id)holdActivityIdentifier;
- (id)imageResource;
- (void)didEstablishHold;
- (void)finishedActivating;
- (void)setHealthStore:(id)a3;
- (void)setHeartRhythmAvailability:(id)a3;
@end

@implementation COSOptinViewController

- (COSOptinViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)COSOptinViewController;
  v2 = [(COSOptinViewController *)&v8 init];
  if (v2)
  {
    v3 = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
    healthStore = v2->_healthStore;
    v2->_healthStore = v3;

    v5 = (HKHeartRhythmAvailability *)[objc_alloc((Class)HKHeartRhythmAvailability) initWithHealthStore:v2->_healthStore];
    heartRhythmAvailability = v2->_heartRhythmAvailability;
    v2->_heartRhythmAvailability = v5;
  }
  return v2;
}

- (BOOL)requiresActivationCheck
{
  return 1;
}

- (id)holdActivityIdentifier
{
  return @"OptinActivationHoldActivity";
}

- (BOOL)holdBeforeDisplaying
{
  v3 = +[UIApplication sharedApplication];
  unsigned int v4 = [v3 isActivated];

  unsigned int v5 = v4 | ![(COSOptinViewController *)self requiresActivationCheck];
  if ((v5 & 1) == 0)
  {
    if (PBLogPerformanceMetrics())
    {
      v6 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      v7 = [(COSOptinViewController *)self holdActivityIdentifier];
      [v6 beginMacroActivity:v7 beginTime:CFAbsoluteTimeGetCurrent()];
    }
    objc_super v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:self selector:"finishedActivating" name:PBBridgeGizmoDidFinishActivatingNotification object:0];

    v9 = pbb_bridge_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      int v13 = 138412290;
      v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Holding (%@) because Watch is not activated", (uint8_t *)&v13, 0xCu);
    }
  }
  return v5 ^ 1;
}

- (void)didEstablishHold
{
  v2 = +[UIApplication sharedApplication];
  unsigned __int8 v3 = [v2 isActivated];

  if ((v3 & 1) == 0)
  {
    id v6 = +[UIApplication sharedApplication];
    unsigned int v4 = [v6 setupController];
    unsigned int v5 = [v4 activationManager];
    [v5 setAwaitingActivation:1];
  }
}

- (void)finishedActivating
{
  unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:PBBridgeGizmoDidFinishActivatingNotification object:0];

  if (PBLogPerformanceMetrics())
  {
    unsigned int v4 = [(COSOptinViewController *)self holdActivityIdentifier];
    unsigned int v5 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    [v5 endMacroActivity:v4 beginTime:CFAbsoluteTimeGetCurrent()];
    double v7 = v6;

    +[PBBridgeCAReporter pushTimingForTypeNamed:v4 withValue:v7];
  }
  id v8 = [(COSOptinViewController *)self delegate];
  [v8 buddyControllerReleaseHold:self];
}

- (id)imageResource
{
  if ([(COSOptinViewController *)self wantsDefaultImageResource])
  {
    unsigned __int8 v3 = [(COSOptinViewController *)self defaultImageResource];
  }
  else
  {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (BOOL)wantsDefaultImageResource
{
  return 0;
}

- (id)defaultImageResource
{
  v2 = [@"Screen-Carousel" stringByAppendingString:@"-v10"];
  unsigned __int8 v3 = sub_1000328FC((uint64_t)v2);

  return v3;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKHeartRhythmAvailability)heartRhythmAvailability
{
  return self->_heartRhythmAvailability;
}

- (void)setHeartRhythmAvailability:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartRhythmAvailability, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end