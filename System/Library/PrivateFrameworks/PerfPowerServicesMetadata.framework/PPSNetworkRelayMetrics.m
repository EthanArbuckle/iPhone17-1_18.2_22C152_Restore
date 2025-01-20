@interface PPSNetworkRelayMetrics
+ (id)allDeclMetrics;
+ (id)linkAdvisoryMetrics;
+ (id)subsystem;
@end

@implementation PPSNetworkRelayMetrics

+ (id)subsystem
{
  return @"NetworkRelay";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() linkAdvisoryMetrics];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (id)linkAdvisoryMetrics
{
  v69[1] = *MEMORY[0x263EF8340];
  v68 = @"MetricType";
  v2 = +[PPSMetricType genericDimension];
  v69[0] = v2;
  v50 = [NSDictionary dictionaryWithObjects:v69 forKeys:&v68 count:1];

  v3 = [PPSMetric alloc];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v3, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"bundleID", @"NetworkRelay", @"LinkAdvisory", 3, v4, v5, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v50);

  v66 = @"MetricType";
  v7 = +[PPSMetricType genericDimension];
  v67 = v7;
  v49 = [NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];

  v8 = [PPSMetric alloc];
  v9 = +[PPSUnit dimensionless];
  v48 = [(PPSMetric *)v8 initWithName:@"reason" version:7 datatype:v9 unit:v6 baseMetric:v49 optionalPayload:1.0];

  v64[0] = @"EnumMapping";
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v62[0] = v10;
  v63[0] = @"Invalid";
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v62[1] = v11;
  v63[1] = @"Start-Advice";
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v62[2] = v12;
  v63[2] = @"Advice-Activated";
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v62[3] = v13;
  v63[3] = @"End-Advice";
  v14 = [NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:4];
  v65[0] = v14;
  v65[1] = &unk_270701CF8;
  v64[1] = @"GroupingDimensions";
  v64[2] = @"MetricType";
  v15 = +[PPSMetricType stateDimension];
  v65[2] = v15;
  v47 = [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:3];

  v16 = [PPSMetric alloc];
  v17 = +[PPSUnit dimensionless];
  v46 = [(PPSMetric *)v16 initWithName:@"activity" version:7 datatype:v17 unit:v6 baseMetric:v47 optionalPayload:2.0];

  v60[0] = @"EnumMapping";
  v18 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v58[0] = v18;
  v59[0] = @"None";
  v19 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v58[1] = v19;
  v59[1] = @"BT Default";
  v20 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v58[2] = v20;
  v59[2] = @"BT Classic";
  v21 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v58[3] = v21;
  v59[3] = @"WiFi";
  v22 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v58[4] = v22;
  v59[4] = @"No Upgrade";
  v23 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:5];
  v61[0] = v23;
  v60[1] = @"MetricType";
  v24 = +[PPSMetricType genericDimension];
  v61[1] = v24;
  v45 = [NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];

  v25 = [PPSMetric alloc];
  v26 = +[PPSUnit dimensionless];
  v44 = [(PPSMetric *)v25 initWithName:@"advice" version:7 datatype:v26 unit:v6 baseMetric:v45 optionalPayload:1.0];

  v56[0] = @"GroupingDimensions";
  v56[1] = @"MetricType";
  v57[0] = &unk_270701D10;
  v27 = +[PPSMetricType absoluteMeasure];
  v57[1] = v27;
  v43 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];

  v28 = [PPSMetric alloc];
  v29 = +[PPSUnit megabytes];
  v30 = [(PPSMetric *)v28 initWithName:@"estimatedMB" version:7 datatype:v29 unit:v6 baseMetric:v43 optionalPayload:1.0];

  v54[1] = @"MetricType";
  v55[0] = &unk_270701D28;
  v54[0] = @"GroupingDimensions";
  v31 = +[PPSMetricType absoluteMeasure];
  v55[1] = v31;
  v32 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];

  v33 = [PPSMetric alloc];
  v34 = +[PPSUnit megabytes];
  v35 = [(PPSMetric *)v33 initWithName:@"actualMBOverWiFi" version:7 datatype:v34 unit:v6 baseMetric:v32 optionalPayload:1.0];

  v52[0] = @"GroupingDimensions";
  v52[1] = @"MetricType";
  v53[0] = &unk_270701D40;
  v36 = +[PPSMetricType absoluteMeasure];
  v53[1] = v36;
  v37 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];

  v38 = [PPSMetric alloc];
  v39 = +[PPSUnit megabytes];
  v40 = [(PPSMetric *)v38 initWithName:@"actualMBOverCompanionLink" version:7 datatype:v39 unit:v6 baseMetric:v37 optionalPayload:1.0];

  v51[0] = v6;
  v51[1] = v48;
  v51[2] = v46;
  v51[3] = v44;
  v51[4] = v30;
  v51[5] = v35;
  v51[6] = v40;
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:7];

  return v41;
}

@end