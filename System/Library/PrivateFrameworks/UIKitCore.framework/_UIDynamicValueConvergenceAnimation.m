@interface _UIDynamicValueConvergenceAnimation
- (BOOL)_animateForInterval:(double)a3;
- (_UIDynamicValueConvergenceAnimation)initWithValue:(double)a3 targetValue:(double)a4 convergenceRate:(double)a5 minimumDifference:(double)a6;
- (double)convergenceRate;
- (double)minimumDifference;
- (double)targetValue;
- (double)value;
- (void)runWithValueApplier:(id)a3 completion:(id)a4;
- (void)setConvergenceRate:(double)a3;
- (void)setMinimumDifference:(double)a3;
- (void)setTargetValue:(double)a3;
- (void)setValue:(double)a3;
@end

@implementation _UIDynamicValueConvergenceAnimation

- (_UIDynamicValueConvergenceAnimation)initWithValue:(double)a3 targetValue:(double)a4 convergenceRate:(double)a5 minimumDifference:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)_UIDynamicValueConvergenceAnimation;
  result = [(_UIDynamicAnimation *)&v11 init];
  if (result)
  {
    result->_value = a3;
    result->_targetValue = a4;
    result->_convergenceRate = a5;
    result->_minimumDifference = a6;
  }
  return result;
}

- (void)runWithValueApplier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = _Block_copy(a3);
  id applier = self->_applier;
  self->_id applier = v7;

  v9.receiver = self;
  v9.super_class = (Class)_UIDynamicValueConvergenceAnimation;
  [(_UIDynamicAnimation *)&v9 runWithCompletion:v6];
}

- (BOOL)_animateForInterval:(double)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (uint64_t)(a3 * 1000.0);
  if (v3 < 1) {
    return 0;
  }
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  double convergenceRate = self->_convergenceRate;
  if (has_internal_diagnostics)
  {
    if (convergenceRate <= 0.0)
    {
      v12 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        double v17 = self->_convergenceRate;
        double value = self->_value;
        double targetValue = self->_targetValue;
        int v20 = 134218496;
        double v21 = v17;
        __int16 v22 = 2048;
        double v23 = value;
        __int16 v24 = 2048;
        double v25 = targetValue;
        _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "convergenceRate %g should be positive; converging from %g to %g",
          (uint8_t *)&v20,
          0x20u);
      }
    }
  }
  else if (convergenceRate <= 0.0)
  {
    v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_animateForInterval____s_category) + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      double v14 = self->_convergenceRate;
      double v15 = self->_value;
      double v16 = self->_targetValue;
      int v20 = 134218496;
      double v21 = v14;
      __int16 v22 = 2048;
      double v23 = v15;
      __int16 v24 = 2048;
      double v25 = v16;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "convergenceRate %g should be positive; converging from %g to %g",
        (uint8_t *)&v20,
        0x20u);
    }
  }
  double v7 = self->_value;
  long double v8 = pow(self->_convergenceRate, (double)v3);
  double v9 = v7 * v8 + (1.0 - v8) * self->_targetValue;
  self->_double value = v9;
  id applier = (void (**)(id, void, double, double))self->_applier;
  if (applier)
  {
    applier[2](applier, [(_UIDynamicAnimation *)self state], v7, self->_value);
    double v9 = self->_value;
  }
  return vabdd_f64(v9, self->_targetValue) < self->_minimumDifference;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_double value = a3;
}

- (double)targetValue
{
  return self->_targetValue;
}

- (void)setTargetValue:(double)a3
{
  self->_double targetValue = a3;
}

- (double)convergenceRate
{
  return self->_convergenceRate;
}

- (void)setConvergenceRate:(double)a3
{
  self->_double convergenceRate = a3;
}

- (double)minimumDifference
{
  return self->_minimumDifference;
}

- (void)setMinimumDifference:(double)a3
{
  self->_minimumDifference = a3;
}

- (void).cxx_destruct
{
}

@end