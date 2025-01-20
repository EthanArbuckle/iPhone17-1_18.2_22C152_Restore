@interface LivefsDomainManager
+ (void)addDomain:(id)a3 displayName:(id)a4 storage:(id)a5 provider:(id)a6 domainError:(id)a7 how:(int)a8 reply:(id)a9;
+ (void)removeDomain:(id)a3 provider:(id)a4 how:(int)a5 reply:(id)a6;
+ (void)updateDomain:(id)a3 reply:(id)a4;
@end

@implementation LivefsDomainManager

+ (void)addDomain:(id)a3 displayName:(id)a4 storage:(id)a5 provider:(id)a6 domainError:(id)a7 how:(int)a8 reply:(id)a9
{
  __int16 v9 = a8;
  id v26 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = (void (**)(id, void))a9;
  dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_10002C0D4;
  v37 = sub_10002C0E4;
  id v38 = 0;
  id v20 = [objc_alloc((Class)NSFileProviderDomain) initWithIdentifier:v26 displayName:v14 pathRelativeToDocumentStorage:v15 hidden:(v9 & 0x80) != 0];
  v21 = livefs_std_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v40 = v26;
    __int16 v41 = 2112;
    id v42 = v14;
    __int16 v43 = 2112;
    id v44 = v16;
    __int16 v45 = 1024;
    int v46 = (v9 & 0x80) >> 7;
    _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "LivefsDomainManager: Domain name %@ displayName %@ provider %@ isHidden %d", buf, 0x26u);
  }

  id v22 = [objc_alloc((Class)NSFileProviderManager) _initWithProviderIdentifier:v16];
  if ((v9 & 0x20) != 0) {
    [v20 setContainsPhotos:1];
  }
  if ((v9 & 0x1000) != 0) {
    [v20 setErasable:1];
  }
  [v20 setError:v17, v26];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10002C0EC;
  v30[3] = &unk_100059568;
  v32 = &v33;
  v23 = v19;
  v31 = v23;
  [v22 addDomain:v20 completionHandler:v30];
  dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v24 = v34[5];
  if ((v9 & 1) == 0 || v24)
  {
    v18[2](v18, v24);
  }
  else
  {
    id v25 = [objc_alloc((Class)NSFileProviderManager) _initWithProviderIdentifier:v16 domain:v20];

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10002C170;
    v28[3] = &unk_1000591E8;
    v29 = v18;
    [v25 setConnected:1 completionHandler:v28];

    id v22 = v25;
  }

  _Block_object_dispose(&v33, 8);
}

+ (void)updateDomain:(id)a3 reply:(id)a4
{
  id v17 = a4;
  uint64_t v5 = LiveFSMounterVolumeNameKey;
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:v5];
  v8 = [v6 objectForKeyedSubscript:LiveFSMounterDisplayNameKey];
  __int16 v9 = [v6 objectForKeyedSubscript:LiveFSMounterDomainStorageKey];
  v10 = [v6 objectForKeyedSubscript:LiveFSMounterVolumeProviderNameKey];
  v11 = [v6 objectForKey:LiveFSMounterDomainContainsPhotos];
  v12 = [v6 objectForKey:LiveFSMounterDomainErrorKey];
  v13 = [v6 objectForKey:LiveFSMounterDomainErasable];
  id v14 = [v6 objectForKey:LiveFSMounterDomainHidden];

  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ([v11 BOOLValue]) {
      uint64_t v15 = 32;
    }
    else {
      uint64_t v15 = 0;
    }
    if (!v13) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if (!v13) {
      goto LABEL_13;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v13 BOOLValue]) {
      uint64_t v15 = v15 | 0x1000;
    }
    else {
      uint64_t v15 = v15;
    }
  }
LABEL_13:
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v14 BOOLValue]) {
        uint64_t v15 = v15 | 0x80;
      }
      else {
        uint64_t v15 = v15;
      }
    }
  }
  [a1 addDomain:v7 displayName:v8 storage:v9 provider:v10 domainError:v12 how:v15 reply:v17];
}

+ (void)removeDomain:(id)a3 provider:(id)a4 how:(int)a5 reply:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)NSFileProviderDomain) initWithIdentifier:v10 displayName:v10 pathRelativeToDocumentStorage:v10];

  id v12 = [objc_alloc((Class)NSFileProviderManager) _initWithProviderIdentifier:v9];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002C5A4;
  v14[3] = &unk_1000591E8;
  id v15 = v8;
  id v13 = v8;
  [v12 removeDomain:v11 completionHandler:v14];
}

@end