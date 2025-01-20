@interface SBHIconZoomSettings
+ (id)settingsControllerModule;
- (BOOL)labelAlphaWithZoom;
- (void)setDefaultValues;
- (void)setLabelAlphaWithZoom:(BOOL)a3;
@end

@implementation SBHIconZoomSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBHIconZoomSettings;
  [(SBHIconAnimationSettings *)&v3 setDefaultValues];
  [(SBHIconZoomSettings *)self setLabelAlphaWithZoom:1];
}

+ (id)settingsControllerModule
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = [MEMORY[0x1E4FA5E80] _moduleWithSectionTitle:@"Icon Zoom Animation" delay:0 frameRate:0];
  v4 = [v2 submoduleWithModule:v3 childSettingsKeyPath:@"centralAnimationSettings"];

  v5 = (void *)MEMORY[0x1E4F94160];
  v6 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Label alpha on zoom spring" valueKeyPath:@"labelAlphaWithZoom"];
  v14[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v8 = [v5 sectionWithRows:v7];

  v9 = (void *)MEMORY[0x1E4F94160];
  v13[0] = v4;
  v13[1] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v11 = [v9 moduleWithTitle:0 contents:v10];

  return v11;
}

- (BOOL)labelAlphaWithZoom
{
  return self->_labelAlphaWithZoom;
}

- (void)setLabelAlphaWithZoom:(BOOL)a3
{
  self->_labelAlphaWithZoom = a3;
}

@end