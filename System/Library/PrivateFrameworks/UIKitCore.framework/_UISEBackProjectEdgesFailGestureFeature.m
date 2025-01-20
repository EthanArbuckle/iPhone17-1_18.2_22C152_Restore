@interface _UISEBackProjectEdgesFailGestureFeature
- (_UISEBackProjectEdgesFailGestureFeature)initWithSettings:(id)a3;
- (id)debugDictionary;
- (unint64_t)touchedEdges;
- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3;
@end

@implementation _UISEBackProjectEdgesFailGestureFeature

- (void).cxx_destruct
{
}

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  if (a3->var0 == 1)
  {
    if (!self->_hasDoneTest)
    {
      p_initialLocation = &self->_initialLocation;
      double v6 = a3->var5.x - self->_initialLocation.x;
      double v7 = a3->var5.y - self->_initialLocation.y;
      [(_UISEGestureFeatureSettings *)self->_settings maximumBackProjectTimeFactor];
      if (v8 > 1.0)
      {
        double v9 = v8;
        double v10 = a3->var6 - self->_initialTimestamp;
        [(_UISEGestureFeatureSettings *)self->_settings backProjectTime];
        double v12 = v11 / v10;
        if (v12 < 1.0) {
          double v12 = 1.0;
        }
        if (v12 >= v9) {
          double v12 = v9;
        }
        double v6 = v6 * v12;
        double v7 = v7 * v12;
      }
      double v13 = p_initialLocation->x - v6;
      double v14 = self->_initialLocation.y - v7;
      unint64_t v15 = [(_UISEGestureFeatureSettings *)self->_settings targetEdges];
      unint64_t v16 = [(_UISEGestureFeatureSettings *)self->_settings interfaceBottomEdge];
      settings = self->_settings;
      if (v15 == v16) {
        [(_UISEGestureFeatureSettings *)settings bottomEdgeRegionSize];
      }
      else {
        [(_UISEGestureFeatureSettings *)settings edgeRegionSize];
      }
      double v19 = v18;
      [(_UISEGestureFeatureSettings *)self->_settings bounds];
      uint64_t v24 = UIRectEdgeRegionForLocation(v20, v21, v22, v23, v13, v14, v19);
      unint64_t v25 = [(_UISEGestureFeatureSettings *)self->_settings targetEdges];
      self->_touchedEdges = v25 & v24;
      if ((v25 & v24) == 0) {
        [(_UISEGestureFeature *)self _setState:2];
      }
      self->_hasDoneTest = 1;
    }
  }
  else if (!a3->var0)
  {
    self->_initialLocation = a3->var5;
    self->_initialTimestamp = a3->var6;
  }
}

- (_UISEBackProjectEdgesFailGestureFeature)initWithSettings:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UISEBackProjectEdgesFailGestureFeature;
  v4 = [(_UISEBackProjectEdgesFailGestureFeature *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_touchedEdges = 0;
    objc_storeStrong((id *)&v4->_settings, a3);
    v5->_hasDoneTest = 0;
    v5->_initialLocation = (CGPoint)vdupq_n_s64(0x7FF8000000000000uLL);
    v5->_initialTimestamp = NAN;
  }
  return v5;
}

- (id)debugDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)_UISEBackProjectEdgesFailGestureFeature;
  v3 = [(_UISEGestureFeature *)&v7 debugDictionary];
  v4 = (void *)[v3 mutableCopy];

  v5 = _UIRectEdgeDescription(self->_touchedEdges);
  [v4 setObject:v5 forKeyedSubscript:@"touchedEdges"];

  return v4;
}

- (unint64_t)touchedEdges
{
  return self->_touchedEdges;
}

@end