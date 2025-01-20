@interface NavSignViewModel
- (GEOComposedRouteStep)step;
- (NavSignManeuverGuidanceInfo)maneuverInfo;
- (_NSRange)stepIndexRange;
- (void)setManeuverInfo:(id)a3;
- (void)setStep:(id)a3;
- (void)setStepIndexRange:(_NSRange)a3;
@end

@implementation NavSignViewModel

- (GEOComposedRouteStep)step
{
  return self->_step;
}

- (void)setStep:(id)a3
{
}

- (_NSRange)stepIndexRange
{
  NSUInteger length = self->_stepIndexRange.length;
  NSUInteger location = self->_stepIndexRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setStepIndexRange:(_NSRange)a3
{
  self->_stepIndexRange = a3;
}

- (NavSignManeuverGuidanceInfo)maneuverInfo
{
  return self->_maneuverInfo;
}

- (void)setManeuverInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maneuverInfo, 0);

  objc_storeStrong((id *)&self->_step, 0);
}

@end