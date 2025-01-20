@interface PPSGenerativeFunctionMetrics
+ (id)allDeclMetrics;
+ (id)appleDiffusionMetrics;
+ (id)assetLoadMetrics;
+ (id)fileResidentRatioMetrics;
+ (id)handwritingModelInferenceMetrics;
+ (id)handwritingModelLoadMetrics;
+ (id)mmExecuteRequestMetrics;
+ (id)optInMetrics;
+ (id)smartReplySessionMetrics;
+ (id)subsystem;
+ (id)summarizationMetrics;
+ (id)tgiExecuteRequestMetrics;
@end

@implementation PPSGenerativeFunctionMetrics

+ (id)subsystem
{
  return @"GenerativeFunctionMetrics";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() appleDiffusionMetrics];
  [v2 addObjectsFromArray:v3];

  v4 = [(id)objc_opt_class() assetLoadMetrics];
  [v2 addObjectsFromArray:v4];

  v5 = [(id)objc_opt_class() fileResidentRatioMetrics];
  [v2 addObjectsFromArray:v5];

  v6 = [(id)objc_opt_class() handwritingModelInferenceMetrics];
  [v2 addObjectsFromArray:v6];

  v7 = [(id)objc_opt_class() handwritingModelLoadMetrics];
  [v2 addObjectsFromArray:v7];

  v8 = [(id)objc_opt_class() mmExecuteRequestMetrics];
  [v2 addObjectsFromArray:v8];

  v9 = [(id)objc_opt_class() optInMetrics];
  [v2 addObjectsFromArray:v9];

  v10 = [(id)objc_opt_class() smartReplySessionMetrics];
  [v2 addObjectsFromArray:v10];

  v11 = [(id)objc_opt_class() summarizationMetrics];
  [v2 addObjectsFromArray:v11];

  v12 = [(id)objc_opt_class() tgiExecuteRequestMetrics];
  [v2 addObjectsFromArray:v12];

  return v2;
}

+ (id)appleDiffusionMetrics
{
  v38[1] = *MEMORY[0x263EF8340];
  v37 = @"EnumMapping";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v35[0] = v2;
  v36[0] = @"100k - 200k pixels";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v35[1] = v3;
  v36[1] = @"200,001 - 500k pixels";
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v35[2] = v4;
  v36[2] = @"500,001 - 1.1m pixels";
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v35[3] = v5;
  v36[3] = @"> 1.1m pixels";
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v35[4] = v6;
  v36[4] = @"< 100k pixels or nil";
  v7 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:5];
  v38[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];

  v9 = [PPSMetric alloc];
  v10 = +[PPSGenerativeFunctionMetrics subsystem];
  v11 = +[PPSUnit dimensionless];
  v12 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v13 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v9, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"adapters", v10, @"appleDiffusion", 3, v11, v12, 1.0, 0x200000005, 0x100000001, 0x300000001, 0x100000001, 0);

  v14 = [PPSMetric alloc];
  v15 = +[PPSUnit dimensionless];
  v16 = [(PPSMetric *)v14 initWithName:@"generationID" version:3 datatype:v15 unit:v13 baseMetric:0 optionalPayload:1.0];

  v17 = [PPSMetric alloc];
  v18 = +[PPSUnit dimensionless];
  v19 = [(PPSMetric *)v17 initWithName:@"inputPixels" version:7 datatype:v18 unit:v13 baseMetric:v8 optionalPayload:1.0];

  v20 = [PPSMetric alloc];
  v21 = +[PPSUnit dimensionless];
  v22 = [(PPSMetric *)v20 initWithName:@"outputPixels" version:7 datatype:v21 unit:v13 baseMetric:v8 optionalPayload:1.0];

  v23 = [PPSMetric alloc];
  v24 = +[PPSUnit dimensionless];
  v25 = [(PPSMetric *)v23 initWithName:@"requestIdentifier" version:3 datatype:v24 unit:v13 baseMetric:0 optionalPayload:1.0];

  v26 = [PPSMetric alloc];
  v27 = +[PPSUnit seconds];
  v28 = [(PPSMetric *)v26 initWithName:@"timestampEnd" version:4 datatype:v27 unit:v13 baseMetric:0 optionalPayload:1.0];

  v29 = [PPSMetric alloc];
  v30 = +[PPSUnit dimensionless];
  v31 = [(PPSMetric *)v29 initWithName:@"unetIterations" version:7 datatype:v30 unit:v13 baseMetric:0 optionalPayload:1.0];

  v34[0] = v13;
  v34[1] = v16;
  v34[2] = v19;
  v34[3] = v22;
  v34[4] = v25;
  v34[5] = v28;
  v34[6] = v31;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:7];

  return v32;
}

+ (id)assetLoadMetrics
{
  v70[1] = *MEMORY[0x263EF8340];
  v69 = @"MetricType";
  v2 = +[PPSMetricType genericDimension];
  v70[0] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v70 forKeys:&v69 count:1];

  v4 = [PPSMetric alloc];
  v5 = +[PPSGenerativeFunctionMetrics subsystem];
  v6 = +[PPSUnit dimensionless];
  v7 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v54 = (void *)v3;
  v55 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v4, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"catalogResourceIdentifier", v5, @"assetLoad", 3, v6, v7, 1.1, 0x200000005, 0x100000001, 0x300000001, 0x100000001, v3);

  v8 = [PPSMetric alloc];
  v9 = +[PPSUnit dimensionless];
  v53 = [(PPSMetric *)v8 initWithName:@"inferenceProviderIdentifier" version:3 datatype:v9 unit:v55 baseMetric:v3 optionalPayload:1.0];

  v67 = @"EnumMapping";
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v65[0] = v10;
  v66[0] = @"Acquire";
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v65[1] = v11;
  v66[1] = @"Release";
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v65[2] = v12;
  v66[2] = @"Unloaded-To-Dynamic-Mode";
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v65[3] = v13;
  v66[3] = @"Loaded-To-Dynamic-Mode";
  v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v65[4] = v14;
  v66[4] = @"Dynamic-Mode-To-Loaded";
  v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v65[5] = v15;
  v66[5] = @"Dynamic-Mode-To-Unloaded";
  v16 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:6];
  v68 = v16;
  v52 = [NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];

  v17 = [PPSMetric alloc];
  v18 = +[PPSUnit dimensionless];
  v51 = [(PPSMetric *)v17 initWithName:@"loadType" version:7 datatype:v18 unit:v55 baseMetric:v52 optionalPayload:1.1];

  v63 = @"EnumMapping";
  v49 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v61[0] = v49;
  v62[0] = @"Unknown";
  v48 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v61[1] = v48;
  v62[1] = @"User-Initiated";
  v47 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v61[2] = v47;
  v62[2] = @"Policy-Change";
  v46 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v61[3] = v46;
  v62[3] = @"Memory-Budget-Pressure";
  v45 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v61[4] = v45;
  v62[4] = @"Aquisition-Error";
  v19 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v61[5] = v19;
  v62[5] = @"Prewarm";
  v20 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v61[6] = v20;
  v62[6] = @"Inactivity-Timer";
  v21 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
  v61[7] = v21;
  v62[7] = @"Asset-Version-Change";
  v22 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
  v61[8] = v22;
  v62[8] = @"Background-Session";
  v23 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v61[9] = v23;
  v62[9] = @"Connection-Termination";
  v24 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
  v61[10] = v24;
  v62[10] = @"Critical-Memory";
  v25 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:11];
  v64 = v25;
  v50 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];

  v26 = [PPSMetric alloc];
  v27 = +[PPSUnit dimensionless];
  v28 = [(PPSMetric *)v26 initWithName:@"reason" version:7 datatype:v27 unit:v55 baseMetric:v50 optionalPayload:1.3];

  v59 = @"EnumMapping";
  v29 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v57[0] = v29;
  v58[0] = @"Unknown";
  v30 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v57[1] = v30;
  v58[1] = @"Success";
  v31 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v57[2] = v31;
  v58[2] = @"Failure";
  v32 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:3];
  v60 = v32;
  v33 = [NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];

  v34 = [PPSMetric alloc];
  v35 = +[PPSUnit dimensionless];
  v36 = [(PPSMetric *)v34 initWithName:@"result" version:7 datatype:v35 unit:v55 baseMetric:v33 optionalPayload:2.0];

  v37 = [PPSMetric alloc];
  v38 = +[PPSUnit dimensionless];
  v39 = [(PPSMetric *)v37 initWithName:@"sessionIdentifier" version:3 datatype:v38 unit:v55 baseMetric:0 optionalPayload:1.0];

  v40 = [PPSMetric alloc];
  v41 = +[PPSUnit seconds];
  v42 = [(PPSMetric *)v40 initWithName:@"timestampEnd" version:4 datatype:v41 unit:v55 baseMetric:0 optionalPayload:1.0];

  v56[0] = v55;
  v56[1] = v53;
  v56[2] = v51;
  v56[3] = v28;
  v56[4] = v36;
  v56[5] = v39;
  v56[6] = v42;
  v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:7];

  return v43;
}

+ (id)fileResidentRatioMetrics
{
  v15[3] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  uint64_t v3 = +[PPSGenerativeFunctionMetrics subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"catalogResourceIdentifier", v3, @"fileResidentInfo", 3, v4, v5, 1.0, 0x200000002, 0x100000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit dimensionless];
  v9 = [(PPSMetric *)v7 initWithName:@"fileResidentRatio" version:7 datatype:v8 unit:v6 baseMetric:0 optionalPayload:1.0];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit kilobytes];
  v12 = [(PPSMetric *)v10 initWithName:@"memoryCostKB" version:7 datatype:v11 unit:v6 baseMetric:0 optionalPayload:1.0];

  v15[0] = v6;
  v15[1] = v9;
  v15[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];

  return v13;
}

+ (id)handwritingModelInferenceMetrics
{
  v34[1] = *MEMORY[0x263EF8340];
  v33 = @"EnumMapping";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v31[0] = v2;
  v32[0] = @"Stroke-Classifier";
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v31[1] = v3;
  v32[1] = @"Stroke-Grouping";
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v31[2] = v4;
  v32[2] = @"Math-Recognizer";
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v31[3] = v5;
  v32[3] = @"Synthesizer";
  v6 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];
  v34[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];

  v8 = [PPSMetric alloc];
  v9 = +[PPSGenerativeFunctionMetrics subsystem];
  v10 = +[PPSUnit dimensionless];
  v11 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v12 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v8, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"model", v9, @"HandwritingInference", 7, v10, v11, 1.0, 0x200000005, 0x100000001, 0x300000001, 0x100000001, v7);

  v13 = [PPSMetric alloc];
  v14 = +[PPSUnit dimensionless];
  v15 = [(PPSMetric *)v13 initWithName:@"inputStringLength" version:7 datatype:v14 unit:v12 baseMetric:0 optionalPayload:1.0];

  v16 = [PPSMetric alloc];
  v17 = +[PPSUnit dimensionless];
  v18 = [(PPSMetric *)v16 initWithName:@"inputStrokeCount" version:7 datatype:v17 unit:v12 baseMetric:0 optionalPayload:1.0];

  v19 = [PPSMetric alloc];
  v20 = +[PPSUnit dimensionless];
  v21 = [(PPSMetric *)v19 initWithName:@"outputStringLength" version:7 datatype:v20 unit:v12 baseMetric:0 optionalPayload:1.0];

  v22 = [PPSMetric alloc];
  v23 = +[PPSUnit dimensionless];
  v24 = [(PPSMetric *)v22 initWithName:@"outputStrokeCount" version:7 datatype:v23 unit:v12 baseMetric:0 optionalPayload:1.0];

  v25 = [PPSMetric alloc];
  v26 = +[PPSUnit seconds];
  v27 = [(PPSMetric *)v25 initWithName:@"timestampEnd" version:4 datatype:v26 unit:v12 baseMetric:0 optionalPayload:1.0];

  v30[0] = v12;
  v30[1] = v15;
  v30[2] = v18;
  v30[3] = v21;
  v30[4] = v24;
  v30[5] = v27;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:6];

  return v28;
}

+ (id)handwritingModelLoadMetrics
{
  v30[1] = *MEMORY[0x263EF8340];
  v29 = @"EnumMapping";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v27[0] = v2;
  v28[0] = @"Stroke-Classifier";
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v27[1] = v3;
  v28[1] = @"Stroke-Grouping";
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v27[2] = v4;
  v28[2] = @"Math-Recognizer";
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v27[3] = v5;
  v28[3] = @"Synthesizer";
  v6 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:4];
  v30[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];

  v8 = [PPSMetric alloc];
  v9 = +[PPSGenerativeFunctionMetrics subsystem];
  v10 = +[PPSUnit dimensionless];
  v11 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v12 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v8, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"model", v9, @"HandwritingModelLoad", 7, v10, v11, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v7);

  v25 = @"EnumMapping";
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v23[0] = v13;
  v24[0] = @"Acquire";
  v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v23[1] = v14;
  v24[1] = @"Release";
  v15 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  v26 = v15;
  v16 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];

  v17 = [PPSMetric alloc];
  v18 = +[PPSUnit dimensionless];
  v19 = [(PPSMetric *)v17 initWithName:@"loadType" version:7 datatype:v18 unit:v12 baseMetric:v16 optionalPayload:1.0];

  v22[0] = v12;
  v22[1] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];

  return v20;
}

+ (id)mmExecuteRequestMetrics
{
  v66[1] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  uint64_t v3 = +[PPSGenerativeFunctionMetrics subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"catalogResourceIdentifier", v3, @"mmExecuteRequest", 3, v4, v5, 1.1, 0x200000005, 0x100000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit dimensionless];
  v53 = [(PPSMetric *)v7 initWithName:@"createdByBundleIdentifier" version:3 datatype:v8 unit:v6 baseMetric:0 optionalPayload:1.0];

  v65 = @"EnumMapping";
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v63[0] = v9;
  v64[0] = @"No-Error";
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v63[1] = v10;
  v64[1] = @"Error";
  v11 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];
  v66[0] = v11;
  v52 = [NSDictionary dictionaryWithObjects:v66 forKeys:&v65 count:1];

  v12 = [PPSMetric alloc];
  v13 = +[PPSUnit dimensionless];
  v51 = [(PPSMetric *)v12 initWithName:@"error" version:5 datatype:v13 unit:v6 baseMetric:v52 optionalPayload:1.0];

  v14 = [PPSMetric alloc];
  v15 = +[PPSUnit dimensionless];
  v50 = [(PPSMetric *)v14 initWithName:@"inferenceProviderIdentifier" version:3 datatype:v15 unit:v6 baseMetric:0 optionalPayload:1.0];

  v16 = [PPSMetric alloc];
  v17 = +[PPSUnit dimensionless];
  v49 = [(PPSMetric *)v16 initWithName:@"onBehalfOfBundleIdentifier" version:3 datatype:v17 unit:v6 baseMetric:0 optionalPayload:1.1];

  v61 = @"EnumMapping";
  v18 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0xFFFFFFFFLL);
  v59[0] = v18;
  v60[0] = @"Default";
  v19 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 33);
  v59[1] = v19;
  v60[1] = @"User-Interactive";
  v20 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 25);
  v59[2] = v20;
  v60[2] = @"User-Initiated";
  v21 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 17);
  v59[3] = v21;
  v60[3] = @"Utility";
  v22 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v59[4] = v22;
  v60[4] = @"Background";
  v23 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:5];
  v62 = v23;
  v48 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];

  v24 = [PPSMetric alloc];
  v25 = +[PPSUnit dimensionless];
  v47 = [(PPSMetric *)v24 initWithName:@"qos" version:7 datatype:v25 unit:v6 baseMetric:v48 optionalPayload:1.0];

  v26 = [PPSMetric alloc];
  v27 = +[PPSUnit dimensionless];
  v46 = [(PPSMetric *)v26 initWithName:@"requestIdentifier" version:3 datatype:v27 unit:v6 baseMetric:0 optionalPayload:1.0];

  v57 = @"EnumMapping";
  v28 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v55[0] = v28;
  v56[0] = @"One-Shot";
  v29 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v55[1] = v29;
  v56[1] = @"Streaming";
  v30 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
  v58 = v30;
  v45 = [NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];

  v31 = [PPSMetric alloc];
  v32 = +[PPSUnit dimensionless];
  v44 = [(PPSMetric *)v31 initWithName:@"requestType" version:7 datatype:v32 unit:v6 baseMetric:v45 optionalPayload:1.0];

  v33 = [PPSMetric alloc];
  v34 = +[PPSUnit dimensionless];
  v35 = [(PPSMetric *)v33 initWithName:@"sessionIdentifier" version:3 datatype:v34 unit:v6 baseMetric:0 optionalPayload:1.0];

  v36 = [PPSMetric alloc];
  v37 = +[PPSUnit dimensionless];
  v38 = [(PPSMetric *)v36 initWithName:@"useCaseIdentifier" version:3 datatype:v37 unit:v6 baseMetric:0 optionalPayload:1.0];

  v39 = [PPSMetric alloc];
  v40 = +[PPSUnit seconds];
  v41 = [(PPSMetric *)v39 initWithName:@"timestampEnd" version:4 datatype:v40 unit:v6 baseMetric:0 optionalPayload:1.0];

  v54[0] = v6;
  v54[1] = v53;
  v54[2] = v51;
  v54[3] = v50;
  v54[4] = v49;
  v54[5] = v47;
  v54[6] = v46;
  v54[7] = v44;
  v54[8] = v35;
  v54[9] = v38;
  v54[10] = v41;
  id v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:11];

  return v43;
}

+ (id)optInMetrics
{
  v18[2] = *MEMORY[0x263EF8340];
  v17[0] = @"EnumMapping";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v15[0] = v2;
  v16[0] = @"Disabled/Unavailable";
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
  v8 = +[PPSGenerativeFunctionMetrics subsystem];
  v9 = +[PPSUnit dimensionless];
  v10 = +[PPSCadence cadenceEventXPCWithFrequency:1];
  v11 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Enabled", v8, @"OptIn", 5, v9, v10, 2.01, 0x200000003, 0x100000001, 0x300000015, 0x100000001, v6);

  v14 = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];

  return v12;
}

+ (id)summarizationMetrics
{
  v68[1] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  uint64_t v3 = +[PPSGenerativeFunctionMetrics subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v59 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"bundleID", v3, @"Summarization", 3, v4, v5, 1.0, 0x200000005, 0x100000001, 0x300000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  v7 = +[PPSGenerativeFunctionMetrics subsystem];
  v8 = +[PPSUnit dimensionless];
  v9 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v58 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v6, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"characterLength", v7, @"Summarization", 7, v8, v9, 1.0, 0x200000005, 0x100000001, 0x100000001, 0x100000001, 0);

  v67 = @"EnumMapping";
  v55 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v65[0] = v55;
  v66[0] = @"Missing-ID";
  v53 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v65[1] = v53;
  v66[1] = @"MissingSender";
  v52 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v65[2] = v52;
  v66[2] = @"Domain-ID";
  v51 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v65[3] = v51;
  void v66[3] = @"Already-Handled-By-Mail-Pipeline";
  v50 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v65[4] = v50;
  v66[4] = @"Already-Handled-By-Messages-Pipeline";
  v49 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v65[5] = v49;
  v66[5] = @"Already-Processed";
  v48 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  void v65[6] = v48;
  void v66[6] = @"Not-Eligible-For-Summarization";
  v47 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
  v65[7] = v47;
  v66[7] = @"Stack-Not-Eligible-For-Summarization";
  v46 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
  v65[8] = v46;
  v66[8] = @"Notification-Not-Eligible-For-Summarization";
  v45 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v65[9] = v45;
  v66[9] = @"Task-Cancelled";
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
  v65[10] = v10;
  v66[10] = @"Task-Cancelled2";
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 11);
  v65[11] = v11;
  v66[11] = @"Throttled-By-Power-Budget";
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 12);
  v65[12] = v12;
  v66[12] = @"Successful";
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 13);
  v65[13] = v13;
  v66[13] = @"Failed";
  v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 14);
  v65[14] = v14;
  v66[14] = @"Input-Too-Short";
  v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 15);
  v65[15] = v15;
  v66[15] = @"Use-Case-Disabled";
  v16 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:16];
  v68[0] = v16;
  v57 = [NSDictionary dictionaryWithObjects:v68 forKeys:&v67 count:1];

  v17 = [PPSMetric alloc];
  v18 = +[PPSUnit dimensionless];
  v56 = [(PPSMetric *)v17 initWithName:@"exitReason" version:7 datatype:v18 unit:v59 baseMetric:v57 optionalPayload:1.1];

  v63 = @"EnumMapping";
  v19 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v61[0] = v19;
  v62[0] = @"Mail";
  v20 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v61[1] = v20;
  v62[1] = @"Message";
  v21 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v61[2] = v21;
  v62[2] = @"Notification";
  v22 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v61[3] = v22;
  v62[3] = @"Notification-Stack";
  v23 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v61[4] = v23;
  v62[4] = @"Mail-Thread";
  v24 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:5];
  v64 = v24;
  v54 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];

  v25 = [PPSMetric alloc];
  v26 = +[PPSUnit dimensionless];
  v27 = [(PPSMetric *)v25 initWithName:@"kind" version:7 datatype:v26 unit:v59 baseMetric:v54 optionalPayload:1.1];

  v28 = [PPSMetric alloc];
  v29 = +[PPSUnit dimensionless];
  v30 = [(PPSMetric *)v28 initWithName:@"isUrgent" version:5 datatype:v29 unit:v59 baseMetric:0 optionalPayload:1.0];

  v31 = [PPSMetric alloc];
  v32 = +[PPSUnit dimensionless];
  v33 = [(PPSMetric *)v31 initWithName:@"requestIdentifier" version:3 datatype:v32 unit:v59 baseMetric:0 optionalPayload:1.0];

  v34 = [PPSMetric alloc];
  v35 = +[PPSUnit dimensionless];
  v36 = [(PPSMetric *)v34 initWithName:@"stackDepth" version:7 datatype:v35 unit:v59 baseMetric:0 optionalPayload:1.0];

  v37 = [PPSMetric alloc];
  v38 = +[PPSUnit dimensionless];
  v39 = [(PPSMetric *)v37 initWithName:@"timestampEnd" version:4 datatype:v38 unit:v59 baseMetric:0 optionalPayload:1.0];

  v40 = [PPSMetric alloc];
  v41 = +[PPSUnit dimensionless];
  v42 = [(PPSMetric *)v40 initWithName:@"urgencyPipelineUsed" version:5 datatype:v41 unit:v59 baseMetric:0 optionalPayload:1.0];

  v60[0] = v59;
  v60[1] = v58;
  v60[2] = v27;
  v60[3] = v30;
  v60[4] = v56;
  void v60[5] = v33;
  v60[6] = v36;
  v60[7] = v39;
  v60[8] = v42;
  id v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:9];

  return v43;
}

+ (id)tgiExecuteRequestMetrics
{
  v110[1] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  uint64_t v3 = +[PPSGenerativeFunctionMetrics subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v96 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"inputTokensCount", v3, @"tgiExecuteRequest", 7, v4, v5, 1.0, 0x200000005, 0x100000001, 0x300000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  v7 = +[PPSUnit dimensionless];
  v97 = [(PPSMetric *)v6 initWithName:@"outputTokensCount" version:7 datatype:v7 unit:v96 baseMetric:0 optionalPayload:1.0];

  v109 = @"EnumMapping";
  v94 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v107[0] = v94;
  v108[0] = @"No-Error";
  v92 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v107[1] = v92;
  v108[1] = @"General-Request-Failure";
  v90 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v107[2] = v90;
  v108[2] = @"Create-Inference-ContextFailure";
  v88 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v107[3] = v88;
  v108[3] = @"General-Failure";
  v86 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v107[4] = v86;
  v108[4] = @"Unknown-Special-Token";
  v83 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v107[5] = v83;
  v108[5] = @"Tokenization-Failed";
  v81 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v107[6] = v81;
  v108[6] = @"Max-Output-Tokens-Value";
  v79 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
  v107[7] = v79;
  v108[7] = @"Extend-Inference-Failure";
  v77 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
  v107[8] = v77;
  v108[8] = @"Encode-Response-Failure";
  v75 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v107[9] = v75;
  v108[9] = @"Stream-Cancelled";
  v73 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
  v107[10] = v73;
  v108[10] = @"Stream-Not-Found";
  objc_msgSend(NSString, "stringWithFormat:", @"%d", 11);
  id v71 = (id)objc_claimAutoreleasedReturnValue();
  v107[11] = v71;
  v108[11] = @"Output-Token-Resolution-Failure";
  v70 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 12);
  v107[12] = v70;
  v108[12] = @"No-Catalog";
  v69 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 13);
  v107[13] = v69;
  v108[13] = @"Unknown-Request-Payload-Case";
  v68 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 14);
  v107[14] = v68;
  v108[14] = @"Words-To-String-Conversation-Failure";
  v67 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 15);
  v107[15] = v67;
  v108[15] = @"Async-Stream-Failed";
  v66 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 16);
  v107[16] = v66;
  v108[16] = @"Prompt-Render-Error";
  v65 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 17);
  v107[17] = v65;
  v108[17] = @"Response-Type";
  v64 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 18);
  v107[18] = v64;
  v108[18] = @"One-Shot-Server-Response-Missing-Completion";
  v63 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 19);
  v107[19] = v63;
  v108[19] = @"Stream-Server-Response-Missing-Completion";
  v62 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 20);
  v107[20] = v62;
  v108[20] = @"Visual-Generation-Unknown-Generator";
  v61 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 21);
  v107[21] = v61;
  v108[21] = @"Visual-Generation-Unspecified-Goals";
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 22);
  v107[22] = v8;
  v108[22] = @"Visual-Generation-Unexpected-Condition";
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 23);
  v107[23] = v9;
  v108[23] = @"Visual-Generation-Missing-Resource";
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 24);
  v107[24] = v10;
  v108[24] = @"Visual-Generation-Analysis-Error";
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 25);
  v107[25] = v11;
  v108[25] = @"Visual-Generation-Initialization-Error";
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 26);
  v107[26] = v12;
  v108[26] = @"Visual-Generation-Image-Rejected";
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 27);
  v107[27] = v13;
  v108[27] = @"Visual-Generation-Image-Type-Not-Supported";
  v14 = [NSDictionary dictionaryWithObjects:v108 forKeys:v107 count:28];
  v110[0] = v14;
  v85 = [NSDictionary dictionaryWithObjects:v110 forKeys:&v109 count:1];

  v15 = [PPSMetric alloc];
  v16 = +[PPSUnit dimensionless];
  v93 = [(PPSMetric *)v15 initWithName:@"errorType" version:7 datatype:v16 unit:v96 baseMetric:v85 optionalPayload:1.0];

  v17 = [PPSMetric alloc];
  v18 = +[PPSUnit milliseconds];
  v95 = [(PPSMetric *)v17 initWithName:@"extendTokenInferenceLatency" version:7 datatype:v18 unit:v96 baseMetric:0 optionalPayload:1.0];

  v19 = [PPSMetric alloc];
  v20 = +[PPSUnit milliseconds];
  v91 = [(PPSMetric *)v19 initWithName:@"firstTokenInferenceLatency" version:7 datatype:v20 unit:v96 baseMetric:0 optionalPayload:1.0];

  v21 = [PPSMetric alloc];
  v22 = +[PPSUnit dimensionless];
  v89 = [(PPSMetric *)v21 initWithName:@"requestIdentifier" version:3 datatype:v22 unit:v96 baseMetric:0 optionalPayload:1.0];

  v105 = @"EnumMapping";
  v23 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v103[0] = v23;
  v104[0] = @"One-Shot";
  v24 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v103[1] = v24;
  v104[1] = @"Streaming";
  v25 = [NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:2];
  v106 = v25;
  v84 = [NSDictionary dictionaryWithObjects:&v106 forKeys:&v105 count:1];

  v26 = [PPSMetric alloc];
  v27 = +[PPSUnit dimensionless];
  v87 = [(PPSMetric *)v26 initWithName:@"requestType" version:7 datatype:v27 unit:v96 baseMetric:v84 optionalPayload:1.0];

  v101 = @"EnumMapping";
  v28 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0xFFFFFFFFLL);
  v99[0] = v28;
  v100[0] = @"Default";
  v29 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 33);
  v99[1] = v29;
  v100[1] = @"User-Interactive";
  v30 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 25);
  v99[2] = v30;
  v100[2] = @"User-Initiated";
  v31 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 17);
  v99[3] = v31;
  v100[3] = @"Utility";
  v32 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v99[4] = v32;
  v100[4] = @"Background";
  v33 = [NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:5];
  v102 = v33;
  v82 = [NSDictionary dictionaryWithObjects:&v102 forKeys:&v101 count:1];

  v34 = [PPSMetric alloc];
  v35 = +[PPSUnit dimensionless];
  v80 = [(PPSMetric *)v34 initWithName:@"qos" version:7 datatype:v35 unit:v96 baseMetric:v82 optionalPayload:1.1];

  v36 = [PPSMetric alloc];
  v37 = +[PPSUnit dimensionless];
  v38 = [(PPSMetric *)v36 initWithName:@"sd_draftModelInferenceCallCount" version:7 datatype:v37 unit:v96 baseMetric:0 optionalPayload:1.0];

  v39 = [PPSMetric alloc];
  v40 = +[PPSUnit dimensionless];
  v41 = [(PPSMetric *)v39 initWithName:@"sd_targetModelInferenceCallCount" version:7 datatype:v40 unit:v96 baseMetric:0 optionalPayload:1.0];

  v42 = [PPSMetric alloc];
  id v43 = +[PPSUnit dimensionless];
  v78 = [(PPSMetric *)v42 initWithName:@"sd_draftTokenAcceptanceRate" version:7 datatype:v43 unit:v96 baseMetric:0 optionalPayload:1.0];

  v44 = [PPSMetric alloc];
  v45 = +[PPSUnit dimensionless];
  v76 = [(PPSMetric *)v44 initWithName:@"sd_speculationSuccessRate" version:7 datatype:v45 unit:v96 baseMetric:0 optionalPayload:1.0];

  v46 = [PPSMetric alloc];
  v47 = +[PPSUnit dimensionless];
  v48 = [(PPSMetric *)v46 initWithName:@"sd_draftOutputTokensCount" version:7 datatype:v47 unit:v96 baseMetric:0 optionalPayload:1.0];

  v49 = [PPSMetric alloc];
  v50 = +[PPSUnit dimensionless];
  v74 = [(PPSMetric *)v49 initWithName:@"sd_totalOutputTokensCount" version:7 datatype:v50 unit:v96 baseMetric:0 optionalPayload:1.0];

  v51 = [PPSMetric alloc];
  v52 = +[PPSUnit milliseconds];
  v53 = [(PPSMetric *)v51 initWithName:@"sd_draftModelTotalLatency" version:7 datatype:v52 unit:v96 baseMetric:0 optionalPayload:1.0];

  v54 = [PPSMetric alloc];
  v55 = +[PPSUnit milliseconds];
  v56 = [(PPSMetric *)v54 initWithName:@"sd_targetModelTotalLatency" version:7 datatype:v55 unit:v96 baseMetric:0 optionalPayload:1.0];

  v57 = [PPSMetric alloc];
  v58 = +[PPSUnit seconds];
  v59 = [(PPSMetric *)v57 initWithName:@"timestampEnd" version:4 datatype:v58 unit:v96 baseMetric:0 optionalPayload:1.0];

  v98[0] = v96;
  v98[1] = v97;
  v98[2] = v93;
  v98[3] = v95;
  v98[4] = v91;
  v98[5] = v89;
  v98[6] = v87;
  v98[7] = v80;
  v98[8] = v38;
  v98[9] = v41;
  v98[10] = v78;
  v98[11] = v76;
  v98[12] = v48;
  v98[13] = v74;
  v98[14] = v53;
  v98[15] = v56;
  v98[16] = v59;
  id v72 = [MEMORY[0x263EFF8C0] arrayWithObjects:v98 count:17];

  return v72;
}

+ (id)smartReplySessionMetrics
{
  v49[1] = *MEMORY[0x263EF8340];
  v48 = @"EnumMapping";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v46[0] = v2;
  v47[0] = @"Messages";
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v46[1] = v3;
  v47[1] = @"Mail";
  v4 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
  v49[0] = v4;
  v36 = [NSDictionary dictionaryWithObjects:v49 forKeys:&v48 count:1];

  v5 = [PPSMetric alloc];
  v6 = +[PPSGenerativeFunctionMetrics subsystem];
  v7 = +[PPSUnit dimensionless];
  v8 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v9 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v5, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"App", v6, @"SmartReplySession", 7, v7, v8, 1.0, 0x200000005, 0x100000001, 0x300000001, 0x100000001, v36);

  v44 = @"EnumMapping";
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v42[0] = v10;
  v43[0] = @"Start";
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v42[1] = v11;
  v43[1] = @"Complete";
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v42[2] = v12;
  v43[2] = @"Exception";
  v13 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:3];
  v45 = v13;
  v35 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];

  v14 = [PPSMetric alloc];
  v15 = +[PPSUnit dimensionless];
  v16 = [(PPSMetric *)v14 initWithName:@"EventType" version:7 datatype:v15 unit:v9 baseMetric:v35 optionalPayload:1.0];

  v17 = [PPSMetric alloc];
  v18 = +[PPSUnit dimensionless];
  v19 = [(PPSMetric *)v17 initWithName:@"InputTokenCount" version:7 datatype:v18 unit:v16 baseMetric:0 optionalPayload:1.0];

  v20 = [PPSMetric alloc];
  v21 = +[PPSUnit dimensionless];
  v22 = [(PPSMetric *)v20 initWithName:@"OutputTokenCount" version:7 datatype:v21 unit:v16 baseMetric:0 optionalPayload:1.0];

  v40 = @"EnumMapping";
  v23 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v38[0] = v23;
  v39[0] = @"Online";
  v24 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v38[1] = v24;
  v39[1] = @"Offline";
  v25 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
  v41 = v25;
  v26 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];

  v27 = [PPSMetric alloc];
  v28 = +[PPSUnit dimensionless];
  v29 = [(PPSMetric *)v27 initWithName:@"QueryType" version:7 datatype:v28 unit:v16 baseMetric:v26 optionalPayload:1.0];

  v30 = [PPSMetric alloc];
  v31 = +[PPSUnit seconds];
  v32 = [(PPSMetric *)v30 initWithName:@"timestampEnd" version:4 datatype:v31 unit:v19 baseMetric:0 optionalPayload:1.0];

  v37[0] = v9;
  v37[1] = v16;
  v37[2] = v19;
  v37[3] = v22;
  v37[4] = v29;
  v37[5] = v32;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:6];

  return v33;
}

@end