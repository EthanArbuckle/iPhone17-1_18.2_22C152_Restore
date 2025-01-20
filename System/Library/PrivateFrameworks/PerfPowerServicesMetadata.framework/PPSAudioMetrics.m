@interface PPSAudioMetrics
+ (id)allDeclMetrics;
+ (id)singMetrics;
+ (id)subsystem;
@end

@implementation PPSAudioMetrics

+ (id)subsystem
{
  return @"Audio";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() singMetrics];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (id)singMetrics
{
  v12[1] = *MEMORY[0x263EF8340];
  v11 = @"MetricType";
  v2 = +[PPSMetricType stateDimension];
  v12[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];

  v4 = [PPSMetric alloc];
  v5 = +[PPSUnit dimensionless];
  v6 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v7 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v4, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Enabled", @"Audio", @"Sing", 5, v5, v6, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v3);

  v10 = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];

  return v8;
}

@end