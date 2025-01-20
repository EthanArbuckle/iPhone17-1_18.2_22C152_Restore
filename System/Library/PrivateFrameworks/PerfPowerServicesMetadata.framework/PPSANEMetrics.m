@interface PPSANEMetrics
+ (id)ANEStatusMetrics;
+ (id)allDeclMetrics;
+ (id)compileMetrics;
+ (id)inferenceMetrics;
+ (id)modelLoadMetrics;
+ (id)modelUnLoadMetrics;
+ (id)newInstanceModelLoadMetrics;
+ (id)newInstanceModelUnLoadMetrics;
+ (id)subsystem;
@end

@implementation PPSANEMetrics

+ (id)subsystem
{
  return @"ANE";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() compileMetrics];
  [v2 addObjectsFromArray:v3];

  v4 = [(id)objc_opt_class() inferenceMetrics];
  [v2 addObjectsFromArray:v4];

  v5 = [(id)objc_opt_class() modelLoadMetrics];
  [v2 addObjectsFromArray:v5];

  v6 = [(id)objc_opt_class() modelUnLoadMetrics];
  [v2 addObjectsFromArray:v6];

  v7 = (void *)[(id)objc_opt_class() newInstanceModelUnLoadMetrics];
  [v2 addObjectsFromArray:v7];

  v8 = (void *)[(id)objc_opt_class() newInstanceModelLoadMetrics];
  [v2 addObjectsFromArray:v8];

  v9 = [(id)objc_opt_class() ANEStatusMetrics];
  [v2 addObjectsFromArray:v9];

  return v2;
}

+ (id)compileMetrics
{
  v44[2] = *MEMORY[0x263EF8340];
  v43[0] = @"EnumMapping";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v41[0] = v2;
  v42[0] = @"ANECIR";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v41[1] = v3;
  v42[1] = @"CoreML";
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v41[2] = v4;
  v42[2] = @"MIL";
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 17);
  v41[3] = v5;
  v42[3] = @"JIT+ANECIR";
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 18);
  v41[4] = v6;
  v42[4] = @"JIT+CoreML";
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 19);
  v41[5] = v7;
  v42[5] = @"JIT+MIL";
  v8 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:6];
  v43[1] = @"MetricType";
  v44[0] = v8;
  v9 = +[PPSMetricType genericDimension];
  v44[1] = v9;
  v37 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit dimensionless];
  v12 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v13 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v10, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"modelType", @"ANE", @"modelCompilation", 7, v11, v12, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x100000001, v37);

  v14 = [PPSMetric alloc];
  v15 = +[PPSUnit milliseconds];
  v36 = [(PPSMetric *)v14 initWithName:@"modelCompileTime" version:7 datatype:v15 unit:v13 baseMetric:0 optionalPayload:1.0];

  v16 = [PPSMetric alloc];
  v17 = +[PPSUnit milliseconds];
  v35 = [(PPSMetric *)v16 initWithName:@"modelIRTranslationTime" version:7 datatype:v17 unit:v13 baseMetric:0 optionalPayload:1.0];

  v18 = [PPSMetric alloc];
  v19 = +[PPSUnit dimensionless];
  v20 = [(PPSMetric *)v18 initWithName:@"modelCompiled" version:5 datatype:v19 unit:v13 baseMetric:0 optionalPayload:1.0];

  v39[0] = @"DMACompliant";
  v39[1] = @"MetricType";
  v40[0] = MEMORY[0x263EFFA88];
  v21 = +[PPSMetricType genericDimension];
  v40[1] = v21;
  v22 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];

  v23 = [PPSMetric alloc];
  v24 = +[PPSUnit dimensionless];
  v25 = [(PPSMetric *)v23 initWithName:@"csIdentity" version:3 datatype:v24 unit:v13 baseMetric:v22 optionalPayload:1.0];

  v26 = [PPSMetric alloc];
  v27 = +[PPSUnit dimensionless];
  v28 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v29 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v26, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"modelURL", @"ANE", @"modelCompilation", 3, v27, v28, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x300000001, 0);

  v30 = [PPSMetric alloc];
  v31 = +[PPSUnit dimensionless];
  v32 = [(PPSMetric *)v30 initWithName:@"compilationArgs" version:3 datatype:v31 unit:v13 baseMetric:0 optionalPayload:1.0];

  v38[0] = v13;
  v38[1] = v36;
  v38[2] = v35;
  v38[3] = v20;
  v38[4] = v25;
  v38[5] = v29;
  v38[6] = v32;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:7];

  return v33;
}

+ (id)inferenceMetrics
{
  v59[2] = *MEMORY[0x263EF8340];
  v58[0] = @"EnumMapping";
  v52 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v56[0] = v52;
  v57[0] = @"Success";
  v51 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v56[1] = v51;
  v57[1] = @"No Memory";
  v50 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v56[2] = v50;
  v57[2] = @"Bad Argument";
  v49 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v56[3] = v49;
  v57[3] = @"Not Supported";
  v48 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v56[4] = v48;
  v57[4] = @"Not Found";
  v47 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v56[5] = v47;
  v57[5] = @"No Resources";
  v46 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v56[6] = v46;
  v57[6] = @"Device Controller Creation Failed";
  v45 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
  v56[7] = v45;
  v57[7] = @"Device Controller Not Found";
  v44 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
  v56[8] = v44;
  v57[8] = @"Device Not Found";
  v43 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v56[9] = v43;
  v57[9] = @"Device Open Failed";
  v42 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
  v56[10] = v42;
  v57[10] = @"Device PowerOn Failed";
  v41 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 11);
  v56[11] = v41;
  v57[11] = @"Program Not Prepared";
  v40 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 12);
  v56[12] = v40;
  v57[12] = @"Dylib Not Found";
  v39 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 13);
  v56[13] = v39;
  v57[13] = @"Function Not Found";
  v38 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 14);
  v56[14] = v38;
  v57[14] = @"Program Not Found";
  v37 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 15);
  v56[15] = v37;
  v57[15] = @"Timeout";
  v36 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 16);
  v56[16] = v36;
  v57[16] = @"Hardware Failure";
  v35 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 17);
  v56[17] = v35;
  v57[17] = @"Firmware Failure";
  v34 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 18);
  v56[18] = v34;
  v57[18] = @"Error";
  v33 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 19);
  v56[19] = v33;
  v57[19] = @"Bad Program";
  v32 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 20);
  v56[20] = v32;
  v57[20] = @"Not Privileged";
  v30 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 21);
  v56[21] = v30;
  v57[21] = @"Request Failed";
  v29 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 22);
  v56[22] = v29;
  v57[22] = @"Not Ready";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 23);
  v56[23] = v2;
  v57[23] = @"Not Permitted";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 24);
  v56[24] = v3;
  v57[24] = @"Unsupported";
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 25);
  v56[25] = v4;
  v57[25] = @"Higher Priority Request Present";
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 26);
  v56[26] = v5;
  v57[26] = @"Failed To Allocate Shared Intermediate Buffer";
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 27);
  v56[27] = v6;
  v57[27] = @"Failed To Lock Shared Intermediate Buffer";
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 28);
  v56[28] = v7;
  v57[28] = @"Iso Too Old";
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 29);
  v56[29] = v8;
  v57[29] = @"Smaller IOBuffers Than Expected";
  v9 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:30];
  v58[1] = @"MetricType";
  v59[0] = v9;
  v10 = +[PPSMetricType genericDimension];
  v59[1] = v10;
  v31 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:2];

  v11 = [PPSMetric alloc];
  v12 = +[PPSUnit dimensionless];
  v13 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v14 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v11, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"failureReason", @"ANE", @"modelInference", 7, v12, v13, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x100000001, v31);

  v54[0] = @"DMACompliant";
  v54[1] = @"MetricType";
  v55[0] = MEMORY[0x263EFFA88];
  v15 = +[PPSMetricType genericDimension];
  v55[1] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];

  v17 = [PPSMetric alloc];
  v18 = +[PPSUnit dimensionless];
  v19 = [(PPSMetric *)v17 initWithName:@"csIdentity" version:3 datatype:v18 unit:v14 baseMetric:v16 optionalPayload:1.0];

  v20 = [PPSMetric alloc];
  v21 = +[PPSUnit dimensionless];
  v22 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v23 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v20, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"modelURL", @"ANE", @"modelInference", 3, v21, v22, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x300000001, 0);

  v24 = [PPSMetric alloc];
  v25 = +[PPSUnit dimensionless];
  v26 = [(PPSMetric *)v24 initWithName:@"programHandle" version:7 datatype:v25 unit:v14 baseMetric:0 optionalPayload:1.0];

  v53[0] = v14;
  v53[1] = v19;
  v53[2] = v23;
  v53[3] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:4];

  return v27;
}

+ (id)modelLoadMetrics
{
  v38[2] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSUnit dimensionless];
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"isPrecompiled", @"ANE", @"modelLoad", 5, v3, v4, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  v7 = +[PPSUnit dimensionless];
  v33 = [(PPSMetric *)v6 initWithName:@"cacheHit" version:5 datatype:v7 unit:v5 baseMetric:0 optionalPayload:1.0];

  v8 = [PPSMetric alloc];
  v9 = +[PPSUnit dimensionless];
  v32 = [(PPSMetric *)v8 initWithName:@"modelLoaded" version:5 datatype:v9 unit:v5 baseMetric:0 optionalPayload:1.0];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit milliseconds];
  v31 = [(PPSMetric *)v10 initWithName:@"modelLoadingTime" version:8 datatype:v11 unit:v5 baseMetric:0 optionalPayload:1.0];

  v37[0] = @"DMACompliant";
  v37[1] = @"MetricType";
  v38[0] = MEMORY[0x263EFFA88];
  v12 = +[PPSMetricType genericDimension];
  v38[1] = v12;
  v30 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];

  v13 = [PPSMetric alloc];
  v14 = +[PPSUnit dimensionless];
  v15 = [(PPSMetric *)v13 initWithName:@"csIdentity" version:3 datatype:v14 unit:v5 baseMetric:v30 optionalPayload:1.0];

  v16 = [PPSMetric alloc];
  v17 = +[PPSUnit dimensionless];
  v18 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v19 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v16, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"modelURL", @"ANE", @"modelLoad", 3, v17, v18, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x300000001, 0);

  v20 = [PPSMetric alloc];
  v21 = +[PPSUnit dimensionless];
  v22 = [(PPSMetric *)v20 initWithName:@"programHandle" version:7 datatype:v21 unit:v5 baseMetric:0 optionalPayload:1.0];

  v36[0] = &unk_270701D88;
  v35[0] = @"GroupingDimensions";
  v35[1] = @"MetricType";
  v23 = +[PPSMetricType absoluteMeasure];
  v36[1] = v23;
  v24 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];

  v25 = [PPSMetric alloc];
  v26 = +[PPSUnit bytes];
  v27 = [(PPSMetric *)v25 initWithName:@"modelSize" version:7 datatype:v26 unit:v5 baseMetric:v24 optionalPayload:1.0];

  v34[0] = v5;
  v34[1] = v33;
  v34[2] = v32;
  v34[3] = v31;
  v34[4] = v15;
  v34[5] = v19;
  v34[6] = v22;
  v34[7] = v27;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:8];

  return v28;
}

+ (id)modelUnLoadMetrics
{
  v22[2] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSUnit dimensionless];
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"modelUnloaded", @"ANE", @"modelUnload", 5, v3, v4, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x100000001, 0);

  v21[0] = @"DMACompliant";
  v21[1] = @"MetricType";
  v22[0] = MEMORY[0x263EFFA88];
  v6 = +[PPSMetricType genericDimension];
  v22[1] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

  v8 = [PPSMetric alloc];
  v9 = +[PPSUnit dimensionless];
  v10 = [(PPSMetric *)v8 initWithName:@"csIdentity" version:3 datatype:v9 unit:v5 baseMetric:v7 optionalPayload:1.0];

  v11 = [PPSMetric alloc];
  v12 = +[PPSUnit dimensionless];
  v13 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v14 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v11, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"modelURL", @"ANE", @"modelUnload", 3, v12, v13, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x300000001, 0);

  v15 = [PPSMetric alloc];
  v16 = +[PPSUnit dimensionless];
  v17 = [(PPSMetric *)v15 initWithName:@"programHandle" version:7 datatype:v16 unit:v5 baseMetric:0 optionalPayload:1.0];

  v20[0] = v5;
  v20[1] = v10;
  v20[2] = v14;
  v20[3] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:4];

  return v18;
}

+ (id)newInstanceModelUnLoadMetrics
{
  v22[2] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSUnit dimensionless];
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"newInstanceUnloaded", @"ANE", @"newInstanceModelUnload", 5, v3, v4, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x100000001, 0);

  v21[0] = @"DMACompliant";
  v21[1] = @"MetricType";
  v22[0] = MEMORY[0x263EFFA88];
  v6 = +[PPSMetricType genericDimension];
  v22[1] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

  v8 = [PPSMetric alloc];
  v9 = +[PPSUnit dimensionless];
  v10 = [(PPSMetric *)v8 initWithName:@"csIdentity" version:3 datatype:v9 unit:v5 baseMetric:v7 optionalPayload:1.0];

  v11 = [PPSMetric alloc];
  v12 = +[PPSUnit dimensionless];
  v13 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v14 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v11, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"modelURL", @"ANE", @"newInstanceModelUnload", 3, v12, v13, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x300000001, 0);

  v15 = [PPSMetric alloc];
  v16 = +[PPSUnit dimensionless];
  v17 = [(PPSMetric *)v15 initWithName:@"programHandle" version:7 datatype:v16 unit:v5 baseMetric:0 optionalPayload:1.0];

  v20[0] = v5;
  v20[1] = v10;
  v20[2] = v14;
  v20[3] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:4];

  return v18;
}

+ (id)newInstanceModelLoadMetrics
{
  v28[2] = *MEMORY[0x263EF8340];
  v28[0] = MEMORY[0x263EFFA88];
  v27[0] = @"DMACompliant";
  v27[1] = @"MetricType";
  v2 = +[PPSMetricType genericDimension];
  v28[1] = v2;
  v25 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

  v3 = [PPSMetric alloc];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v3, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"csIdentity", @"ANE", @"newInstanceModelLoad", 3, v4, v5, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x100000001, v25);

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit dimensionless];
  v9 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v10 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"modelURL", @"ANE", @"newInstanceModelLoad", 3, v8, v9, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x300000001, 0);

  v11 = [PPSMetric alloc];
  v12 = +[PPSUnit dimensionless];
  v13 = [(PPSMetric *)v11 initWithName:@"programHandle" version:7 datatype:v12 unit:v6 baseMetric:0 optionalPayload:1.0];

  v14 = [PPSMetric alloc];
  v15 = +[PPSUnit dimensionless];
  v16 = [(PPSMetric *)v14 initWithName:@"newInstanceLoaded" version:5 datatype:v15 unit:v6 baseMetric:0 optionalPayload:1.0];

  v17 = [PPSMetric alloc];
  v18 = +[PPSUnit milliseconds];
  v19 = [(PPSMetric *)v17 initWithName:@"modelLoadingTime" version:8 datatype:v18 unit:v6 baseMetric:0 optionalPayload:1.0];

  v20 = [PPSMetric alloc];
  v21 = +[PPSUnit dimensionless];
  v22 = [(PPSMetric *)v20 initWithName:@"numWeightFiles" version:7 datatype:v21 unit:v6 baseMetric:0 optionalPayload:1.0];

  v26[0] = v6;
  v26[1] = v10;
  v26[2] = v13;
  v26[3] = v16;
  v26[4] = v19;
  v26[5] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:6];

  return v23;
}

+ (id)ANEStatusMetrics
{
  v73[2] = *MEMORY[0x263EF8340];
  v72[0] = @"EnumMapping";
  v62 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v70[0] = v62;
  v71[0] = @"Unknown";
  v60 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v70[1] = v60;
  v71[1] = @"Device Creation";
  v58 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v70[2] = v58;
  v71[2] = @"Program Creation";
  v56 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v70[3] = v56;
  v71[3] = @"Device Destruction";
  v54 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v70[4] = v54;
  v71[4] = @"Program Destruction";
  v52 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v70[5] = v52;
  v71[5] = @"Program Prepare";
  v50 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v70[6] = v50;
  v71[6] = @"Program Stop";
  v48 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
  v70[7] = v48;
  v71[7] = @"Request Begin";
  v46 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
  v70[8] = v46;
  v71[8] = @"Request Completed";
  v44 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v70[9] = v44;
  v71[9] = @"Request Cancelled";
  v42 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
  v70[10] = v42;
  v71[10] = @"Request Event";
  v40 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 11);
  v70[11] = v40;
  v71[11] = @"Request Timeout";
  v38 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 12);
  v70[12] = v38;
  v71[12] = @"Timeout";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 13);
  v70[13] = v2;
  v71[13] = @"Event";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 14);
  v70[14] = v3;
  v71[14] = @"Resource Availability";
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 15);
  v70[15] = v4;
  v71[15] = @"Crashed";
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 16);
  v70[16] = v5;
  v71[16] = @"Device Sleep";
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 17);
  v70[17] = v6;
  v71[17] = @"Device Wakeup";
  v7 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:18];
  v72[1] = @"MetricType";
  v73[0] = v7;
  v8 = +[PPSMetricType genericDimension];
  v73[1] = v8;
  v64 = [NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:2];

  v9 = [PPSMetric alloc];
  v10 = +[PPSUnit dimensionless];
  v11 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v63 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v9, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"statusType", @"ANE", @"ANEStatus", 7, v10, v11, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x100000001, v64);

  v68[0] = @"EnumMapping";
  v61 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v66[0] = v61;
  v67[0] = @"Success";
  v59 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v66[1] = v59;
  v67[1] = @"No Memory";
  v57 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v66[2] = v57;
  v67[2] = @"Bad Argument";
  v55 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v66[3] = v55;
  v67[3] = @"Not Supported";
  v53 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v66[4] = v53;
  v67[4] = @"Not Found";
  v51 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v66[5] = v51;
  v67[5] = @"No Resources";
  v49 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v66[6] = v49;
  v67[6] = @"Device Controller Creation Failed";
  v47 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
  v66[7] = v47;
  v67[7] = @"Device Controller Not Found";
  v45 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
  v66[8] = v45;
  v67[8] = @"Device Not Found";
  v43 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v66[9] = v43;
  v67[9] = @"Device Open Failed";
  v41 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
  v66[10] = v41;
  v67[10] = @"Device PowerOn Failed";
  v39 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 11);
  v66[11] = v39;
  v67[11] = @"Program Not Prepared";
  v37 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 12);
  v66[12] = v37;
  v67[12] = @"Dylib Not Found";
  v36 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 13);
  v66[13] = v36;
  v67[13] = @"Function Not Found";
  v35 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 14);
  v66[14] = v35;
  v67[14] = @"Program Not Found";
  v34 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 15);
  v66[15] = v34;
  v67[15] = @"Timeout";
  v33 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 16);
  v66[16] = v33;
  v67[16] = @"Hardware Failure";
  v32 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 17);
  v66[17] = v32;
  v67[17] = @"Firmware Failure";
  v31 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 18);
  v66[18] = v31;
  v67[18] = @"Error";
  v30 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 19);
  v66[19] = v30;
  v67[19] = @"Bad Program";
  v29 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 20);
  v66[20] = v29;
  v67[20] = @"Not Privileged";
  v28 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 21);
  v66[21] = v28;
  v67[21] = @"Request Failed";
  v27 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 22);
  v66[22] = v27;
  v67[22] = @"Not Ready";
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 23);
  v66[23] = v12;
  v67[23] = @"Not Permitted";
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 24);
  v66[24] = v13;
  v67[24] = @"Unsupported";
  v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 25);
  v66[25] = v14;
  v67[25] = @"Higher Priority Request Present";
  v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 26);
  v66[26] = v15;
  v67[26] = @"Failed To Allocate Shared Intermediate Buffer";
  v16 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 27);
  v66[27] = v16;
  v67[27] = @"Failed To Lock Shared Intermediate Buffer";
  v17 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 28);
  v66[28] = v17;
  v67[28] = @"Iso Too Old";
  v18 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 29);
  v66[29] = v18;
  v67[29] = @"Smaller IOBuffers Than Expected";
  v19 = [NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:30];
  v69[0] = v19;
  v68[1] = @"MetricType";
  v20 = +[PPSMetricType genericDimension];
  v69[1] = v20;
  v21 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];

  v22 = [PPSMetric alloc];
  v23 = +[PPSUnit dimensionless];
  v24 = [(PPSMetric *)v22 initWithName:@"returnType" version:7 datatype:v23 unit:v63 baseMetric:v21 optionalPayload:1.0];

  v65[0] = v63;
  v65[1] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:2];

  return v25;
}

@end