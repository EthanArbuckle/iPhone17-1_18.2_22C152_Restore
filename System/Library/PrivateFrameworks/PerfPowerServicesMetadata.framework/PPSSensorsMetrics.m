@interface PPSSensorsMetrics
+ (id)allDeclMetrics;
+ (id)sensorUsageMetrics;
+ (id)subsystem;
@end

@implementation PPSSensorsMetrics

+ (id)subsystem
{
  return @"Sensors";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() sensorUsageMetrics];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (id)sensorUsageMetrics
{
  v56[1] = *MEMORY[0x263EF8340];
  v55 = @"MetricType";
  v2 = +[PPSMetricType genericDimension];
  v56[0] = v2;
  v43 = [NSDictionary dictionaryWithObjects:v56 forKeys:&v55 count:1];

  v3 = [PPSMetric alloc];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v40 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v3, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"ProcessName", @"Sensors", @"SensorUsage", 3, v4, v5, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v43);

  v53[1] = @"MetricType";
  v54[0] = &unk_270701D58;
  v53[0] = @"GroupingDimensions";
  v6 = +[PPSMetricType genericDimension];
  v54[1] = v6;
  v42 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];

  v7 = [PPSMetric alloc];
  v8 = +[PPSUnit microseconds];
  v41 = [(PPSMetric *)v7 initWithName:@"ReportInterval" version:7 datatype:v8 unit:v40 baseMetric:v42 optionalPayload:1.0];

  v51[0] = @"EnumMapping";
  v39 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v49[0] = v39;
  v50[0] = @"Motion";
  v38 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v49[1] = v38;
  v50[1] = @"Accelerometer";
  v37 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v49[2] = v37;
  v50[2] = @"Gyro";
  v36 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
  v49[3] = v36;
  v50[3] = @"Compass";
  v35 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 27);
  v49[4] = v35;
  v50[4] = @"Rose";
  v34 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 30);
  v49[5] = v34;
  v50[5] = @"Accelerometer2";
  v33 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 86);
  v49[6] = v33;
  v50[6] = @"IMU";
  v32 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 90);
  v49[7] = v32;
  v50[7] = @"Magnetometer_mT";
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v49[8] = v9;
  v50[8] = @"DeviceMotion";
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v49[9] = v10;
  v50[9] = @"DeviceMotion6";
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
  v49[10] = v11;
  v50[10] = @"DeviceMotion3";
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
  v49[11] = v12;
  v50[11] = @"DeviceMotion10";
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 49);
  v49[12] = v13;
  v50[12] = @"AtmosphericPressure";
  v14 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:13];
  v51[1] = @"MetricType";
  v52[0] = v14;
  v15 = +[PPSMetricType genericDimension];
  v52[1] = v15;
  uint64_t v16 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];

  v17 = [PPSMetric alloc];
  v18 = +[PPSUnit dimensionless];
  v19 = (void *)v16;
  v20 = [(PPSMetric *)v17 initWithName:@"Usage" version:7 datatype:v18 unit:v40 baseMetric:v16 optionalPayload:1.0];

  v47[0] = @"EnumMapping";
  v21 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 65280);
  v45[0] = v21;
  v46[0] = @"AppleVendor";
  v22 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 65292);
  v45[1] = v22;
  v46[1] = @"AppleVendorMotion";
  v23 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 32);
  v45[2] = v23;
  v46[2] = @"Sensor";
  v24 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:3];
  v47[1] = @"MetricType";
  v48[0] = v24;
  v25 = +[PPSMetricType genericDimension];
  v48[1] = v25;
  v26 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];

  v27 = [PPSMetric alloc];
  v28 = +[PPSUnit dimensionless];
  v29 = [(PPSMetric *)v27 initWithName:@"UsagePage" version:7 datatype:v28 unit:v40 baseMetric:v26 optionalPayload:1.0];

  v44[0] = v40;
  v44[1] = v41;
  v44[2] = v20;
  v44[3] = v29;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:4];

  return v30;
}

@end