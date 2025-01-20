@interface RTFingerprintMO
+ (id)fetchLastByStartDateInManagedObjectContext:(id)a3 error:(id *)a4;
+ (id)fetchRequest;
+ (id)managedObjectWithFingerprint:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation RTFingerprintMO

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"RTFingerprintMO"];

  return v2;
}

+ (id)managedObjectWithFingerprint:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "+[RTFingerprintMO managedObjectWithFingerprint:inManagedObjectContext:]";
      __int16 v27 = 1024;
      int v28 = 23;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fingerprint (in %s:%d)", buf, 0x12u);
    }

    if (v7)
    {
      v8 = 0;
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  if (!v6)
  {
LABEL_15:
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "+[RTFingerprintMO managedObjectWithFingerprint:inManagedObjectContext:]";
      __int16 v27 = 1024;
      int v28 = 24;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext (in %s:%d)", buf, 0x12u);
    }
    v8 = 0;
    goto LABEL_18;
  }
  v8 = [[RTFingerprintMO alloc] initWithContext:v6];
  v9 = [v5 identifier];
  [(RTFingerprintMO *)v8 setIdentifier:v9];

  v10 = [NSNumber numberWithUnsignedInteger:[v5 settledState]];
  [(RTFingerprintMO *)v8 setSettledState:v10];

  v11 = [v5 start];
  [(RTFingerprintMO *)v8 setStart:v11];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v12 = [v5 accessPoints];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = +[RTWiFiAccessPointMO managedObjectWithAccessPoint:*(void *)(*((void *)&v20 + 1) + 8 * i) inManagedObjectContext:v7];
        [(RTFingerprintMO *)v8 addWifiAccessPointsObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }
LABEL_18:

LABEL_19:

  return v8;
}

+ (id)fetchLastByStartDateInManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = +[RTFingerprintMO fetchRequest];
    [v6 setReturnsObjectsAsFaults:0];
    uint64_t v14 = @"wifiAccessPoints";
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    [v6 setRelationshipKeyPathsForPrefetching:v7];

    v8 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"start" ascending:0];
    uint64_t v13 = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    [v6 setSortDescriptors:v9];

    [v6 setFetchLimit:1];
    v10 = [v5 executeFetchRequest:v6 error:a4];
    v11 = [v10 firstObject];
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "+[RTFingerprintMO fetchLastByStartDateInManagedObjectContext:error:]";
      __int16 v17 = 1024;
      int v18 = 46;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext (in %s:%d)", buf, 0x12u);
    }
    v11 = 0;
  }

  return v11;
}

@end