@interface PPSMetric
+ (BOOL)isValidAuxiliaryType:(id)a3;
+ (BOOL)isValidBuild:(id)a3;
+ (BOOL)isValidCategory:(id)a3;
+ (BOOL)isValidDMACompliant:(id)a3;
+ (BOOL)isValidDatatype:(int)a3;
+ (BOOL)isValidDeviceCapability:(int)a3;
+ (BOOL)isValidDirectionality:(int)a3;
+ (BOOL)isValidEnumDeclaration:(id)a3;
+ (BOOL)isValidEnumDeclarationJSON:(id)a3;
+ (BOOL)isValidFilterEntryLogging:(id)a3;
+ (BOOL)isValidFixedArraySize:(id)a3;
+ (BOOL)isValidGroupingDimensions:(id)a3;
+ (BOOL)isValidGroupingDimensionsJSON:(id)a3;
+ (BOOL)isValidMetricJSON:(id)a3;
+ (BOOL)isValidMetricType:(id)a3;
+ (BOOL)isValidMode:(int)a3;
+ (BOOL)isValidName:(id)a3;
+ (BOOL)isValidObfuscation:(int)a3;
+ (BOOL)isValidOptionalPayload:(id)a3;
+ (BOOL)isValidPopulation:(int)a3;
+ (BOOL)isValidPrivacyClassification:(int)a3;
+ (BOOL)isValidRounding:(id)a3;
+ (BOOL)isValidSource:(id)a3;
+ (BOOL)isValidSourceJSON:(id)a3;
+ (BOOL)isValidStorage:(int)a3;
+ (BOOL)isValidSubsystem:(id)a3;
+ (BOOL)isValidTTL:(unsigned int)a3;
+ (BOOL)isValidVersion:(double)a3;
+ (id)dictionaryWithPropertiesOfPPSMetric:(id)a3;
+ (id)enumMappingToProto:(id)a3;
+ (id)enumMappingWithProto:(id)a3;
+ (id)groupByToProto:(id)a3;
+ (id)groupByWithProto:(id)a3;
+ (id)jsonDataWithMetrics:(id)a3;
+ (id)metricWithJSONObject:(id)a3;
+ (id)metricWithProto:(id)a3;
+ (id)metricWithProto:(id)a3 withBuild:(id)a4;
+ (id)metricsWithJSONData:(id)a3;
+ (id)metricsWithPlist:(id)a3 subsystem:(id)a4;
+ (id)setOptionalFields:(id)a3;
+ (id)sourceToProto:(id)a3;
+ (id)sourceWithProto:(id)a3;
+ (void)setMetadataDefaults:(id)a3;
- (BOOL)DMACompliant;
- (BOOL)filterEntryLogging;
- (NSArray)groupBy;
- (NSDictionary)enumMapping;
- (NSString)build;
- (NSString)category;
- (NSString)name;
- (NSString)source;
- (NSString)subsystem;
- (PPSCadence)cadence;
- (PPSMetric)init;
- (PPSMetric)initWithName:(id)a3 subsystem:(id)a4 category:(id)a5 version:(double)a6 datatype:(int)a7 unit:(id)a8 cadence:(id)a9 directionality:(int)a10 storage:(int)a11 timeToLive:(unsigned int)a12 mode:(int)a13 deviceCapability:(int)a14 population:(int)a15 obfuscation:(int)a16 privacyClassification:(int)a17 optionalPayload:(id)a18;
- (PPSMetric)initWithName:(id)a3 version:(double)a4 datatype:(int)a5 unit:(id)a6 baseMetric:(id)a7 optionalPayload:(id)a8;
- (PPSMetricType)metricType;
- (PPSRounding)rounding;
- (PPSUnit)unit;
- (double)version;
- (id)data;
- (id)json;
- (id)proto;
- (id)protoData;
- (int)auxiliaryType;
- (int)datatype;
- (int)deviceCapability;
- (int)directionality;
- (int)enabledPopulation;
- (int)mode;
- (int)obfuscation;
- (int)privacyClassification;
- (int)storage;
- (unsigned)fixedArraySize;
- (unsigned)timeToLive;
- (void)addAuxiliaryType:(id)a3;
- (void)addDMACompliant:(id)a3;
- (void)addEnumMapping:(id)a3;
- (void)addFilterEntryLogging:(id)a3;
- (void)addFixedArraySize:(id)a3;
- (void)addGroupingDimensions:(id)a3;
- (void)addMetricType:(id)a3;
- (void)addOptionalFields:(id)a3;
- (void)addRounding:(id)a3;
- (void)addSource:(id)a3;
- (void)setBuild:(id)a3;
@end

@implementation PPSMetric

- (NSString)subsystem
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (int)datatype
{
  return self->_datatype;
}

- (BOOL)DMACompliant
{
  return self->_DMACompliant;
}

- (int)storage
{
  return self->_storage;
}

- (double)version
{
  return self->_version;
}

- (int)mode
{
  return self->_mode;
}

- (unsigned)timeToLive
{
  return self->_timeToLive;
}

- (BOOL)filterEntryLogging
{
  return self->_filterEntryLogging;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (int)auxiliaryType
{
  return self->_auxiliaryType;
}

+ (id)metricWithJSONObject:(id)a3
{
  id v3 = a3;
  v4 = (void *)[v3 mutableCopy];
  if (!+[PPSMetric isValidMetricJSON:v4])
  {
    v12 = 0;
    id v5 = v3;
    goto LABEL_44;
  }
  id v5 = v4;

  v6 = [v5 objectForKeyedSubscript:@"unit"];
  v7 = +[PPSUnit unitWithJSONObject:v6];

  v8 = [v5 objectForKeyedSubscript:@"cadence"];

  if (v8)
  {
    v9 = [v5 objectForKeyedSubscript:@"cadence"];
    uint64_t v10 = +[PPSCadence cadenceWithJSONObject:v9];

    if (!v10)
    {
      v11 = PPSStorageLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric(JSON) metricWithJSONObject:].cold.4();
      }
      v12 = 0;
      goto LABEL_43;
    }
  }
  else
  {
    v13 = PPSStorageLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      +[PPSMetric(JSON) metricWithJSONObject:]();
    }

    uint64_t v10 = +[PPSCadence cadenceEventXPCWithFrequency:2];
  }
  v67 = v10;
  v14 = [v5 objectForKeyedSubscript:@"rounding"];

  if (!v14)
  {
    v16 = 0;
LABEL_17:
    v18 = [v5 objectForKeyedSubscript:@"metricType"];

    if (v18)
    {
      v19 = [v5 objectForKeyedSubscript:@"metricType"];
      uint64_t v20 = +[PPSMetricType metricTypeWithJSONObject:v19];

      if (!v20)
      {
        v21 = PPSStorageLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          +[PPSMetric(JSON) metricWithJSONObject:]();
        }

        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v20 = 0;
    }
    v22 = objc_opt_new();
    v23 = [v5 objectForKeyedSubscript:@"enumMapping"];

    if (v23)
    {
      v24 = [v5 objectForKeyedSubscript:@"enumMapping"];
      [v22 setObject:v24 forKeyedSubscript:@"EnumMapping"];
    }
    if (v16) {
      [v22 setObject:v16 forKeyedSubscript:@"Rounding"];
    }
    v25 = [v5 objectForKeyedSubscript:@"source"];

    if (v25)
    {
      v26 = [v5 objectForKeyedSubscript:@"source"];
      [v22 setObject:v26 forKeyedSubscript:@"Source"];
    }
    v27 = [v5 objectForKeyedSubscript:@"groupBy"];

    if (v27)
    {
      v28 = [v5 objectForKeyedSubscript:@"groupBy"];
      [v22 setObject:v28 forKeyedSubscript:@"GroupingDimensions"];
    }
    if (v20) {
      [v22 setObject:v20 forKeyedSubscript:@"MetricType"];
    }
    v29 = [v5 objectForKeyedSubscript:@"auxiliaryType"];

    if (v29)
    {
      v30 = [v5 objectForKeyedSubscript:@"auxiliaryType"];
      [v22 setObject:v30 forKeyedSubscript:@"AuxiliaryType"];
    }
    v31 = [v5 objectForKeyedSubscript:@"filterEntryLogging"];

    if (v31)
    {
      v32 = [v5 objectForKeyedSubscript:@"filterEntryLogging"];
      [v22 setObject:v32 forKeyedSubscript:@"FilterEntryLogging"];
    }
    v33 = [v5 objectForKeyedSubscript:@"dmaCompliant"];

    if (v33)
    {
      v34 = [v5 objectForKeyedSubscript:@"dmaCompliant"];
      [v22 setObject:v34 forKeyedSubscript:@"DMACompliant"];
    }
    v63 = (void *)v20;
    v64 = v16;
    v65 = v7;
    v66 = v4;
    v35 = [v5 objectForKeyedSubscript:@"fixedArraySize"];

    if (v35)
    {
      v36 = [v5 objectForKeyedSubscript:@"fixedArraySize"];
      [v22 setObject:v36 forKeyedSubscript:@"FixedArraySize"];
    }
    v37 = [PPSMetric alloc];
    v38 = [v5 objectForKeyedSubscript:@"name"];
    v39 = [v5 objectForKeyedSubscript:@"subsystem"];
    v59 = [v5 objectForKeyedSubscript:@"category"];
    v62 = [v5 objectForKeyedSubscript:@"version"];
    [v62 doubleValue];
    double v41 = v40;
    v61 = [v5 objectForKeyedSubscript:@"datatype"];
    unsigned int v57 = [v61 unsignedIntValue];
    v60 = [v5 objectForKeyedSubscript:@"directionality"];
    unsigned int v55 = [v60 unsignedIntValue];
    v58 = [v5 objectForKeyedSubscript:@"storage"];
    unsigned int v53 = [v58 unsignedIntValue];
    v56 = [v5 objectForKeyedSubscript:@"timeToLive"];
    unsigned int v51 = [v56 unsignedIntValue];
    v54 = [v5 objectForKeyedSubscript:@"mode"];
    unsigned int v49 = [v54 unsignedIntValue];
    v52 = [v5 objectForKeyedSubscript:@"deviceCapability"];
    unsigned int v42 = [v52 unsignedIntValue];
    v50 = [v5 objectForKeyedSubscript:@"enabledPopulation"];
    unsigned int v43 = [v50 unsignedIntValue];
    v44 = [v5 objectForKeyedSubscript:@"obfuscation"];
    unsigned int v45 = [v44 unsignedIntValue];
    v46 = [v5 objectForKeyedSubscript:@"privacyClassification"];
    unint64_t v48 = __PAIR64__(v43, v42);
    v11 = v67;
    v12 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v37, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", v38, v39, v59, v57, v65, v67, v41, __PAIR64__(v53, v55), __PAIR64__(v49, v51), v48, __PAIR64__([v46 unsignedIntValue], v45), v22);

    v7 = v65;
    v4 = v66;
    goto LABEL_43;
  }
  v15 = [v5 objectForKeyedSubscript:@"rounding"];
  v16 = +[PPSRounding roundingWithJSONObject:v15];

  if (v16) {
    goto LABEL_17;
  }
  v17 = PPSStorageLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    +[PPSMetric(JSON) metricWithJSONObject:]();
  }

LABEL_22:
  v12 = 0;
  v11 = v67;
LABEL_43:

LABEL_44:
  return v12;
}

- (id)json
{
  return +[PPSMetric dictionaryWithPropertiesOfPPSMetric:self];
}

+ (id)dictionaryWithPropertiesOfPPSMetric:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x263EFF9A0] dictionary];
    unsigned int outCount = 0;
    id v5 = (objc_class *)objc_opt_class();
    v6 = class_copyPropertyList(v5, &outCount);
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; ++i)
      {
        v8 = [NSString stringWithUTF8String:property_getName(v6[i])];
        v9 = [v3 valueForKey:v8];

        if (v9)
        {
          if (([v8 isEqualToString:@"cadence"] & 1) != 0
            || ([v8 isEqualToString:@"rounding"] & 1) != 0
            || ([v8 isEqualToString:@"unit"] & 1) != 0
            || [v8 isEqualToString:@"metricType"])
          {
            uint64_t v10 = [v3 valueForKey:v8];
            v11 = [v10 json];
            [v4 setObject:v11 forKeyedSubscript:v8];
          }
          else
          {
            uint64_t v10 = [v3 valueForKey:v8];
            [v4 setObject:v10 forKeyedSubscript:v8];
          }
        }
      }
    }
    free(v6);
    v12 = [NSDictionary dictionaryWithDictionary:v4];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)metricsWithJSONData:(id)a3
{
  if (a3)
  {
    id v13 = 0;
    id v3 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:4 error:&v13];
    v4 = v13;
    if (v4)
    {
      id v5 = PPSStorageLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric(JSON) metricsWithJSONData:].cold.4();
      }
    }
    else if ([MEMORY[0x263F08900] isValidJSONObject:v3])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = [MEMORY[0x263EFF980] array];
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __39__PPSMetric_JSON__metricsWithJSONData___block_invoke;
        v11[3] = &unk_265440C10;
        v8 = v9;
        v12 = v8;
        [v3 enumerateObjectsUsingBlock:v11];
        id v5 = v12;
LABEL_16:

        goto LABEL_17;
      }
      id v5 = PPSStorageLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric(JSON) metricsWithJSONData:]();
      }
    }
    else
    {
      id v5 = PPSStorageLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric(JSON) metricsWithJSONData:]();
      }
    }
    v8 = 0;
    goto LABEL_16;
  }
  v4 = PPSStorageLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    +[PPSMetric(JSON) metricsWithJSONData:v7];
  }
  v8 = 0;
LABEL_17:

  return v8;
}

void __39__PPSMetric_JSON__metricsWithJSONData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[PPSMetric metricWithJSONObject:v3];
  if (v4)
  {
    [*(id *)(a1 + 32) addObject:v4];
  }
  else
  {
    id v5 = PPSStorageLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __39__PPSMetric_JSON__metricsWithJSONData___block_invoke_cold_1();
    }
  }
}

+ (id)jsonDataWithMetrics:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __39__PPSMetric_JSON__jsonDataWithMetrics___block_invoke;
    v11[3] = &unk_265440C38;
    id v5 = v4;
    v12 = v5;
    [v3 enumerateObjectsUsingBlock:v11];
    if (-[NSObject count](v5, "count") && [MEMORY[0x263F08900] isValidJSONObject:v5])
    {
      uint64_t v6 = [MEMORY[0x263F08900] dataWithJSONObject:v5 options:1 error:0];
    }
    else
    {
      uint64_t v7 = PPSStorageLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric(JSON) jsonDataWithMetrics:]();
      }

      uint64_t v6 = 0;
    }
  }
  else
  {
    id v5 = PPSStorageLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric(JSON) jsonDataWithMetrics:v9];
    }
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __39__PPSMetric_JSON__jsonDataWithMetrics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 json];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  return MEMORY[0x270F9A758]();
}

+ (BOOL)isValidMetricJSON:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v7 = [v4 objectForKeyedSubscript:@"subsystem"];
      objc_opt_class();
      char v8 = objc_opt_isKindOfClass();

      if (v8)
      {
        uint64_t v9 = [v4 objectForKeyedSubscript:@"category"];
        objc_opt_class();
        char v10 = objc_opt_isKindOfClass();

        if (v10)
        {
          v11 = [v4 objectForKeyedSubscript:@"version"];
          objc_opt_class();
          char v12 = objc_opt_isKindOfClass();

          if (v12)
          {
            id v13 = [v4 objectForKeyedSubscript:@"datatype"];
            objc_opt_class();
            char v14 = objc_opt_isKindOfClass();

            if (v14)
            {
              v15 = [v4 objectForKeyedSubscript:@"directionality"];

              if (!v15)
              {
                v16 = PPSStorageLog();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
                  +[PPSMetric(JSON) isValidMetricJSON:]7();
                }

                [v4 setObject:&unk_270701C38 forKeyedSubscript:@"directionality"];
              }
              v17 = [v4 objectForKeyedSubscript:@"directionality"];
              objc_opt_class();
              char v18 = objc_opt_isKindOfClass();

              if (v18)
              {
                v19 = [v4 objectForKeyedSubscript:@"storage"];
                objc_opt_class();
                char v20 = objc_opt_isKindOfClass();

                if (v20)
                {
                  v21 = [v4 objectForKeyedSubscript:@"timeToLive"];
                  objc_opt_class();
                  char v22 = objc_opt_isKindOfClass();

                  if (v22)
                  {
                    v23 = [v4 objectForKeyedSubscript:@"mode"];
                    objc_opt_class();
                    char v24 = objc_opt_isKindOfClass();

                    if (v24)
                    {
                      v25 = [v4 objectForKeyedSubscript:@"enabledPopulation"];
                      objc_opt_class();
                      char v26 = objc_opt_isKindOfClass();

                      if (v26)
                      {
                        v27 = [v4 objectForKeyedSubscript:@"deviceCapability"];

                        if (!v27)
                        {
                          v28 = PPSStorageLog();
                          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
                            +[PPSMetric(JSON) isValidMetricJSON:]1();
                          }

                          [v4 setObject:&unk_270701C50 forKeyedSubscript:@"deviceCapability"];
                        }
                        v29 = [v4 objectForKeyedSubscript:@"deviceCapability"];
                        objc_opt_class();
                        char v30 = objc_opt_isKindOfClass();

                        if (v30)
                        {
                          v31 = [v4 objectForKeyedSubscript:@"obfuscation"];

                          if (!v31)
                          {
                            v32 = PPSStorageLog();
                            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
                              +[PPSMetric(JSON) isValidMetricJSON:].cold.9();
                            }

                            [v4 setObject:&unk_270701C50 forKeyedSubscript:@"obfuscation"];
                          }
                          v33 = [v4 objectForKeyedSubscript:@"obfuscation"];
                          objc_opt_class();
                          char v34 = objc_opt_isKindOfClass();

                          if (v34)
                          {
                            v35 = [v4 objectForKeyedSubscript:@"privacyClassification"];

                            if (!v35)
                            {
                              v36 = PPSStorageLog();
                              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
                                +[PPSMetric(JSON) isValidMetricJSON:].cold.7();
                              }

                              [v4 setObject:&unk_270701C68 forKeyedSubscript:@"privacyClassification"];
                            }
                            v37 = [v4 objectForKeyedSubscript:@"privacyClassification"];
                            objc_opt_class();
                            char v38 = objc_opt_isKindOfClass();

                            if (v38)
                            {
                              v39 = [v4 objectForKeyedSubscript:@"enumMapping"];
                              int v40 = [a1 isValidEnumDeclarationJSON:v39];

                              if (!v40) {
                                goto LABEL_77;
                              }
                              double v41 = [v4 objectForKeyedSubscript:@"source"];
                              int v42 = [a1 isValidSourceJSON:v41];

                              if (!v42
                                || ([v4 objectForKeyedSubscript:@"groupBy"],
                                    unsigned int v43 = objc_claimAutoreleasedReturnValue(),
                                    int v44 = [a1 isValidGroupingDimensionsJSON:v43],
                                    v43,
                                    !v44))
                              {
LABEL_77:
                                char v68 = 0;
                                goto LABEL_76;
                              }
                              uint64_t v45 = [v4 objectForKeyedSubscript:@"auxiliaryType"];
                              if (v45
                                && (v46 = (void *)v45,
                                    [v4 objectForKeyedSubscript:@"auxiliaryType"],
                                    v47 = objc_claimAutoreleasedReturnValue(),
                                    objc_opt_class(),
                                    char v48 = objc_opt_isKindOfClass(),
                                    v47,
                                    v46,
                                    (v48 & 1) == 0))
                              {
                                v66 = PPSStorageLog();
                                if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                                  +[PPSMetric(JSON) isValidMetricJSON:].cold.5();
                                }
                              }
                              else
                              {
                                uint64_t v49 = [v4 objectForKeyedSubscript:@"filterEntryLogging"];
                                if (v49
                                  && (v50 = (void *)v49,
                                      [v4 objectForKeyedSubscript:@"filterEntryLogging"],
                                      unsigned int v51 = objc_claimAutoreleasedReturnValue(),
                                      objc_opt_class(),
                                      char v52 = objc_opt_isKindOfClass(),
                                      v51,
                                      v50,
                                      (v52 & 1) == 0))
                                {
                                  v66 = PPSStorageLog();
                                  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                                    +[PPSMetric(JSON) isValidMetricJSON:].cold.4();
                                  }
                                }
                                else
                                {
                                  uint64_t v53 = [v4 objectForKeyedSubscript:@"dmaCompliant"];
                                  if (v53
                                    && (v54 = (void *)v53,
                                        [v4 objectForKeyedSubscript:@"dmaCompliant"],
                                        unsigned int v55 = objc_claimAutoreleasedReturnValue(),
                                        objc_opt_class(),
                                        char v56 = objc_opt_isKindOfClass(),
                                        v55,
                                        v54,
                                        (v56 & 1) == 0))
                                  {
                                    v66 = PPSStorageLog();
                                    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                                      +[PPSMetric(JSON) isValidMetricJSON:]();
                                    }
                                  }
                                  else
                                  {
                                    uint64_t v57 = [v4 objectForKeyedSubscript:@"exampleValue"];
                                    if (v57
                                      && (v58 = (void *)v57,
                                          [v4 objectForKeyedSubscript:@"exampleValue"],
                                          v59 = objc_claimAutoreleasedReturnValue(),
                                          objc_opt_class(),
                                          char v60 = objc_opt_isKindOfClass(),
                                          v59,
                                          v58,
                                          (v60 & 1) == 0))
                                    {
                                      v66 = PPSStorageLog();
                                      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                                        +[PPSMetric(JSON) isValidMetricJSON:]();
                                      }
                                    }
                                    else
                                    {
                                      uint64_t v61 = [v4 objectForKeyedSubscript:@"metricDescription"];
                                      if (!v61
                                        || (v62 = (void *)v61,
                                            [v4 objectForKeyedSubscript:@"metricDescription"],
                                            v63 = objc_claimAutoreleasedReturnValue(),
                                            objc_opt_class(),
                                            char v64 = objc_opt_isKindOfClass(),
                                            v63,
                                            v62,
                                            (v64 & 1) != 0))
                                      {
                                        uint64_t v65 = [v4 objectForKeyedSubscript:@"fixedArraySize"];
                                        if (!v65)
                                        {
                                          char v68 = 1;
                                          goto LABEL_76;
                                        }
                                        v66 = v65;
                                        v67 = [v4 objectForKeyedSubscript:@"fixedArraySize"];
                                        objc_opt_class();
                                        char v68 = objc_opt_isKindOfClass();

                                        goto LABEL_75;
                                      }
                                      v66 = PPSStorageLog();
                                      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                                        +[PPSMetric(JSON) isValidMetricJSON:]();
                                      }
                                    }
                                  }
                                }
                              }
                            }
                            else
                            {
                              v66 = PPSStorageLog();
                              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                                +[PPSMetric(JSON) isValidMetricJSON:].cold.6();
                              }
                            }
                          }
                          else
                          {
                            v66 = PPSStorageLog();
                            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                              +[PPSMetric(JSON) isValidMetricJSON:].cold.8();
                            }
                          }
                        }
                        else
                        {
                          v66 = PPSStorageLog();
                          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                            +[PPSMetric(JSON) isValidMetricJSON:]0();
                          }
                        }
                      }
                      else
                      {
                        v66 = PPSStorageLog();
                        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                          +[PPSMetric(JSON) isValidMetricJSON:]2();
                        }
                      }
                    }
                    else
                    {
                      v66 = PPSStorageLog();
                      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                        +[PPSMetric(JSON) isValidMetricJSON:]3();
                      }
                    }
                  }
                  else
                  {
                    v66 = PPSStorageLog();
                    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                      +[PPSMetric(JSON) isValidMetricJSON:]4();
                    }
                  }
                }
                else
                {
                  v66 = PPSStorageLog();
                  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                    +[PPSMetric(JSON) isValidMetricJSON:]5();
                  }
                }
              }
              else
              {
                v66 = PPSStorageLog();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                  +[PPSMetric(JSON) isValidMetricJSON:]6();
                }
              }
            }
            else
            {
              v66 = PPSStorageLog();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                +[PPSMetric(JSON) isValidMetricJSON:]8();
              }
            }
          }
          else
          {
            v66 = PPSStorageLog();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
              +[PPSMetric(JSON) isValidMetricJSON:]9();
            }
          }
        }
        else
        {
          v66 = PPSStorageLog();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
            +[PPSMetric(JSON) isValidMetricJSON:]0();
          }
        }
      }
      else
      {
        v66 = PPSStorageLog();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
          +[PPSMetric(JSON) isValidMetricJSON:]1();
        }
      }
    }
    else
    {
      v66 = PPSStorageLog();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric(JSON) isValidMetricJSON:]2();
      }
    }
  }
  else
  {
    v66 = PPSStorageLog();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric(JSON) isValidMetricJSON:]3();
    }
  }
  char v68 = 0;
LABEL_75:

LABEL_76:
  return v68 & 1;
}

+ (BOOL)isValidEnumDeclarationJSON:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = 0;
    char v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 1;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke;
    v6[3] = &unk_265440C60;
    v6[4] = &v7;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];
    LODWORD(v4) = *((unsigned __int8 *)v8 + 24);
    _Block_object_dispose(&v7, 8);
    if (v4) {
LABEL_4:
    }
      LOBYTE(v4) = 1;
  }
  else
  {
    id v4 = PPSStorageLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric(JSON) isValidEnumDeclarationJSON:]();
    }

    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

void __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = PPSStorageLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke_cold_2();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v10 = PPSStorageLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

+ (BOOL)isValidSourceJSON:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = PPSStorageLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric(JSON) isValidSourceJSON:]();
    }

    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

+ (BOOL)isValidGroupingDimensionsJSON:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      BOOL v4 = v3;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v13;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v4);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              char v10 = PPSMetricLog();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
                +[PPSMetric(JSON) isValidGroupingDimensionsJSON:]();
              }

              goto LABEL_18;
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
          BOOL v9 = 1;
          if (v6) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v9 = 1;
      }
    }
    else
    {
      BOOL v4 = PPSStorageLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric(JSON) isValidGroupingDimensionsJSON:]();
      }
LABEL_18:
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

+ (id)metricWithProto:(id)a3
{
  id v4 = a3;
  char v24 = [a1 setOptionalFields:v4];
  +[PPSMetric setMetadataDefaults:v4];
  v25 = [PPSMetric alloc];
  v23 = [v4 name];
  char v22 = [v4 subsystem];
  v21 = [v4 category];
  [v4 version];
  double v6 = v5;
  unsigned int v19 = [v4 datatype];
  char v20 = [v4 unit];
  char v18 = +[PPSUnit unitWithProto:v20];
  uint64_t v7 = [v4 cadence];
  id v8 = +[PPSCadence cadenceWithProto:v7];
  unsigned int v17 = [v4 directionality];
  unsigned int v9 = [v4 storage];
  unsigned int v10 = [v4 timeToLive];
  unsigned int v11 = [v4 mode];
  unsigned int v12 = [v4 deviceCapability];
  unsigned int v13 = [v4 enabledPopulation];
  unsigned int v14 = [v4 obfuscation];
  LODWORD(a1) = [v4 privacyClassification];

  long long v15 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v25, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", v23, v22, v21, v19, v18, v8, v6, __PAIR64__(v9, v17), __PAIR64__(v11, v10), __PAIR64__(v13, v12), __PAIR64__(a1, v14), v24);
  return v15;
}

+ (id)metricWithProto:(id)a3 withBuild:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a1 metricWithProto:a3];
  [v7 setValue:v6 forKey:@"build"];

  return v7;
}

- (id)proto
{
  id v3 = objc_alloc_init(PPSPBMetric);
  id v4 = [(PPSMetric *)self name];
  [(PPSPBMetric *)v3 setName:v4];

  double v5 = [(PPSMetric *)self subsystem];
  [(PPSPBMetric *)v3 setSubsystem:v5];

  id v6 = [(PPSMetric *)self category];
  [(PPSPBMetric *)v3 setCategory:v6];

  [(PPSMetric *)self version];
  -[PPSPBMetric setVersion:](v3, "setVersion:");
  [(PPSPBMetric *)v3 setDatatype:[(PPSMetric *)self datatype]];
  uint64_t v7 = [(PPSMetric *)self unit];
  id v8 = [v7 proto];
  [(PPSPBMetric *)v3 setUnit:v8];

  unsigned int v9 = [(PPSMetric *)self cadence];
  unsigned int v10 = [v9 proto];
  [(PPSPBMetric *)v3 setCadence:v10];

  [(PPSPBMetric *)v3 setDirectionality:[(PPSMetric *)self directionality]];
  [(PPSPBMetric *)v3 setStorage:[(PPSMetric *)self storage]];
  [(PPSPBMetric *)v3 setTimeToLive:[(PPSMetric *)self timeToLive]];
  [(PPSPBMetric *)v3 setMode:[(PPSMetric *)self mode]];
  [(PPSPBMetric *)v3 setDeviceCapability:[(PPSMetric *)self deviceCapability]];
  [(PPSPBMetric *)v3 setEnabledPopulation:[(PPSMetric *)self enabledPopulation]];
  [(PPSPBMetric *)v3 setObfuscation:[(PPSMetric *)self obfuscation]];
  [(PPSPBMetric *)v3 setPrivacyClassification:[(PPSMetric *)self privacyClassification]];
  unsigned int v11 = [(PPSMetric *)self rounding];

  if (v11)
  {
    unsigned int v12 = [(PPSMetric *)self rounding];
    unsigned int v13 = [v12 proto];
    [(PPSPBMetric *)v3 setRounding:v13];
  }
  unsigned int v14 = [(PPSMetric *)self enumMapping];

  if (v14)
  {
    long long v15 = [(PPSMetric *)self enumMapping];
    v16 = +[PPSMetric enumMappingToProto:v15];
    [(PPSPBMetric *)v3 setEnumMapping:v16];
  }
  unsigned int v17 = [(PPSMetric *)self source];

  if (v17)
  {
    char v18 = [(PPSMetric *)self source];
    unsigned int v19 = +[PPSMetric sourceToProto:v18];
    [(PPSPBMetric *)v3 setSource:v19];
  }
  char v20 = [(PPSMetric *)self groupBy];

  if (v20)
  {
    v21 = [(PPSMetric *)self groupBy];
    char v22 = +[PPSMetric groupByToProto:v21];
    [(PPSPBMetric *)v3 setGroupBy:v22];
  }
  v23 = [(PPSMetric *)self metricType];

  if (v23)
  {
    char v24 = [(PPSMetric *)self metricType];
    v25 = [v24 proto];
    [(PPSPBMetric *)v3 setMetricType:v25];
  }
  if ([(PPSMetric *)self auxiliaryType]) {
    [(PPSPBMetric *)v3 setAuxiliaryType:[(PPSMetric *)self auxiliaryType]];
  }
  if ([(PPSMetric *)self filterEntryLogging]) {
    [(PPSPBMetric *)v3 setFilterEntryLogging:[(PPSMetric *)self filterEntryLogging]];
  }
  if ([(PPSMetric *)self DMACompliant]) {
    [(PPSPBMetric *)v3 setDmaCompliant:[(PPSMetric *)self DMACompliant]];
  }
  if ([(PPSMetric *)self fixedArraySize]) {
    [(PPSPBMetric *)v3 setFixedArraySize:[(PPSMetric *)self fixedArraySize]];
  }
  return v3;
}

- (id)protoData
{
  v2 = [(PPSMetric *)self proto];
  id v3 = [v2 data];

  return v3;
}

+ (id)enumMappingWithProto:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 enumMaps];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = objc_msgSend(v3, "enumMaps", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          unsigned int v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          unsigned int v13 = [v12 value];
          unsigned int v14 = [v12 key];
          [v6 setObject:v13 forKeyedSubscript:v14];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)enumMappingToProto:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PPSPBEnumMapping);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__PPSMetric_Protobuf__enumMappingToProto___block_invoke;
  v7[3] = &unk_265440C88;
  uint64_t v5 = v4;
  uint64_t v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __42__PPSMetric_Protobuf__enumMappingToProto___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = (id)objc_opt_new();
  [v7 setKey:v6];

  [v7 setValue:v5];
  [*(id *)(a1 + 32) addEnumMap:v7];
}

+ (id)sourceWithProto:(id)a3
{
  return (id)[a3 source];
}

+ (id)sourceToProto:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PPSPBSource);
  [(PPSPBSource *)v4 setSource:v3];

  return v4;
}

+ (id)groupByWithProto:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 groupBysCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v8 = [v3 groupByAtIndex:i];
      [v4 addObject:v8];
    }
  }

  return v4;
}

+ (id)groupByToProto:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(PPSPBGroupingDimensions);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[PPSPBGroupingDimensions addGroupBy:](v4, "addGroupBy:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (void)setMetadataDefaults:(id)a3
{
  id v3 = a3;
  if (![v3 privacyClassification]) {
    [v3 setPrivacyClassification:1];
  }
}

+ (id)setOptionalFields:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 enumMapping];

  if (v5)
  {
    uint64_t v6 = [v3 enumMapping];
    uint64_t v7 = +[PPSMetric enumMappingWithProto:v6];

    [v4 setObject:v7 forKeyedSubscript:@"EnumMapping"];
  }
  uint64_t v8 = [v3 rounding];

  if (v8)
  {
    uint64_t v9 = [v3 rounding];
    uint64_t v10 = +[PPSRounding roundingWithProto:v9];
    [v4 setObject:v10 forKeyedSubscript:@"Rounding"];
  }
  long long v11 = [v3 source];

  if (v11)
  {
    long long v12 = [v3 source];
    long long v13 = +[PPSMetric sourceWithProto:v12];
    [v4 setObject:v13 forKeyedSubscript:@"Source"];
  }
  long long v14 = [v3 groupBy];

  if (v14)
  {
    long long v15 = [v3 groupBy];
    uint64_t v16 = +[PPSMetric groupByWithProto:v15];
    [v4 setObject:v16 forKeyedSubscript:@"GroupingDimensions"];
  }
  long long v17 = [v3 metricType];

  if (v17)
  {
    long long v18 = [v3 metricType];
    long long v19 = +[PPSMetricType metricTypeWithProto:v18];
    [v4 setObject:v19 forKeyedSubscript:@"MetricType"];
  }
  if ([v3 auxiliaryType])
  {
    char v20 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "auxiliaryType"));
    [v4 setObject:v20 forKeyedSubscript:@"AuxiliaryType"];
  }
  if ([v3 filterEntryLogging])
  {
    uint64_t v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "filterEntryLogging"));
    [v4 setObject:v21 forKeyedSubscript:@"FilterEntryLogging"];
  }
  if ([v3 dmaCompliant])
  {
    char v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "dmaCompliant"));
    [v4 setObject:v22 forKeyedSubscript:@"DMACompliant"];
  }
  if ([v3 fixedArraySize])
  {
    v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "fixedArraySize"));
    [v4 setObject:v23 forKeyedSubscript:@"FixedArraySize"];
  }
  return v4;
}

- (PPSMetric)init
{
  return 0;
}

- (id)data
{
  if (self)
  {
    self = [(PPSMetric *)self protoData];
    uint64_t v2 = vars8;
  }
  return self;
}

- (PPSMetric)initWithName:(id)a3 version:(double)a4 datatype:(int)a5 unit:(id)a6 baseMetric:(id)a7 optionalPayload:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (!v17
    || !+[PPSMetric isValidName:v15]
    || !+[PPSMetric isValidDatatype:v11])
  {
    goto LABEL_10;
  }
  BOOL v19 = +[PPSMetric isValidVersion:a4];
  char v20 = 0;
  if (!v16 || !v19) {
    goto LABEL_11;
  }
  if (!+[PPSMetric isValidOptionalPayload:v18])
  {
LABEL_10:
    char v20 = 0;
    goto LABEL_11;
  }
  v32.receiver = self;
  v32.super_class = (Class)PPSMetric;
  uint64_t v21 = [(PPSMetric *)&v32 init];
  char v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_name, a3);
    uint64_t v23 = [v17 subsystem];
    subsystem = v22->_subsystem;
    v22->_subsystem = (NSString *)v23;

    uint64_t v25 = [v17 category];
    category = v22->_category;
    v22->_category = (NSString *)v25;

    v22->_version = a4;
    v22->_datatype = v11;
    objc_storeStrong((id *)&v22->_unit, a6);
    uint64_t v27 = [v17 cadence];
    cadence = v22->_cadence;
    v22->_cadence = (PPSCadence *)v27;

    v22->_directionality = [v17 directionality];
    v22->_storage = [v17 storage];
    v22->_timeToLive = [v17 timeToLive];
    v22->_mode = [v17 mode];
    uint64_t v29 = [v17 source];
    source = v22->_source;
    v22->_source = (NSString *)v29;

    v22->_deviceCapability = [v17 deviceCapability];
    v22->_enabledPopulation = [v17 enabledPopulation];
    v22->_obfuscation = 1;
    v22->_privacyClassification = [v17 privacyClassification];
    [(PPSMetric *)v22 addOptionalFields:v18];
  }
  self = v22;
  char v20 = self;
LABEL_11:

  return v20;
}

- (PPSMetric)initWithName:(id)a3 subsystem:(id)a4 category:(id)a5 version:(double)a6 datatype:(int)a7 unit:(id)a8 cadence:(id)a9 directionality:(int)a10 storage:(int)a11 timeToLive:(unsigned int)a12 mode:(int)a13 deviceCapability:(int)a14 population:(int)a15 obfuscation:(int)a16 privacyClassification:(int)a17 optionalPayload:(id)a18
{
  uint64_t v20 = *(void *)&a7;
  id v25 = a3;
  id v26 = a4;
  id v27 = a5;
  id v40 = a8;
  id v39 = a9;
  id v38 = a18;
  if (!+[PPSMetric isValidName:v25]
    || !+[PPSMetric isValidSubsystem:v26]
    || !+[PPSMetric isValidCategory:v27]
    || !+[PPSMetric isValidDatatype:v20]
    || !+[PPSMetric isValidDirectionality:](PPSMetric, "isValidDirectionality:")
    || !+[PPSMetric isValidStorage:](PPSMetric, "isValidStorage:")
    || !+[PPSMetric isValidMode:](PPSMetric, "isValidMode:")
    || !+[PPSMetric isValidPopulation:](PPSMetric, "isValidPopulation:")
    || !+[PPSMetric isValidDeviceCapability:](PPSMetric, "isValidDeviceCapability:")
    || !+[PPSMetric isValidObfuscation:](PPSMetric, "isValidObfuscation:"))
  {
    v28 = v25;
    goto LABEL_21;
  }
  int v36 = v20;
  v28 = v25;
  if (!+[PPSMetric isValidPrivacyClassification:a17])
  {
LABEL_21:
    uint64_t v29 = v26;
    goto LABEL_22;
  }
  uint64_t v29 = v26;
  if (!+[PPSMetric isValidVersion:a6])
  {
LABEL_22:
    char v30 = v27;
    goto LABEL_23;
  }
  char v30 = v27;
  if (!+[PPSMetric isValidTTL:a12]) {
    goto LABEL_23;
  }
  v31 = 0;
  if (!v40 || !v39) {
    goto LABEL_24;
  }
  if (!+[PPSMetric isValidOptionalPayload:v38])
  {
LABEL_23:
    v31 = 0;
LABEL_24:
    char v34 = self;
    goto LABEL_25;
  }
  v41.receiver = self;
  v41.super_class = (Class)PPSMetric;
  objc_super v32 = [(PPSMetric *)&v41 init];
  v33 = v32;
  if (v32)
  {
    objc_storeStrong((id *)&v32->_name, a3);
    objc_storeStrong((id *)&v33->_subsystem, a4);
    objc_storeStrong((id *)&v33->_category, a5);
    v33->_version = a6;
    v33->_datatype = v36;
    objc_storeStrong((id *)&v33->_unit, a8);
    objc_storeStrong((id *)&v33->_cadence, a9);
    v33->_directionality = a10;
    v33->_storage = a11;
    v33->_timeToLive = a12;
    v33->_mode = a13;
    v33->_deviceCapability = a14;
    v33->_enabledPopulation = a15;
    v33->_obfuscation = a16;
    v33->_privacyClassification = a17;
    [(PPSMetric *)v33 addOptionalFields:v38];
  }
  char v34 = v33;
  v31 = v34;
LABEL_25:

  return v31;
}

- (void)setBuild:(id)a3
{
  id v5 = a3;
  if ([(id)objc_opt_class() isValidBuild:v5]) {
    objc_storeStrong((id *)&self->_build, a3);
  }
}

- (void)addEnumMapping:(id)a3
{
}

- (void)addSource:(id)a3
{
}

- (void)addRounding:(id)a3
{
}

- (void)addGroupingDimensions:(id)a3
{
}

- (void)addMetricType:(id)a3
{
}

- (void)addAuxiliaryType:(id)a3
{
  self->_auxiliaryType = [a3 unsignedLongValue];
}

- (void)addFilterEntryLogging:(id)a3
{
  self->_filterEntryLogging = [a3 BOOLValue];
}

- (void)addDMACompliant:(id)a3
{
  self->_DMACompliant = [a3 BOOLValue];
}

- (void)addFixedArraySize:(id)a3
{
  self->_fixedArraySize = [a3 intValue];
}

- (void)addOptionalFields:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v24 = v4;
    id v5 = [v4 objectForKeyedSubscript:@"EnumMapping"];

    if (v5)
    {
      uint64_t v6 = [v24 objectForKeyedSubscript:@"EnumMapping"];
      [(PPSMetric *)self addEnumMapping:v6];
    }
    uint64_t v7 = [v24 objectForKeyedSubscript:@"Source"];

    if (v7)
    {
      uint64_t v8 = [v24 objectForKeyedSubscript:@"Source"];
      [(PPSMetric *)self addSource:v8];
    }
    uint64_t v9 = [v24 objectForKeyedSubscript:@"Rounding"];

    if (v9)
    {
      uint64_t v10 = [v24 objectForKeyedSubscript:@"Rounding"];
      [(PPSMetric *)self addRounding:v10];
    }
    uint64_t v11 = [v24 objectForKeyedSubscript:@"GroupingDimensions"];

    if (v11)
    {
      long long v12 = [v24 objectForKeyedSubscript:@"GroupingDimensions"];
      [(PPSMetric *)self addGroupingDimensions:v12];
    }
    long long v13 = [v24 objectForKeyedSubscript:@"MetricType"];

    if (v13)
    {
      long long v14 = [v24 objectForKeyedSubscript:@"MetricType"];
      [(PPSMetric *)self addMetricType:v14];
    }
    id v15 = [v24 objectForKeyedSubscript:@"AuxiliaryType"];

    if (v15)
    {
      id v16 = [v24 objectForKeyedSubscript:@"AuxiliaryType"];
      [(PPSMetric *)self addAuxiliaryType:v16];
    }
    id v17 = [v24 objectForKeyedSubscript:@"FilterEntryLogging"];

    if (v17)
    {
      id v18 = [v24 objectForKeyedSubscript:@"FilterEntryLogging"];
      [(PPSMetric *)self addFilterEntryLogging:v18];
    }
    BOOL v19 = [v24 objectForKeyedSubscript:@"DMACompliant"];

    if (v19)
    {
      uint64_t v20 = [v24 objectForKeyedSubscript:@"DMACompliant"];
      [(PPSMetric *)self addDMACompliant:v20];
    }
    uint64_t v21 = [v24 objectForKeyedSubscript:@"FixedArraySize"];

    if (v21)
    {
      char v22 = [v24 objectForKeyedSubscript:@"FixedArraySize"];
      [(PPSMetric *)self addFixedArraySize:v22];
    }
    unsigned int auxiliaryType = self->_auxiliaryType;
    if (auxiliaryType <= 1) {
      unsigned int auxiliaryType = 1;
    }
    self->_unsigned int auxiliaryType = auxiliaryType;
    id v4 = v24;
  }
  else
  {
    self->_unsigned int auxiliaryType = 1;
    self->_filterEntryLogging = 0;
  }
}

+ (BOOL)isValidSubsystem:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    id v5 = objc_msgSend(MEMORY[0x263F089C0], "characterSetWithRange:", 65, 26);
    -[NSObject addCharactersInRange:](v5, "addCharactersInRange:", 97, 26);
    -[NSObject addCharactersInRange:](v5, "addCharactersInRange:", 48, 10);
    [v5 addCharactersInString:@"-_."];
    uint64_t v6 = [v4 stringByTrimmingCharactersInSet:v5];
    char v7 = [v6 isEqualToString:&stru_2706F9CA8];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = PPSMetricLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric isValidSubsystem:]();
      }
    }
  }
  else
  {
    id v5 = PPSMetricLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidSubsystem:]();
    }
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)isValidCategory:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    id v5 = [MEMORY[0x263F089C0] alphanumericCharacterSet];
    [v5 addCharactersInString:@"-_."];
    uint64_t v6 = [v4 stringByTrimmingCharactersInSet:v5];
    char v7 = [v6 isEqualToString:&stru_2706F9CA8];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = PPSMetricLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric isValidCategory:]();
      }
    }
  }
  else
  {
    id v5 = PPSMetricLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidCategory:]();
    }
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)isValidName:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    if ([v4 canBeConvertedToEncoding:1])
    {
      id v5 = [v4 lowercaseString];
      int v6 = [v5 isEqualToString:@"timestamp"];

      if (!v6)
      {
        BOOL v8 = 1;
        goto LABEL_12;
      }
      char v7 = PPSMetricLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric isValidName:]();
      }
    }
    else
    {
      char v7 = PPSMetricLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric isValidName:]();
      }
    }
  }
  else
  {
    char v7 = PPSMetricLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidName:]();
    }
  }

  BOOL v8 = 0;
LABEL_12:

  return v8;
}

+ (BOOL)isValidDatatype:(int)a3
{
  unsigned int v3 = a3 - 1;
  if ((a3 - 1) >= 9)
  {
    id v4 = PPSMetricLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidDatatype:]();
    }
  }
  return v3 < 9;
}

+ (BOOL)isValidDirectionality:(int)a3
{
  unsigned int v3 = a3 - 1;
  if ((a3 - 1) >= 6)
  {
    id v4 = PPSMetricLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidDirectionality:]();
    }
  }
  return v3 < 6;
}

+ (BOOL)isValidStorage:(int)a3
{
  unsigned int v3 = a3 - 1;
  if ((a3 - 1) >= 5)
  {
    id v4 = PPSMetricLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidStorage:]();
    }
  }
  return v3 < 5;
}

+ (BOOL)isValidMode:(int)a3
{
  unsigned int v3 = a3 - 1;
  if ((a3 - 1) >= 7)
  {
    id v4 = PPSMetricLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidMode:]();
    }
  }
  return v3 < 7;
}

+ (BOOL)isValidPopulation:(int)a3
{
  unsigned int v3 = a3 - 1;
  if ((a3 - 1) >= 3)
  {
    id v4 = PPSMetricLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidPopulation:]();
    }
  }
  return v3 < 3;
}

+ (BOOL)isValidTTL:(unsigned int)a3
{
  unsigned int v3 = a3 - 1;
  if (a3 - 1 >= 0xE42)
  {
    id v4 = PPSMetricLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidTTL:]();
    }
  }
  return v3 < 0xE42;
}

+ (BOOL)isValidVersion:(double)a3
{
  id v4 = [NSString stringWithFormat:@"%.2f", *(void *)&a3];
  [v4 doubleValue];
  double v6 = v5;

  if (v6 != a3)
  {
    char v7 = PPSMetricLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidVersion:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  return v6 == a3;
}

+ (BOOL)isValidDeviceCapability:(int)a3
{
  unsigned int v3 = a3 - 1;
  if ((a3 - 1) >= 0x15)
  {
    id v4 = PPSMetricLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidDeviceCapability:]();
    }
  }
  return v3 < 0x15;
}

+ (BOOL)isValidObfuscation:(int)a3
{
  unsigned int v3 = a3 - 1;
  if ((a3 - 1) >= 3)
  {
    id v4 = PPSMetricLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidObfuscation:]();
    }
  }
  return v3 < 3;
}

+ (BOOL)isValidPrivacyClassification:(int)a3
{
  unsigned int v3 = a3 - 1;
  if ((a3 - 1) >= 3)
  {
    id v4 = PPSMetricLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidPrivacyClassification:]();
    }
  }
  return v3 < 3;
}

+ (BOOL)isValidAuxiliaryType:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v5 = PPSMetricLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidAuxiliaryType:]();
    }
    goto LABEL_9;
  }
  if ((unint64_t)([v3 unsignedLongValue] - 1) >= 3)
  {
    double v5 = PPSMetricLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidAuxiliaryType:]();
    }
LABEL_9:

    BOOL v4 = 0;
    goto LABEL_10;
  }
LABEL_4:
  BOOL v4 = 1;
LABEL_10:

  return v4;
}

+ (BOOL)isValidFilterEntryLogging:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    double v5 = PPSMetricLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidFilterEntryLogging:]();
    }

    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

+ (BOOL)isValidDMACompliant:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    double v5 = PPSMetricLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidDMACompliant:]();
    }

    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

+ (BOOL)isValidFixedArraySize:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    double v5 = PPSMetricLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidFixedArraySize:]();
    }

    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

+ (BOOL)isValidOptionalPayload:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (!v3) {
    goto LABEL_11;
  }
  double v5 = [v3 objectForKeyedSubscript:@"EnumMapping"];
  BOOL v6 = +[PPSMetric isValidEnumDeclaration:v5];

  if (v6)
  {
    char v7 = [v4 objectForKeyedSubscript:@"Rounding"];
    BOOL v6 = +[PPSMetric isValidRounding:v7];

    if (v6)
    {
      uint64_t v8 = [v4 objectForKeyedSubscript:@"Source"];
      BOOL v6 = +[PPSMetric isValidSource:v8];

      if (v6)
      {
        uint64_t v9 = [v4 objectForKeyedSubscript:@"GroupingDimensions"];
        BOOL v6 = +[PPSMetric isValidGroupingDimensions:v9];

        if (v6)
        {
          uint64_t v10 = [v4 objectForKeyedSubscript:@"MetricType"];
          BOOL v6 = +[PPSMetric isValidMetricType:v10];

          if (v6)
          {
            uint64_t v11 = [v4 objectForKeyedSubscript:@"AuxiliaryType"];
            BOOL v6 = +[PPSMetric isValidAuxiliaryType:v11];

            if (v6)
            {
              uint64_t v12 = [v4 objectForKeyedSubscript:@"FilterEntryLogging"];
              BOOL v6 = +[PPSMetric isValidFilterEntryLogging:v12];

              if (v6)
              {
                uint64_t v13 = [v4 objectForKeyedSubscript:@"DMACompliant"];
                BOOL v6 = +[PPSMetric isValidDMACompliant:v13];

                if (v6)
                {
                  uint64_t v14 = [v4 objectForKeyedSubscript:@"FixedArraySize"];
                  BOOL v6 = +[PPSMetric isValidFixedArraySize:v14];

                  if (v6) {
LABEL_11:
                  }
                    LOBYTE(v6) = 1;
                }
              }
            }
          }
        }
      }
    }
  }

  return v6;
}

+ (BOOL)isValidEnumDeclaration:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 1;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __36__PPSMetric_isValidEnumDeclaration___block_invoke;
    v6[3] = &unk_265440C60;
    v6[4] = &v7;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];
    LODWORD(v4) = *((unsigned __int8 *)v8 + 24);
    _Block_object_dispose(&v7, 8);
    if (v4) {
LABEL_4:
    }
      LOBYTE(v4) = 1;
  }
  else
  {
    BOOL v4 = PPSMetricLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidEnumDeclaration:]();
    }

    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

void __36__PPSMetric_isValidEnumDeclaration___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = PPSMetricLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke_cold_2();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v10 = PPSMetricLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

+ (BOOL)isValidSource:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    double v5 = PPSMetricLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric(JSON) isValidSourceJSON:]();
    }

    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

+ (BOOL)isValidRounding:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    double v5 = PPSMetricLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidRounding:]();
    }

    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

+ (BOOL)isValidGroupingDimensions:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      BOOL v4 = v3;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v13;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v4);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              char v10 = PPSMetricLog();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
                +[PPSMetric(JSON) isValidGroupingDimensionsJSON:]();
              }

              goto LABEL_18;
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
          BOOL v9 = 1;
          if (v6) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v9 = 1;
      }
    }
    else
    {
      BOOL v4 = PPSMetricLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric isValidGroupingDimensions:]();
      }
LABEL_18:
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

+ (BOOL)isValidMetricType:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = PPSMetricLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidMetricType:]();
    }

    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

+ (BOOL)isValidBuild:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v11 = 0;
    BOOL v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^([0-9]+)([A-Z])([0-9]+)([a-z]?)$" options:1 error:&v11];
    id v5 = v11;
    uint64_t v6 = objc_msgSend(v4, "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    if (v5) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = v6 == 1;
    }
    BOOL v8 = v7;
    if (!v7)
    {
      BOOL v9 = PPSMetricLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric isValidBuild:]();
      }

      BOOL v4 = v5;
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (NSString)build
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (PPSUnit)unit
{
  return (PPSUnit *)objc_getProperty(self, a2, 96, 1);
}

- (PPSCadence)cadence
{
  return (PPSCadence *)objc_getProperty(self, a2, 104, 1);
}

- (int)directionality
{
  return self->_directionality;
}

- (int)deviceCapability
{
  return self->_deviceCapability;
}

- (int)enabledPopulation
{
  return self->_enabledPopulation;
}

- (int)obfuscation
{
  return self->_obfuscation;
}

- (int)privacyClassification
{
  return self->_privacyClassification;
}

- (PPSRounding)rounding
{
  return (PPSRounding *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)source
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSDictionary)enumMapping
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (NSArray)groupBy
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (PPSMetricType)metricType
{
  return (PPSMetricType *)objc_getProperty(self, a2, 144, 1);
}

- (unsigned)fixedArraySize
{
  return self->_fixedArraySize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricType, 0);
  objc_storeStrong((id *)&self->_groupBy, 0);
  objc_storeStrong((id *)&self->_enumMapping, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_rounding, 0);
  objc_storeStrong((id *)&self->_cadence, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_build, 0);
}

+ (id)metricsWithPlist:(id)a3 subsystem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    BOOL v7 = [objc_alloc(NSDictionary) initWithContentsOfURL:v5];
    BOOL v8 = v7;
    if (v7)
    {
      BOOL v9 = [v7 objectForKeyedSubscript:@"metrics"];
      if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        char v10 = [MEMORY[0x263EFF980] array];
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __47__PPSMetric_Plist__metricsWithPlist_subsystem___block_invoke;
        v35[3] = &unk_265440D20;
        id v36 = v6;
        id v11 = v10;
        id v37 = v11;
        [v9 enumerateObjectsUsingBlock:v35];
        long long v12 = v37;
        long long v13 = v11;

        long long v14 = v13;
      }
      else
      {
        long long v13 = PPSStorageLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          +[PPSMetric(Plist) metricsWithPlist:subsystem:]((uint64_t)v9, v13, v22, v23, v24, v25, v26, v27);
        }
        long long v14 = 0;
      }
    }
    else
    {
      BOOL v9 = PPSStorageLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric(Plist) metricsWithPlist:subsystem:]((uint64_t)v5, v9, v28, v29, v30, v31, v32, v33);
      }
      long long v14 = 0;
    }
  }
  else
  {
    BOOL v8 = PPSStorageLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric(Plist) metricsWithPlist:subsystem:](v8, v15, v16, v17, v18, v19, v20, v21);
    }
    long long v14 = 0;
  }

  return v14;
}

void __47__PPSMetric_Plist__metricsWithPlist_subsystem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (!*(void *)(a1 + 32)
    || ([v3 objectForKeyedSubscript:@"subsystem"],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:*(void *)(a1 + 32)],
        v5,
        v6))
  {
    BOOL v7 = +[PPSMetric metricWithJSONObject:v4];
    if (v7)
    {
      [*(id *)(a1 + 40) addObject:v7];
    }
    else
    {
      BOOL v8 = PPSStorageLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __47__PPSMetric_Plist__metricsWithPlist_subsystem___block_invoke_cold_1((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
}

void __39__PPSMetric_JSON__metricsWithJSONData___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_258ED8000, v0, v1, "Could not construct PPSMetric from JSON object: %@", v2);
}

void __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_4(v0);
  OUTLINED_FUNCTION_3(&dword_258ED8000, v2, v3, "Enum Map expects String : String map, found value %@[%@]", v4, v5, v6, v7, v8);
}

void __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6();
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_4(v0);
  OUTLINED_FUNCTION_3(&dword_258ED8000, v2, v3, "Enum Map expects String : String map, found key %@[%@]", v4, v5, v6, v7, v8);
}

+ (void)isValidSubsystem:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_258ED8000, v0, v1, "Null or empty subsystem %@", v2, v3, v4, v5, v6);
}

+ (void)isValidSubsystem:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_258ED8000, v0, v1, "Invalid characters found in subsystem %@", v2, v3, v4, v5, v6);
}

+ (void)isValidCategory:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_258ED8000, v0, v1, "Null or empty metric category %@", v2, v3, v4, v5, v6);
}

+ (void)isValidCategory:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_258ED8000, v0, v1, "Invalid characters found in category %@", v2, v3, v4, v5, v6);
}

+ (void)isValidName:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_258ED8000, v0, v1, "Null or empty metric name %@", v2, v3, v4, v5, v6);
}

+ (void)isValidName:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_258ED8000, v0, v1, "Metric name %@ conflicts with reserved keywords", v2, v3, v4, v5, v6);
}

+ (void)isValidName:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_258ED8000, v0, v1, "Metric name %@ is not a pure ASCII string", v2, v3, v4, v5, v6);
}

+ (void)isValidDatatype:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_258ED8000, v0, v1, "Invalid datatype %d", v2, v3, v4, v5, v6);
}

+ (void)isValidDirectionality:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_258ED8000, v0, v1, "Invalid directionality %d", v2, v3, v4, v5, v6);
}

+ (void)isValidStorage:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_258ED8000, v0, v1, "Invalid storage %d", v2, v3, v4, v5, v6);
}

+ (void)isValidMode:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_258ED8000, v0, v1, "Invalid mode %d", v2, v3, v4, v5, v6);
}

+ (void)isValidPopulation:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_258ED8000, v0, v1, "Invalid enabledPopulation %d", v2, v3, v4, v5, v6);
}

+ (void)isValidTTL:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_258ED8000, v0, v1, "Invalid timeToLive %d", v2, v3, v4, v5, v6);
}

+ (void)isValidVersion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)isValidDeviceCapability:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_258ED8000, v0, v1, "Invalid deviceCapability %d", v2, v3, v4, v5, v6);
}

+ (void)isValidObfuscation:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_258ED8000, v0, v1, "Invalid obfuscation %d", v2, v3, v4, v5, v6);
}

+ (void)isValidPrivacyClassification:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_258ED8000, v0, v1, "Invalid privacy classification %d", v2, v3, v4, v5, v6);
}

+ (void)isValidAuxiliaryType:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_258ED8000, v0, v1, "Invalid auxiliaryType %llu", v2, v3, v4, v5, v6);
}

+ (void)isValidAuxiliaryType:.cold.2()
{
  OUTLINED_FUNCTION_6();
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_4(v0);
  OUTLINED_FUNCTION_3(&dword_258ED8000, v2, v3, "auxiliaryType not a NSNumber type %@[%@]", v4, v5, v6, v7, v8);
}

+ (void)isValidFilterEntryLogging:.cold.1()
{
  OUTLINED_FUNCTION_6();
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_4(v0);
  OUTLINED_FUNCTION_3(&dword_258ED8000, v2, v3, "filterEntryLogging not a NSNumber type %@[%@]", v4, v5, v6, v7, v8);
}

+ (void)isValidDMACompliant:.cold.1()
{
  OUTLINED_FUNCTION_6();
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_4(v0);
  OUTLINED_FUNCTION_3(&dword_258ED8000, v2, v3, "dmaCompliant not a NSNumber type %@[%@]", v4, v5, v6, v7, v8);
}

+ (void)isValidFixedArraySize:.cold.1()
{
  OUTLINED_FUNCTION_6();
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_4(v0);
  OUTLINED_FUNCTION_3(&dword_258ED8000, v2, v3, "fixedArraySize not a NSNumber type %@[%@]", v4, v5, v6, v7, v8);
}

+ (void)isValidEnumDeclaration:.cold.1()
{
  OUTLINED_FUNCTION_6();
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_4(v0);
  OUTLINED_FUNCTION_3(&dword_258ED8000, v2, v3, "Enum Map not a dictionary %@[%@]", v4, v5, v6, v7, v8);
}

+ (void)isValidRounding:.cold.1()
{
  OUTLINED_FUNCTION_6();
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_4(v0);
  OUTLINED_FUNCTION_3(&dword_258ED8000, v2, v3, "Rounding not a PPSRounding type %@[%@]", v4, v5, v6, v7, v8);
}

+ (void)isValidGroupingDimensions:.cold.2()
{
  OUTLINED_FUNCTION_6();
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_4(v0);
  OUTLINED_FUNCTION_3(&dword_258ED8000, v2, v3, "Grouping dimensions not an array %@[%@]", v4, v5, v6, v7, v8);
}

+ (void)isValidMetricType:.cold.1()
{
  OUTLINED_FUNCTION_6();
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_4(v0);
  OUTLINED_FUNCTION_3(&dword_258ED8000, v2, v3, "MetricType not a PPSMetricType type %@[%@]", v4, v5, v6, v7, v8);
}

+ (void)isValidBuild:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_258ED8000, v0, v1, "Invalid build %@", v2, v3, v4, v5, v6);
}

void __47__PPSMetric_Plist__metricsWithPlist_subsystem___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end