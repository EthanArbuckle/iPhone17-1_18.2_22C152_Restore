@interface PXStoryTransitionCrossfade
- (PXStoryTransitionCrossfade)initWithTransitionInfo:(id *)a3 event:(int64_t)a4 clipLayouts:(id)a5 storyTransitionCurveType:(unint64_t)a6;
- (double)clipAlphaForTime:(id *)a3;
@end

@implementation PXStoryTransitionCrossfade

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springAnimation, 0);
  objc_storeStrong((id *)&self->_animationCurve, 0);
}

- (double)clipAlphaForTime:(id *)a3
{
  int64_t v5 = [(PXStoryConcreteTransition *)self event];
  if (v5 == 1) {
    return 1.0;
  }
  if (v5 == 2)
  {
    springAnimation = self->_springAnimation;
    if (!springAnimation) {
      springAnimation = self->_animationCurve;
    }
    [(PXStoryConcreteTransition *)self progress];
    *(float *)&double v9 = v9;
    [springAnimation _solveForInput:v9];
    return 1.0 - v10;
  }
  else
  {
    double result = 0.0;
    if (!v5)
    {
      v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 0.0);
      [v7 handleFailureInMethod:a2 object:self file:@"PXStoryTransition.m" lineNumber:240 description:@"Code which should be unreachable has been reached"];

      abort();
    }
  }
  return result;
}

- (PXStoryTransitionCrossfade)initWithTransitionInfo:(id *)a3 event:(int64_t)a4 clipLayouts:(id)a5 storyTransitionCurveType:(unint64_t)a6
{
  id v10 = a5;
  if (a6 == 1)
  {
    CMTimeMakeWithSeconds(&v18, 1.0, 600);
    self = [(PXStoryConcreteTransition *)self initWithKind:2 duration:&v18 event:a4 clipLayouts:v10];
    v16 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"keyPath"];
    [(CASpringAnimation *)v16 setMass:1.0];
    [(CASpringAnimation *)v16 setStiffness:50.0];
    [(CASpringAnimation *)v16 setDamping:25.0];
    [(CASpringAnimation *)v16 setInitialVelocity:0.0];
    [(CASpringAnimation *)v16 settlingDuration];
    -[CASpringAnimation setDuration:](v16, "setDuration:");
    springAnimation = self->_springAnimation;
    self->_springAnimation = v16;
    goto LABEL_5;
  }
  if (!a6)
  {
    long long v19 = *(_OWORD *)(&a3->var1 + 3);
    uint64_t v20 = *(void *)&a3->var2.var2;
    self = [(PXStoryConcreteTransition *)self initWithKind:2 duration:&v19 event:a4 clipLayouts:v10];
    LODWORD(v11) = 1050253722;
    LODWORD(v12) = 1060320051;
    LODWORD(v13) = 1.0;
    v14 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v11 :0.0 :v12 :v13];
    springAnimation = self->_animationCurve;
    self->_animationCurve = v14;
LABEL_5:
  }
  return self;
}

@end