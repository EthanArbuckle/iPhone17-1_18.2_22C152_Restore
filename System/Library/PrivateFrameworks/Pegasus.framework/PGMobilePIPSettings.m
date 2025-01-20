@interface PGMobilePIPSettings
+ (id)settingsControllerModule;
- (double)shadowContinuousCornerRadius;
- (double)shadowOffsetX;
- (double)shadowOffsetY;
- (double)shadowOpacity;
- (double)shadowRadius;
- (void)setDefaultValues;
- (void)setShadowContinuousCornerRadius:(double)a3;
- (void)setShadowOffsetX:(double)a3;
- (void)setShadowOffsetY:(double)a3;
- (void)setShadowOpacity:(double)a3;
- (void)setShadowRadius:(double)a3;
@end

@implementation PGMobilePIPSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PGMobilePIPSettings;
  [(PTSettings *)&v3 setDefaultValues];
  self->_shadowOffsetX = 0.0;
  self->_shadowOffsetY = 15.0;
  self->_shadowOpacity = 0.5;
  self->_shadowRadius = 75.0;
  self->_shadowContinuousCornerRadius = 20.0;
}

+ (id)settingsControllerModule
{
  v37[5] = *MEMORY[0x1E4F143B8];
  v28 = (void *)MEMORY[0x1E4F94160];
  v2 = (void *)MEMORY[0x1E4F941D8];
  v34 = NSStringFromSelector(sel_shadowOpacity);
  v33 = [v2 rowWithTitle:@"Opacity" valueKeyPath:v34];
  v32 = [v33 minValue:0.0 maxValue:1.0];
  v37[0] = v32;
  objc_super v3 = (void *)MEMORY[0x1E4F941D8];
  v31 = NSStringFromSelector(sel_shadowRadius);
  v30 = [v3 rowWithTitle:@"Radius" valueKeyPath:v31];
  v27 = [v30 minValue:0.0 maxValue:100.0];
  v37[1] = v27;
  v4 = (void *)MEMORY[0x1E4F941D8];
  v5 = NSStringFromSelector(sel_shadowOffsetX);
  v6 = [v4 rowWithTitle:@"Offset X" valueKeyPath:v5];
  v7 = [v6 minValue:-30.0 maxValue:30.0];
  v37[2] = v7;
  v8 = (void *)MEMORY[0x1E4F941D8];
  v9 = NSStringFromSelector(sel_shadowOffsetY);
  v10 = [v8 rowWithTitle:@"Offset Y" valueKeyPath:v9];
  v11 = [v10 minValue:-30.0 maxValue:30.0];
  v37[3] = v11;
  v12 = (void *)MEMORY[0x1E4F941D8];
  v13 = NSStringFromSelector(sel_shadowContinuousCornerRadius);
  v14 = [v12 rowWithTitle:@"Continuous Corner Radius" valueKeyPath:v13];
  v15 = [v14 minValue:0.0 maxValue:50.0];
  v37[4] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:5];
  v29 = [v28 sectionWithRows:v16 title:@"PiP Shadow Settings"];

  v17 = (void *)MEMORY[0x1E4F940F8];
  v18 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v19 = [v17 rowWithTitle:@"Restore Defaults" action:v18];

  v20 = (void *)MEMORY[0x1E4F94160];
  v36 = v19;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  v22 = [v20 sectionWithRows:v21];

  v23 = (void *)MEMORY[0x1E4F94160];
  v35[0] = v29;
  v35[1] = v22;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  v25 = [v23 moduleWithTitle:@"PIP" contents:v24];

  return v25;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (void)setShadowOpacity:(double)a3
{
  self->_shadowOpacity = a3;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
}

- (double)shadowOffsetX
{
  return self->_shadowOffsetX;
}

- (void)setShadowOffsetX:(double)a3
{
  self->_shadowOffsetX = a3;
}

- (double)shadowOffsetY
{
  return self->_shadowOffsetY;
}

- (void)setShadowOffsetY:(double)a3
{
  self->_shadowOffsetY = a3;
}

- (double)shadowContinuousCornerRadius
{
  return self->_shadowContinuousCornerRadius;
}

- (void)setShadowContinuousCornerRadius:(double)a3
{
  self->_shadowContinuousCornerRadius = a3;
}

@end