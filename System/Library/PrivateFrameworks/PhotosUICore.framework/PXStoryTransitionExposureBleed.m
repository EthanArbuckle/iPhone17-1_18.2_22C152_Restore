@interface PXStoryTransitionExposureBleed
- (PXStoryTransitionExposureBleed)initWithTransitionInfo:(id *)a3 effect:(id)a4;
- (PXStoryTransitionExposureBleed)initWithTransitionInfo:(id *)a3 event:(int64_t)a4 clipLayouts:(id)a5;
- (double)clipAlphaForTime:(id *)a3;
- (void)configureEffectForTime:(id *)a3;
@end

@implementation PXStoryTransitionExposureBleed

- (void).cxx_destruct
{
}

- (void)configureEffectForTime:(id *)a3
{
  +[PXStoryTransitionsSettings sharedInstance];
  objc_claimAutoreleasedReturnValue();
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
    [v7 handleFailureInMethod:a2, self, @"PXStoryTransition.m", 347, @"%@ should be an instance inheriting from %@, but it is %@", @"self.effect", v9, v11 object file lineNumber description];
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"PXStoryTransition.m", 347, @"%@ should be an instance inheriting from %@, but it is nil", @"self.effect", v9 object file lineNumber description];
  }

LABEL_3:
  CMTime time = (CMTime)*a3;
  CMTimeGetSeconds(&time);
  [(PXStoryConcreteTransition *)self duration];
  CMTime time = v12;
  CMTimeGetSeconds(&time);
  PXClamp();
}

- (double)clipAlphaForTime:(id *)a3
{
  [(PXStoryConcreteTransition *)self duration];
  CMTime time = v12;
  if (CMTimeGetSeconds(&time) > 0.0)
  {
    CMTime time = (CMTime)*a3;
    CMTimeGetSeconds(&time);
    PXClamp();
  }
  v6 = +[PXStoryTransitionsSettings sharedInstance];
  [v6 exposureBleedTransitionMidpoint];
  double v8 = v7;

  int64_t v9 = [(PXStoryConcreteTransition *)self event];
  if (v9 == 1)
  {
    double result = 0.0;
    if (v8 <= 1.0) {
      return 1.0;
    }
  }
  else if (v9 == 2)
  {
    double result = 0.0;
    if (v8 > 1.0) {
      return 1.0;
    }
  }
  else
  {
    double result = 0.0;
    if (!v9)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 0.0);
      [v11 handleFailureInMethod:a2 object:self file:@"PXStoryTransition.m" lineNumber:331 description:@"Code which should be unreachable has been reached"];

      abort();
    }
  }
  return result;
}

- (PXStoryTransitionExposureBleed)initWithTransitionInfo:(id *)a3 effect:(id)a4
{
  long long v11 = *(_OWORD *)(&a3->var1 + 3);
  uint64_t v12 = *(void *)&a3->var2.var2;
  v4 = [(PXStoryConcreteTransition *)self initWithKind:4 duration:&v11 effect:a4];
  LODWORD(v5) = 1050253722;
  LODWORD(v6) = 1.0;
  LODWORD(v7) = 1.0;
  uint64_t v8 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v5 :0.0 :v6 :v7];
  beforeMidpointAnimationCurve = v4->_beforeMidpointAnimationCurve;
  v4->_beforeMidpointAnimationCurve = (CAMediaTimingFunction *)v8;

  return v4;
}

- (PXStoryTransitionExposureBleed)initWithTransitionInfo:(id *)a3 event:(int64_t)a4 clipLayouts:(id)a5
{
  long long v6 = *(_OWORD *)(&a3->var1 + 3);
  uint64_t v7 = *(void *)&a3->var2.var2;
  return [(PXStoryConcreteTransition *)self initWithKind:4 duration:&v6 event:a4 clipLayouts:a5];
}

@end