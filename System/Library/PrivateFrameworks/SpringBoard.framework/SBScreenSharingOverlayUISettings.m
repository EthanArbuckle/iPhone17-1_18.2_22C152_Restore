@interface SBScreenSharingOverlayUISettings
+ (id)settingsControllerModule;
- (double)edgeSwipeBuffer;
- (void)setDefaultValues;
- (void)setEdgeSwipeBuffer:(double)a3;
@end

@implementation SBScreenSharingOverlayUISettings

- (void)setDefaultValues
{
}

+ (id)settingsControllerModule
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Buffer" valueKeyPath:@"edgeSwipeBuffer"];
  [v2 setMinValue:0.0];
  [v2 setMaxValue:100.0];
  v3 = (void *)MEMORY[0x1E4F94168];
  v11[0] = v2;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v5 = [v3 sectionWithRows:v4 title:@"Edge Swipe"];

  v6 = (void *)MEMORY[0x1E4F94168];
  v10 = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v8 = [v6 moduleWithTitle:@"Screen Sharing Overlay UI Settings" contents:v7];

  return v8;
}

- (double)edgeSwipeBuffer
{
  return self->_edgeSwipeBuffer;
}

- (void)setEdgeSwipeBuffer:(double)a3
{
  self->_edgeSwipeBuffer = a3;
}

@end