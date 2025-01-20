@interface PPSMessageMetrics
+ (id)allDeclMetrics;
+ (id)rcsRegisterKeepAliveMetrics;
+ (id)rcsSessionManagementMetrics;
+ (id)subsystem;
@end

@implementation PPSMessageMetrics

+ (id)subsystem
{
  return @"Message";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() rcsSessionManagementMetrics];
  [v2 addObjectsFromArray:v3];

  v4 = [(id)objc_opt_class() rcsRegisterKeepAliveMetrics];
  [v2 addObjectsFromArray:v4];

  return v2;
}

+ (id)rcsSessionManagementMetrics
{
  v46[2] = *MEMORY[0x263EF8340];
  v45[0] = @"EnumMapping";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v43[0] = v2;
  v44[0] = @"Received";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v43[1] = v3;
  v44[1] = @"Sent";
  v4 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
  v45[1] = @"MetricType";
  v46[0] = v4;
  v5 = +[PPSMetricType stateDimension];
  v46[1] = v5;
  v33 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];

  v6 = [PPSMetric alloc];
  v7 = +[PPSUnit dimensionless];
  v8 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v9 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v6, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Action", @"Message", @"RCSSessionManagement", 7, v7, v8, 1.0, 0x200000002, 0x100000001, 0x300000001, 0x100000001, v33);

  v41[0] = @"EnumMapping";
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v39[0] = v10;
  v40[0] = @"Cellular";
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v39[1] = v11;
  v40[1] = @"Wifi";
  v12 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
  v41[1] = @"MetricType";
  v42[0] = v12;
  v13 = +[PPSMetricType stateDimension];
  v42[1] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];

  v15 = [PPSMetric alloc];
  v16 = +[PPSUnit dimensionless];
  v17 = [(PPSMetric *)v15 initWithName:@"Interface" version:7 datatype:v16 unit:v9 baseMetric:v14 optionalPayload:1.0];

  v37[0] = @"EnumMapping";
  v18 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v35[0] = v18;
  v36[0] = @"SIP Invite";
  v19 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v35[1] = v19;
  v36[1] = @"BYE";
  v20 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v35[2] = v20;
  v36[2] = @"SIP Refer";
  v21 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v35[3] = v21;
  v36[3] = @"SIP Registration";
  v22 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:4];
  v37[1] = @"MetricType";
  v38[0] = v22;
  v23 = +[PPSMetricType stateDimension];
  v38[1] = v23;
  v24 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];

  v25 = [PPSMetric alloc];
  v26 = +[PPSUnit dimensionless];
  v27 = [(PPSMetric *)v25 initWithName:@"TransactionType" version:7 datatype:v26 unit:v9 baseMetric:v24 optionalPayload:1.1];

  v28 = [PPSMetric alloc];
  v29 = +[PPSUnit seconds];
  v30 = [(PPSMetric *)v28 initWithName:@"Value" version:7 datatype:v29 unit:v9 baseMetric:0 optionalPayload:1.0];

  v34[0] = v9;
  v34[1] = v17;
  v34[2] = v27;
  v34[3] = v30;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];

  return v31;
}

+ (id)rcsRegisterKeepAliveMetrics
{
  v20[2] = *MEMORY[0x263EF8340];
  v19[0] = @"EnumMapping";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v17[0] = v2;
  v18[0] = @"Cellular";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v17[1] = v3;
  v18[1] = @"Wifi";
  v4 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  v20[0] = v4;
  v19[1] = @"MetricType";
  v5 = +[PPSMetricType stateDimension];
  v20[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit dimensionless];
  v9 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v10 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Interface", @"Message", @"SIPRegisterKeepAlive", 7, v8, v9, 1.0, 0x200000002, 0x100000001, 0x300000001, 0x100000001, v6);

  v11 = [PPSMetric alloc];
  v12 = +[PPSUnit seconds];
  v13 = [(PPSMetric *)v11 initWithName:@"Value" version:7 datatype:v12 unit:v10 baseMetric:&unk_270701F80 optionalPayload:1.0];

  v16[0] = v10;
  v16[1] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];

  return v14;
}

@end