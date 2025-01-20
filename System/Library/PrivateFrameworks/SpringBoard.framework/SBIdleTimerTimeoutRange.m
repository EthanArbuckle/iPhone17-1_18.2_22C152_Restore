@interface SBIdleTimerTimeoutRange
- (BOOL)intersects:(id)a3;
- (NSString)description;
- (SBIdleTimerTimeoutRange)initWithLowerTimeout:(double)a3 upperTimeout:(double)a4;
- (double)lowerTimeout;
- (double)upperTimeout;
- (id)clippedRangeWithFavoredRange:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation SBIdleTimerTimeoutRange

- (SBIdleTimerTimeoutRange)initWithLowerTimeout:(double)a3 upperTimeout:(double)a4
{
  if ((BSFloatLessThanOrEqualToFloat() & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBIdleTimerAggregateClientConfiguration.m", 329, @"lower: %g not less than upper: %g", *(void *)&a3, *(void *)&a4);
  }
  v10.receiver = self;
  v10.super_class = (Class)SBIdleTimerTimeoutRange;
  result = [(SBIdleTimerTimeoutRange *)&v10 init];
  if (result)
  {
    result->_lowerTimeout = a3;
    result->_upperTimeout = a4;
  }
  return result;
}

- (BOOL)intersects:(id)a3
{
  return BSFloatLessThanFloat() && (BSFloatLessThanOrEqualToFloat() & 1) != 0;
}

- (id)clippedRangeWithFavoredRange:(id)a3
{
  id v5 = a3;
  [v5 lowerTimeout];
  double v7 = v6;
  [v5 upperTimeout];
  double v9 = v8;
  if (!BSFloatLessThanOrEqualToFloat() || !BSFloatLessThanOrEqualToFloat())
  {
    if (BSFloatLessThanOrEqualToFloat()
      && BSFloatLessThanOrEqualToFloat()
      && BSFloatLessThanOrEqualToFloat())
    {
      objc_super v10 = [SBIdleTimerTimeoutRange alloc];
      double lowerTimeout = self->_lowerTimeout;
LABEL_9:
      double upperTimeout = v9;
LABEL_19:
      v13 = [(SBIdleTimerTimeoutRange *)v10 initWithLowerTimeout:lowerTimeout upperTimeout:upperTimeout];
      goto LABEL_22;
    }
    if (BSFloatLessThanOrEqualToFloat())
    {
      objc_super v10 = [SBIdleTimerTimeoutRange alloc];
      double lowerTimeout = v9;
      goto LABEL_9;
    }
    if (BSFloatLessThanOrEqualToFloat() && BSFloatLessThanOrEqualToFloat())
    {
      v13 = (SBIdleTimerTimeoutRange *)v5;
      goto LABEL_22;
    }
    if (BSFloatLessThanOrEqualToFloat()
      && BSFloatLessThanOrEqualToFloat()
      && BSFloatLessThanOrEqualToFloat())
    {
      objc_super v10 = [SBIdleTimerTimeoutRange alloc];
      double upperTimeout = self->_upperTimeout;
      double lowerTimeout = v7;
      goto LABEL_19;
    }
    if (BSFloatLessThanOrEqualToFloat())
    {
      objc_super v10 = [SBIdleTimerTimeoutRange alloc];
      double lowerTimeout = v7;
      double upperTimeout = v7;
      goto LABEL_19;
    }
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBIdleTimerAggregateClientConfiguration.m", 384, @"Clipping range: %@ with favored range: %@ was not resolved.", self, v5 object file lineNumber description];
  }
  v13 = self;
LABEL_22:
  v15 = v13;

  return v15;
}

- (NSString)description
{
  return (NSString *)[(SBIdleTimerTimeoutRange *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBIdleTimerTimeoutRange *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendTimeInterval:@"lower" withName:0 decomposeUnits:self->_lowerTimeout];
  id v5 = (id)[v3 appendTimeInterval:@"upper" withName:0 decomposeUnits:self->_upperTimeout];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBIdleTimerTimeoutRange *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (double)lowerTimeout
{
  return self->_lowerTimeout;
}

- (double)upperTimeout
{
  return self->_upperTimeout;
}

@end