@interface _UIProgressiveBlurPresentationAnimationFactory
- (_UIProgressiveBlurPresentationAnimationFactory)initWithCurve:(unint64_t)a3;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4;
- (unint64_t)curve;
@end

@implementation _UIProgressiveBlurPresentationAnimationFactory

- (_UIProgressiveBlurPresentationAnimationFactory)initWithCurve:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIProgressiveBlurPresentationAnimationFactory;
  result = [(_UIProgressiveBlurPresentationAnimationFactory *)&v5 init];
  if (result) {
    result->_curve = a3;
  }
  return result;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return (id)[MEMORY[0x1E4F39B48] animationWithKeyPath:a4];
}

- (id)_timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4
{
  unint64_t v4 = [(_UIProgressiveBlurPresentationAnimationFactory *)self curve];
  if (v4 == 1)
  {
    v9 = (void *)MEMORY[0x1E4F39C10];
    LODWORD(v5) = 1040522936;
    LODWORD(v6) = 1052938076;
    LODWORD(v7) = 1043878380;
    goto LABEL_5;
  }
  if (!v4)
  {
    v9 = (void *)MEMORY[0x1E4F39C10];
    LODWORD(v5) = 1051931443;
    LODWORD(v7) = 1043878380;
    double v6 = 0.0;
LABEL_5:
    LODWORD(v8) = 1.0;
    v10 = [v9 functionWithControlPoints:v5 :v6 :v7 :v8];
    goto LABEL_7;
  }
  v10 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
LABEL_7:
  return v10;
}

- (unint64_t)curve
{
  return self->_curve;
}

@end