@interface PPSCoreRoutineMetrics
+ (id)allDeclMetrics;
+ (id)checkInSessionMetrics;
+ (id)subsystem;
@end

@implementation PPSCoreRoutineMetrics

+ (id)subsystem
{
  return @"CoreRoutine";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() checkInSessionMetrics];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (id)checkInSessionMetrics
{
  v44[1] = *MEMORY[0x263EF8340];
  v43 = @"MetricType";
  v2 = +[PPSMetricType genericDimension];
  v44[0] = v2;
  v31 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];

  v3 = [PPSMetric alloc];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v3, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"sessionid", @"CoreRoutine", @"CheckInSession", 3, v4, v5, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v31);

  v41[0] = @"EnumMapping";
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v39[0] = v7;
  v40[0] = @"Start";
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v39[1] = v8;
  v40[1] = @"Stop";
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v39[2] = v9;
  v40[2] = @"Unknown";
  v10 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:3];
  v41[1] = @"MetricType";
  v42[0] = v10;
  v11 = +[PPSMetricType stateDimension];
  v42[1] = v11;
  v30 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];

  v12 = [PPSMetric alloc];
  v13 = +[PPSUnit dimensionless];
  v14 = [(PPSMetric *)v12 initWithName:@"event" version:7 datatype:v13 unit:v6 baseMetric:v30 optionalPayload:1.0];

  v37[0] = @"EnumMapping";
  v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v35[0] = v15;
  v36[0] = @"TimeBased";
  v16 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v35[1] = v16;
  v36[1] = @"DestinationBased";
  v17 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
  v37[1] = @"MetricType";
  v38[0] = v17;
  v18 = +[PPSMetricType genericDimension];
  v38[1] = v18;
  v19 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];

  v20 = [PPSMetric alloc];
  v21 = +[PPSUnit dimensionless];
  v22 = [(PPSMetric *)v20 initWithName:@"sessionType" version:7 datatype:v21 unit:v6 baseMetric:v19 optionalPayload:1.0];

  v33 = @"MetricType";
  v23 = +[PPSMetricType genericDimension];
  v34 = v23;
  v24 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];

  v25 = [PPSMetric alloc];
  v26 = +[PPSUnit dimensionless];
  v27 = [(PPSMetric *)v25 initWithName:@"numCacheUploads" version:7 datatype:v26 unit:v6 baseMetric:v24 optionalPayload:1.0];

  v32[0] = v6;
  v32[1] = v27;
  v32[2] = v22;
  v32[3] = v14;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];

  return v28;
}

@end