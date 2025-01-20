@interface _UISEGestureFeatureSettings
- (BOOL)ignoreHIDEdgeFlags;
- (CGRect)bounds;
- (_UISEGestureFeatureSettings)init;
- (double)backProjectTime;
- (double)bottomEdgeAngleWindow;
- (double)bottomEdgeRegionSize;
- (double)cornerAngleWindow;
- (double)edgeAngleWindow;
- (double)edgeAngleWindowDecayTime;
- (double)edgeRegionSize;
- (double)hysteresis;
- (double)maximumBackProjectTimeFactor;
- (double)maximumSwipeDuration;
- (unint64_t)interfaceBottomEdge;
- (unint64_t)minimumNumberOfSubfeatures;
- (unint64_t)targetEdges;
- (void)setBackProjectTime:(double)a3;
- (void)setBottomEdgeAngleWindow:(double)a3;
- (void)setBottomEdgeRegionSize:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCornerAngleWindow:(double)a3;
- (void)setEdgeAngleWindow:(double)a3;
- (void)setEdgeAngleWindowDecayTime:(double)a3;
- (void)setEdgeRegionSize:(double)a3;
- (void)setHysteresis:(double)a3;
- (void)setIgnoreHIDEdgeFlags:(BOOL)a3;
- (void)setInterfaceBottomEdge:(unint64_t)a3;
- (void)setMaximumBackProjectTimeFactor:(double)a3;
- (void)setMaximumSwipeDuration:(double)a3;
- (void)setMinimumNumberOfSubfeatures:(unint64_t)a3;
- (void)setTargetEdges:(unint64_t)a3;
@end

@implementation _UISEGestureFeatureSettings

- (void)setMinimumNumberOfSubfeatures:(unint64_t)a3
{
  self->_minimumNumberOfSubfeatures = a3;
}

- (void)setIgnoreHIDEdgeFlags:(BOOL)a3
{
  self->_ignoreHIDEdgeFlags = a3;
}

- (void)setTargetEdges:(unint64_t)a3
{
  self->_targetEdges = a3;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)targetEdges
{
  return self->_targetEdges;
}

- (void)setInterfaceBottomEdge:(unint64_t)a3
{
  self->_interfaceBottomEdge = a3;
}

- (BOOL)ignoreHIDEdgeFlags
{
  return self->_ignoreHIDEdgeFlags;
}

- (double)edgeRegionSize
{
  return self->_edgeRegionSize;
}

- (double)hysteresis
{
  return self->_hysteresis;
}

- (void)setHysteresis:(double)a3
{
  self->_hysteresis = a3;
}

- (_UISEGestureFeatureSettings)init
{
  v14.receiver = self;
  v14.super_class = (Class)_UISEGestureFeatureSettings;
  v2 = [(_UISEGestureFeatureSettings *)&v14 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_backProjectTime = xmmword_186B969B0;
    *(_OWORD *)&v2->_bottomEdgeRegionSize = xmmword_186B969C0;
    *(_OWORD *)&v2->_edgeAngleWindow = xmmword_186B969D0;
    double v4 = 13.0;
    if (!_UIDeviceNativeUserInterfaceIdiom() && MGGetBoolAnswer())
    {
      v5 = +[UIScreen mainScreen];
      [v5 _referenceBounds];
      double v7 = v6;

      int v8 = MGGetBoolAnswer();
      double v9 = 0.09;
      if (v8) {
        double v9 = 0.1;
      }
      double v4 = v7 * v9;
    }
    v3->_edgeRegionSize = v4;
    v3->_hysteresis = 15.0;
    v3->_minimumNumberOfSubfeatures = 1;
    v3->_maximumSwipeDuration = 0.25;
    int v10 = MGGetBoolAnswer();
    double v11 = 1.0;
    if (v10) {
      double v11 = 2.0;
    }
    v3->_maximumBackProjectTimeFactor = v11;
    CGSize v12 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v3->_bounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v3->_bounds.size = v12;
    v3->_interfaceBottomEdge = 0;
    v3->_targetEdges = 0;
  }
  return v3;
}

- (double)backProjectTime
{
  return self->_backProjectTime;
}

- (void)setBackProjectTime:(double)a3
{
  self->_backProjectTime = a3;
}

- (double)bottomEdgeAngleWindow
{
  return self->_bottomEdgeAngleWindow;
}

- (void)setBottomEdgeAngleWindow:(double)a3
{
  self->_bottomEdgeAngleWindow = a3;
}

- (double)bottomEdgeRegionSize
{
  return self->_bottomEdgeRegionSize;
}

- (void)setBottomEdgeRegionSize:(double)a3
{
  self->_bottomEdgeRegionSize = a3;
}

- (double)cornerAngleWindow
{
  return self->_cornerAngleWindow;
}

- (void)setCornerAngleWindow:(double)a3
{
  self->_cornerAngleWindow = a3;
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

- (void)setEdgeRegionSize:(double)a3
{
  self->_edgeRegionSize = a3;
}

- (unint64_t)interfaceBottomEdge
{
  return self->_interfaceBottomEdge;
}

- (unint64_t)minimumNumberOfSubfeatures
{
  return self->_minimumNumberOfSubfeatures;
}

- (double)maximumBackProjectTimeFactor
{
  return self->_maximumBackProjectTimeFactor;
}

- (void)setMaximumBackProjectTimeFactor:(double)a3
{
  self->_maximumBackProjectTimeFactor = a3;
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