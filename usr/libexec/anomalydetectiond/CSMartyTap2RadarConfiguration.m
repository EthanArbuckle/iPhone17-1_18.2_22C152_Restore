@interface CSMartyTap2RadarConfiguration
+ (id)tap2RadarDefaultConfiguration;
+ (id)tap2RadarUserConfiguration;
- (BOOL)allowOnBattery;
- (CSMartyTap2RadarConfiguration)initWithAllowOnBattery:(BOOL)a3 checkIntervalInSeconds:(int64_t)a4 coolDownPeriodInSeconds:(int64_t)a5;
- (int64_t)checkIntervalInSeconds;
- (int64_t)coolDownPeriodInSeconds;
@end

@implementation CSMartyTap2RadarConfiguration

- (CSMartyTap2RadarConfiguration)initWithAllowOnBattery:(BOOL)a3 checkIntervalInSeconds:(int64_t)a4 coolDownPeriodInSeconds:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CSMartyTap2RadarConfiguration;
  result = [(CSMartyTap2RadarConfiguration *)&v9 init];
  if (result)
  {
    result->_allowOnBattery = a3;
    result->_checkIntervalInSeconds = a4;
    result->_coolDownPeriodInSeconds = a5;
  }
  return result;
}

+ (id)tap2RadarDefaultConfiguration
{
  if (qword_1003DD6C8 != -1) {
    dispatch_once(&qword_1003DD6C8, &stru_10039C088);
  }
  v2 = (void *)qword_1003DD6B8;

  return v2;
}

+ (id)tap2RadarUserConfiguration
{
  if (qword_1003DD6D0 != -1) {
    dispatch_once(&qword_1003DD6D0, &stru_10039C0A8);
  }
  v2 = +[CSPersistentConfiguration sharedConfiguration];
  unsigned __int8 v3 = [v2 BOOLForKey:@"CSMartyTap2RadarAllowOnBattery"];
  id v4 = [v2 integerForKey:@"CSMartyTap2RadarCheckIntervalInSeconds"];
  id v5 = [v2 integerForKey:@"CSMartyTap2RadarCoolDownPeriodInSeconds"];
  v6 = (void *)qword_1003DD6C0;
  *(unsigned char *)(qword_1003DD6C0 + 8) = v3;
  if (v4) {
    v6[2] = v4;
  }
  if (v5) {
    v6[3] = v5;
  }
  v7 = v6;

  return v7;
}

- (BOOL)allowOnBattery
{
  return self->_allowOnBattery;
}

- (int64_t)checkIntervalInSeconds
{
  return self->_checkIntervalInSeconds;
}

- (int64_t)coolDownPeriodInSeconds
{
  return self->_coolDownPeriodInSeconds;
}

@end