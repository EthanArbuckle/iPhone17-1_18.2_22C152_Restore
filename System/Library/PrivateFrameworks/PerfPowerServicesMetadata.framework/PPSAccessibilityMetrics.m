@interface PPSAccessibilityMetrics
+ (id)allDeclMetrics;
+ (id)eyeTrackingMetrics;
+ (id)motionCuesEnabledMetrics;
+ (id)subsystem;
+ (id)zoomEnabledMetrics;
@end

@implementation PPSAccessibilityMetrics

+ (id)subsystem
{
  return @"AccessibilityMetrics";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() eyeTrackingMetrics];
  [v2 addObjectsFromArray:v3];

  v4 = [(id)objc_opt_class() motionCuesEnabledMetrics];
  [v2 addObjectsFromArray:v4];

  v5 = [(id)objc_opt_class() zoomEnabledMetrics];
  [v2 addObjectsFromArray:v5];

  return v2;
}

+ (id)eyeTrackingMetrics
{
  v18[3] = *MEMORY[0x263EF8340];
  v17[0] = @"EnumMapping";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v15[0] = v2;
  v16[0] = @"Disabled";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v15[1] = v3;
  v16[1] = @"Enabled";
  v4 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v4;
  v17[1] = @"MetricType";
  v5 = +[PPSMetricType stateDimension];
  v17[2] = @"FilterEntryLogging";
  v18[1] = v5;
  v18[2] = MEMORY[0x263EFFA88];
  v6 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

  v7 = [PPSMetric alloc];
  v8 = +[PPSAccessibilityMetrics subsystem];
  v9 = +[PPSUnit dimensionless];
  v10 = +[PPSCadence cadenceInit];
  v11 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Enabled", v8, @"EyeTracking", 5, v9, v10, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v6);

  v14 = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];

  return v12;
}

+ (id)motionCuesEnabledMetrics
{
  v18[2] = *MEMORY[0x263EF8340];
  v17[0] = @"EnumMapping";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v15[0] = v2;
  v16[0] = @"Disabled";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v15[1] = v3;
  v16[1] = @"Enabled";
  v4 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v4;
  v17[1] = @"MetricType";
  v5 = +[PPSMetricType stateDimension];
  v18[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

  v7 = [PPSMetric alloc];
  v8 = +[PPSAccessibilityMetrics subsystem];
  v9 = +[PPSUnit dimensionless];
  v10 = +[PPSCadence cadenceInit];
  v11 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Enabled", v8, @"MotionCuesEnabled", 5, v9, v10, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v6);

  v14 = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];

  return v12;
}

+ (id)zoomEnabledMetrics
{
  v18[2] = *MEMORY[0x263EF8340];
  v17[0] = @"EnumMapping";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v15[0] = v2;
  v16[0] = @"Disabled";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v15[1] = v3;
  v16[1] = @"Enabled";
  v4 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v4;
  v17[1] = @"MetricType";
  v5 = +[PPSMetricType stateDimension];
  v18[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

  v7 = [PPSMetric alloc];
  v8 = +[PPSAccessibilityMetrics subsystem];
  v9 = +[PPSUnit dimensionless];
  v10 = +[PPSCadence cadenceInit];
  v11 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Enabled", v8, @"ZoomEnabled", 5, v9, v10, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v6);

  v14 = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];

  return v12;
}

@end