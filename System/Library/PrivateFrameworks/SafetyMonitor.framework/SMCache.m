@interface SMCache
+ (BOOL)supportsSecureCoding;
+ (void)logNoCacheDataForSessionID:(id)a3 role:(id)a4 deviceType:(id)a5 transaction:(id)a6;
- (BOOL)shiftRequiredForLocation:(id)a3;
- (NSArray)workoutEvents;
- (NSData)destinationMapItem;
- (NSSet)locationsDuringSession;
- (NSUUID)identifier;
- (SMCache)init;
- (SMCache)initWithCoder:(id)a3;
- (SMCache)initWithDictionary:(id)a3;
- (SMCache)initWithIdentifier:(id)a3 deviceStatus:(id)a4 locationsDuringSession:(id)a5 unlockLocation:(id)a6 lockLocation:(id)a7 mostRecentLocation:(id)a8 startingLocation:(id)a9 offWristLocation:(id)a10 parkedCarLocation:(id)a11 destinationMapItem:(id)a12 workoutEvents:(id)a13;
- (SMDeviceStatus)deviceStatus;
- (SMLocation)lockLocation;
- (SMLocation)mostRecentLocation;
- (SMLocation)offWristLocation;
- (SMLocation)parkedCarLocation;
- (SMLocation)startingLocation;
- (SMLocation)unlockLocation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)outputToDictionary;
- (unint64_t)identifierHash;
- (void)encodeWithCoder:(id)a3;
- (void)logCacheForSessionID:(id)a3 role:(id)a4 deviceType:(id)a5 transaction:(id)a6 hashString:(id)a7;
- (void)setDestinationMapItem:(id)a3;
- (void)setDeviceStatus:(id)a3;
- (void)setLocationsDuringSession:(id)a3;
- (void)setLockLocation:(id)a3;
- (void)setMostRecentLocation:(id)a3;
- (void)setOffWristLocation:(id)a3;
- (void)setParkedCarLocation:(id)a3;
- (void)setStartingLocation:(id)a3;
- (void)setUnlockLocation:(id)a3;
- (void)setWorkoutEvents:(id)a3;
- (void)shiftLocation:(id)a3 queue:(id)a4 withHandler:(id)a5;
- (void)shiftLocationsOnQueue:(id)a3 handler:(id)a4;
@end

@implementation SMCache

- (SMCache)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = [(SMCache *)self initWithIdentifier:v3 deviceStatus:v4 locationsDuringSession:v5 unlockLocation:0 lockLocation:0 mostRecentLocation:0 startingLocation:0 offWristLocation:0 parkedCarLocation:0 destinationMapItem:0 workoutEvents:v6];

  return v7;
}

- (SMCache)initWithIdentifier:(id)a3 deviceStatus:(id)a4 locationsDuringSession:(id)a5 unlockLocation:(id)a6 lockLocation:(id)a7 mostRecentLocation:(id)a8 startingLocation:(id)a9 offWristLocation:(id)a10 parkedCarLocation:(id)a11 destinationMapItem:(id)a12 workoutEvents:(id)a13
{
  id v18 = a3;
  id v39 = a4;
  id v28 = a5;
  id v38 = a5;
  id v37 = a6;
  id v36 = a7;
  id v35 = a8;
  id v34 = a9;
  id v33 = a10;
  id v32 = a11;
  id v31 = a12;
  id v30 = a13;
  if (v18)
  {
    v40.receiver = self;
    v40.super_class = (Class)SMCache;
    v19 = [(SMCache *)&v40 init];
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_identifier, a3);
      objc_storeStrong((id *)&v20->_deviceStatus, a4);
      objc_storeStrong((id *)&v20->_locationsDuringSession, v28);
      objc_storeStrong((id *)&v20->_unlockLocation, a6);
      objc_storeStrong((id *)&v20->_lockLocation, a7);
      objc_storeStrong((id *)&v20->_mostRecentLocation, a8);
      objc_storeStrong((id *)&v20->_startingLocation, a9);
      objc_storeStrong((id *)&v20->_offWristLocation, a10);
      objc_storeStrong((id *)&v20->_parkedCarLocation, a11);
      objc_storeStrong((id *)&v20->_destinationMapItem, a12);
      objc_storeStrong((id *)&v20->_workoutEvents, a13);
      v21 = (GEOLocationShifter *)objc_alloc_init(MEMORY[0x263F417D8]);
      shifter = v20->_shifter;
      v20->_shifter = v21;
    }
    v23 = v20;
    v24 = v23;
  }
  else
  {
    v23 = self;
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v24 = 0;
  }

  return v24;
}

- (SMCache)initWithDictionary:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F08C38] UUID];
  v5 = [v3 valueForKey:@"identifier"];
  v47 = (void *)[v4 initWithUUIDString:v5];

  v6 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v7 = [v3 valueForKey:@"locationsDuringSession"];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v53 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [[SMLocation alloc] initWithDictionary:*(void *)(*((void *)&v52 + 1) + 8 * i)];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v9);
  }

  v13 = [SMLocation alloc];
  v14 = [v3 valueForKey:@"unlockLocation"];
  v44 = [(SMLocation *)v13 initWithDictionary:v14];

  v15 = [SMLocation alloc];
  v16 = [v3 valueForKey:@"lockLocation"];
  v43 = [(SMLocation *)v15 initWithDictionary:v16];

  v17 = [SMLocation alloc];
  id v18 = [v3 valueForKey:@"mostRecentLocation"];
  v42 = [(SMLocation *)v17 initWithDictionary:v18];

  v19 = [SMDeviceStatus alloc];
  v20 = [v3 valueForKey:@"deviceStatus"];
  v41 = [(SMDeviceStatus *)v19 initWithDictionary:v20];

  v21 = [SMLocation alloc];
  v22 = [v3 valueForKey:@"startingLocation"];
  objc_super v40 = [(SMLocation *)v21 initWithDictionary:v22];

  v23 = [SMLocation alloc];
  v24 = [v3 valueForKey:@"offWristLocation"];
  id v39 = [(SMLocation *)v23 initWithDictionary:v24];

  v25 = [SMLocation alloc];
  v26 = [v3 valueForKey:@"parkedCar"];
  id v38 = [(SMLocation *)v25 initWithDictionary:v26];

  v27 = [v3 valueForKey:@"destinationMapItem"];

  if (v27)
  {
    id v28 = objc_alloc(MEMORY[0x263EFF8F8]);
    v29 = [v3 valueForKey:@"destinationMapItem"];
    v27 = (void *)[v28 initWithBase64EncodedString:v29 options:0];
  }
  id v30 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v31 = [v3 valueForKey:@"workoutEvents"];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v49 != v34) {
          objc_enumerationMutation(v31);
        }
        id v36 = [[SMWorkoutEvent alloc] initWithDictionary:*(void *)(*((void *)&v48 + 1) + 8 * j)];
        [v30 addObject:v36];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v33);
  }

  v46 = [(SMCache *)self initWithIdentifier:v47 deviceStatus:v41 locationsDuringSession:v6 unlockLocation:v44 lockLocation:v43 mostRecentLocation:v42 startingLocation:v40 offWristLocation:v39 parkedCarLocation:v38 destinationMapItem:v27 workoutEvents:v30];
  return v46;
}

- (id)outputToDictionary
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(SMCache *)self identifier];
  v5 = [v4 UUIDString];
  [v3 setObject:v5 forKey:@"identifier"];

  v6 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v7 = [(SMCache *)self locationsDuringSession];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v50 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v49 + 1) + 8 * i) outputToDictionary];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v9);
  }

  [v3 setObject:v6 forKey:@"locationsDuringSession"];
  v13 = [(SMCache *)self unlockLocation];

  if (v13)
  {
    v14 = [(SMCache *)self unlockLocation];
    v15 = [v14 outputToDictionary];
    [v3 setObject:v15 forKey:@"unlockLocation"];
  }
  v16 = [(SMCache *)self lockLocation];

  if (v16)
  {
    v17 = [(SMCache *)self lockLocation];
    id v18 = [v17 outputToDictionary];
    [v3 setObject:v18 forKey:@"lockLocation"];
  }
  v19 = [(SMCache *)self mostRecentLocation];

  if (v19)
  {
    v20 = [(SMCache *)self mostRecentLocation];
    v21 = [v20 outputToDictionary];
    [v3 setObject:v21 forKey:@"mostRecentLocation"];
  }
  v22 = [(SMCache *)self startingLocation];

  if (v22)
  {
    v23 = [(SMCache *)self startingLocation];
    v24 = [v23 outputToDictionary];
    [v3 setObject:v24 forKey:@"startingLocation"];
  }
  v25 = [(SMCache *)self offWristLocation];

  if (v25)
  {
    v26 = [(SMCache *)self offWristLocation];
    v27 = [v26 outputToDictionary];
    [v3 setObject:v27 forKey:@"offWristLocation"];
  }
  id v28 = [(SMCache *)self parkedCarLocation];

  if (v28)
  {
    v29 = [(SMCache *)self parkedCarLocation];
    id v30 = [v29 outputToDictionary];
    [v3 setObject:v30 forKey:@"parkedCar"];
  }
  id v31 = [(SMCache *)self destinationMapItem];

  if (v31)
  {
    uint64_t v32 = [(SMCache *)self destinationMapItem];
    uint64_t v33 = [v32 base64EncodedStringWithOptions:0];
    [v3 setObject:v33 forKey:@"destinationMapItem"];
  }
  uint64_t v34 = [(SMCache *)self deviceStatus];

  if (v34)
  {
    id v35 = [(SMCache *)self deviceStatus];
    id v36 = [v35 outputToDictionary];
    [v3 setObject:v36 forKey:@"deviceStatus"];
  }
  id v37 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v38 = [(SMCache *)self workoutEvents];
  uint64_t v39 = [v38 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v46 != v41) {
          objc_enumerationMutation(v38);
        }
        v43 = [*(id *)(*((void *)&v45 + 1) + 8 * j) outputToDictionary];
        [v37 addObject:v43];
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v40);
  }

  [v3 setObject:v37 forKey:@"workoutEvents"];
  return v3;
}

- (unint64_t)identifierHash
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = [(SMCache *)self identifier];
  uint64_t v4 = [v3 hash];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v5 = [(SMCache *)self locationsDuringSession];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v34 + 1) + 8 * v9) identifier];
        v4 ^= [v10 hash];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v7);
  }

  v11 = [(SMCache *)self unlockLocation];

  if (v11)
  {
    v12 = [(SMCache *)self unlockLocation];
    v13 = [v12 identifier];
    v4 ^= [v13 hash];
  }
  v14 = [(SMCache *)self lockLocation];

  if (v14)
  {
    v15 = [(SMCache *)self lockLocation];
    v16 = [v15 identifier];
    v4 ^= [v16 hash];
  }
  v17 = [(SMCache *)self mostRecentLocation];

  if (v17)
  {
    id v18 = [(SMCache *)self mostRecentLocation];
    v19 = [v18 identifier];
    v4 ^= [v19 hash];
  }
  v20 = [(SMCache *)self deviceStatus];
  v21 = [v20 identifier];
  unint64_t v22 = [v21 hash] ^ v4;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v23 = [(SMCache *)self workoutEvents];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v31;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = [*(id *)(*((void *)&v30 + 1) + 8 * v27) location];
        v22 ^= [v28 hash];

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v25);
  }

  return v22;
}

- (void)logCacheForSessionID:(id)a3 role:(id)a4 deviceType:(id)a5 transaction:(id)a6 hashString:(id)a7
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v53 = a3;
  id v52 = a4;
  id v51 = a5;
  id v50 = a6;
  id v12 = a7;
  v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  long long v49 = self;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = [(SMCache *)self identifier];
    v15 = [(SMCache *)self locationsDuringSession];
    uint64_t v16 = [v15 count];
    v17 = [(SMCache *)v49 destinationMapItem];
    id v18 = [(SMCache *)v49 deviceStatus];
    v19 = [(SMCache *)v49 workoutEvents];
    *(_DWORD *)buf = 138414594;
    id v65 = v52;
    __int16 v66 = 2112;
    id v67 = v53;
    __int16 v68 = 2112;
    id v69 = v50;
    __int16 v70 = 2112;
    id v71 = v51;
    __int16 v72 = 2112;
    id v73 = v12;
    __int16 v74 = 2112;
    v75 = v14;
    __int16 v76 = 2048;
    uint64_t v77 = v16;
    __int16 v78 = 2112;
    v79 = v17;
    __int16 v80 = 2112;
    v81 = v18;
    __int16 v82 = 2048;
    uint64_t v83 = [v19 count];
    _os_log_impl(&dword_25B6E0000, v13, OS_LOG_TYPE_INFO, "#SafetyCache,%@,sessionID:%@,logCache,transactionID:%@,%@,hash,%@,identifier,%@,locationsDuringSessionCount,%lu,destinationMapItem,%@,deviceStatus,%@,workoutEventsCount,%lu", buf, 0x66u);

    self = v49;
  }

  v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = [(SMCache *)self mostRecentLocation];
    *(_DWORD *)buf = 138413314;
    id v65 = v52;
    __int16 v66 = 2112;
    id v67 = v53;
    __int16 v68 = 2112;
    id v69 = v50;
    __int16 v70 = 2112;
    id v71 = v51;
    __int16 v72 = 2112;
    id v73 = v21;
    _os_log_impl(&dword_25B6E0000, v20, OS_LOG_TYPE_INFO, "#SafetyCache,%@,sessionID:%@,logCache,transactionID:%@,%@,mostRecentLocation,%@", buf, 0x34u);
  }
  unint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = [(SMCache *)self startingLocation];
    *(_DWORD *)buf = 138413314;
    id v65 = v52;
    __int16 v66 = 2112;
    id v67 = v53;
    __int16 v68 = 2112;
    id v69 = v50;
    __int16 v70 = 2112;
    id v71 = v51;
    __int16 v72 = 2112;
    id v73 = v23;
    _os_log_impl(&dword_25B6E0000, v22, OS_LOG_TYPE_INFO, "#SafetyCache,%@,sessionID:%@,logCache,transactionID:%@,%@,startingLocation,%@", buf, 0x34u);
  }
  uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = [(SMCache *)self unlockLocation];
    *(_DWORD *)buf = 138413314;
    id v65 = v52;
    __int16 v66 = 2112;
    id v67 = v53;
    __int16 v68 = 2112;
    id v69 = v50;
    __int16 v70 = 2112;
    id v71 = v51;
    __int16 v72 = 2112;
    id v73 = v25;
    _os_log_impl(&dword_25B6E0000, v24, OS_LOG_TYPE_INFO, "#SafetyCache,%@,sessionID:%@,logCache,transactionID:%@,%@,unlockLocation,%@", buf, 0x34u);
  }
  uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    uint64_t v27 = [(SMCache *)self lockLocation];
    *(_DWORD *)buf = 138413314;
    id v65 = v52;
    __int16 v66 = 2112;
    id v67 = v53;
    __int16 v68 = 2112;
    id v69 = v50;
    __int16 v70 = 2112;
    id v71 = v51;
    __int16 v72 = 2112;
    id v73 = v27;
    _os_log_impl(&dword_25B6E0000, v26, OS_LOG_TYPE_INFO, "#SafetyCache,%@,sessionID:%@,logCache,transactionID:%@,%@,lockLocation,%@", buf, 0x34u);
  }
  id v28 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = [(SMCache *)self parkedCarLocation];
    *(_DWORD *)buf = 138413314;
    id v65 = v52;
    __int16 v66 = 2112;
    id v67 = v53;
    __int16 v68 = 2112;
    id v69 = v50;
    __int16 v70 = 2112;
    id v71 = v51;
    __int16 v72 = 2112;
    id v73 = v29;
    _os_log_impl(&dword_25B6E0000, v28, OS_LOG_TYPE_INFO, "#SafetyCache,%@,sessionID:%@,logCache,transactionID:%@,%@,parkedCarLocation,%@", buf, 0x34u);
  }
  long long v48 = v12;

  long long v30 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    long long v31 = [(SMCache *)self offWristLocation];
    *(_DWORD *)buf = 138413314;
    id v65 = v52;
    __int16 v66 = 2112;
    id v67 = v53;
    __int16 v68 = 2112;
    id v69 = v50;
    __int16 v70 = 2112;
    id v71 = v51;
    __int16 v72 = 2112;
    id v73 = v31;
    _os_log_impl(&dword_25B6E0000, v30, OS_LOG_TYPE_INFO, "#SafetyCache,%@,sessionID:%@,logCache,transactionID:%@,%@,offWristLocation,%@", buf, 0x34u);
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v32 = [(SMCache *)self locationsDuringSession];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = 0;
    uint64_t v36 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v59 != v36) {
          objc_enumerationMutation(v32);
        }
        id v38 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413570;
          id v65 = v52;
          __int16 v66 = 2112;
          id v67 = v53;
          __int16 v68 = 2112;
          id v69 = v50;
          __int16 v70 = 2112;
          id v71 = v51;
          __int16 v72 = 2048;
          id v73 = (id)(v35 + i);
          __int16 v74 = 2112;
          v75 = v38;
          _os_log_impl(&dword_25B6E0000, v39, OS_LOG_TYPE_INFO, "#SafetyCache,%@,sessionID:%@,logCache,transactionID:%@,%@,locationsDuringSession,location,%lu,%@", buf, 0x3Eu);
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v58 objects:v63 count:16];
      v35 += i;
    }
    while (v34);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v40 = [(SMCache *)v49 workoutEvents];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = 0;
    uint64_t v44 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v55 != v44) {
          objc_enumerationMutation(v40);
        }
        long long v46 = *(void **)(*((void *)&v54 + 1) + 8 * j);
        long long v47 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413570;
          id v65 = v52;
          __int16 v66 = 2112;
          id v67 = v53;
          __int16 v68 = 2112;
          id v69 = v50;
          __int16 v70 = 2112;
          id v71 = v51;
          __int16 v72 = 2048;
          id v73 = (id)(v43 + j);
          __int16 v74 = 2112;
          v75 = v46;
          _os_log_impl(&dword_25B6E0000, v47, OS_LOG_TYPE_INFO, "#SafetyCache,%@,sessionID:%@,logCache,transactionID:%@,%@,workoutEvents,workoutEvent,%lu,%@", buf, 0x3Eu);
        }
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v54 objects:v62 count:16];
      v43 += j;
    }
    while (v42);
  }
}

+ (void)logNoCacheDataForSessionID:(id)a3 role:(id)a4 deviceType:(id)a5 transaction:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = 138413058;
    id v15 = v10;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v12;
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl(&dword_25B6E0000, v13, OS_LOG_TYPE_INFO, "#SafetyCache,%@,sessionID:%@,logCache,transactionID:%@,%@,no cache data", (uint8_t *)&v14, 0x2Au);
  }
}

- (BOOL)shiftRequiredForLocation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && [v3 referenceFrame] != 2)
  {
    [v4 latitude];
    double v7 = v6;
    [v4 longitude];
    char v5 = objc_msgSend(MEMORY[0x263F417D8], "isLocationShiftRequiredForCoordinate:", v7, v8);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)shiftLocation:(id)a3 queue:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 latitude];
  double v12 = v11;
  [v8 longitude];
  double v14 = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__SMCache_shiftLocation_queue_withHandler___block_invoke;
  aBlock[3] = &unk_265499AF8;
  id v15 = v8;
  id v25 = v15;
  id v16 = v10;
  id v26 = v16;
  id v17 = _Block_copy(aBlock);
  if ([(SMCache *)self shiftRequiredForLocation:v15])
  {
    shifter = self->_shifter;
    [v15 hunc];
    double v20 = v19;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __43__SMCache_shiftLocation_queue_withHandler___block_invoke_58;
    v21[3] = &unk_265499B20;
    id v23 = v16;
    id v22 = v15;
    -[GEOLocationShifter shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](shifter, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v17, &__block_literal_global_2, v21, v9, v12, v14, v20);
  }
  else
  {
    (*((void (**)(id, id))v16 + 2))(v16, v15);
  }
}

void __43__SMCache_shiftLocation_queue_withHandler___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  id v8 = [SMLocation alloc];
  id v9 = [*(id *)(a1 + 32) identifier];
  [*(id *)(a1 + 32) altitude];
  double v11 = v10;
  [*(id *)(a1 + 32) vunc];
  double v13 = v12;
  double v14 = [*(id *)(a1 + 32) date];
  id v15 = [(SMLocation *)v8 initWithIdentifier:v9 latitude:v14 longitude:a2 hunc:a3 altitude:a4 vunc:v11 date:v13];

  [(SMLocation *)v15 setReferenceFrame:2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __43__SMCache_shiftLocation_queue_withHandler___block_invoke_2()
{
  v0 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_25B6E0000, v0, OS_LOG_TYPE_INFO, "Had to go to network for shift", v1, 2u);
  }
}

void __43__SMCache_shiftLocation_queue_withHandler___block_invoke_58(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "Error shifting coordinate: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)shiftLocationsOnQueue:(id)a3 handler:(id)a4
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  queue = a3;
  id v49 = a4;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(SMCache *)self identifier];
    *(_DWORD *)buf = 138412290;
    v86 = v7;
    _os_log_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_DEFAULT, "shifting locations for cache %@", buf, 0xCu);
  }
  group = dispatch_group_create();
  dispatch_group_enter(group);
  id v8 = [(SMCache *)self unlockLocation];
  BOOL v9 = [(SMCache *)self shiftRequiredForLocation:v8];

  if (v9)
  {
    dispatch_group_enter(group);
    double v10 = [(SMCache *)self unlockLocation];
    v81[0] = MEMORY[0x263EF8330];
    v81[1] = 3221225472;
    v81[2] = __41__SMCache_shiftLocationsOnQueue_handler___block_invoke;
    v81[3] = &unk_265499B48;
    v81[4] = self;
    __int16 v82 = group;
    [(SMCache *)self shiftLocation:v10 queue:queue withHandler:v81];
  }
  double v11 = [(SMCache *)self lockLocation];
  BOOL v12 = [(SMCache *)self shiftRequiredForLocation:v11];

  if (v12)
  {
    dispatch_group_enter(group);
    double v13 = [(SMCache *)self lockLocation];
    v79[0] = MEMORY[0x263EF8330];
    v79[1] = 3221225472;
    v79[2] = __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_61;
    v79[3] = &unk_265499B48;
    v79[4] = self;
    __int16 v80 = group;
    [(SMCache *)self shiftLocation:v13 queue:queue withHandler:v79];
  }
  double v14 = [(SMCache *)self mostRecentLocation];
  BOOL v15 = [(SMCache *)self shiftRequiredForLocation:v14];

  if (v15)
  {
    dispatch_group_enter(group);
    id v16 = [(SMCache *)self mostRecentLocation];
    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_62;
    v77[3] = &unk_265499B48;
    v77[4] = self;
    __int16 v78 = group;
    [(SMCache *)self shiftLocation:v16 queue:queue withHandler:v77];
  }
  id v17 = [(SMCache *)self startingLocation];
  BOOL v18 = [(SMCache *)self shiftRequiredForLocation:v17];

  if (v18)
  {
    dispatch_group_enter(group);
    double v19 = [(SMCache *)self startingLocation];
    v75[0] = MEMORY[0x263EF8330];
    v75[1] = 3221225472;
    v75[2] = __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_63;
    v75[3] = &unk_265499B48;
    v75[4] = self;
    __int16 v76 = group;
    [(SMCache *)self shiftLocation:v19 queue:queue withHandler:v75];
  }
  double v20 = [(SMCache *)self offWristLocation];
  BOOL v21 = [(SMCache *)self shiftRequiredForLocation:v20];

  if (v21)
  {
    dispatch_group_enter(group);
    id v22 = [(SMCache *)self offWristLocation];
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_64;
    v73[3] = &unk_265499B48;
    v73[4] = self;
    __int16 v74 = group;
    [(SMCache *)self shiftLocation:v22 queue:queue withHandler:v73];
  }
  id v23 = [(SMCache *)self parkedCarLocation];
  BOOL v24 = [(SMCache *)self shiftRequiredForLocation:v23];

  if (v24)
  {
    dispatch_group_enter(group);
    id v25 = [(SMCache *)self parkedCarLocation];
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_65;
    v71[3] = &unk_265499B48;
    v71[4] = self;
    __int16 v72 = group;
    [(SMCache *)self shiftLocation:v25 queue:queue withHandler:v71];
  }
  id v26 = objc_alloc(MEMORY[0x263EFF9C0]);
  uint64_t v27 = [(SMCache *)self locationsDuringSession];
  id v50 = objc_msgSend(v26, "initWithCapacity:", objc_msgSend(v27, "count"));

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v28 = [(SMCache *)self locationsDuringSession];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v67 objects:v84 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v68 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v67 + 1) + 8 * i);
        if ([(SMCache *)self shiftRequiredForLocation:v33])
        {
          dispatch_group_enter(group);
          v64[0] = MEMORY[0x263EF8330];
          v64[1] = 3221225472;
          v64[2] = __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_66;
          v64[3] = &unk_265499B48;
          id v65 = v50;
          __int16 v66 = group;
          [(SMCache *)self shiftLocation:v33 queue:queue withHandler:v64];
        }
        else
        {
          [v50 addObject:v33];
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v67 objects:v84 count:16];
    }
    while (v30);
  }

  id v34 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v35 = [(SMCache *)self workoutEvents];
  uint64_t v36 = objc_msgSend(v34, "initWithCapacity:", objc_msgSend(v35, "count"));

  long long v62 = 0u;
  long long v63 = 0u;
  long long v61 = 0u;
  long long v60 = 0u;
  long long v37 = [(SMCache *)self workoutEvents];
  uint64_t v38 = [v37 countByEnumeratingWithState:&v60 objects:v83 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v61;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v61 != v40) {
          objc_enumerationMutation(v37);
        }
        uint64_t v42 = *(void **)(*((void *)&v60 + 1) + 8 * j);
        uint64_t v43 = [v42 location];
        BOOL v44 = [(SMCache *)self shiftRequiredForLocation:v43];

        if (v44)
        {
          dispatch_group_enter(group);
          long long v45 = [v42 location];
          v57[0] = MEMORY[0x263EF8330];
          v57[1] = 3221225472;
          v57[2] = __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_67;
          v57[3] = &unk_265499B70;
          v57[4] = v42;
          id v58 = v36;
          long long v59 = group;
          [(SMCache *)self shiftLocation:v45 queue:queue withHandler:v57];
        }
        else
        {
          [v36 addObject:v42];
        }
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v60 objects:v83 count:16];
    }
    while (v39);
  }

  dispatch_group_leave(group);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_68;
  block[3] = &unk_265499B98;
  block[4] = self;
  id v54 = v50;
  id v55 = v36;
  id v56 = v49;
  id v46 = v49;
  id v47 = v36;
  id v48 = v50;
  dispatch_group_notify(group, queue, block);
}

void __41__SMCache_shiftLocationsOnQueue_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    [v3 latitude];
    uint64_t v6 = v5;
    [v3 longitude];
    int v8 = 134283777;
    uint64_t v9 = v6;
    __int16 v10 = 2049;
    uint64_t v11 = v7;
    _os_log_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_INFO, "shifted unlockLocation to %{private}f,%{private}f", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 32) setUnlockLocation:v3];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_61(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    [v3 latitude];
    uint64_t v6 = v5;
    [v3 longitude];
    int v8 = 134283777;
    uint64_t v9 = v6;
    __int16 v10 = 2049;
    uint64_t v11 = v7;
    _os_log_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_INFO, "shifted lockLocation to %{private}f,%{private}f", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 32) setLockLocation:v3];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_62(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    [v3 latitude];
    uint64_t v6 = v5;
    [v3 longitude];
    int v8 = 134283777;
    uint64_t v9 = v6;
    __int16 v10 = 2049;
    uint64_t v11 = v7;
    _os_log_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_INFO, "shifted mostRecentLocation to %{private}f,%{private}f", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 32) setMostRecentLocation:v3];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_63(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    [v3 latitude];
    uint64_t v6 = v5;
    [v3 longitude];
    int v8 = 134283777;
    uint64_t v9 = v6;
    __int16 v10 = 2049;
    uint64_t v11 = v7;
    _os_log_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_INFO, "shifted startingLocation to %{private}f,%{private}f", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 32) setStartingLocation:v3];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_64(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    [v3 latitude];
    uint64_t v6 = v5;
    [v3 longitude];
    int v8 = 134283777;
    uint64_t v9 = v6;
    __int16 v10 = 2049;
    uint64_t v11 = v7;
    _os_log_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_INFO, "shifted offWristLocation to %{private}f,%{private}f", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 32) setOffWristLocation:v3];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_65(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    [v3 latitude];
    uint64_t v6 = v5;
    [v3 longitude];
    int v8 = 134283777;
    uint64_t v9 = v6;
    __int16 v10 = 2049;
    uint64_t v11 = v7;
    _os_log_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_INFO, "shifted parkedCarLocation to %{private}f,%{private}f", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 32) setParkedCarLocation:v3];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_66(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    [v3 latitude];
    uint64_t v6 = v5;
    [v3 longitude];
    int v8 = 134283777;
    uint64_t v9 = v6;
    __int16 v10 = 2049;
    uint64_t v11 = v7;
    _os_log_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_INFO, "shifted locationDuringSession to %{private}f,%{private}f", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 32) addObject:v3];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_67(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    [v3 latitude];
    uint64_t v6 = v5;
    [v3 longitude];
    *(_DWORD *)buf = 134283777;
    uint64_t v20 = v6;
    __int16 v21 = 2049;
    uint64_t v22 = v7;
    _os_log_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_INFO, "shifted workoutEvent's location to %{private}f,%{private}f", buf, 0x16u);
  }

  BOOL v18 = [SMWorkoutEvent alloc];
  int v8 = [*(id *)(a1 + 32) identifier];
  uint64_t v9 = [*(id *)(a1 + 32) sessionIdentifier];
  uint64_t v10 = [*(id *)(a1 + 32) activityType];
  uint64_t v11 = [*(id *)(a1 + 32) locationType];
  uint64_t v12 = [*(id *)(a1 + 32) swimmingLocationType];
  uint64_t v13 = [*(id *)(a1 + 32) sessionState];
  char v14 = [*(id *)(a1 + 32) isResumedSessionState];
  BOOL v15 = [*(id *)(a1 + 32) date];
  LOBYTE(v17) = v14;
  id v16 = [(SMWorkoutEvent *)v18 initWithIdentifier:v8 sessionIdentifier:v9 location:v3 activityType:v10 locationType:v11 swimmingLocationType:v12 sessionState:v13 isResumedSessionState:v17 date:v15];

  [*(id *)(a1 + 40) addObject:v16];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __41__SMCache_shiftLocationsOnQueue_handler___block_invoke_68(uint64_t a1)
{
  [*(id *)(a1 + 32) setLocationsDuringSession:*(void *)(a1 + 40)];
  v2 = (void *)[*(id *)(a1 + 48) copy];
  [*(id *)(a1 + 32) setWorkoutEvents:v2];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v3();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMCache)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"deviceStatus"];
  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v22 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v7 = [v3 decodeObjectOfClasses:v22 forKey:@"locationsDuringSession"];
  int v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"unlockLocation"];
  __int16 v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"lockLocation"];
  BOOL v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"mostRecentLocation"];
  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"startingLocation"];
  uint64_t v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"offWristLocation"];
  uint64_t v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"parkedCar"];
  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"destinationMapItem"];
  uint64_t v12 = (void *)MEMORY[0x263EFFA08];
  uint64_t v13 = objc_opt_class();
  char v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  BOOL v15 = [v3 decodeObjectOfClasses:v14 forKey:@"workoutEvents"];

  uint64_t v20 = [(SMCache *)self initWithIdentifier:v23 deviceStatus:v4 locationsDuringSession:v7 unlockLocation:v8 lockLocation:v21 mostRecentLocation:v18 startingLocation:v9 offWristLocation:v17 parkedCarLocation:v10 destinationMapItem:v11 workoutEvents:v15];
  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SMCache *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  uint64_t v6 = [(SMCache *)self deviceStatus];
  [v4 encodeObject:v6 forKey:@"deviceStatus"];

  uint64_t v7 = [(SMCache *)self locationsDuringSession];
  [v4 encodeObject:v7 forKey:@"locationsDuringSession"];

  int v8 = [(SMCache *)self unlockLocation];
  [v4 encodeObject:v8 forKey:@"unlockLocation"];

  uint64_t v9 = [(SMCache *)self lockLocation];
  [v4 encodeObject:v9 forKey:@"lockLocation"];

  uint64_t v10 = [(SMCache *)self mostRecentLocation];
  [v4 encodeObject:v10 forKey:@"mostRecentLocation"];

  uint64_t v11 = [(SMCache *)self startingLocation];
  [v4 encodeObject:v11 forKey:@"startingLocation"];

  uint64_t v12 = [(SMCache *)self offWristLocation];
  [v4 encodeObject:v12 forKey:@"offWristLocation"];

  uint64_t v13 = [(SMCache *)self parkedCarLocation];
  [v4 encodeObject:v13 forKey:@"parkedCar"];

  char v14 = [(SMCache *)self destinationMapItem];
  [v4 encodeObject:v14 forKey:@"destinationMapItem"];

  id v15 = [(SMCache *)self workoutEvents];
  [v4 encodeObject:v15 forKey:@"workoutEvents"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v17 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  identifier = self->_identifier;
  id v6 = [(SMDeviceStatus *)self->_deviceStatus copyWithZone:a3];
  locationsDuringSession = self->_locationsDuringSession;
  unlockLocation = self->_unlockLocation;
  lockLocation = self->_lockLocation;
  mostRecentLocation = self->_mostRecentLocation;
  long long v16 = *(_OWORD *)&self->_startingLocation;
  parkedCarLocation = self->_parkedCarLocation;
  destinationMapItem = self->_destinationMapItem;
  uint64_t v13 = (void *)[(NSArray *)self->_workoutEvents copyWithZone:a3];
  char v14 = objc_msgSend(v17, "initWithIdentifier:deviceStatus:locationsDuringSession:unlockLocation:lockLocation:mostRecentLocation:startingLocation:offWristLocation:parkedCarLocation:destinationMapItem:workoutEvents:", identifier, v6, locationsDuringSession, unlockLocation, lockLocation, mostRecentLocation, v16, parkedCarLocation, destinationMapItem, v13);

  return v14;
}

- (id)description
{
  id v15 = (id)NSString;
  char v14 = [(SMCache *)self identifier];
  id v3 = [(SMCache *)self deviceStatus];
  uint64_t v17 = [(SMCache *)self locationsDuringSession];
  uint64_t v4 = [v17 count];
  uint64_t v5 = [(SMCache *)self unlockLocation];
  id v6 = [(SMCache *)self lockLocation];
  uint64_t v7 = [(SMCache *)self mostRecentLocation];
  int v8 = [(SMCache *)self startingLocation];
  uint64_t v9 = [(SMCache *)self offWristLocation];
  uint64_t v10 = [(SMCache *)self parkedCarLocation];
  uint64_t v11 = [(SMCache *)self destinationMapItem];
  uint64_t v12 = [(SMCache *)self workoutEvents];
  id v16 = [v15 stringWithFormat:@"identifier, %@, deviceStatus, %@, locationsDuringSession, %lu, unlockLocation %@, lockLocation %@, mostRecentLocation %@, startingLocation %@, offWristLocation %@, parkedCarLocation, %@, destinationMapItem, %@, workoutEvents, %lu", v14, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_msgSend(v12, "count")];

  return v16;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (SMDeviceStatus)deviceStatus
{
  return self->_deviceStatus;
}

- (void)setDeviceStatus:(id)a3
{
}

- (NSSet)locationsDuringSession
{
  return self->_locationsDuringSession;
}

- (void)setLocationsDuringSession:(id)a3
{
}

- (SMLocation)unlockLocation
{
  return self->_unlockLocation;
}

- (void)setUnlockLocation:(id)a3
{
}

- (SMLocation)lockLocation
{
  return self->_lockLocation;
}

- (void)setLockLocation:(id)a3
{
}

- (SMLocation)mostRecentLocation
{
  return self->_mostRecentLocation;
}

- (void)setMostRecentLocation:(id)a3
{
}

- (SMLocation)startingLocation
{
  return self->_startingLocation;
}

- (void)setStartingLocation:(id)a3
{
}

- (SMLocation)offWristLocation
{
  return self->_offWristLocation;
}

- (void)setOffWristLocation:(id)a3
{
}

- (SMLocation)parkedCarLocation
{
  return self->_parkedCarLocation;
}

- (void)setParkedCarLocation:(id)a3
{
}

- (NSData)destinationMapItem
{
  return self->_destinationMapItem;
}

- (void)setDestinationMapItem:(id)a3
{
}

- (NSArray)workoutEvents
{
  return self->_workoutEvents;
}

- (void)setWorkoutEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutEvents, 0);
  objc_storeStrong((id *)&self->_destinationMapItem, 0);
  objc_storeStrong((id *)&self->_parkedCarLocation, 0);
  objc_storeStrong((id *)&self->_offWristLocation, 0);
  objc_storeStrong((id *)&self->_startingLocation, 0);
  objc_storeStrong((id *)&self->_mostRecentLocation, 0);
  objc_storeStrong((id *)&self->_lockLocation, 0);
  objc_storeStrong((id *)&self->_unlockLocation, 0);
  objc_storeStrong((id *)&self->_locationsDuringSession, 0);
  objc_storeStrong((id *)&self->_deviceStatus, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_shifter, 0);
}

@end