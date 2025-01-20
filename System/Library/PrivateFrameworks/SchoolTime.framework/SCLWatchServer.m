@interface SCLWatchServer
+ (id)sharedWatchServer;
- (SCLSchoolModeManager)schoolModeManager;
- (void)run;
@end

@implementation SCLWatchServer

+ (id)sharedWatchServer
{
  if (sharedWatchServer_onceToken != -1) {
    dispatch_once(&sharedWatchServer_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)sharedWatchServer___sharedWatchServer;
  return v2;
}

uint64_t __35__SCLWatchServer_sharedWatchServer__block_invoke()
{
  sharedWatchServer___sharedWatchServer = objc_alloc_init(SCLWatchServer);
  return MEMORY[0x270F9A758]();
}

- (void)run
{
  v8 = objc_alloc_init(SCLSchoolModeManagerConfiguration);
  v3 = [MEMORY[0x263F57730] sharedInstance];
  [(SCLSchoolModeManagerConfiguration *)v8 setDeviceRegistry:v3];

  v4 = (void *)[objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.tinker.school"];
  [(SCLSchoolModeManagerConfiguration *)v8 setService:v4];
  [(SCLSchoolModeManagerConfiguration *)v8 setManagesSchoolTimeSession:1];
  [(SCLSchoolModeManagerConfiguration *)v8 setAllowsNonTinkerPairing:1];
  dispatch_workloop_t v5 = dispatch_workloop_create("com.apple.schooltime");
  [(SCLSchoolModeManagerConfiguration *)v8 setWorkloop:v5];
  v6 = [[SCLSchoolModeManager alloc] initWithConfiguration:v8];
  schoolModeManager = self->_schoolModeManager;
  self->_schoolModeManager = v6;

  [(SCLSchoolModeManager *)self->_schoolModeManager start];
}

- (SCLSchoolModeManager)schoolModeManager
{
  return self->_schoolModeManager;
}

- (void).cxx_destruct
{
}

@end