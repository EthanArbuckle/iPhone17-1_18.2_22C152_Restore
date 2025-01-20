@interface RTStateModelLegacyController
+ (BOOL)archiveExists:(int64_t)a3;
+ (BOOL)stateModelLegacyExists;
+ (id)pathToArchiveFor:(int64_t)a3;
+ (id)pathToChecksumFor:(int64_t)a3;
+ (unint64_t)crcFromData:(id)a3;
- (BOOL)_migrateStateModelLegacy:(id)a3 error:(id *)a4;
- (BOOL)_removeStateModelForArchive:(int64_t)a3 error:(id *)a4;
- (BOOL)migrateStateModelLegacyWithError:(id *)a3;
- (BOOL)removeStateModelLegacyWithError:(id *)a3;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTMapServiceManager)mapServiceManager;
- (RTStateModelLegacyController)initWithLearnedLocationStore:(id)a3 mapServiceManager:(id)a4;
- (id)_getStateModelLegacyWithError:(id *)a3;
- (id)_unarchiveStateModelForArchive:(int64_t)a3 error:(id *)a4;
- (void)setLearnedLocationStore:(id)a3;
- (void)setMapServiceManager:(id)a3;
@end

@implementation RTStateModelLegacyController

+ (id)pathToArchiveFor:(int64_t)a3
{
  if (a3 == 1)
  {
    v5 = @"StateModel1.archive";
LABEL_5:
    v6 = [MEMORY[0x1E4F28CB8] pathInCacheDirectory:v5, v3];
    return v6;
  }
  if (a3 == 2)
  {
    v5 = @"StateModel2.archive";
    goto LABEL_5;
  }
  v6 = 0;
  return v6;
}

+ (id)pathToChecksumFor:(int64_t)a3
{
  if (a3 == 1)
  {
    v5 = @"StateModel1.checksum";
LABEL_5:
    v6 = [MEMORY[0x1E4F28CB8] pathInCacheDirectory:v5, v3];
    return v6;
  }
  if (a3 == 2)
  {
    v5 = @"StateModel2.checksum";
    goto LABEL_5;
  }
  v6 = 0;
  return v6;
}

+ (unint64_t)crcFromData:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  uLong v4 = crc32(0, 0, 0);
  id v5 = v3;
  v6 = (const Bytef *)[v5 bytes];
  uInt v7 = [v5 length];

  return crc32(v4, v6, v7);
}

+ (BOOL)archiveExists:(int64_t)a3
{
  uLong v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [(id)objc_opt_class() pathToArchiveFor:a3];
  int v6 = [v4 fileExistsAtPath:v5];

  if (!v6) {
    return 0;
  }
  uInt v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = [(id)objc_opt_class() pathToChecksumFor:a3];
  char v9 = [v7 fileExistsAtPath:v8];

  return v9;
}

+ (BOOL)stateModelLegacyExists
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [&unk_1F3453348 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(&unk_1F3453348);
        }
        if (objc_msgSend((id)objc_opt_class(), "archiveExists:", objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v5), "integerValue")))
        {
          LOBYTE(v2) = 1;
          return v2;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v2 = [&unk_1F3453348 countByEnumeratingWithState:&v7 objects:v11 count:16];
      uint64_t v3 = v2;
      if (v2) {
        continue;
      }
      break;
    }
  }
  return v2;
}

- (RTStateModelLegacyController)initWithLearnedLocationStore:(id)a3 mapServiceManager:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v9 = v8;
  if (!v7)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTStateModelLegacyController initWithLearnedLocationStore:mapServiceManager:]";
      __int16 v19 = 1024;
      int v20 = 174;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocationStore (in %s:%d)", buf, 0x12u);
    }

    if (v9) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (!v8)
  {
LABEL_9:
    v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTStateModelLegacyController initWithLearnedLocationStore:mapServiceManager:]";
      __int16 v19 = 1024;
      int v20 = 175;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapServiceManager (in %s:%d)", buf, 0x12u);
    }

LABEL_12:
    uint64_t v12 = 0;
    goto LABEL_13;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTStateModelLegacyController;
  long long v10 = [(RTStateModelLegacyController *)&v16 init];
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_learnedLocationStore, a3);
    objc_storeStrong(p_isa + 2, a4);
    xpc_activity_unregister("com.apple.routined.sequentialClusterIdentification");
  }
  self = p_isa;
  uint64_t v12 = self;
LABEL_13:

  return v12;
}

- (id)_unarchiveStateModelForArchive:(int64_t)a3 error:(id *)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  if (![(id)objc_opt_class() archiveExists:a3])
  {
    v11 = 0;
    goto LABEL_22;
  }
  v31 = [(id)objc_opt_class() pathToArchiveFor:a3];
  v35[0] = 0;
  v30 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v31 options:0 error:v35];
  id v6 = v35[0];
  if (!v6)
  {
    v28 = [(id)objc_opt_class() pathToChecksumFor:a3];
    id v34 = 0;
    v29 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v28 options:0 error:&v34];
    id v7 = v34;
    if (v29)
    {
      id v33 = 0;
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v29 error:&v33];
      id v13 = v33;
      v14 = [v12 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
      [v12 finishDecoding];
      if (v13)
      {
        v15 = (void *)MEMORY[0x1E4F28C58];
        objc_super v16 = [v13 userInfo];
        *a4 = [v15 errorWithDomain:@"RTStateModelLegacyControllerErrorDomain" code:2 userInfo:v16];
      }
    }
    else
    {
      v14 = 0;
    }
    uint64_t v17 = [(id)objc_opt_class() crcFromData:v30];
    if (v17 == [v14 unsignedIntegerValue])
    {
      id v32 = 0;
      v18 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v30 error:&v32];
      id v19 = v32;
      [v18 setClass:objc_opt_class() forClassName:@"RTStateModel"];
      v11 = [v18 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
      [v18 finishDecoding];
      if (v19)
      {
        int v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v21 = [v19 userInfo];
        *a4 = [v20 errorWithDomain:@"RTStateModelLegacyControllerErrorDomain" code:2 userInfo:v21];
      }
    }
    else
    {
      if (a4)
      {
        v22 = NSString;
        v23 = [NSNumber numberWithUnsignedLong:v17];
        v24 = [v22 stringWithFormat:@"actual stateModel crc, %@, %@, doesn't match expected crc, %@, %@", v31, v23, v28, v14];

        v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v36 = *MEMORY[0x1E4F28568];
        v37 = v24;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        *a4 = [v25 errorWithDomain:@"RTStateModelLegacyControllerErrorDomain" code:2 userInfo:v26];
      }
      v11 = 0;
    }

    goto LABEL_20;
  }
  id v7 = v6;
  if (a4)
  {
    id v8 = NSString;
    long long v9 = [v6 description];
    v28 = [v8 stringWithFormat:@"failed to init data with contents of file, %@, error, %@", v31, v9];

    long long v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    v39[0] = v28;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    [v10 errorWithDomain:@"RTStateModelLegacyControllerErrorDomain" code:1 userInfo:v29];
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

    goto LABEL_21;
  }
  v11 = 0;
LABEL_21:

LABEL_22:

  return v11;
}

- (id)_getStateModelLegacyWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v5 = [&unk_1F3453360 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v27;
    do
    {
      uint64_t v9 = 0;
      long long v10 = v7;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(&unk_1F3453360);
        }
        uint64_t v11 = [*(id *)(*((void *)&v26 + 1) + 8 * v9) integerValue];
        id v25 = 0;
        uint64_t v12 = [(RTStateModelLegacyController *)self _unarchiveStateModelForArchive:v11 error:&v25];
        id v13 = v25;
        if (v13) {
          [v4 addObject:v13];
        }
        if (v12)
        {
          v14 = [MEMORY[0x1E4F1CA48] array];
          v15 = [v12 stateModelLut];
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __62__RTStateModelLegacyController__getStateModelLegacyWithError___block_invoke;
          v23[3] = &unk_1E6B9B0F0;
          id v24 = v14;
          id v16 = v14;
          [v15 enumerateKeysAndObjectsUsingBlock:v23];

          uint64_t v17 = [v12 stateModelLut];
          [v17 removeObjectsForKeys:v16];
        }
        uint64_t v18 = [v10 version];
        if (v18 >= [v12 version]) {
          id v19 = v10;
        }
        else {
          id v19 = v12;
        }
        id v7 = v19;

        ++v9;
        long long v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [&unk_1F3453360 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }
  if (a3)
  {
    int v20 = _RTSafeArray();
    _RTMultiErrorCreate();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void __62__RTStateModelLegacyController__getStateModelLegacyWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  uint64_t v5 = [a3 uniqueId];

  if (!v5) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

- (BOOL)_removeStateModelForArchive:(int64_t)a3 error:(id *)a4
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v6 = [(id)objc_opt_class() pathToArchiveFor:a3];
  v32[0] = v6;
  id v7 = [(id)objc_opt_class() pathToChecksumFor:a3];
  v32[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v24;
    *(void *)&long long v10 = 138412546;
    long long v20 = v10;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * v13);
        v15 = [MEMORY[0x1E4F28CB8] defaultManager:v20];
        id v22 = 0;
        char v16 = [v15 removeItemAtPath:v14 error:&v22];
        id v17 = v22;

        if (a4 && (v16 & 1) == 0) {
          *a4 = v17;
        }
        uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v20;
          uint64_t v28 = v14;
          __int16 v29 = 2112;
          id v30 = v17;
          _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "removed item at path, %@, error, %@", buf, 0x16u);
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v11);
  }

  return 1;
}

- (BOOL)removeStateModelLegacyWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [&unk_1F3453378 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(&unk_1F3453378);
        }
        uint64_t v9 = [*(id *)(*((void *)&v15 + 1) + 8 * v8) integerValue];
        id v14 = 0;
        BOOL v10 = [(RTStateModelLegacyController *)self _removeStateModelForArchive:v9 error:&v14];
        id v11 = v14;
        uint64_t v12 = v11;
        if (a3 && !v10) {
          *a3 = v11;
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [&unk_1F3453378 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  return 1;
}

- (BOOL)_migrateStateModelLegacy:(id)a3 error:(id *)a4
{
  v312[1] = *MEMORY[0x1E4F143B8];
  id v221 = a3;
  v227 = [MEMORY[0x1E4F1CA60] dictionary];
  v238 = [MEMORY[0x1E4F1CA60] dictionary];
  v222 = [MEMORY[0x1E4F1CA48] array];
  v256 = [MEMORY[0x1E4F1C9C8] date];
  v228 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v298 = 0u;
  long long v299 = 0u;
  long long v296 = 0u;
  long long v297 = 0u;
  uint64_t v4 = [v221 stateModelLut];
  id obj = [v4 allValues];

  uint64_t v252 = [obj countByEnumeratingWithState:&v296 objects:v311 count:16];
  if (v252)
  {
    uint64_t v248 = *(void *)v297;
    uint64_t v223 = *MEMORY[0x1E4F5CFE8];
    id v224 = (id)*MEMORY[0x1E4F28568];
    do
    {
      id v257 = 0;
      do
      {
        if (*(void *)v297 != v248) {
          objc_enumerationMutation(obj);
        }
        v261 = *(void **)(*((void *)&v296 + 1) + 8 * (void)v257);
        uint64_t v5 = [v261 uniqueId];
        BOOL v6 = v5 == 0;

        if (v6)
        {
          v56 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v261;
            _os_log_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_INFO, "oneState missing identifier, %@", (uint8_t *)&buf, 0xCu);
          }
        }
        else
        {
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v307 = 0x3032000000;
          v308 = __Block_byref_object_copy__134;
          v309 = __Block_byref_object_dispose__134;
          id v310 = 0;
          uint64_t v7 = [v261 stateDepiction];
          uint64_t v8 = [v7 geoMapItem];

          if (v8)
          {
            mapServiceManager = self->_mapServiceManager;
            BOOL v10 = [MEMORY[0x1E4F29128] UUID];
            id v11 = [v261 stateDepiction];
            uint64_t v12 = [v11 geoMapItem];
            uint64_t v13 = [v261 stateDepiction];
            unint64_t v14 = +[RTLearnedLocationOfInterest mapItemSourceFromGeoMapItemSource:](RTLearnedLocationOfInterest, "mapItemSourceFromGeoMapItemSource:", [v13 mapItemSource]);
            long long v15 = [v261 stateDepiction];
            long long v16 = [v15 geocodeDate];
            long long v17 = v16;
            if (!v16)
            {
              v232 = [MEMORY[0x1E4F1C9C8] date];
              long long v17 = v232;
            }
            id v295 = 0;
            uint64_t v18 = [(RTMapServiceManager *)mapServiceManager mapItemWithIdentifier:v10 geoMapItem:v12 source:v14 creationDate:v17 error:&v295];
            id v19 = v295;
            uint64_t v20 = *(void **)(*((void *)&buf + 1) + 40);
            *(void *)(*((void *)&buf + 1) + 40) = v18;

            if (!v16) {
          }
            }
          if (*(void *)(*((void *)&buf + 1) + 40)) {
            goto LABEL_26;
          }
          id v21 = objc_alloc(MEMORY[0x1E4F5CE00]);
          id v22 = [v261 stateDepiction];
          long long v23 = [v22 location];
          [v23 Latitude_deg];
          double v25 = v24;
          long long v26 = [v261 stateDepiction];
          long long v27 = [v26 location];
          [v27 Longitude_deg];
          double v29 = v28;
          id v30 = [v261 stateDepiction];
          uint64_t v31 = [v30 location];
          [v31 uncertainty_m];
          id v244 = (id)[v21 initWithLatitude:v256 longitude:v25 horizontalUncertainty:v29 date:v32];

          dispatch_semaphore_t v33 = dispatch_semaphore_create(0);
          id v34 = objc_alloc(MEMORY[0x1E4F5CE48]);
          v35 = (objc_class *)objc_opt_class();
          uint64_t v36 = NSStringFromClass(v35);
          v37 = (void *)[v34 initWithUseBackgroundTraits:1 analyticsIdentifier:v36];

          uint64_t v38 = [(RTStateModelLegacyController *)self mapServiceManager];
          v292[0] = MEMORY[0x1E4F143A8];
          v292[1] = 3221225472;
          v292[2] = __63__RTStateModelLegacyController__migrateStateModelLegacy_error___block_invoke;
          v292[3] = &unk_1E6B90700;
          p_long long buf = &buf;
          v39 = v33;
          v293 = v39;
          [v38 fetchMapItemsFromLocation:v244 options:v37 handler:v292];

          v40 = v39;
          v41 = [MEMORY[0x1E4F1C9C8] now];
          dispatch_time_t v42 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(v40, v42)) {
            goto LABEL_22;
          }
          v43 = [MEMORY[0x1E4F1C9C8] now];
          [v43 timeIntervalSinceDate:v41];
          double v45 = v44;
          v46 = objc_opt_new();
          v47 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_144_0];
          v48 = [MEMORY[0x1E4F29060] callStackSymbols];
          v49 = [v48 filteredArrayUsingPredicate:v47];
          v50 = [v49 firstObject];

          [v46 submitToCoreAnalytics:v50 type:1 duration:v45];
          v51 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v305 = 0;
            _os_log_fault_impl(&dword_1D9BFA000, v51, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v305, 2u);
          }

          v52 = (void *)MEMORY[0x1E4F28C58];
          v312[0] = v224;
          *(void *)v305 = @"semaphore wait timeout";
          v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v305 forKeys:v312 count:1];
          v54 = [v52 errorWithDomain:v223 code:15 userInfo:v53];

          if (v54)
          {
            id v55 = v54;
          }
          else
          {
LABEL_22:
            id v55 = 0;
          }

          id v57 = v55;
          if (!*(void *)(*((void *)&buf + 1) + 40))
          {
            id v58 = objc_alloc(MEMORY[0x1E4F64828]);
            [v244 latitude];
            double v60 = v59;
            [v244 longitude];
            v62 = (void *)[v58 initWithLatitude:0 longitude:v60 addressDictionary:v61];
            v63 = [MEMORY[0x1E4F646E0] mapItemStorageForPlace:v62];
            v64 = self->_mapServiceManager;
            v65 = [MEMORY[0x1E4F29128] UUID];
            v66 = [v261 stateDepiction];
            unint64_t v67 = +[RTLearnedLocationOfInterest mapItemSourceFromGeoMapItemSource:](RTLearnedLocationOfInterest, "mapItemSourceFromGeoMapItemSource:", [v66 mapItemSource]);
            id v291 = 0;
            uint64_t v68 = [(RTMapServiceManager *)v64 mapItemWithIdentifier:v65 geoMapItem:v63 source:v67 creationDate:v256 error:&v291];
            id v69 = v291;
            v70 = *(void **)(*((void *)&buf + 1) + 40);
            *(void *)(*((void *)&buf + 1) + 40) = v68;
          }
          if (*(void *)(*((void *)&buf + 1) + 40))
          {
LABEL_26:
            v71 = [v256 dateByAddingTimeInterval:4838400.0];
            v72 = [RTLearnedPlace alloc];
            v73 = [v261 uniqueId];
            v74 = [v261 stateDepiction];
            unint64_t v75 = +[RTLearnedPlace placeTypeFromType:](RTLearnedPlace, "placeTypeFromType:", [v74 type]);
            v76 = [v261 stateDepiction];
            unint64_t v77 = +[RTLearnedPlace placeTypeSourceFromTypeSource:](RTLearnedPlace, "placeTypeSourceFromTypeSource:", [v76 typeSource]);
            uint64_t v78 = *(void *)(*((void *)&buf + 1) + 40);
            v79 = [v261 stateDepiction];
            v80 = [v79 customLabel];
            v81 = [(RTLearnedPlace *)v72 initWithIdentifier:v73 type:v75 typeSource:v77 mapItem:v78 customLabel:v80 creationDate:v256 expirationDate:v71];

            if (v81)
            {
              v82 = [(RTLearnedPlace *)v81 identifier];
              [v227 setObject:v81 forKey:v82];

              v83 = [v261 uniqueId];
              [v228 setObject:v81 forKey:v83];
            }
          }
          else
          {
            v71 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
            if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v305 = 138412290;
              *(void *)&v305[4] = v261;
              _os_log_impl(&dword_1D9BFA000, v71, OS_LOG_TYPE_INFO, "unable to migrate legacy geoMapItem, %@", v305, 0xCu);
            }
          }

          _Block_object_dispose(&buf, 8);
        }
        id v257 = (char *)v257 + 1;
      }
      while ((id)v252 != v257);
      uint64_t v84 = [obj countByEnumeratingWithState:&v296 objects:v311 count:16];
      uint64_t v252 = v84;
    }
    while (v84);
  }

  v85 = [MEMORY[0x1E4F1CA80] set];
  long long v289 = 0u;
  long long v290 = 0u;
  long long v287 = 0u;
  long long v288 = 0u;
  v86 = [v221 stateModelLut];
  id v258 = [v86 allValues];

  uint64_t v87 = [v258 countByEnumeratingWithState:&v287 objects:v304 count:16];
  if (v87)
  {
    uint64_t v262 = *(void *)v288;
    do
    {
      for (uint64_t i = 0; i != v87; ++i)
      {
        if (*(void *)v288 != v262) {
          objc_enumerationMutation(v258);
        }
        v89 = *(void **)(*((void *)&v287 + 1) + 8 * i);
        v90 = [v89 uniqueId];
        BOOL v91 = v90 == 0;

        if (v91)
        {
          v94 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
          if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v89;
            _os_log_impl(&dword_1D9BFA000, v94, OS_LOG_TYPE_INFO, "oneState missing identifier, %@", (uint8_t *)&buf, 0xCu);
          }
        }
        else
        {
          v92 = [v89 stateDepiction];
          v93 = [v92 getAllOneVisits];

          long long v285 = 0u;
          long long v286 = 0u;
          long long v283 = 0u;
          long long v284 = 0u;
          v94 = v93;
          uint64_t v95 = [v94 countByEnumeratingWithState:&v283 objects:v303 count:16];
          if (v95)
          {
            uint64_t v96 = *(void *)v284;
            do
            {
              for (uint64_t j = 0; j != v95; ++j)
              {
                if (*(void *)v284 != v96) {
                  objc_enumerationMutation(v94);
                }
                v98 = [[RTMigrationHelperOneStateAndEntryExitPair alloc] initWithOneState:v89 entryExit:*(void *)(*((void *)&v283 + 1) + 8 * j)];
                [v85 addObject:v98];
              }
              uint64_t v95 = [v94 countByEnumeratingWithState:&v283 objects:v303 count:16];
            }
            while (v95);
          }
        }
      }
      uint64_t v87 = [v258 countByEnumeratingWithState:&v287 objects:v304 count:16];
    }
    while (v87);
  }

  v220 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"self.entryExit.exit_s" ascending:1];
  v302 = v220;
  v219 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v302 count:1];
  long long v281 = 0u;
  long long v282 = 0u;
  long long v279 = 0u;
  long long v280 = 0u;
  v99 = [v85 allObjects];
  id v225 = [v99 sortedArrayUsingDescriptors:v219];

  uint64_t v233 = [v225 countByEnumeratingWithState:&v279 objects:v301 count:16];
  if (v233)
  {
    v231 = 0;
    uint64_t v229 = *(void *)v280;
    do
    {
      uint64_t v100 = 0;
      do
      {
        if (*(void *)v280 != v229)
        {
          uint64_t v101 = v100;
          objc_enumerationMutation(v225);
          uint64_t v100 = v101;
        }
        uint64_t v253 = v100;
        v102 = *(void **)(*((void *)&v279 + 1) + 8 * v100);
        v263 = [MEMORY[0x1E4F29128] UUID];
        v103 = [v102 oneState];
        v104 = [v103 uniqueId];
        BOOL v105 = v104 == 0;

        if (v105)
        {
          v156 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
          if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v102;
            _os_log_impl(&dword_1D9BFA000, v156, OS_LOG_TYPE_INFO, "oneState missing identifier, %@", (uint8_t *)&buf, 0xCu);
          }
        }
        else
        {
          v106 = [v102 oneState];
          v107 = [v106 stateDepiction];
          unint64_t v108 = [v107 numOfDataPts];
          v109 = [v102 oneState];
          v110 = [v109 stateDepiction];
          unint64_t v111 = [v110 getNumOfVisitsOverall];

          uint64_t v112 = v108 / v111;
          if (v108 / v111 <= 1) {
            uint64_t v112 = 1;
          }
          uint64_t v239 = v112;
          v113 = (void *)MEMORY[0x1E4F1C9C8];
          v114 = [v102 entryExit];
          [v114 entry_s];
          uint64_t v242 = [v113 dateWithTimeIntervalSinceReferenceDate:x0];

          v115 = (void *)MEMORY[0x1E4F1C9C8];
          v116 = [v102 entryExit];
          [v116 exit_s];
          [v115 dateWithTimeIntervalSinceReferenceDate:];
          id v259 = (id)objc_claimAutoreleasedReturnValue();

          objb = [RTLearnedLocation alloc];
          id v117 = objc_alloc(MEMORY[0x1E4F5CE00]);
          v249 = [v102 oneState];
          id v245 = [v249 stateDepiction];
          v118 = [v245 location];
          [v118 Latitude_deg];
          double v120 = v119;
          v121 = [v102 oneState];
          v122 = [v121 stateDepiction];
          v123 = [v122 location];
          [v123 Longitude_deg];
          double v125 = v124;
          v126 = [v102 oneState];
          v127 = [v126 stateDepiction];
          v128 = [v127 location];
          [v128 uncertainty_m];
          v130 = (void *)[v117 initWithLatitude:0 longitude:v120 horizontalUncertainty:v125 date:v129];
          v240 = [(RTLearnedLocation *)objb initWithLocation:v130 dataPointCount:v239 confidence:1.0];

          v131 = [v102 oneState];
          v132 = [v131 stateDepiction];
          unint64_t v133 = [v132 getNumOfVisitsOverall];

          v134 = [v259 dateByAddingTimeInterval:dbl_1DA0FF860[v133 > 1]];
          v135 = [[RTLearnedVisit alloc] initWithIdentifier:v263 location:v240 entryDate:v242 exitDate:v259 creationDate:v256 expirationDate:v134];
          if (v135)
          {
            v136 = [v102 oneState];
            v137 = [v136 uniqueId];
            v138 = [v228 objectForKey:v137];

            if (v138)
            {
              v139 = [v138 mapItem];
              -[RTLearnedVisit setPlaceSource:](v135, "setPlaceSource:", [v139 source]);

              v140 = [v138 identifier];
              v141 = [v238 objectForKey:v140];
              BOOL v142 = v141 == 0;

              if (v142)
              {
                v143 = [MEMORY[0x1E4F1CA48] array];
                v144 = [v138 identifier];
                [v238 setObject:v143 forKey:v144];
              }
              v145 = [v138 identifier];
              v146 = [v238 objectForKey:v145];
              [v146 addObject:v135];

              if (v231)
              {
                v147 = [MEMORY[0x1E4F29128] UUID];
                v148 = [(RTLearnedVisit *)v231 exitDate];
                v149 = [(RTLearnedVisit *)v135 entryDate];
                v250 = v231;
                v150 = v135;
                if (v148 && v149)
                {
                  v246 = v150;
                  id obja = v134;
                  v151 = [RTLearnedTransition alloc];
                  v152 = [(RTLearnedVisit *)v250 identifier];
                  v153 = [(RTLearnedVisit *)v246 identifier];
                  v154 = [(RTLearnedTransition *)v151 initWithIdentifier:v147 startDate:v148 stopDate:v149 visitIdentifierOrigin:v152 visitIdentifierDestination:v153 creationDate:v256 expirationDate:obja predominantMotionActivityType:0];

                  if (v154) {
                    [v222 addObject:v154];
                  }

                  v150 = v246;
                }
              }
              v155 = v135;

              v231 = v155;
            }
          }
          v156 = v242;
        }

        uint64_t v100 = v253 + 1;
      }
      while (v233 != v253 + 1);
      uint64_t v233 = [v225 countByEnumeratingWithState:&v279 objects:v301 count:16];
    }
    while (v233);
  }
  else
  {
    v231 = 0;
  }

  id v226 = [MEMORY[0x1E4F1CA48] array];
  dispatch_semaphore_t v241 = dispatch_semaphore_create(0);
  long long v275 = 0u;
  long long v276 = 0u;
  long long v277 = 0u;
  long long v278 = 0u;
  id v260 = v227;
  id v247 = (id)[v260 countByEnumeratingWithState:&v275 objects:v300 count:16];
  if (v247)
  {
    v264 = 0;
    uint64_t v243 = *(void *)v276;
    uint64_t v230 = *MEMORY[0x1E4F5CFE8];
    uint64_t v234 = *MEMORY[0x1E4F28568];
    do
    {
      for (k = 0; k != v247; k = (char *)k + 1)
      {
        if (*(void *)v276 != v243) {
          objc_enumerationMutation(v260);
        }
        uint64_t v158 = *(void *)(*((void *)&v275 + 1) + 8 * (void)k);
        v159 = [v260 objectForKeyedSubscript:v158];
        v160 = [v238 objectForKey:v158];
        if ([v160 count])
        {
          v161 = [(RTStateModelLegacyController *)self learnedLocationStore];
          v271[0] = MEMORY[0x1E4F143A8];
          v271[1] = 3221225472;
          v271[2] = __63__RTStateModelLegacyController__migrateStateModelLegacy_error___block_invoke_93;
          v271[3] = &unk_1E6B96790;
          id v162 = v160;
          id v272 = v162;
          id v163 = v159;
          id v273 = v163;
          v164 = v241;
          v274 = v164;
          [v161 storeVisits:v162 place:v163 handler:v271];

          v165 = v164;
          v166 = [MEMORY[0x1E4F1C9C8] now];
          dispatch_time_t v167 = dispatch_time(0, 3600000000000);
          id v168 = v264;
          if (dispatch_semaphore_wait(v165, v167))
          {
            v254 = [MEMORY[0x1E4F1C9C8] now];
            [v254 timeIntervalSinceDate:v166];
            double v170 = v169;
            v251 = objc_opt_new();
            v171 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_144_0];
            v172 = [MEMORY[0x1E4F29060] callStackSymbols];
            v173 = [v172 filteredArrayUsingPredicate:v171];
            v174 = [v173 firstObject];

            [v251 submitToCoreAnalytics:v174 type:1 duration:v170];
            v175 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v175, OS_LOG_TYPE_FAULT))
            {
              LOWORD(buf) = 0;
              _os_log_fault_impl(&dword_1D9BFA000, v175, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", (uint8_t *)&buf, 2u);
            }

            v176 = (void *)MEMORY[0x1E4F28C58];
            *(void *)v305 = v234;
            *(void *)&long long buf = @"semaphore wait timeout";
            v177 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:v305 count:1];
            v178 = [v176 errorWithDomain:v230 code:15 userInfo:v177];

            id v168 = v264;
            if (v178)
            {
              id v168 = v178;
            }
          }

          id v179 = v168;
          v264 = v179;
        }
        else
        {
          [v226 addObject:v159];
        }
      }
      id v247 = (id)[v260 countByEnumeratingWithState:&v275 objects:v300 count:16];
    }
    while (v247);
  }
  else
  {
    v264 = 0;
  }

  if ([v226 count])
  {
    v180 = [(RTStateModelLegacyController *)self learnedLocationStore];
    v268[0] = MEMORY[0x1E4F143A8];
    v268[1] = 3221225472;
    v268[2] = __63__RTStateModelLegacyController__migrateStateModelLegacy_error___block_invoke_95;
    v268[3] = &unk_1E6B93748;
    id v269 = v226;
    v181 = v241;
    v270 = v181;
    [v180 storePlaces:v269 handler:v268];

    v182 = v181;
    v183 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v184 = dispatch_time(0, 3600000000000);
    id v185 = v264;
    if (dispatch_semaphore_wait(v182, v184))
    {
      v186 = [MEMORY[0x1E4F1C9C8] now];
      [v186 timeIntervalSinceDate:v183];
      double v188 = v187;
      v189 = objc_opt_new();
      v190 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_144_0];
      v191 = [MEMORY[0x1E4F29060] callStackSymbols];
      v192 = [v191 filteredArrayUsingPredicate:v190];
      v193 = [v192 firstObject];

      [v189 submitToCoreAnalytics:v193 type:1 duration:v188];
      v194 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v194, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf) = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v194, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", (uint8_t *)&buf, 2u);
      }

      v195 = (void *)MEMORY[0x1E4F28C58];
      *(void *)v305 = *MEMORY[0x1E4F28568];
      *(void *)&long long buf = @"semaphore wait timeout";
      v196 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:v305 count:1];
      v197 = [v195 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v196];

      id v185 = v264;
      if (v197)
      {
        id v185 = v197;
      }
    }

    id v198 = v185;
    v264 = v198;
  }
  if ([v222 count])
  {
    v199 = [(RTStateModelLegacyController *)self learnedLocationStore];
    v265[0] = MEMORY[0x1E4F143A8];
    v265[1] = 3221225472;
    v265[2] = __63__RTStateModelLegacyController__migrateStateModelLegacy_error___block_invoke_96;
    v265[3] = &unk_1E6B93748;
    id v266 = v222;
    v200 = v241;
    v267 = v200;
    [v199 storeTransitions:v266 handler:v265];

    v201 = v200;
    v202 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v203 = dispatch_time(0, 3600000000000);
    id v204 = v264;
    if (dispatch_semaphore_wait(v201, v203))
    {
      v205 = [MEMORY[0x1E4F1C9C8] now];
      [v205 timeIntervalSinceDate:v202];
      double v207 = v206;
      v208 = objc_opt_new();
      v209 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_144_0];
      v210 = [MEMORY[0x1E4F29060] callStackSymbols];
      v211 = [v210 filteredArrayUsingPredicate:v209];
      v212 = [v211 firstObject];

      [v208 submitToCoreAnalytics:v212 type:1 duration:v207];
      v213 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v213, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf) = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v213, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", (uint8_t *)&buf, 2u);
      }

      v214 = (void *)MEMORY[0x1E4F28C58];
      *(void *)v305 = *MEMORY[0x1E4F28568];
      *(void *)&long long buf = @"semaphore wait timeout";
      v215 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:v305 count:1];
      v216 = [v214 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v215];

      id v204 = v264;
      if (v216)
      {
        id v204 = v216;
      }
    }

    id v217 = v204;
    v264 = v217;
  }

  return 1;
}

intptr_t __63__RTStateModelLegacyController__migrateStateModelLegacy_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 firstObject];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  BOOL v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

void __63__RTStateModelLegacyController__migrateStateModelLegacy_error___block_invoke_93(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [*(id *)(a1 + 32) count];
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 134218498;
    uint64_t v23 = v5;
    __int16 v24 = 2112;
    uint64_t v25 = v6;
    __int16 v26 = 2112;
    id v27 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "stored %lu visits to place, %@, error, %@", buf, 0x20u);
  }
  long long v15 = v3;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v16 = a1;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        unint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          ++v10;
          *(_DWORD *)long long buf = 134218242;
          uint64_t v23 = v10;
          __int16 v24 = 2112;
          uint64_t v25 = v13;
          _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "visit %lu, %@", buf, 0x16u);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v16 + 48));
}

void __63__RTStateModelLegacyController__migrateStateModelLegacy_error___block_invoke_95(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [*(id *)(a1 + 32) count];
    *(_DWORD *)long long buf = 134218242;
    uint64_t v22 = v5;
    __int16 v23 = 2112;
    id v24 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "stored %lu places with no visits, error %@", buf, 0x16u);
  }
  unint64_t v14 = v3;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v15 = a1;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          ++v9;
          *(_DWORD *)long long buf = 134218242;
          uint64_t v22 = v9;
          __int16 v23 = 2112;
          id v24 = v12;
          _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "place %lu, %@", buf, 0x16u);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v15 + 40));
}

void __63__RTStateModelLegacyController__migrateStateModelLegacy_error___block_invoke_96(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [*(id *)(a1 + 32) count];
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "stored %lu transitions, error %@", (uint8_t *)&v6, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)migrateStateModelLegacyWithError:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  uint64_t v5 = [(RTStateModelLegacyController *)self _getStateModelLegacyWithError:&v12];
  id v6 = v12;
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    unint64_t v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "getstateModel legacy, %@, error, %@", buf, 0x16u);
  }

  __int16 v8 = [v5 stateModelLut];
  id v9 = [v8 allValues];
  [v9 enumerateObjectsUsingBlock:&__block_literal_global_104];

  if (v6)
  {
    BOOL v10 = 0;
    if (a3) {
      *a3 = v6;
    }
  }
  else
  {
    BOOL v10 = [(RTStateModelLegacyController *)self _migrateStateModelLegacy:v5 error:a3];
  }

  return v10;
}

void __65__RTStateModelLegacyController_migrateStateModelLegacyWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 134218242;
    uint64_t v9 = a3 + 1;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "state %lu, %@", (uint8_t *)&v8, 0x16u);
  }

  id v6 = [v4 stateDepiction];
  uint64_t v7 = [v6 getAllOneVisits];
  [v7 enumerateObjectsUsingBlock:&__block_literal_global_101];
}

void __65__RTStateModelLegacyController_migrateStateModelLegacyWithError___block_invoke_98(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a3 + 1;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "visit %lu, %@", (uint8_t *)&v6, 0x16u);
  }
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (void)setLearnedLocationStore:(id)a3
{
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapServiceManager, 0);

  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
}

@end