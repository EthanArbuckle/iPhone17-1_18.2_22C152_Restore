@interface MOTemplateStore
- (MOContextConfigurationManager)configurationManager;
- (MOContextPersistenceManager)persistenceManager;
- (MOTemplateStore)initWithPersistenceManager:(id)a3;
- (MOTemplateStore)initWithPersistenceManager:(id)a3 configurationManager:(id)a4;
- (OS_dispatch_queue)queue;
- (id)_createPredicateForBundleContent:(id)a3;
- (id)_createPredicateForBundleContent:(id)a3 withMoreMetaData:(id)a4;
- (id)_createPredicateForBundleContentWithLessMetaData:(id)a3;
- (id)_createPredicateForDefaultValueWithMetaDataName:(id)a3;
- (id)_createPredicateWithMetaDataName:(id)a3 bundleContent:(id)a4;
- (id)_createPredicatesWithBundleContent:(id)a3 combination:(id)a4;
- (id)_generateCombinationsFromMetaData:(id)a3;
- (void)checkTemplateStoreIsEmptyWithHandler:(id)a3;
- (void)fetchTemplatesWithBundleContent:(id)a3 handler:(id)a4;
- (void)loadNewTemplatesFromFileWithHandler:(id)a3;
- (void)removeAllTemplatesWithHandler:(id)a3;
- (void)reset;
- (void)setConfigurationManager:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)storeTemplates:(id)a3 handler:(id)a4;
@end

@implementation MOTemplateStore

- (MOTemplateStore)initWithPersistenceManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)MOTemplateStore;
    v6 = [(MOTemplateStore *)&v13 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_persistenceManager, a3);
      v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v9 = dispatch_queue_create("MOTemplateStore", v8);
      queue = v7->_queue;
      v7->_queue = (OS_dispatch_queue *)v9;
    }
    self = v7;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (MOTemplateStore)initWithPersistenceManager:(id)a3 configurationManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_queue_t v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v17.receiver = self;
    v17.super_class = (Class)MOTemplateStore;
    v11 = [(MOTemplateStore *)&v17 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_persistenceManager, a3);
      objc_storeStrong((id *)&v12->_configurationManager, a4);
      objc_super v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v14 = dispatch_queue_create("MOTemplateStore", v13);
      queue = v12->_queue;
      v12->_queue = (OS_dispatch_queue *)v14;
    }
    self = v12;
    v10 = self;
  }

  return v10;
}

- (void)reset
{
  v4 = [(MOTemplateStore *)self persistenceManager];
  [v4 performBlockAndWait:&__block_literal_global_1];
}

void __24__MOTemplateStore_reset__block_invoke(id a1, NSManagedObjectContext *a2)
{
}

- (void)fetchTemplatesWithBundleContent:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  id v23 = (id)objc_opt_new();
  dispatch_queue_t v9 = [(MOTemplateStore *)self persistenceManager];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __59__MOTemplateStore_fetchTemplatesWithBundleContent_handler___block_invoke;
  v13[3] = &unk_1000A4EA0;
  v13[4] = self;
  id v10 = v7;
  id v14 = v10;
  v15 = &v24;
  v16 = &v18;
  SEL v17 = a2;
  [v9 performBlockAndWait:v13];

  v11 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v19[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v31 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "retrieved templates %@", buf, 0xCu);
  }

  if (v8) {
    v8[2](v8, v19[5], v25[5]);
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
}

void __59__MOTemplateStore_fetchTemplatesWithBundleContent_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[MOTemplateMO fetchRequest];
  id v5 = [*(id *)(a1 + 32) _createPredicateForBundleContent:*(void *)(a1 + 40)];
  if (v5) {
    [v4 setPredicate:v5];
  }
  [v4 setReturnsObjectsAsFaults:0];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v6 + 40);
  id v7 = [v3 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v19 = [v7 count];
    uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    id v29 = v18;
    __int16 v30 = 2112;
    uint64_t v31 = v4;
    __int16 v32 = 2048;
    id v33 = v19;
    __int16 v34 = 2112;
    uint64_t v35 = v20;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@, request, %@, template results count, %lu, error, %@", buf, 0x2Au);
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v21 = v7;
    id v12 = v7;
    id v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          SEL v17 = [[MOTemplate alloc] initWithTemplateMO:*(void *)(*((void *)&v22 + 1) + 8 * (void)v16)];
          if (v17) {
            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v17];
          }

          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v14);
    }

    id v7 = v21;
  }
  [v3 reset];
}

- (id)_createPredicateForBundleContentWithLessMetaData:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  id v5 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"patternType == %d", [v3 patternType]);
  [v4 addObject:v5];

  uint64_t v6 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"activityType == %d", [v3 activityType]);
  [v4 addObject:v6];

  id v7 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"placeType == %d", [v3 placeType]);
  [v4 addObject:v7];

  id v8 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"time == %d", [v3 time]);
  [v4 addObject:v8];

  uint64_t v9 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"bundleType == %d", [v3 bundleType]);
  [v4 addObject:v9];

  uint64_t v10 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"peopleClassification == %d", [v3 peopleClassification]);
  [v4 addObject:v10];

  v11 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"photoTrait == %d", [v3 photoTrait]);
  [v4 addObject:v11];

  if ([v3 hasPersonName]) {
    CFStringRef v12 = @"hasPersonName == 1";
  }
  else {
    CFStringRef v12 = @"hasPersonName == 0";
  }
  id v13 = +[NSPredicate predicateWithFormat:v12];
  [v4 addObject:v13];

  if ([v3 hasPlaceName]) {
    CFStringRef v14 = @"hasPlaceName == 1";
  }
  else {
    CFStringRef v14 = @"hasPlaceName == 0";
  }
  uint64_t v15 = +[NSPredicate predicateWithFormat:v14];
  [v4 addObject:v15];

  if ([v3 hasCityName]) {
    CFStringRef v16 = @"hasCityName == 1";
  }
  else {
    CFStringRef v16 = @"hasCityName == 0";
  }
  SEL v17 = +[NSPredicate predicateWithFormat:v16];
  [v4 addObject:v17];

  if ([v3 hasTimeReference]) {
    CFStringRef v18 = @"hasTimeReference == 1";
  }
  else {
    CFStringRef v18 = @"hasTimeReference == 0";
  }
  id v19 = +[NSPredicate predicateWithFormat:v18];
  [v4 addObject:v19];

  if ([v4 count])
  {
    uint64_t v20 = +[NSCompoundPredicate andPredicateWithSubpredicates:v4];
    v21 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v24 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "createPredicateForBundleContentWithLessMetaData, predicate %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

- (id)_createPredicateForBundleContent:(id)a3 withMoreMetaData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  uint64_t v9 = [(MOTemplateStore *)self _generateCombinationsFromMetaData:v7];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        CFStringRef v14 = [(MOTemplateStore *)self _createPredicatesWithBundleContent:v6 combination:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        if (v14) {
          [v8 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
  if ([v8 count])
  {
    uint64_t v15 = +[NSCompoundPredicate orPredicateWithSubpredicates:v8];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)_createPredicateForBundleContent:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  if ([v4 patternType])
  {
    [v5 addObject:@"patternType"];
    unsigned int v6 = 1;
  }
  else
  {
    unsigned int v6 = 0;
  }
  if ([v4 placeType])
  {
    [v5 addObject:@"placeType"];
    ++v6;
  }
  if ([v4 activityType])
  {
    [v5 addObject:@"activityType"];
    ++v6;
  }
  if ([v4 time])
  {
    [v5 addObject:@"time"];
    ++v6;
  }
  if ([v4 bundleType])
  {
    [v5 addObject:@"bundleType"];
    ++v6;
  }
  if ([v4 peopleClassification])
  {
    [v5 addObject:@"peopleClassification"];
    ++v6;
  }
  if ([v4 hasPersonName])
  {
    [v5 addObject:@"hasPersonName"];
    ++v6;
  }
  if ([v4 hasPlaceName])
  {
    [v5 addObject:@"hasPlaceName"];
    ++v6;
  }
  if ([v4 hasCityName])
  {
    [v5 addObject:@"hasCityName"];
    ++v6;
  }
  if ([v4 hasTimeReference])
  {
    [v5 addObject:@"hasTimeReference"];
    ++v6;
  }
  if ([v4 photoTrait])
  {
    [v5 addObject:@"photoTrait"];
    ++v6;
  }
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "non default value metadata, %@", (uint8_t *)&v10, 0xCu);
  }

  if (v6 > 1) {
    [(MOTemplateStore *)self _createPredicateForBundleContent:v4 withMoreMetaData:v5];
  }
  else {
  id v8 = [(MOTemplateStore *)self _createPredicateForBundleContentWithLessMetaData:v4];
  }

  return v8;
}

- (id)_createPredicatesWithBundleContent:(id)a3 combination:(id)a4
{
  id v30 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v36;
    *(void *)&long long v10 = 138412546;
    long long v28 = v10;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v15 = -[MOTemplateStore _createPredicateWithMetaDataName:bundleContent:](self, "_createPredicateWithMetaDataName:bundleContent:", v14, v30, v28);
        CFStringRef v16 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v28;
          uint64_t v41 = v14;
          __int16 v42 = 2112;
          v43 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "meta data name, %@ and predicate from bundle value, %@", buf, 0x16u);
        }

        if (v15) {
          [v7 addObject:v15];
        }
      }
      id v11 = [v8 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v11);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v17 = kCompletePropertySet;
  id v18 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v18)
  {
    id v20 = v18;
    uint64_t v21 = *(void *)v32;
    *(void *)&long long v19 = 138412546;
    long long v29 = v19;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
        if ((objc_msgSend(v8, "containsObject:", v23, v29) & 1) == 0)
        {
          long long v24 = [(MOTemplateStore *)self _createPredicateForDefaultValueWithMetaDataName:v23];
          long long v25 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v29;
            uint64_t v41 = v23;
            __int16 v42 = 2112;
            v43 = v24;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "meta data name, %@ and predicate from default value, %@", buf, 0x16u);
          }

          if (v24) {
            [v7 addObject:v24];
          }
        }
      }
      id v20 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v20);
  }

  if ([v7 count])
  {
    uint64_t v26 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];
  }
  else
  {
    uint64_t v26 = 0;
  }

  return v26;
}

- (id)_createPredicateWithMetaDataName:(id)a3 bundleContent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"patternType"])
  {
    id v10 = [v6 patternType];
    CFStringRef v7 = @"patternType == %d";
LABEL_13:
    id v8 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v7, v10);
    goto LABEL_14;
  }
  if ([v5 isEqualToString:@"placeType"])
  {
    id v10 = [v6 placeType];
    CFStringRef v7 = @"placeType == %d";
    goto LABEL_13;
  }
  if ([v5 isEqualToString:@"activityType"])
  {
    id v10 = [v6 activityType];
    CFStringRef v7 = @"activityType == %d";
    goto LABEL_13;
  }
  if ([v5 isEqualToString:@"time"])
  {
    id v10 = [v6 time];
    CFStringRef v7 = @"time == %d";
    goto LABEL_13;
  }
  if ([v5 isEqualToString:@"bundleType"])
  {
    id v10 = [v6 bundleType];
    CFStringRef v7 = @"bundleType == %d";
    goto LABEL_13;
  }
  if ([v5 isEqualToString:@"peopleClassification"])
  {
    id v10 = [v6 peopleClassification];
    CFStringRef v7 = @"peopleClassification == %d";
    goto LABEL_13;
  }
  if ([v5 isEqualToString:@"hasPersonName"])
  {
    CFStringRef v7 = @"hasPersonName == 1";
    goto LABEL_13;
  }
  if ([v5 isEqualToString:@"hasPlaceName"])
  {
    CFStringRef v7 = @"hasPlaceName == 1";
    goto LABEL_13;
  }
  if ([v5 isEqualToString:@"hasCityName"])
  {
    CFStringRef v7 = @"hasCityName == 1";
    goto LABEL_13;
  }
  if ([v5 isEqualToString:@"hasTimeReference"])
  {
    CFStringRef v7 = @"hasTimeReference == 1";
    goto LABEL_13;
  }
  if ([v5 isEqualToString:@"photoTrait"])
  {
    id v10 = [v6 photoTrait];
    CFStringRef v7 = @"photoTrait == %d";
    goto LABEL_13;
  }
  id v8 = 0;
LABEL_14:

  return v8;
}

- (id)_createPredicateForDefaultValueWithMetaDataName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"patternType"])
  {
    +[NSPredicate predicateWithFormat:@"patternType == %d", 0];
    id v5 = LABEL_24:;
    goto LABEL_25;
  }
  if ([v3 isEqualToString:@"placeType"])
  {
    +[NSPredicate predicateWithFormat:@"placeType == %d", 0];
    goto LABEL_24;
  }
  if ([v3 isEqualToString:@"activityType"])
  {
    +[NSPredicate predicateWithFormat:@"activityType == %d", 0];
    goto LABEL_24;
  }
  if ([v3 isEqualToString:@"time"])
  {
    +[NSPredicate predicateWithFormat:@"time == %d", 0];
    goto LABEL_24;
  }
  if ([v3 isEqualToString:@"bundleType"])
  {
    +[NSPredicate predicateWithFormat:@"bundleType == %d", 0];
    goto LABEL_24;
  }
  if ([v3 isEqualToString:@"peopleClassification"])
  {
    +[NSPredicate predicateWithFormat:@"peopleClassification == %d", 0];
    goto LABEL_24;
  }
  if ([v3 isEqualToString:@"hasPersonName"])
  {
    CFStringRef v4 = @"hasPersonName == 0";
LABEL_23:
    +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v4, v7);
    goto LABEL_24;
  }
  if ([v3 isEqualToString:@"hasPlaceName"])
  {
    CFStringRef v4 = @"hasPlaceName == 0";
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"hasCityName"])
  {
    CFStringRef v4 = @"hasCityName == 0";
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"hasTimeReference"])
  {
    CFStringRef v4 = @"hasTimeReference == 0";
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"photoTrait"])
  {
    uint64_t v7 = 0;
    CFStringRef v4 = @"photoTrait == %d";
    goto LABEL_23;
  }
  id v5 = 0;
LABEL_25:

  return v5;
}

- (id)_generateCombinationsFromMetaData:(id)a3
{
  id v3 = a3;
  CFStringRef v4 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = (uint64_t)v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "generateCombinationsFromMetaData, input meta data, %@", buf, 0xCu);
  }

  id v5 = +[NSMutableArray array];
  id v6 = (char *)[v3 count];
  unint64_t v7 = (unint64_t)exp2((double)(unint64_t)v6);
  if (v7 >= 2)
  {
    *(void *)&long long v8 = 134218242;
    long long v17 = v8;
    for (uint64_t i = 1; i != v7; ++i)
    {
      id v10 = +[NSMutableArray array];
      if (v6)
      {
        for (j = 0; j != v6; ++j)
        {
          if ((i & (1 << (char)j)) != 0)
          {
            uint64_t v12 = [v3 objectAtIndexedSubscript:j];
            [v10 addObject:v12];
          }
        }
      }
      id v13 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v17;
        uint64_t v19 = i;
        __int16 v20 = 2112;
        uint64_t v21 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "generateCombinationsFromMetaData, index, %lu, combination, %@", buf, 0x16u);
      }

      id v14 = [v10 copy];
      [v5 addObject:v14];
    }
  }
  id v15 = [v5 copy];

  return v15;
}

- (void)storeTemplates:(id)a3 handler:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (void (**)(id, void))a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy__1;
  id v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  if ([v6 count])
  {
    long long v8 = [(MOTemplateStore *)self persistenceManager];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __42__MOTemplateStore_storeTemplates_handler___block_invoke;
    v11[3] = &unk_1000A4DE0;
    uint64_t v12 = v6;
    id v13 = &v14;
    [v8 performBlockAndWait:v11];

    [(MOTemplateStore *)self reset];
    id v9 = v12;
  }
  else
  {
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "no template to be saved", v10, 2u);
    }
  }

  if (v7) {
    v7[2](v7, v15[5]);
  }
  _Block_object_dispose(&v14, 8);
}

void __42__MOTemplateStore_storeTemplates_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v36 = a1;
  long long v35 = (id *)(a1 + 32);
  id v4 = *(id *)(a1 + 32);
  id v38 = [v4 countByEnumeratingWithState:&v41 objects:v51 count:16];
  id v5 = 0;
  if (v38)
  {
    uint64_t v6 = *(void *)v42;
    uint64_t v37 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v38; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v42 != v6) {
          objc_enumerationMutation(v4);
        }
        long long v8 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v9 = +[MOTemplateMO fetchRequest];
        id v10 = [v8 templateIdentifier];
        id v11 = +[NSPredicate predicateWithFormat:@"templateIdentifier == %@", v10];
        [v9 setPredicate:v11];

        id v40 = 0;
        uint64_t v12 = [v3 executeFetchRequest:v9 error:&v40];
        id v13 = v40;
        uint64_t v14 = v13;
        if (v13)
        {
          id v15 = v13;

          uint64_t v16 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            __42__MOTemplateStore_storeTemplates_handler___block_invoke_cold_2(v49, v15, &v50, v16);
          }

          goto LABEL_16;
        }
        if (![v12 count]
          || ([v12 lastObject], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          id v15 = v5;
LABEL_16:
          uint64_t v21 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v48 = v8;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "save template, %@", buf, 0xCu);
          }

          id v22 = +[MOTemplateMO managedObjectWithTemplate:v8 inManagedObjectContext:v3];
          id v5 = v15;
          goto LABEL_19;
        }
        id v18 = (void *)v17;
        id v19 = v4;
        __int16 v20 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v48 = v8;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "update template, %@", buf, 0xCu);
        }

        +[MOTemplateMO updateManagedObject:v18 withTemplate:v8 inManagedObjectContext:v3];
        id v4 = v19;
        uint64_t v6 = v37;
LABEL_19:
      }
      id v38 = [v4 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v38);
  }

  uint64_t v23 = v36 + 40;
  uint64_t v24 = *(void *)(*(void *)(v36 + 40) + 8);
  id obj = *(id *)(v24 + 40);
  unsigned __int8 v25 = [v3 save:&obj];
  objc_storeStrong((id *)(v24 + 40), obj);
  uint64_t v26 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
  v27 = v26;
  if (v25)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v28 = [*v35 count];
      *(_DWORD *)buf = 134217984;
      id v48 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "saving templates succeeded, template count, %lu", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    __42__MOTemplateStore_storeTemplates_handler___block_invoke_cold_1(v23, v35, v27);
  }

  if (*(void *)(*(void *)(*(void *)v23 + 8) + 40)) {
    BOOL v29 = 1;
  }
  else {
    BOOL v29 = v5 == 0;
  }
  if (!v29)
  {
    NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
    CFStringRef v46 = @"MOTemplateStore:storeTemplates persistence error";
    id v30 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    long long v31 = +[NSError errorWithDomain:@"MOContextErrorDomain" code:2314 userInfo:v30];
    uint64_t v32 = +[NSError errorUsingError:v31 withUnderyingError:v5];
    uint64_t v33 = *(void *)(*(void *)v23 + 8);
    long long v34 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = v32;
  }
}

- (void)removeAllTemplatesWithHandler:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__1;
  id v13 = __Block_byref_object_dispose__1;
  id v14 = 0;
  [(MOTemplateStore *)self reset];
  unint64_t v7 = [(MOTemplateStore *)self persistenceManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __49__MOTemplateStore_removeAllTemplatesWithHandler___block_invoke;
  v8[3] = &unk_1000A4E30;
  v8[4] = &v9;
  v8[5] = a2;
  [v7 performBlockAndWait:v8];

  [(MOTemplateStore *)self reset];
  if (v5) {
    v5[2](v5, v10[5]);
  }
  _Block_object_dispose(&v9, 8);
}

void __49__MOTemplateStore_removeAllTemplatesWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOTemplateMO fetchRequest];
  id v5 = [objc_alloc((Class)NSBatchDeleteRequest) initWithFetchRequest:v4];
  [v5 setResultType:2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v6 + 40);
  unint64_t v7 = [v3 executeRequest:v5 error:&obj];

  objc_storeStrong((id *)(v6 + 40), obj);
  long long v8 = [v7 result];
  uint64_t v9 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    id v15 = v11;
    __int16 v16 = 2112;
    uint64_t v17 = v4;
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@, delete request, %@, template results count, %@, error, %@", buf, 0x2Au);
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) && (uint64_t)[v8 integerValue] >= 1)
  {
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "templates deletion operation succeeded", buf, 2u);
    }
  }
}

- (void)loadNewTemplatesFromFileWithHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __55__MOTemplateStore_loadNewTemplatesFromFileWithHandler___block_invoke;
  v4[3] = &unk_1000A4EF0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(MOTemplateStore *)v5 removeAllTemplatesWithHandler:v4];
}

void __55__MOTemplateStore_loadNewTemplatesFromFileWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v48 = a2;
  v2 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
  id v3 = v2;
  if (v48)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __55__MOTemplateStore_loadNewTemplatesFromFileWithHandler___block_invoke_cold_2((uint64_t)v48, v3, v4, v5, v6, v7, v8, v9);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "removing old templates to load new templates succeeded", (uint8_t *)&buf, 2u);
    }

    v51 = objc_alloc_init(MOTemplateLoader);
    id v10 = [(MOTemplateLoader *)v51 getTemplateDirectoryURL];
    uint64_t v11 = [v10 path];
    v52 = [v11 stringByAppendingPathComponent:@"templates"];

    CFStringRef v46 = +[NSFileManager defaultManager];
    id v67 = 0;
    NSErrorUserInfoKey v45 = [v46 contentsOfDirectoryAtPath:v52 error:&v67];
    id v44 = v67;
    uint64_t v12 = +[NSPredicate predicateWithFormat:@"self ENDSWITH '.json'"];
    v47 = [v45 filteredArrayUsingPredicate:v12];

    id v13 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v52;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "directory for template: %@", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__1;
    v74 = __Block_byref_object_dispose__1;
    id v75 = 0;
    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x2020000000;
    char v66 = 0;
    if (v47 && [v47 count])
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id obj = v47;
      id v14 = [obj countByEnumeratingWithState:&v59 objects:v70 count:16];
      if (v14)
      {
        uint64_t v50 = *(void *)v60;
        double v15 = 0.0;
        do
        {
          uint64_t v16 = 0;
          id v53 = v14;
          do
          {
            if (*(void *)v60 != v50) {
              objc_enumerationMutation(obj);
            }
            uint64_t v55 = v16;
            uint64_t v17 = *(void *)(*((void *)&v59 + 1) + 8 * v16);
            v56 = [v52 stringByAppendingPathComponent:v17];
            __int16 v18 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v68 = 138412290;
              id v69 = v56;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "file template path: %@", v68, 0xCu);
            }

            __int16 v20 = [(MOTemplateLoader *)v51 loadTemplatesFromFile:v56];
            uint64_t v21 = v20;
            if (v15 == 0.0)
            {
              id v22 = [v20 firstObject];
              id v23 = [v22 promptVersion];

              uint64_t v24 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                unsigned __int8 v25 = [v21 firstObject];
                id v26 = [v25 promptVersion];
                *(_DWORD *)v68 = 134217984;
                id v69 = v26;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "prompt version: %lu", v68, 0xCu);
              }
              double v15 = (double)(unint64_t)v23;
            }
            uint64_t v27 = 0;
            for (unint64_t i = 0; i < (unint64_t)[v21 count]; i += 35)
            {
              id v30 = [v21 count];
              if ((unint64_t)v30 + v27 >= 0x23) {
                uint64_t v31 = 35;
              }
              else {
                uint64_t v31 = (uint64_t)v30 + v27;
              }
              uint64_t v32 = *(void **)(a1 + 32);
              uint64_t v33 = objc_msgSend(v21, "subarrayWithRange:", i, v31);
              v58[0] = _NSConcreteStackBlock;
              v58[1] = 3221225472;
              v58[2] = __55__MOTemplateStore_loadNewTemplatesFromFileWithHandler___block_invoke_102;
              v58[3] = &unk_1000A4EC8;
              v58[4] = v17;
              v58[5] = &buf;
              v58[6] = &v63;
              [v32 storeTemplates:v33 handler:v58];

              v27 -= 35;
            }

            uint64_t v16 = v55 + 1;
          }
          while ((id)(v55 + 1) != v53);
          id v14 = [obj countByEnumeratingWithState:&v59 objects:v70 count:16];
        }
        while (v14);
      }
      else
      {
        double v15 = 0.0;
      }
      long long v34 = obj;
    }
    else
    {
      long long v34 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
      double v15 = 0.0;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        __55__MOTemplateStore_loadNewTemplatesFromFileWithHandler___block_invoke_cold_1((uint64_t)v52, v34, v35, v36, v37, v38, v39, v40);
      }
    }

    if (!*((unsigned char *)v64 + 24))
    {
      long long v41 = [*(id *)(a1 + 32) configurationManager];
      long long v42 = [v41 defaultsManager];
      long long v43 = +[NSNumber numberWithDouble:v15];
      [v42 setObject:v43 forKey:@"LocalTemplateVersion"];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    _Block_object_dispose(&v63, 8);
    _Block_object_dispose(&buf, 8);
  }
}

void __55__MOTemplateStore_loadNewTemplatesFromFileWithHandler___block_invoke_102(void *a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __55__MOTemplateStore_loadNewTemplatesFromFileWithHandler___block_invoke_102_cold_1((uint64_t)a1, (uint64_t)v4, v6);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = a1[4];
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "storing new templates from file succeeded, with file: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)checkTemplateStoreIsEmptyWithHandler:(id)a3
{
  uint64_t v5 = (void (**)(id, void))a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__1;
  v10[4] = __Block_byref_object_dispose__1;
  id v11 = 0;
  uint64_t v6 = [(MOTemplateStore *)self persistenceManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __56__MOTemplateStore_checkTemplateStoreIsEmptyWithHandler___block_invoke;
  v9[3] = &unk_1000A4F18;
  v9[5] = &v12;
  v9[6] = a2;
  v9[4] = v10;
  [v6 performBlockAndWait:v9];

  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = *((unsigned __int8 *)v13 + 24);
    *(_DWORD *)long long buf = 67109120;
    int v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "checkTemplateStoreIsEmpty,  %d", buf, 8u);
  }

  if (v5) {
    v5[2](v5, *((unsigned __int8 *)v13 + 24));
  }
  _Block_object_dispose(v10, 8);

  _Block_object_dispose(&v12, 8);
}

void __56__MOTemplateStore_checkTemplateStoreIsEmptyWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOTemplateMO fetchRequest];
  [v4 setFetchLimit:1];
  [v4 setReturnsObjectsAsFaults:0];
  uint64_t v5 = a1 + 32;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v3 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  int v8 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v17 = [v7 count];
    uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    *(_DWORD *)long long buf = 138413058;
    uint64_t v21 = v16;
    __int16 v22 = 2112;
    id v23 = v4;
    __int16 v24 = 2048;
    id v25 = v17;
    __int16 v26 = 2112;
    uint64_t v27 = v18;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@, request, %@, checkTemplateStoreIsEmptyWithHandler, template results count, %lu, error, %@", buf, 0x2Au);
  }
  if (*(void *)(*(void *)(*(void *)v5 + 8) + 40))
  {
    uint64_t v9 = _mo_log_facility_get_os_log(&MOLogFacilityTemplateStore);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __56__MOTemplateStore_checkTemplateStoreIsEmptyWithHandler___block_invoke_cold_1(v5, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else if ([v7 count] == (id)1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  [v3 reset];
}

- (MOContextPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (MOContextConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
}

void __42__MOTemplateStore_storeTemplates_handler___block_invoke_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v4 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  id v5 = [*a2 count];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  id v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "saving templates error, %@, templates count, %lu", (uint8_t *)&v6, 0x16u);
}

void __42__MOTemplateStore_storeTemplates_handler___block_invoke_cold_2(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 localizedDescription];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "storeTemplates: '%@'", a1, 0xCu);
}

void __55__MOTemplateStore_loadNewTemplatesFromFileWithHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__MOTemplateStore_loadNewTemplatesFromFileWithHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__MOTemplateStore_loadNewTemplatesFromFileWithHandler___block_invoke_102_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "storing new templates from file failed, with file: %@, error: %@", (uint8_t *)&v4, 0x16u);
}

void __56__MOTemplateStore_checkTemplateStoreIsEmptyWithHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end