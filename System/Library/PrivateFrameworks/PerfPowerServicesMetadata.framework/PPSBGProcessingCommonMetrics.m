@interface PPSBGProcessingCommonMetrics
+ (id)AppResumeInferredCarryMetrics;
+ (id)BuddyDataMetrics;
+ (id)FeatureFlagMetrics;
+ (id)allDeclMetrics;
+ (id)configMetrics;
+ (id)localeMetrics;
+ (id)optInMetrics;
+ (id)subsystem;
+ (id)timeOffsetCadence;
+ (id)timeOffsetMetrics;
+ (id)timezoneLoggingCadence;
@end

@implementation PPSBGProcessingCommonMetrics

+ (id)subsystem
{
  return @"BackgroundProcessing";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() localeMetrics];
  [v2 addObjectsFromArray:v3];

  v4 = [(id)objc_opt_class() timeOffsetMetrics];
  [v2 addObjectsFromArray:v4];

  v5 = [(id)objc_opt_class() configMetrics];
  [v2 addObjectsFromArray:v5];

  v6 = [(id)objc_opt_class() FeatureFlagMetrics];
  [v2 addObjectsFromArray:v6];

  v7 = [(id)objc_opt_class() AppResumeInferredCarryMetrics];
  [v2 addObjectsFromArray:v7];

  v8 = [(id)objc_opt_class() BuddyDataMetrics];
  [v2 addObjectsFromArray:v8];

  v9 = [(id)objc_opt_class() optInMetrics];
  [v2 addObjectsFromArray:v9];

  return v2;
}

+ (id)optInMetrics
{
  v18[2] = *MEMORY[0x263EF8340];
  v17[0] = @"EnumMapping";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v15[0] = v2;
  v16[0] = @"Disabled/Unavailable";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v15[1] = v3;
  v16[1] = @"Enabled";
  v4 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v4;
  v17[1] = @"MetricType";
  v5 = +[PPSMetricType stateDimension];
  v18[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

  v7 = [PPSMetric alloc];
  v8 = [(id)objc_opt_class() subsystem];
  v9 = +[PPSUnit dimensionless];
  v10 = +[PPSCadence cadenceEventXPCWithFrequency:1];
  v11 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Enabled", v8, @"GenerativeFunctionMetricsOptIn", 5, v9, v10, 1.0, 0x500000003, 0x100000003, 0x300000015, 0x100000001, v6);

  v14 = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];

  return v12;
}

+ (id)BuddyDataMetrics
{
  v22[1] = *MEMORY[0x263EF8340];
  v21 = @"EnumMapping";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v19[0] = v2;
  v20[0] = @"None";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
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
  v9 = [(id)objc_opt_class() subsystem];
  v10 = +[PPSUnit dimensionless];
  v11 = +[PPSCadence cadenceInit];
  v12 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v8, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"TransferMethod", v9, @"BuddyData", 7, v10, v11, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, v7);

  v13 = [PPSMetric alloc];
  v14 = +[PPSUnit seconds];
  v15 = [(PPSMetric *)v13 initWithName:@"SetupDate" version:8 datatype:v14 unit:v12 baseMetric:0 optionalPayload:1.0];

  v18[0] = v12;
  v18[1] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];

  return v16;
}

+ (id)AppResumeInferredCarryMetrics
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = [(id)objc_opt_class() subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceInit];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"CarryType", v3, @"AppResumeInferredCarry", 7, v4, v5, 1.0, 0x500000003, 0x100000018, 0x100000001, 0x100000001, 0);

  v9[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];

  return v7;
}

+ (id)FeatureFlagMetrics
{
  v24[4] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = [(id)objc_opt_class() subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceInit];
  v23 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Domain", v3, @"FeatureFlag", 3, v4, v5, 1.0, 0x500000003, 0x100000018, 0x100000001, 0x100000001, &unk_270701DA0);

  v6 = [PPSMetric alloc];
  v7 = [(id)objc_opt_class() subsystem];
  v8 = +[PPSUnit dimensionless];
  v9 = +[PPSCadence cadenceInit];
  v22 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v6, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"FeatureName", v7, @"FeatureFlag", 3, v8, v9, 1.0, 0x500000003, 0x100000018, 0x100000001, 0x100000001, &unk_270701DA0);

  v10 = [PPSMetric alloc];
  v11 = [(id)objc_opt_class() subsystem];
  v12 = +[PPSUnit dimensionless];
  v13 = +[PPSCadence cadenceInit];
  v14 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v10, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"State", v11, @"FeatureFlag", 7, v12, v13, 1.0, 0x500000003, 0x100000018, 0x100000001, 0x100000001, &unk_270701DA0);

  v15 = [PPSMetric alloc];
  v16 = [(id)objc_opt_class() subsystem];
  v17 = +[PPSUnit dimensionless];
  v18 = +[PPSCadence cadenceInit];
  v19 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v15, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"TargetRelease", v16, @"FeatureFlag", 3, v17, v18, 1.0, 0x500000003, 0x100000018, 0x100000001, 0x100000001, &unk_270701DA0);

  v24[0] = v23;
  v24[1] = v22;
  v24[2] = v14;
  v24[3] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:4];

  return v20;
}

+ (id)localeMetrics
{
  v15[3] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = [(id)objc_opt_class() subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSBGProcessingCommonMetrics timezoneLoggingCadence];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"TimeZoneName", v3, @"Locale", 3, v4, v5, 1.0, 0x500000003, 0x100000018, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit seconds];
  v9 = [(PPSMetric *)v7 initWithName:@"SecondsFromGMT" version:7 datatype:v8 unit:v6 baseMetric:0 optionalPayload:1.0];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit dimensionless];
  v12 = [(PPSMetric *)v10 initWithName:@"TimeZoneIsInDST" version:5 datatype:v11 unit:v6 baseMetric:0 optionalPayload:1.0];

  v15[0] = v6;
  v15[1] = v9;
  void v15[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];

  return v13;
}

+ (id)timeOffsetMetrics
{
  v12[2] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = [(id)objc_opt_class() subsystem];
  v4 = +[PPSUnit seconds];
  v5 = [(id)objc_opt_class() timeOffsetCadence];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"system", v3, @"TimeOffset", 8, v4, v5, 1.0, 0x500000003, 0x100000018, 0x300000001, 0x100000001, &unk_270701DC8);

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit seconds];
  v9 = [(PPSMetric *)v7 initWithName:@"kernel" version:8 datatype:v8 unit:v6 baseMetric:&unk_270701DC8 optionalPayload:1.0];

  v12[0] = v6;
  v12[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];

  return v10;
}

+ (id)configMetrics
{
  v113[1] = *MEMORY[0x263EF8340];
  v112 = @"EnumMapping";
  v102 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v110[0] = v102;
  v111[0] = @"iPhone";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v110[1] = v2;
  v111[1] = @"iPad";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v110[2] = v3;
  v111[2] = @"iPod";
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v110[3] = v4;
  v111[3] = @"Watch";
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v110[4] = v5;
  v111[4] = @"Mac";
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v110[5] = v6;
  v111[5] = @"HomePod";
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v110[6] = v7;
  v111[6] = @"AppleTV";
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 86);
  v110[7] = v8;
  v111[7] = @"VisionPro";
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1000);
  v110[8] = v9;
  v111[8] = @"Other";
  v10 = [NSDictionary dictionaryWithObjects:v111 forKeys:v110 count:9];
  v113[0] = v10;
  v104 = [NSDictionary dictionaryWithObjects:v113 forKeys:&v112 count:1];

  v11 = [PPSMetric alloc];
  v12 = [(id)objc_opt_class() subsystem];
  v13 = +[PPSUnit dimensionless];
  v14 = +[PPSCadence cadenceInit];
  v103 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v11, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"BootArgs", v12, @"Config", 3, v13, v14, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v15 = [PPSMetric alloc];
  v16 = [(id)objc_opt_class() subsystem];
  v17 = +[PPSUnit dimensionless];
  v18 = +[PPSCadence cadenceInit];
  v101 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v15, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Build", v16, @"Config", 3, v17, v18, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v19 = [PPSMetric alloc];
  v20 = [(id)objc_opt_class() subsystem];
  v21 = +[PPSUnit dimensionless];
  v22 = +[PPSCadence cadenceInit];
  v100 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v19, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Device", v20, @"Config", 3, v21, v22, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v23 = [PPSMetric alloc];
  v24 = [(id)objc_opt_class() subsystem];
  v25 = +[PPSUnit dimensionless];
  v26 = +[PPSCadence cadenceInit];
  v99 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v23, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"DeviceType", v24, @"Config", 7, v25, v26, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, v104);

  v27 = [PPSMetric alloc];
  v28 = [(id)objc_opt_class() subsystem];
  v29 = +[PPSUnit dimensionless];
  v30 = +[PPSCadence cadenceInit];
  v98 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v27, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"DeviceBootTime", v28, @"Config", 4, v29, v30, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v31 = [PPSMetric alloc];
  v32 = [(id)objc_opt_class() subsystem];
  v33 = +[PPSUnit dimensionless];
  v34 = +[PPSCadence cadenceInit];
  v97 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v31, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"SupplementalBuild", v32, @"Config", 3, v33, v34, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v35 = [PPSMetric alloc];
  v36 = [(id)objc_opt_class() subsystem];
  v37 = +[PPSUnit dimensionless];
  v38 = +[PPSCadence cadenceInit];
  v96 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v35, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"CustomerOS", v36, @"Config", 3, v37, v38, 2.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v39 = [PPSMetric alloc];
  v40 = [(id)objc_opt_class() subsystem];
  v41 = +[PPSUnit dimensionless];
  v42 = +[PPSCadence cadenceInit];
  v95 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v39, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"LastBuild", v40, @"Config", 3, v41, v42, 2.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v43 = [PPSMetric alloc];
  v44 = [(id)objc_opt_class() subsystem];
  v45 = +[PPSUnit dimensionless];
  v46 = +[PPSCadence cadenceInit];
  v94 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v43, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"LastUpgradeTimestamp", v44, @"Config", 8, v45, v46, 2.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v47 = [PPSMetric alloc];
  v48 = [(id)objc_opt_class() subsystem];
  v49 = +[PPSUnit dimensionless];
  v50 = +[PPSCadence cadenceInit];
  v93 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v47, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"LastUpgradeSystemTimestamp", v48, @"Config", 8, v49, v50, 2.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v51 = [PPSMetric alloc];
  v52 = [(id)objc_opt_class() subsystem];
  v53 = +[PPSUnit megabytes];
  v54 = +[PPSCadence cadenceInit];
  v92 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v51, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"DeviceDiskSize", v52, @"Config", 7, v53, v54, 2.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v55 = [PPSMetric alloc];
  v56 = [(id)objc_opt_class() subsystem];
  v57 = +[PPSUnit dimensionless];
  v58 = +[PPSCadence cadenceInit];
  v91 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v55, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"OSVariant", v56, @"Config", 7, v57, v58, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v59 = [PPSMetric alloc];
  v60 = [(id)objc_opt_class() subsystem];
  v61 = +[PPSUnit dimensionless];
  v62 = +[PPSCadence cadenceInit];
  v90 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v59, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"DeviceSerialNumber", v60, @"Config", 3, v61, v62, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v63 = [PPSMetric alloc];
  v64 = [(id)objc_opt_class() subsystem];
  v65 = +[PPSUnit dimensionless];
  v66 = +[PPSCadence cadenceInit];
  v89 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v63, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Device_SoC", v64, @"Config", 3, v65, v66, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v67 = [PPSMetric alloc];
  v68 = [(id)objc_opt_class() subsystem];
  v69 = +[PPSUnit dimensionless];
  v70 = +[PPSCadence cadenceInit];
  v88 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v67, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"RootInstalled", v68, @"Config", 7, v69, v70, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v108 = @"EnumMapping";
  v71 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v106[0] = v71;
  v107[0] = @"Erase install";
  v72 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v106[1] = v72;
  v107[1] = @"Minor upgrade install";
  v73 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v106[2] = v73;
  v107[2] = @"Major upgrade install";
  v74 = [NSDictionary dictionaryWithObjects:v107 forKeys:v106 count:3];
  v109 = v74;
  v86 = [NSDictionary dictionaryWithObjects:&v109 forKeys:&v108 count:1];

  v75 = [PPSMetric alloc];
  v76 = [(id)objc_opt_class() subsystem];
  v77 = +[PPSUnit dimensionless];
  v78 = +[PPSCadence cadenceInit];
  v85 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v75, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"InstallType", v76, @"Config", 7, v77, v78, 2.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, v86);

  v79 = [PPSMetric alloc];
  v80 = [(id)objc_opt_class() subsystem];
  v81 = +[PPSUnit dimensionless];
  v82 = +[PPSCadence cadenceInit];
  v83 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v79, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"AutomatedDeviceGroup", v80, @"Config", 3, v81, v82, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v105[0] = v103;
  v105[1] = v101;
  v105[2] = v100;
  v105[3] = v99;
  v105[4] = v98;
  v105[5] = v97;
  v105[6] = v96;
  v105[7] = v95;
  v105[8] = v94;
  v105[9] = v93;
  v105[10] = v91;
  v105[11] = v92;
  v105[12] = v90;
  v105[13] = v89;
  v105[14] = v88;
  v105[15] = v83;
  v105[16] = v85;
  id v87 = [MEMORY[0x263EFF8C0] arrayWithObjects:v105 count:17];

  return v87;
}

+ (id)timezoneLoggingCadence
{
  v10[2] = *MEMORY[0x263EF8340];
  v2 = [[PPSCadenceTuple alloc] initWithCadenceType:4 value:0];
  v3 = [[PPSCadenceTuple alloc] initWithCadenceType:3 value:10];
  v4 = v3;
  v5 = 0;
  if (v2) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    v7 = [PPSCadence alloc];
    v10[0] = v2;
    v10[1] = v4;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    v5 = [(PPSCadence *)v7 initWithCadenceTuples:v8];
  }
  return v5;
}

+ (id)timeOffsetCadence
{
  void v12[3] = *MEMORY[0x263EF8340];
  v2 = [[PPSCadenceTuple alloc] initWithCadenceType:4 value:0];
  v3 = [[PPSCadenceTuple alloc] initWithCadenceType:3 value:5];
  v4 = [[PPSCadenceTuple alloc] initWithCadenceType:3 value:6];
  v5 = v4;
  BOOL v6 = 0;
  if (v2) {
    BOOL v7 = v3 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7 && v4 != 0)
  {
    v9 = [PPSCadence alloc];
    v12[0] = v2;
    v12[1] = v3;
    v12[2] = v5;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];
    BOOL v6 = [(PPSCadence *)v9 initWithCadenceTuples:v10];
  }
  return v6;
}

@end