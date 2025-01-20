@interface PPSDisplayMetrics
+ (id)allDeclMetrics;
+ (id)displayLoggingCadence;
+ (id)displayMetricsWithStorage:(int)a3 timeToLive:(unsigned int)a4 category:(id)a5;
+ (id)subsystem;
@end

@implementation PPSDisplayMetrics

+ (id)subsystem
{
  return @"DisplayMetrics";
}

+ (id)allDeclMetrics
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [(id)objc_opt_class() displayMetricsWithStorage:2 timeToLive:1 category:@"DisplayState"];
  [v2 addObjectsFromArray:v3];
  v4 = [(id)objc_opt_class() displayMetricsWithStorage:3 timeToLive:7 category:@"DisplayStateExtended"];
  [v2 addObjectsFromArray:v4];

  return v2;
}

+ (id)displayMetricsWithStorage:(int)a3 timeToLive:(unsigned int)a4 category:(id)a5
{
  v39[1] = *MEMORY[0x263EF8340];
  v38 = @"MetricType";
  id v7 = a5;
  v8 = +[PPSMetricType genericDimension];
  v39[0] = v8;
  v32 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];

  v9 = [PPSMetric alloc];
  v10 = +[PPSDisplayMetrics subsystem];
  v11 = +[PPSUnit dimensionless];
  v12 = +[PPSDisplayMetrics displayLoggingCadence];
  *(_DWORD *)&v29[20] = 1;
  *(void *)&v29[12] = 0x100000003;
  *(void *)&v29[4] = 0x800000001;
  HIDWORD(v27) = a3;
  *(_DWORD *)v29 = a4;
  LODWORD(v27) = 3;
  v13 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v9, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Block", v10, v7, 3, v11, v12, 2.0, v27, *(void *)v29, *(void *)&v29[8], *(void *)&v29[16], v32);

  v36[0] = @"EnumMapping";
  v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  v34[0] = v14;
  v35[0] = @"Inactive";
  v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v34[1] = v15;
  v35[1] = @"Active";
  v16 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
  v34[2] = v16;
  v35[2] = @"AOD";
  v17 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
  v37[0] = v17;
  v37[1] = &unk_270701D70;
  v36[1] = @"GroupingDimensions";
  v36[2] = @"MetricType";
  v18 = +[PPSMetricType stateDimension];
  v37[2] = v18;
  v19 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];

  v20 = [PPSMetric alloc];
  v21 = +[PPSDisplayMetrics subsystem];
  v22 = +[PPSUnit dimensionless];
  v23 = +[PPSDisplayMetrics displayLoggingCadence];
  *(_DWORD *)&v30[20] = 1;
  *(void *)&v30[12] = 0x100000003;
  *(void *)&v30[4] = 0x800000001;
  HIDWORD(v28) = a3;
  *(_DWORD *)v30 = a4;
  LODWORD(v28) = 3;
  v24 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v20, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", @"Active", v21, v7, 7, v22, v23, 3.0, v28, *(void *)v30, *(void *)&v30[8], *(void *)&v30[16], v19);

  v33[0] = v13;
  v33[1] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];

  return v25;
}

+ (id)displayLoggingCadence
{
  v10[2] = *MEMORY[0x263EF8340];
  v2 = [[PPSCadenceTuple alloc] initWithCadenceType:3 value:1];
  v3 = [[PPSCadenceTuple alloc] initWithCadenceType:4 value:0];
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
    id v7 = [PPSCadence alloc];
    v10[0] = v2;
    v10[1] = v4;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    v5 = [(PPSCadence *)v7 initWithCadenceTuples:v8];
  }
  return v5;
}

@end