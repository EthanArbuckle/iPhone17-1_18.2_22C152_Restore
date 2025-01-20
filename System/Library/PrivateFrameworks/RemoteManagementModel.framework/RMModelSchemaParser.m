@interface RMModelSchemaParser
+ (id)_parseEnrollmentTypes:(id)a3;
+ (id)_parseScopes:(id)a3;
+ (id)_parseVariants:(id)a3;
+ (id)loadSupportedOSFromDictionary:(id)a3;
+ (int64_t)_enrollmentTypeFromString:(id)a3;
+ (int64_t)_platformFromString:(id)a3;
+ (int64_t)_scopeFromString:(id)a3;
+ (int64_t)_variantFromString:(id)a3;
@end

@implementation RMModelSchemaParser

+ (id)loadSupportedOSFromDictionary:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v39 = objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v34 = v4;
    id v5 = v4;
    uint64_t v38 = [v5 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v38)
    {
      uint64_t v37 = *(void *)v41;
      id v35 = a1;
      while (2)
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v41 != v37) {
            objc_enumerationMutation(v5);
          }
          uint64_t v7 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v8 = objc_msgSend(a1, "_platformFromString:", v7, v34);
          if (v8 != -1)
          {
            uint64_t v9 = v8;
            v10 = [v5 objectForKeyedSubscript:v7];
            v11 = [v10 objectForKeyedSubscript:@"allowed-enrollments"];
            v12 = [a1 _parseEnrollmentTypes:v11];

            if (!v12) {
              goto LABEL_20;
            }
            v13 = [v5 objectForKeyedSubscript:v7];
            v14 = [v13 objectForKeyedSubscript:@"allowed-scopes"];
            v15 = [a1 _parseScopes:v14];

            if (!v15)
            {

LABEL_20:
              v24 = 0;
              goto LABEL_21;
            }
            v44[0] = v15;
            v44[1] = v12;
            v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:2];
            v17 = [NSNumber numberWithInteger:v9];
            [v39 setObject:v16 forKeyedSubscript:v17];

            v18 = [v5 objectForKeyedSubscript:v7];
            v19 = [v18 objectForKeyedSubscript:@"variant"];
            v20 = [a1 _parseVariants:v19];

            if (v20)
            {
              v36 = [NSNumber numberWithInteger:v9];
              v21 = [v39 objectForKeyedSubscript:v36];
              v22 = [v21 arrayByAddingObject:v20];
              v23 = [NSNumber numberWithInteger:v9];
              [v39 setObject:v22 forKeyedSubscript:v23];

              a1 = v35;
            }
          }
        }
        uint64_t v38 = [v5 countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v38) {
          continue;
        }
        break;
      }
    }

    v24 = (void *)[v39 copy];
LABEL_21:

    id v4 = v34;
  }
  else
  {
    BOOL v25 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v25) {
      +[RMModelSchemaParser loadSupportedOSFromDictionary:](v25, v26, v27, v28, v29, v30, v31, v32);
    }
    v24 = 0;
  }

  return v24;
}

+ (id)_parseEnrollmentTypes:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            BOOL v23 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
            if (v23) {
              +[RMModelSchemaParser _parseEnrollmentTypes:](v23, v24, v25, v26, v27, v28, v29, v30);
            }

            v14 = 0;
            goto LABEL_19;
          }
          uint64_t v12 = objc_msgSend(a1, "_enrollmentTypeFromString:", v11, (void)v32);
          if (v12 != -1)
          {
            v13 = [NSNumber numberWithInteger:v12];
            [v5 addObject:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    v14 = (void *)[v5 copy];
LABEL_19:
  }
  else
  {
    BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v15) {
      +[RMModelSchemaParser _parseEnrollmentTypes:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
    v14 = 0;
  }

  return v14;
}

+ (id)_parseScopes:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            BOOL v23 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
            if (v23) {
              +[RMModelSchemaParser _parseScopes:](v23, v24, v25, v26, v27, v28, v29, v30);
            }

            v14 = 0;
            goto LABEL_19;
          }
          uint64_t v12 = objc_msgSend(a1, "_scopeFromString:", v11, (void)v32);
          if (v12 != -1)
          {
            v13 = [NSNumber numberWithInteger:v12];
            [v5 addObject:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    v14 = (void *)[v5 copy];
LABEL_19:
  }
  else
  {
    BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v15) {
      +[RMModelSchemaParser _parseScopes:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
    v14 = 0;
  }

  return v14;
}

+ (id)_parseVariants:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
LABEL_16:
    v14 = 0;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v15) {
      +[RMModelSchemaParser _parseVariants:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_16;
  }
  id v5 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v23 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v23) {
            +[RMModelSchemaParser _parseVariants:](v23, v24, v25, v26, v27, v28, v29, v30);
          }

          v14 = 0;
          goto LABEL_20;
        }
        uint64_t v12 = objc_msgSend(a1, "_variantFromString:", v11, (void)v32);
        if (v12 != -1)
        {
          v13 = [NSNumber numberWithInteger:v12];
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  v14 = (void *)[v5 copy];
LABEL_20:

LABEL_21:
  return v14;
}

+ (int64_t)_platformFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"macOS"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"iOS"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"SharediPad"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"tvOS"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"visionOS"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"watchOS"])
  {
    int64_t v4 = 4;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[RMModelSchemaParser _platformFromString:]();
    }
    int64_t v4 = -1;
  }

  return v4;
}

+ (int64_t)_enrollmentTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"user"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"device"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"local"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"supervised"])
  {
    int64_t v4 = 3;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[RMModelSchemaParser _enrollmentTypeFromString:]();
    }
    int64_t v4 = -1;
  }

  return v4;
}

+ (int64_t)_scopeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"user"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"system"])
  {
    int64_t v4 = 1;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[RMModelSchemaParser _scopeFromString:]();
    }
    int64_t v4 = -1;
  }

  return v4;
}

+ (int64_t)_variantFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"any"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"internal"])
  {
    int64_t v4 = 1;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[RMModelSchemaParser _variantFromString:]();
    }
    int64_t v4 = -1;
  }

  return v4;
}

+ (void)loadSupportedOSFromDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_parseEnrollmentTypes:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_parseEnrollmentTypes:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_parseScopes:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_parseScopes:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_parseVariants:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_parseVariants:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_platformFromString:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_25AF84000, &_os_log_internal, v0, "Unrecognized platform in supported-os being ignored: %{public}@", v1, v2, v3, v4, v5);
}

+ (void)_enrollmentTypeFromString:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_25AF84000, &_os_log_internal, v0, "Unrecognized enrollment type in allowed-enrollments being ignored: %{public}@", v1, v2, v3, v4, v5);
}

+ (void)_scopeFromString:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_25AF84000, &_os_log_internal, v0, "Unrecognized scope in allowed-scopes being ignored: %{public}@", v1, v2, v3, v4, v5);
}

+ (void)_variantFromString:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_25AF84000, &_os_log_internal, v0, "Unrecognized variant in variant being ignored: %{public}@", v1, v2, v3, v4, v5);
}

@end