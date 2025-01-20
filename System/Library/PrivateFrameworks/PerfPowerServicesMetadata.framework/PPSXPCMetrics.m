@interface PPSXPCMetrics
+ (id)allDeclMetrics;
+ (id)cpuViolationsMetrics;
+ (id)groupActivitiesMetrics;
+ (id)idleTimerStateMetrics;
+ (id)ihaConsentMetrics;
+ (id)intelligencePlatformViewUpdateMetrics;
+ (id)mailCategorizationEnabledMetrics;
+ (id)mailCategorizationMetrics;
+ (id)mailIMAPMetrics;
+ (id)mailSyncMetrics;
+ (id)ongoingRestoreMetrics;
+ (id)subsystem;
+ (id)vkDataScannerMetrics;
@end

@implementation PPSXPCMetrics

+ (id)subsystem
{
  return @"XPCMetrics";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() groupActivitiesMetrics];
  [v2 addObjectsFromArray:v3];

  v4 = [(id)objc_opt_class() mailCategorizationMetrics];
  [v2 addObjectsFromArray:v4];

  v5 = [(id)objc_opt_class() mailCategorizationEnabledMetrics];
  [v2 addObjectsFromArray:v5];

  v6 = [(id)objc_opt_class() mailSyncMetrics];
  [v2 addObjectsFromArray:v6];

  v7 = [(id)objc_opt_class() ihaConsentMetrics];
  [v2 addObjectsFromArray:v7];

  v8 = [(id)objc_opt_class() intelligencePlatformViewUpdateMetrics];
  [v2 addObjectsFromArray:v8];

  v9 = [(id)objc_opt_class() cpuViolationsMetrics];
  [v2 addObjectsFromArray:v9];

  v10 = [(id)objc_opt_class() idleTimerStateMetrics];
  [v2 addObjectsFromArray:v10];

  v11 = [(id)objc_opt_class() vkDataScannerMetrics];
  [v2 addObjectsFromArray:v11];

  v12 = [(id)objc_opt_class() mailIMAPMetrics];
  [v2 addObjectsFromArray:v12];

  if (_os_feature_enabled_impl())
  {
    v13 = [(id)objc_opt_class() ongoingRestoreMetrics];
    [v2 addObjectsFromArray:v13];
  }
  return v2;
}

+ (id)groupActivitiesMetrics
{
  v15[1] = *MEMORY[0x263EF8340];
  v14 = @"MetricType";
  v2 = +[PPSMetricType genericDimension];
  v15[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];

  v4 = [PPSMetric alloc];
  v5 = +[PPSUnit dimensionless];
  v6 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v7 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v4, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"bundleID", @"XPCMetrics", @"GroupActivities", 3, v5, v6, 1.0, 0x200000005, 0x100000001, 0x300000001, 0x100000001, v3);

  v8 = [PPSMetric alloc];
  v9 = +[PPSUnit seconds];
  v10 = [(PPSMetric *)v8 initWithName:@"timestampEnd" version:4 datatype:v9 unit:v7 baseMetric:0 optionalPayload:2.0];

  v13[0] = v7;
  v13[1] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];

  return v11;
}

+ (id)mailCategorizationMetrics
{
  v33[2] = *MEMORY[0x263EF8340];
  v32[0] = @"EnumMapping";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v30[0] = v2;
  v31[0] = @"Begin";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v30[1] = v3;
  v31[1] = @"End";
  v4 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
  v32[1] = @"MetricType";
  v33[0] = v4;
  v5 = +[PPSMetricType stateDimension];
  v33[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit dimensionless];
  v9 = +[PPSCadence cadenceEventXPCWithFrequency:1];
  v10 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"eventType", @"XPCMetrics", @"MailCategorizationEvent", 7, v8, v9, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v6);

  v11 = [PPSMetric alloc];
  v12 = +[PPSUnit dimensionless];
  v13 = [(PPSMetric *)v11 initWithName:@"count" version:7 datatype:v12 unit:v10 baseMetric:0 optionalPayload:1.0];

  v28 = @"EnumMapping";
  v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v26[0] = v14;
  v27[0] = @"New-Message";
  v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v26[1] = v15;
  v27[1] = @"Backlog";
  v16 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v26[2] = v16;
  v27[2] = @"Fast-Pass";
  v17 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v26[3] = v17;
  v27[3] = @"User-Initiated";
  v18 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
  v29 = v18;
  v19 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];

  v20 = [PPSMetric alloc];
  v21 = +[PPSUnit dimensionless];
  v22 = [(PPSMetric *)v20 initWithName:@"reason" version:7 datatype:v21 unit:v10 baseMetric:v19 optionalPayload:1.0];

  v25[0] = v10;
  v25[1] = v13;
  v25[2] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];

  return v23;
}

+ (id)mailCategorizationEnabledMetrics
{
  v12[1] = *MEMORY[0x263EF8340];
  v11 = @"MetricType";
  v2 = +[PPSMetricType stateDimension];
  v12[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];

  v4 = [PPSMetric alloc];
  v5 = +[PPSUnit dimensionless];
  v6 = +[PPSCadence cadenceEventXPCWithFrequency:1];
  v7 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v4, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"MailCategorization", @"XPCMetrics", @"MailCategorizationEnabled", 5, v5, v6, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v3);

  v10 = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];

  return v8;
}

+ (id)mailSyncMetrics
{
  v37[2] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSUnit dimensionless];
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:1];
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"account", @"XPCMetrics", @"MailSyncIMAP", 3, v3, v4, 1.0, 0x200000003, 0x600000001, 0x100000001, 0x100000001, 0);

  v36[0] = @"EnumMapping";
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v34[0] = v6;
  v35[0] = @"Begin";
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v34[1] = v7;
  v35[1] = @"End";
  v8 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
  v36[1] = @"MetricType";
  v37[0] = v8;
  v9 = +[PPSMetricType stateDimension];
  v37[1] = v9;
  v28 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit dimensionless];
  v12 = [(PPSMetric *)v10 initWithName:@"event" version:7 datatype:v11 unit:v5 baseMetric:v28 optionalPayload:1.0];

  v32[0] = @"EnumMapping";
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v30[0] = v13;
  v31[0] = @"User-Initiated";
  v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v30[1] = v14;
  v31[1] = @"Periodic";
  v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  void v30[2] = v15;
  void v31[2] = @"Push";
  v16 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v30[3] = v16;
  v31[3] = @"Backfill";
  v17 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];
  v32[1] = @"MetricType";
  v33[0] = v17;
  v18 = +[PPSMetricType genericDimension];
  v33[1] = v18;
  v19 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];

  v20 = [PPSMetric alloc];
  v21 = +[PPSUnit dimensionless];
  v22 = [(PPSMetric *)v20 initWithName:@"kind" version:7 datatype:v21 unit:v5 baseMetric:v19 optionalPayload:1.0];

  v23 = [PPSMetric alloc];
  v24 = +[PPSUnit dimensionless];
  v25 = [(PPSMetric *)v23 initWithName:@"sync" version:7 datatype:v24 unit:v5 baseMetric:0 optionalPayload:1.0];

  v29[0] = v5;
  v29[1] = v12;
  v29[2] = v22;
  v29[3] = v25;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:4];

  return v26;
}

+ (id)intelligencePlatformViewUpdateMetrics
{
  v56[1] = *MEMORY[0x263EF8340];
  v55 = @"MetricType";
  v2 = +[PPSMetricType genericDimension];
  v56[0] = v2;
  v41 = [NSDictionary dictionaryWithObjects:v56 forKeys:&v55 count:1];

  v3 = [PPSMetric alloc];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v3, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"name", @"XPCMetrics", @"viewUpdate", 3, v4, v5, 1.0, 0x200000004, 0x100000001, 0x100000001, 0x100000001, v41);

  v53 = @"MetricType";
  v7 = +[PPSMetricType absoluteMeasure];
  v54 = v7;
  v40 = [NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];

  v8 = [PPSMetric alloc];
  v9 = +[PPSUnit milliseconds];
  v39 = [(PPSMetric *)v8 initWithName:@"durationMillis" version:7 datatype:v9 unit:v6 baseMetric:v40 optionalPayload:1.0];

  v51[0] = @"EnumMapping";
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v49[0] = v10;
  v50[0] = @"No-Update";
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v49[1] = v11;
  v50[1] = @"Updated";
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v49[2] = v12;
  v50[2] = @"Deferred";
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v49[3] = v13;
  v50[3] = @"Error";
  v14 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:4];
  v51[1] = @"MetricType";
  v52[0] = v14;
  v15 = +[PPSMetricType genericDimension];
  v52[1] = v15;
  v38 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];

  v16 = [PPSMetric alloc];
  v17 = +[PPSUnit dimensionless];
  v37 = [(PPSMetric *)v16 initWithName:@"result" version:7 datatype:v17 unit:v6 baseMetric:v38 optionalPayload:1.0];

  v47[0] = @"EnumMapping";
  v18 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v45[0] = v18;
  v46[0] = @"Has-Changes";
  v19 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v45[1] = v19;
  v46[1] = @"Full-Rebuild";
  v20 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v45[2] = v20;
  v46[2] = @"Clear";
  v21 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v45[3] = v21;
  v46[3] = @"Truncate-Artifact";
  v22 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v45[4] = v22;
  v46[4] = @"No-Changes";
  v23 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0xFFFFFFFFLL);
  v45[5] = v23;
  v46[5] = @"Unknown";
  v24 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:6];
  v48[0] = v24;
  v47[1] = @"MetricType";
  v25 = +[PPSMetricType genericDimension];
  v48[1] = v25;
  v26 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];

  v27 = [PPSMetric alloc];
  v28 = +[PPSUnit dimensionless];
  v29 = [(PPSMetric *)v27 initWithName:@"action" version:7 datatype:v28 unit:v6 baseMetric:v26 optionalPayload:1.0];

  v43 = @"MetricType";
  v30 = +[PPSMetricType deltaMeasure];
  v44 = v30;
  v31 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];

  v32 = [PPSMetric alloc];
  v33 = +[PPSUnit dimensionless];
  v34 = [(PPSMetric *)v32 initWithName:@"sources" version:3 datatype:v33 unit:v6 baseMetric:v31 optionalPayload:1.0];

  v42[0] = v6;
  v42[1] = v39;
  v42[2] = v37;
  v42[3] = v29;
  v42[4] = v34;
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:5];

  return v35;
}

+ (id)vkDataScannerMetrics
{
  v11[2] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSUnit dimensionless];
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"SessionMinFrameDuration", @"XPCMetrics", @"VKDataScanner", 8, v3, v4, 1.0, 0x200000005, 0x100000001, 0x300000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  v7 = +[PPSUnit seconds];
  v8 = [(PPSMetric *)v6 initWithName:@"SessionStopTime" version:4 datatype:v7 unit:v5 baseMetric:0 optionalPayload:1.0];

  v11[0] = v5;
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

+ (id)mailIMAPMetrics
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSUnit dimensionless];
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:1];
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"IMAPv4", @"XPCMetrics", @"MailIMAP", 5, v3, v4, 1.0, 0x200000003, 0x100000001, 0x100000001, 0x100000001, 0);

  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

+ (id)cpuViolationsMetrics
{
  v40[2] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSUnit dimensionless];
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:1];
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"ProcessName", @"XPCMetrics", @"CPUViolations", 3, v3, v4, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  v7 = +[PPSUnit dimensionless];
  v35 = [(PPSMetric *)v6 initWithName:@"ScenarioIdentifier" version:3 datatype:v7 unit:v5 baseMetric:0 optionalPayload:1.0];

  v8 = [PPSMetric alloc];
  v9 = +[PPSUnit seconds];
  v34 = [(PPSMetric *)v8 initWithName:@"timestampEnd" version:4 datatype:v9 unit:v5 baseMetric:0 optionalPayload:1.0];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit seconds];
  v33 = [(PPSMetric *)v10 initWithName:@"ThresholdCPUUsage" version:7 datatype:v11 unit:v5 baseMetric:0 optionalPayload:1.0];

  v12 = [PPSMetric alloc];
  v13 = +[PPSUnit seconds];
  v32 = [(PPSMetric *)v12 initWithName:@"TimeWndowSize" version:7 datatype:v13 unit:v5 baseMetric:0 optionalPayload:1.0];

  v14 = [PPSMetric alloc];
  v15 = +[PPSUnit seconds];
  v16 = [(PPSMetric *)v14 initWithName:@"ObservedCPUUsage" version:8 datatype:v15 unit:v5 baseMetric:0 optionalPayload:1.0];

  v17 = [PPSMetric alloc];
  v18 = +[PPSUnit seconds];
  v19 = [(PPSMetric *)v17 initWithName:@"ObservedCPUUsageDuration" version:8 datatype:v18 unit:v5 baseMetric:0 optionalPayload:1.0];

  v39[0] = @"EnumMapping";
  v20 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v37[0] = v20;
  v38[0] = @"None";
  v21 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v37[1] = v21;
  v38[1] = @"Kill";
  v22 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v37[2] = v22;
  v38[2] = @"SFI";
  v23 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v37[3] = v23;
  v38[3] = @"Unknown";
  v24 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];
  v39[1] = @"MetricType";
  v40[0] = v24;
  v25 = +[PPSMetricType stateDimension];
  v40[1] = v25;
  v26 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];

  v27 = [PPSMetric alloc];
  v28 = +[PPSUnit dimensionless];
  v29 = [(PPSMetric *)v27 initWithName:@"Mitigation" version:7 datatype:v28 unit:v5 baseMetric:v26 optionalPayload:1.0];

  v36[0] = v5;
  v36[1] = v35;
  void v36[2] = v34;
  v36[3] = v33;
  v36[4] = v32;
  v36[5] = v16;
  v36[6] = v19;
  v36[7] = v29;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:8];

  return v30;
}

+ (id)ongoingRestoreMetrics
{
  v29[2] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSUnit dimensionless];
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:1];
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"fastPassName", @"XPCMetrics", @"OngoingRestore", 3, v3, v4, 1.0, 0x200000003, 0x10000000ELL, 0x300000006, 0x100000001, 0);

  v28[0] = @"AuxiliaryType";
  v28[1] = @"MetricType";
  v29[0] = &unk_270701CB0;
  v6 = +[PPSMetricType genericDimension];
  v29[1] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];

  v8 = [PPSMetric alloc];
  v9 = +[PPSUnit dimensionless];
  v10 = [(PPSMetric *)v8 initWithName:@"processName" version:3 datatype:v9 unit:v5 baseMetric:v7 optionalPayload:2.0];

  v26[0] = @"MetricType";
  v11 = +[PPSMetricType stateDimension];
  v26[1] = @"EnumMapping";
  v27[0] = v11;
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
  v24[0] = v12;
  v25[0] = @"Scheduled";
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 20);
  v24[1] = v13;
  v25[1] = @"Started";
  v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 30);
  v24[2] = v14;
  v25[2] = @"Stopped";
  v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 60);
  v24[3] = v15;
  void v25[3] = @"Completed";
  v16 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
  v27[1] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];

  v18 = [PPSMetric alloc];
  v19 = +[PPSUnit dimensionless];
  v20 = [(PPSMetric *)v18 initWithName:@"state" version:7 datatype:v19 unit:v5 baseMetric:v17 optionalPayload:1.0];

  v23[0] = v5;
  v23[1] = v10;
  v23[2] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:3];

  return v21;
}

+ (id)ihaConsentMetrics
{
  v17[2] = *MEMORY[0x263EF8340];
  v16[0] = @"EnumMapping";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v14[0] = v2;
  v15[0] = @"Disabled";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v14[1] = v3;
  v15[1] = @"Enabled";
  v4 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  v17[0] = v4;
  v16[1] = @"MetricType";
  v5 = +[PPSMetricType stateDimension];
  v17[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit dimensionless];
  v9 = +[PPSCadence cadenceEventXPCWithFrequency:1];
  v10 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Enabled", @"XPCMetrics", @"IHAConsent", 5, v8, v9, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v6);

  v13 = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];

  return v11;
}

+ (id)idleTimerStateMetrics
{
  v18[1] = *MEMORY[0x263EF8340];
  v17 = @"MetricType";
  v2 = +[PPSMetricType genericDimension];
  v18[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];

  v4 = [PPSMetric alloc];
  v5 = +[PPSUnit dimensionless];
  v6 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v7 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v4, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"bundleID", @"XPCMetrics", @"IdleTimerState", 3, v5, v6, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v3);

  v8 = [PPSMetric alloc];
  v9 = +[PPSUnit dimensionless];
  v10 = [(PPSMetric *)v8 initWithName:@"idleTimerDisabled" version:5 datatype:v9 unit:v7 baseMetric:0 optionalPayload:1.0];

  v11 = [PPSMetric alloc];
  v12 = +[PPSUnit seconds];
  v13 = [(PPSMetric *)v11 initWithName:@"autoLockTimeoutDuration" version:7 datatype:v12 unit:v7 baseMetric:0 optionalPayload:1.0];

  v16[0] = v7;
  v16[1] = v10;
  void v16[2] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];

  return v14;
}

@end