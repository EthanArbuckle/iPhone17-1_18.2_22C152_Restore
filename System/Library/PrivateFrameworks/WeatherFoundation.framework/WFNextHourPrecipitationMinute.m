@interface WFNextHourPrecipitationMinute
+ (BOOL)supportsSecureCoding;
- (NSDate)date;
- (WFNextHourPrecipitationMinute)initWithCoder:(id)a3;
- (WFNextHourPrecipitationMinute)initWithIntensity:(double)a3 chance:(double)a4 perceivedIntensity:(double)a5 date:(id)a6;
- (double)chance;
- (double)intensity;
- (double)perceivedIntensity;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFNextHourPrecipitationMinute

- (WFNextHourPrecipitationMinute)initWithIntensity:(double)a3 chance:(double)a4 perceivedIntensity:(double)a5 date:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)WFNextHourPrecipitationMinute;
  v12 = [(WFNextHourPrecipitationMinute *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_intensity = a3;
    v12->_chance = a4;
    v12->_perceivedIntensity = a5;
    objc_storeStrong((id *)&v12->_date, a6);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v4 + 8) = self->_intensity;
  *(double *)(v4 + 16) = self->_chance;
  *(double *)(v4 + 24) = self->_perceivedIntensity;
  uint64_t v5 = [(NSDate *)self->_date copy];
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
  [(WFNextHourPrecipitationMinute *)self intensity];
  objc_msgSend(v4, "encodeDouble:forKey:", @"WFNextHourPrecipitationMinuteIntensityKey");
  [(WFNextHourPrecipitationMinute *)self chance];
  objc_msgSend(v4, "encodeDouble:forKey:", @"WFNextHourPrecipitationMinuteChanceKey");
  [(WFNextHourPrecipitationMinute *)self perceivedIntensity];
  objc_msgSend(v4, "encodeDouble:forKey:", @"WFNextHourPrecipitationMinutePerceivedIntensityKey");
  id v5 = [(WFNextHourPrecipitationMinute *)self date];
  [v4 encodeObject:v5 forKey:@"WFNextHourPrecipitationMinuteDateKey"];
}

- (WFNextHourPrecipitationMinute)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"WFNextHourPrecipitationMinuteIntensityKey"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"WFNextHourPrecipitationMinuteChanceKey"];
  double v8 = v7;
  [v4 decodeDoubleForKey:@"WFNextHourPrecipitationMinutePerceivedIntensityKey"];
  double v10 = v9;
  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFNextHourPrecipitationMinuteDateKey"];

  v12 = [(WFNextHourPrecipitationMinute *)self initWithIntensity:v11 chance:v6 perceivedIntensity:v8 date:v10];
  return v12;
}

- (double)intensity
{
  return self->_intensity;
}

- (double)chance
{
  return self->_chance;
}

- (double)perceivedIntensity
{
  return self->_perceivedIntensity;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
}

@end