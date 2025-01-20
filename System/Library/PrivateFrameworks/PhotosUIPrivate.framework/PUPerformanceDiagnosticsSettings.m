@interface PUPerformanceDiagnosticsSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)shouldTracePerformance;
- (double)scrollTestCPUSustainDuration;
- (double)scrollTestCPUWarmupDuration;
- (double)scrollTestRampUpDuration;
- (id)parentSettings;
- (void)setDefaultValues;
- (void)setScrollTestCPUSustainDuration:(double)a3;
- (void)setScrollTestCPUWarmupDuration:(double)a3;
- (void)setScrollTestRampUpDuration:(double)a3;
- (void)setShouldTracePerformance:(BOOL)a3;
@end

@implementation PUPerformanceDiagnosticsSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PUPerformanceDiagnosticsSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PUPerformanceDiagnosticsSettings *)self setShouldTracePerformance:0];
  [(PUPerformanceDiagnosticsSettings *)self setScrollTestRampUpDuration:0.8];
  [(PUPerformanceDiagnosticsSettings *)self setScrollTestCPUWarmupDuration:0.0];
  [(PUPerformanceDiagnosticsSettings *)self setScrollTestCPUSustainDuration:0.0];
}

- (void)setShouldTracePerformance:(BOOL)a3
{
  self->_shouldTracePerformance = a3;
}

- (void)setScrollTestRampUpDuration:(double)a3
{
  self->_scrollTestRampUpDuration = a3;
}

- (void)setScrollTestCPUWarmupDuration:(double)a3
{
  self->_scrollTestCPUWarmupDuration = a3;
}

- (void)setScrollTestCPUSustainDuration:(double)a3
{
  self->_scrollTestCPUSustainDuration = a3;
}

- (double)scrollTestCPUSustainDuration
{
  return self->_scrollTestCPUSustainDuration;
}

- (double)scrollTestCPUWarmupDuration
{
  return self->_scrollTestCPUWarmupDuration;
}

- (double)scrollTestRampUpDuration
{
  return self->_scrollTestRampUpDuration;
}

- (BOOL)shouldTracePerformance
{
  return self->_shouldTracePerformance;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v31[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Trace Performance" valueKeyPath:@"shouldTracePerformance"];
  v31[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  v27 = [v2 sectionWithRows:v4];

  v5 = (void *)MEMORY[0x1E4F94160];
  v26 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Ramp Up Duration" valueKeyPath:@"scrollTestRampUpDuration"];
  v6 = [v26 minValue:0.0 maxValue:3.0];
  v7 = objc_msgSend(v6, "pu_increment:", 0.0500000007);
  v30[0] = v7;
  v8 = [MEMORY[0x1E4F941D8] rowWithTitle:@"CPU Warmup Duration" valueKeyPath:@"scrollTestCPUWarmupDuration"];
  v9 = [v8 minValue:0.0 maxValue:3.0];
  v10 = objc_msgSend(v9, "pu_increment:", 0.100000001);
  v30[1] = v10;
  v11 = [MEMORY[0x1E4F941D8] rowWithTitle:@"CPU Sustain Duration" valueKeyPath:@"scrollTestCPUSustainDuration"];
  v12 = [v11 minValue:0.0 maxValue:3.0];
  v13 = objc_msgSend(v12, "pu_increment:", 0.100000001);
  v30[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
  v15 = [v5 sectionWithRows:v14 title:@"PPT Scroll Tests"];

  v16 = (void *)MEMORY[0x1E4F94160];
  v17 = (void *)MEMORY[0x1E4F940F8];
  v18 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v19 = [v17 rowWithTitle:@"Restore Defaults" action:v18];
  v29 = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  v21 = [v16 sectionWithRows:v20];

  v22 = (void *)MEMORY[0x1E4F94160];
  v28[0] = v27;
  v28[1] = v15;
  v28[2] = v21;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  v24 = [v22 moduleWithTitle:@"Performance Diagnostics" contents:v23];

  return v24;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_54887 != -1) {
    dispatch_once(&sharedInstance_onceToken_54887, &__block_literal_global_54888);
  }
  v2 = (void *)sharedInstance_sharedInstance_54889;
  return v2;
}

void __50__PUPerformanceDiagnosticsSettings_sharedInstance__block_invoke()
{
  id v2 = +[PURootSettings sharedInstance];
  uint64_t v0 = [v2 performanceDiagnosticsSettings];
  v1 = (void *)sharedInstance_sharedInstance_54889;
  sharedInstance_sharedInstance_54889 = v0;
}

@end