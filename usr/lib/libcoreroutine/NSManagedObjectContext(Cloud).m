@interface NSManagedObjectContext(Cloud)
- (id)currentDevice;
- (uint64_t)mirroringQualityOfService;
- (uint64_t)setMirroringQualityOfService:()Cloud;
@end

@implementation NSManagedObjectContext(Cloud)

- (id)currentDevice
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v2 = [a1 userInfo];
  v3 = [v2 objectForKeyedSubscript:@"RTPersistenceDriverUserInfoDeviceMOIDKey"];

  if (!v3)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = [a1 userInfo];
      *(_DWORD *)buf = 138413058;
      v31 = @"RTPersistenceDriverUserInfoDeviceMOIDKey";
      __int16 v32 = 2112;
      v33 = v13;
      __int16 v34 = 2080;
      v35 = "-[NSManagedObjectContext(Cloud) currentDevice]";
      __int16 v36 = 1024;
      LODWORD(v37) = 92;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "userInfo returned is nil for key, %@, userInfo, %@ (in %s:%d)", buf, 0x26u);
    }
    v4 = 0;
    goto LABEL_18;
  }
  id v27 = 0;
  v4 = [a1 existingObjectWithID:v3 error:&v27];
  id v5 = v27;
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
    id v18 = v5;
    v19 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v21 = [a1 userInfo];
      if (v21) {
        v22 = @"YES";
      }
      else {
        v22 = @"NO";
      }
      if (v4) {
        v23 = @"YES";
      }
      else {
        v23 = @"NO";
      }
      v24 = [v4 identifier];
      v25 = [v24 UUIDString];
      *(_DWORD *)buf = 138413314;
      v31 = v22;
      __int16 v32 = 2112;
      v33 = (const char *)@"YES";
      __int16 v34 = 2112;
      v35 = (const char *)v23;
      __int16 v36 = 2112;
      v37 = v25;
      __int16 v38 = 2112;
      id v39 = v18;
      _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "hasUserInfo, %@, hasDeviceRecordID, %@, hasCurrentDeviceMO, %@, currentDeviceMo.identifier, %@, error, %@", buf, 0x34u);
    }
    uint64_t v28 = *MEMORY[0x1E4F28A50];
    id v29 = v18;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v26 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"No existing current device!" userInfo:objc_claimAutoreleasedReturnValue()];
    objc_exception_throw(v26);
  }
  v7 = [v4 identifier];

  if (!v7)
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v14 = [a1 userInfo];
      if (v14) {
        v15 = @"YES";
      }
      else {
        v15 = @"NO";
      }
      v16 = [v4 identifier];
      v17 = [v16 UUIDString];
      *(_DWORD *)buf = 138413314;
      v31 = v15;
      __int16 v32 = 2112;
      v33 = (const char *)@"YES";
      __int16 v34 = 2112;
      v35 = (const char *)@"YES";
      __int16 v36 = 2112;
      v37 = v17;
      __int16 v38 = 2112;
      id v39 = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "hasUserInfo, %@, hasDeviceRecordID, %@, hasCurrentDeviceMO, %@, currentDeviceMo.identifier, %@, error, %@", buf, 0x34u);
    }
    v9 = [v4 identifier];

    if (!v9)
    {
      v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v31 = v3;
        __int16 v32 = 2080;
        v33 = "-[NSManagedObjectContext(Cloud) currentDevice]";
        __int16 v34 = 1024;
        LODWORD(v35) = 124;
        _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "objectWithID, %@, returned nil (in %s:%d)", buf, 0x1Cu);
      }
    }
    v11 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v3;
      _os_log_fault_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_FAULT, "No existing device with object ID: %@", buf, 0xCu);
    }
LABEL_18:
  }

  return v4;
}

- (uint64_t)mirroringQualityOfService
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [a1 mirroringQualityOfService];
}

- (uint64_t)setMirroringQualityOfService:()Cloud
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    return [a1 setMirroringQualityOfService:a3];
  }
  return result;
}

@end