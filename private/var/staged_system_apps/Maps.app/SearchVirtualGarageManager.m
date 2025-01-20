@interface SearchVirtualGarageManager
+ (id)sharedSearchVirtualGarageManager;
- (SearchVirtualGarageManager)init;
- (VGVirtualGarage)virtualGarage;
- (id)updatedTraitsForCurrentGarageState:(id)a3;
- (void)dealloc;
- (void)setVirtualGarage:(id)a3;
- (void)virtualGarageDidBecomeAvailable;
@end

@implementation SearchVirtualGarageManager

- (SearchVirtualGarageManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)SearchVirtualGarageManager;
  v2 = [(SearchVirtualGarageManager *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("SearchVirtualGarageManager.isolationQueue", v3);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v4;

    v6 = +[VGVirtualGarageService sharedService];
    [v6 registerObserver:v2];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"virtualGarageDidBecomeAvailable" name:off_1015F22B0 object:0];
  }
  return v2;
}

- (void)setVirtualGarage:(id)a3
{
  id v4 = a3;
  isolationQueue = self->_isolationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100105874;
  v7[3] = &unk_1012E5D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(isolationQueue, v7);
}

- (void)virtualGarageDidBecomeAvailable
{
  v3 = [(SearchVirtualGarageManager *)self virtualGarage];
  if (v3)
  {
  }
  else if (MapsFeature_IsEnabled_EVRouting() & 1) != 0 || (MapsFeature_IsEnabled_Alberta())
  {
    id v4 = sub_1000519B4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[SearchVirtualGarageManager] fetching garage", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v5 = +[VGVirtualGarageService sharedService];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000318F4;
    v6[3] = &unk_1012E65A8;
    objc_copyWeak(&v7, buf);
    [v5 virtualGarageGetGarageWithReply:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(buf);
  }
}

+ (id)sharedSearchVirtualGarageManager
{
  if (qword_101610158 != -1) {
    dispatch_once(&qword_101610158, &stru_101303670);
  }
  v2 = (void *)qword_101610150;

  return v2;
}

- (id)updatedTraitsForCurrentGarageState:(id)a3
{
  id v3 = a3;
  [v3 clearEvChargingPorts];
  [v3 clearPreferredBrands];
  id v4 = +[SearchVirtualGarageManager sharedSearchVirtualGarageManager];
  v5 = [v4 virtualGarage];

  id v6 = [v5 selectedVehicle];
  BOOL v7 = ([v3 navigating] & 1) != 0
    || [v3 searchOriginationType] == 1
    || [v3 searchOriginationType] == 2;
  id v8 = +[MapsExternalDevice sharedInstance];
  unsigned int v9 = [v8 isConnected];

  if (v6 && v7 | v9)
  {
    uint64_t v10 = [v6 updatedTraitsFrom:v3];

    id v3 = (id)v10;
  }
  else
  {
    v11 = [v5 vehicles];

    if (v11)
    {
      v24 = +[NSMutableSet set];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id obj = [v5 vehicles];
      id v12 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v12)
      {
        id v13 = v12;
        char v14 = 0;
        uint64_t v15 = *(void *)v32;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v32 != v15) {
              objc_enumerationMutation(obj);
            }
            v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            v18 = [v17 evChargingPorts];
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472;
            v29[2] = sub_100669A24;
            v29[3] = &unk_1012F37B0;
            id v19 = v3;
            id v20 = v3;
            id v30 = v20;
            [v18 enumerateObjectsUsingBlock:v29];

            v21 = [v17 preferredChargingNetworks];
            v27[0] = _NSConcreteStackBlock;
            v27[1] = 3221225472;
            v27[2] = sub_100669A30;
            v27[3] = &unk_1012F37D8;
            id v28 = v24;
            [v21 enumerateObjectsUsingBlock:v27];

            if (!(v14 & 1 | (([v17 isLPRWithElectricEngine] & 1) == 0)))
            {
              [v20 addEngineType:3];
              char v14 = 1;
            }

            id v3 = v19;
          }
          id v13 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v13);
      }

      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100669A9C;
      v25[3] = &unk_1012F3800;
      id v3 = v3;
      id v26 = v3;
      [v24 enumerateObjectsUsingBlock:v25];
    }
  }

  return v3;
}

- (VGVirtualGarage)virtualGarage
{
  uint64_t v8 = 0;
  unsigned int v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_100104174;
  id v12 = sub_100104938;
  id v13 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100105880;
  block[3] = &unk_1012E73F0;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(isolationQueue, block);
  if (!v9[5] && ((MapsFeature_IsEnabled_EVRouting() & 1) != 0 || MapsFeature_IsEnabled_Alberta()))
  {
    id v3 = sub_1000519B4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[SearchVirtualGarageManager] using nil garage", v6, 2u);
    }
  }
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (VGVirtualGarage *)v4;
}

- (void)dealloc
{
  id v3 = +[VGVirtualGarageService sharedService];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SearchVirtualGarageManager;
  [(SearchVirtualGarageManager *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualGarage, 0);

  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end