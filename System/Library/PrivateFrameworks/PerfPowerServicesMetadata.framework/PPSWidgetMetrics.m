@interface PPSWidgetMetrics
+ (id)allDeclMetrics;
+ (id)relevanceContextUpdate;
+ (id)subsystem;
@end

@implementation PPSWidgetMetrics

+ (id)subsystem
{
  return @"Widget";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() relevanceContextUpdate];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (id)relevanceContextUpdate
{
  v21[1] = *MEMORY[0x263EF8340];
  v20 = @"MetricType";
  v2 = +[PPSMetricType genericDimension];
  v21[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];

  v4 = [PPSMetric alloc];
  v5 = +[PPSUnit dimensionless];
  v6 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v7 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v4, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"bundleID", @"Widget", @"RelevanceContextUpdate", 3, v5, v6, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v3);

  v8 = [PPSMetric alloc];
  v9 = +[PPSUnit milliseconds];
  v10 = [(PPSMetric *)v8 initWithName:@"executionTime" version:7 datatype:v9 unit:v7 baseMetric:0 optionalPayload:1.0];

  v11 = [PPSMetric alloc];
  v12 = +[PPSUnit dimensionless];
  v13 = [(PPSMetric *)v11 initWithName:@"kind" version:3 datatype:v12 unit:v7 baseMetric:v3 optionalPayload:1.0];

  v14 = [PPSMetric alloc];
  v15 = +[PPSUnit dimensionless];
  v16 = [(PPSMetric *)v14 initWithName:@"relevanceCount" version:7 datatype:v15 unit:v7 baseMetric:0 optionalPayload:1.0];

  v19[0] = v7;
  v19[1] = v10;
  v19[2] = v13;
  v19[3] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:4];

  return v17;
}

@end