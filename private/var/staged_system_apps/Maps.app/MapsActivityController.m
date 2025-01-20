@interface MapsActivityController
- (MapsActivityController)init;
- (MapsActivityControllerDelegate)delegate;
- (NSDictionary)_cachedMapsActivityDataDictionary;
- (id)_cleanArray:(id)a3;
- (id)_cleanDictionary:(id)a3;
- (id)_mapsUserActivity;
- (id)mapsUserActivityForStateRestoration;
- (void)_updateUserActivity;
- (void)_updateUserActivityWithMapsActivityAtFullFidelity:(id)a3 atCompactFidelity:(id)a4 title:(id)a5 expirationDate:(id)a6;
- (void)archiveMapsActivity;
- (void)setDelegate:(id)a3;
- (void)setNeedsUserActivityUpdate;
- (void)set_cachedMapsActivityDataDictionary:(id)a3;
- (void)userActivityWillSave:(id)a3;
- (void)writeCurrentState:(id)a3;
@end

@implementation MapsActivityController

- (void)userActivityWillSave:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100084B00;
  v7[3] = &unk_1012E5D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

- (MapsActivityController)init
{
  v12.receiver = self;
  v12.super_class = (Class)MapsActivityController;
  v2 = [(MapsActivityController *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MapsActivity", v4);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.MapsActivity.Logging", v8);
    loggingQueue = v2->_loggingQueue;
    v2->_loggingQueue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

- (void)_updateUserActivityWithMapsActivityAtFullFidelity:(id)a3 atCompactFidelity:(id)a4 title:(id)a5 expirationDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  v15 = [(MapsActivityController *)self _mapsUserActivity];
  v16 = [v10 bzip2CompressedData];
  if ((unint64_t)[v16 length] >= 0x2329)
  {
    uint64_t v17 = [v11 bzip2DataByIterativelyReducingIfNeeded];

    v16 = (void *)v17;
  }
  if (v16) {
    [v14 setObject:v16 forKeyedSubscript:@"bs"];
  }
  [v15 setTitle:v12];
  [v15 setExpirationDate:v13];

  [v15 setRequiredUserInfoKeys:0];
  [v15 setUserInfo:v14];
  [v15 setEligibleForSearch:[v10 shouldIndex]];
  [v15 setEligibleForPrediction:0];
  v18 = [v10 mapsSiriAction];
  if (v18)
  {
    id v34 = v14;
    id v36 = v11;
    v19 = sub_100084D38();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = [v18 title];
      *(_DWORD *)buf = 138477827;
      v39 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Created Siri Action for '%{private}@'", buf, 0xCu);
    }
    id v21 = v12;

    v22 = [v18 userInfo];
    id v23 = [v22 mutableCopy];

    if (v16) {
      [v23 setObject:v16 forKeyedSubscript:@"bs"];
    }
    v24 = [v18 title:v34, v36];
    [v15 setTitle:v24];

    [v15 setUserInfo:v23];
    id v25 = objc_alloc((Class)NSSet);
    v26 = [v18 userInfo];
    v27 = [v26 allKeys];
    id v28 = [v25 initWithArray:v27];
    [v15 setRequiredUserInfoKeys:v28];

    [v15 setEligibleForPrediction:1];
    id v12 = v21;
    id v14 = v35;
    id v11 = v37;
  }
  v29 = [(MapsActivityController *)self _cachedMapsActivityDataDictionary];
  v30 = [v29 objectForKeyedSubscript:@"m"];

  [v15 setContentAttributeSet:0];
  if (v30)
  {
    v31 = sub_100084D38();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = [v30 name];
      *(_DWORD *)buf = 138477827;
      v39 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Add App Donation for '%{private}@'", buf, 0xCu);
    }
    [v15 _mapkit_populateFieldsForDonationOfMapItem:v30];
    v33 = [v30 _activityURL];
    [v15 setWebpageURL:v33];
  }
  else
  {
    [v15 _mapkit_clearMapItemDonationFields];
  }
}

- (id)_mapsUserActivity
{
  mapsUserActivity = self->_mapsUserActivity;
  if (!mapsUserActivity)
  {
    id v4 = (NSUserActivity *)[objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.Maps"];
    dispatch_queue_t v5 = self->_mapsUserActivity;
    self->_mapsUserActivity = v4;

    [(NSUserActivity *)self->_mapsUserActivity setDelegate:self];
    [(NSUserActivity *)self->_mapsUserActivity setEligibleForHandoff:1];
    [(NSUserActivity *)self->_mapsUserActivity setEligibleForPublicIndexing:0];
    [(NSUserActivity *)self->_mapsUserActivity setEligibleForSearch:0];
    mapsUserActivity = self->_mapsUserActivity;
  }

  return mapsUserActivity;
}

- (NSDictionary)_cachedMapsActivityDataDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)_updateUserActivity
{
  [(MapsActivityController *)self _maps_setNeedsUpdate:0 withSelector:a2];
  v3 = [(MapsActivityController *)self delegate];
  id v4 = [v3 mapsActivityWithFidelity:268435439];

  dispatch_queue_t v5 = [(MapsActivityController *)self delegate];
  id v6 = [v5 mapsActivityWithFidelity:268435407];

  if (v4 && v6)
  {
    v7 = [v4 name];
    id v8 = +[NSDate dateWithTimeIntervalSinceNow:3600.0];
    v23[0] = @"f";
    v23[1] = @"c";
    v24[0] = v4;
    v24[1] = v6;
    v23[2] = @"t";
    v23[3] = @"x";
    v24[2] = v7;
    v24[3] = v8;
    dispatch_queue_t v9 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
    id v10 = [(MapsActivityController *)self delegate];
    id v11 = [v10 appCoordinator];
    id v12 = [v11 baseActionCoordinator];
    id v13 = [v12 currentMapItem];

    if (v13)
    {
      id v14 = [v9 mutableCopy];
      [v14 setObject:v13 forKeyedSubscript:@"m"];
      id v15 = [v14 copy];

      dispatch_queue_t v9 = v15;
    }
    [(MapsActivityController *)self set_cachedMapsActivityDataDictionary:v9];
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000845C4;
    block[3] = &unk_1012E5D58;
    id v17 = v7;
    id v21 = v17;
    v22 = self;
    dispatch_async(accessQueue, block);
    v18 = +[NSUserDefaults standardUserDefaults];
    unsigned int v19 = [v18 BOOLForKey:@"__internal__EnableTestMode"];

    if (v19) {
      [(MapsActivityController *)self writeCurrentState:v4];
    }
  }
}

- (MapsActivityControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MapsActivityControllerDelegate *)WeakRetained;
}

- (void)set_cachedMapsActivityDataDictionary:(id)a3
{
}

- (void)setNeedsUserActivityUpdate
{
  if (self->_needToWaitForHandoff)
  {
    BOOL v3 = 1;
  }
  else
  {
    [(MapsActivityController *)self _maps_setNeedsUpdateWithSelector:"_updateUserActivity"];
    BOOL v3 = 0;
  }
  self->_needToUpdateHandoff = v3;
}

- (void)setDelegate:(id)a3
{
}

- (id)mapsUserActivityForStateRestoration
{
  v2 = [(MapsActivityController *)self delegate];
  BOOL v3 = [v2 mapsActivity];
  id v4 = [v3 data];

  dispatch_queue_t v5 = +[NSDate date];
  id v6 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.Maps.Restore"];
  v9[0] = @"MapsActivity";
  v9[1] = @"MapsActivityTimestamp";
  v10[0] = v4;
  v10[1] = v5;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v6 setUserInfo:v7];

  return v6;
}

- (void)archiveMapsActivity
{
  BOOL v3 = sub_100084D38();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  dispatch_queue_t v5 = sub_100084D38();
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Archive", "", buf, 2u);
  }

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100AEA7C0;
  v32[3] = &unk_1012E5D08;
  v32[4] = self;
  v7 = objc_retainBlock(v32);
  if (+[NSThread isMainThread]) {
    ((void (*)(void *))v7[2])(v7);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
  id v8 = [(MapsActivityController *)self delegate];
  dispatch_queue_t v9 = [v8 mapsActivity];

  id v10 = [v9 displayOptions];
  unsigned int v11 = [v10 hasCamera];

  if (v11)
  {
    id v12 = [v9 displayOptions];
    id v13 = [v12 camera];

    id v14 = [v13 data];
    if (v14)
    {
      id v15 = +[NSUserDefaults __maps_groupUserDefaults];
      [v15 setObject:v14 forKey:@"MapsLastActivityCamera"];
    }
  }
  v16 = [v9 displayOptions];
  unsigned int v17 = [v16 hasMapType];

  if (v17)
  {
    v18 = [v9 displayOptions];
    signed int v19 = [v18 mapType];

    v20 = +[NSUserDefaults __maps_groupUserDefaults];
    [v20 setInteger:v19 forKey:@"MapsLastActivityMapType"];
  }
  id v21 = +[NSUUID UUID];
  v22 = [v21 UUIDString];

  id v23 = sub_100084D38();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v22;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Archiving MapsActivity (tag %@)", buf, 0xCu);
  }

  loggingQueue = self->_loggingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100AEA88C;
  block[3] = &unk_1012E5D58;
  id v30 = v22;
  id v31 = v9;
  id v25 = v9;
  id v26 = v22;
  dispatch_async(loggingQueue, block);
  v27 = sub_100084D38();
  id v28 = v27;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, v4, "Archive", "", buf, 2u);
  }
}

- (id)_cleanDictionary:(id)a3
{
  id v4 = [a3 mutableCopy];
  dispatch_queue_t v5 = [v4 allKeys];
  id v6 = [v5 copy];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v13 = [v4 objectForKeyedSubscript:v12, v18];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v4 removeObjectForKey:v12];
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = [(MapsActivityController *)self _cleanDictionary:v13];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_13;
          }
          uint64_t v14 = [(MapsActivityController *)self _cleanArray:v13];
        }
        id v15 = (void *)v14;
        [v4 setObject:v14 forKeyedSubscript:v12];

LABEL_13:
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  id v16 = [v4 copy];

  return v16;
}

- (id)_cleanArray:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v12 = [(MapsActivityController *)self _cleanDictionary:v11];
LABEL_11:
            id v13 = (void *)v12;
            [v5 addObject:v12];

            continue;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v12 = [(MapsActivityController *)self _cleanArray:v11];
            goto LABEL_11;
          }
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v14 = [v5 copy];

  return v14;
}

- (void)writeCurrentState:(id)a3
{
  id v4 = a3;
  if (qword_101610800 != -1) {
    dispatch_once(&qword_101610800, &stru_101317158);
  }
  if (qword_1016107F8)
  {
    dispatch_queue_t v5 = [v4 dictionaryRepresentation];
    id v6 = [(MapsActivityController *)self _cleanDictionary:v5];

    id v16 = 0;
    id v7 = +[NSJSONSerialization dataWithJSONObject:v6 options:1 error:&v16];
    id v8 = v16;
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = sub_100084D38();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = [v9 description];
        *(_DWORD *)buf = 138412290;
        long long v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "_writeCurrentState invalid json %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v10 = [objc_alloc((Class)NSString) initWithData:v7 encoding:4];
      uint64_t v12 = +[NSURL fileURLWithPath:qword_1016107F8];
      id v15 = 0;
      [v10 writeToURL:v12 atomically:1 encoding:4 error:&v15];
      id v9 = v15;

      if (v9)
      {
        id v13 = sub_100084D38();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          id v14 = [v9 description];
          *(_DWORD *)buf = 138412290;
          long long v18 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedMapsActivityDataDictionary, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loggingQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_mapsUserActivity, 0);
}

@end