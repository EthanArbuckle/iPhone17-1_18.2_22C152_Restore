@interface SBDropShadowSettings
+ (id)moduleWithSectionTitle:(id)a3;
+ (id)settingsControllerModule;
- (double)continuousCornerRadius;
- (double)offsetX;
- (double)offsetY;
- (double)opacity;
- (double)radius;
- (void)setContinuousCornerRadius:(double)a3;
- (void)setDefaultValues;
- (void)setOffsetX:(double)a3;
- (void)setOffsetY:(double)a3;
- (void)setOpacity:(double)a3;
- (void)setRadius:(double)a3;
@end

@implementation SBDropShadowSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBDropShadowSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBDropShadowSettings *)self setOpacity:0.5];
  [(SBDropShadowSettings *)self setRadius:75.0];
  [(SBDropShadowSettings *)self setOffsetX:0.0];
  [(SBDropShadowSettings *)self setOffsetY:15.0];
  [(SBDropShadowSettings *)self setContinuousCornerRadius:20.0];
}

+ (id)settingsControllerModule
{
  return (id)[a1 moduleWithSectionTitle:@"Drop Shadow"];
}

+ (id)moduleWithSectionTitle:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x1E4F941E0];
  id v4 = a3;
  v5 = [v3 rowWithTitle:@"Opacity" valueKeyPath:@"opacity"];
  v6 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Shadow Radius" valueKeyPath:@"radius"];
  v7 = [v6 minValue:0.0 maxValue:100.0];

  v8 = [MEMORY[0x1E4F941E0] rowWithTitle:@"X Offset" valueKeyPath:@"offsetX"];
  v9 = [v8 minValue:-30.0 maxValue:30.0];

  v10 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Y Offset" valueKeyPath:@"offsetY"];
  v11 = [v10 minValue:-30.0 maxValue:30.0];

  v12 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Continuous Corner Radius" valueKeyPath:@"continuousCornerRadius"];
  v13 = [v12 minValue:0.0 maxValue:50.0];

  v14 = (void *)MEMORY[0x1E4F94168];
  v20[0] = v5;
  v20[1] = v7;
  v20[2] = v9;
  v20[3] = v11;
  v20[4] = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:5];
  v16 = [v14 sectionWithRows:v15 title:v4];

  v21[0] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  v18 = [v14 moduleWithTitle:@"Drop Shadow Settings" contents:v17];

  return v18;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (double)offsetX
{
  return self->_offsetX;
}

- (void)setOffsetX:(double)a3
{
  self->_offsetX = a3;
}

- (double)offsetY
{
  return self->_offsetY;
}

- (void)setOffsetY:(double)a3
{
  self->_offsetY = a3;
}

- (double)continuousCornerRadius
{
  return self->_continuousCornerRadius;
}

- (void)setContinuousCornerRadius:(double)a3
{
  self->_continuousCornerRadius = a3;
}

@end