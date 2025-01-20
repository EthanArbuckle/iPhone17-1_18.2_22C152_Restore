@interface SBCaptureApplicationSettings
+ (id)settingsControllerModule;
- (double)launchAssertionTimeOutDurationInSeconds;
- (double)launchMonitorDurationInSeconds;
- (void)setDefaultValues;
- (void)setLaunchAssertionTimeOutDurationInSeconds:(double)a3;
- (void)setLaunchMonitorDurationInSeconds:(double)a3;
@end

@implementation SBCaptureApplicationSettings

- (void)setDefaultValues
{
  [(SBCaptureApplicationSettings *)self setLaunchMonitorDurationInSeconds:10.0];
  [(SBCaptureApplicationSettings *)self setLaunchAssertionTimeOutDurationInSeconds:1.0];
}

+ (id)settingsControllerModule
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94140];
  v3 = NSStringFromSelector(sel_launchMonitorDurationInSeconds);
  v4 = [v2 rowWithTitle:@"Launch Monitor Duration (s)" valueKeyPath:v3];
  v5 = [v4 between:1.0 and:30.0];
  v6 = [v5 precision:0];

  v7 = (void *)MEMORY[0x1E4F94140];
  v8 = NSStringFromSelector(sel_launchAssertionTimeOutDurationInSeconds);
  v9 = [v7 rowWithTitle:@"Launch Assertion Time Out Duration (s)" valueKeyPath:v8];
  v10 = [v9 between:0.0 and:30.0];
  v11 = [v10 precision:0];

  v12 = (void *)MEMORY[0x1E4F94168];
  v20[0] = v6;
  v20[1] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v14 = [v12 sectionWithRows:v13];

  v15 = (void *)MEMORY[0x1E4F94168];
  v19 = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v17 = [v15 moduleWithTitle:@"Capture Application Settings" contents:v16];

  return v17;
}

- (double)launchMonitorDurationInSeconds
{
  return self->_launchMonitorDurationInSeconds;
}

- (void)setLaunchMonitorDurationInSeconds:(double)a3
{
  self->_launchMonitorDurationInSeconds = a3;
}

- (double)launchAssertionTimeOutDurationInSeconds
{
  return self->_launchAssertionTimeOutDurationInSeconds;
}

- (void)setLaunchAssertionTimeOutDurationInSeconds:(double)a3
{
  self->_launchAssertionTimeOutDurationInSeconds = a3;
}

@end