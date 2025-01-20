@interface SCDAGoodnessScoreOverrideContext
- (BOOL)overrideContext;
- (unsigned)overriddenAdjustedScore;
- (void)setOverriddenAdjustedScore:(unsigned __int8)a3;
- (void)setOverrideContext:(BOOL)a3;
@end

@implementation SCDAGoodnessScoreOverrideContext

- (void)setOverriddenAdjustedScore:(unsigned __int8)a3
{
  self->_overriddenAdjustedScore = a3;
}

- (unsigned)overriddenAdjustedScore
{
  return self->_overriddenAdjustedScore;
}

- (void)setOverrideContext:(BOOL)a3
{
  self->_overrideContext = a3;
}

- (BOOL)overrideContext
{
  return self->_overrideContext;
}

@end