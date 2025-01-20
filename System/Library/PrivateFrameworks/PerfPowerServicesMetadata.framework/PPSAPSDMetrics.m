@interface PPSAPSDMetrics
+ (id)allDeclMetrics;
+ (id)pubSubMetrics;
+ (id)subsystem;
@end

@implementation PPSAPSDMetrics

+ (id)subsystem
{
  return @"APSD";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() pubSubMetrics];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (id)pubSubMetrics
{
  v48[1] = *MEMORY[0x263EF8340];
  v47 = @"EnumMapping";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v45[0] = v2;
  v46[0] = @"WWAN";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v45[1] = v3;
  v46[1] = @"NonCellular";
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v45[2] = v4;
  v46[2] = @"Proxy";
  v5 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:3];
  v48[0] = v5;
  v33 = [NSDictionary dictionaryWithObjects:v48 forKeys:&v47 count:1];

  v6 = [PPSMetric alloc];
  v7 = +[PPSUnit dimensionless];
  v8 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v9 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v6, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"ConnectionType", @"APSD", @"PubSub", 7, v7, v8, 1.0, 0x200000002, 0x100000001, 0x300000001, 0x100000001, v33);

  v43 = @"EnumMapping";
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v41[0] = v10;
  v42[0] = @"Production";
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v41[1] = v11;
  v42[1] = @"Development";
  v12 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
  v44 = v12;
  v13 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];

  v14 = [PPSMetric alloc];
  v15 = +[PPSUnit dimensionless];
  v16 = [(PPSMetric *)v14 initWithName:@"Environment" version:7 datatype:v15 unit:v9 baseMetric:v13 optionalPayload:1.0];

  v39 = @"EnumMapping";
  v17 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v37[0] = v17;
  v38[0] = @"Unsubscribe";
  v18 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v37[1] = v18;
  v38[1] = @"Subscribe";
  v19 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v37[2] = v19;
  v38[2] = @"FullSubscription";
  v20 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v37[3] = v20;
  v38[3] = @"ServerRequestResubscribe";
  v21 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];
  v40 = v21;
  v22 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];

  v23 = [PPSMetric alloc];
  v24 = +[PPSUnit dimensionless];
  v25 = [(PPSMetric *)v23 initWithName:@"MessageType" version:7 datatype:v24 unit:v9 baseMetric:v22 optionalPayload:1.0];

  v35 = @"MetricType";
  v26 = +[PPSMetricType genericDimension];
  v36 = v26;
  v27 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];

  v28 = [PPSMetric alloc];
  v29 = +[PPSUnit dimensionless];
  v30 = [(PPSMetric *)v28 initWithName:@"Topic" version:3 datatype:v29 unit:v9 baseMetric:v27 optionalPayload:1.0];

  v34[0] = v9;
  v34[1] = v16;
  v34[2] = v25;
  v34[3] = v30;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];

  return v31;
}

@end