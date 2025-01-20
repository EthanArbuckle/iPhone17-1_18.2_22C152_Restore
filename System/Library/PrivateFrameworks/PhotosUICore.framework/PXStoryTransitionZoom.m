@interface PXStoryTransitionZoom
- (PXStoryTransitionZoom)initWithTransitionInfo:(id *)a3 effect:(id)a4;
- (PXStoryTransitionZoom)initWithTransitionInfo:(id *)a3 event:(int64_t)a4 clipLayouts:(id)a5;
- (double)clipAlphaForTime:(id *)a3;
- (void)_configureWithTransitionInfo:(id *)a3;
- (void)configureEffectForTime:(id *)a3;
- (void)timeDidChange;
- (void)wasStopped;
@end

@implementation PXStoryTransitionZoom

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectCurveAfterMidpoint, 0);
  objc_storeStrong((id *)&self->_effectCurveBeforeMidpoint, 0);
  objc_storeStrong((id *)&self->_animationCurve, 0);
}

- (void)configureEffectForTime:(id *)a3
{
  v6 = [(PXStoryConcreteTransition *)self effect];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v10);
    v11 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v7 handleFailureInMethod:a2, self, @"PXStoryTransition.m", 1025, @"%@ should be an instance inheriting from %@, but it is %@", @"self.effect", v9, v11 object file lineNumber description];
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"PXStoryTransition.m", 1025, @"%@ should be an instance inheriting from %@, but it is nil", @"self.effect", v9 object file lineNumber description];
  }

LABEL_3:
  +[PXStoryTransitionsSettings sharedInstance];
  objc_claimAutoreleasedReturnValue();
  CMTime time = (CMTime)*a3;
  CMTimeGetSeconds(&time);
  [(PXStoryConcreteTransition *)self duration];
  CMTime time = v12;
  CMTimeGetSeconds(&time);
  PXClamp();
}

- (void)wasStopped
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(PXStoryConcreteTransition *)self clipLayouts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        LODWORD(v5) = 1.0;
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) setContentScale:v5];
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)PXStoryTransitionZoom;
  [(PXStoryConcreteTransition *)&v9 wasStopped];
}

- (void)timeDidChange
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(PXStoryConcreteTransition *)self clipLayouts];
  if (objc_claimAutoreleasedReturnValue())
  {
    [(PXStoryAnimation *)self time];
    CMTime time = v16;
    double Seconds = CMTimeGetSeconds(&time);
    [(PXStoryConcreteTransition *)self duration];
    *(objc_super *)&time.value = v14[5];
    time.epoch = v15;
    double v5 = CMTimeGetSeconds(&time);
    BOOL zoomingOut = self->_zoomingOut;
    int64_t v7 = [(PXStoryConcreteTransition *)self event];
    if (zoomingOut)
    {
      if (!v7)
      {
        uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_super v9 = v8;
        SEL v10 = a2;
        long long v11 = self;
        uint64_t v12 = 990;
        goto LABEL_7;
      }
    }
    else if (!v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_super v9 = v8;
      SEL v10 = a2;
      long long v11 = self;
      uint64_t v12 = 1004;
LABEL_7:
      [v8 handleFailureInMethod:v10 object:v11 file:@"PXStoryTransition.m" lineNumber:v12 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    double v13 = Seconds / v5;
    *(float *)&double v13 = Seconds / v5;
    [(CAMediaTimingFunction *)self->_animationCurve _solveForInput:v13];
    PXFloatByLinearlyInterpolatingFloats();
  }
  v14[0].receiver = self;
  v14[0].super_class = (Class)PXStoryTransitionZoom;
  [(objc_super *)v14 timeDidChange];
}

- (double)clipAlphaForTime:(id *)a3
{
  double v5 = +[PXStoryTransitionsSettings sharedInstance];
  [v5 scaleTransitionBlurMidpoint];
  double v7 = v6;
  int64_t v8 = [(PXStoryConcreteTransition *)self event];
  if (v8 == 1)
  {
    LODWORD(v9) = 1.0;
    if (v7 > 0.0)
    {
      [(PXStoryConcreteTransition *)self progress];
      PXClamp();
    }
    double v10 = 1.0;
    if (!self->_zoomingOut)
    {
      [(CAMediaTimingFunction *)self->_animationCurve _solveForInput:v9];
      double v10 = v12;
    }
  }
  else if (v8 == 2)
  {
    double v10 = 1.0;
  }
  else
  {
    double v10 = 0.0;
    if (!v8)
    {
      long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PXStoryTransition.m" lineNumber:960 description:@"Code which should be unreachable has been reached"];

      abort();
    }
  }

  return v10;
}

- (void)_configureWithTransitionInfo:(id *)a3
{
  if (!BYTE5(a3->var2.var3))
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXStoryTransition.m", 946, @"Invalid parameter not satisfying: %@", @"transitionInfo.scaleDirection != PXStoryScaleDirectionUndefined" object file lineNumber description];
  }
  double v8 = *(double *)&a3->var3;
  *(float *)&double v8 = v8;
  self->_scaleRelativeFactor = *(float *)&v8;
  self->_BOOL zoomingOut = BYTE5(a3->var2.var3) == 2;
  LODWORD(v8) = 1045220557;
  LODWORD(v3) = 1051931443;
  LODWORD(v5) = 1.0;
  LODWORD(v4) = 1042536202;
  double v9 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v8 :v3 :v4 :v5];
  animationCurve = self->_animationCurve;
  self->_animationCurve = v9;

  LODWORD(v11) = 1.0;
  LODWORD(v12) = 1.0;
  LODWORD(v13) = 1042536202;
  v14 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v13 :0.0 :v11 :v12];
  effectCurveBeforeMidpoint = self->_effectCurveBeforeMidpoint;
  self->_effectCurveBeforeMidpoint = v14;

  LODWORD(v16) = 1059648963;
  LODWORD(v17) = 1.0;
  uint64_t v18 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :0.0 :v16 :v17];
  effectCurveAfterMidpoint = self->_effectCurveAfterMidpoint;
  self->_effectCurveAfterMidpoint = v18;
}

- (PXStoryTransitionZoom)initWithTransitionInfo:(id *)a3 effect:(id)a4
{
  long long v8 = *(_OWORD *)(&a3->var1 + 3);
  *(void *)&long long v9 = *(void *)&a3->var2.var2;
  double v5 = [(PXStoryConcreteTransition *)self initWithKind:6 duration:&v8 effect:a4];
  long long v6 = *(_OWORD *)&a3->var2.var1;
  long long v8 = *(_OWORD *)&a3->var0;
  long long v9 = v6;
  uint64_t v10 = *(void *)&a3->var3;
  [(PXStoryTransitionZoom *)v5 _configureWithTransitionInfo:&v8];
  return v5;
}

- (PXStoryTransitionZoom)initWithTransitionInfo:(id *)a3 event:(int64_t)a4 clipLayouts:(id)a5
{
  long long v9 = *(_OWORD *)(&a3->var1 + 3);
  *(void *)&long long v10 = *(void *)&a3->var2.var2;
  long long v6 = [(PXStoryConcreteTransition *)self initWithKind:6 duration:&v9 event:a4 clipLayouts:a5];
  long long v7 = *(_OWORD *)&a3->var2.var1;
  long long v9 = *(_OWORD *)&a3->var0;
  long long v10 = v7;
  uint64_t v11 = *(void *)&a3->var3;
  [(PXStoryTransitionZoom *)v6 _configureWithTransitionInfo:&v9];
  return v6;
}

@end