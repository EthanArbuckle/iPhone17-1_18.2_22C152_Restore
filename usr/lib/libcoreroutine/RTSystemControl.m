@interface RTSystemControl
+ (id)valueForKey:(id)a3;
+ (id)valueForMib:(int *)a3 miblen:(int)a4;
+ (unint64_t)sysctlByName:(id)a3;
@end

@implementation RTSystemControl

+ (id)valueForKey:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    u_int v5 = _MergedGlobals_96;
    if (!_MergedGlobals_96)
    {
      _MergedGlobals_96 = 48;
      sysctlnametomib((const char *)[v3 UTF8String], dword_1EBE38810, (size_t *)&_MergedGlobals_96);
      u_int v5 = _MergedGlobals_96;
    }
    size_t v12 = 256;
    memset(v15, 0, sizeof(v15));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    if (sysctl(dword_1EBE38810, v5, v15, &v12, 0, 0) < 0)
    {
      v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v10 = *__error();
        *(_DWORD *)buf = 67109120;
        int v14 = v10;
        _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "could not retrieve value due to error (errno: %d)", buf, 8u);
      }
      v8 = 0;
    }
    else
    {
      v6 = [NSString stringWithUTF8String:v15];
      v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      v8 = [v6 stringByTrimmingCharactersInSet:v7];
    }
  }
  else
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v15 = 136315394;
      *(void *)&v15[4] = "+[RTSystemControl valueForKey:]";
      *(_WORD *)&v15[12] = 1024;
      *(_DWORD *)&v15[14] = 22;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key (in %s:%d)", v15, 0x12u);
    }

    v8 = 0;
  }

  return v8;
}

+ (id)valueForMib:(int *)a3 miblen:(int)a4
{
  v4 = 0;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    size_t v9 = 256;
    memset(v12, 0, sizeof(v12));
    if (sysctl(a3, a4, v12, &v9, 0, 0) < 0)
    {
      u_int v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v7 = *__error();
        *(_DWORD *)buf = 67109120;
        int v11 = v7;
        _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "could not retrieve value due to error (errno: %d)", buf, 8u);
      }
      v4 = 0;
    }
    else
    {
      u_int v5 = [NSString stringWithUTF8String:v12];
      v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      v4 = [v5 stringByTrimmingCharactersInSet:v6];
    }
  }

  return v4;
}

+ (unint64_t)sysctlByName:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 length])
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)size_t v12 = 136315394;
      *(void *)&v12[4] = "+[RTSystemControl sysctlByName:]";
      __int16 v13 = 1024;
      int v14 = 72;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: name.length (in %s:%d)", v12, 0x12u);
    }
  }
  if (![v3 length]) {
    goto LABEL_11;
  }
  *(void *)size_t v12 = 0;
  size_t v9 = 8;
  if (sysctlbyname((const char *)[v3 UTF8String], v12, &v9, 0, 0) == -1)
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = *__error();
      *(_DWORD *)buf = 67109120;
      int v11 = v7;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "could not retrieve value due to error (errno: %d)", buf, 8u);
    }

LABEL_11:
    unint64_t v5 = 0;
    goto LABEL_12;
  }
  unint64_t v5 = *(void *)v12;
LABEL_12:

  return v5;
}

@end