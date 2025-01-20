@interface PPSBatteryMetrics
+ (id)allDeclMetrics;
+ (id)batteryConfigMetrics;
+ (id)batteryLoggingCadence;
+ (id)batteryMetrics;
+ (id)batteryShutdownMetrics;
+ (id)smartChargingMetrics;
+ (id)subsystem;
@end

@implementation PPSBatteryMetrics

+ (id)subsystem
{
  return @"BatteryMetrics";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() batteryMetrics];
  [v2 addObjectsFromArray:v3];

  v4 = [(id)objc_opt_class() batteryConfigMetrics];
  [v2 addObjectsFromArray:v4];

  v5 = [(id)objc_opt_class() smartChargingMetrics];
  [v2 addObjectsFromArray:v5];

  v6 = [(id)objc_opt_class() batteryShutdownMetrics];
  [v2 addObjectsFromArray:v6];

  return v2;
}

+ (id)batteryMetrics
{
  v48[12] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSBatteryMetrics subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSBatteryMetrics batteryLoggingCadence];
  v47 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"ExternalConnected", v3, @"Battery", 5, v4, v5, 1.0, 0x200000003, 0x100000001, 0x300000006, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  v7 = +[PPSUnit dimensionless];
  v46 = [(PPSMetric *)v6 initWithName:@"IsCharging" version:5 datatype:v7 unit:v47 baseMetric:0 optionalPayload:1.0];

  v8 = [PPSMetric alloc];
  v9 = +[PPSBatteryMetrics subsystem];
  v10 = +[PPSUnit milliAmpereHours];
  v11 = +[PPSBatteryMetrics batteryLoggingCadence];
  uint64_t v12 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v8, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"AbsoluteCapacity", v9, @"Battery", 7, v10, v11, 1.0, 0x200000002, 0x100000001, 0x300000006, 0x100000001, 0);

  v13 = [PPSMetric alloc];
  v14 = +[PPSUnit milliVolts];
  v15 = (void *)v12;
  v45 = [(PPSMetric *)v13 initWithName:@"Voltage" version:7 datatype:v14 unit:v12 baseMetric:0 optionalPayload:1.0];

  v16 = [PPSMetric alloc];
  v17 = +[PPSUnit milliAmpereHours];
  v44 = [(PPSMetric *)v16 initWithName:@"ChargeAccum" version:7 datatype:v17 unit:v12 baseMetric:0 optionalPayload:1.0];

  v18 = [PPSMetric alloc];
  v19 = +[PPSBatteryMetrics subsystem];
  v20 = +[PPSUnit dimensionless];
  v21 = +[PPSBatteryMetrics batteryLoggingCadence];
  uint64_t v22 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v18, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Level", v19, @"Battery", 7, v20, v21, 1.0, 0x200000004, 0x100000001, 0x300000006, 0x100000001, 0);

  v23 = [PPSMetric alloc];
  v24 = +[PPSUnit dimensionless];
  v25 = (void *)v22;
  v26 = [(PPSMetric *)v23 initWithName:@"AbsoluteLevel" version:8 datatype:v24 unit:v22 baseMetric:0 optionalPayload:1.0];

  v27 = [PPSMetric alloc];
  v28 = +[PPSUnit milliAmperes];
  v43 = [(PPSMetric *)v27 initWithName:@"Amperage" version:7 datatype:v28 unit:v15 baseMetric:0 optionalPayload:1.0];

  v29 = [PPSMetric alloc];
  v30 = +[PPSUnit dimensionless];
  v42 = [(PPSMetric *)v29 initWithName:@"NotChargingReason" version:7 datatype:v30 unit:v47 baseMetric:0 optionalPayload:1.0];

  v31 = [PPSMetric alloc];
  v32 = +[PPSUnit milliAmpereHours];
  v33 = [(PPSMetric *)v31 initWithName:@"PassedCharge" version:7 datatype:v32 unit:v42 baseMetric:0 optionalPayload:1.0];

  v34 = [PPSMetric alloc];
  v35 = +[PPSUnit dimensionless];
  v36 = [(PPSMetric *)v34 initWithName:@"DOD0" version:7 datatype:v35 unit:v33 baseMetric:0 optionalPayload:1.0];

  v37 = [PPSMetric alloc];
  v38 = +[PPSUnit milliAmpereHours];
  v39 = [(PPSMetric *)v37 initWithName:@"AppleRawMaxCapacity" version:7 datatype:v38 unit:v36 baseMetric:0 optionalPayload:1.0];

  v48[0] = v47;
  v48[1] = v46;
  v48[2] = v15;
  v48[3] = v45;
  v48[4] = v44;
  v48[5] = v25;
  v48[6] = v26;
  v48[7] = v43;
  v48[8] = v42;
  v48[9] = v33;
  v48[10] = v36;
  v48[11] = v39;
  id v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:12];

  return v41;
}

+ (id)batteryConfigMetrics
{
  v14[2] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSBatteryMetrics subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceInit];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"DOFU", v3, @"BatteryConfig", 7, v4, v5, 2.0, 0x100000001, 0x100000001, 0x300000006, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  v8 = +[PPSBatteryMetrics subsystem];
  v9 = +[PPSUnit dimensionless];
  v10 = +[PPSCadence cadenceInit];
  v11 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"GasGaugeFirmwareVersion", v8, @"BatteryConfig", 7, v9, v10, 1.0, 0x200000001, 0x100000001, 0x300000006, 0x100000001, 0);

  v14[0] = v6;
  v14[1] = v11;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];

  return v12;
}

+ (id)smartChargingMetrics
{
  v53[1] = *MEMORY[0x263EF8340];
  v52 = @"EnumMapping";
  v38 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v50[0] = v38;
  v51[0] = @"None";
  v37 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v50[1] = v37;
  v51[1] = @"Detected";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v50[2] = v2;
  v51[2] = @"IdlePeriodStart";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v50[3] = v3;
  v51[3] = @"IdlePeriodSocFloor";
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v50[4] = v4;
  v51[4] = @"IdlePeriodSocCeiling";
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v50[5] = v5;
  v51[5] = @"TopOff";
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v50[6] = v6;
  v51[6] = @"TopOffWithoutIdle";
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
  v50[7] = v7;
  v51[7] = @"FullyCharged";
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
  v50[8] = v8;
  v51[8] = @"Interrupted";
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v50[9] = v9;
  v51[9] = @"UserOverride";
  v10 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:10];
  v53[0] = v10;
  v40 = [NSDictionary dictionaryWithObjects:v53 forKeys:&v52 count:1];

  v11 = [PPSMetric alloc];
  uint64_t v12 = +[PPSBatteryMetrics subsystem];
  v13 = +[PPSUnit dimensionless];
  v14 = +[PPSCadence cadenceEventXPCWithFrequency:1];
  v15 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v11, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"checkpoint", v12, @"SmartCharging", 7, v13, v14, 1.0, 0x300000003, 0x100000007, 0x300000006, 0x100000001, v40);

  v16 = [PPSMetric alloc];
  v17 = +[PPSUnit dimensionless];
  v39 = [(PPSMetric *)v16 initWithName:@"isEngaged" version:5 datatype:v17 unit:v15 baseMetric:0 optionalPayload:1.0];

  v48 = @"EnumMapping";
  v18 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v46[0] = v18;
  v47[0] = @"Disabled";
  v19 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v46[1] = v19;
  v47[1] = @"Enabled";
  v20 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v46[2] = v20;
  v47[2] = @"Override";
  v21 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v46[3] = v21;
  v47[3] = @"TemporarilyDisabled";
  uint64_t v22 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:4];
  v49 = v22;
  v23 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];

  v24 = [PPSMetric alloc];
  v25 = +[PPSUnit dimensionless];
  v26 = [(PPSMetric *)v24 initWithName:@"state" version:7 datatype:v25 unit:v15 baseMetric:v23 optionalPayload:1.0];

  v44 = @"EnumMapping";
  v27 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v42[0] = v27;
  v43[0] = @"Enabled";
  v28 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v42[1] = v28;
  v43[1] = @"Disabled";
  v29 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v42[2] = v29;
  v43[2] = @"TemporarilyDisabled";
  v30 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:3];
  v45 = v30;
  v31 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];

  v32 = [PPSMetric alloc];
  v33 = +[PPSUnit dimensionless];
  v34 = [(PPSMetric *)v32 initWithName:@"status" version:7 datatype:v33 unit:v15 baseMetric:v31 optionalPayload:1.0];

  v41[0] = v15;
  v41[1] = v39;
  v41[2] = v26;
  v41[3] = v34;
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:4];

  return v35;
}

+ (id)batteryShutdownMetrics
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSBatteryMetrics subsystem];
  v4 = +[PPSUnit dimensionless];
  v5 = +[PPSCadence cadenceInit];
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"BatteryShutdownTimestamp", v3, @"BatteryShutdown", 4, v4, v5, 1.0, 0x200000002, 0x10000000ELL, 0x300000006, 0x100000001, 0);

  v9[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];

  return v7;
}

+ (id)batteryLoggingCadence
{
  v10[2] = *MEMORY[0x263EF8340];
  v2 = [[PPSCadenceTuple alloc] initWithCadenceType:2 value:20];
  v3 = [[PPSCadenceTuple alloc] initWithCadenceType:3 value:8];
  v4 = v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    v8 = 0;
  }
  else
  {
    v6 = [PPSCadence alloc];
    v10[0] = v2;
    v10[1] = v4;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    v8 = [(PPSCadence *)v6 initWithCadenceTuples:v7];
  }
  return v8;
}

@end