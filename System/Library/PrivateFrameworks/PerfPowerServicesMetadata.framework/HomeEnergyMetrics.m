@interface HomeEnergyMetrics
+ (id)allDeclMetrics;
+ (id)cleanEnergyForecastMetrics;
+ (id)homeAppUIInteractionsMetrics;
+ (id)subsystem;
@end

@implementation HomeEnergyMetrics

+ (id)subsystem
{
  return @"HomeEnergy";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() homeAppUIInteractionsMetrics];
  [v2 addObjectsFromArray:v3];

  v4 = [(id)objc_opt_class() cleanEnergyForecastMetrics];
  [v2 addObjectsFromArray:v4];

  return v2;
}

+ (id)homeAppUIInteractionsMetrics
{
  v44[2] = *MEMORY[0x263EF8340];
  v43[0] = @"EnumMapping";
  v35 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v41[0] = v35;
  v42[0] = @"Unknown";
  v34 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v41[1] = v34;
  v42[1] = @"EnergyDashboardVisit";
  v33 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v41[2] = v33;
  v42[2] = @"GridForecastOnboardingVisit";
  v32 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v41[3] = v32;
  v42[3] = @"EnergyCategoryStatusItemTapped";
  v31 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  v41[4] = v31;
  v42[4] = @"EnergyCategoryViewDuration";
  v30 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v41[5] = v30;
  v42[5] = @"EnergyEducationTipVisit";
  v29 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v41[6] = v29;
  v42[6] = @"EnergyModelInformationSheetVisit";
  v28 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
  v41[7] = v28;
  v42[7] = @"EnergyModelInformationSheetViewDuration";
  v27 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
  v41[8] = v27;
  v42[8] = @"EnergyIndicatorAccessoryViewVisit";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v41[9] = v2;
  v42[9] = @"DashboardSinglePaneView";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
  v41[10] = v3;
  v42[10] = @"DashboardDualPaneView";
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 11);
  v41[11] = v4;
  v42[11] = @"EnergyWidgetAndComplicationSettings";
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 12);
  v41[12] = v5;
  v42[12] = @"EnergyCategoryStatusItemVisit";
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 13);
  v41[13] = v6;
  v42[13] = @"EnergyCategoryViewAccessedFromURL";
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 14);
  v41[14] = v7;
  v42[14] = @"EnergyIndicatorAccessoryViewTapped";
  v8 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:15];
  v43[1] = @"MetricType";
  v44[0] = v8;
  v9 = +[PPSMetricType genericDimension];
  v44[1] = v9;
  v26 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];

  v10 = [PPSMetric alloc];
  v11 = +[PPSUnit dimensionless];
  v12 = +[PPSCadence cadenceEventXPCWithFrequency:3];
  v13 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v10, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"eventType", @"HomeEnergy", @"HomeAppUIInteractions", 7, v11, v12, 4.0, 0x300000003, 0x100000001, 0x300000001, 0x100000001, v26);

  v39[0] = @"EnumMapping";
  v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v37[0] = v14;
  v38[0] = @"Unknown";
  v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v37[1] = v15;
  v38[1] = @"Appear";
  v16 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v37[2] = v16;
  v38[2] = @"Disappear";
  v17 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v37[3] = v17;
  v38[3] = @"ViewAccessedFromURL";
  v18 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];
  v39[1] = @"MetricType";
  v40[0] = v18;
  v19 = +[PPSMetricType stateDimension];
  v40[1] = v19;
  v20 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];

  v21 = [PPSMetric alloc];
  v22 = +[PPSUnit dimensionless];
  v23 = [(PPSMetric *)v21 initWithName:@"state" version:7 datatype:v22 unit:v13 baseMetric:v20 optionalPayload:4.0];

  v36[0] = v13;
  v36[1] = v23;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];

  return v24;
}

+ (id)cleanEnergyForecastMetrics
{
  v41[3] = *MEMORY[0x263EF8340];
  v40[0] = @"EnumMapping";
  v34 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v38[0] = v34;
  v39[0] = @"Idle";
  v33 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v38[1] = v33;
  v39[1] = @"GettingLocation";
  v32 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v38[2] = v32;
  void v39[2] = @"GettingGridID";
  v31 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
  v38[3] = v31;
  v39[3] = @"GettingEnergyWindows";
  v30 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
  void v38[4] = v30;
  v39[4] = @"NoLocation";
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v38[5] = v2;
  v39[5] = @"NoGridID";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 6);
  v38[6] = v3;
  v39[6] = @"FailedGridID";
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 7);
  v38[7] = v4;
  v39[7] = @"NoEnergyWindows";
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 8);
  v38[8] = v5;
  v39[8] = @"FailedEnergyWindows";
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 9);
  v38[9] = v6;
  v39[9] = @"HomeNotFound";
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
  v38[10] = v7;
  v39[10] = @"NoHomePermission";
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 11);
  v38[11] = v8;
  v39[11] = @"OtherError";
  v9 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:12];
  v41[0] = v9;
  v41[1] = &unk_270701CE0;
  v40[1] = @"GroupingDimensions";
  void v40[2] = @"MetricType";
  v10 = +[PPSMetricType stateDimension];
  v41[2] = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];

  v12 = [PPSMetric alloc];
  v13 = +[PPSUnit dimensionless];
  v14 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  v15 = (void *)v11;
  v16 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v12, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"state", @"HomeEnergy", @"CleanEnergyForecast", 7, v13, v14, 1.0, 0x300000003, 0x100000001, 0x300000001, 0x100000001, v11);

  v36 = @"MetricType";
  v17 = +[PPSMetricType genericDimension];
  v37 = v17;
  v18 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];

  v19 = [PPSMetric alloc];
  v20 = +[PPSUnit dimensionless];
  v21 = [(PPSMetric *)v19 initWithName:@"gridID" version:3 datatype:v20 unit:v16 baseMetric:v18 optionalPayload:1.0];

  v22 = [PPSMetric alloc];
  v23 = +[PPSUnit seconds];
  v24 = [(PPSMetric *)v22 initWithName:@"windowStart" version:7 datatype:v23 unit:v16 baseMetric:0 optionalPayload:1.0];

  v25 = [PPSMetric alloc];
  v26 = +[PPSUnit seconds];
  v27 = [(PPSMetric *)v25 initWithName:@"windowEnd" version:7 datatype:v26 unit:v16 baseMetric:0 optionalPayload:1.0];

  v35[0] = v16;
  v35[1] = v21;
  v35[2] = v24;
  v35[3] = v27;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:4];

  return v28;
}

@end