@interface PXStoryTransitionFadeToBlack
- (PXStoryTransitionFadeToBlack)initWithTransitionInfo:(id *)a3 event:(int64_t)a4 clipLayouts:(id)a5;
- (double)clipAlphaForTime:(id *)a3;
@end

@implementation PXStoryTransitionFadeToBlack

- (void).cxx_destruct
{
}

- (double)clipAlphaForTime:(id *)a3
{
  v6 = +[PXStoryTransitionsSettings sharedInstance];
  [v6 fadeToBlackTransitionBlackRelativeDuration];
  double v8 = v7;

  CMTime time = *(CMTime *)a3;
  CMTimeGetSeconds(&time);
  [(PXStoryConcreteTransition *)self duration];
  CMTime time = v15;
  double v9 = (1.0 - v8) * (CMTimeGetSeconds(&time) * 0.5);
  int64_t v10 = [(PXStoryConcreteTransition *)self event];
  if (v10 == 1)
  {
    if (v9 > 0.0) {
      PXClamp();
    }
    [(CAMediaTimingFunction *)self->_animationCurve _solveForInput:0.0];
    return 1.0 - v13;
  }
  else if (v10 == 2)
  {
    if (v9 > 0.0) {
      PXClamp();
    }
    [(CAMediaTimingFunction *)self->_animationCurve _solveForInput:0.0];
    return v14;
  }
  else
  {
    double result = 0.0;
    if (!v10)
    {
      v12 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 0.0);
      [v12 handleFailureInMethod:a2 object:self file:@"PXStoryTransition.m" lineNumber:285 description:@"Code which should be unreachable has been reached"];

      abort();
    }
  }
  return result;
}

- (PXStoryTransitionFadeToBlack)initWithTransitionInfo:(id *)a3 event:(int64_t)a4 clipLayouts:(id)a5
{
  long long v12 = *(_OWORD *)(&a3->var1 + 3);
  uint64_t v13 = *(void *)&a3->var2.var2;
  v5 = [(PXStoryConcreteTransition *)self initWithKind:3 duration:&v12 event:a4 clipLayouts:a5];
  LODWORD(v6) = 1050253722;
  LODWORD(v7) = 1060320051;
  LODWORD(v8) = 1.0;
  uint64_t v9 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v6 :0.0 :v7 :v8];
  animationCurve = v5->_animationCurve;
  v5->_animationCurve = (CAMediaTimingFunction *)v9;

  return v5;
}

@end