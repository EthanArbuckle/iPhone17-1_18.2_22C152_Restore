@interface SBHCenterZoomSettings
+ (id)settingsControllerModule;
- (BOOL)preferCenterOfIconGrid;
- (BOOL)zoomViewBelowIcons;
- (double)centerRowCoordinate;
- (double)dockMass;
- (double)firstHopIncrement;
- (double)hopIncrementAcceleration;
- (int64_t)distanceEffect;
- (void)setCenterRowCoordinate:(double)a3;
- (void)setDefaultValues;
- (void)setDistanceEffect:(int64_t)a3;
- (void)setDockMass:(double)a3;
- (void)setFirstHopIncrement:(double)a3;
- (void)setHopIncrementAcceleration:(double)a3;
- (void)setPreferCenterOfIconGrid:(BOOL)a3;
- (void)setZoomViewBelowIcons:(BOOL)a3;
@end

@implementation SBHCenterZoomSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBHCenterZoomSettings;
  [(SBHIconZoomSettings *)&v3 setDefaultValues];
  [(SBHCenterZoomSettings *)self setDockMass:4.0];
  [(SBHCenterZoomSettings *)self setCenterRowCoordinate:2.5];
}

+ (id)settingsControllerModule
{
  v34[1] = *MEMORY[0x1E4F143B8];
  v26 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"centralAnimationSettings.animationType == %d", 1);
  objc_super v3 = [MEMORY[0x1E4F94148] rowWithTitle:@"Coordinate of center row" valueKeyPath:@"centerRowCoordinate"];
  v4 = [v3 precision:1];
  v5 = [v4 valueValidator:&__block_literal_global_83];
  v34[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];

  v29 = [MEMORY[0x1E4F94160] sectionWithRows:v6];
  v30.receiver = a1;
  v7 = (void *)MEMORY[0x1E4F94160];
  v30.super_class = (Class)&OBJC_METACLASS___SBHCenterZoomSettings;
  v8 = objc_msgSendSuper2(&v30, sel_settingsControllerModule);
  v28 = [v7 submoduleWithModule:v8 childSettingsKeyPath:0];

  v9 = [MEMORY[0x1E4F94148] rowWithTitle:@"Dock mass" valueKeyPath:@"dockMass"];
  v10 = [v9 between:0.0 and:10000.0];
  v33 = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];

  v27 = [MEMORY[0x1E4F94160] sectionWithRows:v11 title:0 condition:v26];
  v12 = [MEMORY[0x1E4F94108] rowWithTitle:@"Distance effect" valueKeyPath:@"distanceEffect"];
  v13 = [v12 possibleValues:&unk_1F300F270 titles:&unk_1F300F258];
  v32[0] = v13;
  v14 = [MEMORY[0x1E4F94148] rowWithTitle:@"Mass for first \"hop\" valueKeyPath:@"firstHopIncrement""];
  v15 = [v14 between:0.0 and:100.0];
  v16 = [v15 conditionFormat:@"distanceEffect != 0"];
  v32[1] = v16;
  v17 = [MEMORY[0x1E4F94148] rowWithTitle:@"Hop mass acceleration" valueKeyPath:@"hopIncrementAcceleration"];
  v18 = [v17 between:-50.0 and:50.0];
  v19 = [v18 conditionFormat:@"distanceEffect != 0"];
  v32[2] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];

  v21 = [MEMORY[0x1E4F94160] sectionWithRows:v20 title:0 condition:v26];
  v22 = (void *)MEMORY[0x1E4F94160];
  v31[0] = v29;
  v31[1] = v28;
  v31[2] = v27;
  v31[3] = v21;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
  v24 = [v22 moduleWithTitle:@"Center Zoom" contents:v23];

  return v24;
}

uint64_t __49__SBHCenterZoomSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  [a2 floatValue];
  double v3 = fmax(roundf(v2 + v2) * 0.5, 1.0);
  if (v3 > 5.0) {
    double v3 = 5.0;
  }
  v4 = NSNumber;
  return [v4 numberWithDouble:v3];
}

- (BOOL)preferCenterOfIconGrid
{
  return *(&self->super._labelAlphaWithZoom + 1);
}

- (void)setPreferCenterOfIconGrid:(BOOL)a3
{
  *(&self->super._labelAlphaWithZoom + 1) = a3;
}

- (double)centerRowCoordinate
{
  return *(double *)&self->_preferCenterOfIconGrid;
}

- (void)setCenterRowCoordinate:(double)a3
{
  *(double *)&self->_preferCenterOfIconGrid = a3;
}

- (int64_t)distanceEffect
{
  return *(void *)&self->_centerRowCoordinate;
}

- (void)setDistanceEffect:(int64_t)a3
{
  *(void *)&self->_centerRowCoordinate = a3;
}

- (double)firstHopIncrement
{
  return *(double *)&self->_distanceEffect;
}

- (void)setFirstHopIncrement:(double)a3
{
  *(double *)&self->_distanceEffect = a3;
}

- (double)hopIncrementAcceleration
{
  return self->_firstHopIncrement;
}

- (void)setHopIncrementAcceleration:(double)a3
{
  self->_firstHopIncrement = a3;
}

- (double)dockMass
{
  return self->_hopIncrementAcceleration;
}

- (void)setDockMass:(double)a3
{
  self->_hopIncrementAcceleration = a3;
}

- (BOOL)zoomViewBelowIcons
{
  return *(&self->super._labelAlphaWithZoom + 2);
}

- (void)setZoomViewBelowIcons:(BOOL)a3
{
  *(&self->super._labelAlphaWithZoom + 2) = a3;
}

@end