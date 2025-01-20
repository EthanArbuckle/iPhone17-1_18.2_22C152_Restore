@interface PPSRequestValidator
+ (BOOL)_isMetricDefinedForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 name:(id)a6;
+ (BOOL)_validateFilepath:(id)a3 error:(id *)a4;
+ (BOOL)_validatePredicateRequiredKey:(id)a3 value:(id)a4 error:(id *)a5;
+ (BOOL)_validatePredicateValue:(id)a3 metricDefinition:(id)a4 error:(id *)a5;
+ (BOOL)_validateRequestType:(int64_t)a3 error:(id *)a4;
+ (id)sharedInstance;
- (BOOL)validateDataRequest:(id)a3 filepath:(id)a4 withError:(id *)a5;
@end

@implementation PPSRequestValidator

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance__sharedValidator;
  return v2;
}

void __37__PPSRequestValidator_sharedInstance__block_invoke()
{
  v5[10] = *MEMORY[0x263EF8340];
  v0 = objc_alloc_init(PPSRequestValidator);
  v1 = (void *)sharedInstance__sharedValidator;
  sharedInstance__sharedValidator = (uint64_t)v0;

  v4[0] = &unk_2707148D8;
  v5[0] = objc_opt_class();
  v4[1] = &unk_2707148F0;
  v5[1] = objc_opt_class();
  v4[2] = &unk_270714908;
  v5[2] = objc_opt_class();
  v4[3] = &unk_270714920;
  v5[3] = objc_opt_class();
  v4[4] = &unk_270714938;
  v5[4] = objc_opt_class();
  v4[5] = &unk_270714950;
  v5[5] = objc_opt_class();
  v4[6] = &unk_270714968;
  v5[6] = objc_opt_class();
  v4[7] = &unk_270714980;
  v5[7] = objc_opt_class();
  v4[8] = &unk_270714998;
  v5[8] = objc_opt_class();
  v4[9] = &unk_2707149B0;
  v5[9] = objc_opt_class();
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:10];
  v3 = (void *)kMetricDataTypeToClass;
  kMetricDataTypeToClass = v2;
}

- (BOOL)validateDataRequest:(id)a3 filepath:(id)a4 withError:(id *)a5
{
  v81[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 subsystem];
  v10 = [v7 category];
  v11 = [v7 valueFilter];
  v12 = +[PPSPredicateUtilities keyPathsAndValuesForPredicate:v11];
  if (!+[PPSEntitlementChecker checkForEntitlement:@"com.apple.PerfPowerServices.data-read"])
  {
    v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v80 = *MEMORY[0x263F08320];
    v81[0] = @"Missing read entitlement";
    v28 = [NSDictionary dictionaryWithObjects:v81 forKeys:&v80 count:1];
    id v14 = [v27 errorWithDomain:@"com.apple.PerfPowerServicesReader.request" code:257 userInfo:v28];

    if (!v14) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  v64 = a5;
  if (!v7)
  {
    v29 = (void *)MEMORY[0x263F087E8];
    v30 = NSDictionary;
    v31 = [NSString stringWithFormat:@"Null request."];
    [v30 dictionaryWithObject:v31 forKey:*MEMORY[0x263F08320]];
    v32 = v12;
    v33 = v11;
    id v34 = v8;
    v35 = v9;
    v37 = v36 = v10;
    id v14 = [v29 errorWithDomain:@"com.apple.PerfPowerServicesReader.request" code:1 userInfo:v37];

    v10 = v36;
    v9 = v35;
    id v8 = v34;
    v11 = v33;
    v12 = v32;

    goto LABEL_15;
  }
  id v77 = 0;
  BOOL v13 = +[PPSRequestValidator _validateFilepath:v8 error:&v77];
  id v14 = v77;
  if (!v13) {
    goto LABEL_15;
  }
  id v76 = v14;
  BOOL v15 = +[PPSRequestValidator _validateRequestType:error:](PPSRequestValidator, "_validateRequestType:error:", [v7 requestType], &v76);
  id v16 = v76;

  if (!v15) {
    goto LABEL_14;
  }
  id v75 = v16;
  BOOL v17 = +[PPSRequestValidator _validatePredicateRequiredKey:@"subsystem" value:v9 error:&v75];
  id v14 = v75;

  if (!v17) {
    goto LABEL_15;
  }
  id v74 = v14;
  BOOL v18 = +[PPSRequestValidator _validatePredicateRequiredKey:@"category" value:v10 error:&v74];
  id v16 = v74;

  if (!v18)
  {
LABEL_14:
    id v14 = v16;
LABEL_15:
    a5 = v64;
    if (!v14) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  v57 = v16;
  if ([v7 requestType] == 2)
  {
    v19 = [v7 metrics];
    v20 = v10;
    unint64_t v21 = [v19 count];

    BOOL v22 = v21 >= 2;
    v10 = v20;
    if (v22)
    {
      v23 = (void *)MEMORY[0x263F087E8];
      v24 = NSDictionary;
      v25 = [NSString stringWithFormat:@"Interval-set requests only support a single metric."];
      v26 = [v24 dictionaryWithObject:v25 forKey:*MEMORY[0x263F08320]];
      v10 = v20;
      id v14 = [v23 errorWithDomain:@"com.apple.PerfPowerServicesReader.request" code:5 userInfo:v26];

      goto LABEL_15;
    }
  }
  v56 = v12;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = [v7 metrics];
  uint64_t v40 = [obj countByEnumeratingWithState:&v70 objects:v79 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v71;
    while (2)
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v71 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = *(void *)(*((void *)&v70 + 1) + 8 * i);
        if (![(id)objc_opt_class() _isMetricDefinedForFilepath:v8 subsystem:v9 category:v10 name:v44])
        {
          v52 = (void *)MEMORY[0x263F087E8];
          v53 = NSDictionary;
          v54 = [NSString stringWithFormat:@"Select metric '%@' is not defined for subsystem='%@', category='%@'", v44, v9, v10];
          v55 = [v53 dictionaryWithObject:v54 forKey:*MEMORY[0x263F08320]];
          id v14 = [v52 errorWithDomain:@"com.apple.PerfPowerServicesReader.request" code:3 userInfo:v55];

          goto LABEL_45;
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v70 objects:v79 count:16];
      if (v41) {
        continue;
      }
      break;
    }
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v61 = v56;
  uint64_t v60 = [v61 countByEnumeratingWithState:&v66 objects:v78 count:16];
  if (v60)
  {
    v58 = v10;
    uint64_t v59 = *(void *)v67;
    id v45 = v57;
    while (2)
    {
      uint64_t v46 = 0;
      v47 = v45;
      do
      {
        if (*(void *)v67 != v59) {
          objc_enumerationMutation(v61);
        }
        uint64_t v48 = *(void *)(*((void *)&v66 + 1) + 8 * v46);
        id obja = (id)MEMORY[0x25A2D4DD0]();
        if (v8) {
          +[PPSOffDeviceIngesterUtilities metricDefinitionForFilepath:v8 subsystem:v9 category:v10 metricName:v48];
        }
        else {
        v49 = +[PPSOnDeviceIngesterUtilities metricDefinitionForSubsystem:v9 category:v10 metricName:v48];
        }
        v50 = [v61 objectForKeyedSubscript:v48];
        id v65 = v47;
        BOOL v51 = +[PPSRequestValidator _validatePredicateValue:v50 metricDefinition:v49 error:&v65];
        id v45 = v65;

        if (!v51)
        {
          v10 = v58;
          goto LABEL_44;
        }
        ++v46;
        v47 = v45;
        v10 = v58;
      }
      while (v60 != v46);
      uint64_t v60 = [v61 countByEnumeratingWithState:&v66 objects:v78 count:16];
      if (v60) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v45 = v57;
  }
LABEL_44:

  id v14 = v45;
LABEL_45:
  a5 = v64;
  v12 = v56;
  if (v14)
  {
LABEL_16:
    v38 = PPSReaderLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
      -[PPSRequestValidator validateDataRequest:filepath:withError:]((uint64_t)v14, v38);
    }

    if (a5) {
      *a5 = v14;
    }
  }
LABEL_20:

  return v14 == 0;
}

+ (BOOL)_isMetricDefinedForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 name:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (([v12 isEqualToString:@"BLD"] & 1) != 0
    || ([v12 isEqualToString:@"timestamp"] & 1) != 0)
  {
    BOOL v13 = 1;
  }
  else
  {
    if (v9) {
      +[PPSOffDeviceIngesterUtilities metricDefinitionForFilepath:v9 subsystem:v10 category:v11 metricName:v12];
    }
    else {
    id v14 = +[PPSOnDeviceIngesterUtilities metricDefinitionForSubsystem:v10 category:v11 metricName:v12];
    }
    BOOL v13 = v14 != 0;
  }
  return v13;
}

+ (BOOL)_validateFilepath:(id)a3 error:(id *)a4
{
  v5 = [a3 path];
  v6 = [v5 stringByExpandingTildeInPath];

  if (v6)
  {
    id v7 = [MEMORY[0x263F08850] defaultManager];
    char v8 = [v7 fileExistsAtPath:v6];

    if (a4 && (v8 & 1) == 0)
    {
      id v9 = (void *)MEMORY[0x263F087E8];
      id v10 = NSDictionary;
      id v11 = [NSString stringWithFormat:@"File doesn't exist: '%@'", v6];
      id v12 = [v10 dictionaryWithObject:v11 forKey:*MEMORY[0x263F08320]];
      *a4 = [v9 errorWithDomain:@"com.apple.PerfPowerServicesReader.request" code:5 userInfo:v12];

      char v8 = 0;
    }
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

+ (BOOL)_validatePredicateRequiredKey:(id)a3 value:(id)a4 error:(id *)a5
{
  if (!a4 && a5)
  {
    id v7 = (void *)MEMORY[0x263F087E8];
    char v8 = NSDictionary;
    id v9 = [NSString stringWithFormat:@"Missing required field in predicate: '%@'.", a3];
    id v10 = [v8 dictionaryWithObject:v9 forKey:*MEMORY[0x263F08320]];
    *a5 = [v7 errorWithDomain:@"com.apple.PerfPowerServicesReader.request" code:3 userInfo:v10];
  }
  return a4 != 0;
}

+ (BOOL)_validatePredicateValue:(id)a3 metricDefinition:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  BOOL v10 = 1;
  if (v7 && v8)
  {
    id v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "datatype"));
    id v12 = (objc_class *)(id)[(id)kMetricDataTypeToClass objectForKey:v11];
    objc_opt_class();
    if (((objc_opt_isKindOfClass() & 1) == 0 || ([v7 isEqualToString:&stru_270709350] & 1) == 0)
      && (objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v13 = PPSReaderLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v26 = [v9 subsystem];
        unint64_t v21 = [v9 category];
        v25 = [v9 name];
        BOOL v22 = (objc_class *)objc_opt_class();
        v23 = NSStringFromClass(v22);
        NSStringFromClass(v12);
        *(_DWORD *)buf = 138413314;
        v28 = v26;
        __int16 v29 = 2112;
        v30 = v21;
        __int16 v31 = 2112;
        v32 = v25;
        __int16 v33 = 2114;
        id v34 = v23;
        v36 = __int16 v35 = 2114;
        v24 = (void *)v36;
        _os_log_debug_impl(&dword_258F16000, v13, OS_LOG_TYPE_DEBUG, "Validation: Type mismatch for metric '%@::%@::%@' -- %{public}@ != %{public}@ (expected)", buf, 0x34u);
      }
      if (a5)
      {
        id v14 = (void *)MEMORY[0x263F087E8];
        BOOL v15 = NSDictionary;
        id v16 = NSString;
        BOOL v17 = [v9 name];
        BOOL v18 = [v16 stringWithFormat:@"Mismatch between value type of '%@' in predicate and its metric definition.", v17];
        v19 = [v15 dictionaryWithObject:v18 forKey:*MEMORY[0x263F08320]];
        *a5 = [v14 errorWithDomain:@"com.apple.PerfPowerServicesReader.request" code:3 userInfo:v19];
      }
      BOOL v10 = 0;
    }
  }
  return v10;
}

+ (BOOL)_validateRequestType:(int64_t)a3 error:(id *)a4
{
  if ((unint64_t)a3 >= 3 && a4)
  {
    v6 = (void *)MEMORY[0x263F087E8];
    id v7 = NSDictionary;
    id v8 = [NSString stringWithFormat:@"Invalid request type."];
    id v9 = [v7 dictionaryWithObject:v8 forKey:*MEMORY[0x263F08320]];
    *a4 = [v6 errorWithDomain:@"com.apple.PerfPowerServicesReader.request" code:2 userInfo:v9];
  }
  return (unint64_t)a3 < 3;
}

- (void)validateDataRequest:(uint64_t)a1 filepath:(NSObject *)a2 withError:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_258F16000, a2, OS_LOG_TYPE_DEBUG, "Request validation error: %@", (uint8_t *)&v2, 0xCu);
}

@end