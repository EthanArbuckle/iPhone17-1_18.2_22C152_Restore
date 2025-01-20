@interface UIInterpolatedFloat
+ (id)epsilonCompatibleWithVector:(id)a3;
+ (id)valueWithFloat:(double)a3;
+ (id)zeroCompatibleWithVector:(id)a3;
- (BOOL)isApproximatelyEqualTo:(id)a3 withinEpsilon:(id)a4;
- (BOOL)isCompatibleWith:(id)a3;
- (BOOL)isUndefined;
- (NSString)debugDescription;
- (double)value;
- (id)addVector:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getValue;
- (id)interpolateTo:(id)a3 progress:(double)a4;
- (id)multiplyByScalar:(double)a3;
- (id)multiplyByVector:(id)a3;
- (void)integrateWithVelocity:(id)a3 target:(id)a4 intermediateTarget:(id)a5 intermediateTargetVelocity:(id)a6 parameters:(id *)a7 state:(id *)a8 delta:(double)a9;
- (void)reinitWithVector:(id)a3;
@end

@implementation UIInterpolatedFloat

+ (id)valueWithFloat:(double)a3
{
  v4 = (double *)objc_alloc_init((Class)a1);
  v4[1] = a3;
  return v4;
}

- (double)value
{
  return self->_number;
}

- (id)interpolateTo:(id)a3 progress:(double)a4
{
  *((double *)self + 1) = (1.0 - a4) * *((double *)self + 1) + *((double *)a3 + 1) * a4;
  return self;
}

- (id)getValue
{
  return (id)[NSNumber numberWithDouble:self->_number];
}

- (BOOL)isApproximatelyEqualTo:(id)a3 withinEpsilon:(id)a4
{
  return vabdd_f64(self->_number, *((double *)a3 + 1)) <= *((double *)a4 + 1);
}

- (BOOL)isCompatibleWith:(id)a3
{
  return 1;
}

- (BOOL)isUndefined
{
  return fabs(self->_number) == INFINITY;
}

+ (id)epsilonCompatibleWithVector:(id)a3
{
  if (qword_1EB264F28 != -1) {
    dispatch_once(&qword_1EB264F28, &__block_literal_global_638);
  }
  v3 = (void *)_MergedGlobals_1315;
  return v3;
}

void __51__UIInterpolatedFloat_epsilonCompatibleWithVector___block_invoke()
{
  uint64_t v0 = +[UIInterpolatedFloat valueWithFloat:0.001];
  v1 = (void *)_MergedGlobals_1315;
  _MergedGlobals_1315 = v0;
}

+ (id)zeroCompatibleWithVector:(id)a3
{
  if (qword_1EB264F38 != -1) {
    dispatch_once(&qword_1EB264F38, &__block_literal_global_3_12);
  }
  v3 = (void *)qword_1EB264F30;
  return v3;
}

void __48__UIInterpolatedFloat_zeroCompatibleWithVector___block_invoke()
{
  uint64_t v0 = +[UIInterpolatedFloat valueWithFloat:0.0];
  v1 = (void *)qword_1EB264F30;
  qword_1EB264F30 = v0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)integrateWithVelocity:(id)a3 target:(id)a4 intermediateTarget:(id)a5 intermediateTargetVelocity:(id)a6 parameters:(id *)a7 state:(id *)a8 delta:(double)a9
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6, a7, a8, a9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v11 handleFailureInMethod:a2 object:self file:@"UIInterpolatedFloat.m" lineNumber:82 description:@"UIInterpolatedFloat is no longer supported."];
}

- (id)addVector:(id)a3
{
  *((double *)self + 1) = *((double *)a3 + 1) + *((double *)self + 1);
  return self;
}

- (id)multiplyByScalar:(double)a3
{
  *((double *)self + 1) = *((double *)self + 1) * a3;
  return self;
}

- (id)multiplyByVector:(id)a3
{
  *((double *)self + 1) = *((double *)a3 + 1) * *((double *)self + 1);
  return self;
}

- (void)reinitWithVector:(id)a3
{
  self->_number = *((double *)a3 + 1);
}

- (NSString)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p val: %f>", v5, self, *(void *)&self->_number];

  return (NSString *)v6;
}

@end