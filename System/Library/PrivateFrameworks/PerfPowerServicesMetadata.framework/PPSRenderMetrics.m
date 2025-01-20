@interface PPSRenderMetrics
+ (id)albumAnimationMetrics;
+ (id)albumMotionMetrics;
+ (id)allDeclMetrics;
+ (id)layerCountMetrics;
+ (id)offscreenReasonMetrics;
+ (id)renderPassCountMetrics;
+ (id)secureIndicatorActiveIntervalTypeMetrics;
+ (id)secureIndicatorTypeMetrics;
+ (id)subsystem;
@end

@implementation PPSRenderMetrics

+ (id)subsystem
{
  return @"RenderData";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() albumAnimationMetrics];
  [v2 addObjectsFromArray:v3];

  v4 = [(id)objc_opt_class() albumMotionMetrics];
  [v2 addObjectsFromArray:v4];

  v5 = [(id)objc_opt_class() renderPassCountMetrics];
  [v2 addObjectsFromArray:v5];

  v6 = [(id)objc_opt_class() layerCountMetrics];
  [v2 addObjectsFromArray:v6];

  v7 = [(id)objc_opt_class() offscreenReasonMetrics];
  [v2 addObjectsFromArray:v7];

  v8 = [(id)objc_opt_class() secureIndicatorTypeMetrics];
  [v2 addObjectsFromArray:v8];

  v9 = [(id)objc_opt_class() secureIndicatorActiveIntervalTypeMetrics];
  [v2 addObjectsFromArray:v9];

  return v2;
}

+ (id)secureIndicatorActiveIntervalTypeMetrics
{
  v14[3] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSUnit dimensionless];
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"indicator_start_time", @"RenderData", @"SecureIndicatorActiveInterval", 7, v3, v4, 1.0, 0x200000004, 0x100000001, 0x300000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  v7 = +[PPSUnit dimensionless];
  v8 = [(PPSMetric *)v6 initWithName:@"indicator_end_time" version:7 datatype:v7 unit:v5 baseMetric:0 optionalPayload:1.0];

  v9 = [PPSMetric alloc];
  v10 = +[PPSUnit dimensionless];
  v11 = [(PPSMetric *)v9 initWithName:@"indicator_frame_count" version:7 datatype:v10 unit:v5 baseMetric:0 optionalPayload:1.0];

  v14[0] = v5;
  v14[1] = v8;
  v14[2] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];

  return v12;
}

+ (id)secureIndicatorTypeMetrics
{
  v17[4] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSUnit dimensionless];
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Camera", @"RenderData", @"SecureIndicatorTypes", 7, v3, v4, 1.0, 0x200000004, 0x100000001, 0x300000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  v7 = +[PPSUnit dimensionless];
  v8 = [(PPSMetric *)v6 initWithName:@"FaceID" version:7 datatype:v7 unit:v5 baseMetric:0 optionalPayload:1.0];

  v9 = [PPSMetric alloc];
  v10 = +[PPSUnit dimensionless];
  v11 = [(PPSMetric *)v9 initWithName:@"Microphone" version:7 datatype:v10 unit:v5 baseMetric:0 optionalPayload:1.0];

  v12 = [PPSMetric alloc];
  v13 = +[PPSUnit dimensionless];
  v14 = [(PPSMetric *)v12 initWithName:@"MicrophoneAccessibility" version:7 datatype:v13 unit:v5 baseMetric:0 optionalPayload:1.0];

  v17[0] = v5;
  v17[1] = v8;
  v17[2] = v11;
  v17[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];

  return v15;
}

+ (id)albumAnimationMetrics
{
  v12[1] = *MEMORY[0x263EF8340];
  v11 = @"MetricType";
  v2 = +[PPSMetricType genericDimension];
  v12[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];

  v4 = [PPSMetric alloc];
  v5 = +[PPSUnit seconds];
  v6 = +[PPSCadence cadenceEventXPCWithFrequency:1];
  v7 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v4, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"AlbumAnimationDuration", @"RenderData", @"AlbumAnimationDuration", 7, v5, v6, 1.0, 0x200000004, 0x100000001, 0x300000001, 0x100000001, v3);

  v10 = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];

  return v8;
}

+ (id)albumMotionMetrics
{
  v12[1] = *MEMORY[0x263EF8340];
  v11 = @"MetricType";
  v2 = +[PPSMetricType genericDimension];
  v12[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];

  v4 = [PPSMetric alloc];
  v5 = +[PPSUnit seconds];
  v6 = +[PPSCadence cadenceEventXPCWithFrequency:1];
  v7 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v4, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"AlbumMotionDownload", @"RenderData", @"AlbumMotionDownload", 8, v5, v6, 1.0, 0x200000004, 0x100000001, 0x300000001, 0x100000001, v3);

  v10 = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];

  return v8;
}

+ (id)renderPassCountMetrics
{
  v2 = objc_opt_new();
  v3 = [PPSMetric alloc];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v3, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"bucket_count", @"RenderData", @"RenderPassCount", 7, v4, v5, 2.0, 0x200000004, 0x100000001, 0x300000001, 0x100000001, 0);

  [v2 addObject:v6];
  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit dimensionless];
  v9 = [(PPSMetric *)v7 initWithName:@"bucket_size" version:7 datatype:v8 unit:v6 baseMetric:0 optionalPayload:2.0];

  [v2 addObject:v9];
  uint64_t v10 = 0;
  do
  {
    v11 = [PPSMetric alloc];
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"bucket%d", v10);
    v13 = +[PPSUnit dimensionless];
    v14 = [(PPSMetric *)v11 initWithName:v12 version:7 datatype:v13 unit:v6 baseMetric:0 optionalPayload:2.0];

    [v2 addObject:v14];
    uint64_t v10 = (v10 + 1);
  }
  while (v10 != 10);

  return v2;
}

+ (id)layerCountMetrics
{
  v2 = objc_opt_new();
  v3 = [PPSMetric alloc];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v3, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"bucket_count", @"RenderData", @"LayerCount", 7, v4, v5, 2.0, 0x200000004, 0x100000001, 0x300000001, 0x100000001, 0);

  [v2 addObject:v6];
  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit dimensionless];
  v9 = [(PPSMetric *)v7 initWithName:@"bucket_size" version:7 datatype:v8 unit:v6 baseMetric:0 optionalPayload:2.0];

  [v2 addObject:v9];
  uint64_t v10 = 0;
  do
  {
    v11 = [PPSMetric alloc];
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"bucket%d", v10);
    v13 = +[PPSUnit dimensionless];
    v14 = [(PPSMetric *)v11 initWithName:v12 version:7 datatype:v13 unit:v6 baseMetric:0 optionalPayload:2.0];

    [v2 addObject:v14];
    uint64_t v10 = (v10 + 1);
  }
  while (v10 != 10);

  return v2;
}

+ (id)offscreenReasonMetrics
{
  v35[10] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSUnit dimensionless];
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Shadow", @"RenderData", @"OffscreenReasons", 7, v3, v4, 3.0, 0x200000004, 0x100000001, 0x100000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  v7 = +[PPSUnit dimensionless];
  v34 = [(PPSMetric *)v6 initWithName:@"Patten_and_TiledImage" version:7 datatype:v7 unit:v5 baseMetric:0 optionalPayload:2.0];

  v8 = [PPSMetric alloc];
  v9 = +[PPSUnit dimensionless];
  v33 = [(PPSMetric *)v8 initWithName:@"BackdropCopy" version:7 datatype:v9 unit:v5 baseMetric:0 optionalPayload:2.0];

  uint64_t v10 = [PPSMetric alloc];
  v11 = +[PPSUnit dimensionless];
  v32 = [(PPSMetric *)v10 initWithName:@"Blending_and_Transition" version:7 datatype:v11 unit:v5 baseMetric:0 optionalPayload:2.0];

  v12 = [PPSMetric alloc];
  v13 = +[PPSUnit dimensionless];
  v14 = [(PPSMetric *)v12 initWithName:@"Filter" version:7 datatype:v13 unit:v5 baseMetric:0 optionalPayload:2.0];

  v15 = [PPSMetric alloc];
  v16 = +[PPSUnit dimensionless];
  v31 = [(PPSMetric *)v15 initWithName:@"Transform_and_Scaling" version:7 datatype:v16 unit:v5 baseMetric:0 optionalPayload:2.0];

  v17 = [PPSMetric alloc];
  v18 = +[PPSUnit dimensionless];
  v30 = [(PPSMetric *)v17 initWithName:@"Mask" version:7 datatype:v18 unit:v5 baseMetric:0 optionalPayload:2.0];

  v19 = [PPSMetric alloc];
  v20 = +[PPSUnit dimensionless];
  v29 = [(PPSMetric *)v19 initWithName:@"Group" version:7 datatype:v20 unit:v5 baseMetric:0 optionalPayload:2.0];

  v21 = [PPSMetric alloc];
  v22 = +[PPSUnit dimensionless];
  v23 = [(PPSMetric *)v21 initWithName:@"Plugin_and_Cache" version:7 datatype:v22 unit:v5 baseMetric:0 optionalPayload:2.0];

  v24 = [PPSMetric alloc];
  v25 = +[PPSUnit dimensionless];
  v26 = [(PPSMetric *)v24 initWithName:@"DestinationCopy" version:7 datatype:v25 unit:v5 baseMetric:0 optionalPayload:2.0];

  v35[0] = v5;
  v35[1] = v34;
  v35[2] = v33;
  v35[3] = v14;
  v35[4] = v32;
  v35[5] = v31;
  v35[6] = v30;
  v35[7] = v29;
  v35[8] = v23;
  v35[9] = v26;
  id v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:10];

  return v28;
}

@end