@interface ISPerformanceDiagnosticsSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)shouldTracePerformance;
- (void)setDefaultValues;
- (void)setShouldTracePerformance:(BOOL)a3;
@end

@implementation ISPerformanceDiagnosticsSettings

- (void)setShouldTracePerformance:(BOOL)a3
{
  *(&self->super.super.__isObservingChildren + 1) = a3;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)ISPerformanceDiagnosticsSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(ISPerformanceDiagnosticsSettings *)self setShouldTracePerformance:0];
}

- (BOOL)shouldTracePerformance
{
  return *(&self->super.super.__isObservingChildren + 1);
}

+ (id)settingsControllerModule
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Trace Performance" valueKeyPath:@"shouldTracePerformance"];
  v18[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v5 = [v2 sectionWithRows:v4];

  v6 = (void *)MEMORY[0x1E4F94160];
  v7 = (void *)MEMORY[0x1E4F940F8];
  v8 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v9 = [v7 rowWithTitle:@"Restore Defaults" action:v8];
  v17 = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v11 = [v6 sectionWithRows:v10];

  v12 = (void *)MEMORY[0x1E4F94160];
  v16[0] = v5;
  v16[1] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v14 = [v12 moduleWithTitle:@"Performance Diagnostics" contents:v13];

  return v14;
}

+ (id)sharedInstance
{
  v2 = +[ISRootSettings sharedInstance];
  objc_super v3 = [v2 performanceDiagnosticsSettings];

  return v3;
}

@end