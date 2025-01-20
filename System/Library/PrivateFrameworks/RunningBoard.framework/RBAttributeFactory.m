@interface RBAttributeFactory
+ (id)_GPUAccessGrantWithProperties:(void *)a3 errors:;
+ (id)_RBSBaseMemoryGrant:(void *)a3 errors:;
+ (id)_acquisitionCompletionAttributeWithProperties:(void *)a3 errors:;
+ (id)_appNapTimerThrottleAttributeWithProperties:(void *)a3 errors:;
+ (id)_attributeClassesByName;
+ (id)_conditionAttributeWithProperties:(void *)a3 errors:;
+ (id)_cpuAccessGrantWithProperties:(void *)a3 errors:;
+ (id)_cpuMaximumUsageLimitationWithProperties:(void *)a3 errors:;
+ (id)_cpuMinimumUsageGrantWithProperties:(void *)a3 errors:;
+ (id)_domainAttributeWithProperties:(void *)a3 errors:;
+ (id)_durationAttributeWithProperties:(void *)a3 errors:;
+ (id)_endowmentGrantWithProperties:(void *)a3 errors:;
+ (id)_invalidateUnderConditionAttributeWithProperties:(void *)a3 errors:;
+ (id)_jetsamPriorityGrantWithProperties:(void *)a3 errors:;
+ (id)_legalPropertyNamesAndValuesByClassName;
+ (id)_resistTerminationGrantWithProperties:(void *)a3 errors:;
+ (id)_runningReasonAttributeWithProperties:(void *)a3 errors:;
+ (id)_savedEndowmentGrantWithProperties:(void *)a3 errors:;
+ (id)_suspendableCPUGrantWithProperties:(void *)a3 errors:;
+ (id)_tagAttributeWithProperties:(void *)a3 errors:;
+ (id)attributeForClass:(id)a3 andProperties:(id)a4 errors:(id)a5;
@end

@implementation RBAttributeFactory

+ (id)attributeForClass:(id)a3 andProperties:(id)a4 errors:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[RBAttributeFactory _attributeClassesByName]();
  uint64_t v12 = [v11 objectForKeyedSubscript:v8];

  if (!v12)
  {
    v14 = rbs_assertion_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory attributeForClass:andProperties:errors:]();
    }

    goto LABEL_41;
  }
  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _acquisitionCompletionAttributeWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x263F64450];
LABEL_44:
    uint64_t v16 = [v17 grant];
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _cpuAccessGrantWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _suspendableCPUGrantWithProperties:errors:]((uint64_t)a1, v9, v10);
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    self;
    goto LABEL_41;
  }
  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _cpuMinimumUsageGrantWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x263F64478];
    goto LABEL_44;
  }
  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _domainAttributeWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _durationAttributeWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _GPUAccessGrantWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _jetsamPriorityGrantWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _RBSBaseMemoryGrant:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x263F64470];
    goto LABEL_44;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x263F644E8];
    goto LABEL_44;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x263F64520];
    goto LABEL_44;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x263F64528];
    goto LABEL_44;
  }
  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _resistTerminationGrantWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _runningReasonAttributeWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _tagAttributeWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x263F643D0];
    goto LABEL_44;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x263F643D8];
    goto LABEL_44;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x263F643E0];
    goto LABEL_44;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x263F643E8];
    goto LABEL_44;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x263F643F0];
    goto LABEL_44;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x263F643F8];
    goto LABEL_44;
  }
  if (v12 != objc_opt_class())
  {
    if (v12 == objc_opt_class())
    {
      v13 = (void *)MEMORY[0x263F64510];
      goto LABEL_76;
    }
    if (v12 == objc_opt_class())
    {
      v13 = (void *)MEMORY[0x263F64498];
      goto LABEL_76;
    }
    if (v12 == objc_opt_class())
    {
      uint64_t v16 = +[RBAttributeFactory _endowmentGrantWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
      goto LABEL_56;
    }
    if (v12 == objc_opt_class())
    {
      uint64_t v16 = +[RBAttributeFactory _savedEndowmentGrantWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
      goto LABEL_56;
    }
    if (v12 == objc_opt_class())
    {
      v13 = (void *)MEMORY[0x263F64618];
      goto LABEL_76;
    }
    if (v12 == objc_opt_class())
    {
      uint64_t v16 = +[RBAttributeFactory _conditionAttributeWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
      goto LABEL_56;
    }
    if (v12 == objc_opt_class())
    {
      uint64_t v16 = +[RBAttributeFactory _invalidateUnderConditionAttributeWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
      goto LABEL_56;
    }
    if (v12 == objc_opt_class())
    {
      v13 = (void *)MEMORY[0x263F64518];
LABEL_76:
      uint64_t v16 = [v13 attribute];
      goto LABEL_56;
    }
LABEL_41:
    v15 = 0;
    goto LABEL_57;
  }
  uint64_t v16 = +[RBAttributeFactory _appNapTimerThrottleAttributeWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
LABEL_56:
  v15 = (void *)v16;
LABEL_57:

  return v15;
}

+ (id)_attributeClassesByName
{
  self;
  if (_attributeClassesByName_onceToken != -1) {
    dispatch_once(&_attributeClassesByName_onceToken, &__block_literal_global_339);
  }
  v0 = (void *)_attributeClassesByName_availableClasses;
  return v0;
}

+ (id)_acquisitionCompletionAttributeWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  self;
  v6 = +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  id v9 = [v6 objectForKeyedSubscript:v8];

  uint64_t v10 = objc_opt_class();
  v11 = safeGetProperty(v5, @"CompletionPolicy", v10, v4);

  if (v11)
  {
    uint64_t v12 = [v9 objectForKeyedSubscript:v11];
    v13 = v12;
    if (v12)
    {
      uint64_t v14 = [v12 unsignedIntegerValue];
      v15 = [MEMORY[0x263F643C8] attributeWithCompletionPolicy:v14];
      goto LABEL_10;
    }
    uint64_t v16 = rbs_assertion_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _acquisitionCompletionAttributeWithProperties:errors:]();
    }
  }
  else
  {
    v13 = rbs_assertion_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _acquisitionCompletionAttributeWithProperties:errors:]();
    }
  }
  v15 = 0;
LABEL_10:

  return v15;
}

+ (id)_cpuAccessGrantWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  self;
  v6 = +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  id v9 = [v6 objectForKeyedSubscript:v8];

  uint64_t v10 = objc_opt_class();
  v11 = safeGetProperty(v5, @"Role", v10, v4);

  if (v11)
  {
    uint64_t v12 = [v9 objectForKeyedSubscript:v11];
    v13 = v12;
    if (v12)
    {
      unsigned __int8 v14 = [v12 unsignedIntegerValue];
      v15 = [MEMORY[0x263F64438] grantWithRole:v14];
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)_suspendableCPUGrantWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  self;
  v6 = +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  id v9 = [v6 objectForKeyedSubscript:v8];

  uint64_t v10 = objc_opt_class();
  v11 = safeGetProperty(v5, @"Role", v10, v4);

  if (v11)
  {
    uint64_t v12 = [v9 objectForKeyedSubscript:v11];
    v13 = v12;
    if (v12)
    {
      unsigned __int8 v14 = [v12 unsignedIntegerValue];
      v15 = [MEMORY[0x263F64620] grantWithRole:v14];
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)_cpuMaximumUsageLimitationWithProperties:(void *)a3 errors:
{
  id v4 = a2;
  id v5 = a3;
  self;
  v6 = +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  id v9 = [v6 objectForKeyedSubscript:v8];

  uint64_t v10 = objc_opt_class();
  v11 = safeGetProperty(v4, @"ViolationPolicy", v10, v5);
  if (v11)
  {
    uint64_t v12 = [v9 objectForKeyedSubscript:v11];
    if (!v12)
    {
      unsigned __int8 v14 = rbs_assertion_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:]();
      }
      v25 = 0;
      goto LABEL_35;
    }
    uint64_t v13 = objc_opt_class();
    unsigned __int8 v14 = safeGetProperty(v4, @"Role", v13, v5);
    if (!v14)
    {
      v15 = rbs_assertion_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:]();
      }
      v25 = 0;
      goto LABEL_34;
    }
    v15 = [v9 objectForKeyedSubscript:v14];
    if (!v15)
    {
      v18 = rbs_assertion_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:].cold.4();
      }
      v25 = 0;
      goto LABEL_33;
    }
    uint64_t v16 = objc_opt_class();
    v17 = safeGetProperty(v4, @"Percentage", v16, v5);
    v18 = v17;
    if (v17)
    {
      uint64_t v29 = [v17 unsignedIntegerValue];
      if ((unint64_t)(v29 - 1) > 0x63)
      {
        v21 = rbs_assertion_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:].cold.8();
        }
      }
      else
      {
        uint64_t v19 = objc_opt_class();
        v20 = safeGetProperty(v4, @"Duration", v19, v5);
        v21 = v20;
        if (v20)
        {
          [v20 doubleValue];
          if (v22 > 0.0)
          {
            double v23 = v22;
            uint64_t v28 = [v12 unsignedIntegerValue];
            unsigned __int8 v24 = [v15 unsignedIntegerValue];
            v25 = [MEMORY[0x263F64440] limitationForRole:v24 withPercentage:v29 duration:v28 violationPolicy:v23];
LABEL_32:

LABEL_33:
LABEL_34:

LABEL_35:
            goto LABEL_36;
          }
          v26 = rbs_assertion_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:].cold.7();
          }
        }
        else
        {
          v26 = rbs_assertion_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:].cold.6();
          }
        }
      }
    }
    else
    {
      v21 = rbs_assertion_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:].cold.5();
      }
    }
    v25 = 0;
    goto LABEL_32;
  }
  uint64_t v12 = rbs_assertion_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:]();
  }
  v25 = 0;
LABEL_36:

  return v25;
}

+ (id)_cpuMinimumUsageGrantWithProperties:(void *)a3 errors:
{
  id v4 = a2;
  id v5 = a3;
  self;
  v6 = +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  id v9 = [v6 objectForKeyedSubscript:v8];

  uint64_t v10 = objc_opt_class();
  v11 = safeGetProperty(v4, @"Role", v10, v5);
  if (v11)
  {
    uint64_t v12 = [v9 objectForKeyedSubscript:v11];
    if (!v12)
    {
      v15 = rbs_assertion_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[RBAttributeFactory _cpuMinimumUsageGrantWithProperties:errors:]();
      }
      double v23 = 0;
      goto LABEL_25;
    }
    uint64_t v13 = objc_opt_class();
    unsigned __int8 v14 = safeGetProperty(v4, @"Percentage", v13, v5);
    v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v14 unsignedIntegerValue];
      if ((unint64_t)(v16 - 1) > 0x63)
      {
        uint64_t v19 = rbs_assertion_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          +[RBAttributeFactory _cpuMinimumUsageGrantWithProperties:errors:].cold.6();
        }
      }
      else
      {
        uint64_t v17 = objc_opt_class();
        v18 = safeGetProperty(v4, @"Duration", v17, v5);
        uint64_t v19 = v18;
        if (v18)
        {
          [v18 doubleValue];
          if (v20 > 0.0)
          {
            double v21 = v20;
            unsigned __int8 v22 = [v12 unsignedIntegerValue];
            double v23 = [MEMORY[0x263F64448] grantForRole:v22 withPercentage:v16 duration:v21];
LABEL_24:

LABEL_25:
            goto LABEL_26;
          }
          unsigned __int8 v24 = rbs_assertion_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            +[RBAttributeFactory _cpuMinimumUsageGrantWithProperties:errors:].cold.5();
          }
        }
        else
        {
          unsigned __int8 v24 = rbs_assertion_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            +[RBAttributeFactory _cpuMinimumUsageGrantWithProperties:errors:].cold.4();
          }
        }
      }
    }
    else
    {
      uint64_t v19 = rbs_assertion_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        +[RBAttributeFactory _cpuMinimumUsageGrantWithProperties:errors:]();
      }
    }
    double v23 = 0;
    goto LABEL_24;
  }
  uint64_t v12 = rbs_assertion_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    +[RBAttributeFactory _cpuMinimumUsageGrantWithProperties:errors:]();
  }
  double v23 = 0;
LABEL_26:

  return v23;
}

+ (id)_domainAttributeWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = objc_opt_class();
  v7 = safeGetProperty(v5, @"Domain", v6, v4);
  uint64_t v8 = objc_opt_class();
  id v9 = safeGetProperty(v5, @"Name", v8, v4);

  if (v7) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    v11 = rbs_assertion_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _domainAttributeWithProperties:errors:]();
    }

    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F64480] attributeWithDomain:v7 name:v9];
  }

  return v12;
}

+ (id)_durationAttributeWithProperties:(void *)a3 errors:
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  id v9 = [v6 objectForKeyedSubscript:v8];

  uint64_t v10 = objc_opt_class();
  v11 = safeGetProperty(v5, @"InvalidationDuration", v10, v4);
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = safeGetProperty(v5, @"WarningDuration", v12, v4);
  uint64_t v14 = objc_opt_class();
  v15 = safeGetProperty(v5, @"StartPolicy", v14, v4);
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = safeGetProperty(v5, @"EndPolicy", v16, v4);

  if (v11 && v15 && v17)
  {
    v18 = [v9 objectForKeyedSubscript:v15];
    uint64_t v19 = [v9 objectForKeyedSubscript:v17];
    double v20 = (void *)v19;
    if (v18 && v19)
    {
      uint64_t v21 = [v18 unsignedIntegerValue];
      uint64_t v22 = [v20 unsignedIntegerValue];
      [v11 doubleValue];
      double v24 = v23;
      [v13 doubleValue];
      v26 = [MEMORY[0x263F64488] attributeWithDuration:v21 warningDuration:v22 startPolicy:v24 endPolicy:v25];
LABEL_20:

      goto LABEL_21;
    }
    if (v18)
    {
      if (v19)
      {
LABEL_19:
        v26 = 0;
        goto LABEL_20;
      }
    }
    else
    {
      v27 = rbs_assertion_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        +[RBAttributeFactory _durationAttributeWithProperties:errors:]();
      }

      if (v20) {
        goto LABEL_19;
      }
    }
    uint64_t v28 = rbs_assertion_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _durationAttributeWithProperties:errors:]();
    }

    goto LABEL_19;
  }
  v18 = rbs_assertion_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    int v30 = 138544130;
    v31 = v11;
    __int16 v32 = 2114;
    v33 = v13;
    __int16 v34 = 2114;
    v35 = v15;
    __int16 v36 = 2114;
    v37 = v17;
    _os_log_error_impl(&dword_226AB3000, v18, OS_LOG_TYPE_ERROR, "Detected misconfigured duration attribute: invalidationDuration %{public}@; warningDuration %{public}@; startPolic"
      "y %{public}@; endPolicy %{public}@",
      (uint8_t *)&v30,
      0x2Au);
  }
  v26 = 0;
LABEL_21:

  return v26;
}

+ (id)_GPUAccessGrantWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  id v9 = [v6 objectForKeyedSubscript:v8];

  uint64_t v10 = objc_opt_class();
  v11 = safeGetProperty(v5, @"Role", v10, v4);

  if (!v11)
  {
    uint64_t v14 = [MEMORY[0x263F644A0] grant];
    goto LABEL_5;
  }
  uint64_t v12 = [v9 objectForKeyedSubscript:v11];
  unsigned __int8 v13 = [v12 unsignedIntValue];

  if (v13)
  {
    uint64_t v14 = [MEMORY[0x263F644A0] grantWithRole:v13];
LABEL_5:
    v15 = (void *)v14;
    goto LABEL_9;
  }
  uint64_t v16 = rbs_assertion_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    +[RBAttributeFactory _GPUAccessGrantWithProperties:errors:]();
  }

  v15 = 0;
LABEL_9:

  return v15;
}

+ (id)_jetsamPriorityGrantWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = objc_opt_class();
  v7 = safeGetProperty(v5, @"Band", v6, v4);

  if (v7)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x263F644D8], "grantWithBand:", objc_msgSend(v7, "unsignedIntValue"));
  }
  else
  {
    id v9 = rbs_assertion_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _jetsamPriorityGrantWithProperties:errors:]();
    }

    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)_RBSBaseMemoryGrant:(void *)a3 errors:
{
  id v4 = a2;
  id v5 = a3;
  self;
  uint64_t v6 = +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  id v9 = [v6 objectForKeyedSubscript:v8];

  uint64_t v10 = objc_opt_class();
  v11 = safeGetProperty(v4, @"Category", v10, v5);
  if (v11)
  {
    uint64_t v12 = objc_opt_class();
    unsigned __int8 v13 = safeGetProperty(v4, @"Strength", v12, v5);
    if (v13)
    {
      uint64_t v14 = [v9 objectForKeyedSubscript:v13];
      v15 = v14;
      if (v14)
      {
        uint64_t v16 = objc_msgSend(MEMORY[0x263F64430], "grantWithCategory:strength:", v11, -[NSObject charValue](v14, "charValue"));
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v17 = rbs_assertion_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[RBAttributeFactory _RBSBaseMemoryGrant:errors:]();
      }
    }
    else
    {
      v15 = rbs_assertion_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[RBAttributeFactory _RBSBaseMemoryGrant:errors:]();
      }
    }
    uint64_t v16 = 0;
    goto LABEL_14;
  }
  unsigned __int8 v13 = rbs_assertion_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    +[RBAttributeFactory _RBSBaseMemoryGrant:errors:]();
  }
  uint64_t v16 = 0;
LABEL_15:

  return v16;
}

+ (id)_resistTerminationGrantWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  id v9 = [v6 objectForKeyedSubscript:v8];

  uint64_t v10 = objc_opt_class();
  v11 = safeGetProperty(v5, @"Resistance", v10, v4);

  if (v11)
  {
    uint64_t v12 = [v9 objectForKeyedSubscript:v11];
    unsigned __int8 v13 = v12;
    if (v12)
    {
      uint64_t v14 = objc_msgSend(MEMORY[0x263F645F8], "grantWithResistance:", objc_msgSend(v12, "integerValue"));
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

+ (id)_runningReasonAttributeWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = objc_opt_class();
  v7 = safeGetProperty(v5, @"RunningReason", v6, v4);

  if (v7)
  {
    uint64_t v8 = [v7 longValue];
    if (v8 >= 1)
    {
      id v9 = [MEMORY[0x263F64600] withReason:v8];
      goto LABEL_9;
    }
    uint64_t v10 = rbs_assertion_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _runningReasonAttributeWithProperties:errors:]();
    }
  }
  else
  {
    uint64_t v10 = rbs_assertion_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _runningReasonAttributeWithProperties:errors:]();
    }
  }

  id v9 = 0;
LABEL_9:

  return v9;
}

+ (id)_tagAttributeWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = objc_opt_class();
  v7 = safeGetProperty(v5, @"Tag", v6, v4);

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F64628] attributeWithTag:v7];
  }
  else
  {
    id v9 = rbs_assertion_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _tagAttributeWithProperties:errors:]();
    }

    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)_appNapTimerThrottleAttributeWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  id v9 = [v6 objectForKeyedSubscript:v8];

  uint64_t v10 = objc_opt_class();
  v11 = safeGetProperty(v5, @"Tier", v10, v4);

  if (!v11
    || ([v9 objectForKeyedSubscript:v11], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0)
    || (unsigned __int8 v13 = v12,
        objc_msgSend(MEMORY[0x263F64400], "grantWithTier:", objc_msgSend(v12, "unsignedCharValue")),
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        v13,
        !v14))
  {
    v15 = rbs_assertion_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _appNapTimerThrottleAttributeWithProperties:errors:]();
    }

    uint64_t v14 = 0;
  }

  return v14;
}

+ (id)_endowmentGrantWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  id v9 = [v6 objectForKeyedSubscript:v8];

  uint64_t v10 = objc_opt_class();
  v11 = safeGetProperty(v5, @"Namespace", v10, v4);

  if (!v11
    || ([v9 objectForKeyedSubscript:v11], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0)
    || (unsigned __int8 v13 = (void *)v12,
        [MEMORY[0x263F64490] grantWithNamespace:v12 endowment:0],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        v13,
        !v14))
  {
    v15 = rbs_assertion_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _endowmentGrantWithProperties:errors:]();
    }

    uint64_t v14 = 0;
  }

  return v14;
}

+ (id)_savedEndowmentGrantWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = objc_opt_class();
  v7 = safeGetProperty(v5, @"Namespace", v6, v4);
  uint64_t v8 = objc_opt_class();
  id v9 = safeGetProperty(v5, @"Key", v8, v4);

  if (v7) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10
    || ([MEMORY[0x263F64610] grantWithNamespace:v7 key:v9],
        (v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v12 = rbs_assertion_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _savedEndowmentGrantWithProperties:errors:]();
    }

    v11 = 0;
  }

  return v11;
}

+ (id)_conditionAttributeWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = objc_opt_class();
  v7 = safeGetProperty(v5, @"Condition", v6, v4);
  uint64_t v8 = objc_opt_class();
  id v9 = safeGetProperty(v5, @"Value", v8, v4);

  if (v7) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10
    || (objc_msgSend(MEMORY[0x263F64460], "attributeWithCondition:value:", v7, objc_msgSend(v9, "integerValue")),
        (v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v12 = rbs_assertion_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _conditionAttributeWithProperties:errors:]();
    }

    v11 = 0;
  }

  return v11;
}

+ (id)_invalidateUnderConditionAttributeWithProperties:(void *)a3 errors:
{
  id v4 = a2;
  id v5 = a3;
  self;
  if (_os_feature_enabled_impl())
  {
    uint64_t v6 = objc_opt_class();
    v7 = safeGetProperty(v4, @"Condition", v6, v5);
    uint64_t v8 = v7;
    if (v7 && ([v7 isEqualToString:@"therm"] & 1) != 0)
    {
      id v9 = 0;
    }
    else
    {
      uint64_t v10 = objc_opt_class();
      v11 = safeGetProperty(v4, @"MinValue", v10, v5);
      uint64_t v12 = v11;
      if (!v8
        || !v11
        || (objc_msgSend(MEMORY[0x263F644D0], "attributeWithCondition:minValue:", v8, objc_msgSend(v11, "integerValue")),
            (unsigned __int8 v13 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        uint64_t v14 = rbs_assertion_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          +[RBAttributeFactory _invalidateUnderConditionAttributeWithProperties:errors:]();
        }

        unsigned __int8 v13 = 0;
      }
      id v9 = v13;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)_legalPropertyNamesAndValuesByClassName
{
  self;
  if (_legalPropertyNamesAndValuesByClassName_onceToken != -1) {
    dispatch_once(&_legalPropertyNamesAndValuesByClassName_onceToken, &__block_literal_global_16);
  }
  v0 = (void *)_legalPropertyNamesAndValuesByClassName_legalValues;
  return v0;
}

void __61__RBAttributeFactory__legalPropertyNamesAndValuesByClassName__block_invoke()
{
  v7[12] = *MEMORY[0x263EF8340];
  v6[0] = @"RBSAcquisitionCompletionAttribute";
  v6[1] = @"RBSCPUAccessGrant";
  v7[0] = &unk_26DAB1390;
  v7[1] = &unk_26DAB13B8;
  v6[2] = @"RBSSuspendableCPUGrant";
  v6[3] = @"RBSCoalitionLevelGrant";
  v7[2] = &unk_26DAB13E0;
  v7[3] = &unk_26DAB1408;
  v6[4] = @"RBSCPUMaximumUsageLimitation";
  v6[5] = @"RBSBaseMemoryGrant";
  v7[4] = &unk_26DAB1430;
  v7[5] = &unk_26DAB1458;
  v6[6] = @"RBSCPUMinimumUsageGrant";
  v6[7] = @"RBSResistTerminationGrant";
  v7[6] = &unk_26DAB1480;
  v7[7] = &unk_26DAB14A8;
  v6[8] = @"RBSDurationAttribute";
  v6[9] = @"RBSAppNapPreventTimerThrottleGrant";
  v7[8] = &unk_26DAB14D0;
  v7[9] = &unk_26DAB14F8;
  v6[10] = @"RBSEndowmentGrant";
  v4[0] = @"RBSVisibilityNamespace";
  v4[1] = @"RBSUserfacingNamespace";
  uint64_t v0 = *MEMORY[0x263F646E8];
  v5[0] = *MEMORY[0x263F646F0];
  v5[1] = v0;
  v1 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  v6[11] = @"RBSGPUAccessGrant";
  v7[10] = v1;
  v7[11] = &unk_26DAB1520;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:12];
  v3 = (void *)_legalPropertyNamesAndValuesByClassName_legalValues;
  _legalPropertyNamesAndValuesByClassName_legalValues = v2;
}

void __45__RBAttributeFactory__attributeClassesByName__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF9A0] dictionary];
  v1 = (void *)_attributeClassesByName_availableClasses;
  _attributeClassesByName_availableClasses = v0;

  uint64_t v2 = objc_opt_class();
  v3 = (void *)_attributeClassesByName_availableClasses;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 setObject:v2 forKeyedSubscript:v5];

  uint64_t v6 = objc_opt_class();
  v7 = (void *)_attributeClassesByName_availableClasses;
  uint64_t v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  [v7 setObject:v6 forKeyedSubscript:v9];

  uint64_t v10 = objc_opt_class();
  v11 = (void *)_attributeClassesByName_availableClasses;
  uint64_t v12 = (objc_class *)objc_opt_class();
  unsigned __int8 v13 = NSStringFromClass(v12);
  [v11 setObject:v10 forKeyedSubscript:v13];

  uint64_t v14 = objc_opt_class();
  v15 = (void *)_attributeClassesByName_availableClasses;
  uint64_t v16 = (objc_class *)objc_opt_class();
  uint64_t v17 = NSStringFromClass(v16);
  [v15 setObject:v14 forKeyedSubscript:v17];

  uint64_t v18 = objc_opt_class();
  uint64_t v19 = (void *)_attributeClassesByName_availableClasses;
  double v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  [v19 setObject:v18 forKeyedSubscript:v21];

  uint64_t v22 = objc_opt_class();
  double v23 = (void *)_attributeClassesByName_availableClasses;
  double v24 = (objc_class *)objc_opt_class();
  double v25 = NSStringFromClass(v24);
  [v23 setObject:v22 forKeyedSubscript:v25];

  uint64_t v26 = objc_opt_class();
  v27 = (void *)_attributeClassesByName_availableClasses;
  uint64_t v28 = (objc_class *)objc_opt_class();
  uint64_t v29 = NSStringFromClass(v28);
  [v27 setObject:v26 forKeyedSubscript:v29];

  uint64_t v30 = objc_opt_class();
  v31 = (void *)_attributeClassesByName_availableClasses;
  __int16 v32 = (objc_class *)objc_opt_class();
  v33 = NSStringFromClass(v32);
  [v31 setObject:v30 forKeyedSubscript:v33];

  uint64_t v34 = objc_opt_class();
  v35 = (void *)_attributeClassesByName_availableClasses;
  __int16 v36 = (objc_class *)objc_opt_class();
  v37 = NSStringFromClass(v36);
  [v35 setObject:v34 forKeyedSubscript:v37];

  uint64_t v38 = objc_opt_class();
  v39 = (void *)_attributeClassesByName_availableClasses;
  v40 = (objc_class *)objc_opt_class();
  v41 = NSStringFromClass(v40);
  [v39 setObject:v38 forKeyedSubscript:v41];

  uint64_t v42 = objc_opt_class();
  v43 = (void *)_attributeClassesByName_availableClasses;
  v44 = (objc_class *)objc_opt_class();
  v45 = NSStringFromClass(v44);
  [v43 setObject:v42 forKeyedSubscript:v45];

  uint64_t v46 = objc_opt_class();
  v47 = (void *)_attributeClassesByName_availableClasses;
  v48 = (objc_class *)objc_opt_class();
  v49 = NSStringFromClass(v48);
  [v47 setObject:v46 forKeyedSubscript:v49];

  uint64_t v50 = objc_opt_class();
  v51 = (void *)_attributeClassesByName_availableClasses;
  v52 = (objc_class *)objc_opt_class();
  v53 = NSStringFromClass(v52);
  [v51 setObject:v50 forKeyedSubscript:v53];

  uint64_t v54 = objc_opt_class();
  v55 = (void *)_attributeClassesByName_availableClasses;
  v56 = (objc_class *)objc_opt_class();
  v57 = NSStringFromClass(v56);
  [v55 setObject:v54 forKeyedSubscript:v57];

  uint64_t v58 = objc_opt_class();
  v59 = (void *)_attributeClassesByName_availableClasses;
  v60 = (objc_class *)objc_opt_class();
  v61 = NSStringFromClass(v60);
  [v59 setObject:v58 forKeyedSubscript:v61];

  uint64_t v62 = objc_opt_class();
  v63 = (void *)_attributeClassesByName_availableClasses;
  v64 = (objc_class *)objc_opt_class();
  v65 = NSStringFromClass(v64);
  [v63 setObject:v62 forKeyedSubscript:v65];

  uint64_t v66 = objc_opt_class();
  v67 = (void *)_attributeClassesByName_availableClasses;
  v68 = (objc_class *)objc_opt_class();
  v69 = NSStringFromClass(v68);
  [v67 setObject:v66 forKeyedSubscript:v69];

  uint64_t v70 = objc_opt_class();
  v71 = (void *)_attributeClassesByName_availableClasses;
  v72 = (objc_class *)objc_opt_class();
  v73 = NSStringFromClass(v72);
  [v71 setObject:v70 forKeyedSubscript:v73];

  uint64_t v74 = objc_opt_class();
  v75 = (void *)_attributeClassesByName_availableClasses;
  v76 = (objc_class *)objc_opt_class();
  v77 = NSStringFromClass(v76);
  [v75 setObject:v74 forKeyedSubscript:v77];

  uint64_t v78 = objc_opt_class();
  v79 = (void *)_attributeClassesByName_availableClasses;
  v80 = (objc_class *)objc_opt_class();
  v81 = NSStringFromClass(v80);
  [v79 setObject:v78 forKeyedSubscript:v81];

  uint64_t v82 = objc_opt_class();
  v83 = (void *)_attributeClassesByName_availableClasses;
  v84 = (objc_class *)objc_opt_class();
  v85 = NSStringFromClass(v84);
  [v83 setObject:v82 forKeyedSubscript:v85];

  uint64_t v86 = objc_opt_class();
  v87 = (void *)_attributeClassesByName_availableClasses;
  v88 = (objc_class *)objc_opt_class();
  v89 = NSStringFromClass(v88);
  [v87 setObject:v86 forKeyedSubscript:v89];

  uint64_t v90 = objc_opt_class();
  v91 = (void *)_attributeClassesByName_availableClasses;
  v92 = (objc_class *)objc_opt_class();
  v93 = NSStringFromClass(v92);
  [v91 setObject:v90 forKeyedSubscript:v93];

  uint64_t v94 = objc_opt_class();
  v95 = (void *)_attributeClassesByName_availableClasses;
  v96 = (objc_class *)objc_opt_class();
  v97 = NSStringFromClass(v96);
  [v95 setObject:v94 forKeyedSubscript:v97];

  uint64_t v98 = objc_opt_class();
  v99 = (void *)_attributeClassesByName_availableClasses;
  v100 = (objc_class *)objc_opt_class();
  v101 = NSStringFromClass(v100);
  [v99 setObject:v98 forKeyedSubscript:v101];

  uint64_t v102 = objc_opt_class();
  v103 = (void *)_attributeClassesByName_availableClasses;
  v104 = (objc_class *)objc_opt_class();
  v105 = NSStringFromClass(v104);
  [v103 setObject:v102 forKeyedSubscript:v105];

  uint64_t v106 = objc_opt_class();
  v107 = (void *)_attributeClassesByName_availableClasses;
  v108 = (objc_class *)objc_opt_class();
  v109 = NSStringFromClass(v108);
  [v107 setObject:v106 forKeyedSubscript:v109];

  uint64_t v110 = objc_opt_class();
  v111 = (void *)_attributeClassesByName_availableClasses;
  v112 = (objc_class *)objc_opt_class();
  v113 = NSStringFromClass(v112);
  [v111 setObject:v110 forKeyedSubscript:v113];

  uint64_t v114 = objc_opt_class();
  v115 = (void *)_attributeClassesByName_availableClasses;
  v116 = (objc_class *)objc_opt_class();
  v117 = NSStringFromClass(v116);
  [v115 setObject:v114 forKeyedSubscript:v117];

  uint64_t v118 = objc_opt_class();
  v119 = (void *)_attributeClassesByName_availableClasses;
  v120 = (objc_class *)objc_opt_class();
  v121 = NSStringFromClass(v120);
  [v119 setObject:v118 forKeyedSubscript:v121];

  uint64_t v122 = objc_opt_class();
  v123 = (void *)_attributeClassesByName_availableClasses;
  v124 = (objc_class *)objc_opt_class();
  v125 = NSStringFromClass(v124);
  [v123 setObject:v122 forKeyedSubscript:v125];

  uint64_t v126 = objc_opt_class();
  v127 = (void *)_attributeClassesByName_availableClasses;
  v128 = (objc_class *)objc_opt_class();
  v129 = NSStringFromClass(v128);
  [v127 setObject:v126 forKeyedSubscript:v129];

  uint64_t v130 = objc_opt_class();
  v131 = (void *)_attributeClassesByName_availableClasses;
  v132 = (objc_class *)objc_opt_class();
  v133 = NSStringFromClass(v132);
  [v131 setObject:v130 forKeyedSubscript:v133];

  uint64_t v134 = objc_opt_class();
  v135 = (void *)_attributeClassesByName_availableClasses;
  v136 = (objc_class *)objc_opt_class();
  v137 = NSStringFromClass(v136);
  [v135 setObject:v134 forKeyedSubscript:v137];

  uint64_t v138 = objc_opt_class();
  v139 = (void *)_attributeClassesByName_availableClasses;
  v140 = (objc_class *)objc_opt_class();
  NSStringFromClass(v140);
  id v141 = (id)objc_claimAutoreleasedReturnValue();
  [v139 setObject:v138 forKeyedSubscript:v141];
}

+ (void)attributeForClass:andProperties:errors:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Detected misconfigured attribute with unknown class name %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_acquisitionCompletionAttributeWithProperties:errors:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "Detected misconfigured acquisition completion attribute with no completion policy", v2, v3, v4, v5, v6);
}

+ (void)_acquisitionCompletionAttributeWithProperties:errors:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Detected misconfigured acquisition completion attribute with unknown completion policy: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "Detected misconfigured CPU usage limitation with no violation policy", v2, v3, v4, v5, v6);
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Detected misconfigured CPU usage limitation with unknown violation policy: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "Detected misconfigured CPU usage limitation with no role", v2, v3, v4, v5, v6);
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Detected misconfigured CPU usage limitation with unknown role: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "Detected misconfigured CPU usage limitation with no percentage", v2, v3, v4, v5, v6);
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "Detected misconfigured CPU usage limitation with no duration", v2, v3, v4, v5, v6);
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "Detected misconfigured CPU usage limitation with illegal duration", v2, v3, v4, v5, v6);
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Detected misconfigured CPU usage limitation with illegal percentage: %ld", v2, v3, v4, v5, v6);
}

+ (void)_cpuMinimumUsageGrantWithProperties:errors:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "Detected misconfigured CPU usage grant with no role", v2, v3, v4, v5, v6);
}

+ (void)_cpuMinimumUsageGrantWithProperties:errors:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Detected misconfigured CPU usage grant with unknown role: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_cpuMinimumUsageGrantWithProperties:errors:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "Detected misconfigured CPU usage grant with no percentage", v2, v3, v4, v5, v6);
}

+ (void)_cpuMinimumUsageGrantWithProperties:errors:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "Detected misconfigured CPU usage grant with no duration", v2, v3, v4, v5, v6);
}

+ (void)_cpuMinimumUsageGrantWithProperties:errors:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "Detected misconfigured CPU usage grant with illegal duration", v2, v3, v4, v5, v6);
}

+ (void)_cpuMinimumUsageGrantWithProperties:errors:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Detected misconfigured CPU usage grant with illegal percentage: %ld", v2, v3, v4, v5, v6);
}

+ (void)_domainAttributeWithProperties:errors:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "Detected misconfigured domain attribute: domain %{public}@; name %{public}@");
}

+ (void)_durationAttributeWithProperties:errors:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Detected misconfigured duration attribute with unknown end policy: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_durationAttributeWithProperties:errors:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Detected misconfigured duration attribute with unknown start policy: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_GPUAccessGrantWithProperties:errors:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Detected misconfigured GPU Access grant with unknown role name: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_jetsamPriorityGrantWithProperties:errors:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "Detected misconfigured jetsam priority grant with no (or 0) band", v2, v3, v4, v5, v6);
}

+ (void)_RBSBaseMemoryGrant:errors:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "Detected misconfigured CPU usage limitation with no category", v2, v3, v4, v5, v6);
}

+ (void)_RBSBaseMemoryGrant:errors:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "Detected misconfigured CPU usage limitation with no strength", v2, v3, v4, v5, v6);
}

+ (void)_RBSBaseMemoryGrant:errors:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Detected misconfigured CPU usage limitation with unknown strength: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_runningReasonAttributeWithProperties:errors:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "Detected misconfigured run reason with no reason", v2, v3, v4, v5, v6);
}

+ (void)_runningReasonAttributeWithProperties:errors:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "Detected misconfigured run reason with negative reason", v2, v3, v4, v5, v6);
}

+ (void)_tagAttributeWithProperties:errors:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "Detected misconfigured tag attribute with missing tag", v2, v3, v4, v5, v6);
}

+ (void)_appNapTimerThrottleAttributeWithProperties:errors:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "Detected misconfigured RBSAppNapPreventTimerThrottleGrant attribute with missing tier", v2, v3, v4, v5, v6);
}

+ (void)_endowmentGrantWithProperties:errors:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "Detected misconfigured RBSEndowmentGrant attribute with missing namespace", v2, v3, v4, v5, v6);
}

+ (void)_savedEndowmentGrantWithProperties:errors:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "Detected misconfigured RBSSavedEndowmentGrant attribute with namespace %{public}@ and key %{public}@");
}

+ (void)_conditionAttributeWithProperties:errors:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "Detected misconfigured RBSConditionAttribute attribute with condition %{public}@ and value %{public}@");
}

+ (void)_invalidateUnderConditionAttributeWithProperties:errors:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "Detected misconfigured RBSConditionAttribute attribute with condition %{public}@ and minVal %{public}@");
}

@end