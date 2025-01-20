@interface SUUISimpleAnimationFactory
+ (id)backOutTimingFunction;
+ (id)easeQuadInOutTimingFunction;
+ (id)easeQuadInTimingFunction;
+ (id)easeQuadOutTimingFunction;
+ (id)factoryWithTimingFunction:(id)a3;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_timingFunctionForAnimation;
@end

@implementation SUUISimpleAnimationFactory

+ (id)backOutTimingFunction
{
  LODWORD(v2) = 1047233823;
  LODWORD(v3) = 1068457001;
  return (id)[MEMORY[0x263F15808] functionWithControlPoints:0.0 :0.0 :v2 :v3];
}

+ (id)easeQuadInTimingFunction
{
  LODWORD(v2) = 1054615798;
  LODWORD(v3) = 1062333317;
  LODWORD(v4) = 1058642330;
  return (id)[MEMORY[0x263F15808] functionWithControlPoints:v2 :0.0 :v3 :v4];
}

+ (id)easeQuadInOutTimingFunction
{
  LODWORD(v2) = 1054615798;
  LODWORD(v3) = 1058139013;
  LODWORD(v4) = 1.0;
  return (id)[MEMORY[0x263F15808] functionWithControlPoints:v2 :0.0 :v3 :v4];
}

+ (id)easeQuadOutTimingFunction
{
  LODWORD(v2) = 1043878380;
  LODWORD(v3) = 1053609165;
  LODWORD(v4) = 1058139013;
  LODWORD(v5) = 1.0;
  return (id)[MEMORY[0x263F15808] functionWithControlPoints:v2 :v3 :v4 :v5];
}

+ (id)factoryWithTimingFunction:(id)a3
{
  id v4 = a3;
  double v5 = objc_alloc_init((Class)a1);
  v6 = (void *)v5[1];
  v5[1] = v4;

  return v5;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return 0;
}

- (id)_timingFunctionForAnimation
{
  return self->_timingFunction;
}

- (void).cxx_destruct
{
}

@end