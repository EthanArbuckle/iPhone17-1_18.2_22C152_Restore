@interface PPSIOReportMetrics
+ (id)allDeclMetrics;
+ (id)amcStatsPerfCountersMetrics;
+ (id)aop2PowerMetrics;
+ (id)aopExclavePowerMetrics;
+ (id)pmpDcsFloorMetrics;
+ (id)pmpPmcAveFloorMetrics;
+ (id)pmpPmcDispFloorMetrics;
+ (id)pmpSocFloorMetrics;
+ (id)socStatsDeviceStatesMetrics;
+ (id)socStatsEventsMetrics;
+ (id)socStatsIdsFuseMetrics;
+ (id)socStatsOprtpMetrics;
+ (id)socStatsPmgrCountersMetrics;
+ (id)subsystem;
@end

@implementation PPSIOReportMetrics

+ (id)subsystem
{
  return @"IOReportMetrics";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() amcStatsPerfCountersMetrics];
  [v2 addObjectsFromArray:v3];

  v4 = [(id)objc_opt_class() socStatsEventsMetrics];
  [v2 addObjectsFromArray:v4];

  v5 = [(id)objc_opt_class() socStatsPmgrCountersMetrics];
  [v2 addObjectsFromArray:v5];

  v6 = [(id)objc_opt_class() socStatsOprtpMetrics];
  [v2 addObjectsFromArray:v6];

  v7 = [(id)objc_opt_class() socStatsIdsFuseMetrics];
  [v2 addObjectsFromArray:v7];

  v8 = [(id)objc_opt_class() socStatsDeviceStatesMetrics];
  [v2 addObjectsFromArray:v8];

  v9 = [(id)objc_opt_class() pmpDcsFloorMetrics];
  [v2 addObjectsFromArray:v9];

  v10 = [(id)objc_opt_class() pmpSocFloorMetrics];
  [v2 addObjectsFromArray:v10];

  v11 = [(id)objc_opt_class() pmpPmcAveFloorMetrics];
  [v2 addObjectsFromArray:v11];

  v12 = [(id)objc_opt_class() pmpPmcDispFloorMetrics];
  [v2 addObjectsFromArray:v12];

  v13 = [(id)objc_opt_class() aop2PowerMetrics];
  [v2 addObjectsFromArray:v13];

  v14 = [(id)objc_opt_class() aopExclavePowerMetrics];
  [v2 addObjectsFromArray:v14];

  return v2;
}

+ (id)amcStatsPerfCountersMetrics
{
  v18[4] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSIOReportMetrics subsystem];
  v4 = +[PPSUnit seconds];
  v5 = +[PPSCadence cadenceEventSBC_EventScreenStateChange];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"timestampEnd", v3, @"AMCStatsPerfCounters", 4, v4, v5, 1.0, 0x200000005, 0x700000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit seconds];
  v9 = [(PPSMetric *)v7 initWithName:@"APWakeTime" version:8 datatype:v8 unit:v6 baseMetric:0 optionalPayload:1.0];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit dimensionless];
  v12 = [(PPSMetric *)v10 initWithName:@"Channel" version:3 datatype:v11 unit:v9 baseMetric:&unk_270701DF0 optionalPayload:1.0];

  v13 = [PPSMetric alloc];
  v14 = +[PPSUnit bytes];
  v15 = [(PPSMetric *)v13 initWithName:@"Value" version:7 datatype:v14 unit:v12 baseMetric:&unk_270701DF0 optionalPayload:1.0];

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];

  return v16;
}

+ (id)socStatsEventsMetrics
{
  v18[4] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSIOReportMetrics subsystem];
  v4 = +[PPSUnit seconds];
  v5 = +[PPSCadence cadenceEventSBC_EventScreenStateChange];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"timestampEnd", v3, @"SoCStatsEvents", 4, v4, v5, 1.0, 0x200000005, 0x700000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit seconds];
  v9 = [(PPSMetric *)v7 initWithName:@"APWakeTime" version:8 datatype:v8 unit:v6 baseMetric:0 optionalPayload:1.0];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit dimensionless];
  v12 = [(PPSMetric *)v10 initWithName:@"Channel" version:3 datatype:v11 unit:v9 baseMetric:&unk_270701E18 optionalPayload:1.0];

  v13 = [PPSMetric alloc];
  v14 = +[PPSUnit dimensionless];
  v15 = [(PPSMetric *)v13 initWithName:@"DutyCycle" version:8 datatype:v14 unit:v12 baseMetric:&unk_270701E18 optionalPayload:1.0];

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];

  return v16;
}

+ (id)socStatsPmgrCountersMetrics
{
  v18[4] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSIOReportMetrics subsystem];
  v4 = +[PPSUnit seconds];
  v5 = +[PPSCadence cadenceEventSBC_EventScreenStateChange];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"timestampEnd", v3, @"SoCStatsPMGRCounters", 4, v4, v5, 1.0, 0x200000005, 0x700000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit seconds];
  v9 = [(PPSMetric *)v7 initWithName:@"APWakeTime" version:8 datatype:v8 unit:v6 baseMetric:0 optionalPayload:1.0];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit dimensionless];
  v12 = [(PPSMetric *)v10 initWithName:@"Channel" version:3 datatype:v11 unit:v9 baseMetric:&unk_270701E40 optionalPayload:1.0];

  v13 = [PPSMetric alloc];
  v14 = +[PPSUnit dimensionless];
  v15 = [(PPSMetric *)v13 initWithName:@"Value" version:7 datatype:v14 unit:v12 baseMetric:&unk_270701E40 optionalPayload:1.0];

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];

  return v16;
}

+ (id)socStatsOprtpMetrics
{
  v12[2] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSIOReportMetrics subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceInit];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Channel", v3, @"SoCStatsoprtp", 7, v4, v5, 1.0, 0x200000001, 0x700000001, 0x300000001, 0x100000001, &unk_270701E68);

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit milliVolts];
  v9 = [(PPSMetric *)v7 initWithName:@"Value" version:7 datatype:v8 unit:v6 baseMetric:&unk_270701E68 optionalPayload:1.0];

  v12[0] = v6;
  v12[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];

  return v10;
}

+ (id)socStatsIdsFuseMetrics
{
  v12[2] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSIOReportMetrics subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceInit];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Channel", v3, @"SoCStatsAONFuse", 3, v4, v5, 1.0, 0x200000001, 0x700000001, 0x300000001, 0x100000001, &unk_270701E90);

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit milliAmperes];
  v9 = [(PPSMetric *)v7 initWithName:@"Value" version:7 datatype:v8 unit:v6 baseMetric:&unk_270701E90 optionalPayload:1.0];

  v12[0] = v6;
  v12[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];

  return v10;
}

+ (id)socStatsDeviceStatesMetrics
{
  v18[4] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSIOReportMetrics subsystem];
  v4 = +[PPSUnit seconds];
  v5 = +[PPSCadence cadenceEventSBC_EventScreenStateChange];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"timestampEnd", v3, @"SoCStatsDeviceStates", 4, v4, v5, 1.0, 0x200000005, 0x700000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit seconds];
  v9 = [(PPSMetric *)v7 initWithName:@"APWakeTime" version:8 datatype:v8 unit:v6 baseMetric:0 optionalPayload:1.0];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit dimensionless];
  v12 = [(PPSMetric *)v10 initWithName:@"Channel" version:3 datatype:v11 unit:v9 baseMetric:&unk_270701EB8 optionalPayload:1.0];

  v13 = [PPSMetric alloc];
  v14 = +[PPSUnit dimensionless];
  v15 = [(PPSMetric *)v13 initWithName:@"DutyCycle" version:8 datatype:v14 unit:v12 baseMetric:&unk_270701EB8 optionalPayload:1.0];

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];

  return v16;
}

+ (id)pmpDcsFloorMetrics
{
  v18[4] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSIOReportMetrics subsystem];
  v4 = +[PPSUnit seconds];
  v5 = +[PPSCadence cadenceEventSBC_EventScreenStateChange];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"timestampEnd", v3, @"PMPDCSFloor", 4, v4, v5, 1.0, 0x200000005, 0x700000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit seconds];
  v9 = [(PPSMetric *)v7 initWithName:@"APWakeTime" version:8 datatype:v8 unit:v6 baseMetric:0 optionalPayload:1.0];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit dimensionless];
  v12 = [(PPSMetric *)v10 initWithName:@"Channel" version:3 datatype:v11 unit:v9 baseMetric:&unk_270701EE0 optionalPayload:1.0];

  v13 = [PPSMetric alloc];
  v14 = +[PPSUnit dimensionless];
  v15 = [(PPSMetric *)v13 initWithName:@"DutyCycle" version:8 datatype:v14 unit:v12 baseMetric:&unk_270701EE0 optionalPayload:1.0];

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];

  return v16;
}

+ (id)pmpSocFloorMetrics
{
  v18[4] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSIOReportMetrics subsystem];
  v4 = +[PPSUnit seconds];
  v5 = +[PPSCadence cadenceEventSBC_EventScreenStateChange];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"timestampEnd", v3, @"PMPSOCFloor", 4, v4, v5, 1.0, 0x200000005, 0x700000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit seconds];
  v9 = [(PPSMetric *)v7 initWithName:@"APWakeTime" version:8 datatype:v8 unit:v6 baseMetric:0 optionalPayload:1.0];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit dimensionless];
  v12 = [(PPSMetric *)v10 initWithName:@"Channel" version:3 datatype:v11 unit:v9 baseMetric:&unk_270701F08 optionalPayload:1.0];

  v13 = [PPSMetric alloc];
  v14 = +[PPSUnit dimensionless];
  v15 = [(PPSMetric *)v13 initWithName:@"DutyCycle" version:8 datatype:v14 unit:v12 baseMetric:&unk_270701F08 optionalPayload:1.0];

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];

  return v16;
}

+ (id)pmpPmcAveFloorMetrics
{
  v18[4] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSIOReportMetrics subsystem];
  v4 = +[PPSUnit seconds];
  v5 = +[PPSCadence cadenceEventSBC_EventScreenStateChange];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"timestampEnd", v3, @"PMPPMCAVEFloor", 4, v4, v5, 1.0, 0x200000005, 0x700000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit seconds];
  v9 = [(PPSMetric *)v7 initWithName:@"APWakeTime" version:8 datatype:v8 unit:v6 baseMetric:0 optionalPayload:1.0];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit dimensionless];
  v12 = [(PPSMetric *)v10 initWithName:@"Channel" version:3 datatype:v11 unit:v9 baseMetric:&unk_270701F30 optionalPayload:1.0];

  v13 = [PPSMetric alloc];
  v14 = +[PPSUnit dimensionless];
  v15 = [(PPSMetric *)v13 initWithName:@"DutyCycle" version:8 datatype:v14 unit:v12 baseMetric:&unk_270701F30 optionalPayload:1.0];

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];

  return v16;
}

+ (id)pmpPmcDispFloorMetrics
{
  v18[4] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSIOReportMetrics subsystem];
  v4 = +[PPSUnit seconds];
  v5 = +[PPSCadence cadenceEventSBC_EventScreenStateChange];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"timestampEnd", v3, @"PMPPMCDISPFloor", 4, v4, v5, 1.0, 0x200000005, 0x700000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit seconds];
  v9 = [(PPSMetric *)v7 initWithName:@"APWakeTime" version:8 datatype:v8 unit:v6 baseMetric:0 optionalPayload:1.0];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit dimensionless];
  v12 = [(PPSMetric *)v10 initWithName:@"Channel" version:3 datatype:v11 unit:v9 baseMetric:&unk_270701F58 optionalPayload:1.0];

  v13 = [PPSMetric alloc];
  v14 = +[PPSUnit dimensionless];
  v15 = [(PPSMetric *)v13 initWithName:@"DutyCycle" version:8 datatype:v14 unit:v12 baseMetric:&unk_270701F58 optionalPayload:1.0];

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];

  return v16;
}

+ (id)aop2PowerMetrics
{
  v36[10] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSIOReportMetrics subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceEventSBC_EventScreenStateChange];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Duty cycle", v3, @"AOP2Power", 7, v4, v5, 1.0, 0x200000005, 0x700000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit dimensionless];
  v35 = [(PPSMetric *)v7 initWithName:@"Sleep count" version:7 datatype:v8 unit:v6 baseMetric:0 optionalPayload:1.0];

  v9 = [PPSMetric alloc];
  v10 = +[PPSUnit dimensionless];
  v34 = [(PPSMetric *)v9 initWithName:@"Wake count" version:7 datatype:v10 unit:v6 baseMetric:0 optionalPayload:1.0];

  v11 = [PPSMetric alloc];
  v12 = +[PPSUnit dimensionless];
  v33 = [(PPSMetric *)v11 initWithName:@"Power state_ON" version:8 datatype:v12 unit:v6 baseMetric:0 optionalPayload:1.0];

  v13 = [PPSMetric alloc];
  v14 = +[PPSUnit bytes];
  v32 = [(PPSMetric *)v13 initWithName:@"Free heap" version:7 datatype:v14 unit:v6 baseMetric:0 optionalPayload:1.0];

  v15 = [PPSMetric alloc];
  v16 = +[PPSUnit bytes];
  v31 = [(PPSMetric *)v15 initWithName:@"Total heap" version:7 datatype:v16 unit:v6 baseMetric:0 optionalPayload:1.0];

  v17 = [PPSMetric alloc];
  v18 = +[PPSUnit bytes];
  v30 = [(PPSMetric *)v17 initWithName:@"Peak heap alloc" version:7 datatype:v18 unit:v6 baseMetric:0 optionalPayload:1.0];

  v19 = [PPSMetric alloc];
  v20 = +[PPSUnit dimensionless];
  v29 = [(PPSMetric *)v19 initWithName:@"CPU count" version:7 datatype:v20 unit:v6 baseMetric:0 optionalPayload:1.0];

  v21 = [PPSMetric alloc];
  v22 = +[PPSUnit seconds];
  v23 = [(PPSMetric *)v21 initWithName:@"timestampEnd" version:4 datatype:v22 unit:v6 baseMetric:0 optionalPayload:1.0];

  v24 = [PPSMetric alloc];
  v25 = +[PPSUnit seconds];
  v26 = [(PPSMetric *)v24 initWithName:@"APWakeTime" version:8 datatype:v25 unit:v6 baseMetric:0 optionalPayload:1.0];

  v36[0] = v6;
  v36[1] = v35;
  v36[2] = v34;
  v36[3] = v33;
  v36[4] = v32;
  v36[5] = v31;
  v36[6] = v30;
  v36[7] = v29;
  v36[8] = v23;
  v36[9] = v26;
  id v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:10];

  return v28;
}

+ (id)aopExclavePowerMetrics
{
  v30[8] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSIOReportMetrics subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceInit_EventSBC];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Power state_ON", v3, @"AOP-EXCLAVEPower", 8, v4, v5, 1.0, 0x200000005, 0x700000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit dimensionless];
  v9 = [(PPSMetric *)v7 initWithName:@"Sleep count" version:7 datatype:v8 unit:v6 baseMetric:0 optionalPayload:1.0];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit dimensionless];
  v12 = [(PPSMetric *)v10 initWithName:@"Wake Count" version:7 datatype:v11 unit:v6 baseMetric:0 optionalPayload:1.0];

  v13 = [PPSMetric alloc];
  v14 = +[PPSUnit bytes];
  v15 = [(PPSMetric *)v13 initWithName:@"Free heap" version:7 datatype:v14 unit:v6 baseMetric:0 optionalPayload:1.0];

  v16 = [PPSMetric alloc];
  v17 = +[PPSUnit bytes];
  v18 = [(PPSMetric *)v16 initWithName:@"Total heap" version:7 datatype:v17 unit:v6 baseMetric:0 optionalPayload:1.0];

  v19 = [PPSMetric alloc];
  v20 = +[PPSUnit bytes];
  v21 = [(PPSMetric *)v19 initWithName:@"Peak heap alloc" version:7 datatype:v20 unit:v6 baseMetric:0 optionalPayload:1.0];

  v22 = [PPSMetric alloc];
  v23 = +[PPSUnit seconds];
  v24 = [(PPSMetric *)v22 initWithName:@"timestampEnd" version:4 datatype:v23 unit:v6 baseMetric:0 optionalPayload:1.0];

  v25 = [PPSMetric alloc];
  v26 = +[PPSUnit seconds];
  v27 = [(PPSMetric *)v25 initWithName:@"APWakeTime" version:8 datatype:v26 unit:v6 baseMetric:0 optionalPayload:1.0];

  v30[0] = v6;
  v30[1] = v9;
  v30[2] = v12;
  v30[3] = v15;
  v30[4] = v18;
  v30[5] = v21;
  v30[6] = v24;
  v30[7] = v27;
  id v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:8];

  return v28;
}

@end