@interface PPSApplicationMetrics
+ (id)allDeclMetrics;
+ (id)remoteControlSessionMetrics;
+ (id)subsystem;
@end

@implementation PPSApplicationMetrics

+ (id)subsystem
{
  return @"ApplicationMetrics";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() remoteControlSessionMetrics];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (id)remoteControlSessionMetrics
{
  v37[2] = *MEMORY[0x263EF8340];
  v36[0] = @"EnumMapping";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v34[0] = v2;
  v35[0] = @"Start";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v34[1] = v3;
  v35[1] = @"End";
  v4 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
  v36[1] = @"MetricType";
  v37[0] = v4;
  v5 = +[PPSMetricType stateDimension];
  v37[1] = v5;
  v28 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];

  v6 = [PPSMetric alloc];
  v7 = +[PPSApplicationMetrics subsystem];
  v8 = +[PPSUnit dimensionless];
  v9 = +[PPSCadence cadenceEventXPCWithFrequency:1];
  v27 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v6, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"event", v7, @"RemoteControlSession", 7, v8, v9, 1.1, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v28);

  v32 = @"EnumMapping";
  v26 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v30[0] = v26;
  v31[0] = @"Unknown";
  v25 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v30[1] = v25;
  v31[1] = @"User-Initiated";
  v24 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v30[2] = v24;
  v31[2] = @"Remote-Initiated";
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v30[3] = v10;
  v31[3] = @"Closed-By-Viewer";
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v30[4] = v11;
  v31[4] = @"Closed-By-Server";
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v30[5] = v12;
  v31[5] = @"Connection-Interrupted";
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v30[6] = v13;
  v31[6] = @"New-Session-Created";
  v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
  v30[7] = v14;
  v31[7] = @"Session-Error";
  v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
  v30[8] = v15;
  v31[8] = @"Transport-Interrupted";
  v16 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v30[9] = v16;
  v31[9] = @"Timeout";
  v17 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:10];
  v33 = v17;
  v18 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];

  v19 = [PPSMetric alloc];
  v20 = +[PPSUnit dimensionless];
  v21 = [(PPSMetric *)v19 initWithName:@"reason" version:7 datatype:v20 unit:v27 baseMetric:v18 optionalPayload:1.0];

  v29[0] = v27;
  v29[1] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];

  return v22;
}

@end