@interface _UISEInitialEdgesFailGestureFeature
- (_UISEInitialEdgesFailGestureFeature)initWithSettings:(id)a3 useEdgeRegionSize:(BOOL)a4;
- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3;
@end

@implementation _UISEInitialEdgesFailGestureFeature

- (void).cxx_destruct
{
}

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  BOOL useEdgeRegionSize = self->_useEdgeRegionSize;
  settings = self->_settings;
  if (useEdgeRegionSize)
  {
    [(_UISEGestureFeatureSettings *)settings edgeRegionSize];
    double v8 = v7 + 20.0;
  }
  else
  {
    [(_UISEGestureFeatureSettings *)settings bounds];
    double v9 = CGRectGetWidth(v17) * 0.5;
    [(_UISEGestureFeatureSettings *)self->_settings bounds];
    double v10 = CGRectGetHeight(v18) * 0.5;
    if (v9 >= v10) {
      double v8 = v10;
    }
    else {
      double v8 = v9;
    }
  }
  if (!a3->var0)
  {
    [(_UISEGestureFeatureSettings *)self->_settings bounds];
    uint64_t v15 = UIRectEdgeRegionForLocation(v11, v12, v13, v14, a3->var5.x, a3->var5.y, v8);
    if (([(_UISEGestureFeatureSettings *)self->_settings targetEdges] & v15) == 0)
    {
      [(_UISEGestureFeature *)self _setState:2];
    }
  }
}

- (_UISEInitialEdgesFailGestureFeature)initWithSettings:(id)a3 useEdgeRegionSize:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UISEInitialEdgesFailGestureFeature;
  v6 = [(_UISEInitialEdgesFailGestureFeature *)&v9 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    v7->_BOOL useEdgeRegionSize = a4;
  }
  return v7;
}

@end