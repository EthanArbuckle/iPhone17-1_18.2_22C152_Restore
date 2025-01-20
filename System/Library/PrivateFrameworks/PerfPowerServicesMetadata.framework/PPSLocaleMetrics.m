@interface PPSLocaleMetrics
+ (id)allDeclMetrics;
+ (id)subsystem;
+ (id)timezoneLoggingCadence;
+ (id)timezoneMetrics;
@end

@implementation PPSLocaleMetrics

+ (id)subsystem
{
  return @"LocaleMetrics";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() timezoneMetrics];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (id)timezoneMetrics
{
  v15[3] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSLocaleMetrics subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSLocaleMetrics timezoneLoggingCadence];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"TimeZoneName", v3, @"TimeZone", 3, v4, v5, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit seconds];
  v9 = [(PPSMetric *)v7 initWithName:@"SecondsFromGMT" version:7 datatype:v8 unit:v6 baseMetric:0 optionalPayload:1.0];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit dimensionless];
  v12 = [(PPSMetric *)v10 initWithName:@"TimeZoneIsInDST" version:5 datatype:v11 unit:v6 baseMetric:0 optionalPayload:1.0];

  v15[0] = v6;
  v15[1] = v9;
  v15[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];

  return v13;
}

+ (id)timezoneLoggingCadence
{
  v10[2] = *MEMORY[0x263EF8340];
  v2 = [[PPSCadenceTuple alloc] initWithCadenceType:4 value:0];
  v3 = [[PPSCadenceTuple alloc] initWithCadenceType:3 value:10];
  v4 = v3;
  v5 = 0;
  if (v2) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    v7 = [PPSCadence alloc];
    v10[0] = v2;
    v10[1] = v4;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    v5 = [(PPSCadence *)v7 initWithCadenceTuples:v8];
  }
  return v5;
}

@end