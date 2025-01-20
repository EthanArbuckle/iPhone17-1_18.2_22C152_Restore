@interface SMSessionTriggerDestinationETAUpdateState
+ (BOOL)supportsSecureCoding;
- (BOOL)nominalTravelTimeShorter;
- (BOOL)remainingDistanceShorter;
- (BOOL)shouldUpdateETAUpperBound;
- (SMSessionTriggerDestinationETAUpdateState)initWithCoder:(id)a3;
- (SMSessionTriggerDestinationETAUpdateState)initWithDistanceRemaining:(double)a3 distanceDifference:(double)a4 nominalTravelTimeRemaining:(double)a5 nominalTravelTimeDifference:(double)a6 nominalTravelTimeShorter:(BOOL)a7 remainingDistanceShorter:(BOOL)a8 shouldUpdateETAUpperBound:(BOOL)a9;
- (double)distanceDifference;
- (double)distanceRemaining;
- (double)nominalTravelTimeDifference;
- (double)nominalTravelTimeRemaining;
- (void)encodeWithCoder:(id)a3;
- (void)setDistanceDifference:(double)a3;
- (void)setDistanceRemaining:(double)a3;
- (void)setNominalTravelTimeDifference:(double)a3;
- (void)setNominalTravelTimeRemaining:(double)a3;
- (void)setNominalTravelTimeShorter:(BOOL)a3;
- (void)setRemainingDistanceShorter:(BOOL)a3;
- (void)setShouldUpdateETAUpperBound:(BOOL)a3;
@end

@implementation SMSessionTriggerDestinationETAUpdateState

- (SMSessionTriggerDestinationETAUpdateState)initWithDistanceRemaining:(double)a3 distanceDifference:(double)a4 nominalTravelTimeRemaining:(double)a5 nominalTravelTimeDifference:(double)a6 nominalTravelTimeShorter:(BOOL)a7 remainingDistanceShorter:(BOOL)a8 shouldUpdateETAUpperBound:(BOOL)a9
{
  v17.receiver = self;
  v17.super_class = (Class)SMSessionTriggerDestinationETAUpdateState;
  result = [(SMSessionTriggerDestinationETAUpdateState *)&v17 init];
  if (result)
  {
    result->_distanceRemaining = a3;
    result->_distanceDifference = a4;
    result->_nominalTravelTimeRemaining = a5;
    result->_nominalTravelTimeDifference = a6;
    result->_nominalTravelTimeShorter = a7;
    result->_remainingDistanceShorter = a8;
    result->_shouldUpdateETAUpperBound = a9;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSessionTriggerDestinationETAUpdateState)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"__kSMSessionTriggerDestinationETAUpdateStateDistanceRemainingKey"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"__kSMSessionTriggerDestinationETAUpdateStateDistanceDifferenceKey"];
  double v8 = v7;
  [v4 decodeDoubleForKey:@"__kSMSessionTriggerDestinationETAUpdateStateNominalTravelTimeRemainingKey"];
  double v10 = v9;
  [v4 decodeDoubleForKey:@"__kSMSessionTriggerDestinationETAUpdateStateNominalTravelTimeDifferenceKey"];
  double v12 = v11;
  uint64_t v13 = [v4 decodeBoolForKey:@"__kSMSessionTriggerDestinationETAUpdateStateNominalTravelTimeShorterKey"];
  uint64_t v14 = [v4 decodeBoolForKey:@"__kSMSessionTriggerDestinationETAUpdateStateRemainingDistanceShorterKey"];
  uint64_t v15 = [v4 decodeBoolForKey:@"__kSMSessionTriggerDestinationETAUpdateStateShouldUpdateETAUpperBoundKey"];

  return [(SMSessionTriggerDestinationETAUpdateState *)self initWithDistanceRemaining:v13 distanceDifference:v14 nominalTravelTimeRemaining:v15 nominalTravelTimeDifference:v6 nominalTravelTimeShorter:v8 remainingDistanceShorter:v10 shouldUpdateETAUpperBound:v12];
}

- (void)encodeWithCoder:(id)a3
{
  double distanceRemaining = self->_distanceRemaining;
  id v5 = a3;
  [v5 encodeDouble:@"__kSMSessionTriggerDestinationETAUpdateStateDistanceRemainingKey" forKey:distanceRemaining];
  [v5 encodeDouble:@"__kSMSessionTriggerDestinationETAUpdateStateDistanceDifferenceKey" forKey:self->_distanceDifference];
  [v5 encodeDouble:@"__kSMSessionTriggerDestinationETAUpdateStateNominalTravelTimeRemainingKey" forKey:self->_nominalTravelTimeRemaining];
  [v5 encodeDouble:@"__kSMSessionTriggerDestinationETAUpdateStateNominalTravelTimeDifferenceKey" forKey:self->_nominalTravelTimeDifference];
  [v5 encodeBool:self->_nominalTravelTimeShorter forKey:@"__kSMSessionTriggerDestinationETAUpdateStateNominalTravelTimeShorterKey"];
  [v5 encodeBool:self->_remainingDistanceShorter forKey:@"__kSMSessionTriggerDestinationETAUpdateStateRemainingDistanceShorterKey"];
  [v5 encodeBool:self->_shouldUpdateETAUpperBound forKey:@"__kSMSessionTriggerDestinationETAUpdateStateShouldUpdateETAUpperBoundKey"];
}

- (double)distanceRemaining
{
  return self->_distanceRemaining;
}

- (void)setDistanceRemaining:(double)a3
{
  self->_double distanceRemaining = a3;
}

- (double)distanceDifference
{
  return self->_distanceDifference;
}

- (void)setDistanceDifference:(double)a3
{
  self->_distanceDifference = a3;
}

- (double)nominalTravelTimeRemaining
{
  return self->_nominalTravelTimeRemaining;
}

- (void)setNominalTravelTimeRemaining:(double)a3
{
  self->_nominalTravelTimeRemaining = a3;
}

- (double)nominalTravelTimeDifference
{
  return self->_nominalTravelTimeDifference;
}

- (void)setNominalTravelTimeDifference:(double)a3
{
  self->_nominalTravelTimeDifference = a3;
}

- (BOOL)nominalTravelTimeShorter
{
  return self->_nominalTravelTimeShorter;
}

- (void)setNominalTravelTimeShorter:(BOOL)a3
{
  self->_nominalTravelTimeShorter = a3;
}

- (BOOL)remainingDistanceShorter
{
  return self->_remainingDistanceShorter;
}

- (void)setRemainingDistanceShorter:(BOOL)a3
{
  self->_remainingDistanceShorter = a3;
}

- (BOOL)shouldUpdateETAUpperBound
{
  return self->_shouldUpdateETAUpperBound;
}

- (void)setShouldUpdateETAUpperBound:(BOOL)a3
{
  self->_shouldUpdateETAUpperBound = a3;
}

@end