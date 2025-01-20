@interface PPSConfigMetrics
+ (id)allDeclMetrics;
+ (id)buddyDataMetrics;
+ (id)configMetrics;
+ (id)consoleModeEnabledMetrics;
+ (id)constructDeviceTypeMetric;
+ (id)cpuCoreConfigMetrics;
+ (id)deviceCapabilityMetrics;
+ (id)subsystem;
+ (id)sysdiagnoseEventMetrics;
@end

@implementation PPSConfigMetrics

+ (id)subsystem
{
  return @"ConfigMetrics";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() configMetrics];
  [v2 addObjectsFromArray:v3];

  v4 = [(id)objc_opt_class() deviceCapabilityMetrics];
  [v2 addObjectsFromArray:v4];

  v5 = [(id)objc_opt_class() consoleModeEnabledMetrics];
  [v2 addObjectsFromArray:v5];

  v6 = [(id)objc_opt_class() sysdiagnoseEventMetrics];
  [v2 addObjectsFromArray:v6];

  v7 = [(id)objc_opt_class() cpuCoreConfigMetrics];
  [v2 addObjectsFromArray:v7];

  v8 = [(id)objc_opt_class() buddyDataMetrics];
  [v2 addObjectsFromArray:v8];

  return v2;
}

+ (id)configMetrics
{
  v41[8] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSConfigMetrics subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceInit];
  v40 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"BootArgs", v3, @"DeviceConfig", 3, v4, v5, 1.02, 0x200000001, 0x10000000ELL, 0x100000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  v7 = +[PPSConfigMetrics subsystem];
  v8 = +[PPSUnit dimensionless];
  v9 = +[PPSCadence cadenceInit];
  v39 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v6, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Build", v7, @"DeviceConfig", 3, v8, v9, 1.02, 0x200000001, 0x10000000ELL, 0x300000001, 0x100000001, 0);

  v10 = [PPSMetric alloc];
  v11 = +[PPSConfigMetrics subsystem];
  v12 = +[PPSUnit dimensionless];
  v13 = +[PPSCadence cadenceInit];
  v38 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v10, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Device", v11, @"DeviceConfig", 3, v12, v13, 1.02, 0x200000001, 0x10000000ELL, 0x300000001, 0x100000001, 0);

  v14 = [PPSMetric alloc];
  v15 = +[PPSConfigMetrics subsystem];
  v16 = +[PPSUnit dimensionless];
  v17 = +[PPSCadence cadenceInit];
  v35 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v14, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"DeviceCoverGlassCoating", v15, @"DeviceConfig", 7, v16, v17, 2.01, 0x200000001, 0x10000000ELL, 0x300000001, 0x100000001, 0);

  v37 = [a1 constructDeviceTypeMetric];
  v18 = [PPSMetric alloc];
  v19 = +[PPSConfigMetrics subsystem];
  v20 = +[PPSUnit dimensionless];
  v21 = +[PPSCadence cadenceInit];
  v34 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v18, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"DeviceBootTime", v19, @"DeviceConfig", 4, v20, v21, 1.01, 0x200000001, 0x10000000ELL, 0x300000001, 0x100000001, 0);

  v22 = [PPSMetric alloc];
  v23 = +[PPSConfigMetrics subsystem];
  v24 = +[PPSUnit dimensionless];
  v25 = +[PPSCadence cadenceInit];
  v26 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v22, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"ShutdownReason", v23, @"DeviceConfig", 3, v24, v25, 1.01, 0x200000001, 0x10000000ELL, 0x300000001, 0x100000001, 0);

  v27 = [PPSMetric alloc];
  v28 = +[PPSConfigMetrics subsystem];
  v29 = +[PPSUnit dimensionless];
  v30 = +[PPSCadence cadenceInit];
  v31 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v27, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"BootReason", v28, @"DeviceConfig", 3, v29, v30, 1.01, 0x200000001, 0x10000000ELL, 0x300000001, 0x100000001, 0);

  v41[0] = v40;
  v41[1] = v39;
  v41[2] = v38;
  v41[3] = v37;
  v41[4] = v34;
  v41[5] = v35;
  v41[6] = v26;
  v41[7] = v31;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:8];

  return v32;
}

+ (id)constructDeviceTypeMetric
{
  v22[1] = *MEMORY[0x263EF8340];
  v21 = @"EnumMapping";
  v18 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v19[0] = v18;
  v20[0] = @"iPhone";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v19[1] = v2;
  v20[1] = @"iPad";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v19[2] = v3;
  v20[2] = @"iPod";
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v19[3] = v4;
  v20[3] = @"Watch";
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v19[4] = v5;
  v20[4] = @"Mac";
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v19[5] = v6;
  v20[5] = @"HomePod";
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v19[6] = v7;
  v20[6] = @"AppleTV";
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 86);
  v19[7] = v8;
  v20[7] = @"VisionPro";
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1000);
  v19[8] = v9;
  v20[8] = @"Other";
  v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:9];
  v22[0] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];

  v12 = [PPSMetric alloc];
  v13 = +[PPSConfigMetrics subsystem];
  v14 = +[PPSUnit dimensionless];
  v15 = +[PPSCadence cadenceInit];
  v16 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v12, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"DeviceType", v13, @"DeviceConfig", 7, v14, v15, 3.01, 0x200000001, 0x10000000ELL, 0x300000001, 0x100000001, v11);

  return v16;
}

+ (id)deviceCapabilityMetrics
{
  v2 = objc_opt_new();
  uint64_t v3 = 0;
  do
  {
    v4 = [PPSMetric alloc];
    v5 = objc_msgSend(NSString, "stringWithFormat:", @"Capability%d", v3);
    v6 = +[PPSConfigMetrics subsystem];
    v7 = +[PPSUnit dimensionless];
    v8 = +[PPSCadence cadenceInit];
    v9 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v4, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", v5, v6, @"DeviceCapability", 5, v7, v8, 2.0, 0x200000001, 0x100000001, 0x300000001, 0x100000001, 0);

    [v2 addObject:v9];
    uint64_t v3 = (v3 + 1);
  }
  while (v3 != 22);
  return v2;
}

+ (id)consoleModeEnabledMetrics
{
  v18[2] = *MEMORY[0x263EF8340];
  v17[0] = @"EnumMapping";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v15[0] = v2;
  v16[0] = @"Disabled";
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v15[1] = v3;
  v16[1] = @"Enabled";
  v4 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v4;
  v17[1] = @"MetricType";
  v5 = +[PPSMetricType stateDimension];
  v18[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

  v7 = [PPSMetric alloc];
  v8 = +[PPSConfigMetrics subsystem];
  v9 = +[PPSUnit dimensionless];
  v10 = +[PPSCadence cadenceInit];
  v11 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Enabled", v8, @"ConsoleModeEnabled", 5, v9, v10, 2.01, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v6);

  v14 = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];

  return v12;
}

+ (id)sysdiagnoseEventMetrics
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  uint64_t v3 = +[PPSConfigMetrics subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceInit];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Start", v3, @"SysdiagnoseEvent", 5, v4, v5, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, 0);

  v9[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];

  return v7;
}

+ (id)cpuCoreConfigMetrics
{
  v15[3] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  uint64_t v3 = +[PPSConfigMetrics subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceInit];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"numCoreTypes", v3, @"CPUCoreConfig", 7, v4, v5, 1.0, 0x200000001, 0x100000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit dimensionless];
  v9 = [(PPSMetric *)v7 initWithName:@"numEcpuCores" version:7 datatype:v8 unit:v6 baseMetric:0 optionalPayload:1.0];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit dimensionless];
  v12 = [(PPSMetric *)v10 initWithName:@"numPcpuCores" version:7 datatype:v11 unit:v9 baseMetric:0 optionalPayload:1.0];

  v15[0] = v6;
  v15[1] = v9;
  void v15[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];

  return v13;
}

+ (id)buddyDataMetrics
{
  v22[1] = *MEMORY[0x263EF8340];
  v21 = @"EnumMapping";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v19[0] = v2;
  v20[0] = @"None";
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v19[1] = v3;
  v20[1] = @"Cloud Restore";
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v19[2] = v4;
  v20[2] = @"Migrate";
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v19[3] = v5;
  v20[3] = @"From Android";
  v6 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
  v22[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];

  v8 = [PPSMetric alloc];
  v9 = +[PPSConfigMetrics subsystem];
  v10 = +[PPSUnit dimensionless];
  v11 = +[PPSCadence cadenceInit];
  v12 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v8, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"TransferMethod", v9, @"BuddyData", 7, v10, v11, 1.0, 0x200000001, 0x100000001, 0x300000001, 0x100000001, v7);

  v13 = [PPSMetric alloc];
  v14 = +[PPSUnit seconds];
  v15 = [(PPSMetric *)v13 initWithName:@"SetupDate" version:8 datatype:v14 unit:v12 baseMetric:0 optionalPayload:1.0];

  v18[0] = v12;
  v18[1] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];

  return v16;
}

@end