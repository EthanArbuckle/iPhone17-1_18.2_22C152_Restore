@interface SBDashBoardCameraPrewarmConfiguration
- (BOOL)backgroundLaunch;
- (BOOL)prewarmCameraHardware;
- (BOOL)prewarmForCaptureLaunch;
- (NSString)applicationBundleIdentifier;
- (NSString)prewarmingBundleIdentifier;
- (SBDashBoardCameraPrewarmConfiguration)initWithPrewarmCameraHardware:(BOOL)a3 prewarmForCaptureLaunch:(BOOL)a4 backgroundLaunchTarget:(int64_t)a5 applicationBundleIdentifier:(id)a6 prewarmingBundleIdentifier:(id)a7;
- (int64_t)backgroundLaunchTarget;
@end

@implementation SBDashBoardCameraPrewarmConfiguration

- (SBDashBoardCameraPrewarmConfiguration)initWithPrewarmCameraHardware:(BOOL)a3 prewarmForCaptureLaunch:(BOOL)a4 backgroundLaunchTarget:(int64_t)a5 applicationBundleIdentifier:(id)a6 prewarmingBundleIdentifier:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SBDashBoardCameraPrewarmConfiguration;
  v14 = [(SBDashBoardCameraPrewarmConfiguration *)&v21 init];
  v15 = v14;
  if (v14)
  {
    v14->_prewarmCameraHardware = a3;
    v14->_prewarmForCaptureLaunch = a4;
    v14->_backgroundLaunchTarget = a5;
    uint64_t v16 = [v12 copy];
    applicationBundleIdentifier = v15->_applicationBundleIdentifier;
    v15->_applicationBundleIdentifier = (NSString *)v16;

    uint64_t v18 = [v13 copy];
    prewarmingBundleIdentifier = v15->_prewarmingBundleIdentifier;
    v15->_prewarmingBundleIdentifier = (NSString *)v18;
  }
  return v15;
}

- (BOOL)backgroundLaunch
{
  return self->_backgroundLaunchTarget != 0;
}

- (BOOL)prewarmCameraHardware
{
  return self->_prewarmCameraHardware;
}

- (BOOL)prewarmForCaptureLaunch
{
  return self->_prewarmForCaptureLaunch;
}

- (int64_t)backgroundLaunchTarget
{
  return self->_backgroundLaunchTarget;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSString)prewarmingBundleIdentifier
{
  return self->_prewarmingBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prewarmingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
}

@end