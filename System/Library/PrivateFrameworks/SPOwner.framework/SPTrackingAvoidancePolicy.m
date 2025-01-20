@interface SPTrackingAvoidancePolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)allowNavGeoHintAsPrivateVehicleHint;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAlertImmediatelyForImmediateTypes;
- (BOOL)surfaceImmediatelyBetweenBackstopAndKeyroll;
- (SPTrackingAvoidancePolicy)initWithCoder:(id)a3;
- (SPTrackingAvoidancePolicy)initWithType:(int64_t)a3 expiryTimeInterval:(double)a4 keepAliveInterval:(double)a5 minimumStagingInterval:(double)a6 stagingBackstopHour:(int64_t)a7 assumedKeyRollHour:(int64_t)a8 scanInterval:(double)a9 surfaceImmediatelyBetweenBackstopAndKeyroll:(BOOL)a10 maxExpectedWildInterval:(double)a11 shouldAlertImmediatelyForImmediateTypes:(BOOL)a12 durationOfConsideration:(double)a13 thresholdOfLocationRelevance:(double)a14 thresholdOfSignificantDuration:(double)a15 thresholdOfSignificantDistance:(double)a16 capOfReasonableWalkingSpeed:(double)a17 allowNavGeoHintAsPrivateVehicleHint:(BOOL)a18;
- (double)capOfReasonableWalkingSpeed;
- (double)durationOfConsideration;
- (double)expiryTimeInterval;
- (double)keepAliveInterval;
- (double)maxExpectedWildInterval;
- (double)minimumStagingInterval;
- (double)purgeTimeInterval;
- (double)scanInterval;
- (double)thresholdOfLocationRelevance;
- (double)thresholdOfSignificantDistance;
- (double)thresholdOfSignificantDuration;
- (id)description;
- (int64_t)assumedKeyRollHour;
- (int64_t)stagingBackstopHour;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowNavGeoHintAsPrivateVehicleHint:(BOOL)a3;
- (void)setAssumedKeyRollHour:(int64_t)a3;
- (void)setCapOfReasonableWalkingSpeed:(double)a3;
- (void)setDurationOfConsideration:(double)a3;
- (void)setExpiryTimeInterval:(double)a3;
- (void)setKeepAliveInterval:(double)a3;
- (void)setMaxExpectedWildInterval:(double)a3;
- (void)setMinimumStagingInterval:(double)a3;
- (void)setPurgeTimeInterval:(double)a3;
- (void)setScanInterval:(double)a3;
- (void)setShouldAlertImmediatelyForImmediateTypes:(BOOL)a3;
- (void)setStagingBackstopHour:(int64_t)a3;
- (void)setSurfaceImmediatelyBetweenBackstopAndKeyroll:(BOOL)a3;
- (void)setThresholdOfLocationRelevance:(double)a3;
- (void)setThresholdOfSignificantDistance:(double)a3;
- (void)setThresholdOfSignificantDuration:(double)a3;
- (void)setType:(int64_t)a3;
@end

@implementation SPTrackingAvoidancePolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPTrackingAvoidancePolicy)initWithType:(int64_t)a3 expiryTimeInterval:(double)a4 keepAliveInterval:(double)a5 minimumStagingInterval:(double)a6 stagingBackstopHour:(int64_t)a7 assumedKeyRollHour:(int64_t)a8 scanInterval:(double)a9 surfaceImmediatelyBetweenBackstopAndKeyroll:(BOOL)a10 maxExpectedWildInterval:(double)a11 shouldAlertImmediatelyForImmediateTypes:(BOOL)a12 durationOfConsideration:(double)a13 thresholdOfLocationRelevance:(double)a14 thresholdOfSignificantDuration:(double)a15 thresholdOfSignificantDistance:(double)a16 capOfReasonableWalkingSpeed:(double)a17 allowNavGeoHintAsPrivateVehicleHint:(BOOL)a18
{
  v32.receiver = self;
  v32.super_class = (Class)SPTrackingAvoidancePolicy;
  result = [(SPTrackingAvoidancePolicy *)&v32 init];
  if (result)
  {
    result->_type = a3;
    result->_expiryTimeInterval = a4;
    result->_keepAliveInterval = a5;
    result->_minimumStagingInterval = a6;
    result->_stagingBackstopHour = a7;
    result->_assumedKeyRollHour = a8;
    result->_scanInterval = a9;
    result->_surfaceImmediatelyBetweenBackstopAndKeyroll = a10;
    result->_shouldAlertImmediatelyForImmediateTypes = a12;
    result->_durationOfConsideration = a13;
    result->_thresholdOfLocationRelevance = a14;
    result->_thresholdOfSignificantDuration = a15;
    result->_thresholdOfSignificantDistance = a16;
    result->_capOfReasonableWalkingSpeed = a17;
    result->_allowNavGeoHintAsPrivateVehicleHint = a18;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SPTrackingAvoidancePolicy *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(SPTrackingAvoidancePolicy *)self type];
      uint64_t v7 = [(SPTrackingAvoidancePolicy *)v5 type];

      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeDouble:@"expiryTimeInterval" forKey:self->_expiryTimeInterval];
  [v5 encodeDouble:@"keepAliveInterval" forKey:self->_keepAliveInterval];
  [v5 encodeDouble:@"minimumStagingInterval" forKey:self->_minimumStagingInterval];
  [v5 encodeInteger:self->_stagingBackstopHour forKey:@"stagingBackstopHour"];
  [v5 encodeInteger:self->_assumedKeyRollHour forKey:@"assumedKeyRollHour"];
  [v5 encodeBool:self->_surfaceImmediatelyBetweenBackstopAndKeyroll forKey:@"surfaceImmediatelyBetweenBackstopAndKeyroll"];
  [v5 encodeDouble:@"maxExpectedWildInterval" forKey:self->_maxExpectedWildInterval];
  [v5 encodeBool:self->_shouldAlertImmediatelyForImmediateTypes forKey:@"shouldAlertImmediatelyForImmediateTypes"];
  [v5 encodeDouble:@"durationOfConsideration" forKey:self->_durationOfConsideration];
  [v5 encodeDouble:@"thresholdOfLocationRelevance" forKey:self->_thresholdOfLocationRelevance];
  [v5 encodeDouble:@"thresholdOfSignificantDuration" forKey:self->_thresholdOfSignificantDuration];
  [v5 encodeDouble:@"thresholdOfSignificantDistance" forKey:self->_thresholdOfSignificantDistance];
  [v5 encodeDouble:@"capOfReasonableWalkingSpeed" forKey:self->_capOfReasonableWalkingSpeed];
  [v5 encodeBool:self->_allowNavGeoHintAsPrivateVehicleHint forKey:@"allowNavGeoHintAsPrivateVehicleHint"];
}

- (SPTrackingAvoidancePolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SPTrackingAvoidancePolicy;
  id v5 = [(SPTrackingAvoidancePolicy *)&v16 init];
  if (v5)
  {
    v5->_int64_t type = [v4 decodeIntegerForKey:@"type"];
    [v4 decodeDoubleForKey:@"expiryTimeInterval"];
    v5->_expiryTimeInterval = v6;
    [v4 decodeDoubleForKey:@"keepAliveInterval"];
    v5->_keepAliveInterval = v7;
    [v4 decodeDoubleForKey:@"minimumStagingInterval"];
    v5->_minimumStagingInterval = v8;
    v5->_stagingBackstopHour = [v4 decodeIntegerForKey:@"stagingBackstopHour"];
    v5->_assumedKeyRollHour = [v4 decodeIntegerForKey:@"assumedKeyRollHour"];
    v5->_surfaceImmediatelyBetweenBackstopAndKeyroll = [v4 decodeBoolForKey:@"surfaceImmediatelyBetweenBackstopAndKeyroll"];
    [v4 decodeDoubleForKey:@"maxExpectedWildInterval"];
    v5->_maxExpectedWildInterval = v9;
    v5->_shouldAlertImmediatelyForImmediateTypes = [v4 decodeBoolForKey:@"shouldAlertImmediatelyForImmediateTypes"];
    [v4 decodeDoubleForKey:@"durationOfConsideration"];
    v5->_durationOfConsideration = v10;
    [v4 decodeDoubleForKey:@"thresholdOfLocationRelevance"];
    v5->_thresholdOfLocationRelevance = v11;
    [v4 decodeDoubleForKey:@"thresholdOfSignificantDuration"];
    v5->_thresholdOfSignificantDuration = v12;
    [v4 decodeDoubleForKey:@"thresholdOfSignificantDistance"];
    v5->_thresholdOfSignificantDistance = v13;
    [v4 decodeDoubleForKey:@"capOfReasonableWalkingSpeed"];
    v5->_capOfReasonableWalkingSpeed = v14;
    v5->_allowNavGeoHintAsPrivateVehicleHint = [v4 decodeBoolForKey:@"allowNavGeoHintAsPrivateVehicleHint"];
  }

  return v5;
}

- (id)description
{
  unint64_t type = self->_type;
  if (type > 2) {
    v3 = 0;
  }
  else {
    v3 = off_1E601D388[type];
  }
  id v4 = (void *)[[NSString alloc] initWithFormat:@"Policy type: %@", v3];

  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_unint64_t type = a3;
}

- (double)expiryTimeInterval
{
  return self->_expiryTimeInterval;
}

- (void)setExpiryTimeInterval:(double)a3
{
  self->_expiryTimeInterval = a3;
}

- (double)purgeTimeInterval
{
  return self->_purgeTimeInterval;
}

- (void)setPurgeTimeInterval:(double)a3
{
  self->_purgeTimeInterval = a3;
}

- (double)keepAliveInterval
{
  return self->_keepAliveInterval;
}

- (void)setKeepAliveInterval:(double)a3
{
  self->_keepAliveInterval = a3;
}

- (double)minimumStagingInterval
{
  return self->_minimumStagingInterval;
}

- (void)setMinimumStagingInterval:(double)a3
{
  self->_minimumStagingInterval = a3;
}

- (int64_t)stagingBackstopHour
{
  return self->_stagingBackstopHour;
}

- (void)setStagingBackstopHour:(int64_t)a3
{
  self->_stagingBackstopHour = a3;
}

- (int64_t)assumedKeyRollHour
{
  return self->_assumedKeyRollHour;
}

- (void)setAssumedKeyRollHour:(int64_t)a3
{
  self->_assumedKeyRollHour = a3;
}

- (double)scanInterval
{
  return self->_scanInterval;
}

- (void)setScanInterval:(double)a3
{
  self->_scanInterval = a3;
}

- (BOOL)surfaceImmediatelyBetweenBackstopAndKeyroll
{
  return self->_surfaceImmediatelyBetweenBackstopAndKeyroll;
}

- (void)setSurfaceImmediatelyBetweenBackstopAndKeyroll:(BOOL)a3
{
  self->_surfaceImmediatelyBetweenBackstopAndKeyroll = a3;
}

- (double)maxExpectedWildInterval
{
  return self->_maxExpectedWildInterval;
}

- (void)setMaxExpectedWildInterval:(double)a3
{
  self->_maxExpectedWildInterval = a3;
}

- (BOOL)shouldAlertImmediatelyForImmediateTypes
{
  return self->_shouldAlertImmediatelyForImmediateTypes;
}

- (void)setShouldAlertImmediatelyForImmediateTypes:(BOOL)a3
{
  self->_shouldAlertImmediatelyForImmediateTypes = a3;
}

- (double)durationOfConsideration
{
  return self->_durationOfConsideration;
}

- (void)setDurationOfConsideration:(double)a3
{
  self->_durationOfConsideration = a3;
}

- (double)thresholdOfLocationRelevance
{
  return self->_thresholdOfLocationRelevance;
}

- (void)setThresholdOfLocationRelevance:(double)a3
{
  self->_thresholdOfLocationRelevance = a3;
}

- (double)thresholdOfSignificantDuration
{
  return self->_thresholdOfSignificantDuration;
}

- (void)setThresholdOfSignificantDuration:(double)a3
{
  self->_thresholdOfSignificantDuration = a3;
}

- (double)thresholdOfSignificantDistance
{
  return self->_thresholdOfSignificantDistance;
}

- (void)setThresholdOfSignificantDistance:(double)a3
{
  self->_thresholdOfSignificantDistance = a3;
}

- (double)capOfReasonableWalkingSpeed
{
  return self->_capOfReasonableWalkingSpeed;
}

- (void)setCapOfReasonableWalkingSpeed:(double)a3
{
  self->_capOfReasonableWalkingSpeed = a3;
}

- (BOOL)allowNavGeoHintAsPrivateVehicleHint
{
  return self->_allowNavGeoHintAsPrivateVehicleHint;
}

- (void)setAllowNavGeoHintAsPrivateVehicleHint:(BOOL)a3
{
  self->_allowNavGeoHintAsPrivateVehicleHint = a3;
}

@end