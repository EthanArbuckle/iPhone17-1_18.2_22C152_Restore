@interface PPSDownloadMetrics
+ (id)allDeclMetrics;
+ (id)autoAssetDownloadMetrics;
+ (id)subsystem;
+ (id)v2AssetDownloadMetrics;
@end

@implementation PPSDownloadMetrics

+ (id)subsystem
{
  return @"DownloadMetrics";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() autoAssetDownloadMetrics];
  [v2 addObjectsFromArray:v3];

  v4 = [(id)objc_opt_class() v2AssetDownloadMetrics];
  [v2 addObjectsFromArray:v4];

  return v2;
}

+ (id)autoAssetDownloadMetrics
{
  v31[1] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSUnit dimensionless];
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"assetType", @"DownloadMetrics", @"AutoAssetDownloads", 3, v3, v4, 1.0, 0x200000005, 0x100000001, 0x300000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  v7 = +[PPSUnit megabytes];
  v8 = [(PPSMetric *)v6 initWithName:@"bytesDownloaded" version:7 datatype:v7 unit:v5 baseMetric:0 optionalPayload:1.0];

  v9 = [PPSMetric alloc];
  v10 = +[PPSUnit dimensionless];
  v11 = [(PPSMetric *)v9 initWithName:@"clientName" version:3 datatype:v10 unit:v5 baseMetric:0 optionalPayload:1.0];

  v30 = @"EnumMapping";
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v28[0] = v12;
  v29[0] = @"Failed";
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v28[1] = v13;
  v29[1] = @"Successful";
  v14 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  v31[0] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];

  v16 = [PPSMetric alloc];
  v17 = +[PPSUnit dimensionless];
  v18 = [(PPSMetric *)v16 initWithName:@"Result" version:5 datatype:v17 unit:v5 baseMetric:v15 optionalPayload:1.0];

  v19 = [PPSMetric alloc];
  v20 = +[PPSUnit seconds];
  v21 = [(PPSMetric *)v19 initWithName:@"timestampEnd" version:4 datatype:v20 unit:v5 baseMetric:0 optionalPayload:1.0];

  v22 = [PPSMetric alloc];
  v23 = +[PPSUnit dimensionless];
  v24 = [(PPSMetric *)v22 initWithName:@"assetVersion" version:3 datatype:v23 unit:v5 baseMetric:0 optionalPayload:1.0];

  v27[0] = v5;
  v27[1] = v8;
  v27[2] = v11;
  v27[3] = v18;
  v27[4] = v21;
  v27[5] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:6];

  return v25;
}

+ (id)v2AssetDownloadMetrics
{
  v28[1] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSUnit dimensionless];
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"assetType", @"DownloadMetrics", @"v2AssetDownloads", 3, v3, v4, 1.0, 0x200000005, 0x100000001, 0x300000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  v7 = +[PPSUnit megabytes];
  v8 = [(PPSMetric *)v6 initWithName:@"bytesDownloaded" version:7 datatype:v7 unit:v5 baseMetric:0 optionalPayload:1.0];

  v9 = [PPSMetric alloc];
  v10 = +[PPSUnit dimensionless];
  v11 = [(PPSMetric *)v9 initWithName:@"clientName" version:3 datatype:v10 unit:v5 baseMetric:0 optionalPayload:1.0];

  v27 = @"EnumMapping";
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v25[0] = v12;
  v26[0] = @"Failed";
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v25[1] = v13;
  v26[1] = @"Successful";
  v14 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
  v28[0] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];

  v16 = [PPSMetric alloc];
  v17 = +[PPSUnit dimensionless];
  v18 = [(PPSMetric *)v16 initWithName:@"Result" version:5 datatype:v17 unit:v5 baseMetric:v15 optionalPayload:1.0];

  v19 = [PPSMetric alloc];
  v20 = +[PPSUnit seconds];
  v21 = [(PPSMetric *)v19 initWithName:@"timestampEnd" version:4 datatype:v20 unit:v5 baseMetric:0 optionalPayload:1.0];

  v24[0] = v5;
  v24[1] = v8;
  v24[2] = v11;
  v24[3] = v18;
  v24[4] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:5];

  return v22;
}

@end