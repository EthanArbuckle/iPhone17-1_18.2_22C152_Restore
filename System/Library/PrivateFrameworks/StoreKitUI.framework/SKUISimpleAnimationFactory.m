@interface SKUISimpleAnimationFactory
+ (id)backOutTimingFunction;
+ (id)easeQuadInOutTimingFunction;
+ (id)easeQuadInTimingFunction;
+ (id)easeQuadOutTimingFunction;
+ (id)factoryWithTimingFunction:(id)a3;
+ (void)backOutTimingFunction;
+ (void)easeQuadInOutTimingFunction;
+ (void)easeQuadInTimingFunction;
+ (void)easeQuadOutTimingFunction;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_timingFunctionForAnimation;
@end

@implementation SKUISimpleAnimationFactory

+ (id)backOutTimingFunction
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUISimpleAnimationFactory backOutTimingFunction];
      }
    }
  }
  LODWORD(v2) = 1047233823;
  LODWORD(v3) = 1068457001;
  v12 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :0.0 :v2 :v3];

  return v12;
}

+ (id)easeQuadInTimingFunction
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUISimpleAnimationFactory easeQuadInTimingFunction];
      }
    }
  }
  LODWORD(v2) = 1054615798;
  LODWORD(v3) = 1062333317;
  LODWORD(v4) = 1058642330;
  v13 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v2 :0.0 :v3 :v4];

  return v13;
}

+ (id)easeQuadInOutTimingFunction
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUISimpleAnimationFactory easeQuadInOutTimingFunction];
      }
    }
  }
  LODWORD(v2) = 1054615798;
  LODWORD(v3) = 1058139013;
  LODWORD(v4) = 1.0;
  v13 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v2 :0.0 :v3 :v4];

  return v13;
}

+ (id)easeQuadOutTimingFunction
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        +[SKUISimpleAnimationFactory easeQuadOutTimingFunction];
      }
    }
  }
  LODWORD(v2) = 1043878380;
  LODWORD(v3) = 1053609165;
  LODWORD(v4) = 1058139013;
  LODWORD(v5) = 1.0;
  v14 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v2 :v3 :v4 :v5];

  return v14;
}

+ (id)factoryWithTimingFunction:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUISimpleAnimationFactory factoryWithTimingFunction:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = objc_alloc_init((Class)a1);
  v14 = (void *)v13[1];
  v13[1] = v4;

  return v13;
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

+ (void)backOutTimingFunction
{
}

+ (void)easeQuadInTimingFunction
{
}

+ (void)easeQuadInOutTimingFunction
{
}

+ (void)easeQuadOutTimingFunction
{
}

+ (void)factoryWithTimingFunction:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end