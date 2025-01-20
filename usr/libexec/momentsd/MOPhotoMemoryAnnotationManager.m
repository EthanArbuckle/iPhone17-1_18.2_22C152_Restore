@interface MOPhotoMemoryAnnotationManager
- (MODefaultsManager)defaultsManager;
- (MOPhotoMemoryAnnotationManager)initWithUniverse:(id)a3;
- (OS_dispatch_queue)queue;
- (id)annotateBaseEvents:(id)a3;
- (id)getBaseEvents:(id)a3;
- (void)_performAnnotationWithEvents:(id)a3 handler:(id)a4;
- (void)performAnnotationWithEvents:(id)a3 handler:(id)a4;
@end

@implementation MOPhotoMemoryAnnotationManager

- (MOPhotoMemoryAnnotationManager)initWithUniverse:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->fUniverse, a3);
  v14.receiver = self;
  v14.super_class = (Class)MOPhotoMemoryAnnotationManager;
  v6 = [(MOPhotoMemoryAnnotationManager *)&v14 init];
  if (v6)
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    id v8 = objc_claimAutoreleasedReturnValue();
    v9 = (const char *)[v8 UTF8String];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;
  }
  return v6;
}

- (void)performAnnotationWithEvents:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[MOPhotoMemoryAnnotationManager performAnnotationWithEvents:handler:]();
  }

  v9 = [(MOPhotoMemoryAnnotationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __70__MOPhotoMemoryAnnotationManager_performAnnotationWithEvents_handler___block_invoke;
  block[3] = &unk_1002CAD38;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __70__MOPhotoMemoryAnnotationManager_performAnnotationWithEvents_handler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __70__MOPhotoMemoryAnnotationManager_performAnnotationWithEvents_handler___block_invoke_2;
  v3[3] = &unk_1002CA140;
  id v4 = *(id *)(a1 + 48);
  [v1 _performAnnotationWithEvents:v2 handler:v3];
}

uint64_t __70__MOPhotoMemoryAnnotationManager_performAnnotationWithEvents_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_performAnnotationWithEvents:(id)a3 handler:(id)a4
{
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = a3;
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[MOPhotoMemoryAnnotationManager _performAnnotationWithEvents:handler:].cold.4();
  }

  v9 = [(MOPhotoMemoryAnnotationManager *)self getBaseEvents:v7];

  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[MOPhotoMemoryAnnotationManager _performAnnotationWithEvents:handler:](v9);
  }

  if ([v9 count])
  {
    id v11 = [(MOPhotoMemoryAnnotationManager *)self annotateBaseEvents:v9];
    v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
    if (v11)
    {
      if (v13) {
        -[MOPhotoMemoryAnnotationManager _performAnnotationWithEvents:handler:](v11);
      }
    }
    else if (v13)
    {
      -[MOPhotoMemoryAnnotationManager _performAnnotationWithEvents:handler:]();
    }

    v6[2](v6, v11, 0);
  }
  else
  {
    v6[2](v6, &__NSArray0__struct, 0);
  }
}

- (id)getBaseEvents:(id)a3
{
  id v3 = a3;
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[MOPhotoMemoryAnnotationManager getBaseEvents:]();
  }

  id v5 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 17];
  id v6 = [v3 filteredArrayUsingPredicate:v5];

  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[MOPhotoMemoryAnnotationManager getBaseEvents:](v6);
  }

  return v6;
}

- (id)annotateBaseEvents:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v48 = (id)objc_opt_new();
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v45 = v3;
    id obj = v3;
    id v49 = [obj countByEnumeratingWithState:&v58 objects:v71 count:16];
    if (v49)
    {
      uint64_t v47 = *(void *)v59;
LABEL_4:
      uint64_t v4 = 0;
      while (2)
      {
        if (*(void *)v59 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v53 = v4;
        id v5 = *(void **)(*((void *)&v58 + 1) + 8 * v4);
        id v6 = [MOEventBundle alloc];
        id v7 = +[NSUUID UUID];
        id v8 = +[NSDate date];
        v9 = [(MOEventBundle *)v6 initWithBundleIdentifier:v7 creationDate:v8];

        [(MOEventBundle *)v9 setInterfaceType:10];
        id v10 = objc_opt_new();
        [v10 addObject:v5];
        v51 = v10;
        [(MOEventBundle *)v9 setEvents:v10];
        [(MOEventBundle *)v9 setPropertiesBasedOnEvents];
        id v11 = [MOAction alloc];
        v12 = [v5 photoMemoryTitle];
        BOOL v13 = [(MOAction *)v11 initWithActionName:v12 actionType:1 actionSubtype:7];
        v52 = v9;
        [(MOEventBundle *)v9 setAction:v13];

        id v14 = objc_opt_new();
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        v50 = v5;
        v15 = [v5 photoMemoryAssets];
        id v16 = [v15 countByEnumeratingWithState:&v54 objects:v70 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v55;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v55 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = *(void **)(*((void *)&v54 + 1) + 8 * i);
              v68[0] = @"MOPhotoResourceTypeKey";
              v21 = [v20 resourceType];
              v68[1] = @"MOPhotoResourceLocalIdentifier";
              v69[0] = v21;
              v22 = [v20 localIdentifier];
              v69[1] = v22;
              v23 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];

              v24 = [[MOResource alloc] initWithName:@"Photo" type:2 dict:v23 value:0.0];
              v25 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v63 = v20;
                _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "PhotoMemory:creating new MOResource with identifier,%@", buf, 0xCu);
              }

              [v14 addObject:v24];
            }
            id v17 = [v15 countByEnumeratingWithState:&v54 objects:v70 count:16];
          }
          while (v17);
        }

        v26 = objc_opt_new();
        v27 = [v50 identifierFromProvider];
        [v26 setObject:v27 forKey:@"MOPHMemoryMetaDataKeyMemoryIdentifier"];

        v28 = [v50 photoMemoryTitle];
        [v26 setObject:v28 forKey:@"MOPHMemoryMetaDataKeyMemoryTitle"];

        v29 = [v50 photoEvent];
        [v29 photoMemoryRelevanceScore];
        v30 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v26 setObject:v30 forKey:@"MOPHMemoryMetaDataKeyMemoryRelevanceScore"];

        v31 = [v50 photoEvent];
        v32 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v31 photoMemoryIsFavorite]);
        [v26 setObject:v32 forKey:@"MOPHMemoryMetaDataKeyMemoryIsFavorite"];

        v33 = [v50 photoEvent];
        v34 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v33 photoMemorySubCategory]);
        [v26 setObject:v34 forKey:@"MOPHMemoryMetaDataKeyMemorySubCategory"];

        v35 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v50 photoMemoryCategory]);
        [v26 setObject:v35 forKey:@"MOPHMemoryMetaDataKeyMemoryCategory"];

        v36 = [[MOResource alloc] initWithName:@"PhotoMemory" type:15 dict:v26 value:0.0];
        [v14 addObject:v36];
        v37 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          v40 = [v50 eventIdentifier];
          v41 = [v50 identifierFromProvider];
          v42 = [v50 photoMemoryTitle];
          v43 = [v42 mask];
          *(_DWORD *)buf = 138412802;
          v63 = v40;
          __int16 v64 = 2112;
          v65 = v41;
          __int16 v66 = 2112;
          v67 = v43;
          _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "PhotoMemory: created bundle for memory,eventIdentifier,%@,identifierFromProvider,%@, title,%@", buf, 0x20u);
        }
        [(MOEventBundle *)v52 setResources:v14];
        [(MOEventBundle *)v52 setPhotoSource:3];
        [(MOEventBundle *)v52 setBundleSuperType:6];
        id v38 = [v50 photoMemoryCategory];
        uint64_t v39 = 601;
        switch((unint64_t)v38)
        {
          case 0uLL:
            goto LABEL_36;
          case 1uLL:
            goto LABEL_35;
          case 3uLL:
          case 4uLL:
            uint64_t v39 = 602;
            goto LABEL_35;
          case 5uLL:
          case 6uLL:
            uint64_t v39 = 603;
            goto LABEL_35;
          case 7uLL:
            uint64_t v39 = 604;
            goto LABEL_35;
          case 8uLL:
          case 0x17uLL:
            uint64_t v39 = 605;
            goto LABEL_35;
          case 9uLL:
            uint64_t v39 = 606;
            goto LABEL_35;
          case 0xAuLL:
          case 0x1CuLL:
            uint64_t v39 = 607;
            goto LABEL_35;
          case 0xCuLL:
          case 0xDuLL:
          case 0xEuLL:
            uint64_t v39 = 608;
            goto LABEL_35;
          case 0x10uLL:
          case 0x11uLL:
            uint64_t v39 = 609;
            goto LABEL_35;
          case 0x12uLL:
          case 0x13uLL:
            uint64_t v39 = 610;
            goto LABEL_35;
          case 0x14uLL:
            uint64_t v39 = 611;
            goto LABEL_35;
          case 0x15uLL:
            uint64_t v39 = 612;
            goto LABEL_35;
          case 0x18uLL:
            uint64_t v39 = 613;
            goto LABEL_35;
          case 0x19uLL:
          case 0x1DuLL:
          case 0x1EuLL:
            uint64_t v39 = 614;
            goto LABEL_35;
          case 0x1AuLL:
            uint64_t v39 = 615;
            goto LABEL_35;
          case 0x1BuLL:
            uint64_t v39 = 616;
            goto LABEL_35;
          default:
            uint64_t v39 = 617;
LABEL_35:
            [(MOEventBundle *)v52 setBundleSubType:v39];
LABEL_36:
            [v48 addObject:v52];

            uint64_t v4 = v53 + 1;
            if ((id)(v53 + 1) != v49) {
              continue;
            }
            id v49 = [obj countByEnumeratingWithState:&v58 objects:v71 count:16];
            if (!v49) {
              goto LABEL_38;
            }
            goto LABEL_4;
        }
      }
    }
LABEL_38:

    id v3 = v45;
  }
  else
  {
    id v48 = 0;
  }

  return v48;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MODefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->fUniverse, 0);
}

- (void)performAnnotationWithEvents:handler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "PhotoMemory: performAnnotationWithEvents", v2, v3, v4, v5, v6);
}

- (void)_performAnnotationWithEvents:handler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "PhotoMemory: no bundle is created", v2, v3, v4, v5, v6);
}

- (void)_performAnnotationWithEvents:(void *)a1 handler:.cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v1, v2, "PhotoMemory: Bundles count, %lu", v3, v4, v5, v6, 0);
}

- (void)_performAnnotationWithEvents:(void *)a1 handler:.cold.3(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v1, v2, "PhotoMemory: Base Events, %lu", v3, v4, v5, v6, 0);
}

- (void)_performAnnotationWithEvents:handler:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "PhotoMemory: _performAnnotationWithEvents", v2, v3, v4, v5, v6);
}

- (void)getBaseEvents:(void *)a1 .cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v1, v2, "PhotoMemory: Found %lu base events", v3, v4, v5, v6, 0);
}

- (void)getBaseEvents:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "PhotoMemory: getBaseEvents", v2, v3, v4, v5, v6);
}

@end