@interface SBIdleTimerTimeoutPrecedenceSettings
- (NSString)description;
- (double)_intervalForPrecedence:(unint64_t)a3;
- (double)criticalTimeout;
- (double)greatestTimeout;
- (double)highTimeout;
- (double)leastTimeout;
- (double)normalTimeout;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)highestPrecedence;
- (void)_setTimeout:(double)a3 ifGreatestForPrecedence:(unint64_t)a4;
- (void)_setTimeout:(double)a3 ifLeastForPrecedence:(unint64_t)a4;
- (void)_setTimeout:(double)a3 withPrecedence:(unint64_t)a4;
@end

@implementation SBIdleTimerTimeoutPrecedenceSettings

- (double)_intervalForPrecedence:(unint64_t)a3
{
  if (a3 <= 2) {
    return *(&self->_normalTimeout + a3);
  }
  return result;
}

- (void)_setTimeout:(double)a3 withPrecedence:(unint64_t)a4
{
  if (a4 <= 2) {
    *(&self->_normalTimeout + a4) = a3;
  }
}

- (void)_setTimeout:(double)a3 ifLeastForPrecedence:(unint64_t)a4
{
  if ((BSFloatIsZero() & 1) == 0
    && ((BSFloatIsZero() & 1) != 0 || (BSFloatIsZero() & 1) == 0 && BSFloatLessThanFloat()))
  {
    [(SBIdleTimerTimeoutPrecedenceSettings *)self _setTimeout:a4 withPrecedence:a3];
  }
}

- (void)_setTimeout:(double)a3 ifGreatestForPrecedence:(unint64_t)a4
{
  if ((BSFloatIsZero() & 1) == 0
    && ((BSFloatIsZero() & 1) != 0 || (BSFloatIsZero() & 1) == 0 && BSFloatGreaterThanFloat()))
  {
    [(SBIdleTimerTimeoutPrecedenceSettings *)self _setTimeout:a4 withPrecedence:a3];
  }
}

- (unint64_t)highestPrecedence
{
  if (BSFloatIsZero()) {
    return BSFloatIsZero() ^ 1;
  }
  else {
    return 2;
  }
}

- (double)leastTimeout
{
  int IsZero = BSFloatIsZero();
  if (IsZero) {
    double criticalTimeout = 1.79769313e308;
  }
  else {
    double criticalTimeout = self->_criticalTimeout;
  }
  int v5 = IsZero ^ 1;
  if ((BSFloatIsZero() & 1) == 0 && BSFloatLessThanFloat())
  {
    double criticalTimeout = self->_highTimeout;
    int v5 = 1;
  }
  if ((BSFloatIsZero() & 1) == 0 && BSFloatLessThanFloat()) {
    return self->_normalTimeout;
  }
  double result = 0.0;
  if (!v5) {
    return result;
  }
  return criticalTimeout;
}

- (double)greatestTimeout
{
  double result = self->_criticalTimeout;
  if (result < self->_highTimeout) {
    double result = self->_highTimeout;
  }
  if (result < self->_normalTimeout) {
    return self->_normalTimeout;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)[(SBIdleTimerTimeoutPrecedenceSettings *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBIdleTimerTimeoutPrecedenceSettings *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  if ((BSFloatIsZero() & 1) == 0) {
    id v4 = (id)[v3 appendTimeInterval:@"normalTimeout" withName:0 decomposeUnits:self->_normalTimeout];
  }
  if ((BSFloatIsZero() & 1) == 0) {
    id v5 = (id)[v3 appendTimeInterval:@"highTimeout" withName:0 decomposeUnits:self->_highTimeout];
  }
  if ((BSFloatIsZero() & 1) == 0) {
    id v6 = (id)[v3 appendTimeInterval:@"criticalTimeout" withName:0 decomposeUnits:self->_criticalTimeout];
  }
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBIdleTimerTimeoutPrecedenceSettings *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (double)normalTimeout
{
  return self->_normalTimeout;
}

- (double)highTimeout
{
  return self->_highTimeout;
}

- (double)criticalTimeout
{
  return self->_criticalTimeout;
}

@end