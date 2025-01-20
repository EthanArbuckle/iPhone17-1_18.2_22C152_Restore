@interface RTBootInfo
+ (BOOL)isFirstRunSinceBootWithDefaultsManager:(id)a3 defaultsKey:(id)a4;
+ (id)getCurrentBootSessionID;
+ (void)setBootSessionIDWithDefaultsManager:(id)a3 defaultsKey:(id)a4;
@end

@implementation RTBootInfo

+ (id)getCurrentBootSessionID
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(v7, 0, sizeof(v7));
  size_t v6 = 37;
  if (!sysctlbyname("kern.bootsessionuuid", v7, &v6, 0, 0))
  {
    uint64_t v2 = [NSString stringWithUTF8String:v7];
    v3 = (void *)getCurrentBootSessionID_bootUUID;
    getCurrentBootSessionID_bootUUID = v2;
  }
  id v4 = (id)getCurrentBootSessionID_bootUUID;

  return v4;
}

+ (BOOL)isFirstRunSinceBootWithDefaultsManager:(id)a3 defaultsKey:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      v15 = "+[RTBootInfo isFirstRunSinceBootWithDefaultsManager:defaultsKey:]";
      __int16 v16 = 1024;
      LODWORD(v17) = 29;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager (in %s:%d)", (uint8_t *)&v14, 0x12u);
    }
  }
  uint64_t v8 = +[RTBootInfo getCurrentBootSessionID];
  if (v8)
  {
    v9 = [v5 objectForKey:v6];
    v10 = v9;
    BOOL v11 = !v9 || ([v9 isEqual:v8] & 1) == 0;
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315650;
      v15 = "+[RTBootInfo isFirstRunSinceBootWithDefaultsManager:defaultsKey:]";
      __int16 v16 = 2112;
      v17 = v8;
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%s, currentBootUUID, %@, lastBootUUID, %@", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      v15 = "+[RTBootInfo isFirstRunSinceBootWithDefaultsManager:defaultsKey:]";
      __int16 v16 = 2112;
      v17 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "%s, unable to read a valid currentBootUUID, %@", (uint8_t *)&v14, 0x16u);
    }
    BOOL v11 = 0;
  }

  return v11;
}

+ (void)setBootSessionIDWithDefaultsManager:(id)a3 defaultsKey:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = +[RTBootInfo getCurrentBootSessionID];
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    v10 = "+[RTBootInfo setBootSessionIDWithDefaultsManager:defaultsKey:]";
    __int16 v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s, storing boot session ID in defaults, %@", (uint8_t *)&v9, 0x16u);
  }

  [v6 setObject:v7 forKey:v5];
}

@end