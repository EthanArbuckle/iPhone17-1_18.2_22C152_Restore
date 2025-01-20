@interface CSKappaTap2RadarConfiguration
+ (id)tap2RadarDefaultConfiguration;
+ (id)tap2RadarUserConfiguration;
- (BOOL)allowOnBattery;
- (CSKappaTap2RadarConfiguration)initWithAllowOnBattery:(BOOL)a3 checkIntervalInSeconds:(int64_t)a4 coolDownPeriodInSeconds:(int64_t)a5;
- (int64_t)checkIntervalInSeconds;
- (int64_t)coolDownPeriodInSeconds;
@end

@implementation CSKappaTap2RadarConfiguration

- (CSKappaTap2RadarConfiguration)initWithAllowOnBattery:(BOOL)a3 checkIntervalInSeconds:(int64_t)a4 coolDownPeriodInSeconds:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CSKappaTap2RadarConfiguration;
  result = [(CSKappaTap2RadarConfiguration *)&v9 init];
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
  if (qword_1003DD638 != -1) {
    dispatch_once(&qword_1003DD638, &stru_10039B0E0);
  }
  v2 = (void *)qword_1003DD628;

  return v2;
}

+ (id)tap2RadarUserConfiguration
{
  if (qword_1003DD640 != -1) {
    dispatch_once(&qword_1003DD640, &stru_10039B100);
  }
  v2 = +[CSPersistentConfiguration sharedConfiguration];
  unsigned __int8 v3 = [v2 BOOLForKey:@"CSKappaTap2RadarAllowOnBattery"];
  id v4 = [v2 integerForKey:@"CSKappaTap2RadarCheckIntervalInSeconds"];
  id v5 = [v2 integerForKey:@"CSKappaTap2RadarCoolDownPeriodInSeconds"];
  v6 = (void *)qword_1003DD630;
  *(unsigned char *)(qword_1003DD630 + 8) = v3;
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