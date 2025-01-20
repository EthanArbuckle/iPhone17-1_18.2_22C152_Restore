@interface PPSEnergyMetrics
+ (id)allDeclMetrics;
+ (id)cleanEnergyChargingMetrics;
+ (id)energyAccountingMetrics;
+ (id)subsystem;
@end

@implementation PPSEnergyMetrics

+ (id)subsystem
{
  return @"EnergyMetrics";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() energyAccountingMetrics];
  [v2 addObjectsFromArray:v3];

  v4 = [(id)objc_opt_class() cleanEnergyChargingMetrics];
  [v2 addObjectsFromArray:v4];

  return v2;
}

+ (id)energyAccountingMetrics
{
  v27[8] = *MEMORY[0x263EF8340];
  v2 = [PPSMetric alloc];
  v3 = +[PPSUnit dimensionless];
  v4 = +[PPSCadence cadenceEventXPCWithFrequency:3];
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"slot_id", @"EnergyMetrics", @"EnergyAccounting", 7, v3, v4, 2.0, 0x300000004, 0x100000007, 0x300000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  v7 = +[PPSUnit microWattHours];
  v26 = [(PPSMetric *)v6 initWithName:@"wall_energy_consumed" version:8 datatype:v7 unit:v5 baseMetric:0 optionalPayload:2.0];

  v8 = [PPSMetric alloc];
  v9 = +[PPSUnit microWattHours];
  v25 = [(PPSMetric *)v8 initWithName:@"system_energy_consumed" version:8 datatype:v9 unit:v5 baseMetric:0 optionalPayload:2.0];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit dimensionless];
  v24 = [(PPSMetric *)v10 initWithName:@"adapter_family" version:7 datatype:v11 unit:v5 baseMetric:0 optionalPayload:2.0];

  v12 = [PPSMetric alloc];
  v13 = +[PPSUnit dimensionless];
  v22 = [(PPSMetric *)v12 initWithName:@"balancing_authority_id" version:3 datatype:v13 unit:v5 baseMetric:0 optionalPayload:2.0];

  v23 = (void *)[objc_alloc(MEMORY[0x263F08C60]) initWithSymbol:@"g/kWh"];
  v14 = [[PPSUnit alloc] initWithUnit:v23];
  v15 = [[PPSMetric alloc] initWithName:@"avg_intensity" version:8 datatype:v14 unit:v5 baseMetric:0 optionalPayload:2.0];
  v16 = [[PPSMetric alloc] initWithName:@"marginal_intensity" version:8 datatype:v14 unit:v5 baseMetric:0 optionalPayload:2.0];
  v17 = [PPSMetric alloc];
  v18 = +[PPSUnit grams];
  v19 = [(PPSMetric *)v17 initWithName:@"carbon_footprint" version:8 datatype:v18 unit:v5 baseMetric:0 optionalPayload:2.0];

  v27[0] = v5;
  v27[1] = v26;
  v27[2] = v25;
  v27[3] = v24;
  v27[4] = v22;
  v27[5] = v15;
  v27[6] = v16;
  v27[7] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:8];

  return v20;
}

+ (id)cleanEnergyChargingMetrics
{
  v29[1] = *MEMORY[0x263EF8340];
  v23 = [[PPSCadenceTuple alloc] initWithCadenceType:3 value:11];
  v2 = [PPSCadence alloc];
  v29[0] = v23;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
  v4 = [(PPSCadence *)v2 initWithCadenceTuples:v3];

  v5 = [PPSMetric alloc];
  v6 = +[PPSUnit dimensionless];
  v7 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v5, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"status", @"EnergyMetrics", @"CleanEnergyCharging", 7, v6, v4, 1.0, 0x300000003, 0x100000007, 0x300000001, 0x100000001, 0);

  v8 = [PPSMetric alloc];
  v9 = +[PPSUnit dimensionless];
  v10 = [(PPSMetric *)v8 initWithName:@"isPaused" version:5 datatype:v9 unit:v7 baseMetric:0 optionalPayload:1.0];

  v27[0] = @"EnumMapping";
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v25[0] = v11;
  v26[0] = @"Disabled";
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v25[1] = v12;
  v26[1] = @"Enabled";
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v25[2] = v13;
  v26[2] = @"EnabledChargingOverride";
  v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v25[3] = v14;
  v26[3] = @"TemporarilyDisabled";
  v15 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
  v28[0] = v15;
  v27[1] = @"MetricType";
  v16 = +[PPSMetricType stateDimension];
  v28[1] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

  v18 = [PPSMetric alloc];
  v19 = +[PPSUnit dimensionless];
  v20 = [(PPSMetric *)v18 initWithName:@"cecState" version:7 datatype:v19 unit:v7 baseMetric:v17 optionalPayload:1.0];

  v24[0] = v7;
  v24[1] = v10;
  v24[2] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:3];

  return v21;
}

@end