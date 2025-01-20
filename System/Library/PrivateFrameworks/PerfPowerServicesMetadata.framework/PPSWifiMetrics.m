@interface PPSWifiMetrics
+ (id)allDeclMetrics;
+ (id)awdlStateLoggingCadence;
+ (id)awdlStateMetrics;
+ (id)subsystem;
@end

@implementation PPSWifiMetrics

+ (id)subsystem
{
  return @"WifiMetrics";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() awdlStateMetrics];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (id)awdlStateMetrics
{
  v21[1] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSWifiMetrics subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSWifiMetrics awdlStateLoggingCadence];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"AWDLDown", v3, @"AWDLState", 5, v4, v5, 1.0, 0x200000003, 0x100000001, 0x300000010, 0x100000001, 0);

  v20 = @"EnumMapping";
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v18[0] = v7;
  v19[0] = @"None";
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v18[1] = v8;
  v19[1] = @"AssistedDiscoveryMode";
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v18[2] = v9;
  v19[2] = @"FollowMode";
  v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  v21[0] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];

  v12 = [PPSMetric alloc];
  v13 = +[PPSUnit dimensionless];
  v14 = [(PPSMetric *)v12 initWithName:@"AWDLRanging" version:7 datatype:v13 unit:v6 baseMetric:v11 optionalPayload:2.0];

  v17[0] = v6;
  v17[1] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];

  return v15;
}

+ (id)awdlStateLoggingCadence
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [[PPSCadenceTuple alloc] initWithCadenceType:3 value:9];
  if (v2)
  {
    v3 = [PPSCadence alloc];
    v7[0] = v2;
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    v5 = [(PPSCadence *)v3 initWithCadenceTuples:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end