@interface SCLDDaemon
- (SCLSchoolModeManager)schoolModeManager;
- (void)registerForLaunchEvents;
- (void)start;
@end

@implementation SCLDDaemon

- (void)start
{
  [(SCLDDaemon *)self registerForLaunchEvents];
  id v9 = objc_alloc_init((Class)SCLSchoolModeManagerConfiguration);
  v3 = +[NRPairedDeviceRegistry sharedInstance];
  [v9 setDeviceRegistry:v3];

  id v4 = objc_alloc((Class)IDSService);
  id v5 = [v4 initWithService:SCLIDSServiceName];
  [v9 setService:v5];
  [v9 setManagesSchoolTimeSession:0];
  dispatch_workloop_t v6 = dispatch_workloop_create("com.apple.schooltimed");
  [v9 setWorkloop:v6];

  v7 = (SCLSchoolModeManager *)[objc_alloc((Class)SCLSchoolModeManager) initWithConfiguration:v9];
  schoolModeManager = self->_schoolModeManager;
  self->_schoolModeManager = v7;

  [(SCLSchoolModeManager *)self->_schoolModeManager start];
}

- (void)registerForLaunchEvents
{
}

- (SCLSchoolModeManager)schoolModeManager
{
  return self->_schoolModeManager;
}

- (void).cxx_destruct
{
}

@end