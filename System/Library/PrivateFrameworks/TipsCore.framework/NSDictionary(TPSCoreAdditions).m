@interface NSDictionary(TPSCoreAdditions)
- (double)TPSSafeDoubleForKey:()TPSCoreAdditions;
- (float)TPSSafeFloatForKey:()TPSCoreAdditions;
- (id)TPSSafeArrayForKey:()TPSCoreAdditions;
- (id)TPSSafeDictionaryForKey:()TPSCoreAdditions;
- (id)TPSSafeNumberForKey:()TPSCoreAdditions;
- (id)TPSSafeObjectForKey:()TPSCoreAdditions;
- (id)TPSSafeStringForKey:()TPSCoreAdditions;
- (uint64_t)TPSSafeBoolForKey:()TPSCoreAdditions;
- (uint64_t)TPSSafeIntForKey:()TPSCoreAdditions;
- (uint64_t)TPSSafeIntegerForKey:()TPSCoreAdditions;
- (uint64_t)TPSSafeUIntegerForKey:()TPSCoreAdditions;
@end

@implementation NSDictionary(TPSCoreAdditions)

- (uint64_t)TPSSafeIntegerForKey:()TPSCoreAdditions
{
  v1 = objc_msgSend(a1, "TPSSafeObjectForKey:");
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (id)TPSSafeNumberForKey:()TPSCoreAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 objectForKeyedSubscript:v4];
  uint64_t v6 = objc_opt_class();
  if (v5)
  {
    uint64_t v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = +[TPSLogger default];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 138413058;
        v12 = v5;
        __int16 v13 = 2112;
        id v14 = (id)objc_opt_class();
        __int16 v15 = 2112;
        uint64_t v16 = v7;
        __int16 v17 = 2112;
        id v18 = v4;
        id v9 = v14;
        _os_log_impl(&dword_19C8DC000, v8, OS_LOG_TYPE_INFO, "Unexpected value: %@ with class %@. Expected type: %@ for key %@", (uint8_t *)&v11, 0x2Au);
      }
      v5 = 0;
    }
  }

  return v5;
}

- (id)TPSSafeObjectForKey:()TPSCoreAdditions
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  if (v1 == (void *)*MEMORY[0x1E4F1D260])
  {

    v1 = 0;
  }
  return v1;
}

- (id)TPSSafeArrayForKey:()TPSCoreAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 objectForKeyedSubscript:v4];
  uint64_t v6 = objc_opt_class();
  if (v5)
  {
    uint64_t v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = +[TPSLogger default];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 138413058;
        v12 = v5;
        __int16 v13 = 2112;
        id v14 = (id)objc_opt_class();
        __int16 v15 = 2112;
        uint64_t v16 = v7;
        __int16 v17 = 2112;
        id v18 = v4;
        id v9 = v14;
        _os_log_impl(&dword_19C8DC000, v8, OS_LOG_TYPE_INFO, "Unexpected value: %@ with class %@. Expected type: %@ for key %@", (uint8_t *)&v11, 0x2Au);
      }
      v5 = 0;
    }
  }

  return v5;
}

- (id)TPSSafeDictionaryForKey:()TPSCoreAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 objectForKeyedSubscript:v4];
  uint64_t v6 = objc_opt_class();
  if (v5)
  {
    uint64_t v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = +[TPSLogger default];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 138413058;
        v12 = v5;
        __int16 v13 = 2112;
        id v14 = (id)objc_opt_class();
        __int16 v15 = 2112;
        uint64_t v16 = v7;
        __int16 v17 = 2112;
        id v18 = v4;
        id v9 = v14;
        _os_log_impl(&dword_19C8DC000, v8, OS_LOG_TYPE_INFO, "Unexpected value: %@ with class %@. Expected type: %@ for key %@", (uint8_t *)&v11, 0x2Au);
      }
      v5 = 0;
    }
  }

  return v5;
}

- (id)TPSSafeStringForKey:()TPSCoreAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 objectForKeyedSubscript:v4];
  uint64_t v6 = objc_opt_class();
  if (v5)
  {
    uint64_t v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = +[TPSLogger default];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 138413058;
        v12 = v5;
        __int16 v13 = 2112;
        id v14 = (id)objc_opt_class();
        __int16 v15 = 2112;
        uint64_t v16 = v7;
        __int16 v17 = 2112;
        id v18 = v4;
        id v9 = v14;
        _os_log_impl(&dword_19C8DC000, v8, OS_LOG_TYPE_INFO, "Unexpected value: %@ with class %@. Expected type: %@ for key %@", (uint8_t *)&v11, 0x2Au);
      }
      v5 = 0;
    }
  }

  return v5;
}

- (uint64_t)TPSSafeIntForKey:()TPSCoreAdditions
{
  v1 = objc_msgSend(a1, "TPSSafeObjectForKey:");
  uint64_t v2 = [v1 intValue];

  return v2;
}

- (uint64_t)TPSSafeUIntegerForKey:()TPSCoreAdditions
{
  v1 = objc_msgSend(a1, "TPSSafeObjectForKey:");
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (uint64_t)TPSSafeBoolForKey:()TPSCoreAdditions
{
  v1 = objc_msgSend(a1, "TPSSafeObjectForKey:");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (double)TPSSafeDoubleForKey:()TPSCoreAdditions
{
  v1 = objc_msgSend(a1, "TPSSafeObjectForKey:");
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (float)TPSSafeFloatForKey:()TPSCoreAdditions
{
  v1 = objc_msgSend(a1, "TPSSafeObjectForKey:");
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

@end