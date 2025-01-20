@interface PPSCameraCaptureMetrics
+ (id)allDeclMetrics;
+ (id)cameraInPocketDecision;
+ (id)subsystem;
@end

@implementation PPSCameraCaptureMetrics

+ (id)subsystem
{
  return @"CameraCapture";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() cameraInPocketDecision];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (id)cameraInPocketDecision
{
  v15[3] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSCameraCaptureMetrics subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"InPocketDecision", v3, @"PocketDetection", 5, v4, v5, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit seconds];
  v9 = [(PPSMetric *)v7 initWithName:@"DetectionSessionStartTime" version:8 datatype:v8 unit:v6 baseMetric:0 optionalPayload:1.0];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit seconds];
  v12 = [(PPSMetric *)v10 initWithName:@"DetectionSessionStopTime" version:8 datatype:v11 unit:v6 baseMetric:0 optionalPayload:1.0];

  v15[0] = v6;
  v15[1] = v9;
  v15[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];

  return v13;
}

@end