@interface SBCameraApplication
- (BOOL)hasPreHeatInFlight;
- (BOOL)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5;
- (void)_cancelPreheatForUserLaunchIfNecessary;
- (void)preHeatForUserLaunchIfNecessaryWithAbsoluteTime:(unint64_t)a3 andContinuousTime:(unint64_t)a4;
- (void)setHasPreHeatInFlight:(BOOL)a3;
@end

@implementation SBCameraApplication

- (void)preHeatForUserLaunchIfNecessaryWithAbsoluteTime:(unint64_t)a3 andContinuousTime:(unint64_t)a4
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)SBCameraApplication;
  -[SBApplication preHeatForUserLaunchIfNecessaryWithAbsoluteTime:andContinuousTime:](&v14, sel_preHeatForUserLaunchIfNecessaryWithAbsoluteTime_andContinuousTime_);
  v7 = SBLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Prewarming Camera for icon touch.", v13, 2u);
  }

  v8 = [NSNumber numberWithLongLong:a3];
  v9 = [NSNumber numberWithLongLong:a4];
  uint64_t v10 = *MEMORY[0x1E4F158F0];
  uint64_t v11 = *MEMORY[0x1E4F15928];
  v15[0] = *MEMORY[0x1E4F15918];
  v15[1] = v11;
  v16[0] = v10;
  v16[1] = v8;
  v15[2] = *MEMORY[0x1E4F15938];
  v16[2] = v9;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  AVCapturePrewarmWithOptions();
  self->_hasPreHeatInFlight = 1;
}

- (BOOL)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)SBCameraApplication;
  BOOL result = [(SBApplication *)&v7 icon:a3 launchFromLocation:a4 context:a5];
  self->_hasPreHeatInFlight = 0;
  return result;
}

- (void)_cancelPreheatForUserLaunchIfNecessary
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (self->_hasPreHeatInFlight)
  {
    uint64_t v4 = *MEMORY[0x1E4F15918];
    v5[0] = *MEMORY[0x1E4F158F0];
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
    MEMORY[0x1D9487C80](@"com.apple.camera", v3);

    self->_hasPreHeatInFlight = 0;
  }
}

- (BOOL)hasPreHeatInFlight
{
  return self->_hasPreHeatInFlight;
}

- (void)setHasPreHeatInFlight:(BOOL)a3
{
  self->_hasPreHeatInFlight = a3;
}

@end