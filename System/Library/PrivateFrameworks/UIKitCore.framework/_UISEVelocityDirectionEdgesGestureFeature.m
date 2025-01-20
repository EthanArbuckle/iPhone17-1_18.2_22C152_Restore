@interface _UISEVelocityDirectionEdgesGestureFeature
- (_UISEVelocityDirectionEdgesGestureFeature)initWithSettings:(id)a3 touchedEdgesProvider:(id)a4 exactMatchEdges:(BOOL)a5;
- (id)debugDictionary;
- (unint64_t)touchedEdges;
- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3;
@end

@implementation _UISEVelocityDirectionEdgesGestureFeature

- (_UISEVelocityDirectionEdgesGestureFeature)initWithSettings:(id)a3 touchedEdgesProvider:(id)a4 exactMatchEdges:(BOOL)a5
{
  v11.receiver = self;
  v11.super_class = (Class)_UISEVelocityDirectionEdgesGestureFeature;
  v8 = [(_UISEVelocityDirectionEdgesGestureFeature *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_touchedEdges = 0;
    objc_storeWeak((id *)&v8->_provider, a4);
    objc_storeStrong((id *)&v9->_settings, a3);
    v9->_exactMatchEdges = a5;
    v9->_initialLocation = (CGPoint)vdupq_n_s64(0x7FF8000000000000uLL);
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  if (a3->var0 != 1)
  {
    if (!a3->var0) {
      self->_initialLocation = a3->var5;
    }
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  uint64_t v6 = [WeakRetained touchedEdges];

  double v7 = atan2(a3->var5.y - self->_initialLocation.y, a3->var5.x - self->_initialLocation.x);
  double v8 = 0.0;
  if ((unint64_t)(v6 - 1) <= 0xB) {
    double v8 = dbl_186B969F0[v6 - 1];
  }
  int v9 = ~LODWORD(self->_touchedEdges);
  uint64_t v10 = ((v9 & 3) == 0) | (2 * ((v9 & 9) == 0)) | (4 * ((v9 & 6) == 0)) | (8 * ((v9 & 0xC) == 0));
  settings = self->_settings;
  if (v10)
  {
    [(_UISEGestureFeatureSettings *)settings cornerAngleWindow];
  }
  else
  {
    uint64_t v13 = [(_UISEGestureFeatureSettings *)settings interfaceBottomEdge];
    v14 = self->_settings;
    if (v6 == v13) {
      [(_UISEGestureFeatureSettings *)v14 bottomEdgeAngleWindow];
    }
    else {
      [(_UISEGestureFeatureSettings *)v14 edgeAngleWindow];
    }
  }
  double v15 = v12;
  double v16 = fabs(remainder(v7 - v8, 6.28318531));
  if (v16 >= v15 * 0.5) {
    unint64_t v17 = 0;
  }
  else {
    unint64_t v17 = v6;
  }
  if (v10) {
    BOOL v18 = v16 < v15 * 0.5;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18)
  {
    if ((int)(v7 / 1.57079633) <= 0) {
      int v19 = -(-(int)(v7 / 1.57079633) & 3);
    }
    else {
      int v19 = (int)(v7 / 1.57079633) & 3;
    }
    if (v19 > 3) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = qword_186B96A50[v19];
    }
    unint64_t v17 = v20 & v6;
  }
  BOOL exactMatchEdges = self->_exactMatchEdges;
  unint64_t v22 = [(_UISEGestureFeatureSettings *)self->_settings targetEdges];
  if (!exactMatchEdges)
  {
    v17 &= v22;
    if (!v17) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (v17 == v22) {
LABEL_28:
  }
    self->_touchedEdges = v17;
LABEL_29:
  if (self->_touchedEdges) {
    uint64_t v23 = 1;
  }
  else {
    uint64_t v23 = 2;
  }
  [(_UISEGestureFeature *)self _setState:v23];
}

- (id)debugDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)_UISEVelocityDirectionEdgesGestureFeature;
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