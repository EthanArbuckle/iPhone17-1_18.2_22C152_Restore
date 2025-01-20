@interface SBMedusa1oSettings
+ (id)settingsControllerModule;
- (BOOL)clipRotationRegions;
- (BOOL)debugColorRotationRegions;
- (BOOL)debugRotationCenter;
- (BOOL)fencesRotation;
- (double)gapSwipeBuffer;
- (double)rotationSlowdownFactor;
- (double)zoomOutRotationFactor;
- (unint64_t)millisecondsBetweenResizeSteps;
- (void)setClipRotationRegions:(BOOL)a3;
- (void)setDebugColorRotationRegions:(BOOL)a3;
- (void)setDebugRotationCenter:(BOOL)a3;
- (void)setDefaultValues;
- (void)setFencesRotation:(BOOL)a3;
- (void)setGapSwipeBuffer:(double)a3;
- (void)setMillisecondsBetweenResizeSteps:(unint64_t)a3;
- (void)setRotationSlowdownFactor:(double)a3;
- (void)setZoomOutRotationFactor:(double)a3;
@end

@implementation SBMedusa1oSettings

- (double)rotationSlowdownFactor
{
  return self->_rotationSlowdownFactor;
}

- (void)setDefaultValues
{
  [(SBMedusa1oSettings *)self setDebugRotationCenter:0];
  [(SBMedusa1oSettings *)self setDebugColorRotationRegions:0];
  [(SBMedusa1oSettings *)self setClipRotationRegions:0];
  [(SBMedusa1oSettings *)self setZoomOutRotationFactor:1.0];
  [(SBMedusa1oSettings *)self setRotationSlowdownFactor:1.0];
  [(SBMedusa1oSettings *)self setFencesRotation:1];
  [(SBMedusa1oSettings *)self setGapSwipeBuffer:40.0];
}

+ (id)settingsControllerModule
{
  v34[5] = *MEMORY[0x1E4F143B8];
  v29 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Color Rotation Center" valueKeyPath:@"debugRotationCenter"];
  v28 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Color Rotation Regions" valueKeyPath:@"debugColorRotationRegions"];
  v27 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Clip Rotation Regions" valueKeyPath:@"clipRotationRegions"];
  v2 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Zoom Out During Rotation" valueKeyPath:@"zoomOutRotationFactor"];
  [v2 setMinValue:1.0];
  v3 = v2;
  v24 = v2;
  [v2 setMaxValue:3.0];
  v4 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Rotation Slowdown Factor" valueKeyPath:@"rotationSlowdownFactor"];
  [v4 setMinValue:1.0];
  [v4 setMaxValue:30.0];
  v5 = (void *)MEMORY[0x1E4F94168];
  v34[0] = v29;
  v34[1] = v28;
  v34[2] = v27;
  v34[3] = v3;
  v34[4] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:5];
  v25 = [v5 sectionWithRows:v6 title:@"Debugging Aids"];

  v26 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Fence Rotation" valueKeyPath:@"fencesRotation"];
  v7 = (void *)MEMORY[0x1E4F94168];
  v33 = v26;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v9 = [v7 sectionWithRows:v8 title:@"Animations"];

  v10 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Buffer" valueKeyPath:@"gapSwipeBuffer"];
  [v10 setMinValue:0.0];
  [v10 setMaxValue:200.0];
  v11 = (void *)MEMORY[0x1E4F94168];
  v32 = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v13 = [v11 sectionWithRows:v12 title:@"GapSwipe"];

  v14 = (void *)MEMORY[0x1E4F94100];
  v15 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v16 = [v14 rowWithTitle:@"Restore Defaults" action:v15];

  v17 = (void *)MEMORY[0x1E4F94168];
  v31 = v16;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v19 = [v17 sectionWithRows:v18];

  v20 = (void *)MEMORY[0x1E4F94168];
  v30[0] = v25;
  v30[1] = v9;
  v30[2] = v13;
  v30[3] = v19;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  v22 = [v20 moduleWithTitle:@"Medusa 1.0" contents:v21];

  return v22;
}

- (BOOL)debugRotationCenter
{
  return self->_debugRotationCenter;
}

- (void)setDebugRotationCenter:(BOOL)a3
{
  self->_debugRotationCenter = a3;
}

- (BOOL)debugColorRotationRegions
{
  return self->_debugColorRotationRegions;
}

- (void)setDebugColorRotationRegions:(BOOL)a3
{
  self->_debugColorRotationRegions = a3;
}

- (BOOL)clipRotationRegions
{
  return self->_clipRotationRegions;
}

- (void)setClipRotationRegions:(BOOL)a3
{
  self->_clipRotationRegions = a3;
}

- (double)zoomOutRotationFactor
{
  return self->_zoomOutRotationFactor;
}

- (void)setZoomOutRotationFactor:(double)a3
{
  self->_zoomOutRotationFactor = a3;
}

- (void)setRotationSlowdownFactor:(double)a3
{
  self->_rotationSlowdownFactor = a3;
}

- (BOOL)fencesRotation
{
  return self->_fencesRotation;
}

- (void)setFencesRotation:(BOOL)a3
{
  self->_fencesRotation = a3;
}

- (unint64_t)millisecondsBetweenResizeSteps
{
  return self->_millisecondsBetweenResizeSteps;
}

- (void)setMillisecondsBetweenResizeSteps:(unint64_t)a3
{
  self->_millisecondsBetweenResizeSteps = a3;
}

- (double)gapSwipeBuffer
{
  return self->_gapSwipeBuffer;
}

- (void)setGapSwipeBuffer:(double)a3
{
  self->_gapSwipeBuffer = a3;
}

@end