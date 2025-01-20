@interface NSDictionary(SafeCastParseDictionary)
+ (double)doubleValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:;
+ (float)floatValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:;
+ (id)stringValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:;
+ (uint64_t)integerValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:;
+ (uint64_t)timeIntervalValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:;
- (id)arrayForKey:()SafeCastParseDictionary;
- (id)dictionaryForKey:()SafeCastParseDictionary;
- (id)numberForKey:()SafeCastParseDictionary;
- (id)stringForKey:()SafeCastParseDictionary;
- (uint64_t)BOOLForKey:()SafeCastParseDictionary defaultValue:;
@end

@implementation NSDictionary(SafeCastParseDictionary)

+ (float)floatValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:
{
  id v7 = a4;
  id v8 = a5;
  if (v7)
  {
    v9 = [MEMORY[0x263EFF9D0] null];
    char v10 = [v7 isEqual:v9];

    if ((v10 & 1) == 0)
    {
      v11 = [v7 numberForKey:v8];
      if (v11
        && ([MEMORY[0x263EFF9D0] null],
            v12 = objc_claimAutoreleasedReturnValue(),
            char v13 = [v11 isEqual:v12],
            v12,
            (v13 & 1) == 0))
      {
        [v11 floatValue];
        a1 = v15;
      }
      else
      {
        v14 = WFLogForCategory(0);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          +[NSDictionary(SafeCastParseDictionary) floatValueFromDictionary:forKey:defaultValue:]();
        }
      }
    }
  }

  return a1;
}

+ (double)doubleValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:
{
  id v7 = a4;
  id v8 = a5;
  if (v7)
  {
    v9 = [MEMORY[0x263EFF9D0] null];
    char v10 = [v7 isEqual:v9];

    if ((v10 & 1) == 0)
    {
      v11 = [v7 numberForKey:v8];
      if (v11
        && ([MEMORY[0x263EFF9D0] null],
            v12 = objc_claimAutoreleasedReturnValue(),
            char v13 = [v11 isEqual:v12],
            v12,
            (v13 & 1) == 0))
      {
        [v11 doubleValue];
        a1 = v15;
      }
      else
      {
        v14 = WFLogForCategory(0);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          +[NSDictionary(SafeCastParseDictionary) doubleValueFromDictionary:forKey:defaultValue:]();
        }
      }
    }
  }

  return a1;
}

+ (uint64_t)integerValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v9 = [MEMORY[0x263EFF9D0] null];
    char v10 = [v7 isEqual:v9];

    if ((v10 & 1) == 0)
    {
      v11 = [v7 numberForKey:v8];
      if (v11
        && ([MEMORY[0x263EFF9D0] null],
            v12 = objc_claimAutoreleasedReturnValue(),
            char v13 = [v11 isEqual:v12],
            v12,
            (v13 & 1) == 0))
      {
        a5 = [v11 integerValue];
      }
      else
      {
        v14 = WFLogForCategory(0);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          +[NSDictionary(SafeCastParseDictionary) integerValueFromDictionary:forKey:defaultValue:]((uint64_t)v8, a5, v14);
        }
      }
    }
  }

  return a5;
}

+ (id)stringValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7
    && ([MEMORY[0x263EFF9D0] null],
        char v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v7 isEqual:v10],
        v10,
        !v11))
  {
    char v13 = [v7 stringForKey:v8];
    if (!v13
      || ([MEMORY[0x263EFF9D0] null],
          v14 = objc_claimAutoreleasedReturnValue(),
          int v15 = [v13 isEqual:v14],
          v14,
          v16 = v13,
          v15))
    {
      v17 = WFLogForCategory(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        +[NSDictionary(SafeCastParseDictionary) stringValueFromDictionary:forKey:defaultValue:]((uint64_t)v8, (uint64_t)v9, v17);
      }

      v16 = v9;
    }
    id v12 = v16;
  }
  else
  {
    id v12 = v9;
  }

  return v12;
}

+ (uint64_t)timeIntervalValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:
{
  return objc_msgSend(NSDictionary, "doubleValueFromDictionary:forKey:defaultValue:");
}

- (id)dictionaryForKey:()SafeCastParseDictionary
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)arrayForKey:()SafeCastParseDictionary
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)numberForKey:()SafeCastParseDictionary
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)stringForKey:()SafeCastParseDictionary
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (uint64_t)BOOLForKey:()SafeCastParseDictionary defaultValue:
{
  v5 = objc_msgSend(a1, "numberForKey:");
  v6 = v5;
  if (v5) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

+ (void)floatValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4(&dword_21C988000, v0, v1, "Missing integer value for key: %{public}@ defaultValue: %ld", v2);
}

+ (void)doubleValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4(&dword_21C988000, v0, v1, "Missing integer value for key: %{public}@ defaultValue: %ld", v2);
}

+ (void)integerValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  OUTLINED_FUNCTION_1_4(&dword_21C988000, a3, (uint64_t)a3, "Missing integer value for key: %{public}@ defaultValue: %ld", (uint8_t *)&v3);
}

+ (void)stringValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  OUTLINED_FUNCTION_1_4(&dword_21C988000, a3, (uint64_t)a3, "Missing string value for key: %{public}@ defaultValue: %@", (uint8_t *)&v3);
}

@end