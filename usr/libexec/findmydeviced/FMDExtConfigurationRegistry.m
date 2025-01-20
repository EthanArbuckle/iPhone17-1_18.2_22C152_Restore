@interface FMDExtConfigurationRegistry
+ (FMDExtConfigurationRegistry)sharedInstance;
- (BOOL)supportsAccessoryType:(id)a3;
- (FMDExtConfigurationRegistry)init;
- (FMDExtConfigurationUpdatedListner)listner;
- (FMDataArchiver)dataArchiver;
- (NSDictionary)defaultConfigurations;
- (NSMutableDictionary)configurations;
- (NSSet)supportedAccessories;
- (NSString)version;
- (OS_dispatch_queue)serialQueue;
- (id)configForAccessoryType:(id)a3;
- (void)_initializeFromDisk;
- (void)_updateDisk;
- (void)fetchConfigForAccessoryTypes:(id)a3;
- (void)fetchSupportedAccessoryTypes;
- (void)prepareForAccessoryType:(id)a3;
- (void)readDefaultConfigurations;
- (void)setConfigurations:(id)a3;
- (void)setDataArchiver:(id)a3;
- (void)setDefaultConfigurations:(id)a3;
- (void)setListner:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSupportedAccessories:(id)a3;
- (void)setVersion:(id)a3;
- (void)updateConfigurations:(id)a3;
- (void)updateSupportedAccessoryTypes:(id)a3;
@end

@implementation FMDExtConfigurationRegistry

+ (FMDExtConfigurationRegistry)sharedInstance
{
  if (qword_10031E778 != -1) {
    dispatch_once(&qword_10031E778, &stru_1002D9D88);
  }
  v2 = (void *)qword_10031E770;

  return (FMDExtConfigurationRegistry *)v2;
}

- (FMDExtConfigurationRegistry)init
{
  v19.receiver = self;
  v19.super_class = (Class)FMDExtConfigurationRegistry;
  v2 = [(FMDExtConfigurationRegistry *)&v19 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("FMDExtConfigurationRegistry.serialQueue", 0);
    [(FMDExtConfigurationRegistry *)v2 setSerialQueue:v3];

    id v4 = objc_alloc_init((Class)NSSet);
    [(FMDExtConfigurationRegistry *)v2 setSupportedAccessories:v4];

    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    [(FMDExtConfigurationRegistry *)v2 setConfigurations:v5];

    id v6 = objc_alloc_init((Class)NSDictionary);
    [(FMDExtConfigurationRegistry *)v2 setDefaultConfigurations:v6];

    id v7 = objc_alloc_init((Class)FMInternalFileContainer);
    v8 = [v7 url];
    v9 = [v8 fm_preferencesPathURLForDomain:@"com.apple.icloud.findmydeviced.extensions.configurations"];

    v10 = sub_100059878();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Initialize configuration from location %@", buf, 0xCu);
    }

    id v11 = [objc_alloc((Class)FMDataArchiver) initWithFileURL:v9];
    [(FMDExtConfigurationRegistry *)v2 setDataArchiver:v11];

    v12 = [(FMDExtConfigurationRegistry *)v2 dataArchiver];
    [v12 setDataProtectionClass:4];

    v13 = [(FMDExtConfigurationRegistry *)v2 dataArchiver];
    [v13 setBackedUp:0];

    v14 = [(FMDExtConfigurationRegistry *)v2 dataArchiver];
    [v14 setCreateDirectories:1];

    [(FMDExtConfigurationRegistry *)v2 setVersion:@"0"];
    v15 = [(FMDExtConfigurationRegistry *)v2 serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D0EC;
    block[3] = &unk_1002D9378;
    v18 = v2;
    dispatch_async(v15, block);
  }
  return v2;
}

- (void)_updateDisk
{
  dispatch_queue_t v3 = [(FMDExtConfigurationRegistry *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  v20[0] = @"version";
  id v4 = [(FMDExtConfigurationRegistry *)self version];
  v21[0] = v4;
  v20[1] = @"supportedAccessories";
  id v5 = [(FMDExtConfigurationRegistry *)self supportedAccessories];
  v21[1] = v5;
  v20[2] = @"configurations";
  id v6 = [(FMDExtConfigurationRegistry *)self configurations];
  v21[2] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];

  v8 = sub_100059878();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    objc_super v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "saving configurations to disk %@", (uint8_t *)&v18, 0xCu);
  }

  v9 = [(FMDExtConfigurationRegistry *)self dataArchiver];
  v10 = [v9 saveDictionary:v7];

  if (v10)
  {
    id v11 = sub_100004238();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10023BDB4((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

- (void)_initializeFromDisk
{
  dispatch_queue_t v3 = [(FMDExtConfigurationRegistry *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_initWeak(&location, self);
  id v5 = sub_100059878();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "reading configurations from disk", buf, 2u);
  }

  id v6 = [(FMDExtConfigurationRegistry *)self dataArchiver];
  id v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  id v22 = 0;
  v8 = [v6 readDictionaryAndClasses:v7 error:&v22];
  id v9 = v22;

  if (+[FMPreferencesUtil BOOLForKey:@"doNotUseDefaultConfigs" inDomain:kFMDNotBackedUpPrefDomain])
  {
    v10 = sub_100059878();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "not using default configs", buf, 2u);
    }
  }
  else
  {
    id v11 = sub_100059878();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "using default configs", buf, 2u);
    }

    [(FMDExtConfigurationRegistry *)self readDefaultConfigurations];
  }
  if (!v8 || v9)
  {
    objc_super v19 = sub_100059878();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10023BE20((uint64_t)v9, (uint64_t)v8, v19);
    }

    uint64_t v16 = dispatch_get_global_queue(0, 0);
    uint64_t v17 = v16;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D6A4;
    block[3] = &unk_1002D9378;
    void block[4] = self;
    int v18 = block;
  }
  else
  {
    uint64_t v12 = [v8 objectForKeyedSubscript:@"version"];
    [(FMDExtConfigurationRegistry *)self setVersion:v12];

    uint64_t v13 = [v8 objectForKeyedSubscript:@"supportedAccessories"];
    [(FMDExtConfigurationRegistry *)self setSupportedAccessories:v13];

    uint64_t v14 = [v8 objectForKeyedSubscript:@"configurations"];
    [(FMDExtConfigurationRegistry *)self setConfigurations:v14];

    uint64_t v15 = sub_100059878();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "read from disk successful with result %@", buf, 0xCu);
    }

    uint64_t v16 = dispatch_get_global_queue(0, 0);
    uint64_t v17 = v16;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001D6AC;
    void v20[3] = &unk_1002D9378;
    v20[4] = self;
    int v18 = v20;
  }
  dispatch_async(v16, v18);

  objc_destroyWeak(&location);
}

- (void)readDefaultConfigurations
{
  v2 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/FindMyDevice.framework"];
  uint64_t v3 = [v2 pathForResource:@"findkit-default-configs" ofType:@"json"];

  id v4 = sub_100004238();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v28 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "read from path %@", buf, 0xCu);
  }

  uint64_t v5 = +[NSData dataWithContentsOfFile:v3];
  objc_super v19 = (void *)v5;
  v20 = (void *)v3;
  if (v5)
  {
    id v6 = +[NSJSONSerialization JSONObjectWithData:v5 options:0 error:0];
    id v7 = sub_100059878();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = (uint64_t)v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "read from disk successful with result %@", buf, 0xCu);
    }
  }
  else
  {
    id v7 = sub_100059878();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "file not found at path %@", buf, 0xCu);
    }
    id v6 = 0;
  }

  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  int v18 = v6;
  id v9 = [v6 objectForKeyedSubscript:@"configurations"];
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v15 = [[FMDExtAccessoryConfiguration alloc] initWithConfigurationInfo:v14];
        uint64_t v16 = v15;
        if (v15)
        {
          uint64_t v17 = [(FMDExtAccessoryConfiguration *)v15 accessoryType];
          [v8 setObject:v16 forKeyedSubscript:v17];
        }
        else
        {
          uint64_t v17 = sub_100059878();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v28 = (uint64_t)v14;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Invalid configuration received %@", buf, 0xCu);
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  [(FMDExtConfigurationRegistry *)self setDefaultConfigurations:v8];
}

- (void)fetchSupportedAccessoryTypes
{
  uint64_t v3 = sub_100059878();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "fetching supported accessory type from server", v11, 2u);
  }

  id v4 = +[FMDServiceProvider activeServiceProvider];
  uint64_t v5 = [FMDSupportedAccessoryTypesAction alloc];
  id v6 = [v4 account];
  id v7 = [v4 serverInteractionController];
  id v8 = [(FMDSupportedAccessoryTypesAction *)v5 initWithAccount:v6 registry:self serverInteractionController:v7];

  id v9 = +[ActionManager sharedManager];
  id v10 = [v9 enqueueAction:v8];
}

- (void)fetchConfigForAccessoryTypes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100059878();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "fetching config from server for %@", (uint8_t *)&v13, 0xCu);
  }

  id v6 = +[FMDServiceProvider activeServiceProvider];
  id v7 = [FMDAccessoryInfoAction alloc];
  id v8 = [v6 account];
  id v9 = [v6 serverInteractionController];
  id v10 = [(FMDAccessoryInfoAction *)v7 initWithAccount:v8 registry:self accessoryTypes:v4 serverInteractionController:v9];

  id v11 = +[ActionManager sharedManager];
  id v12 = [v11 enqueueAction:v10];
}

- (void)updateSupportedAccessoryTypes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FMDExtConfigurationRegistry *)self serialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001DD7C;
  v7[3] = &unk_1002D93F0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)updateConfigurations:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"configurations"];
  id v6 = sub_100059878();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "received configuration %@", buf, 0xCu);
  }

  id v7 = objc_alloc_init((Class)NSMutableArray);
  if (v5)
  {
    id v8 = [(FMDExtConfigurationRegistry *)self serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001E280;
    block[3] = &unk_1002D9C78;
    id v10 = v5;
    id v11 = self;
    id v12 = v7;
    dispatch_async(v8, block);
  }
}

- (BOOL)supportsAccessoryType:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(FMDExtConfigurationRegistry *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E7D4;
  block[3] = &unk_1002D9990;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (id)configForAccessoryType:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_10001E9BC;
  uint64_t v16 = sub_10001E9CC;
  id v17 = 0;
  uint64_t v5 = [(FMDExtConfigurationRegistry *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E9D4;
  block[3] = &unk_1002D9508;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)prepareForAccessoryType:(id)a3
{
  id v4 = a3;
  if ([(FMDExtConfigurationRegistry *)self supportsAccessoryType:v4])
  {
    uint64_t v5 = [(FMDExtConfigurationRegistry *)self configForAccessoryType:v4];

    if (!v5)
    {
      id v7 = v4;
      id v6 = +[NSArray arrayWithObjects:&v7 count:1];
      [(FMDExtConfigurationRegistry *)self fetchConfigForAccessoryTypes:v6];
    }
  }
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (FMDExtConfigurationUpdatedListner)listner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listner);

  return (FMDExtConfigurationUpdatedListner *)WeakRetained;
}

- (void)setListner:(id)a3
{
}

- (NSSet)supportedAccessories
{
  return self->_supportedAccessories;
}

- (void)setSupportedAccessories:(id)a3
{
}

- (NSMutableDictionary)configurations
{
  return self->_configurations;
}

- (void)setConfigurations:(id)a3
{
}

- (NSDictionary)defaultConfigurations
{
  return self->_defaultConfigurations;
}

- (void)setDefaultConfigurations:(id)a3
{
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_defaultConfigurations, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_supportedAccessories, 0);
  objc_destroyWeak((id *)&self->_listner);

  objc_storeStrong((id *)&self->_version, 0);
}

@end