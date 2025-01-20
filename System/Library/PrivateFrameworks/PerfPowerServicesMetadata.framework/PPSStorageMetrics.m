@interface PPSStorageMetrics
+ (id)allDeclMetrics;
+ (id)configMetrics;
+ (id)configurationMetrics;
+ (id)subsystem;
+ (id)timeOffsetMetrics;
+ (id)timezoneLoggingCadence;
+ (id)timezoneMetrics;
@end

@implementation PPSStorageMetrics

+ (id)subsystem
{
  return @"PPTStorageOperator";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() timeOffsetMetrics];
  [v2 addObjectsFromArray:v3];

  v4 = [(id)objc_opt_class() configMetrics];
  [v2 addObjectsFromArray:v4];

  v5 = [(id)objc_opt_class() configurationMetrics];
  [v2 addObjectsFromArray:v5];

  v6 = [(id)objc_opt_class() timezoneMetrics];
  [v2 addObjectsFromArray:v6];

  return v2;
}

+ (id)timeOffsetMetrics
{
  v24[3] = *MEMORY[0x263EF8340];
  v2 = [[PPSCadenceTuple alloc] initWithCadenceType:4 value:0];
  v3 = [[PPSCadenceTuple alloc] initWithCadenceType:3 value:5];
  v4 = [[PPSCadenceTuple alloc] initWithCadenceType:3 value:6];
  v5 = v4;
  v6 = 0;
  if (v2) {
    BOOL v7 = v3 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7 && v4 != 0)
  {
    v9 = [PPSCadence alloc];
    v24[0] = v2;
    v24[1] = v3;
    v24[2] = v5;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:3];
    v6 = [(PPSCadence *)v9 initWithCadenceTuples:v10];
  }
  v11 = [PPSMetric alloc];
  v12 = [(id)objc_opt_class() subsystem];
  v13 = +[PPSUnit seconds];
  v14 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v11, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"system", v12, @"TimeOffset", 8, v13, v6, 2.0, 0x100000003, 0x100000447, 0x300000001, 0x100000001, 0);

  v15 = [PPSMetric alloc];
  v16 = +[PPSUnit seconds];
  v17 = [(PPSMetric *)v15 initWithName:@"kernel" version:8 datatype:v16 unit:v14 baseMetric:0 optionalPayload:2.0];

  v18 = [PPSMetric alloc];
  v19 = +[PPSUnit seconds];
  v20 = [(PPSMetric *)v18 initWithName:@"baseband" version:8 datatype:v19 unit:v14 baseMetric:0 optionalPayload:2.0];

  v23[0] = v14;
  v23[1] = v17;
  v23[2] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:3];

  return v21;
}

+ (id)configMetrics
{
  v13[1] = *MEMORY[0x263EF8340];
  v2 = [[PPSCadenceTuple alloc] initWithCadenceType:3 value:7];
  if (v2)
  {
    v3 = [PPSCadence alloc];
    v13[0] = v2;
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    v5 = [(PPSCadence *)v3 initWithCadenceTuples:v4];
  }
  else
  {
    v5 = 0;
  }
  v6 = [PPSMetric alloc];
  BOOL v7 = [(id)objc_opt_class() subsystem];
  v8 = +[PPSUnit dimensionless];
  v9 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v6, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"build", v7, @"Config", 3, v8, v5, 1.0, 0x100000001, 0x100000447, 0x300000001, 0x100000001, 0);

  v12 = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];

  return v10;
}

+ (id)configurationMetrics
{
  v13[1] = *MEMORY[0x263EF8340];
  v2 = [[PPSCadenceTuple alloc] initWithCadenceType:4 value:0];
  if (v2)
  {
    v3 = [PPSCadence alloc];
    v13[0] = v2;
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    v5 = [(PPSCadence *)v3 initWithCadenceTuples:v4];
  }
  else
  {
    v5 = 0;
  }
  v6 = [PPSMetric alloc];
  BOOL v7 = [(id)objc_opt_class() subsystem];
  v8 = +[PPSUnit dimensionless];
  v9 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v6, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"preUnlock", v7, @"Configuration", 5, v8, v5, 1.0, 0x100000002, 0x100000447, 0x300000001, 0x100000001, 0);

  v12 = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];

  return v10;
}

+ (id)timezoneMetrics
{
  v20[4] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = [(id)objc_opt_class() subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSStorageMetrics timezoneLoggingCadence];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"CountryCode", v3, @"Locale", 3, v4, v5, 2.0, 0x100000003, 0x10000001ELL, 0x300000001, 0x100000001, 0);

  BOOL v7 = [PPSMetric alloc];
  v8 = [(id)objc_opt_class() subsystem];
  v9 = +[PPSUnit seconds];
  v10 = +[PPSStorageMetrics timezoneLoggingCadence];
  v11 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"SecondsFromGMT", v8, @"Locale", 7, v9, v10, 2.0, 0x100000003, 0x100000447, 0x300000001, 0x100000001, 0);

  v12 = [PPSMetric alloc];
  v13 = +[PPSUnit dimensionless];
  v14 = [(PPSMetric *)v12 initWithName:@"TimeZoneIsInDST" version:5 datatype:v13 unit:v11 baseMetric:0 optionalPayload:2.0];

  v15 = [PPSMetric alloc];
  v16 = +[PPSUnit dimensionless];
  v17 = [(PPSMetric *)v15 initWithName:@"Trigger" version:3 datatype:v16 unit:v6 baseMetric:0 optionalPayload:2.0];

  v20[0] = v6;
  v20[1] = v11;
  v20[2] = v14;
  v20[3] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:4];

  return v18;
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
    BOOL v7 = [PPSCadence alloc];
    v10[0] = v2;
    v10[1] = v4;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    v5 = [(PPSCadence *)v7 initWithCadenceTuples:v8];
  }
  return v5;
}

@end