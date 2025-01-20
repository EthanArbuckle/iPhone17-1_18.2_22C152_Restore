@interface RTLearnedLocationReconcilerPerDevice
- (OS_dispatch_queue)queue;
- (RTLearnedLocationReconcilerPerDevice)init;
- (RTLearnedLocationReconcilerPerDevice)initWithPersistenceManager:(id)a3;
- (RTPersistenceManager)persistenceManager;
- (id)_sortDescriptorForReconciliation;
- (void)collapseReconciledVisitsToLocationsOfInterest:(id)a3 context:(id)a4 handler:(id)a5;
- (void)performReconciliationWithHandler:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation RTLearnedLocationReconcilerPerDevice

- (RTLearnedLocationReconcilerPerDevice)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPersistenceManager_);
}

- (RTLearnedLocationReconcilerPerDevice)initWithPersistenceManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)RTLearnedLocationReconcilerPerDevice;
    v6 = [(RTLearnedLocationReconcilerPerDevice *)&v17 init];
    v7 = v6;
    if (v6)
    {
      v8 = v6;
      v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = (const char *)[(RTLearnedLocationReconcilerPerDevice *)v8 UTF8String];
      }
      else
      {
        id v13 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v8];
        v10 = (const char *)[v13 UTF8String];
      }
      dispatch_queue_t v14 = dispatch_queue_create(v10, v9);

      queue = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v14;

      objc_storeStrong((id *)&v8->_persistenceManager, a3);
    }
    self = v7;
    v12 = self;
  }
  else
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceManager", buf, 2u);
    }

    v12 = 0;
  }

  return v12;
}

- (id)_sortDescriptorForReconciliation
{
  return (id)[MEMORY[0x1E4F29008] sortDescriptorWithKey:@"deviceClass" ascending:1 comparator:&__block_literal_global_120];
}

uint64_t __72__RTLearnedLocationReconcilerPerDevice__sortDescriptorForReconciliation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 isEqualToString:@"iPhone"])
  {
    uint64_t v6 = [v5 isEqualToString:@"iPhone"] - 1;
    goto LABEL_20;
  }
  if ([v4 isEqualToString:@"Watch"])
  {
    if (([v5 isEqualToString:@"Watch"] & 1) == 0)
    {
      v7 = @"iPhone";
      goto LABEL_17;
    }
LABEL_12:
    uint64_t v6 = 0;
    goto LABEL_20;
  }
  if ([v4 isEqualToString:@"iPad"])
  {
    if ([v5 isEqualToString:@"iPad"]) {
      goto LABEL_12;
    }
    if (([v5 isEqualToString:@"iPhone"] & 1) == 0)
    {
      v7 = @"Watch";
      goto LABEL_17;
    }
LABEL_15:
    uint64_t v6 = 1;
    goto LABEL_20;
  }
  if (![v4 isEqualToString:@"Mac"]) {
    goto LABEL_15;
  }
  if ([v5 isEqualToString:@"Mac"]) {
    goto LABEL_12;
  }
  if (([v5 isEqualToString:@"iPhone"] & 1) != 0
    || ([v5 isEqualToString:@"Watch"] & 1) != 0)
  {
    goto LABEL_15;
  }
  v7 = @"iPad";
LABEL_17:
  if ([v5 isEqualToString:v7]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = -1;
  }
LABEL_20:

  return v6;
}

- (void)performReconciliationWithHandler:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke;
  block[3] = &unk_1E6B921E0;
  block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_2;
  v6[3] = &unk_1E6B91060;
  v6[4] = v2;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 createManagedObjectContext:v6];
}

void __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_3;
  v8[3] = &unk_1E6B90C40;
  id v4 = (void *)a1[5];
  v8[4] = a1[4];
  id v9 = v3;
  id v5 = v4;
  uint64_t v6 = a1[6];
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = v3;
  [v7 performBlock:v8];
}

void __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_3(uint64_t a1)
{
  v128[3] = *MEMORY[0x1E4F143B8];
  v83 = objc_opt_new();
  v78 = +[RTDeviceMO fetchRequest];
  v76 = [*(id *)(a1 + 32) _sortDescriptorForReconciliation];
  v1 = (void *)MEMORY[0x1E4F29008];
  uint64_t v2 = [NSString stringWithFormat:@"%@.@count", @"visits"];
  v74 = [v1 sortDescriptorWithKey:v2 ascending:0];

  [v78 setFetchBatchSize:1];
  id v3 = *(void **)(a1 + 40);
  id v114 = 0;
  v75 = [v3 executeFetchRequest:v78 error:&v114];
  id v77 = v114;
  if (v77)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v77);
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) currentDevice];
    uint64_t v6 = [v5 deviceClass];
    int v73 = [v6 isEqualToString:@"iPhone"];

    id v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
      if (v73) {
        id v9 = @"YES";
      }
      else {
        id v9 = @"NO";
      }
      id v10 = [*(id *)(a1 + 40) currentDevice];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v123 = v10;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, prioritizeCurrentDevice, %@, current device, %@", buf, 0x20u);
    }
    if (v73)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F29008];
      v112[0] = MEMORY[0x1E4F143A8];
      v112[1] = 3221225472;
      v112[2] = __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_34;
      v112[3] = &unk_1E6B9C9C8;
      id v113 = *(id *)(a1 + 40);
      v12 = [v11 sortDescriptorWithKey:@"identifier" ascending:1 comparator:v112];
      v128[0] = v76;
      v128[1] = v12;
      v128[2] = v74;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v128 count:3];
      dispatch_queue_t v14 = [v75 sortedArrayUsingDescriptors:v13];

      v15 = v113;
    }
    else
    {
      v127[0] = v76;
      v127[1] = v74;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v127 count:2];
      dispatch_queue_t v14 = [v75 sortedArrayUsingDescriptors:v15];
    }

    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    obuint64_t j = v14;
    uint64_t v82 = [obj countByEnumeratingWithState:&v108 objects:v126 count:16];
    if (v82)
    {
      uint64_t v84 = 0;
      uint64_t v81 = *(void *)v109;
      do
      {
        for (uint64_t i = 0; i != v82; ++i)
        {
          if (*(void *)v109 != v81) {
            objc_enumerationMutation(obj);
          }
          objc_super v17 = *(void **)(*((void *)&v108 + 1) + 8 * i);
          v92 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != NULL", @"place.mapItem"];
          v90 = +[RTCloudManagedObject notTombstonedPredicate];
          v18 = (void *)MEMORY[0x1E4F28BA0];
          v125[0] = v92;
          v125[1] = v90;
          v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v125 count:2];
          v88 = [v18 andPredicateWithSubpredicates:v19];

          v20 = [v17 visits];
          v21 = [v20 allObjects];
          v87 = [v21 filteredArrayUsingPredicate:v88];

          v22 = (void *)MEMORY[0x1E4F28F60];
          v106[0] = MEMORY[0x1E4F143A8];
          v106[1] = 3221225472;
          v106[2] = __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_2_46;
          v106[3] = &unk_1E6B94798;
          id v23 = v83;
          id v107 = v23;
          id v85 = [v22 predicateWithBlock:v106];
          v24 = [v87 filteredArrayUsingPredicate:v85];
          v25 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v26 = NSStringFromSelector(*(SEL *)(a1 + 56));
            uint64_t v27 = [v24 count];
            v28 = [v23 firstObject];
            v29 = [v28 entryDate];
            v30 = [v29 stringFromDate];
            *(_DWORD *)buf = 138413314;
            *(void *)&buf[4] = v26;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v84;
            *(_WORD *)&buf[22] = 2112;
            v123 = (uint64_t (*)(uint64_t, uint64_t))v17;
            *(_WORD *)v124 = 2048;
            *(void *)&v124[2] = v27;
            *(_WORD *)&v124[10] = 2112;
            *(void *)&v124[12] = v30;
            _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%@, idx, %lu, device, %@, filtered visit count, %lu, filter date, %@", buf, 0x34u);
          }
          if ([v24 count])
          {
            v31 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"entryDate" ascending:1];
            v121 = v31;
            v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1];
            v33 = [v24 sortedArrayUsingDescriptors:v32];

            long long v104 = 0u;
            long long v105 = 0u;
            long long v102 = 0u;
            long long v103 = 0u;
            v34 = [v33 reverseObjectEnumerator];
            uint64_t v35 = [v34 countByEnumeratingWithState:&v102 objects:v120 count:16];
            if (v35)
            {
              uint64_t v36 = *(void *)v103;
              do
              {
                for (uint64_t j = 0; j != v35; ++j)
                {
                  if (*(void *)v103 != v36) {
                    objc_enumerationMutation(v34);
                  }
                  [v23 insertObject:*(void *)(*((void *)&v102 + 1) + 8 * j) atIndex:0];
                }
                uint64_t v35 = [v34 countByEnumeratingWithState:&v102 objects:v120 count:16];
              }
              while (v35);
            }
          }
          ++v84;
        }
        uint64_t v82 = [obj countByEnumeratingWithState:&v108 objects:v126 count:16];
      }
      while (v82);
    }

    if (v73) {
      goto LABEL_48;
    }
    long long v101 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v98 = 0u;
    id v86 = obj;
    uint64_t v91 = [v86 countByEnumeratingWithState:&v98 objects:v119 count:16];
    if (v91)
    {
      uint64_t v89 = *(void *)v99;
      do
      {
        for (uint64_t k = 0; k != v91; ++k)
        {
          if (*(void *)v99 != v89) {
            objc_enumerationMutation(v86);
          }
          v39 = *(void **)(*((void *)&v98 + 1) + 8 * k);
          v93 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != NULL", @"place.mapItem"];
          v40 = +[RTCloudManagedObject notTombstonedPredicate];
          v41 = (void *)MEMORY[0x1E4F28BA0];
          v118[0] = v93;
          v118[1] = v40;
          v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:2];
          v43 = [v41 andPredicateWithSubpredicates:v42];

          v44 = [v39 visits];
          v45 = [v44 allObjects];
          v46 = [v45 filteredArrayUsingPredicate:v43];

          v47 = (void *)MEMORY[0x1E4F28F60];
          v96[0] = MEMORY[0x1E4F143A8];
          v96[1] = 3221225472;
          v96[2] = __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_51;
          v96[3] = &unk_1E6B94798;
          id v48 = v83;
          id v97 = v48;
          v49 = [v47 predicateWithBlock:v96];
          v50 = [v46 filteredArrayUsingPredicate:v49];
          if ([v50 count])
          {
            v51 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"entryDate" ascending:1];
            v117 = v51;
            v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v117 count:1];
            v53 = [v50 sortedArrayUsingDescriptors:v52];

            [v48 addObjectsFromArray:v53];
          }
        }
        uint64_t v91 = [v86 countByEnumeratingWithState:&v98 objects:v119 count:16];
      }
      while (v91);
    }

    v54 = +[RTLearnedVisitMO fetchRequest];
    v55 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"entryDate" ascending:1];
    v116 = v55;
    v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];
    [v54 setSortDescriptors:v56];

    v57 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != $RT_CURRENT_DEVICE", @"device"];
    v58 = (void *)MEMORY[0x1E4F28F60];
    v59 = [v83 lastObject];
    uint64_t v60 = [v59 exitDate];
    v61 = (void *)v60;
    if (v60)
    {
      v62 = [v58 predicateWithFormat:@"%K > %@", @"entryDate", v60];
    }
    else
    {
      v63 = [MEMORY[0x1E4F1C9C8] distantPast];
      v62 = [v58 predicateWithFormat:@"%K > %@", @"entryDate", v63];
    }
    v64 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != NULL", @"place.mapItem"];
    v65 = (void *)MEMORY[0x1E4F28BA0];
    v115[0] = v57;
    v115[1] = v62;
    v115[2] = v64;
    v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:3];
    v67 = [v65 andPredicateWithSubpredicates:v66];
    [v54 setPredicate:v67];

    v68 = *(void **)(a1 + 40);
    id v95 = 0;
    v69 = [v68 executeFetchRequest:v54 error:&v95];
    id v70 = v95;
    if (v70)
    {
      uint64_t v71 = *(void *)(a1 + 48);
      if (v71) {
        (*(void (**)(uint64_t, void, id))(v71 + 16))(v71, 0, v70);
      }
    }
    else
    {
      [v83 addObjectsFromArray:v69];
    }

    if (!v70)
    {
LABEL_48:
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v123 = __Block_byref_object_copy__165;
      *(void *)v124 = __Block_byref_object_dispose__165;
      *(void *)&v124[8] = 0;
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_63;
      v94[3] = &unk_1E6B94748;
      v94[4] = buf;
      v72 = [MEMORY[0x1E4F28F60] predicateWithBlock:v94];
      [v83 filterUsingPredicate:v72];
      [*(id *)(a1 + 32) collapseReconciledVisitsToLocationsOfInterest:v83 context:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];

      _Block_object_dispose(buf, 8);
    }
  }
}

uint64_t __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v8 = [v6 currentDevice];
  id v9 = [v8 identifier];
  char v10 = [v7 isEqual:v9];

  if (v10)
  {
    uint64_t v11 = -1;
  }
  else
  {
    v12 = [*(id *)(a1 + 32) currentDevice];
    id v13 = [v12 identifier];
    unsigned int v14 = [v5 isEqual:v13];

    uint64_t v11 = v14;
  }

  return v11;
}

uint64_t __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_2_46(uint64_t a1, void *a2)
{
  id v3 = [a2 exitDate];
  uint64_t v4 = [*(id *)(a1 + 32) firstObject];
  id v5 = [v4 entryDate];
  uint64_t v6 = [v3 isOnOrBefore:v5];

  return v6;
}

uint64_t __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_51(uint64_t a1, void *a2)
{
  id v3 = [a2 entryDate];
  uint64_t v4 = [*(id *)(a1 + 32) lastObject];
  id v5 = [v4 exitDate];
  uint64_t v6 = [v3 isOnOrAfter:v5];

  return v6;
}

uint64_t __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_63(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v8 + 40))
  {
    id v9 = [v6 entryDate];
    char v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) exitDate];
    int v11 = [v9 isAfterDate:v10];

    if (!v11)
    {
      uint64_t v12 = 0;
      goto LABEL_6;
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(v8 + 40), a2);
  uint64_t v12 = 1;
LABEL_6:

  return v12;
}

- (void)collapseReconciledVisitsToLocationsOfInterest:(id)a3 context:(id)a4 handler:(id)a5
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v72 = a5;
  int v73 = v8;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v106 = "-[RTLearnedLocationReconcilerPerDevice collapseReconciledVisitsToLocationsOfInterest:context:handler:]";
      __int16 v107 = 1024;
      int v108 = 308;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context (in %s:%d)", buf, 0x12u);
    }
  }
  uint64_t v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"place" ascending:1 comparator:&__block_literal_global_71];
  uint64_t v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"place" ascending:1 comparator:&__block_literal_global_73_0];
  uint64_t v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"place" ascending:1 comparator:&__block_literal_global_75];
  uint64_t v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"place" ascending:1 comparator:&__block_literal_global_77];
  [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"place" ascending:1 comparator:&__block_literal_global_79_0];
  v74 = (void *)v10;
  v104[0] = v10;
  v104[1] = v11;
  id v70 = (void *)v12;
  uint64_t v71 = (void *)v11;
  v104[2] = v12;
  v68 = v104[3] = v13;
  v69 = (void *)v13;
  v104[4] = v68;
  unsigned int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:5];
  v15 = [v7 sortedArrayUsingDescriptors:v14];

  v16 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:[v7 count]];
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  obuint64_t j = v15;
  uint64_t v17 = [obj countByEnumeratingWithState:&v99 objects:v103 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v100;
    v78 = v16;
    id v79 = v7;
    uint64_t v77 = *(void *)v100;
    do
    {
      uint64_t v20 = 0;
      uint64_t v80 = v18;
      do
      {
        if (*(void *)v100 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v99 + 1) + 8 * v20);
        context = (void *)MEMORY[0x1E016D870]();
        v98[0] = MEMORY[0x1E4F143A8];
        v98[1] = 3221225472;
        v98[2] = __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_6;
        v98[3] = &unk_1E6B94770;
        v98[4] = v21;
        if ([v16 indexOfObjectPassingTest:v98] == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v88 = v20;
          id v22 = objc_alloc(MEMORY[0x1E4F5CE00]);
          id v23 = [v21 locationLatitude];
          [v23 doubleValue];
          double v25 = v24;
          v26 = [v21 locationLongitude];
          [v26 doubleValue];
          double v28 = v27;
          v29 = [v21 locationHorizontalUncertainty];
          [v29 doubleValue];
          double v31 = v30;
          v32 = [v21 locationAltitude];
          [v32 doubleValue];
          double v34 = v33;
          uint64_t v35 = [v21 locationVerticalUncertainty];
          [v35 doubleValue];
          double v37 = v36;
          v38 = [v21 locationReferenceFrame];
          uint64_t v39 = [v38 intValue];
          v40 = [v21 locationSourceAccuracy];
          uint64_t v41 = [v22 initWithLatitude:0 longitude:v39 horizontalUncertainty:(int)objc_msgSend(v40, "intValue") altitude:v25 verticalUncertainty:v28 date:v31 referenceFrame:v34 speed:v37 sourceAccuracy:0.0];

          v42 = [RTLearnedLocation alloc];
          v43 = [v21 locationSourceAccuracy];
          v87 = (void *)v41;
          v90 = -[RTLearnedLocation initWithLocation:dataPointCount:type:](v42, "initWithLocation:dataPointCount:type:", v41, [v43 intValue] == 2, 2);

          v44 = [v21 place];
          v45 = [v44 mapItem];

          if (v45)
          {
            v46 = (void *)MEMORY[0x1E4F5CE38];
            v47 = [v21 place];
            id v48 = [v47 mapItem];
            uint64_t v89 = [v46 createWithManagedObject:v48];
          }
          else
          {
            uint64_t v89 = 0;
          }
          uint64_t v84 = [RTLearnedPlace alloc];
          id v86 = [v21 place];
          uint64_t v49 = [v86 identifier];
          v50 = (void *)v49;
          if (!v49)
          {
            uint64_t v49 = [MEMORY[0x1E4F29128] UUID];
            v76 = (void *)v49;
          }
          uint64_t v82 = v49;
          id v85 = [v21 place];
          v83 = [v85 type];
          uint64_t v51 = [v83 unsignedIntegerValue];
          v52 = [v21 place];
          v53 = [v52 typeSource];
          uint64_t v54 = [v53 unsignedIntegerValue];
          v55 = [v21 place];
          v56 = [v55 customLabel];
          v57 = [MEMORY[0x1E4F1C9C8] date];
          v58 = [v21 expirationDate];
          v59 = [(RTLearnedPlace *)v84 initWithIdentifier:v82 type:v51 typeSource:v54 mapItem:v89 customLabel:v56 creationDate:v57 expirationDate:v58];

          if (!v50) {
          uint64_t v60 = [RTLearnedLocationOfInterest alloc];
          }
          v61 = [(RTLearnedPlace *)v59 identifier];
          v62 = [(RTLearnedLocationOfInterest *)v60 initWithIdentifier:v61 location:v90 place:v59 visits:0 transitions:0];

          if (v62)
          {
            v16 = v78;
            [v78 addObject:v62];
            id v7 = v79;
            uint64_t v18 = v80;
            uint64_t v19 = v77;
          }
          else
          {
            v63 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v16 = v78;
            id v7 = v79;
            uint64_t v19 = v77;
            uint64_t v18 = v80;
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v106 = (const char *)v21;
              _os_log_error_impl(&dword_1D9BFA000, v63, OS_LOG_TYPE_ERROR, "the learned location of interest was nil, visit, %@", buf, 0xCu);
            }
          }
          uint64_t v20 = v88;
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [obj countByEnumeratingWithState:&v99 objects:v103 count:16];
    }
    while (v18);
  }

  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_87;
  v92[3] = &unk_1E6B914E0;
  id v93 = v7;
  id v94 = v16;
  id v95 = self;
  id v96 = v73;
  id v97 = v72;
  id v64 = v72;
  id v65 = v73;
  id v66 = v16;
  id v67 = v7;
  [v65 performBlock:v92];
}

uint64_t __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = [v6 mapItem];
  id v9 = [v8 address];
  uint64_t v10 = [v9 iso3166SubdivisionCode];
  if (v10)
  {
    id v3 = [v7 mapItem];
    uint64_t v4 = [v3 address];
    uint64_t v11 = [v4 iso3166SubdivisionCode];
    if (v11)
    {

      uint64_t v12 = 0;
LABEL_14:

      goto LABEL_15;
    }
  }
  uint64_t v13 = [v6 mapItem];
  unsigned int v14 = [v13 address];
  v15 = [v14 iso3166SubdivisionCode];
  if (v15)
  {
    BOOL v21 = 0;
  }
  else
  {
    uint64_t v19 = [v7 mapItem];
    [v19 address];
    v16 = id v20 = v7;
    uint64_t v17 = [v16 iso3166SubdivisionCode];
    BOOL v21 = v17 == 0;

    id v7 = v20;
  }

  if (v10)
  {
  }
  if (!v21)
  {
    id v8 = [v6 mapItem];
    id v9 = [v8 address];
    uint64_t v10 = [v9 iso3166SubdivisionCode];
    if (v10) {
      uint64_t v12 = -1;
    }
    else {
      uint64_t v12 = 1;
    }
    goto LABEL_14;
  }
  uint64_t v12 = 0;
LABEL_15:

  return v12;
}

uint64_t __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = [v6 mapItem];
  id v9 = [v8 address];
  uint64_t v10 = [v9 iso3166CountryCode];
  if (v10)
  {
    id v3 = [v7 mapItem];
    uint64_t v4 = [v3 address];
    uint64_t v11 = [v4 iso3166CountryCode];
    if (v11)
    {

      uint64_t v12 = 0;
LABEL_14:

      goto LABEL_15;
    }
  }
  uint64_t v13 = [v6 mapItem];
  unsigned int v14 = [v13 address];
  v15 = [v14 iso3166CountryCode];
  if (v15)
  {
    BOOL v21 = 0;
  }
  else
  {
    uint64_t v19 = [v7 mapItem];
    [v19 address];
    v16 = id v20 = v7;
    uint64_t v17 = [v16 iso3166CountryCode];
    BOOL v21 = v17 == 0;

    id v7 = v20;
  }

  if (v10)
  {
  }
  if (!v21)
  {
    id v8 = [v6 mapItem];
    id v9 = [v8 address];
    uint64_t v10 = [v9 iso3166CountryCode];
    if (v10) {
      uint64_t v12 = -1;
    }
    else {
      uint64_t v12 = 1;
    }
    goto LABEL_14;
  }
  uint64_t v12 = 0;
LABEL_15:

  return v12;
}

uint64_t __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 mapItem];
  id v7 = [v6 category];
  uint64_t v8 = *MEMORY[0x1E4F5D008];
  int v9 = [v7 isEqualToString:*MEMORY[0x1E4F5D008]];
  uint64_t v10 = [v5 mapItem];

  uint64_t v11 = [v10 category];
  int v12 = [v11 isEqualToString:v8];

  if (v9 == v12)
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v13 = [v4 mapItem];
    unsigned int v14 = [v13 category];
    if ([v14 isEqualToString:v8]) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = -1;
    }
  }
  return v15;
}

uint64_t __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 mapItem];
  id v7 = [v6 address];
  uint64_t v8 = [v7 geoAddressData];
  int v9 = [v5 mapItem];

  uint64_t v10 = [v9 address];
  uint64_t v11 = [v10 geoAddressData];
  char v12 = (v8 != 0) ^ (v11 == 0);

  if (v12)
  {
    uint64_t v13 = 0;
  }
  else
  {
    unsigned int v14 = [v4 mapItem];
    uint64_t v15 = [v14 address];
    v16 = [v15 geoAddressData];
    if (v16) {
      uint64_t v13 = -1;
    }
    else {
      uint64_t v13 = 1;
    }
  }
  return v13;
}

uint64_t __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 mapItem];
  BOOL v7 = [v6 mapItemPlaceType] != 1000;
  uint64_t v8 = [v5 mapItem];

  LOBYTE(v5) = v7 ^ ([v8 mapItemPlaceType] == 1000);
  if (v5)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = [v4 mapItem];
    if ([v10 mapItemPlaceType] == 1000) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = -1;
    }
  }
  return v9;
}

uint64_t __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F5CE38];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 place];
  id v6 = [v5 mapItem];
  BOOL v7 = [v2 createWithManagedObject:v6];

  uint64_t v8 = [v4 place];

  uint64_t v9 = [v8 mapItem];
  uint64_t v10 = [v9 isEqualToMapItem:v7];

  return v10;
}

void __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_87(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v109 objects:v119 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = 0;
    uint64_t v5 = *(void *)v110;
    uint64_t v99 = v1;
    uint64_t v91 = *(void *)v110;
    do
    {
      uint64_t v6 = 0;
      uint64_t v92 = v3;
      do
      {
        if (*(void *)v110 != v5) {
          objc_enumerationMutation(obj);
        }
        BOOL v7 = *(void **)(*((void *)&v109 + 1) + 8 * v6);
        context = (void *)MEMORY[0x1E016D870]();
        uint64_t v8 = *(void **)(v1 + 40);
        v108[0] = MEMORY[0x1E4F143A8];
        v108[1] = 3221225472;
        v108[2] = __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_2_88;
        v108[3] = &unk_1E6B94770;
        v108[4] = v7;
        uint64_t v9 = [v8 indexOfObjectPassingTest:v108];
        if (v9 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v10 = v7;
          uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v114 = v10;
            _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "the learned location of interest was not found, visit, %@", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v100 = v9;
          long long v101 = v4;
          uint64_t v98 = v6;
          id v12 = objc_alloc(MEMORY[0x1E4F5CE00]);
          uint64_t v13 = [v7 locationLatitude];
          [v13 doubleValue];
          double v15 = v14;
          v16 = [v7 locationLongitude];
          [v16 doubleValue];
          double v18 = v17;
          uint64_t v19 = [v7 locationHorizontalUncertainty];
          [v19 doubleValue];
          double v21 = v20;
          id v22 = [v7 locationAltitude];
          [v22 doubleValue];
          double v24 = v23;
          double v25 = [v7 locationVerticalUncertainty];
          [v25 doubleValue];
          double v27 = v26;
          double v28 = [v7 locationReferenceFrame];
          uint64_t v29 = [v28 intValue];
          double v30 = [v7 locationSourceAccuracy];
          uint64_t v31 = [v12 initWithLatitude:0 longitude:v29 horizontalUncertainty:(int)objc_msgSend(v30, "intValue") altitude:v15 verticalUncertainty:v18 date:v21 referenceFrame:v24 speed:v27 sourceAccuracy:0.0];

          v32 = [RTLearnedLocation alloc];
          double v33 = [v7 dataPointCount];
          uint64_t v34 = [v33 unsignedIntegerValue];
          uint64_t v35 = [v7 confidence];
          [v35 doubleValue];
          id v97 = v31;
          uint64_t v36 = -[RTLearnedLocation initWithLocation:dataPointCount:confidence:](v32, "initWithLocation:dataPointCount:confidence:", v31, v34);

          long long v105 = [RTLearnedVisit alloc];
          double v37 = [v7 identifier];
          v38 = [v7 entryDate];
          uint64_t v39 = [v7 exitDate];
          v40 = [v7 creationDate];
          uint64_t v41 = (uint64_t)v40;
          if (!v40)
          {
            uint64_t v41 = [MEMORY[0x1E4F1C9C8] distantPast];
            uint64_t v88 = (void *)v41;
          }
          v42 = [v7 expirationDate];
          v43 = [v7 placeConfidence];
          [v43 doubleValue];
          double v45 = v44;
          v46 = [v7 placeSource];
          uint64_t v87 = [v46 unsignedIntegerValue];
          v47 = v105;
          v106 = (void *)v36;
          long long v104 = [(RTLearnedVisit *)v47 initWithIdentifier:v37 location:v36 entryDate:v38 exitDate:v39 creationDate:v41 expirationDate:v42 placeConfidence:v45 placeSource:v87];

          if (!v40) {
          id v95 = [v101 device];
          }
          id v48 = [v95 identifier];
          id v94 = [v7 device];
          uint64_t v49 = [v94 identifier];
          v50 = [v101 outbound];
          uint64_t v51 = [v50 predominantMotionActivityType];
          uint64_t v52 = [v51 unsignedIntegerValue];
          v53 = [v7 inbound];
          uint64_t v54 = [v53 predominantMotionActivityType];
          uint64_t v55 = [v54 unsignedIntegerValue];
          int v56 = [v48 isEqual:v49];
          if (v52 == v55) {
            int v57 = 1;
          }
          else {
            int v57 = v56;
          }
          if (v57) {
            uint64_t v58 = v55;
          }
          else {
            uint64_t v58 = 0;
          }
          uint64_t v102 = v58;

          id v96 = [RTLearnedTransition alloc];
          v59 = [MEMORY[0x1E4F29128] UUID];
          uint64_t v60 = [v101 exitDate];
          uint64_t v61 = (uint64_t)v60;
          if (!v60)
          {
            uint64_t v61 = [MEMORY[0x1E4F1C9C8] distantPast];
            v90 = (void *)v61;
          }
          v62 = [v7 entryDate];
          v63 = [v101 identifier];
          uint64_t v64 = (uint64_t)v63;
          if (!v63)
          {
            uint64_t v64 = [MEMORY[0x1E4F29128] nilUUID];
            uint64_t v89 = (void *)v64;
          }
          id v65 = [v7 identifier];
          id v66 = [MEMORY[0x1E4F1C9C8] date];
          id v67 = [v7 expirationDate];
          long long v103 = [(RTLearnedTransition *)v96 initWithIdentifier:v59 startDate:v61 stopDate:v62 visitIdentifierOrigin:v64 visitIdentifierDestination:v65 creationDate:v66 expirationDate:v67 predominantMotionActivityType:v102];

          if (!v63) {
          if (!v60)
          }

          v68 = [*(id *)(v99 + 40) objectAtIndex:v100];
          v69 = (void *)MEMORY[0x1E4F1CA48];
          id v70 = [v68 visits];
          uint64_t v71 = [v69 arrayWithArray:v70];

          if (v104)
          {
            [v71 addObject:v104];
          }
          else
          {
            id v72 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              id v114 = v106;
              __int16 v115 = 2112;
              v116 = 0;
              __int16 v117 = 2112;
              v118 = v103;
              _os_log_error_impl(&dword_1D9BFA000, v72, OS_LOG_TYPE_ERROR, "dropping reconciled visit because the learned visit was nil, location, %@, visit, %@, transition, %@", buf, 0x20u);
            }
          }
          int v73 = (void *)MEMORY[0x1E4F1CA48];
          v74 = [v68 transitions];
          v75 = [v73 arrayWithArray:v74];

          if (v103)
          {
            [v75 addObject:v103];
          }
          else
          {
            v76 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              id v114 = v106;
              __int16 v115 = 2112;
              v116 = v104;
              __int16 v117 = 2112;
              v118 = 0;
              _os_log_error_impl(&dword_1D9BFA000, v76, OS_LOG_TYPE_ERROR, "dropping reconciled transition because the learned visit was nil, location, %@, visit, %@, transition, %@", buf, 0x20u);
            }
          }
          uint64_t v77 = [RTLearnedLocationOfInterest alloc];
          v78 = [v68 place];
          id v79 = [v78 identifier];
          uint64_t v80 = [v68 location];
          uint64_t v81 = [v68 place];
          uint64_t v82 = [(RTLearnedLocationOfInterest *)v77 initWithIdentifier:v79 location:v80 place:v81 visits:v71 transitions:v75];

          if (v82)
          {
            uint64_t v1 = v99;
            [*(id *)(v99 + 40) setObject:v82 atIndexedSubscript:v100];
            v83 = v101;
          }
          else
          {
            uint64_t v84 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            uint64_t v1 = v99;
            v83 = v101;
            if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              id v114 = v106;
              __int16 v115 = 2112;
              v116 = v104;
              __int16 v117 = 2112;
              v118 = v103;
              _os_log_error_impl(&dword_1D9BFA000, v84, OS_LOG_TYPE_ERROR, "dropping reconciled visit because the updated learned location of interest was nil, location, %@, visit, %@, transition, %@", buf, 0x20u);
            }
          }
          id v4 = v7;

          uint64_t v3 = v92;
          uint64_t v5 = v91;
          uint64_t v11 = v97;
          uint64_t v6 = v98;
        }

        ++v6;
      }
      while (v3 != v6);
      uint64_t v3 = [obj countByEnumeratingWithState:&v109 objects:v119 count:16];
    }
    while (v3);
  }
  else
  {
    id v4 = 0;
  }

  logReconciledGraph(*(void **)(v1 + 40), 1);
  +[RTLearnedLocationReconcilerPerVisit submitMetricsOnReconciledGraphDensity:*(void *)(v1 + 32) algorithm:1 persistenceManager:*(void *)(*(void *)(v1 + 48) + 16) managedObjectContext:*(void *)(v1 + 56)];
  uint64_t v85 = *(void *)(v1 + 64);
  if (v85)
  {
    id v86 = (void *)[*(id *)(v1 + 40) copy];
    (*(void (**)(uint64_t, void *, void))(v85 + 16))(v85, v86, 0);
  }
}

uint64_t __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_2_88(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F5CE38];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 place];
  uint64_t v6 = [v5 mapItem];
  BOOL v7 = [v2 createWithManagedObject:v6];

  uint64_t v8 = [v4 place];

  uint64_t v9 = [v8 mapItem];
  uint64_t v10 = [v9 isEqualToMapItem:v7];

  return v10;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (RTPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end