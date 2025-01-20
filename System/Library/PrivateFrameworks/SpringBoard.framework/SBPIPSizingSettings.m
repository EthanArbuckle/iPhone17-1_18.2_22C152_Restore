@interface SBPIPSizingSettings
+ (id)settingsControllerModule;
- (double)landcapeAspectRatioClosedIntervalLowerBound;
- (double)landcapeAspectRatioClosedIntervalUpperBound;
- (double)portraitAspectRatioClosedIntervalLowerBound;
- (double)portraitAspectRatioClosedIntervalUpperBound;
- (double)squareAspectRatioClosedIntervalLowerBound;
- (double)squareAspectRatioClosedIntervalUpperBound;
- (void)setDefaultValues;
- (void)setLandcapeAspectRatioClosedIntervalLowerBound:(double)a3;
- (void)setLandcapeAspectRatioClosedIntervalUpperBound:(double)a3;
- (void)setPortraitAspectRatioClosedIntervalLowerBound:(double)a3;
- (void)setPortraitAspectRatioClosedIntervalUpperBound:(double)a3;
- (void)setSquareAspectRatioClosedIntervalLowerBound:(double)a3;
- (void)setSquareAspectRatioClosedIntervalUpperBound:(double)a3;
@end

@implementation SBPIPSizingSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBPIPSizingSettings;
  [(PTSettings *)&v3 setDefaultValues];
  self->_landcapeAspectRatioClosedIntervalLowerBound = 0.0;
  self->_landcapeAspectRatioClosedIntervalUpperBound = 0.7;
  self->_squareAspectRatioClosedIntervalLowerBound = 0.71;
  self->_squareAspectRatioClosedIntervalUpperBound = 1.09;
  self->_portraitAspectRatioClosedIntervalLowerBound = 1.1;
  self->_portraitAspectRatioClosedIntervalUpperBound = 1.79769313e308;
}

+ (id)settingsControllerModule
{
  v31[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94100];
  objc_super v3 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v29 = [v2 rowWithTitle:@"Restore Defaults" action:v3];

  v4 = (void *)MEMORY[0x1E4F94140];
  v5 = NSStringFromSelector(sel_landcapeAspectRatioClosedIntervalLowerBound);
  v28 = [v4 rowWithTitle:@"Landscape range lower bound" valueKeyPath:v5];

  v6 = (void *)MEMORY[0x1E4F94140];
  v7 = NSStringFromSelector(sel_landcapeAspectRatioClosedIntervalUpperBound);
  v8 = [v6 rowWithTitle:@"Landscape range upper bound" valueKeyPath:v7];

  v9 = (void *)MEMORY[0x1E4F94140];
  v10 = NSStringFromSelector(sel_portraitAspectRatioClosedIntervalLowerBound);
  v11 = [v9 rowWithTitle:@"Portrait range lower bound" valueKeyPath:v10];

  v12 = (void *)MEMORY[0x1E4F94140];
  v13 = NSStringFromSelector(sel_portraitAspectRatioClosedIntervalUpperBound);
  v14 = [v12 rowWithTitle:@"Portrait range upper bound" valueKeyPath:v13];

  v15 = (void *)MEMORY[0x1E4F94140];
  v16 = NSStringFromSelector(sel_squareAspectRatioClosedIntervalLowerBound);
  v17 = [v15 rowWithTitle:@"Square range lower bound" valueKeyPath:v16];

  v18 = (void *)MEMORY[0x1E4F94140];
  v19 = NSStringFromSelector(sel_squareAspectRatioClosedIntervalUpperBound);
  v20 = [v18 rowWithTitle:@"Square range upper bound" valueKeyPath:v19];

  v21 = (void *)MEMORY[0x1E4F94168];
  v31[0] = v29;
  v31[1] = v28;
  v31[2] = v8;
  v31[3] = v11;
  v31[4] = v14;
  v31[5] = v17;
  v31[6] = v20;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:7];
  v23 = [v21 sectionWithRows:v22 title:@"Aspect ratios ranges"];

  v24 = (void *)MEMORY[0x1E4F94168];
  v30 = v23;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v26 = [v24 moduleWithTitle:@"PIP Aspect Ratios Ranges" contents:v25];

  return v26;
}

- (double)landcapeAspectRatioClosedIntervalLowerBound
{
  return self->_landcapeAspectRatioClosedIntervalLowerBound;
}

- (void)setLandcapeAspectRatioClosedIntervalLowerBound:(double)a3
{
  self->_landcapeAspectRatioClosedIntervalLowerBound = a3;
}

- (double)landcapeAspectRatioClosedIntervalUpperBound
{
  return self->_landcapeAspectRatioClosedIntervalUpperBound;
}

- (void)setLandcapeAspectRatioClosedIntervalUpperBound:(double)a3
{
  self->_landcapeAspectRatioClosedIntervalUpperBound = a3;
}

- (double)portraitAspectRatioClosedIntervalLowerBound
{
  return self->_portraitAspectRatioClosedIntervalLowerBound;
}

- (void)setPortraitAspectRatioClosedIntervalLowerBound:(double)a3
{
  self->_portraitAspectRatioClosedIntervalLowerBound = a3;
}

- (double)portraitAspectRatioClosedIntervalUpperBound
{
  return self->_portraitAspectRatioClosedIntervalUpperBound;
}

- (void)setPortraitAspectRatioClosedIntervalUpperBound:(double)a3
{
  self->_portraitAspectRatioClosedIntervalUpperBound = a3;
}

- (double)squareAspectRatioClosedIntervalLowerBound
{
  return self->_squareAspectRatioClosedIntervalLowerBound;
}

- (void)setSquareAspectRatioClosedIntervalLowerBound:(double)a3
{
  self->_squareAspectRatioClosedIntervalLowerBound = a3;
}

- (double)squareAspectRatioClosedIntervalUpperBound
{
  return self->_squareAspectRatioClosedIntervalUpperBound;
}

- (void)setSquareAspectRatioClosedIntervalUpperBound:(double)a3
{
  self->_squareAspectRatioClosedIntervalUpperBound = a3;
}

@end