@interface WFNextHourPrecipitationCondition
+ (BOOL)supportsSecureCoding;
- (NSDate)validUntil;
- (WFNextHourPrecipitationCondition)initWithCoder:(id)a3;
- (WFNextHourPrecipitationCondition)initWithType:(id)a3 intensity:(double)a4 probability:(double)a5 validUntil:(id)a6;
- (double)intensity;
- (double)probability;
- (id)_stringForType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)type;
- (unint64_t)typeForString:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFNextHourPrecipitationCondition

- (WFNextHourPrecipitationCondition)initWithType:(id)a3 intensity:(double)a4 probability:(double)a5 validUntil:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)WFNextHourPrecipitationCondition;
  v12 = [(WFNextHourPrecipitationCondition *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_type = [(WFNextHourPrecipitationCondition *)v12 typeForString:v10];
    v13->_intensity = a4;
    v13->_probability = a5;
    objc_storeStrong((id *)&v13->_validUntil, a6);
  }

  return v13;
}

- (unint64_t)typeForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"clear"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"precip"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"rain"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"snow"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"sleet"])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"hail"])
  {
    unint64_t v4 = 6;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)_stringForType:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return @"unknown";
  }
  else {
    return off_264430520[a3 - 1];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 8) = self->_type;
  *(double *)(v4 + 16) = self->_intensity;
  *(double *)(v4 + 24) = self->_probability;
  uint64_t v5 = [(NSDate *)self->_validUntil copy];
  v6 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v5;

  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(WFNextHourPrecipitationCondition *)self _stringForType:[(WFNextHourPrecipitationCondition *)self type]];
  [v4 encodeObject:v6 forKey:@"WFNextHourPrecipitationConditionTypeKey"];
  [(WFNextHourPrecipitationCondition *)self intensity];
  objc_msgSend(v4, "encodeDouble:forKey:", @"WFNextHourPrecipitationConditionIntensityKey");
  [(WFNextHourPrecipitationCondition *)self probability];
  objc_msgSend(v4, "encodeDouble:forKey:", @"WFNextHourPrecipitationConditionProbabilityKey");
  uint64_t v5 = [(WFNextHourPrecipitationCondition *)self validUntil];
  [v4 encodeObject:v5 forKey:@"WFNextHourPrecipitationConditionValidUntilKey"];
}

- (WFNextHourPrecipitationCondition)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFNextHourPrecipitationConditionTypeKey"];
  [v4 decodeDoubleForKey:@"WFNextHourPrecipitationConditionIntensityKey"];
  double v7 = v6;
  [v4 decodeDoubleForKey:@"WFNextHourPrecipitationConditionProbabilityKey"];
  double v9 = v8;
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFNextHourPrecipitationConditionValidUntilKey"];

  id v11 = [(WFNextHourPrecipitationCondition *)self initWithType:v5 intensity:v10 probability:v7 validUntil:v9];
  return v11;
}

- (unint64_t)type
{
  return self->_type;
}

- (double)intensity
{
  return self->_intensity;
}

- (double)probability
{
  return self->_probability;
}

- (NSDate)validUntil
{
  return self->_validUntil;
}

- (void).cxx_destruct
{
}

@end