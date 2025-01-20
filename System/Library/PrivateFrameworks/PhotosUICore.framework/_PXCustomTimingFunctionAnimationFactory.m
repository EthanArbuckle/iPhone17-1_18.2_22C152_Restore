@interface _PXCustomTimingFunctionAnimationFactory
+ (id)factoryWithTimingFunction:(id)a3;
- (CAMediaTimingFunction)timingFunction;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4;
@end

@implementation _PXCustomTimingFunctionAnimationFactory

- (void).cxx_destruct
{
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (id)_timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4
{
  return self->_timingFunction;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return (id)[MEMORY[0x1E4F39B48] animationWithKeyPath:a4];
}

+ (id)factoryWithTimingFunction:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"PXStoryScrubberContentLayout.m", 1337, @"Invalid parameter not satisfying: %@", @"timingFunction" object file lineNumber description];
  }
  v6 = objc_alloc_init((Class)a1);
  v7 = (void *)v6[1];
  v6[1] = v5;

  return v6;
}

@end