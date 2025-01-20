@interface _UIScreenEdgePanRecognizerEdgeSettings
+ (id)keyPathsForValuesAffectingEdgeAngleWindowDegreees;
+ (id)settingsControllerModule;
- (double)bottomEdgeRegionSize;
- (double)edgeAngleWindow;
- (double)edgeAngleWindowDecayTime;
- (double)edgeAngleWindowDegreees;
- (double)edgeRegionSize;
- (double)hysteresis;
- (double)maximumSwipeDuration;
- (void)setBottomEdgeRegionSize:(double)a3;
- (void)setDefaultValues;
- (void)setEdgeAngleWindow:(double)a3;
- (void)setEdgeAngleWindowDecayTime:(double)a3;
- (void)setEdgeAngleWindowDegreees:(double)a3;
- (void)setEdgeRegionSize:(double)a3;
- (void)setHysteresis:(double)a3;
- (void)setMaximumSwipeDuration:(double)a3;
@end

@implementation _UIScreenEdgePanRecognizerEdgeSettings

- (void)setDefaultValues
{
  v9.receiver = self;
  v9.super_class = (Class)_UIScreenEdgePanRecognizerEdgeSettings;
  [(PTSettings *)&v9 setDefaultValues];
  [(_UIScreenEdgePanRecognizerEdgeSettings *)self setHysteresis:15.0];
  double v3 = 13.0;
  if (!_UIDeviceNativeUserInterfaceIdiom() && MGGetBoolAnswer())
  {
    v4 = +[UIScreen mainScreen];
    [v4 _referenceBounds];
    double v6 = v5;

    int v7 = MGGetBoolAnswer();
    double v8 = 0.09;
    if (v7) {
      double v8 = 0.1;
    }
    double v3 = v6 * v8;
  }
  [(_UIScreenEdgePanRecognizerEdgeSettings *)self setEdgeRegionSize:v3];
  [(_UIScreenEdgePanRecognizerEdgeSettings *)self setBottomEdgeRegionSize:11.0];
  [(_UIScreenEdgePanRecognizerEdgeSettings *)self setEdgeAngleWindow:2.70526034];
  [(_UIScreenEdgePanRecognizerEdgeSettings *)self setEdgeAngleWindowDecayTime:0.5];
  [(_UIScreenEdgePanRecognizerEdgeSettings *)self setMaximumSwipeDuration:0.25];
}

- (double)edgeAngleWindowDegreees
{
  [(_UIScreenEdgePanRecognizerEdgeSettings *)self edgeAngleWindow];
  return v2 * 57.2957795;
}

- (void)setEdgeAngleWindowDegreees:(double)a3
{
}

+ (id)keyPathsForValuesAffectingEdgeAngleWindowDegreees
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"edgeAngleWindow"];
}

+ (id)settingsControllerModule
{
  v25[5] = *MEMORY[0x1E4F143B8];
  v22 = [MEMORY[0x1E4F94148] rowWithTitle:@"Hysteresis" valueKeyPath:@"hysteresis"];
  double v2 = [v22 precision:0];
  v25[0] = v2;
  double v3 = [MEMORY[0x1E4F94148] rowWithTitle:@"Edge Window Size" valueKeyPath:@"edgeRegionSize"];
  v4 = [v3 precision:0];
  v25[1] = v4;
  double v5 = [MEMORY[0x1E4F94148] rowWithTitle:@"Bottom Edge Window Size" valueKeyPath:@"bottomEdgeRegionSize"];
  double v6 = [v5 precision:0];
  v25[2] = v6;
  int v7 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Angle Window" valueKeyPath:@"edgeAngleWindowDegreees"];
  double v8 = [v7 minValue:0.0 maxValue:180.0];
  v25[3] = v8;
  objc_super v9 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Angle Decay Time" valueKeyPath:@"edgeAngleWindowDecayTime"];
  v10 = [v9 minValue:0.0 maxValue:2.0];
  v25[4] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:5];

  v12 = [MEMORY[0x1E4F94160] sectionWithRows:v11];
  v13 = (void *)MEMORY[0x1E4F940F8];
  v14 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v15 = [v13 rowWithTitle:@"Restore Defaults" action:v14];
  v24 = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];

  v17 = [MEMORY[0x1E4F94160] sectionWithRows:v16];
  v18 = (void *)MEMORY[0x1E4F94160];
  v23[0] = v12;
  v23[1] = v17;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v20 = [v18 moduleWithTitle:@"Edge Swipe" contents:v19];

  return v20;
}

- (double)hysteresis
{
  return self->_hysteresis;
}

- (void)setHysteresis:(double)a3
{
  self->_hysteresis = a3;
}

- (double)edgeRegionSize
{
  return self->_edgeRegionSize;
}

- (void)setEdgeRegionSize:(double)a3
{
  self->_edgeRegionSize = a3;
}

- (double)bottomEdgeRegionSize
{
  return self->_bottomEdgeRegionSize;
}

- (void)setBottomEdgeRegionSize:(double)a3
{
  self->_bottomEdgeRegionSize = a3;
}

- (double)edgeAngleWindow
{
  return self->_edgeAngleWindow;
}

- (void)setEdgeAngleWindow:(double)a3
{
  self->_edgeAngleWindow = a3;
}

- (double)edgeAngleWindowDecayTime
{
  return self->_edgeAngleWindowDecayTime;
}

- (void)setEdgeAngleWindowDecayTime:(double)a3
{
  self->_edgeAngleWindowDecayTime = a3;
}

- (double)maximumSwipeDuration
{
  return self->_maximumSwipeDuration;
}

- (void)setMaximumSwipeDuration:(double)a3
{
  self->_maximumSwipeDuration = a3;
}

@end