@interface _UIScreenEdgePanRecognizerSettings
+ (id)settingsControllerModule;
- (NSString)multitaskingGestureMode;
- (NSString)navigationGestureMode;
- (_UIScreenEdgePanRecognizerCornerSettings)cornerSettings;
- (_UIScreenEdgePanRecognizerDwellSettings)dwellSettings;
- (_UIScreenEdgePanRecognizerEdgeSettings)edgeSettings;
- (void)setCornerSettings:(id)a3;
- (void)setDwellSettings:(id)a3;
- (void)setEdgeSettings:(id)a3;
- (void)setMultitaskingGestureMode:(id)a3;
- (void)setNavigationGestureMode:(id)a3;
@end

@implementation _UIScreenEdgePanRecognizerSettings

+ (id)settingsControllerModule
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F94130] rowWithTitle:@"Edge Swipe" childSettingsKeyPath:@"edgeSettings"];
  v12[0] = v2;
  v3 = [MEMORY[0x1E4F94130] rowWithTitle:@"Corner Swipe" childSettingsKeyPath:@"cornerSettings"];
  v12[1] = v3;
  v4 = [MEMORY[0x1E4F94130] rowWithTitle:@"Press-and-Hold" childSettingsKeyPath:@"dwellSettings"];
  v12[2] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];

  v6 = [MEMORY[0x1E4F94160] sectionWithRows:v5];
  v7 = (void *)MEMORY[0x1E4F94160];
  v11 = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v9 = [v7 moduleWithTitle:@"Edge Swipe" contents:v8];

  return v9;
}

- (NSString)multitaskingGestureMode
{
  return self->_multitaskingGestureMode;
}

- (void)setMultitaskingGestureMode:(id)a3
{
}

- (NSString)navigationGestureMode
{
  return self->_navigationGestureMode;
}

- (void)setNavigationGestureMode:(id)a3
{
}

- (_UIScreenEdgePanRecognizerEdgeSettings)edgeSettings
{
  return self->_edgeSettings;
}

- (void)setEdgeSettings:(id)a3
{
}

- (_UIScreenEdgePanRecognizerDwellSettings)dwellSettings
{
  return self->_dwellSettings;
}

- (void)setDwellSettings:(id)a3
{
}

- (_UIScreenEdgePanRecognizerCornerSettings)cornerSettings
{
  return self->_cornerSettings;
}

- (void)setCornerSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerSettings, 0);
  objc_storeStrong((id *)&self->_dwellSettings, 0);
  objc_storeStrong((id *)&self->_edgeSettings, 0);
  objc_storeStrong((id *)&self->_navigationGestureMode, 0);
  objc_storeStrong((id *)&self->_multitaskingGestureMode, 0);
}

@end