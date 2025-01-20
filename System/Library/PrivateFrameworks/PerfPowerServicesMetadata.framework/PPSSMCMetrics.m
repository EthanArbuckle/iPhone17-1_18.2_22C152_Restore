@interface PPSSMCMetrics
+ (id)allDeclMetrics;
+ (id)smcMetrics;
+ (id)subsystem;
@end

@implementation PPSSMCMetrics

+ (id)subsystem
{
  return @"SMC";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() smcMetrics];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (id)smcMetrics
{
  v19[2] = *MEMORY[0x263EF8340];
  v18[0] = @"MetricType";
  v2 = +[PPSMetricType genericDimension];
  v18[1] = @"AuxiliaryType";
  v19[0] = v2;
  v19[1] = &unk_270701CC8;
  v3 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

  v4 = [PPSMetric alloc];
  v5 = +[PPSUnit dimensionless];
  v6 = +[PPSCadence cadenceEventXPCWithFrequency:3];
  v7 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v4, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Key", @"SMC", @"InstantKeys", 3, v5, v6, 1.0, 0x200000002, 0x100000001, 0x300000001, 0x100000001, v3);

  v16[0] = @"MetricType";
  v8 = +[PPSMetricType absoluteMeasure];
  v16[1] = @"AuxiliaryType";
  v17[0] = v8;
  v17[1] = &unk_270701CC8;
  v9 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit dimensionless];
  v12 = [(PPSMetric *)v10 initWithName:@"Value" version:8 datatype:v11 unit:v7 baseMetric:v9 optionalPayload:1.0];

  v15[0] = v7;
  v15[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];

  return v13;
}

@end