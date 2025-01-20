@interface PPSBackupMetrics
+ (id)allDeclMetrics;
+ (id)backupRestoreMetrics;
+ (id)subsystem;
@end

@implementation PPSBackupMetrics

+ (id)subsystem
{
  return @"BackupMetrics";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() backupRestoreMetrics];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (id)backupRestoreMetrics
{
  v22[2] = *MEMORY[0x263EF8340];
  v21[0] = @"EnumMapping";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v19[0] = v2;
  v20[0] = @"Idle";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v19[1] = v3;
  v20[1] = @"Starting";
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v19[2] = v4;
  v20[2] = @"Running";
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v19[3] = v5;
  v20[3] = @"Ending";
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v19[4] = v6;
  v20[4] = @"Ended";
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v19[5] = v7;
  v20[5] = @"Cancelled";
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v19[6] = v8;
  v20[6] = @"Failed";
  v9 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:7];
  v21[1] = @"MetricType";
  v22[0] = v9;
  v10 = +[PPSMetricType stateDimension];
  v22[1] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

  v12 = [PPSMetric alloc];
  v13 = +[PPSUnit dimensionless];
  v14 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v15 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v12, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"State", @"BackupMetrics", @"RestoreState", 7, v13, v14, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v11);

  v18 = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];

  return v16;
}

@end