@interface UVPrototypeSettings
+ (id)settingsControllerModule;
- (BOOL)forceMetricsView;
- (BOOL)showDebugUI;
- (double)crashAnimationDuration;
- (double)crashFadeOutOpacity;
- (void)setCrashAnimationDuration:(double)a3;
- (void)setCrashFadeOutOpacity:(double)a3;
- (void)setDefaultValues;
- (void)setForceMetricsView:(BOOL)a3;
- (void)setShowDebugUI:(BOOL)a3;
@end

@implementation UVPrototypeSettings

- (void)setDefaultValues
{
  [(UVPrototypeSettings *)self setShowDebugUI:0];
  [(UVPrototypeSettings *)self setForceMetricsView:0];
  [(UVPrototypeSettings *)self setCrashAnimationDuration:0.3];

  [(UVPrototypeSettings *)self setCrashFadeOutOpacity:0.5];
}

+ (id)settingsControllerModule
{
  v26[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F622D8];
  v3 = [MEMORY[0x263F62328] rowWithTitle:@"Show Debug UI" valueKeyPath:@"showDebugUI"];
  v26[0] = v3;
  v4 = [MEMORY[0x263F62328] rowWithTitle:@"Force Metrics View" valueKeyPath:@"forceMetricsView"];
  v26[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v6 = [v2 sectionWithRows:v5 title:@"General"];

  v7 = (void *)MEMORY[0x263F622D8];
  v8 = [MEMORY[0x263F622C0] rowWithTitle:@"Animation duration" valueKeyPath:@"crashAnimationDuration"];
  v9 = [v8 between:0.0 and:2.0];
  v10 = [v9 precision:2];
  v25[0] = v10;
  v11 = [MEMORY[0x263F622C0] rowWithTitle:@"Fade out opacity" valueKeyPath:@"crashFadeOutOpacity"];
  v12 = [v11 between:0.0 and:1.0];
  v13 = [v12 precision:2];
  v25[1] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  v15 = [v7 sectionWithRows:v14 title:@"Crash UI"];

  v16 = (void *)MEMORY[0x263F622D8];
  v17 = [MEMORY[0x263F622A0] restoreDefaultSettingsButton];
  v23 = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
  v19 = [v16 sectionWithRows:v18];
  v24[0] = v19;
  v24[1] = v6;
  v24[2] = v15;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:3];
  v21 = [v16 moduleWithTitle:@"Settings" contents:v20];

  return v21;
}

- (BOOL)showDebugUI
{
  return self->_showDebugUI;
}

- (void)setShowDebugUI:(BOOL)a3
{
  self->_showDebugUI = a3;
}

- (BOOL)forceMetricsView
{
  return self->_forceMetricsView;
}

- (void)setForceMetricsView:(BOOL)a3
{
  self->_forceMetricsView = a3;
}

- (double)crashFadeOutOpacity
{
  return self->_crashFadeOutOpacity;
}

- (void)setCrashFadeOutOpacity:(double)a3
{
  self->_crashFadeOutOpacity = a3;
}

- (double)crashAnimationDuration
{
  return self->_crashAnimationDuration;
}

- (void)setCrashAnimationDuration:(double)a3
{
  self->_crashAnimationDuration = a3;
}

@end