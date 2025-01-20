@interface SHFUPluginMobileAsset
- (NSNumber)searchLocal;
- (SHFUPluginMobileAsset)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6 deviceProperties:(id)a7;
- (id)downloadCatalog;
- (id)findLastestAsset:(id *)a3;
- (void)downloadFirmwareWithOptions:(id)a3;
- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4;
- (void)setSearchLocal:(id)a3;
@end

@implementation SHFUPluginMobileAsset

- (SHFUPluginMobileAsset)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6 deviceProperties:(id)a7
{
  v11.receiver = self;
  v11.super_class = (Class)SHFUPluginMobileAsset;
  v7 = [(SHFUPlugin *)&v11 initWithDeviceClass:a3 delegate:a4 info:a5 options:a6 deviceProperties:a7];
  if (v7)
  {
    v8 = (NSNumber *)[objc_alloc((Class)NSNumber) initWithBool:0];
    searchLocal = v7->_searchLocal;
    v7->_searchLocal = v8;
  }
  return v7;
}

- (id)downloadCatalog
{
  v3 = [(SHFUPluginMobileAsset *)self searchLocal];
  unsigned __int8 v4 = [v3 BOOLValue];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = sub_1000155B4;
    v40 = sub_1000155C4;
    id v41 = 0;
    objc_initWeak(&location, self);
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    int v34 = -1;
    v7 = [(SHFUPlugin *)self serialQueue];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000155CC;
    handler[3] = &unk_100024828;
    objc_copyWeak(v30, &location);
    v30[1] = "com.apple.MobileAsset.DownloadsReady";
    v29 = &v31;
    v8 = v6;
    v28 = v8;
    uint32_t v9 = notify_register_dispatch("com.apple.MobileAsset.DownloadsReady", &v34, v7, handler);

    id v10 = objc_alloc_init((Class)MADownloadOptions);
    [v10 setDiscretionary:0];
    [v10 setAllowsCellularAccess:1];
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 1;
    do
    {
      dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
      v12 = [(SHFUPlugin *)self mobileAssetType];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000156B8;
      v17[3] = &unk_100024850;
      uint32_t v22 = v9;
      v17[4] = self;
      v13 = v8;
      v18 = v13;
      v20 = &v36;
      v21 = &v23;
      v14 = v11;
      v19 = v14;
      +[MAAsset startCatalogDownload:v12 options:v10 then:v17];

      dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    }
    while (*((unsigned char *)v24 + 24));
    int v15 = *((_DWORD *)v32 + 6);
    if (v15 != -1)
    {
      notify_cancel(v15);
      *((_DWORD *)v32 + 6) = -1;
    }
    id v5 = (id)v37[5];
    _Block_object_dispose(&v23, 8);

    objc_destroyWeak(v30);
    _Block_object_dispose(&v31, 8);

    objc_destroyWeak(&location);
    _Block_object_dispose(&v36, 8);
  }
  return v5;
}

- (id)findLastestAsset:(id *)a3
{
  id v5 = [(SHFUPlugin *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100018378(self);
  }

  if (!a3)
  {
    v24 = 0;
    goto LABEL_15;
  }
  dispatch_semaphore_t v6 = [(SHFUPluginMobileAsset *)self downloadCatalog];
  id v7 = objc_alloc((Class)MAAssetQuery);
  v8 = [(SHFUPlugin *)self mobileAssetType];
  id v9 = [v7 initWithType:v8];

  [v9 returnTypes:2];
  uint64_t v10 = ASAttributeCompatibilityVersion;
  dispatch_semaphore_t v11 = [(SHFUPlugin *)self compatibilityVersion];
  v12 = [v11 stringValue];
  [v9 addKeyValuePair:v10 with:v12];

  unint64_t v13 = (unint64_t)[v9 queryMetaDataSync];
  if ((v13 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    v14 = [(SHFUPlugin *)self mobileAssetType];
    int v15 = +[NSString stringWithFormat:@"MobileAsset query failed for %@. MAQueryResult = %ld", v14, v13];

    id v16 = objc_alloc((Class)NSError);
    v17 = [(SHFUPlugin *)self errorDomain];
    NSErrorUserInfoKey v49 = NSLocalizedDescriptionKey;
    v50 = v15;
    v18 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    v19 = v16;
    v20 = v17;
    uint64_t v21 = 48;
  }
  else
  {
    v27 = [(SHFUPlugin *)self logHandle];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      sub_1000182F4(self);
    }

    v28 = [v9 results];
    id v29 = [v28 count];

    if (v29)
    {
      v30 = [(SHFUPlugin *)self logHandle];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        sub_100018270(v9);
      }

      uint64_t v31 = ASAttributeContentVersion;
      v32 = +[NSString stringWithFormat:@"SELF.attributes.%@ == %%@.@max.attributes.%@", ASAttributeContentVersion, ASAttributeContentVersion];
      uint64_t v33 = [v9 results];
      int v34 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v32, v33);

      v35 = [v9 results];
      uint64_t v36 = [v35 filteredArrayUsingPredicate:v34];

      if ([v36 count])
      {
        v24 = [v36 objectAtIndexedSubscript:0];
        id v22 = 0;
      }
      else
      {
        v44 = +[NSString stringWithFormat:@"Could not find asset with max %@", v31];
        id v41 = objc_alloc((Class)NSError);
        v42 = [(SHFUPlugin *)self errorDomain];
        NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
        v46 = v44;
        v43 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        id v22 = [v41 initWithDomain:v42 code:7 userInfo:v43];

        v24 = 0;
      }

      if (v24) {
        goto LABEL_11;
      }
      goto LABEL_7;
    }
    v37 = [(SHFUPlugin *)self compatibilityVersion];
    id v38 = [v37 intValue];
    v39 = [(SHFUPlugin *)self mobileAssetType];
    int v15 = +[NSString stringWithFormat:@"MAQueryResult = %ld. No assets with %@ %d found for domain %@", v13, v10, v38, v39];

    id v40 = objc_alloc((Class)NSError);
    v17 = [(SHFUPlugin *)self errorDomain];
    NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
    v48 = v15;
    v18 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    v19 = v40;
    v20 = v17;
    uint64_t v21 = 2;
  }
  id v22 = [v19 initWithDomain:v20 code:v21 userInfo:v18];

LABEL_7:
  if (v6) {
    uint64_t v23 = v6;
  }
  else {
    uint64_t v23 = v22;
  }
  v24 = 0;
  *a3 = v23;
LABEL_11:
  uint64_t v25 = [(SHFUPlugin *)self logHandle];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    sub_1000181E0((uint64_t)v24, v25);
  }

LABEL_15:
  return v24;
}

- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(SHFUPlugin *)self logHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000183FC((uint64_t)v6, v4, v7);
  }

  if (v4) {
    uint64_t v8 = +[ASAsset nonUserInitiatedDownloadsAllowed] ^ 1;
  }
  else {
    uint64_t v8 = 1;
  }
  id v9 = +[NSNumber numberWithBool:v8];
  [(SHFUPluginMobileAsset *)self setSearchLocal:v9];

  id v54 = 0;
  uint64_t v10 = [(SHFUPluginMobileAsset *)self findLastestAsset:&v54];
  id v11 = v54;
  id v12 = v11;
  unint64_t v13 = 0;
  if (v10 && !v11)
  {
    v14 = [(SHFUPlugin *)self latestFirmwareVersions];
    int v15 = [v10 attributes];
    id v16 = [v15 objectForKeyedSubscript:@"FirmwareVersions"];
    [v14 addEntriesFromDictionary:v16];

    v17 = [(SHFUPlugin *)self delegate];
    v18 = [(SHFUPlugin *)self batteryCheckDevice];
    id v19 = [v18 BOOLValue];
    v20 = [(SHFUPlugin *)self logHandle];
    [(SHFUPlugin *)self options];
    NSErrorUserInfoKey v47 = v10;
    id v22 = v21 = v6;
    uint64_t v23 = [v22 objectForKeyedSubscript:@"IOMatchLaunchServiceID"];
    v24 = [(SHFUPlugin *)self errorDomain];
    id v53 = 0;
    uint64_t v25 = +[SHFUDevice getDevices:v17 hasPowerSource:v19 logHandle:v20 registryEntryID:v23 errorDomain:v24 error:&v53];
    id v12 = v53;

    unint64_t v13 = (void *)v25;
    id v6 = v21;
    uint64_t v10 = v47;
  }
  if (v12)
  {
    uint64_t v26 = 0;
    BOOL v27 = 0;
    goto LABEL_28;
  }
  v46 = v13;
  id v48 = v6;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v28 = v13;
  id v29 = [v28 countByEnumeratingWithState:&v49 objects:v67 count:16];
  if (!v29)
  {
    uint64_t v26 = 0;
    BOOL v27 = 0;
    id v12 = 0;
    goto LABEL_27;
  }
  id v30 = v29;
  uint64_t v31 = *(void *)v50;
  while (2)
  {
    for (i = 0; i != v30; i = (char *)i + 1)
    {
      if (*(void *)v50 != v31) {
        objc_enumerationMutation(v28);
      }
      uint64_t v33 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      BOOL v27 = [(SHFUPlugin *)self deviceNeedsUpdate:v33];
      if (v27)
      {
        unint64_t v36 = (unint64_t)[v10 state];
        id v12 = 0;
        uint64_t v26 = 1;
        if (v36 > 6 || ((1 << v36) & 0x6C) == 0) {
          goto LABEL_27;
        }
        v37 = [v10 getLocalUrl];
        [(SHFUPlugin *)self setFirmwareDirectory:v37];
        id v12 = 0;
LABEL_26:

        uint64_t v26 = 0;
        goto LABEL_27;
      }
      int v34 = [(SHFUPlugin *)self latestFirmwareVersions];
      unsigned __int8 v35 = [v33 hardwareVersionSupportedBy:v34];

      if ((v35 & 1) == 0)
      {
        v37 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Device has HW revision ID %u which does not match FW files", [v33 hardwareVersion]);
        id v38 = objc_alloc((Class)NSError);
        v39 = [(SHFUPlugin *)self errorDomain];
        NSErrorUserInfoKey v65 = NSLocalizedDescriptionKey;
        v66 = v37;
        id v40 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        id v12 = [v38 initWithDomain:v39 code:44 userInfo:v40];

        goto LABEL_26;
      }
    }
    id v30 = [v28 countByEnumeratingWithState:&v49 objects:v67 count:16];
    uint64_t v26 = 0;
    BOOL v27 = 0;
    id v12 = 0;
    if (v30) {
      continue;
    }
    break;
  }
LABEL_27:

  unint64_t v13 = v46;
  id v6 = v48;
LABEL_28:
  id v41 = [(SHFUPlugin *)self logHandle];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = [(SHFUPlugin *)self targetDevice];
    *(_DWORD *)buf = 138413314;
    v56 = v42;
    __int16 v57 = 1024;
    BOOL v58 = v12 == 0;
    __int16 v59 = 1024;
    BOOL v60 = v27;
    __int16 v61 = 1024;
    int v62 = v26;
    __int16 v63 = 2112;
    id v64 = v12;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "findFirmware: target device %@ successful %d updateAvailable %d needsDownload %d error %@", buf, 0x28u);
  }
  v43 = [(SHFUPlugin *)self delegate];
  v44 = [(SHFUPlugin *)self pluginInfo];
  if (v12) {
    BOOL v45 = 0;
  }
  else {
    BOOL v45 = v27;
  }
  [v43 didFind:v12 == 0 info:v44 updateAvailable:v27 needsDownload:v26 error:v12];

  if (!v45)
  {
    [(SHFUPlugin *)self setError:v12];
    [(SHFUPlugin *)self setTransaction:0];
    [(SHFUPlugin *)self setSerialQueue:0];
  }
}

- (void)downloadFirmwareWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(SHFUPlugin *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000184B4();
  }

  uint64_t v33 = 0;
  int v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_1000155B4;
  uint64_t v31 = sub_1000155C4;
  id v32 = 0;
  id obj = 0;
  id v6 = [(SHFUPluginMobileAsset *)self findLastestAsset:&obj];
  objc_storeStrong(&v32, obj);
  if (v6 && !v28[5])
  {
    id v7 = objc_alloc_init((Class)MADownloadOptions);
    [v7 setDiscretionary:0];
    [v7 setAllowsCellularAccess:1];
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    id v19 = sub_100016784;
    v20 = &unk_100024878;
    v24 = &v33;
    id v21 = self;
    id v22 = v6;
    uint64_t v25 = &v27;
    id v9 = v8;
    uint64_t v23 = v9;
    [v22 startDownload:v7 then:&v17];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  }
  uint64_t v10 = [(SHFUPlugin *)self logHandle];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(SHFUPlugin *)self targetDevice];
    int v12 = *((unsigned __int8 *)v34 + 24);
    uint64_t v13 = v28[5];
    *(_DWORD *)buf = 138412802;
    id v38 = v11;
    __int16 v39 = 1024;
    int v40 = v12;
    __int16 v41 = 2112;
    uint64_t v42 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "downloadFirmware: target device %@ successful %d error %@", buf, 0x1Cu);
  }
  v14 = [(SHFUPlugin *)self delegate];
  int v15 = *((unsigned __int8 *)v34 + 24);
  id v16 = [(SHFUPlugin *)self pluginInfo];
  [v14 didDownload:v15 != 0 info:v16 error:v28[5]];

  if (!*((unsigned char *)v34 + 24))
  {
    [(SHFUPlugin *)self setError:v28[5]];
    [(SHFUPlugin *)self setTransaction:0];
    [(SHFUPlugin *)self setSerialQueue:0];
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
}

- (NSNumber)searchLocal
{
  return self->_searchLocal;
}

- (void)setSearchLocal:(id)a3
{
}

- (void).cxx_destruct
{
}

@end