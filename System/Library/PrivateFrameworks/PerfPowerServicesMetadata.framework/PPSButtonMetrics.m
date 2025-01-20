@interface PPSButtonMetrics
+ (id)allDeclMetrics;
+ (id)captureButtonAction;
+ (id)captureButtonConfig;
+ (id)subsystem;
@end

@implementation PPSButtonMetrics

+ (id)subsystem
{
  return @"Button";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() captureButtonConfig];
  [v2 addObjectsFromArray:v3];

  v4 = [(id)objc_opt_class() captureButtonAction];
  [v2 addObjectsFromArray:v4];

  return v2;
}

+ (id)captureButtonConfig
{
  v13[2] = *MEMORY[0x263EF8340];
  v12[0] = @"DMACompliant";
  v12[1] = @"MetricType";
  v13[0] = MEMORY[0x263EFFA80];
  v2 = +[PPSMetricType genericDimension];
  v13[1] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  v4 = [PPSMetric alloc];
  v5 = +[PPSButtonMetrics subsystem];
  v6 = +[PPSUnit dimensionless];
  v7 = +[PPSCadence cadenceEventXPCWithFrequency:1];
  v8 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v4, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Config", v5, @"CaptureButtonConfig", 3, v6, v7, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v3);

  v11 = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];

  return v9;
}

+ (id)captureButtonAction
{
  v18[4] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSButtonMetrics subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"FullPress", v3, @"CaptureButtonAction", 7, v4, v5, 1.0, 0x200000004, 0x100000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit dimensionless];
  v9 = [(PPSMetric *)v7 initWithName:@"HalfPress" version:7 datatype:v8 unit:v6 baseMetric:0 optionalPayload:1.0];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit dimensionless];
  v12 = [(PPSMetric *)v10 initWithName:@"Touch" version:7 datatype:v11 unit:v6 baseMetric:0 optionalPayload:1.0];

  v13 = [PPSMetric alloc];
  v14 = +[PPSUnit seconds];
  v15 = [(PPSMetric *)v13 initWithName:@"TouchTimeInterval" version:7 datatype:v14 unit:v6 baseMetric:0 optionalPayload:1.0];

  v18[0] = v12;
  v18[1] = v9;
  v18[2] = v6;
  v18[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];

  return v16;
}

@end