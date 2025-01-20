@interface MOEventBundleStore
+ (BOOL)_isResourceTypeAllowedForResource:(id)a3;
+ (BOOL)_recordDedupeKey:(id)a3 alreadySeenKeys:(id)a4;
+ (BOOL)_recordResource:(id)a3 alreadySeenKeys:(id)a4;
- (MOConfigurationManager)configurationManager;
- (MOEventBundleStore)initWithPersistenceManager:(id)a3 andConfigurationManager:(id)a4;
- (MOEventBundleStore)initWithUniverse:(id)a3;
- (MOEventBundleStoreEngagementDelegate)engagementDelegate;
- (MOPersistenceManager)persistenceManager;
- (OS_dispatch_queue)queue;
- (id)_updateLongTermBundles:(id)a3 context:(id)a4;
- (void)_submitRankingParamsAnalytics:(id)a3 withSubmissionDate:(id)a4;
- (void)fetchBundleTypeDistributionFromStoreWithHandler:(id)a3;
- (void)fetchEventBundleWithGranularity:(unint64_t)a3 interfaceTypes:(id)a4 CompletionHandler:(id)a5;
- (void)fetchEventBundleWithOptions:(id)a3 CompletionHandler:(id)a4;
- (void)getEventBundleStartedWithInterval:(id)a3 interfaceTypes:(id)a4 CompletionHandler:(id)a5;
- (void)getRankingParamsandCompletionHandler:(id)a3;
- (void)purgeDanglingEventBundlesWithHandler:(id)a3;
- (void)purgeDeletedEventBundlesWithCompletionHandler:(id)a3;
- (void)purgeEventBundlesWithNoEventsAssociatedWithCompletionHandler:(id)a3;
- (void)purgeEventBundlesWithRehydrationFailureCount:(int)a3 andHandler:(id)a4;
- (void)purgeExpiredEventBundlesWithCompletionHandler:(id)a3;
- (void)purgeInvalidEvergreenBundlesWithCompletionHandler:(id)a3;
- (void)removeAllBundlesWithCompletionHandler:(id)a3;
- (void)removeEventBundles:(id)a3 CompletionHandler:(id)a4;
- (void)removeEventBundlesStartedWithinInterval:(id)a3 CompletionHandler:(id)a4;
- (void)reset;
- (void)setConfigurationManager:(id)a3;
- (void)setEngagementDelegate:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)storeEventBundles:(id)a3 CompletionHandler:(id)a4;
- (void)storeRankingParams:(id)a3 forContext:(id)a4 forEvergreenScore:(BOOL)a5;
- (void)updateEventBundles:(id)a3 CompletionHandler:(id)a4;
@end

@implementation MOEventBundleStore

- (MOEventBundleStore)initWithUniverse:(id)a3
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 getService:v6];

  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = [v4 getService:v9];

  v11 = [(MOEventBundleStore *)self initWithPersistenceManager:v7 andConfigurationManager:v10];
  return v11;
}

- (MOEventBundleStore)initWithPersistenceManager:(id)a3 andConfigurationManager:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v18.receiver = self;
    v18.super_class = (Class)MOEventBundleStore;
    v10 = [(MOEventBundleStore *)&v18 init];
    if (v10)
    {
      v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v12 = dispatch_queue_create("MOEventBundleStore", v11);
      queue = v10->_queue;
      v10->_queue = (OS_dispatch_queue *)v12;

      objc_storeStrong((id *)&v10->_persistenceManager, a3);
      objc_storeStrong((id *)&v10->_configurationManager, a4);
    }
    self = v10;
    v14 = self;
  }
  else
  {
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MOFSMStore initWithPersistenceManager:andConfigurationManager:](v15);
    }

    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"MOEventBundleStore.m" lineNumber:64 description:@"Invalid parameter not satisfying: persistenceManager"];

    v14 = 0;
  }

  return v14;
}

- (void)reset
{
  id v2 = [(MOEventBundleStore *)self persistenceManager];
  [v2 performBlockAndWait:&__block_literal_global_40];
}

void __27__MOEventBundleStore_reset__block_invoke(id a1, NSManagedObjectContext *a2)
{
}

- (void)storeEventBundles:(id)a3 CompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__32;
  v26 = __Block_byref_object_dispose__32;
  id v27 = 0;
  if ([v7 count])
  {
    v10 = [(MOEventBundleStore *)self persistenceManager];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __58__MOEventBundleStore_storeEventBundles_CompletionHandler___block_invoke;
    v17[3] = &unk_1002D0F18;
    v20 = &v22;
    SEL v21 = a2;
    objc_super v18 = v7;
    v19 = self;
    [v10 performBlockAndWait:v17];

    [(MOEventBundleStore *)self reset];
    v11 = v18;
  }
  else
  {
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "no event bundles to be saved", v16, 2u);
    }
  }

  if (v8)
  {
    uint64_t v13 = v23[5];
    CFStringRef v28 = @"resultNumberOfBundleEvents";
    v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 count]);
    v29 = v14;
    v15 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v8[2](v8, v13, v15);
  }
  _Block_object_dispose(&v22, 8);
}

void __58__MOEventBundleStore_storeEventBundles_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v108 = a2;
  v93 = objc_opt_new();
  uint64_t v3 = objc_opt_new();
  id v4 = objc_opt_new();
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  uint64_t v95 = a1;
  id v5 = *(id *)(a1 + 32);
  id v6 = [v5 countByEnumeratingWithState:&v128 objects:v148 count:16];
  v105 = (void *)v3;
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v129;
    id v107 = v5;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v129 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v128 + 1) + 8 * i);
        if ([v10 interfaceType] != (id)11)
        {
          v11 = [v10 events];
          id v12 = [v11 count];

          if (!v12) {
            continue;
          }
        }
        id v13 = [v10 bundleManagementPolicy];
        v14 = v4;
        if (v13 == (id)1)
        {
          if ([v10 interfaceType] != (id)13
            || ([v10 place],
                v15 = objc_claimAutoreleasedReturnValue(),
                id v16 = [v15 placeType],
                v15,
                v14 = v93,
                (unint64_t)v16 <= 0x64))
          {
            id v17 = [v10 interfaceType];
            v14 = (void *)v3;
            if (v17 == (id)13)
            {
              objc_super v18 = [v10 action];

              v14 = (void *)v3;
              if (v18)
              {
                long long v126 = 0u;
                long long v127 = 0u;
                long long v124 = 0u;
                long long v125 = 0u;
                v19 = [v10 events];
                id v20 = [v19 countByEnumeratingWithState:&v124 objects:v147 count:16];
                if (v20)
                {
                  id v21 = v20;
                  uint64_t v22 = *(void *)v125;
                  do
                  {
                    for (j = 0; j != v21; j = (char *)j + 1)
                    {
                      if (*(void *)v125 != v22) {
                        objc_enumerationMutation(v19);
                      }
                      uint64_t v24 = [*(id *)(*((void *)&v124 + 1) + 8 * (void)j) eventIdentifier];
                      [0 addObject:v24];
                    }
                    id v21 = [v19 countByEnumeratingWithState:&v124 objects:v147 count:16];
                  }
                  while (v21);
                }

                v25 = [v10 action];
                v26 = [v25 sourceEventIdentifier];
                unsigned int v27 = [0 containsObject:v26];

                uint64_t v3 = (uint64_t)v105;
                id v5 = v107;
                v14 = v105;
                if (v27)
                {
                  CFStringRef v28 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
                  {
                    v103 = [v10 action];
                    v33 = [v103 sourceEventIdentifier];
                    v34 = [v10 suggestionID];
                    v101 = [v10 events];
                    v99 = [v101 firstObject];
                    v35 = [v99 eventIdentifier];
                    *(_DWORD *)buf = 138412802;
                    id v136 = v33;
                    __int16 v137 = 2112;
                    v138 = v34;
                    __int16 v139 = 2112;
                    uint64_t v140 = (uint64_t)v35;
                    _os_log_fault_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "Action source Identifier  %@ not part of the event bundle %@, setting it now to be the first event %@ ", buf, 0x20u);
                  }
                  v29 = [v10 events];
                  v30 = [v29 firstObject];
                  v31 = [v30 eventIdentifier];
                  v32 = [v10 action];
                  [v32 setSourceEventIdentifier:v31];

                  v14 = v105;
                  id v5 = v107;
                }
              }
            }
          }
        }
        [v14 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v128 objects:v148 count:16];
    }
    while (v7);
  }

  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id obj = v4;
  id v36 = [obj countByEnumeratingWithState:&v120 objects:v146 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v121;
    do
    {
      for (k = 0; k != v37; k = (char *)k + 1)
      {
        if (*(void *)v121 != v38) {
          objc_enumerationMutation(obj);
        }
        v40 = *(void **)(*((void *)&v120 + 1) + 8 * (void)k);
        v41 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v136 = v40;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "save event bundle, %@", buf, 0xCu);
        }

        id v42 = +[MOEventBundleMO managedObjectWithEventBundle:v40 inManagedObjectContext:v108];
      }
      id v37 = [obj countByEnumeratingWithState:&v120 objects:v146 count:16];
    }
    while (v37);
  }

  uint64_t v43 = v95 + 48;
  uint64_t v44 = *(void *)(*(void *)(v95 + 48) + 8);
  id v119 = *(id *)(v44 + 40);
  unsigned __int8 v45 = [v108 save:&v119];
  objc_storeStrong((id *)(v44 + 40), v119);
  if (v45)
  {
    uint64_t v46 = *(void *)(*(void *)v43 + 8);
    v47 = *(void **)(v46 + 40);
    *(void *)(v46 + 40) = 0;

    v48 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v49 = v105;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      id v50 = [obj count];
      *(_DWORD *)buf = 134217984;
      id v136 = v50;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "saving event bundles succeeded, stored, %lu", buf, 0xCu);
    }
  }
  else
  {
    v48 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v49 = v105;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      __58__MOEventBundleStore_storeEventBundles_CompletionHandler___block_invoke_cold_2();
    }
  }

  [v108 reset];
  v51 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    id v52 = [v49 count];
    *(_DWORD *)buf = 134217984;
    id v136 = v52;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "saving event bundles succeeded, to be updated, %lu", buf, 0xCu);
  }

  long long v118 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v115 = 0u;
  id v96 = v49;
  id v53 = [v96 countByEnumeratingWithState:&v115 objects:v145 count:16];
  if (v53)
  {
    id v54 = v53;
    uint64_t v98 = *(void *)v116;
    do
    {
      uint64_t v55 = 0;
      id v94 = v54;
      do
      {
        if (*(void *)v116 != v98) {
          objc_enumerationMutation(v96);
        }
        v56 = *(void **)(*((void *)&v115 + 1) + 8 * v55);
        v57 = +[MOEventBundleMO fetchRequest];
        v58 = [v56 suggestionID];
        v59 = +[NSPredicate predicateWithFormat:@"%K == %@", @"suggestionID", v58];
        v144 = v59;
        v60 = +[NSArray arrayWithObjects:&v144 count:1];
        v61 = +[NSCompoundPredicate andPredicateWithSubpredicates:v60];
        [v57 setPredicate:v61];

        id v62 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:0];
        id v143 = v62;
        v63 = +[NSArray arrayWithObjects:&v143 count:1];
        [v57 setSortDescriptors:v63];

        [v57 setReturnsObjectsAsFaults:0];
        uint64_t v64 = *(void *)(*(void *)v43 + 8);
        id v114 = *(id *)(v64 + 40);
        v65 = [v108 executeFetchRequest:v57 error:&v114];
        objc_storeStrong((id *)(v64 + 40), v114);
        v66 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          v67 = NSStringFromSelector(*(SEL *)(v95 + 56));
          id v68 = [v65 count];
          uint64_t v69 = *(void *)(*(void *)(*(void *)(v95 + 48) + 8) + 40);
          *(_DWORD *)buf = 138413058;
          id v136 = v67;
          __int16 v137 = 2112;
          v138 = v57;
          __int16 v139 = 2048;
          uint64_t v140 = (uint64_t)v68;
          __int16 v141 = 2112;
          uint64_t v142 = v69;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
        }
        v102 = v57;
        uint64_t v104 = v55;
        v100 = v65;
        if ([v65 count])
        {
          long long v112 = 0u;
          long long v113 = 0u;
          long long v110 = 0u;
          long long v111 = 0u;
          v70 = v65;
          v71 = (char *)[v70 countByEnumeratingWithState:&v110 objects:v134 count:16];
          if (v71)
          {
            v72 = v71;
            v73 = 0;
            v74 = 0;
            uint64_t v75 = 0;
            uint64_t v76 = *(void *)v111;
            do
            {
              v77 = 0;
              uint64_t v106 = v75;
              uint64_t v78 = -v75;
              do
              {
                if (*(void *)v111 != v76) {
                  objc_enumerationMutation(v70);
                }
                v79 = *(void **)(*((void *)&v110 + 1) + 8 * (void)v77);
                if ((char *)v78 == v77)
                {
                  +[MOEventBundleMO updateManagedObject:*(void *)(*((void *)&v110 + 1) + 8 * (void)v77) eventBundle:v56 inManagedObjectContext:v108];
                  v80 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v136 = v56;
                    _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "update event bundle, %@", buf, 0xCu);
                  }

                  ++v73;
                }
                else
                {
                  [v108 deleteObject:*(void *)(*((void *)&v110 + 1) + 8 * (void)v77)];
                  v81 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                  if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v136 = v79;
                    _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "removed redundant event bundle, %@", buf, 0xCu);
                  }

                  ++v74;
                }
                ++v77;
              }
              while (v72 != v77);
              uint64_t v75 = (uint64_t)&v72[v106];
              v72 = (char *)[v70 countByEnumeratingWithState:&v110 objects:v134 count:16];
            }
            while (v72);
            uint64_t v82 = 0;
            uint64_t v43 = v95 + 48;
            id v54 = v94;
          }
          else
          {
            v73 = 0;
            v74 = 0;
            uint64_t v82 = 0;
          }
        }
        else
        {
          id v83 = +[MOEventBundleMO managedObjectWithEventBundle:v56 inManagedObjectContext:v108];
          v70 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v136 = v56;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "save event bundle, %@", buf, 0xCu);
          }
          v73 = 0;
          v74 = 0;
          uint64_t v82 = 1;
        }

        uint64_t v84 = *(void *)(*(void *)v43 + 8);
        id v109 = *(id *)(v84 + 40);
        unsigned __int8 v85 = [v108 save:&v109];
        objc_storeStrong((id *)(v84 + 40), v109);
        if (v85)
        {
          uint64_t v86 = *(void *)(*(void *)v43 + 8);
          v87 = *(void **)(v86 + 40);
          *(void *)(v86 + 40) = 0;

          v88 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
          v89 = v100;
          if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218496;
            id v136 = v73;
            __int16 v137 = 2048;
            v138 = v74;
            __int16 v139 = 2048;
            uint64_t v140 = v82;
            _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_INFO, "updating event bundles succeeded, updated, %lu, revmoed, %lu, saved, %lu", buf, 0x20u);
          }
        }
        else
        {
          v88 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
          v89 = v100;
          if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
            __58__MOEventBundleStore_storeEventBundles_CompletionHandler___block_invoke_cold_1(v132, v43, &v133, v88);
          }
        }

        uint64_t v55 = v104 + 1;
      }
      while ((id)(v104 + 1) != v54);
      id v54 = [v96 countByEnumeratingWithState:&v115 objects:v145 count:16];
    }
    while (v54);
  }

  uint64_t v90 = [*(id *)(v95 + 40) _updateLongTermBundles:v93 context:v108];
  uint64_t v91 = *(void *)(*(void *)(v95 + 48) + 8);
  v92 = *(void **)(v91 + 40);
  *(void *)(v91 + 40) = v90;
}

+ (BOOL)_isResourceTypeAllowedForResource:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 type] <= 0x10)
  {
    id v5 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v4 type]);
    unsigned __int8 v3 = [&off_1002F9308 containsObject:v5];
  }
  return v3 & 1;
}

+ (BOOL)_recordDedupeKey:(id)a3 alreadySeenKeys:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    if ([v6 containsObject:v5])
    {
      uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "The dedupe key, %@, was already seen.", (uint8_t *)&v11, 0xCu);
      }
      BOOL v9 = 0;
    }
    else
    {
      [v7 addObject:v5];
      uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
      BOOL v9 = 1;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "New dedupe key, %@.", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      +[MOEventBundleStore _recordDedupeKey:alreadySeenKeys:](v8);
    }
    BOOL v9 = 1;
  }

  return v9;
}

+ (BOOL)_recordResource:(id)a3 alreadySeenKeys:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v14 = 0;
  id v7 = [v5 getDedupeKeyError:&v14];
  id v8 = v14;
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (!v9) {
    goto LABEL_9;
  }
  v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    +[MOEventBundleStore _recordResource:alreadySeenKeys:]((uint64_t)v8, v5);
  }

  uint64_t v11 = [v5 identifier];

  id v7 = v11;
  if (!v11)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      +[MOEventBundleStore _recordResource:alreadySeenKeys:]((uint64_t)v5, v7);
    }
    BOOL v12 = 0;
  }
  else
  {
LABEL_9:
    BOOL v12 = +[MOEventBundleStore _recordDedupeKey:v7 alreadySeenKeys:v6];
  }

  return v12;
}

- (id)_updateLongTermBundles:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v286 = 0u;
  long long v287 = 0u;
  long long v288 = 0u;
  long long v289 = 0u;
  id v7 = v5;
  id v223 = [v7 countByEnumeratingWithState:&v286 objects:v314 count:16];
  id v8 = 0;
  if (!v223)
  {
LABEL_206:

    id v8 = v8;
    v213 = v8;
    goto LABEL_208;
  }
  uint64_t v221 = *(void *)v287;
  BOOL v9 = &OBJC_IVAR___MOPhotoManager__visualIdentifierView;
  id v242 = v6;
  v222 = v7;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    v245 = v8;
    if (*(void *)v287 != v221) {
      objc_enumerationMutation(v7);
    }
    uint64_t v224 = v10;
    uint64_t v11 = *(void **)(*((void *)&v286 + 1) + 8 * v10);
    v243 = [v9 + 320 fetchRequest];
    BOOL v12 = +[NSMutableArray array];
    id v13 = +[NSPredicate predicateWithFormat:@"interfaceType IN %@ ", &off_1002F9320];
    [v12 addObject:v13];

    id v14 = +[NSPredicate predicateWithFormat:@"isAggregatedAndSuppressed == 0"];
    [v12 addObject:v14];

    v15 = [v11 endDate];
    id v16 = +[NSPredicate predicateWithFormat:@"startDate <= %@", v15];
    v313[0] = v16;
    v227 = v11;
    id v17 = [v11 startDate];
    objc_super v18 = +[NSPredicate predicateWithFormat:@"endDate >= %@", v17];
    v313[1] = v18;
    v19 = +[NSArray arrayWithObjects:v313 count:2];
    id v20 = +[NSCompoundPredicate andPredicateWithSubpredicates:v19];
    [v12 addObject:v20];

    id v21 = v12;
    uint64_t v22 = +[NSCompoundPredicate andPredicateWithSubpredicates:v12];
    [v243 setPredicate:v22];

    [v243 setReturnsObjectsAsFaults:0];
    id v23 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
    id v312 = v23;
    uint64_t v24 = +[NSArray arrayWithObjects:&v312 count:1];
    [v243 setSortDescriptors:v24];

    [v243 setFetchBatchSize:100];
    id v285 = v245;
    v225 = [v6 executeFetchRequest:v243 error:&v285];
    id v25 = v285;

    v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      id v28 = [v225 count];
      *(_DWORD *)buf = 138413058;
      *(void *)v308 = v27;
      *(_WORD *)&v308[8] = 2112;
      *(void *)&v308[10] = v243;
      *(_WORD *)&v308[18] = 2048;
      uint64_t v309 = (uint64_t)v28;
      __int16 v310 = 2112;
      id v311 = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%@, summary trip request, %@, fetched subBundle count, %lu, error, %@", buf, 0x2Au);
    }
    if (v25)
    {
      id v8 = v25;
      v29 = v243;
      id v215 = v8;
      id v30 = v25;
      BOOL v9 = &OBJC_IVAR___MOPhotoManager__visualIdentifierView;
      goto LABEL_203;
    }
    v219 = v21;
    v31 = +[MOEventBundleMO fetchRequest];

    v32 = [v227 suggestionID];
    v33 = +[NSPredicate predicateWithFormat:@"%K == %@", @"suggestionID", v32];
    v306 = v33;
    v34 = +[NSArray arrayWithObjects:&v306 count:1];
    v35 = +[NSCompoundPredicate andPredicateWithSubpredicates:v34];
    [v31 setPredicate:v35];

    id v36 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:0];
    id v305 = v36;
    id v37 = +[NSArray arrayWithObjects:&v305 count:1];
    [v31 setSortDescriptors:v37];

    [v31 setReturnsObjectsAsFaults:0];
    id v284 = 0;
    v220 = v31;
    uint64_t v38 = [v6 executeFetchRequest:v31 error:&v284];
    id v39 = v284;
    v40 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      id v42 = [v38 count];
      *(_DWORD *)buf = 138413058;
      *(void *)v308 = v41;
      *(_WORD *)&v308[8] = 2112;
      *(void *)&v308[10] = v220;
      *(_WORD *)&v308[18] = 2048;
      uint64_t v309 = (uint64_t)v42;
      __int16 v310 = 2112;
      id v311 = v39;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%@, summary trip request, %@, fetched summary bundle count, %lu, error, %@", buf, 0x2Au);
    }
    v217 = v39;
    v218 = v38;
    if ([v38 count])
    {
      long long v282 = 0u;
      long long v283 = 0u;
      long long v280 = 0u;
      long long v281 = 0u;
      id v43 = v38;
      id v44 = [v43 countByEnumeratingWithState:&v280 objects:v304 count:16];
      if (v44)
      {
        id v45 = v44;
        uint64_t v226 = 0;
        uint64_t v46 = *(void *)v281;
        do
        {
          for (i = 0; i != v45; i = (char *)i + 1)
          {
            if (*(void *)v281 != v46) {
              objc_enumerationMutation(v43);
            }
            uint64_t v48 = *(void *)(*((void *)&v280 + 1) + 8 * i);
            [v6 deleteObject:v48];
            v49 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v308 = v48;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "removed redundant summary trip bundle, %@", buf, 0xCu);
            }
          }
          v226 += (uint64_t)v45;
          id v45 = [v43 countByEnumeratingWithState:&v280 objects:v304 count:16];
        }
        while (v45);
      }
      else
      {
        uint64_t v226 = 0;
      }
    }
    else
    {
      uint64_t v226 = 0;
    }
    v246 = +[NSMutableSet set];
    uint64_t v50 = +[NSMutableSet set];
    v239 = +[NSMutableSet set];
    [v227 setEvents:0];
    [v227 setPlaces:0];
    [v227 setResources:0];
    [v227 setPersons:0];
    v51 = +[MOEventBundleMO managedObjectWithEventBundle:v227 inManagedObjectContext:v6];
    id v52 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v308 = v227;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "save summary trip bundle, %@", buf, 0xCu);
    }
    v236 = (void *)v50;

    v229 = objc_opt_new();
    long long v276 = 0u;
    long long v277 = 0u;
    long long v278 = 0u;
    long long v279 = 0u;
    v244 = v51;
    id obj = [v51 places];
    id v53 = [obj countByEnumeratingWithState:&v276 objects:v303 count:16];
    if (v53)
    {
      id v54 = v53;
      uint64_t v55 = 0;
      uint64_t v56 = *(void *)v277;
      do
      {
        for (j = 0; j != v54; j = (char *)j + 1)
        {
          if (*(void *)v277 != v56) {
            objc_enumerationMutation(obj);
          }
          v58 = *(void **)(*((void *)&v276 + 1) + 8 * (void)j);
          if (!v55) {
            goto LABEL_36;
          }
          uint64_t v59 = [v55 startDate];
          if (!v59) {
            goto LABEL_36;
          }
          v60 = (void *)v59;
          v61 = [v58 startDate];
          id v62 = [v55 startDate];
          unsigned int v63 = [v61 isAfterDate:v62];

          if (v63)
          {
LABEL_36:
            id v64 = v58;

            uint64_t v55 = v64;
          }
        }
        id v54 = [obj countByEnumeratingWithState:&v276 objects:v303 count:16];
      }
      while (v54);
    }
    else
    {
      uint64_t v55 = 0;
    }

    long long v274 = 0u;
    long long v275 = 0u;
    long long v272 = 0u;
    long long v273 = 0u;
    id v65 = v225;
    id v232 = [v65 countByEnumeratingWithState:&v272 objects:v302 count:16];
    if (v232)
    {
      uint64_t v66 = *(void *)v273;
      int obja = -1;
      uint64_t v230 = *(void *)v273;
      id v228 = v65;
      do
      {
        for (id k = 0; k != v232; id k = v84 + 1)
        {
          if (*(void *)v273 != v66) {
            objc_enumerationMutation(v65);
          }
          v233 = (char *)k;
          id v68 = *(void **)(*((void *)&v272 + 1) + 8 * (void)k);
          ++obja;
          uint64_t v69 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
          if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
          {
            v70 = [v68 bundleIdentifier];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v308 = obja;
            *(_WORD *)&v308[4] = 2112;
            *(void *)&v308[6] = v70;
            _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "%d, Considering sub bundle, %@", buf, 0x12u);
          }
          v71 = [v68 place];
          id v72 = [v71 placeType];

          v234 = v68;
          if ((unint64_t)v72 >= 0x65)
          {
            v73 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
            if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
            {
              v74 = [v234 bundleIdentifier];
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v308 = obja;
              *(_WORD *)&v308[4] = 2112;
              *(void *)&v308[6] = v74;
              _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "%d, Sub bundle place larger than city. skipping sub bundle, %@", buf, 0x12u);
            }
            goto LABEL_191;
          }
          v73 = [v68 interfaceType];
          if ([v73 intValue] == 2) {
            goto LABEL_54;
          }
          uint64_t v75 = [v234 interfaceType];
          if ([v75 intValue] == 12)
          {

LABEL_54:
            goto LABEL_55;
          }
          v162 = [v234 place];
          if ((unint64_t)[v162 placeType] >= 0x65)
          {

            goto LABEL_190;
          }
          v163 = [v234 subSuggestionIDs];
          [v227 suggestionID];
          v165 = v164 = v73;
          v166 = [v165 UUIDString];
          unsigned __int8 v238 = [v163 containsObject:v166];

          uint64_t v66 = v230;
          if (v238) {
            goto LABEL_62;
          }
LABEL_55:
          uint64_t v76 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
          if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
          {
            v77 = [v234 bundleIdentifier];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v308 = obja;
            *(_WORD *)&v308[4] = 2112;
            *(void *)&v308[6] = v77;
            _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "%d, Ingesting sub bundle, %@", buf, 0x12u);
          }
          uint64_t v78 = [v234 summarizationGranularity];
          unsigned int v79 = [v78 intValue];

          if (v79 == 2)
          {
            [v234 setIsAggregatedAndSuppressed:1];
          }
          else
          {
            v80 = [v234 summarizationGranularity];
            unsigned int v81 = [v80 intValue];

            if (v81 != 1) {
              [v234 setSummarizationGranularity:&off_1002F7628];
            }
          }
          uint64_t v82 = [v234 interfaceType];
          unsigned int v83 = [v82 intValue];

          if (v83 == 13)
          {
LABEL_62:
            uint64_t v84 = v233;
            continue;
          }
          v237 = v55;
          unsigned __int8 v85 = [v234 suggestionID];
          uint64_t v86 = [v85 UUIDString];

          v231 = v86;
          [v229 addObject:v86];
          v87 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
          if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
          {
            v88 = [v234 bundleIdentifier];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v308 = obja;
            *(_WORD *)&v308[4] = 2112;
            *(void *)&v308[6] = v88;
            _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_INFO, "%d, Ingesting events for sub bundle, %@", buf, 0x12u);
          }
          long long v270 = 0u;
          long long v271 = 0u;
          long long v268 = 0u;
          long long v269 = 0u;
          v89 = [v234 events];
          id v90 = [v89 countByEnumeratingWithState:&v268 objects:v301 count:16];
          if (v90)
          {
            id v91 = v90;
            uint64_t v92 = *(void *)v269;
            do
            {
              for (m = 0; m != v91; m = (char *)m + 1)
              {
                if (*(void *)v269 != v92) {
                  objc_enumerationMutation(v89);
                }
                id v94 = *(void **)(*((void *)&v268 + 1) + 8 * (void)m);
                uint64_t v95 = objc_opt_class();
                id v96 = [v94 eventIdentifier];
                LODWORD(v95) = [v95 _recordDedupeKey:v96 alreadySeenKeys:v246];

                if (v95)
                {
                  [v244 addEventsObject:v94];
                }
                else
                {
                  v97 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                  if (os_log_type_enabled(v97, OS_LOG_TYPE_FAULT)) {
                    -[MOEventBundleStore _updateLongTermBundles:context:].cold.6((uint64_t)v300, (uint64_t)v94);
                  }
                }
              }
              id v91 = [v89 countByEnumeratingWithState:&v268 objects:v301 count:16];
            }
            while (v91);
          }

          uint64_t v98 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
          if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
          {
            v99 = [v234 bundleIdentifier];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v308 = obja;
            *(_WORD *)&v308[4] = 2112;
            *(void *)&v308[6] = v99;
            _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_INFO, "%d, Ingesting resources for sub bundle, %@", buf, 0x12u);
          }
          long long v266 = 0u;
          long long v267 = 0u;
          long long v264 = 0u;
          long long v265 = 0u;
          v100 = [v234 resources];
          id v101 = [v100 countByEnumeratingWithState:&v264 objects:v299 count:16];
          if (v101)
          {
            id v102 = v101;
            uint64_t v103 = *(void *)v265;
            int v104 = -1;
            do
            {
              for (n = 0; n != v102; n = (char *)n + 1)
              {
                if (*(void *)v265 != v103) {
                  objc_enumerationMutation(v100);
                }
                uint64_t v106 = *(void **)(*((void *)&v264 + 1) + 8 * (void)n);
                id v107 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109634;
                  *(_DWORD *)v308 = obja;
                  *(_WORD *)&v308[4] = 1024;
                  *(_DWORD *)&v308[6] = v104 + n + 1;
                  *(_WORD *)&v308[10] = 2112;
                  *(void *)&v308[12] = v106;
                  _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_INFO, "%d.%d, Ingesting resource, %@", buf, 0x18u);
                }

                if ([(id)objc_opt_class() _isResourceTypeAllowedForResource:v106])
                {
                  if ([(id)objc_opt_class() _recordResource:v106 alreadySeenKeys:v239])
                  {
                    id v108 = [v106 clonedObjectWithContext:v6];
                    id v109 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                    if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109634;
                      *(_DWORD *)v308 = obja;
                      *(_WORD *)&v308[4] = 1024;
                      *(_DWORD *)&v308[6] = v104 + n + 1;
                      *(_WORD *)&v308[10] = 2112;
                      *(void *)&v308[12] = v106;
                      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_INFO, "%d.%d, adding resource, %@", buf, 0x18u);
                    }

                    [v244 addResourcesObject:v108];
                  }
                  else
                  {
                    id v108 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                    if (os_log_type_enabled(v108, OS_LOG_TYPE_FAULT)) {
                      -[MOEventBundleStore _updateLongTermBundles:context:].cold.5((uint64_t)v298, (uint64_t)v106);
                    }
                  }
                }
              }
              id v102 = [v100 countByEnumeratingWithState:&v264 objects:v299 count:16];
              v104 += (int)n;
            }
            while (v102);
          }

          long long v262 = 0u;
          long long v263 = 0u;
          long long v260 = 0u;
          long long v261 = 0u;
          long long v110 = [v244 resources];
          long long v111 = [v110 reverseObjectEnumerator];

          id v112 = [v111 countByEnumeratingWithState:&v260 objects:v297 count:16];
          if (v112)
          {
            id v113 = v112;
            char v114 = 0;
            uint64_t v115 = *(void *)v261;
            uint64_t v116 = 200;
            uint64_t v117 = 300;
            do
            {
              for (ii = 0; ii != v113; ii = (char *)ii + 1)
              {
                if (*(void *)v261 != v115) {
                  objc_enumerationMutation(v111);
                }
                id v119 = *(void **)(*((void *)&v260 + 1) + 8 * (void)ii);
                if ([v119 type] == (id)2)
                {
                  [v119 priorityScore];
                  if (v114)
                  {
                    [v119 setPriorityScore:(double)v116++];
                    char v114 = 1;
                  }
                  else
                  {
                    v114 |= v120 == 100.0;
                  }
                }
                else if ([v119 type] == (id)10)
                {
                  [v119 setPriorityScore:(double)v116++];
                }
                else if ([v119 type] == (id)13)
                {
                  [v119 setPriorityScore:(double)v117++];
                }
              }
              id v113 = [v111 countByEnumeratingWithState:&v260 objects:v297 count:16];
            }
            while (v113);
          }

          long long v121 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
          if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
          {
            long long v122 = [v234 bundleIdentifier];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v308 = obja;
            *(_WORD *)&v308[4] = 2112;
            *(void *)&v308[6] = v122;
            _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_INFO, "%d, Ingesting places for sub bundle, %@", buf, 0x12u);
          }
          long long v258 = 0u;
          long long v259 = 0u;
          long long v256 = 0u;
          long long v257 = 0u;
          long long v123 = [v234 places];
          id v124 = [v123 countByEnumeratingWithState:&v256 objects:v296 count:16];
          long long v125 = v236;
          if (v124)
          {
            id v126 = v124;
            uint64_t v127 = *(void *)v257;
            uint64_t v235 = *(void *)v257;
            do
            {
              for (jj = 0; jj != v126; jj = (char *)jj + 1)
              {
                if (*(void *)v257 != v127) {
                  objc_enumerationMutation(v123);
                }
                long long v129 = *(void **)(*((void *)&v256 + 1) + 8 * (void)jj);
                if ((unint64_t)[v129 placeType] <= 5)
                {
                  long long v130 = objc_opt_class();
                  long long v131 = [v129 sourceEventIdentifier];
                  LODWORD(v130) = [v130 _recordDedupeKey:v131 alreadySeenKeys:v246];

                  if (v130)
                  {
                    v132 = v123;
                    uint64_t v133 = [v129 clonedObjectWithContext:v6];
                    v134 = [v244 place];
                    v135 = [v134 name];
                    [v133 setCityName:v135];

                    [v244 addPlacesObject:v133];
                    if (!v237) {
                      goto LABEL_123;
                    }
                    uint64_t v136 = [v237 startDate];
                    if (!v136) {
                      goto LABEL_123;
                    }
                    __int16 v137 = (void *)v136;
                    v138 = [v129 startDate];
                    __int16 v139 = [v237 startDate];
                    unsigned int v140 = [v138 isAfterDate:v139];

                    long long v125 = v236;
                    if (v140)
                    {
LABEL_123:
                      id v141 = v129;

                      v237 = v141;
                    }
                    uint64_t v142 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                    long long v123 = v132;
                    if (os_log_type_enabled(v142, OS_LOG_TYPE_INFO))
                    {
                      id v143 = [v133 identifier];
                      *(_DWORD *)buf = 138412290;
                      *(void *)v308 = v143;
                      _os_log_impl((void *)&_mh_execute_header, v142, OS_LOG_TYPE_INFO, "Place added with identifier, %@", buf, 0xCu);
                    }
                    id v6 = v242;
                    uint64_t v127 = v235;
                  }
                  else
                  {
                    uint64_t v133 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                    if (os_log_type_enabled(v133, OS_LOG_TYPE_FAULT)) {
                      -[MOEventBundleStore _updateLongTermBundles:context:].cold.4((uint64_t)v295, (uint64_t)v129);
                    }
                  }
                }
              }
              id v126 = [v123 countByEnumeratingWithState:&v256 objects:v296 count:16];
            }
            while (v126);
          }

          v144 = [v234 place];
          id v145 = [v144 placeType];

          if ((unint64_t)v145 <= 5)
          {
            v146 = objc_opt_class();
            v147 = [v234 place];
            v148 = [v147 identifier];
            LODWORD(v146) = [v146 _recordDedupeKey:v148 alreadySeenKeys:v246];

            if (v146)
            {
              v149 = [v234 place];
              v150 = [v149 clonedObjectWithContext:v6];

              v151 = [v244 place];
              v152 = [v151 name];
              [v150 setCityName:v152];

              [v244 addPlacesObject:v150];
              if (!v237) {
                goto LABEL_137;
              }
              uint64_t v153 = [v237 startDate];
              if (!v153) {
                goto LABEL_137;
              }
              v154 = (void *)v153;
              v155 = [v234 place];
              v156 = [v155 startDate];
              v157 = [v237 startDate];
              unsigned int v158 = [v156 isAfterDate:v157];

              if (v158)
              {
LABEL_137:
                uint64_t v159 = [v234 place];

                v237 = (void *)v159;
              }
              v160 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
              long long v125 = v236;
              if (os_log_type_enabled(v160, OS_LOG_TYPE_INFO))
              {
                v161 = [v150 identifier];
                *(_DWORD *)buf = 138412290;
                *(void *)v308 = v161;
                _os_log_impl((void *)&_mh_execute_header, v160, OS_LOG_TYPE_INFO, "Place added with identifier, %@", buf, 0xCu);
              }
            }
            else
            {
              v150 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
              if (os_log_type_enabled(v150, OS_LOG_TYPE_FAULT)) {
                -[MOEventBundleStore _updateLongTermBundles:context:]((uint64_t)v294, (uint64_t)v234);
              }
              long long v125 = v236;
            }
          }
          v167 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
          if (os_log_type_enabled(v167, OS_LOG_TYPE_INFO))
          {
            v168 = [v234 bundleIdentifier];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v308 = obja;
            *(_WORD *)&v308[4] = 2112;
            *(void *)&v308[6] = v168;
            _os_log_impl((void *)&_mh_execute_header, v167, OS_LOG_TYPE_INFO, "%d, Ingesting persons for sub bundle, %@", buf, 0x12u);
          }
          long long v254 = 0u;
          long long v255 = 0u;
          long long v252 = 0u;
          long long v253 = 0u;
          v169 = [v234 persons];
          id v170 = [v169 countByEnumeratingWithState:&v252 objects:v293 count:16];
          if (v170)
          {
            id v171 = v170;
            uint64_t v172 = *(void *)v253;
            do
            {
              for (kid k = 0; kk != v171; kid k = (char *)kk + 1)
              {
                if (*(void *)v253 != v172) {
                  objc_enumerationMutation(v169);
                }
                v174 = *(void **)(*((void *)&v252 + 1) + 8 * (void)kk);
                v175 = [v174 identifier];

                if (!v175)
                {
                  v181 = [v174 contactIdentifier];

                  if (v181)
                  {
                    v182 = objc_opt_class();
                    v183 = [v174 contactIdentifier];
                    LODWORD(v182) = [v182 _recordDedupeKey:v183 alreadySeenKeys:v125];

                    if (v182)
                    {
                      v184 = [v174 clonedObjectWithContext:v242];
                      v185 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                      if (os_log_type_enabled(v185, OS_LOG_TYPE_INFO))
                      {
                        v186 = [v174 identifier];
                        *(_DWORD *)buf = 138412290;
                        *(void *)v308 = v186;
                        _os_log_impl((void *)&_mh_execute_header, v185, OS_LOG_TYPE_INFO, "Person added with contact identifier, %@", buf, 0xCu);

                        long long v125 = v236;
                      }

                      [v244 addPersonsObject:v184];
                    }
                    else
                    {
                      v184 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                      if (os_log_type_enabled(v184, OS_LOG_TYPE_FAULT)) {
                        -[MOEventBundleStore _updateLongTermBundles:context:]((uint64_t)v291, (uint64_t)v174);
                      }
                    }
                  }
                  else
                  {
                    v184 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                    if (os_log_type_enabled(v184, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)v308 = v174;
                      _os_log_fault_impl((void *)&_mh_execute_header, v184, OS_LOG_TYPE_FAULT, "Person, %@, has both identifier and contactIdentifier nil", buf, 0xCu);
                    }
                  }
                  goto LABEL_175;
                }
                v176 = objc_opt_class();
                v177 = [v174 identifier];
                LODWORD(v176) = [v176 _recordDedupeKey:v177 alreadySeenKeys:v125];

                if (v176)
                {
                  v178 = [v174 clonedObjectWithContext:v242];
                  v179 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                  if (os_log_type_enabled(v179, OS_LOG_TYPE_INFO))
                  {
                    v180 = [v174 identifier];
                    *(_DWORD *)buf = 138412290;
                    *(void *)v308 = v180;
                    _os_log_impl((void *)&_mh_execute_header, v179, OS_LOG_TYPE_INFO, "Person added with local identifier, %@", buf, 0xCu);

                    long long v125 = v236;
                  }

                  [v244 addPersonsObject:v178];
                }
                else
                {
                  v178 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                  if (os_log_type_enabled(v178, OS_LOG_TYPE_FAULT)) {
                    -[MOEventBundleStore _updateLongTermBundles:context:]((uint64_t)v292, (uint64_t)v174);
                  }
                }

                v187 = [v174 contactIdentifier];

                if (v187)
                {
                  v188 = objc_opt_class();
                  v184 = [v174 contactIdentifier];
                  [v188 _recordDedupeKey:v184 alreadySeenKeys:v125];
LABEL_175:

                  continue;
                }
              }
              id v171 = [v169 countByEnumeratingWithState:&v252 objects:v293 count:16];
            }
            while (v171);
          }

          v189 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
          if (os_log_type_enabled(v189, OS_LOG_TYPE_INFO))
          {
            v190 = [v234 bundleIdentifier];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v308 = obja;
            *(_WORD *)&v308[4] = 2112;
            *(void *)&v308[6] = v190;
            _os_log_impl((void *)&_mh_execute_header, v189, OS_LOG_TYPE_INFO, "%d, Ingesting photo trait for sub bundle, %@", buf, 0x12u);
          }
          long long v250 = 0u;
          long long v251 = 0u;
          long long v248 = 0u;
          long long v249 = 0u;
          v191 = [v234 photoTraits];
          id v192 = [v191 countByEnumeratingWithState:&v248 objects:v290 count:16];
          id v6 = v242;
          v73 = v231;
          if (v192)
          {
            id v193 = v192;
            uint64_t v194 = *(void *)v249;
            do
            {
              for (mm = 0; mm != v193; mm = (char *)mm + 1)
              {
                if (*(void *)v249 != v194) {
                  objc_enumerationMutation(v191);
                }
                v196 = *(void **)(*((void *)&v248 + 1) + 8 * (void)mm);
                v197 = objc_opt_class();
                v198 = [v196 identifier];
                LODWORD(v197) = [v197 _recordDedupeKey:v198 alreadySeenKeys:v246];

                if (v197)
                {
                  v199 = [v196 clonedObjectWithContext:v242];
                  [v244 addPhotoTraitsObject:v199];
                }
              }
              id v193 = [v191 countByEnumeratingWithState:&v248 objects:v290 count:16];
            }
            while (v193);
          }

          id v65 = v228;
          uint64_t v55 = v237;
LABEL_190:
          uint64_t v66 = v230;
LABEL_191:
          uint64_t v84 = v233;
        }
        id v232 = [v65 countByEnumeratingWithState:&v272 objects:v302 count:16];
      }
      while (v232);
    }

    v200 = [v229 allObjects];
    [v244 setSubBundleIDs:v200];

    if (v55)
    {
      [v55 latitude];
      double v202 = v201;
      v203 = [v244 place];
      [v203 setLatitude:v202];

      [v55 longitude];
      double v205 = v204;
      v206 = [v244 place];
      [v206 setLongitude:v205];

      [v55 range];
      double v208 = v207;
      v209 = [v244 place];
      [v209 setRange:v208];
    }
    v210 = [v244 events];
    uint64_t v211 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v210 count]);
    [v244 setEventCount:v211];

    id v247 = v217;
    LOBYTE(v211) = [v6 save:&v247];
    id v8 = v247;

    BOOL v9 = &OBJC_IVAR___MOPhotoManager__visualIdentifierView;
    if (v211)
    {

      v212 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
      id v21 = v219;
      if (os_log_type_enabled(v212, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218496;
        *(void *)v308 = 0;
        *(_WORD *)&v308[8] = 2048;
        *(void *)&v308[10] = v226;
        *(_WORD *)&v308[18] = 2048;
        uint64_t v309 = 1;
        _os_log_impl((void *)&_mh_execute_header, v212, OS_LOG_TYPE_INFO, "updating summary trip bundles succeeded, updated, %lu, removed, %lu, saved, %lu", buf, 0x20u);
      }
      id v8 = 0;
    }
    else
    {
      v212 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
      id v21 = v219;
      if (os_log_type_enabled(v212, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v308 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v212, OS_LOG_TYPE_ERROR, "summary trip error, %@", buf, 0xCu);
      }
    }
    v29 = v220;

    [v6 reset];
    id v30 = 0;
LABEL_203:

    id v7 = v222;
    if (v30) {
      break;
    }
    uint64_t v10 = v224 + 1;
    if ((id)(v224 + 1) == v223)
    {
      id v223 = [v222 countByEnumeratingWithState:&v286 objects:v314 count:16];
      if (!v223) {
        goto LABEL_206;
      }
      goto LABEL_3;
    }
  }

  v213 = v215;
LABEL_208:

  return v213;
}

- (void)removeEventBundles:(id)a3 CompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  objc_super v18 = __Block_byref_object_copy__32;
  v19 = __Block_byref_object_dispose__32;
  id v20 = 0;
  BOOL v9 = [(MOEventBundleStore *)self persistenceManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __59__MOEventBundleStore_removeEventBundles_CompletionHandler___block_invoke;
  v11[3] = &unk_1002D0F40;
  id v10 = v7;
  id v12 = v10;
  id v13 = &v15;
  SEL v14 = a2;
  [v9 performBlockAndWait:v11];

  [(MOEventBundleStore *)self reset];
  if (v8) {
    v8[2](v8, v16[5], &__NSDictionary0__struct);
  }

  _Block_object_dispose(&v15, 8);
}

void __59__MOEventBundleStore_removeEventBundles_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [*(id *)(a1 + 32) count]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = *(id *)(a1 + 32);
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      BOOL v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v9) bundleIdentifier];
        [v4 addObject:v10];

        BOOL v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v7);
  }

  uint64_t v11 = +[MOEventBundleMO fetchRequest];
  id v12 = +[NSPredicate predicateWithFormat:@"bundleIdentifier IN %@", v4];
  [v11 setPredicate:v12];

  id v13 = [objc_alloc((Class)NSBatchDeleteRequest) initWithFetchRequest:v11];
  [v13 setResultType:2];
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v14 + 40);
  uint64_t v15 = [v3 executeRequest:v13 error:&obj];
  objc_storeStrong((id *)(v14 + 40), obj);
  id v16 = [v15 result];
  uint64_t v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    objc_super v18 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    v26 = v18;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2112;
    id v30 = v16;
    __int16 v31 = 2112;
    uint64_t v32 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %@, error, %@", buf, 0x2Au);
  }
}

- (void)removeAllBundlesWithCompletionHandler:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__32;
  id v12 = __Block_byref_object_dispose__32;
  id v13 = 0;
  id v6 = [(MOEventBundleStore *)self persistenceManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __60__MOEventBundleStore_removeAllBundlesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1002D0F68;
  v7[4] = &v8;
  v7[5] = a2;
  [v6 performBlockAndWait:v7];

  [(MOEventBundleStore *)self reset];
  if (v5) {
    v5[2](v5, v9[5]);
  }
  _Block_object_dispose(&v8, 8);
}

void __60__MOEventBundleStore_removeAllBundlesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOEventBundleMO fetchRequest];
  id v5 = [objc_alloc((Class)NSBatchDeleteRequest) initWithFetchRequest:v4];
  [v5 setResultType:2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v6 + 40);
  id v7 = [v3 executeRequest:v5 error:&obj];

  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = [v7 result];
  BOOL v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    id v16 = v4;
    __int16 v17 = 2112;
    objc_super v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %@, error, %@", buf, 0x2Au);
  }
}

- (void)removeEventBundlesStartedWithinInterval:(id)a3 CompletionHandler:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void, void *))a4;
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x3032000000;
  __int16 v29 = __Block_byref_object_copy__32;
  id v30 = __Block_byref_object_dispose__32;
  id v31 = 0;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__32;
  long long v24 = __Block_byref_object_dispose__32;
  id v25 = &off_1002F7640;
  uint64_t v10 = [(MOEventBundleStore *)self persistenceManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __80__MOEventBundleStore_removeEventBundlesStartedWithinInterval_CompletionHandler___block_invoke;
  v15[3] = &unk_1002CFAD0;
  id v11 = v7;
  id v16 = v11;
  __int16 v17 = &v26;
  objc_super v18 = &v20;
  SEL v19 = a2;
  [v10 performBlockAndWait:v15];

  [(MOEventBundleStore *)self reset];
  if (v8)
  {
    uint64_t v12 = v27[5];
    if (v12)
    {
      id v13 = &__NSDictionary0__struct;
    }
    else
    {
      uint64_t v14 = v21[5];
      CFStringRef v32 = @"resultNumberOfBundleEvents";
      uint64_t v33 = v14;
      id v13 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    }
    v8[2](v8, v12, v13);
    if (!v12) {
  }
    }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
}

void __80__MOEventBundleStore_removeEventBundlesStartedWithinInterval_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v62 = a2;
  id v3 = +[MOEventBundleMO fetchRequest];
  id v4 = [*(id *)(a1 + 32) startDate];
  id v5 = +[NSPredicate predicateWithFormat:@"startDate >= %@", v4];
  v91[0] = v5;
  uint64_t v6 = [*(id *)(a1 + 32) endDate];
  id v7 = +[NSPredicate predicateWithFormat:@"startDate <= %@", v6];
  v91[1] = v7;
  uint64_t v8 = +[NSPredicate predicateWithFormat:@"filtered == NO"];
  v91[2] = v8;
  BOOL v9 = +[NSArray arrayWithObjects:v91 count:3];
  uint64_t v10 = +[NSCompoundPredicate andPredicateWithSubpredicates:v9];
  [(MOEventBundle *)v3 setPredicate:v10];

  id v11 = v62;
  id v12 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:0];
  id v90 = v12;
  id v13 = +[NSArray arrayWithObjects:&v90 count:1];
  [(MOEventBundle *)v3 setSortDescriptors:v13];

  [(MOEventBundle *)v3 setReturnsObjectsAsFaults:0];
  uint64_t v66 = a1;
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v14 = (void *)(a1 + 40);
  uint64_t v16 = *(void *)(v15 + 8);
  id obj = *(id *)(v16 + 40);
  __int16 v17 = [v62 executeFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v16 + 40), obj);
  uint64_t v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 count]);
  uint64_t v19 = *(void *)(v14[1] + 8);
  uint64_t v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;

  long long v21 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v56 = NSStringFromSelector(*(SEL *)(v66 + 56));
    id v57 = [v17 count];
    uint64_t v58 = *(void *)(*(void *)(*(void *)(v66 + 40) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    uint64_t v76 = v56;
    __int16 v77 = 2112;
    uint64_t v78 = v3;
    __int16 v79 = 2048;
    id v80 = v57;
    __int16 v81 = 2112;
    uint64_t v82 = v58;
    _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (*(void *)(*(void *)(*v14 + 8) + 40) || ![v17 count])
  {
    [v62 reset];
  }
  else
  {
    uint64_t v59 = v14;
    v61 = v3;
    unsigned int v63 = objc_opt_new();
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v60 = v17;
    id v22 = v17;
    id v23 = [v22 countByEnumeratingWithState:&v70 objects:v89 count:16];
    if (v23)
    {
      id v24 = v23;
      id v25 = 0;
      uint64_t v26 = 0;
      uint64_t v64 = 0;
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      uint64_t v29 = *(void *)v71;
      id v68 = v22;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v71 != v29) {
            objc_enumerationMutation(v68);
          }
          id v31 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          CFStringRef v32 = [[MOEventBundle alloc] initWithEventBundleMO:v31];
          if ([(MOEventBundle *)v32 bundleManagementPolicy])
          {
            if ((id)[(MOEventBundle *)v32 interfaceType] == (id)13)
            {
              ++v28;
            }
            else if ((id)[(MOEventBundle *)v32 interfaceType] == (id)11)
            {
              v67 = v25;
              uint64_t v36 = v27;
              id v37 = [(MOEventBundle *)v32 resources];
              id v38 = [v37 count];

              if (v38)
              {
                uint64_t v65 = v28;
                id v39 = [(MOEventBundle *)v32 resources];
                v40 = [v39 firstObject];
                id v41 = [v40 name];

                id v42 = [v63 objectForKey:v41];
                if (v42)
                {
                  [v31 setFiltered:1];
                  ++v64;
                  id v43 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                  {
                    id v44 = NSStringFromSelector(*(SEL *)(v66 + 56));
                    *(_DWORD *)buf = 138412546;
                    uint64_t v76 = v44;
                    __int16 v77 = 2112;
                    uint64_t v78 = v32;
                    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%@, evergreen bundle to delete (old), %@", buf, 0x16u);
                  }
                }
                else
                {
                  id v43 = [(MOEventBundle *)v32 suggestionID];
                  [v63 setObject:v43 forKey:v41];
                }
                uint64_t v28 = v65;
              }
              uint64_t v27 = v36 + 1;
              id v25 = v67;
            }
            ++v26;
          }
          else
          {
            [v31 setFiltered:1];
            uint64_t v33 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(*(SEL *)(v66 + 56));
              v35 = uint64_t v34 = v28;
              *(_DWORD *)buf = 138412546;
              uint64_t v76 = v35;
              __int16 v77 = 2112;
              uint64_t v78 = v32;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%@, bundle to delete, %@", buf, 0x16u);

              uint64_t v28 = v34;
            }
            ++v25;
          }
        }
        id v22 = v68;
        id v24 = [v68 countByEnumeratingWithState:&v70 objects:v89 count:16];
      }
      while (v24);
    }
    else
    {
      id v25 = 0;
      uint64_t v26 = 0;
      uint64_t v64 = 0;
      uint64_t v27 = 0;
      uint64_t v28 = 0;
    }
    uint64_t v45 = v28;

    uint64_t v46 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v47 = NSStringFromSelector(*(SEL *)(v66 + 56));
      uint64_t v48 = (MOEventBundle *)[v22 count];
      *(_DWORD *)buf = 138412546;
      uint64_t v76 = v47;
      __int16 v77 = 2048;
      uint64_t v78 = v48;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "%@, trying to delete event bundles count %lu", buf, 0x16u);
    }
    uint64_t v49 = *(void *)(*v59 + 8);
    id v69 = *(id *)(v49 + 40);
    id v11 = v62;
    unsigned __int8 v50 = [v62 save:&v69];
    objc_storeStrong((id *)(v49 + 40), v69);
    v51 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    id v52 = v51;
    if (v50)
    {
      uint64_t v53 = v27;
      __int16 v17 = v60;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        id v54 = NSStringFromSelector(*(SEL *)(v66 + 56));
        uint64_t v55 = (MOEventBundle *)[*(id *)(*(void *)(*(void *)(v66 + 48) + 8) + 40) unsignedLongValue];
        *(_DWORD *)buf = 138413826;
        uint64_t v76 = v54;
        __int16 v77 = 2048;
        uint64_t v78 = v55;
        __int16 v79 = 2048;
        id v80 = v25;
        __int16 v81 = 2048;
        uint64_t v82 = v26;
        __int16 v83 = 2048;
        uint64_t v84 = v45;
        __int16 v85 = 2048;
        uint64_t v86 = v53;
        __int16 v87 = 2048;
        uint64_t v88 = v64;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "%@, event bundles delete operation succeeded, total, %lu, deleted, %lu, not deleted, %lu, trip, %lu, evergreen, %lu (deduped, %lu)", buf, 0x48u);
      }
    }
    else
    {
      __int16 v17 = v60;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        __80__MOEventBundleStore_removeEventBundlesStartedWithinInterval_CompletionHandler___block_invoke_cold_1(v66);
      }
    }

    id v3 = v61;
  }
}

- (void)purgeDeletedEventBundlesWithCompletionHandler:(id)a3
{
  id v5 = (void (**)(id, void, void *))a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__32;
  id v22 = __Block_byref_object_dispose__32;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__32;
  uint64_t v16 = __Block_byref_object_dispose__32;
  __int16 v17 = &off_1002F7640;
  id v7 = [(MOEventBundleStore *)self persistenceManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __68__MOEventBundleStore_purgeDeletedEventBundlesWithCompletionHandler___block_invoke;
  v11[3] = &unk_1002D0F90;
  void v11[4] = &v18;
  v11[5] = &v12;
  v11[6] = a2;
  [v7 performBlockAndWait:v11];

  [(MOEventBundleStore *)self reset];
  if (v5)
  {
    uint64_t v8 = v19[5];
    if (v8)
    {
      BOOL v9 = &__NSDictionary0__struct;
    }
    else
    {
      uint64_t v10 = v13[5];
      CFStringRef v24 = @"resultNumberOfBundleEvents";
      uint64_t v25 = v10;
      BOOL v9 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    }
    v5[2](v5, v8, v9);
    if (!v8) {
  }
    }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
}

void __68__MOEventBundleStore_purgeDeletedEventBundlesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOEventBundleMO fetchRequest];
  id v5 = +[NSPredicate predicateWithFormat:@"filtered == YES"];
  __int16 v79 = v5;
  uint64_t v6 = +[NSArray arrayWithObjects:&v79 count:1];
  id v7 = +[NSCompoundPredicate andPredicateWithSubpredicates:v6];
  [v4 setPredicate:v7];

  id v8 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:0];
  id v78 = v8;
  BOOL v9 = +[NSArray arrayWithObjects:&v78 count:1];
  [v4 setSortDescriptors:v9];

  [v4 setReturnsObjectsAsFaults:0];
  uint64_t v53 = a1;
  id v54 = v4;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v10 = a1 + 32;
  uint64_t v12 = *(void *)(v11 + 8);
  id obj = *(id *)(v12 + 40);
  id v13 = [v3 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v12 + 40), obj);
  uint64_t v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v48 = NSStringFromSelector(*(SEL *)(v53 + 48));
    id v49 = [v13 count];
    uint64_t v50 = *(void *)(*(void *)(*(void *)(v53 + 32) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    id v68 = v48;
    __int16 v69 = 2112;
    id v70 = v54;
    __int16 v71 = 2048;
    id v72 = v49;
    __int16 v73 = 2112;
    uint64_t v74 = v50;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (*(void *)(*(void *)(*(void *)v10 + 8) + 40) || ![v13 count])
  {
    [v3 reset];
  }
  else
  {
    uint64_t v51 = v10;
    uint64_t v15 = objc_opt_new();
    uint64_t v16 = objc_opt_new();
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v52 = v13;
    id v17 = v13;
    id v18 = [v17 countByEnumeratingWithState:&v61 objects:v77 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v62;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v62 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          id v23 = [v22 suggestionID:v51];

          if (v23)
          {
            CFStringRef v24 = [v22 suggestionID];
            unsigned int v25 = [v15 containsObject:v24];

            if (v25)
            {
              [v16 addObject:v22];
            }
            else
            {
              uint64_t v27 = [v22 suggestionID];
              [v15 addObject:v27];
            }
          }
          else
          {
            uint64_t v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              uint64_t v55 = NSStringFromSelector(*(SEL *)(v53 + 48));
              id v28 = [v17 count];
              uint64_t v29 = *(void *)(*(void *)(*(void *)(v53 + 32) + 8) + 40);
              *(_DWORD *)buf = 138413314;
              id v68 = v55;
              __int16 v69 = 2112;
              id v70 = v54;
              __int16 v71 = 2048;
              id v72 = v28;
              __int16 v73 = 2112;
              uint64_t v74 = v29;
              __int16 v75 = 2112;
              uint64_t v76 = v22;
              _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@, request, %@, results count, %lu, error, %@, incorrect context in eventBundle, %@", buf, 0x34u);
            }
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v61 objects:v77 count:16];
      }
      while (v19);
    }

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v30 = v16;
    id v31 = [v30 countByEnumeratingWithState:&v57 objects:v66 count:16];
    uint64_t v32 = v51;
    if (v31)
    {
      id v33 = v31;
      uint64_t v34 = *(void *)v58;
      do
      {
        for (j = 0; j != v33; j = (char *)j + 1)
        {
          if (*(void *)v58 != v34) {
            objc_enumerationMutation(v30);
          }
          [v3 deleteObject:*(void *)(*((void *)&v57 + 1) + 8 * (void)j) v51];
        }
        id v33 = [v30 countByEnumeratingWithState:&v57 objects:v66 count:16];
      }
      while (v33);
    }

    uint64_t v36 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v30 count]);
    uint64_t v37 = *(void *)(*(void *)(v53 + 40) + 8);
    id v38 = *(void **)(v37 + 40);
    *(void *)(v37 + 40) = v36;

    id v39 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = NSStringFromSelector(*(SEL *)(v53 + 48));
      id v41 = [v15 count];
      id v42 = [v30 count];
      *(_DWORD *)buf = 138412802;
      id v68 = v40;
      __int16 v69 = 2048;
      id v70 = v41;
      __int16 v71 = 2048;
      id v72 = v42;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%@, purge deleted events, stay, %lu, deleted, %lu", buf, 0x20u);
    }
    uint64_t v43 = *(void *)(*(void *)v32 + 8);
    id v56 = *(id *)(v43 + 40);
    unsigned __int8 v44 = [v3 save:&v56];
    objc_storeStrong((id *)(v43 + 40), v56);
    uint64_t v45 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    uint64_t v46 = v45;
    if (v44)
    {
      id v13 = v52;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v47 = NSStringFromSelector(*(SEL *)(v53 + 48));
        *(_DWORD *)buf = 138412290;
        id v68 = v47;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "%@, event bundles delete operation succeeded", buf, 0xCu);
      }
    }
    else
    {
      id v13 = v52;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        __68__MOEventBundleStore_purgeDeletedEventBundlesWithCompletionHandler___block_invoke_cold_1(v53);
      }
    }
  }
}

- (void)purgeExpiredEventBundlesWithCompletionHandler:(id)a3
{
  id v5 = (void (**)(id, void, void *))a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__32;
  long long v21 = __Block_byref_object_dispose__32;
  id v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__32;
  uint64_t v15 = __Block_byref_object_dispose__32;
  uint64_t v16 = &off_1002F7640;
  uint64_t v6 = [(MOEventBundleStore *)self persistenceManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __68__MOEventBundleStore_purgeExpiredEventBundlesWithCompletionHandler___block_invoke;
  v10[3] = &unk_1002CFAD0;
  v10[4] = self;
  v10[5] = &v17;
  v10[6] = &v11;
  v10[7] = a2;
  [v6 performBlockAndWait:v10];

  if (v5)
  {
    uint64_t v7 = v18[5];
    if (v7)
    {
      id v8 = &__NSDictionary0__struct;
    }
    else
    {
      uint64_t v9 = v12[5];
      CFStringRef v23 = @"resultNumberOfBundleEvents";
      uint64_t v24 = v9;
      id v8 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    }
    v5[2](v5, v7, v8);
    if (!v7) {
  }
    }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
}

void __68__MOEventBundleStore_purgeExpiredEventBundlesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOEventBundleMO fetchRequest];
  id v5 = [*(id *)(a1 + 32) configurationManager];
  [v5 getDoubleSettingForKey:@"EventBundleManagerOverrideMaximumEventBundleAge" withFallback:2419200.0];
  double v7 = v6;

  id v8 = +[NSDate date];
  uint64_t v9 = +[NSDate dateWithTimeInterval:v8 sinceDate:-v7];

  uint64_t v10 = [*(id *)(a1 + 32) configurationManager];
  [v10 getDoubleSettingForKey:@"EventBundleManagerOverrideRefreshMinimumLookBackWindowFull" withFallback:2419200.0];
  double v12 = v11;

  uint64_t v13 = +[NSDate date];
  uint64_t v14 = +[NSDate dateWithTimeInterval:v13 sinceDate:-v12];

  uint64_t v15 = +[NSDate date];
  uint64_t v16 = +[NSPredicate predicateWithFormat:@"expirationDate < %@ || endDate < %@ || (endDate < %@  && filtered == 1)", v15, v9, v14];
  [v4 setPredicate:v16];

  [v4 setReturnsObjectsAsFaults:0];
  uint64_t v17 = a1 + 40;
  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v18 + 40);
  uint64_t v19 = [v3 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v18 + 40), obj);
  uint64_t v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v19 count]);
  uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
  id v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  CFStringRef v23 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v35 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v36 = [v19 count];
    uint64_t v37 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    id v46 = v35;
    __int16 v47 = 2112;
    uint64_t v48 = v4;
    __int16 v49 = 2048;
    id v50 = v36;
    __int16 v51 = 2112;
    uint64_t v52 = v37;
    _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (!*(void *)(*(void *)(*(void *)v17 + 8) + 40) && [v19 count])
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v24 = v19;
    id v25 = [v24 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v40;
      do
      {
        id v28 = 0;
        do
        {
          if (*(void *)v40 != v27) {
            objc_enumerationMutation(v24);
          }
          [v3 deleteObject:*(void *)(*((void *)&v39 + 1) + 8 * (void)v28)];
          id v28 = (char *)v28 + 1;
        }
        while (v26 != v28);
        id v26 = [v24 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v26);
    }

    uint64_t v29 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      id v30 = [v24 count];
      *(_DWORD *)buf = 134217984;
      id v46 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "trying to purge event bundles count %lu", buf, 0xCu);
    }

    uint64_t v31 = *(void *)(*(void *)v17 + 8);
    id v38 = *(id *)(v31 + 40);
    unsigned __int8 v32 = [v3 save:&v38];
    objc_storeStrong((id *)(v31 + 40), v38);
    id v33 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    uint64_t v34 = v33;
    if (v32)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "saving event bundles purge operation succeeded", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      __68__MOEventBundleStore_purgeExpiredEventBundlesWithCompletionHandler___block_invoke_cold_1();
    }
  }
  [v3 reset];
}

- (void)purgeEventBundlesWithNoEventsAssociatedWithCompletionHandler:(id)a3
{
  id v5 = (void (**)(id, void, void *))a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__32;
  uint64_t v18 = __Block_byref_object_dispose__32;
  id v19 = 0;
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  double v6 = [(MOEventBundleStore *)self persistenceManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __83__MOEventBundleStore_purgeEventBundlesWithNoEventsAssociatedWithCompletionHandler___block_invoke;
  v9[3] = &unk_1002D0F90;
  v9[5] = &v10;
  v9[6] = a2;
  v9[4] = &v14;
  [v6 performBlockAndWait:v9];

  if (v5)
  {
    uint64_t v7 = v15[5];
    if (v7)
    {
      id v8 = &__NSDictionary0__struct;
    }
    else
    {
      CFStringRef v20 = @"resultNumberOfBundleEvents";
      double v6 = +[NSNumber numberWithInt:*((unsigned int *)v11 + 6)];
      uint64_t v21 = v6;
      id v8 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    }
    v5[2](v5, v7, v8);
    if (!v7)
    {
    }
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

void __83__MOEventBundleStore_purgeEventBundlesWithNoEventsAssociatedWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOEventBundleMO fetchRequest];
  id v5 = +[NSPredicate predicateWithFormat:@"interfaceType != %luu", 11];
  [v4 setPredicate:v5];

  [v4 setReturnsObjectsAsFaults:0];
  uint64_t v6 = a1 + 32;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v7 + 40);
  id v8 = [v3 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v24 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v25 = [v8 count];
    uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    id v36 = v24;
    __int16 v37 = 2112;
    id v38 = v4;
    __int16 v39 = 2048;
    id v40 = v25;
    __int16 v41 = 2112;
    uint64_t v42 = v26;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (*(void *)(*(void *)(*(void *)v6 + 8) + 40) || ![v8 count])
  {
    [v3 reset];
  }
  else
  {
    uint64_t v27 = v4;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v16 = [v15 events];
          id v17 = [v16 count];

          if (!v17)
          {
            [v3 deleteObject:v15];
            ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v12);
    }

    uint64_t v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      *(_DWORD *)buf = 67109120;
      LODWORD(v36) = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "trying to purge non-evergreen event bundles with no events count %i", buf, 8u);
    }

    uint64_t v20 = *(void *)(*(void *)v6 + 8);
    id v28 = *(id *)(v20 + 40);
    unsigned __int8 v21 = [v3 save:&v28];
    objc_storeStrong((id *)(v20 + 40), v28);
    id v22 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    CFStringRef v23 = v22;
    id v4 = v27;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "saving non-evergreen event bundles purge operation succeeded", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __83__MOEventBundleStore_purgeEventBundlesWithNoEventsAssociatedWithCompletionHandler___block_invoke_cold_1();
    }

    [v3 reset];
  }
}

- (void)purgeInvalidEvergreenBundlesWithCompletionHandler:(id)a3
{
  id v5 = (void (**)(id, void, void *))a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__32;
  uint64_t v18 = __Block_byref_object_dispose__32;
  id v19 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  uint64_t v6 = [(MOEventBundleStore *)self persistenceManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __72__MOEventBundleStore_purgeInvalidEvergreenBundlesWithCompletionHandler___block_invoke;
  v9[3] = &unk_1002D0F90;
  v9[5] = &v10;
  v9[6] = a2;
  v9[4] = &v14;
  [v6 performBlockAndWait:v9];

  if (v5)
  {
    uint64_t v7 = v15[5];
    if (v7)
    {
      id v8 = &__NSDictionary0__struct;
    }
    else
    {
      CFStringRef v20 = @"resultNumberOfBundleEvents";
      uint64_t v6 = +[NSNumber numberWithInt:*((unsigned int *)v11 + 6)];
      unsigned __int8 v21 = v6;
      id v8 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    }
    v5[2](v5, v7, v8);
    if (!v7)
    {
    }
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

void __72__MOEventBundleStore_purgeInvalidEvergreenBundlesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOEventBundleMO fetchRequest];
  id v5 = +[NSPredicate predicateWithFormat:@"interfaceType == %luu", 11];
  [v4 setPredicate:v5];

  id v6 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:0];
  id v53 = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:&v53 count:1];
  [v4 setSortDescriptors:v7];

  [v4 setReturnsObjectsAsFaults:0];
  uint64_t v35 = a1;
  id v36 = v3;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v8 = a1 + 32;
  uint64_t v10 = *(void *)(v9 + 8);
  id obj = *(id *)(v10 + 40);
  id v11 = [v3 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    long long v29 = NSStringFromSelector(*(SEL *)(v35 + 48));
    id v30 = [v11 count];
    uint64_t v31 = *(void *)(*(void *)(*(void *)(v35 + 32) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    id v46 = v29;
    __int16 v47 = 2112;
    uint64_t v48 = v4;
    __int16 v49 = 2048;
    id v50 = v30;
    __int16 v51 = 2112;
    uint64_t v52 = v31;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (*(void *)(*(void *)(*(void *)v8 + 8) + 40) || ![v11 count])
  {
    int v13 = v11;
  }
  else
  {
    uint64_t v33 = v8;
    uint64_t v34 = v4;
    id v32 = [v11 count];
    int v13 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v37 = v11;
    id v14 = [v37 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v40;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v40 != v16) {
            objc_enumerationMutation(v37);
          }
          uint64_t v18 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          id v19 = [v18 bundleSubType];
          CFStringRef v20 = (void *)(int)[v19 intValue];

          unsigned __int8 v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[MOEventBundle castEvergreenSubType:v20]);
          if ([v13 containsObject:v21])
          {
            [v36 deleteObject:v18];
            id v22 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v46 = v18;
              __int16 v47 = 2048;
              uint64_t v48 = v20;
              _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "invalid Evergreen bundle, %@, subType, %lu", buf, 0x16u);
            }

            ++*(_DWORD *)(*(void *)(*(void *)(v35 + 40) + 8) + 24);
          }
          else
          {
            [v13 addObject:v21];
          }
        }
        id v15 = [v37 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v15);
    }

    CFStringRef v23 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = (void *)*(int *)(*(void *)(*(void *)(v35 + 40) + 8) + 24);
      *(_DWORD *)buf = 134218240;
      id v46 = v32;
      __int16 v47 = 2048;
      uint64_t v48 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "purge Evergreen, total, %lu, invalid, %lu", buf, 0x16u);
    }

    uint64_t v25 = *(void *)(*(void *)v33 + 8);
    id v38 = *(id *)(v25 + 40);
    unsigned __int8 v26 = [v36 save:&v38];
    objc_storeStrong((id *)(v25 + 40), v38);
    uint64_t v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    id v28 = v27;
    if (v26)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "saving evergreen event bundles purge operation succeeded", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      __72__MOEventBundleStore_purgeInvalidEvergreenBundlesWithCompletionHandler___block_invoke_cold_1();
    }

    id v4 = v34;
  }
  [v36 reset];
}

- (void)purgeEventBundlesWithRehydrationFailureCount:(int)a3 andHandler:(id)a4
{
  uint64_t v7 = (void (**)(id, void, void *))a4;
  if (a3 <= 0)
  {
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MOEventStore purgeRehydrationFailedEventsForType:rehydrationFailCount:CompletionHandler:](a3, v11);
    }

    if (v7)
    {
      CFStringRef v30 = @"resultNumberOfEvents";
      uint64_t v31 = &off_1002F7640;
      uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      v7[2](v7, 0, v12);
    }
  }
  else
  {
    uint64_t v22 = 0;
    CFStringRef v23 = &v22;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy__32;
    unsigned __int8 v26 = __Block_byref_object_dispose__32;
    id v27 = 0;
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    id v19 = __Block_byref_object_copy__32;
    CFStringRef v20 = __Block_byref_object_dispose__32;
    unsigned __int8 v21 = &off_1002F7640;
    uint64_t v8 = [(MOEventBundleStore *)self persistenceManager];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __78__MOEventBundleStore_purgeEventBundlesWithRehydrationFailureCount_andHandler___block_invoke;
    v14[3] = &unk_1002D0FB8;
    int v15 = a3;
    v14[4] = &v22;
    v14[5] = &v16;
    v14[6] = a2;
    [v8 performBlockAndWait:v14];

    if (v7)
    {
      uint64_t v9 = v23[5];
      if (v9)
      {
        uint64_t v10 = &__NSDictionary0__struct;
      }
      else
      {
        uint64_t v13 = v17[5];
        CFStringRef v28 = @"resultNumberOfBundleEvents";
        uint64_t v29 = v13;
        uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      }
      v7[2](v7, v9, v10);
      if (!v9) {
    }
      }
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
  }
}

void __78__MOEventBundleStore_purgeEventBundlesWithRehydrationFailureCount_andHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOEventBundleMO fetchRequest];
  id v5 = +[NSPredicate predicateWithFormat:@"ANY events.rehydrationFailCount >= %d", *(unsigned int *)(a1 + 56)];
  [v4 setPredicate:v5];

  [v4 setReturnsObjectsAsFaults:0];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v3 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 count]);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v13 = [v7 count];
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    id v40 = v12;
    __int16 v41 = 2112;
    long long v42 = v4;
    __int16 v43 = 2048;
    id v44 = v13;
    __int16 v45 = 2112;
    uint64_t v46 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) && [v7 count])
  {
    uint64_t v29 = a1 + 32;
    CFStringRef v30 = v7;
    uint64_t v31 = v4;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v15 = v7;
    id v16 = [v15 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v15);
          }
          CFStringRef v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          unsigned __int8 v21 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            uint64_t v22 = [v20 bundleIdentifier];
            *(_DWORD *)buf = 138412290;
            id v40 = v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "deleting bundle due to rehydration failures %@", buf, 0xCu);
          }
          [v3 deleteObject:v20];
        }
        id v17 = [v15 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v17);
    }

    CFStringRef v23 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = [v15 count];
      *(_DWORD *)buf = 134217984;
      id v40 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "trying to purge event bundles due to rehydration failure count %lu", buf, 0xCu);
    }

    uint64_t v25 = *(void *)(*(void *)v29 + 8);
    id v32 = *(id *)(v25 + 40);
    unsigned __int8 v26 = [v3 save:&v32];
    objc_storeStrong((id *)(v25 + 40), v32);
    id v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    CFStringRef v28 = v27;
    if (v26)
    {
      uint64_t v7 = v30;
      id v4 = v31;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "saving event bundles purge due to rehydration failure succeeded", buf, 2u);
      }
    }
    else
    {
      uint64_t v7 = v30;
      id v4 = v31;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        __78__MOEventBundleStore_purgeEventBundlesWithRehydrationFailureCount_andHandler___block_invoke_cold_1();
      }
    }
  }
  [v3 reset];
}

- (void)purgeDanglingEventBundlesWithHandler:(id)a3
{
  id v5 = (void (**)(id, void, void *))a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  CFStringRef v20 = __Block_byref_object_copy__32;
  unsigned __int8 v21 = __Block_byref_object_dispose__32;
  id v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__32;
  id v15 = __Block_byref_object_dispose__32;
  id v16 = &off_1002F7640;
  uint64_t v6 = [(MOEventBundleStore *)self persistenceManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __59__MOEventBundleStore_purgeDanglingEventBundlesWithHandler___block_invoke;
  v10[3] = &unk_1002D0F90;
  v10[4] = &v17;
  v10[5] = &v11;
  v10[6] = a2;
  [v6 performBlockAndWait:v10];

  if (v5)
  {
    uint64_t v7 = v18[5];
    if (v7)
    {
      uint64_t v8 = &__NSDictionary0__struct;
    }
    else
    {
      uint64_t v9 = v12[5];
      CFStringRef v23 = @"resultNumberOfBundleEvents";
      uint64_t v24 = v9;
      uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    }
    v5[2](v5, v7, v8);
    if (!v7) {
  }
    }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
}

void __59__MOEventBundleStore_purgeDanglingEventBundlesWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOEventBundleMO fetchRequest];
  id v5 = +[NSPredicate predicateWithFormat:@"events.@count < eventCount"];
  [v4 setPredicate:v5];

  [v4 setReturnsObjectsAsFaults:0];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v6 + 40);
  long long v42 = v3;
  uint64_t v7 = [v3 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 count]);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v13 = [v7 count];
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    long long v58 = v12;
    __int16 v59 = 2112;
    *(void *)long long v60 = v4;
    *(_WORD *)&v60[8] = 2048;
    *(void *)&v60[10] = v13;
    __int16 v61 = 2112;
    uint64_t v62 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) && [v7 count])
  {
    uint64_t v37 = a1 + 32;
    id v38 = v7;
    long long v39 = v4;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v40 = v7;
    id v43 = [v40 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v43)
    {
      uint64_t v41 = *(void *)v51;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v51 != v41) {
            objc_enumerationMutation(v40);
          }
          uint64_t v44 = v15;
          id v16 = *(void **)(*((void *)&v50 + 1) + 8 * v15);
          uint64_t v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            uint64_t v18 = [v16 bundleIdentifier];
            uint64_t v19 = [v16 eventCount];
            unsigned int v20 = [v19 intValue];
            unsigned __int8 v21 = [v16 events];
            id v22 = [v21 count];
            *(_DWORD *)buf = 138412802;
            long long v58 = v18;
            __int16 v59 = 1024;
            *(_DWORD *)long long v60 = v20;
            *(_WORD *)&v60[4] = 2048;
            *(void *)&v60[6] = v22;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "deleting dangling bundle %@, initial event count %d, current event count %lu", buf, 0x1Cu);
          }
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          CFStringRef v23 = [v16 events];
          id v24 = [v23 countByEnumeratingWithState:&v46 objects:v55 count:16];
          if (v24)
          {
            id v25 = v24;
            uint64_t v26 = *(void *)v47;
            do
            {
              id v27 = 0;
              do
              {
                if (*(void *)v47 != v26) {
                  objc_enumerationMutation(v23);
                }
                CFStringRef v28 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v27);
                uint64_t v29 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                {
                  CFStringRef v30 = [v16 bundleIdentifier];
                  uint64_t v31 = [v28 eventIdentifier];
                  *(_DWORD *)buf = 138412546;
                  long long v58 = v30;
                  __int16 v59 = 2112;
                  *(void *)long long v60 = v31;
                  _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "dangling bundle %@ is associated with event %@", buf, 0x16u);
                }
                id v27 = (char *)v27 + 1;
              }
              while (v25 != v27);
              id v25 = [v23 countByEnumeratingWithState:&v46 objects:v55 count:16];
            }
            while (v25);
          }

          [v42 deleteObject:v16];
          uint64_t v15 = v44 + 1;
        }
        while ((id)(v44 + 1) != v43);
        id v43 = [v40 countByEnumeratingWithState:&v50 objects:v56 count:16];
      }
      while (v43);
    }

    id v32 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "trying to purge dangling event bundles", buf, 2u);
    }

    uint64_t v33 = *(void *)(*(void *)v37 + 8);
    id v45 = *(id *)(v33 + 40);
    unsigned __int8 v34 = [v42 save:&v45];
    objc_storeStrong((id *)(v33 + 40), v45);
    long long v35 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    long long v36 = v35;
    if (v34)
    {
      uint64_t v7 = v38;
      id v4 = v39;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "saving dangling event bundles purge succeeded", buf, 2u);
      }
    }
    else
    {
      uint64_t v7 = v38;
      id v4 = v39;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        __59__MOEventBundleStore_purgeDanglingEventBundlesWithHandler___block_invoke_cold_1();
      }
    }
  }
  [v42 reset];
}

- (void)fetchEventBundleWithOptions:(id)a3 CompletionHandler:(id)a4
{
  id v7 = a3;
  uint64_t v37 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v62 = 0;
  long long v63 = &v62;
  uint64_t v64 = 0x3032000000;
  uint64_t v65 = __Block_byref_object_copy__32;
  uint64_t v66 = __Block_byref_object_dispose__32;
  id v67 = 0;
  uint64_t v56 = 0;
  long long v57 = &v56;
  uint64_t v58 = 0x3032000000;
  __int16 v59 = __Block_byref_object_copy__32;
  long long v60 = __Block_byref_object_dispose__32;
  id v61 = 0;
  uint64_t v8 = [(MOEventBundleStore *)self persistenceManager];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = __68__MOEventBundleStore_fetchEventBundleWithOptions_CompletionHandler___block_invoke;
  v51[3] = &unk_1002CFAD0;
  id v38 = v7;
  id v52 = v38;
  long long v53 = &v62;
  id v54 = &v56;
  SEL v55 = a2;
  [v8 performBlockAndWait:v51];

  [(MOEventBundleStore *)self reset];
  uint64_t v45 = 0;
  long long v46 = &v45;
  uint64_t v47 = 0x3032000000;
  long long v48 = __Block_byref_object_copy__32;
  long long v49 = __Block_byref_object_dispose__32;
  id v50 = 0;
  if (![(id)v57[5] count]) {
    goto LABEL_25;
  }
  uint64_t v9 = [(MOEventBundleStore *)self engagementDelegate];
  [v9 eventBundleStore:self needsEngagementInfoForBundles:v57[5]];

  if (([v38 skipRanking] & 1) == 0)
  {
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = __68__MOEventBundleStore_fetchEventBundleWithOptions_CompletionHandler___block_invoke_262;
    v44[3] = &unk_1002CB180;
    v44[4] = &v45;
    [(MOEventBundleStore *)self getRankingParamsandCompletionHandler:v44];
    if (v46[5])
    {
      uint64_t v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = v46[5];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v12;
        id v13 = "using stored ranking params succeeded %@";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v13, (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      uint64_t v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = v46[5];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v14;
        id v13 = "using default ranking params %@";
        goto LABEL_9;
      }
    }

    uint64_t v10 = [[MOEventBundleRanking alloc] initWithConfigurationManager:self->_configurationManager];
    [(MOEventBundleRanking *)v10 setRankingParamsFromRankingParamsMO:v46[5]];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v70 = 0x3032000000;
    __int16 v71 = __Block_byref_object_copy__32;
    id v72 = __Block_byref_object_dispose__32;
    id v73 = 0;
    uint64_t v15 = [v38 dateInterval];
    id v16 = [v15 startDate];

    if (v16)
    {
      uint64_t v17 = [v38 dateInterval];
      uint64_t v18 = [v17 startDate];
      uint64_t v19 = +[NSDate firstSaturdayBeforeReferenceDate:v18];

      unsigned int v20 = [v38 dateInterval];
      unsigned __int8 v21 = [v20 startDate];
      LODWORD(v18) = [v19 isBeforeDate:v21];

      if (v18)
      {
        id v22 = objc_alloc((Class)NSDateInterval);
        CFStringRef v23 = [v38 dateInterval];
        id v24 = [v23 startDate];
        id v25 = [v22 initWithStartDate:v19 endDate:v24];

        uint64_t v26 = +[NSSet setWithObject:&off_1002F7658];
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = __68__MOEventBundleStore_fetchEventBundleWithOptions_CompletionHandler___block_invoke_269;
        v43[3] = &unk_1002CB180;
        v43[4] = &buf;
        [(MOEventBundleStore *)self getEventBundleStartedWithInterval:v25 interfaceTypes:v26 CompletionHandler:v43];
      }
    }
    [(MOEventBundleRanking *)v10 identifyRepetitiveSignificantContactBundlesFromBundles:v57[5] precedingSignificantContactBundles:*(void *)(*((void *)&buf + 1) + 40)];
    [(MOEventBundleRanking *)v10 generateBundleRanking:v57[5] withMinRecommendedBundleCountRequirement:1];
    _Block_object_dispose(&buf, 8);

    goto LABEL_15;
  }
  uint64_t v10 = 0;
LABEL_15:
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v29 = (id)v57[5];
  id v30 = [v29 countByEnumeratingWithState:&v39 objects:v68 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v40;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v40 != v31) {
          objc_enumerationMutation(v29);
        }
        uint64_t v33 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        unsigned __int8 v34 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v33;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "final fetched event bundle from store :%@", (uint8_t *)&buf, 0xCu);
        }
      }
      id v30 = [v29 countByEnumeratingWithState:&v39 objects:v68 count:16];
    }
    while (v30);
  }

LABEL_25:
  _Block_object_dispose(&v45, 8);

  v37[2](v37, v57[5], v63[5]);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
}

void __68__MOEventBundleStore_fetchEventBundleWithOptions_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v57 = +[MOEventBundleMO fetchRequest];
  id v4 = +[NSMutableArray array];
  id v5 = +[NSPredicate predicateWithFormat:@"bundleIdentifier!=nil"];
  [v4 addObject:v5];

  uint64_t v6 = +[NSPredicate predicateWithFormat:@"suggestionID!=nil"];
  [v4 addObject:v6];

  if (([*(id *)(a1 + 32) includeDeletedBundles] & 1) == 0)
  {
    id v7 = +[NSPredicate predicateWithFormat:@"filtered == 0"];
    [v4 addObject:v7];
  }
  uint64_t v8 = [*(id *)(a1 + 32) categories];
  id v9 = [v8 count];

  uint64_t v10 = NSAssertionHandler_ptr;
  uint64_t v58 = v4;
  if (v9)
  {
    uint64_t v11 = objc_opt_new();
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v12 = [*(id *)(a1 + 32) categories];
    id v13 = [v12 countByEnumeratingWithState:&v64 objects:v81 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v65;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v65 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = +[NSPredicate predicateWithFormat:@"%@ IN categories", *(void *)(*((void *)&v64 + 1) + 8 * i)];
          [v11 addObject:v17];
        }
        id v14 = [v12 countByEnumeratingWithState:&v64 objects:v81 count:16];
      }
      while (v14);
    }

    uint64_t v10 = NSAssertionHandler_ptr;
    uint64_t v18 = +[NSCompoundPredicate orPredicateWithSubpredicates:v11];
    [v4 addObject:v18];
  }
  uint64_t v19 = [*(id *)(a1 + 32) dateInterval];

  if (v19)
  {
    unsigned int v20 = v10[6];
    unsigned __int8 v21 = [*(id *)(a1 + 32) dateInterval];
    id v22 = [v21 endDate];
    CFStringRef v23 = +[NSPredicate predicateWithFormat:@"startDate <= %@", v22];
    v80[0] = v23;
    id v56 = v3;
    id v24 = [*(id *)(a1 + 32) dateInterval];
    id v25 = [v24 startDate];
    uint64_t v26 = +[NSPredicate predicateWithFormat:@"endDate >= %@", v25];
    v80[1] = v26;
    id v27 = +[NSArray arrayWithObjects:v80 count:2];
    CFStringRef v28 = [v20 andPredicateWithSubpredicates:v27];
    [v58 addObject:v28];

    id v3 = v56;
    uint64_t v10 = NSAssertionHandler_ptr;

    id v4 = v58;
  }
  id v29 = [*(id *)(a1 + 32) identifiers];
  id v30 = [v29 count];

  if (v30)
  {
    uint64_t v31 = [*(id *)(a1 + 32) identifiers];
    id v32 = +[NSPredicate predicateWithFormat:@"bundleIdentifier IN %@", v31];
    [v4 addObject:v32];
  }
  if ((unint64_t)[*(id *)(a1 + 32) interfaceType] <= 0xF)
  {
    uint64_t v33 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"interfaceType == %d", [*(id *)(a1 + 32) interfaceType]);
    [v4 addObject:v33];
  }
  unsigned __int8 v34 = v57;
  if ([v4 count])
  {
    long long v35 = [v10[6] andPredicateWithSubpredicates:v4];
    [v57 setPredicate:v35];
  }
  long long v36 = [*(id *)(a1 + 32) limit];

  if (v36)
  {
    uint64_t v37 = [*(id *)(a1 + 32) limit];
    [v57 setFetchLimit:[v37 unsignedIntegerValue]];
  }
  [v57 setReturnsObjectsAsFaults:0];
  id v38 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:[*(id *)(a1 + 32) ascending]];
  id v79 = v38;
  long long v39 = +[NSArray arrayWithObjects:&v79 count:1];
  [v57 setSortDescriptors:v39];

  [v57 setFetchBatchSize:100];
  uint64_t v40 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v40 + 40);
  long long v41 = [v3 executeFetchRequest:v57 error:&obj];
  objc_storeStrong((id *)(v40 + 40), obj);
  long long v42 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    id v52 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v53 = [v41 count];
    uint64_t v54 = *(void *)(a1 + 32);
    uint64_t v55 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)long long buf = 138413314;
    uint64_t v70 = v52;
    __int16 v71 = 2112;
    id v72 = v57;
    __int16 v73 = 2048;
    id v74 = v53;
    __int16 v75 = 2112;
    uint64_t v76 = v55;
    __int16 v77 = 2112;
    uint64_t v78 = v54;
    _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@, options, %@", buf, 0x34u);
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v43 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v41 count]);
    uint64_t v44 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v45 = *(void **)(v44 + 40);
    *(void *)(v44 + 40) = v43;

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v46 = v41;
    id v47 = [v46 countByEnumeratingWithState:&v59 objects:v68 count:16];
    if (v47)
    {
      id v48 = v47;
      uint64_t v49 = *(void *)v60;
      do
      {
        for (j = 0; j != v48; j = (char *)j + 1)
        {
          if (*(void *)v60 != v49) {
            objc_enumerationMutation(v46);
          }
          long long v51 = [[MOEventBundle alloc] initWithEventBundleMO:*(void *)(*((void *)&v59 + 1) + 8 * (void)j)];
          if (v51) {
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v51];
          }
        }
        id v48 = [v46 countByEnumeratingWithState:&v59 objects:v68 count:16];
      }
      while (v48);
    }

    unsigned __int8 v34 = v57;
    id v4 = v58;
  }
}

uint64_t __68__MOEventBundleStore_fetchEventBundleWithOptions_CompletionHandler___block_invoke_262(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (!a3)
  {
    uint64_t v11 = v5;
    id v5 = [v5 count];
    id v6 = v11;
    if (v5)
    {
      uint64_t v7 = [v11 objectAtIndexedSubscript:0];
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      id v6 = v11;
    }
  }

  return _objc_release_x1(v5, v6);
}

void __68__MOEventBundleStore_fetchEventBundleWithOptions_CompletionHandler___block_invoke_269(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (!a3)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v6 = v7;
  }
}

- (void)fetchEventBundleWithGranularity:(unint64_t)a3 interfaceTypes:(id)a4 CompletionHandler:(id)a5
{
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, uint64_t))a5;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  long long v39 = __Block_byref_object_copy__32;
  uint64_t v40 = __Block_byref_object_dispose__32;
  id v41 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__32;
  unsigned __int8 v34 = __Block_byref_object_dispose__32;
  id v35 = 0;
  uint64_t v11 = [(MOEventBundleStore *)self persistenceManager];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __87__MOEventBundleStore_fetchEventBundleWithGranularity_interfaceTypes_CompletionHandler___block_invoke;
  v24[3] = &unk_1002D0FE0;
  id v19 = v9;
  id v25 = v19;
  uint64_t v26 = &v36;
  unint64_t v28 = a3;
  SEL v29 = a2;
  id v27 = &v30;
  [v11 performBlockAndWait:v24];

  if ([(id)v31[5] count])
  {
    uint64_t v12 = [(MOEventBundleStore *)self engagementDelegate];
    [v12 eventBundleStore:self needsEngagementInfoForBundles:v31[5]];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v13 = (id)v31[5];
    id v14 = [v13 countByEnumeratingWithState:&v20 objects:v44 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v21;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v43 = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "fetched event bundle from store :%@", buf, 0xCu);
          }
        }
        id v14 = [v13 countByEnumeratingWithState:&v20 objects:v44 count:16];
      }
      while (v14);
    }
  }
  v10[2](v10, v31[5], v37[5]);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);
}

void __87__MOEventBundleStore_fetchEventBundleWithGranularity_interfaceTypes_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOEventBundleMO fetchRequest];
  id v5 = +[NSMutableArray array];
  id v6 = +[NSPredicate predicateWithFormat:@"interfaceType IN %@ ", *(void *)(a1 + 32)];
  [v5 addObject:v6];

  id v7 = +[NSPredicate predicateWithFormat:@"summarizationGranularity == %lu", *(void *)(a1 + 56)];
  [v5 addObject:v7];

  uint64_t v8 = +[NSPredicate predicateWithFormat:@"isAggregatedAndSuppressed == 0"];
  [v5 addObject:v8];

  if ([v5 count])
  {
    id v9 = +[NSCompoundPredicate andPredicateWithSubpredicates:v5];
    [v4 setPredicate:v9];
  }
  [v4 setReturnsObjectsAsFaults:0];
  id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v42 = v10;
  uint64_t v11 = +[NSArray arrayWithObjects:&v42 count:1];
  [v4 setSortDescriptors:v11];

  [v4 setFetchBatchSize:100];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v12 + 40);
  id v13 = [v3 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v12 + 40), obj);
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id v24 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v25 = [v13 count];
    uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)long long buf = 138413058;
    id v35 = v24;
    __int16 v36 = 2112;
    uint64_t v37 = v4;
    __int16 v38 = 2048;
    id v39 = v25;
    __int16 v40 = 2112;
    uint64_t v41 = v26;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v27 = v3;
    uint64_t v15 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v13 count]);
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v18 = v13;
    id v19 = [v18 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v29;
      do
      {
        long long v22 = 0;
        do
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v18);
          }
          long long v23 = [[MOEventBundle alloc] initWithEventBundleMO:*(void *)(*((void *)&v28 + 1) + 8 * (void)v22)];
          if (v23) {
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v23];
          }

          long long v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v20);
    }

    id v3 = v27;
  }
  [v3 reset];
}

- (void)fetchBundleTypeDistributionFromStoreWithHandler:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__32;
  uint64_t v15 = __Block_byref_object_dispose__32;
  id v16 = 0;
  id v5 = objc_opt_new();
  id v6 = [(MOEventBundleStore *)self persistenceManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __70__MOEventBundleStore_fetchBundleTypeDistributionFromStoreWithHandler___block_invoke;
  v8[3] = &unk_1002CFAF8;
  id v7 = v5;
  id v9 = v7;
  id v10 = &v11;
  [v6 performBlockAndWait:v8];

  v4[2](v4, v7, v12[5]);
  _Block_object_dispose(&v11, 8);
}

void __70__MOEventBundleStore_fetchBundleTypeDistributionFromStoreWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = 1;
  do
  {
    id v6 = +[MOEventBundleMO fetchRequest];
    id v7 = +[NSPredicate predicateWithFormat:@"interfaceType == %d", v4];
    [v6 setPredicate:v7];

    id v18 = 0;
    id v8 = [v3 countForFetchRequest:v6 error:&v18];
    id v9 = v18;

    if (v8)
    {
      id v10 = +[NSNumber numberWithUnsignedInteger:v8];
      uint64_t v11 = *(void **)(a1 + 32);
      uint64_t v12 = +[NSNumber numberWithInt:v4];
      [v11 setObject:v10 forKeyedSubscript:v12];
    }
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    id v16 = *(void **)(v13 + 40);
    id v14 = (id *)(v13 + 40);
    uint64_t v15 = v16;
    if (v16) {
      uint64_t v17 = v15;
    }
    else {
      uint64_t v17 = v9;
    }
    objc_storeStrong(v14, v17);

    uint64_t v4 = (v4 + 1);
  }
  while (v4 != 16);
  [v3 reset];
}

- (void)getRankingParamsandCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, void))a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__32;
  id v18 = __Block_byref_object_dispose__32;
  id v19 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__32;
  uint64_t v12 = __Block_byref_object_dispose__32;
  id v13 = 0;
  id v5 = [(MOEventBundleStore *)self persistenceManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __59__MOEventBundleStore_getRankingParamsandCompletionHandler___block_invoke;
  v7[3] = &unk_1002D1030;
  v7[4] = &v14;
  v7[5] = &v8;
  [v5 performBlockAndWait:v7];

  id v6 = +[NSArray arrayWithArray:v9[5]];
  v4[2](v4, v6, v15[5]);

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);
}

void __59__MOEventBundleStore_getRankingParamsandCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[MORankingParamsMO fetchRequest];
  [v4 setFetchLimit:1];
  [v4 setReturnsObjectsAsFaults:0];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v5 + 40);
  id v6 = [v3 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __59__MOEventBundleStore_getRankingParamsandCompletionHandler___block_invoke_cold_1();
    }
  }
  else
  {
    id v8 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __59__MOEventBundleStore_getRankingParamsandCompletionHandler___block_invoke_2;
    v11[3] = &unk_1002D1008;
    void v11[4] = *(void *)(a1 + 40);
    [v6 enumerateObjectsUsingBlock:v11];
  }
  [v3 reset];
}

void __59__MOEventBundleStore_getRankingParamsandCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 rankingParams];
  [v2 addObject:v3];
}

- (void)storeRankingParams:(id)a3 forContext:(id)a4 forEvergreenScore:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(MOEventBundleStore *)self persistenceManager];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __70__MOEventBundleStore_storeRankingParams_forContext_forEvergreenScore___block_invoke;
  v13[3] = &unk_1002D1058;
  id v14 = v8;
  id v15 = v9;
  BOOL v17 = a5;
  uint64_t v16 = self;
  id v11 = v9;
  id v12 = v8;
  [v10 performBlockAndWait:v13];
}

void __70__MOEventBundleStore_storeRankingParams_forContext_forEvergreenScore___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[MORankingParamsMO managedObjectWithObject:*(void *)(a1 + 32) inManagedObjectContext:v3 forContext:*(void *)(a1 + 40) forEvergreenScore:*(unsigned __int8 *)(a1 + 56)];
  id v18 = 0;
  unsigned __int8 v5 = [v3 save:&v18];
  id v6 = v18;
  id v7 = v6;
  if (v5)
  {

    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "saving ranking params succeeded %@", buf, 0xCu);
    }

    id v9 = *(void **)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = +[NSDate date];
    [v9 _submitRankingParamsAnalytics:v10 withSubmissionDate:v11];
    id v7 = 0;
  }
  else
  {
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __70__MOEventBundleStore_storeRankingParams_forContext_forEvergreenScore___block_invoke_cold_1((uint64_t)v7, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  [v3 reset];
}

- (void)_submitRankingParamsAnalytics:(id)a3 withSubmissionDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Submitting ranking params to CoreAnalytics.", buf, 2u);
  }

  id v8 = +[NSCalendar currentCalendar];
  id v9 = [v8 components:764 fromDate:v5];

  id v10 = [v9 year];
  id v11 = [v9 month];
  id v12 = [v9 day];
  id v13 = [v9 hour];
  id v14 = [v9 minute];
  uint64_t v15 = objc_opt_new();
  uint64_t v16 = +[NSNumber numberWithInteger:v10];
  [v6 safeSavePropertyToDictionary:v15 withKey:@"submissionTimeYear" andValue:v16];

  uint64_t v17 = +[NSNumber numberWithInteger:v11];
  [v6 safeSavePropertyToDictionary:v15 withKey:@"submissionTimeMonth" andValue:v17];

  id v18 = +[NSNumber numberWithInteger:v12];
  [v6 safeSavePropertyToDictionary:v15 withKey:@"submissionTimeDay" andValue:v18];

  id v19 = +[NSNumber numberWithInteger:v13];
  [v6 safeSavePropertyToDictionary:v15 withKey:@"submissionTimeHour" andValue:v19];

  id v20 = +[NSNumber numberWithInteger:v14];
  [v6 safeSavePropertyToDictionary:v15 withKey:@"submissionTimeMinute" andValue:v20];

  LODWORD(v21) = 1176256512;
  long long v22 = +[NSNumber numberWithFloat:v21];
  [v6 safeSavePropertyToDictionary:v15 withKey:@"scalingFactorForAnalytics" andValue:v22];

  long long v23 = [v6 dynamicModelParameterDict];
  id v24 = [v23 objectForKeyedSubscript:&off_1002F7628];
  [v24 floatValue];
  float v26 = v25 * 10000.0;

  *(float *)&double v27 = v26;
  long long v28 = +[NSNumber numberWithFloat:v27];
  [v6 safeSavePropertyToDictionary:v15 withKey:@"activityInterfaceTypeEngagementWeight" andValue:v28];

  long long v29 = [v6 dynamicModelParameterDict];
  long long v30 = [v29 objectForKeyedSubscript:&off_1002F75C8];
  [v30 floatValue];
  float v32 = v31 * 10000.0;

  *(float *)&double v33 = v32;
  unsigned __int8 v34 = +[NSNumber numberWithFloat:v33];
  [v6 safeSavePropertyToDictionary:v15 withKey:@"outingInterfaceTypeEngagementWeight" andValue:v34];

  id v35 = [v6 dynamicModelParameterDict];
  __int16 v36 = [v35 objectForKeyedSubscript:&off_1002F7658];
  [v36 floatValue];
  float v38 = v37 * 10000.0;

  *(float *)&double v39 = v38;
  __int16 v40 = +[NSNumber numberWithFloat:v39];
  [v6 safeSavePropertyToDictionary:v15 withKey:@"significantContactInterfaceTypeEngagementWeight" andValue:v40];

  uint64_t v41 = [v6 dynamicModelParameterDict];
  id v42 = [v41 objectForKeyedSubscript:&off_1002F7670];
  [v42 floatValue];
  float v44 = v43 * 10000.0;

  *(float *)&double v45 = v44;
  id v46 = +[NSNumber numberWithFloat:v45];
  [v6 safeSavePropertyToDictionary:v15 withKey:@"yourMediaInterfaceTypeEngagementWeight" andValue:v46];

  id v47 = [v6 dynamicModelParameterDict];
  id v48 = [v47 objectForKeyedSubscript:&off_1002F7688];
  [v48 floatValue];
  float v50 = v49 * 10000.0;

  *(float *)&double v51 = v50;
  id v52 = +[NSNumber numberWithFloat:v51];
  [v6 safeSavePropertyToDictionary:v15 withKey:@"yourTimeAtHomeInterfaceTypeEngagementWeight" andValue:v52];

  id v53 = [v6 dynamicModelParameterDict];
  uint64_t v54 = [v53 objectForKeyedSubscript:&off_1002F75E0];
  [v54 floatValue];
  float v56 = v55 * 10000.0;

  *(float *)&double v57 = v56;
  uint64_t v58 = +[NSNumber numberWithFloat:v57];
  [v6 safeSavePropertyToDictionary:v15 withKey:@"photoMemoryInterfaceTypeEngagementWeight" andValue:v58];

  long long v59 = [v6 dynamicModelParameterDict];
  long long v60 = [v59 objectForKeyedSubscript:&off_1002F76A0];
  [v60 floatValue];
  float v62 = v61 * 10000.0;

  *(float *)&double v63 = v62;
  long long v64 = +[NSNumber numberWithFloat:v63];
  [v6 safeSavePropertyToDictionary:v15 withKey:@"evergreenInterfaceTypeEngagementWeight" andValue:v64];

  long long v65 = [v6 dynamicModelParameterDict];
  long long v66 = [v65 objectForKeyedSubscript:&off_1002F7610];
  [v66 floatValue];
  float v68 = v67 * 10000.0;

  *(float *)&double v69 = v68;
  uint64_t v70 = +[NSNumber numberWithFloat:v69];
  [v6 safeSavePropertyToDictionary:v15 withKey:@"timeContextInterfaceTypeEngagementWeight" andValue:v70];

  __int16 v71 = [v6 dynamicModelParameterDict];
  id v72 = [v71 objectForKeyedSubscript:&off_1002F75F8];
  [v72 floatValue];
  float v74 = v73 * 10000.0;

  *(float *)&double v75 = v74;
  uint64_t v76 = +[NSNumber numberWithFloat:v75];
  [v6 safeSavePropertyToDictionary:v15 withKey:@"tripInterfaceTypeEngagementWeight" andValue:v76];

  __int16 v77 = [v6 dynamicModelParameterDict];
  uint64_t v78 = [v77 objectForKeyedSubscript:&off_1002F76B8];
  [v78 floatValue];
  float v80 = v79 * 10000.0;

  *(float *)&double v81 = v80;
  uint64_t v82 = +[NSNumber numberWithFloat:v81];
  [v6 safeSavePropertyToDictionary:v15 withKey:@"clusteringInterfaceTypeEngagementWeight" andValue:v82];

  if (v15)
  {
    uint64_t v92 = v15;
    AnalyticsSendEventLazy();
    __int16 v83 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG)) {
      -[MOEventBundleStore _submitRankingParamsAnalytics:withSubmissionDate:](v83);
    }

    uint64_t v84 = v92;
  }
  else
  {
    uint64_t v84 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleStore _submitRankingParamsAnalytics:withSubmissionDate:](v84, v85, v86, v87, v88, v89, v90, v91);
    }
  }
}

id __71__MOEventBundleStore__submitRankingParamsAnalytics_withSubmissionDate___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)getEventBundleStartedWithInterval:(id)a3 interfaceTypes:(id)a4 CompletionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, uint64_t, uint64_t))a5;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = __Block_byref_object_copy__32;
  float v31 = __Block_byref_object_dispose__32;
  id v32 = 0;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__32;
  float v25 = __Block_byref_object_dispose__32;
  id v26 = 0;
  id v12 = [(MOEventBundleStore *)self persistenceManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __89__MOEventBundleStore_getEventBundleStartedWithInterval_interfaceTypes_CompletionHandler___block_invoke;
  v15[3] = &unk_1002D1080;
  id v13 = v9;
  id v16 = v13;
  id v14 = v10;
  id v17 = v14;
  id v18 = &v27;
  id v19 = &v21;
  SEL v20 = a2;
  [v12 performBlockAndWait:v15];

  v11[2](v11, v22[5], v28[5]);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
}

void __89__MOEventBundleStore_getEventBundleStartedWithInterval_interfaceTypes_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[MOEventBundleMO fetchRequest];
  id v5 = +[NSMutableArray array];
  id v6 = *(void **)(a1 + 32);
  id v7 = NSAssertionHandler_ptr;
  id v8 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  id v42 = v5;
  if (v6)
  {
    id v9 = [v6 endDate];
    id v10 = +[NSPredicate predicateWithFormat:@"startDate <= %@", v9];
    v63[0] = v10;
    id v11 = [*(id *)(a1 + 32) startDate];
    id v12 = +[NSPredicate predicateWithFormat:@"startDate >= %@", v11];
    v63[1] = v12;
    id v13 = +[NSArray arrayWithObjects:v63 count:2];
    id v14 = +[NSCompoundPredicate andPredicateWithSubpredicates:v13];
    [v42 addObject:v14];

    id v7 = NSAssertionHandler_ptr;
    id v8 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;

    id v5 = v42;
  }
  if ([*(id *)(a1 + 40) count])
  {
    id v41 = v3;
    uint64_t v15 = objc_opt_new();
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v16 = *(id *)(a1 + 40);
    id v17 = [v16 countByEnumeratingWithState:&v48 objects:v62 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v49;
      do
      {
        SEL v20 = 0;
        do
        {
          if (*(void *)v49 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"interfaceType == %lu", [*(id *)(*((void *)&v48 + 1) + 8 * (void)v20) unsignedIntValue]);
          [v15 addObject:v21];

          SEL v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v48 objects:v62 count:16];
      }
      while (v18);
    }

    id v7 = NSAssertionHandler_ptr;
    long long v22 = +[NSCompoundPredicate orPredicateWithSubpredicates:v15];
    id v5 = v42;
    [v42 addObject:v22];

    id v3 = v41;
    id v8 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  }
  if ([v5 count])
  {
    uint64_t v23 = [v7[6] andPredicateWithSubpredicates:v5];
    [v4 setPredicate:v23];
  }
  [v4 setReturnsObjectsAsFaults:0];
  id v24 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v61 = v24;
  float v25 = [v8[511] arrayWithObjects:&v61 count:1];
  [v4 setSortDescriptors:v25];

  [v4 setFetchBatchSize:100];
  uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v26 + 40);
  uint64_t v27 = [v3 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v26 + 40), obj);
  long long v28 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    float v38 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v39 = [v27 count];
    uint64_t v40 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    *(_DWORD *)long long buf = 138413058;
    uint64_t v54 = v38;
    __int16 v55 = 2112;
    float v56 = v4;
    __int16 v57 = 2048;
    id v58 = v39;
    __int16 v59 = 2112;
    uint64_t v60 = v40;
    _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v29 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v27 count]);
    uint64_t v30 = *(void *)(*(void *)(a1 + 56) + 8);
    float v31 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v29;

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v32 = v27;
    id v33 = [v32 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v44;
      do
      {
        __int16 v36 = 0;
        do
        {
          if (*(void *)v44 != v35) {
            objc_enumerationMutation(v32);
          }
          float v37 = [[MOEventBundle alloc] initWithEventBundleMO:*(void *)(*((void *)&v43 + 1) + 8 * (void)v36)];
          if (v37) {
            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v37];
          }

          __int16 v36 = (char *)v36 + 1;
        }
        while (v34 != v36);
        id v34 = [v32 countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v34);
    }

    id v5 = v42;
  }
  [v3 reset];
}

- (void)updateEventBundles:(id)a3 CompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke;
    v16[3] = &unk_1002CD5D0;
    id v17 = (id)objc_opt_new();
    id v8 = v17;
    [v6 enumerateObjectsUsingBlock:v16];
    id v9 = [[MOEventBundleFetchOptions alloc] initWithIdentifiers:v8 ascending:1 filterBundle:0];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke_2;
    v13[3] = &unk_1002D10D0;
    id v15 = v7;
    void v13[4] = self;
    id v14 = v6;
    [(MOEventBundleStore *)self fetchEventBundleWithOptions:v9 CompletionHandler:v13];

LABEL_7:
    goto LABEL_8;
  }
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[updateEventBundles] no bundles to update", buf, 2u);
  }

  if (v7)
  {
    id v11 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    CFStringRef v20 = @"[updateEventBundles] No bundles were provided to update";
    id v12 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v8 = [v11 initWithDomain:@"MOEventBundleStore" code:0 userInfo:v12];

    (*((void (**)(id, id, void))v7 + 2))(v7, v8, 0);
    goto LABEL_7;
  }
LABEL_8:
}

void __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 bundleIdentifier];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v6 bundleIdentifier];
    [v4 addObject:v5];
  }
}

void __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[updateEventBundles] Error while fetching existing bundles for update. Error:%@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke_2_cold_1(v5, v8);
    }

    if ([v5 count])
    {
      id v9 = *(void **)(a1 + 32);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke_297;
      v13[3] = &unk_1002D10A8;
      id v10 = *(id *)(a1 + 48);
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(a1 + 40);
      id v15 = v10;
      void v13[4] = v11;
      id v14 = v12;
      [v9 removeEventBundles:v5 CompletionHandler:v13];
    }
  }
}

void __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke_297(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[updateEventBundles] Error while removing existing bundles for update. Error:%@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[updateEventBundles] Removed existing bundles", buf, 2u);
    }

    id v9 = *(void **)(a1 + 32);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke_298;
    v13[3] = &unk_1002D10A8;
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(a1 + 40);
    id v15 = v10;
    void v13[4] = v11;
    id v14 = v12;
    [v9 purgeDeletedEventBundlesWithCompletionHandler:v13];
  }
}

void __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke_298(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)long long buf = 138412290;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[updateEventBundles] Error while purging existing bundles. Error:%@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (v8)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[updateEventBundles] Purged existing bundles", buf, 2u);
    }

    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke_299;
    v11[3] = &unk_1002C9A50;
    id v12 = *(id *)(a1 + 48);
    [v9 storeEventBundles:v10 CompletionHandler:v11];
  }
}

void __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke_299(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[updateEventBundles] Error while storing updated bundles. Error:%@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v8)
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[updateEventBundles] Stored updated bundles. result, %@, error, %@", (uint8_t *)&v9, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (MOPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (MOEventBundleStoreEngagementDelegate)engagementDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engagementDelegate);

  return (MOEventBundleStoreEngagementDelegate *)WeakRetained;
}

- (void)setEngagementDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_engagementDelegate);
  objc_storeStrong((id *)&self->_configurationManager, 0);

  objc_storeStrong((id *)&self->_persistenceManager, 0);
}

void __58__MOEventBundleStore_storeEventBundles_CompletionHandler___block_invoke_cold_1(uint8_t *buf, uint64_t a2, void *a3, os_log_t log)
{
  uint64_t v4 = *(void *)(*(void *)(*(void *)a2 + 8) + 40);
  *(_DWORD *)long long buf = 138412290;
  *a3 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "error, %@", buf, 0xCu);
}

void __58__MOEventBundleStore_storeEventBundles_CompletionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9(__stack_chk_guard);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "error, %@", v2, v3, v4, v5, v6);
}

+ (void)_recordDedupeKey:(os_log_t)log alreadySeenKeys:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "The dedupe key is nil.", v1, 2u);
}

+ (void)_recordResource:(uint64_t)a1 alreadySeenKeys:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "The dedupe key is nil for resource, %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_recordResource:(uint64_t)a1 alreadySeenKeys:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  BOOL v8 = [a2 identifier];
  OUTLINED_FUNCTION_1_4((void *)&_mh_execute_header, v2, v3, "Unable to retrieve dedupe key due to error, %@. Falling back to identifier, %@", v4, v5, v6, v7, 2u);
}

- (void)_updateLongTermBundles:(uint64_t)a1 context:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [OUTLINED_FUNCTION_2_1(a1, a2) contactIdentifier];
  OUTLINED_FUNCTION_6_2((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_6((void *)&_mh_execute_header, v3, v4, "Person with contact identifier, %@, is a duplicate of a previously processed person object.");
}

- (void)_updateLongTermBundles:(uint64_t)a1 context:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [[(id)OUTLINED_FUNCTION_2_1(a1, a2) identifier];
  OUTLINED_FUNCTION_6_2((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_6((void *)&_mh_execute_header, v3, v4, "Person with local identifier, %@, is a duplicate of a previously processed person object.");
}

- (void)_updateLongTermBundles:(uint64_t)a1 context:(uint64_t)a2 .cold.3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [OUTLINED_FUNCTION_2_1(a1, a2) place];
  uint64_t v3 = [v2 identifier];
  OUTLINED_FUNCTION_6_2((uint64_t)v3, 5.7779e-34);
  OUTLINED_FUNCTION_2_6((void *)&_mh_execute_header, v4, v5, "Place with identifier, %@, is a duplicate of a previously processed place.");
}

- (void)_updateLongTermBundles:(uint64_t)a1 context:(uint64_t)a2 .cold.4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [OUTLINED_FUNCTION_2_1(a1, a2) identifier];
  OUTLINED_FUNCTION_6_2((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_6((void *)&_mh_execute_header, v3, v4, "Place with identifier, %@, is a duplicate of a previously processed place.");
}

- (void)_updateLongTermBundles:(uint64_t)a1 context:(uint64_t)a2 .cold.5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [OUTLINED_FUNCTION_2_1(a1, a2) identifier];
  OUTLINED_FUNCTION_6_2((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_6((void *)&_mh_execute_header, v3, v4, "Resource with identifier, %@, is a duplicate of a previously processed resource");
}

- (void)_updateLongTermBundles:(uint64_t)a1 context:(uint64_t)a2 .cold.6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [OUTLINED_FUNCTION_2_1(a1, a2) eventIdentifier];
  OUTLINED_FUNCTION_6_2((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_6((void *)&_mh_execute_header, v3, v4, "Event with identifier, %@, is a duplicate of a previously processed event");
}

void __80__MOEventBundleStore_removeEventBundlesStartedWithinInterval_CompletionHandler___block_invoke_cold_1(uint64_t a1)
{
  NSStringFromSelector(*(SEL *)(a1 + 56));
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_4((void *)&_mh_execute_header, v2, v3, "%@, event bundles delete operation error, %@", v4, v5, v6, v7, v8);
}

void __68__MOEventBundleStore_purgeDeletedEventBundlesWithCompletionHandler___block_invoke_cold_1(uint64_t a1)
{
  NSStringFromSelector(*(SEL *)(a1 + 48));
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_4((void *)&_mh_execute_header, v2, v3, "%@, event bundles delete operation error, %@", v4, v5, v6, v7, v8);
}

void __68__MOEventBundleStore_purgeExpiredEventBundlesWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(__stack_chk_guard);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving event bundles purge operation error, %@", v2, v3, v4, v5, v6);
}

void __83__MOEventBundleStore_purgeEventBundlesWithNoEventsAssociatedWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(__stack_chk_guard);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving non-evergreen event bundles purge operation error, %@", v2, v3, v4, v5, v6);
}

void __72__MOEventBundleStore_purgeInvalidEvergreenBundlesWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(__stack_chk_guard);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving evergreen event bundles purge operation error, %@", v2, v3, v4, v5, v6);
}

void __78__MOEventBundleStore_purgeEventBundlesWithRehydrationFailureCount_andHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(__stack_chk_guard);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving event bundles purge due to rehydration failure error, %@", v2, v3, v4, v5, v6);
}

void __59__MOEventBundleStore_purgeDanglingEventBundlesWithHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(__stack_chk_guard);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving dangling event bundles purge error, %@", v2, v3, v4, v5, v6);
}

void __59__MOEventBundleStore_getRankingParamsandCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(__stack_chk_guard);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Reading ranking params error, %@", v2, v3, v4, v5, v6);
}

void __70__MOEventBundleStore_storeRankingParams_forContext_forEvergreenScore___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_submitRankingParamsAnalytics:(uint64_t)a3 withSubmissionDate:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_submitRankingParamsAnalytics:(os_log_t)log withSubmissionDate:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Completed ranking params CoreAnalytics submission.", v1, 2u);
}

void __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  int v3 = 134217984;
  id v4 = [a1 count];
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[updateEventBundles] Existing bundles to be updated:%lu", (uint8_t *)&v3, 0xCu);
}

@end