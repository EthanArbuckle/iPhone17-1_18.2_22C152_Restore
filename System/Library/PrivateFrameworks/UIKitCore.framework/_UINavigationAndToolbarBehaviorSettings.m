@interface _UINavigationAndToolbarBehaviorSettings
+ (id)settingsControllerModule;
- (BOOL)enableClippingBehavior;
- (BOOL)enableLiftOnSelected;
- (double)backButtonLeadingPadding;
- (double)backButtonTrailingPadding;
- (double)buttonCornerRadius;
- (double)buttonHorizontalOffset;
- (double)buttonMinimumDistanceFromEdge;
- (double)buttonMinimumHeight;
- (double)buttonMinimumWidth;
- (double)buttonPadding;
- (double)buttonVerticalOffset;
- (void)setBackButtonLeadingPadding:(double)a3;
- (void)setBackButtonTrailingPadding:(double)a3;
- (void)setButtonCornerRadius:(double)a3;
- (void)setButtonHorizontalOffset:(double)a3;
- (void)setButtonMinimumDistanceFromEdge:(double)a3;
- (void)setButtonMinimumHeight:(double)a3;
- (void)setButtonMinimumWidth:(double)a3;
- (void)setButtonPadding:(double)a3;
- (void)setButtonVerticalOffset:(double)a3;
- (void)setDefaultValues;
- (void)setEnableClippingBehavior:(BOOL)a3;
- (void)setEnableLiftOnSelected:(BOOL)a3;
@end

@implementation _UINavigationAndToolbarBehaviorSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationAndToolbarBehaviorSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(_UINavigationAndToolbarBehaviorSettings *)self setEnableLiftOnSelected:1];
  [(_UINavigationAndToolbarBehaviorSettings *)self setEnableClippingBehavior:0];
  [(_UINavigationAndToolbarBehaviorSettings *)self setButtonMinimumWidth:51.0];
  [(_UINavigationAndToolbarBehaviorSettings *)self setButtonMinimumHeight:37.0];
  [(_UINavigationAndToolbarBehaviorSettings *)self setButtonHorizontalOffset:0.0];
  [(_UINavigationAndToolbarBehaviorSettings *)self setButtonVerticalOffset:0.0];
  [(_UINavigationAndToolbarBehaviorSettings *)self setButtonMinimumDistanceFromEdge:4.0];
  [(_UINavigationAndToolbarBehaviorSettings *)self setButtonCornerRadius:8.0];
  [(_UINavigationAndToolbarBehaviorSettings *)self setButtonPadding:12.0];
  [(_UINavigationAndToolbarBehaviorSettings *)self setBackButtonLeadingPadding:7.0];
  [(_UINavigationAndToolbarBehaviorSettings *)self setBackButtonTrailingPadding:8.0];
}

+ (id)settingsControllerModule
{
  v37[11] = *MEMORY[0x1E4F143B8];
  v27 = (void *)MEMORY[0x1E4F94160];
  v34 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Lift Effect for Selected Buttons" valueKeyPath:@"enableLiftOnSelected"];
  v37[0] = v34;
  v33 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Prevent Highlights from touching edges (this will become automatic)" valueKeyPath:@"enableClippingBehavior"];
  v37[1] = v33;
  v32 = [MEMORY[0x1E4F94148] rowWithTitle:@"Minimum Width" valueKeyPath:@"buttonMinimumWidth"];
  v31 = [v32 between:30.0 and:80.0];
  v37[2] = v31;
  v30 = [MEMORY[0x1E4F94148] rowWithTitle:@"Minimum Height" valueKeyPath:@"buttonMinimumHeight"];
  v29 = [v30 between:30.0 and:50.0];
  v37[3] = v29;
  v26 = [MEMORY[0x1E4F94148] rowWithTitle:@"Horizontal Offset" valueKeyPath:@"buttonHorizontalOffset"];
  v25 = [v26 between:-5.0 and:5.0];
  v37[4] = v25;
  v24 = [MEMORY[0x1E4F94148] rowWithTitle:@"Vertical Offset" valueKeyPath:@"buttonVerticalOffset"];
  v23 = [v24 between:-5.0 and:5.0];
  v37[5] = v23;
  v22 = [MEMORY[0x1E4F94148] rowWithTitle:@"Minimum Edge Distance" valueKeyPath:@"buttonMinimumDistanceFromEdge"];
  v2 = [v22 between:4.0 and:20.0];
  v37[6] = v2;
  objc_super v3 = [MEMORY[0x1E4F94148] rowWithTitle:@"Corner Radius" valueKeyPath:@"buttonCornerRadius"];
  v4 = [v3 between:4.0 and:20.0];
  v37[7] = v4;
  v5 = [MEMORY[0x1E4F94148] rowWithTitle:@"Padding" valueKeyPath:@"buttonPadding"];
  v6 = [v5 between:4.0 and:20.0];
  v37[8] = v6;
  v7 = [MEMORY[0x1E4F94148] rowWithTitle:@"Back Button Leading Padding" valueKeyPath:@"backButtonLeadingPadding"];
  v8 = [v7 between:4.0 and:20.0];
  v37[9] = v8;
  v9 = [MEMORY[0x1E4F94148] rowWithTitle:@"Back Button Trailing Padding" valueKeyPath:@"backButtonTrailingPadding"];
  v10 = [v9 between:4.0 and:20.0];
  v37[10] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:11];
  v28 = [v27 sectionWithRows:v11 title:@"Navigation & Toolbar Button Highlight"];

  v12 = (void *)MEMORY[0x1E4F940F8];
  v13 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v14 = [v12 rowWithTitle:@"Restore Defaults" action:v13];

  v15 = (void *)MEMORY[0x1E4F94160];
  v36 = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  v17 = [v15 sectionWithRows:v16];

  v18 = (void *)MEMORY[0x1E4F94160];
  v35[0] = v28;
  v35[1] = v17;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  v20 = [v18 moduleWithTitle:0 contents:v19];

  return v20;
}

- (BOOL)enableLiftOnSelected
{
  return self->_enableLiftOnSelected;
}

- (void)setEnableLiftOnSelected:(BOOL)a3
{
  self->_enableLiftOnSelected = a3;
}

- (BOOL)enableClippingBehavior
{
  return self->_enableClippingBehavior;
}

- (void)setEnableClippingBehavior:(BOOL)a3
{
  self->_enableClippingBehavior = a3;
}

- (double)buttonMinimumWidth
{
  return self->_buttonMinimumWidth;
}

- (void)setButtonMinimumWidth:(double)a3
{
  self->_buttonMinimumWidth = a3;
}

- (double)buttonMinimumHeight
{
  return self->_buttonMinimumHeight;
}

- (void)setButtonMinimumHeight:(double)a3
{
  self->_buttonMinimumHeight = a3;
}

- (double)buttonHorizontalOffset
{
  return self->_buttonHorizontalOffset;
}

- (void)setButtonHorizontalOffset:(double)a3
{
  self->_buttonHorizontalOffset = a3;
}

- (double)buttonVerticalOffset
{
  return self->_buttonVerticalOffset;
}

- (void)setButtonVerticalOffset:(double)a3
{
  self->_buttonVerticalOffset = a3;
}

- (double)buttonMinimumDistanceFromEdge
{
  return self->_buttonMinimumDistanceFromEdge;
}

- (void)setButtonMinimumDistanceFromEdge:(double)a3
{
  self->_buttonMinimumDistanceFromEdge = a3;
}

- (double)buttonCornerRadius
{
  return self->_buttonCornerRadius;
}

- (void)setButtonCornerRadius:(double)a3
{
  self->_buttonCornerRadius = a3;
}

- (double)buttonPadding
{
  return self->_buttonPadding;
}

- (void)setButtonPadding:(double)a3
{
  self->_buttonPadding = a3;
}

- (double)backButtonLeadingPadding
{
  return self->_backButtonLeadingPadding;
}

- (void)setBackButtonLeadingPadding:(double)a3
{
  self->_backButtonLeadingPadding = a3;
}

- (double)backButtonTrailingPadding
{
  return self->_backButtonTrailingPadding;
}

- (void)setBackButtonTrailingPadding:(double)a3
{
  self->_backButtonTrailingPadding = a3;
}

@end