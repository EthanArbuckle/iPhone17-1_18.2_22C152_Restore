@interface SUBDocumentationFetcher
+ (id)_downloadOptionsWithServerParams:(id)a3;
+ (int64_t)_requestDocCatalogDownload:(id)a3;
- (NSMutableDictionary)localDocumentationFetchCompletions;
- (NSMutableDictionary)remoteDocumentationFetchCompletions;
- (NSString)cachedDocumentationID;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)queue;
- (SUBDocumentation)cachedDocumentation;
- (SUBDocumentationFetcher)init;
- (id)_documentationQuery;
- (id)queryForDocAsset:(id)a3 localOnly:(BOOL)a4 error:(id *)a5;
- (void)_fetchDocumentationForDocumentationID:(id)a3 localOnly:(BOOL)a4 shouldOverrideURL:(BOOL)a5 overrideURL:(id)a6 completion:(id)a7;
- (void)_invokeFetchCompletionsForDocumentationID:(id)a3 localOnly:(BOOL)a4 documentation:(id)a5 error:(id)a6;
- (void)_purgeAssetsNotMatchingDescriptor:(id)a3 completion:(id)a4;
- (void)fetchDocumentationForDescriptor:(id)a3 localOnly:(BOOL)a4 completion:(id)a5;
- (void)fetchDocumentationForDescriptor:(id)a3 localOnly:(BOOL)a4 overrideURL:(id)a5 completion:(id)a6;
- (void)fetchDocumentationForDescriptor:(id)a3 localOnly:(BOOL)a4 shouldOverrideURL:(BOOL)a5 overrideURL:(id)a6 completion:(id)a7;
- (void)purgeAssetsNotMatchingDescriptor:(id)a3 completion:(id)a4;
- (void)setCachedDocumentation:(id)a3;
- (void)setCachedDocumentationID:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setLocalDocumentationFetchCompletions:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteDocumentationFetchCompletions:(id)a3;
@end

@implementation SUBDocumentationFetcher

- (SUBDocumentationFetcher)init
{
  v14.receiver = self;
  v14.super_class = (Class)SUBDocumentationFetcher;
  v2 = [(SUBDocumentationFetcher *)&v14 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.subridged.SUBDocumentationFetcher.queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.subridged.SUBDocumentationFetcher.callbackQueue", v6);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_opt_new();
    localDocumentationFetchCompletions = v2->_localDocumentationFetchCompletions;
    v2->_localDocumentationFetchCompletions = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    remoteDocumentationFetchCompletions = v2->_remoteDocumentationFetchCompletions;
    v2->_remoteDocumentationFetchCompletions = (NSMutableDictionary *)v11;
  }
  return v2;
}

- (id)_documentationQuery
{
  id v2 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.WatchSoftwareUpdateDocumentation"];
  return v2;
}

- (void)_invokeFetchCompletionsForDocumentationID:(id)a3 localOnly:(BOOL)a4 documentation:(id)a5 error:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v10) {
    sub_10001D8A4();
  }
  if (v11)
  {
    [(SUBDocumentationFetcher *)self setCachedDocumentationID:v10];
    [(SUBDocumentationFetcher *)self setCachedDocumentation:v11];
  }
  uint64_t v13 = 40;
  if (v8) {
    uint64_t v13 = 32;
  }
  id v14 = *(id *)((char *)&self->super.isa + v13);
  v15 = [v14 objectForKeyedSubscript:v10];
  [v14 setObject:0 forKeyedSubscript:v10];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v21 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v21 + 1) + 8 * i));
      }
      id v18 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v18);
  }

  if (!v8) {
    -[SUBDocumentationFetcher _invokeFetchCompletionsForDocumentationID:localOnly:documentation:error:](self, "_invokeFetchCompletionsForDocumentationID:localOnly:documentation:error:", v10, 1, v11, v12, (void)v21);
  }
}

- (void)fetchDocumentationForDescriptor:(id)a3 localOnly:(BOOL)a4 completion:(id)a5
{
}

- (void)fetchDocumentationForDescriptor:(id)a3 localOnly:(BOOL)a4 overrideURL:(id)a5 completion:(id)a6
{
}

- (void)fetchDocumentationForDescriptor:(id)a3 localOnly:(BOOL)a4 shouldOverrideURL:(BOOL)a5 overrideURL:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v15 = [v12 documentationID];
  if (!v15) {
    sub_10001D8D0();
  }
  id v16 = v15;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EB74;
  block[3] = &unk_10002D268;
  block[4] = self;
  id v22 = v15;
  BOOL v25 = a4;
  BOOL v26 = a5;
  id v23 = v13;
  id v24 = v14;
  id v18 = v13;
  id v19 = v14;
  id v20 = v16;
  dispatch_async(queue, block);
}

+ (id)_downloadOptionsWithServerParams:(id)a3
{
  id v3 = a3;
  dispatch_queue_t v4 = objc_opt_new();
  [v4 setTimeoutIntervalForResource:60];
  [v4 setAllowsCellularAccess:1];
  [v4 setDiscretionary:0];
  v5 = [v4 additionalServerParams];

  if (v5)
  {
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  BOOL v8 = +[NSMutableDictionary dictionary];
  [v4 setAdditionalServerParams:v8];

  if (v3)
  {
LABEL_3:
    v6 = [v4 additionalServerParams];
    [v6 addEntriesFromDictionary:v3];
  }
LABEL_4:

  return v4;
}

+ (int64_t)_requestDocCatalogDownload:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 3;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v5 = +[SUBDocumentationFetcher _downloadOptionsWithServerParams:v3];
  v6 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v19 = @"com.apple.MobileAsset.WatchSoftwareUpdateDocumentation";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : requesting %{public}@ catalog download", buf, 0xCu);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000F2C0;
  v11[3] = &unk_10002D290;
  id v13 = &v14;
  dispatch_queue_t v7 = v4;
  id v12 = v7;
  +[MAAsset startCatalogDownload:@"com.apple.MobileAsset.WatchSoftwareUpdateDocumentation" options:v5 then:v11];
  dispatch_time_t v8 = dispatch_time(0, 90000000000);
  dispatch_semaphore_wait(v7, v8);
  int64_t v9 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)queryForDocAsset:(id)a3 localOnly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  int64_t v9 = [(SUBDocumentationFetcher *)self _documentationQuery];
  id v10 = SUBActiveNRDevice();
  id v11 = v10;
  if (!v10)
  {
    long long v21 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : Failed to query device property Device Class", buf, 2u);
    }
    BOOL v26 = SUBError(@"SUBError", 5, 0, @"Failed to query device property Device Class", v22, v23, v24, v25, v37);
    v27 = 0;
    id v12 = 0;
    if (!a5) {
      goto LABEL_20;
    }
LABEL_19:
    *a5 = v26;
    goto LABEL_20;
  }
  BOOL v38 = v6;
  id v12 = [v10 valueForProperty:NRDevicePropertyDeviceNameString];
  id v13 = +[NSMutableArray arrayWithObject:v12];
  id v14 = [v9 addKeyValueArray:@"Device" with:v13];

  if (v14)
  {
    v15 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v40 = @"Device";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : error setting filter for: %{public}@", buf, 0xCu);
    }
    id v20 = @"Failed to set deviceClass query filter";
    goto LABEL_18;
  }
  v28 = +[NSMutableArray arrayWithObject:v8];
  id v29 = [v9 addKeyValueArray:@"SUDocumentationID" with:v28];

  if (v29)
  {
    v30 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v40 = @"SUDocumentationID";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : error setting filter for: %{public}@", buf, 0xCu);
    }
    id v20 = @"Failed to set documentationID query filter";
    goto LABEL_18;
  }
  CFStringRef v31 = (const __CFString *)[v9 queryMetaDataSync];
  if (v31)
  {
    CFStringRef v32 = v31;
    v33 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      CFStringRef v40 = v32;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : asset query failed: %{public}ld", buf, 0xCu);
    }
    id v20 = @"asset query failed";
LABEL_18:
    BOOL v26 = SUBError(@"SUBError", 5, 0, v20, v16, v17, v18, v19, v37);
    [(SUBDocumentationFetcher *)self _invokeFetchCompletionsForDocumentationID:v8 localOnly:v38 documentation:0 error:v26];
    v27 = 0;
    if (!a5) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v27 = [v9 results];
  v35 = (void *)softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    v36 = v35;
    *(_DWORD *)buf = 134349056;
    CFStringRef v40 = (const __CFString *)[v27 count];
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : MobileAsset returned %{public}lu matching assets", buf, 0xCu);
  }
  BOOL v26 = 0;
  if (a5) {
    goto LABEL_19;
  }
LABEL_20:

  return v27;
}

- (void)_fetchDocumentationForDocumentationID:(id)a3 localOnly:(BOOL)a4 shouldOverrideURL:(BOOL)a5 overrideURL:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v12) {
    sub_10001D8FC();
  }
  if (!v14) {
    sub_10001D928();
  }
  if (!v10)
  {
    if (!MGGetBoolAnswer()
      || v9
      || (keyExistsAndHasValidFormat[0] = 0,
          int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"DisableCustomerDocAssetURLOverride", @"com.apple.subridge", keyExistsAndHasValidFormat), keyExistsAndHasValidFormat[0])&& AppBooleanValue)
    {
      if (!v9) {
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v16 = +[NSURL URLWithString:@"https://mesu.apple.com/assets/"];

      id v13 = (id)v16;
    }
    uint64_t v17 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)keyExistsAndHasValidFormat = 138543618;
      CFStringRef v71 = @"com.apple.MobileAsset.WatchSoftwareUpdateDocumentation";
      __int16 v72 = 2114;
      id v73 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] :Overriding MobileAsset URL for (%{public}@) to: %{public}@", keyExistsAndHasValidFormat, 0x16u);
    }
    ASSetDefaultAssetServerURLForAssetType();
  }
LABEL_14:
  cachedDocumentationID = self->_cachedDocumentationID;
  if (!cachedDocumentationID
    || !self->_cachedDocumentation
    || ![(NSString *)cachedDocumentationID isEqual:v12])
  {
    uint64_t v20 = 40;
    if (v10) {
      uint64_t v20 = 32;
    }
    id v21 = *(id *)((char *)&self->super.isa + v20);
    uint64_t v22 = [v21 objectForKeyedSubscript:v12];
    if ([v22 count])
    {
      id v23 = [v14 copy];
      uint64_t v24 = objc_retainBlock(v23);
      [v22 addObject:v24];
LABEL_58:

      goto LABEL_59;
    }
    if (!v22)
    {
      uint64_t v22 = objc_opt_new();
      [v21 setObject:v22 forKeyedSubscript:v12];
    }
    id v25 = [v14 copy];
    id v26 = objc_retainBlock(v25);
    [v22 addObject:v26];

    v27 = SUBActiveNRDevice();
    id v23 = v27;
    if (!v27)
    {
      v44 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)keyExistsAndHasValidFormat = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : Failed to query device property Device Class", keyExistsAndHasValidFormat, 2u);
      }
      uint64_t v24 = SUBError(@"SUBError", 5, 0, @"Failed to query device property Device Name", v45, v46, v47, v48, (uint64_t)v57);
      (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v24);
      goto LABEL_58;
    }
    uint64_t v24 = [v27 valueForProperty:NRDevicePropertyDeviceNameString];
    v28 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)keyExistsAndHasValidFormat = 138544130;
      CFStringRef v71 = @"SUDocumentationID";
      __int16 v72 = 2114;
      id v73 = v12;
      __int16 v74 = 2114;
      CFStringRef v75 = @"Device";
      __int16 v76 = 2114;
      v77 = v24;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : looking for documentation matching \n%{public}@: %{public}@ \n%{public}@: %{public}@ \n", keyExistsAndHasValidFormat, 0x2Au);
    }
    if (!v10)
    {
LABEL_36:
      id v69 = 0;
      v36 = [(SUBDocumentationFetcher *)self queryForDocAsset:v12 localOnly:v10 error:&v69];
      id v60 = v69;
      v62 = v36;
      id v63 = v13;
      if ([v36 count])
      {
        v59 = [v36 objectAtIndexedSubscript:0];
        if (([v59 refreshState] & 1) == 0)
        {
          uint64_t v37 = softwareupdatebridge_log;
          if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)keyExistsAndHasValidFormat = 0;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : Failed to refresh documentation asset state..assuming previous state", keyExistsAndHasValidFormat, 2u);
          }
        }
        if ([v59 state] == (id)2)
        {
          BOOL v38 = softwareupdatebridge_log;
          if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)keyExistsAndHasValidFormat = 0;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : found installed documentation asset", keyExistsAndHasValidFormat, 2u);
          }
          v39 = v59;
          CFStringRef v40 = [[SUBDocumentation alloc] initWithMAAsset:v59];
          v41 = self;
          v42 = v40;
          [(SUBDocumentationFetcher *)v41 _invokeFetchCompletionsForDocumentationID:v12 localOnly:v10 documentation:v40 error:0];
          v43 = v60;
        }
        else
        {
          [v59 attachProgressCallBack:&stru_10002D2D0];
          v54 = (SUBDocumentation *)objc_alloc_init((Class)MADownloadOptions);
          [(SUBDocumentation *)v54 setAllowsCellularAccess:1];
          [(SUBDocumentation *)v54 setDiscretionary:0];
          v58 = v54;
          [(SUBDocumentation *)v54 setTimeoutIntervalForResource:120];
          v55 = softwareupdatebridge_log;
          if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)keyExistsAndHasValidFormat = 138543362;
            CFStringRef v71 = @"com.apple.MobileAsset.WatchSoftwareUpdateDocumentation";
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : Downloading %{public}@ asset", keyExistsAndHasValidFormat, 0xCu);
          }
          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472;
          v64[2] = sub_1000102D0;
          v64[3] = &unk_10002D320;
          v64[4] = self;
          v39 = v59;
          id v65 = v59;
          id v66 = v12;
          BOOL v68 = v10;
          v43 = v60;
          id v67 = v60;
          v42 = v58;
          [v65 startDownload:v58 then:v64];
        }
      }
      else
      {
        v49 = softwareupdatebridge_log;
        if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)keyExistsAndHasValidFormat = 0;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : Failed to find documentation asset", keyExistsAndHasValidFormat, 2u);
        }
        v43 = v60;
        v39 = SUBError(@"SUBError", 6, v60, @"Failed to find documentation asset", v50, v51, v52, v53, (uint64_t)v57);
        [(SUBDocumentationFetcher *)self _invokeFetchCompletionsForDocumentationID:v12 localOnly:v10 documentation:0 error:v39];
      }

      id v13 = v63;
      goto LABEL_58;
    }
    CFStringRef v57 = @"DeviceName";
    id v29 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v24];
    int64_t v30 = +[SUBDocumentationFetcher _requestDocCatalogDownload:v29];
    if (v30)
    {
      if (v30 == 18)
      {
        SUBError(@"SUBError", 6, 0, @"No documentation asset found for documentationID %@", v31, v32, v33, v34, (uint64_t)v12);
      }
      else
      {
        if (v30 == 10) {
          goto LABEL_33;
        }
        SUBError(@"SUBError", 5, 0, @"Documentation asset query failed", v31, v32, v33, v34, @"DeviceName");
      v56 = };
      [(SUBDocumentationFetcher *)self _invokeFetchCompletionsForDocumentationID:v12 localOnly:1 documentation:0 error:v56];

      goto LABEL_58;
    }
LABEL_33:
    v61 = v29;
    v35 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)keyExistsAndHasValidFormat = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : Doc download successful or already installed", keyExistsAndHasValidFormat, 2u);
    }

    goto LABEL_36;
  }
  uint64_t v19 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)keyExistsAndHasValidFormat = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : Cached documentation is same as passed documentation id", keyExistsAndHasValidFormat, 2u);
  }
  (*((void (**)(id, SUBDocumentation *, void))v14 + 2))(v14, self->_cachedDocumentation, 0);
LABEL_59:
}

- (void)purgeAssetsNotMatchingDescriptor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000105E8;
  block[3] = &unk_10002D370;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_purgeAssetsNotMatchingDescriptor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  cachedDocumentationID = self->_cachedDocumentationID;
  if (cachedDocumentationID)
  {
    id v9 = [v6 documentationID];
    unsigned __int8 v10 = [(NSString *)cachedDocumentationID isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      [(SUBDocumentationFetcher *)self setCachedDocumentationID:0];
      [(SUBDocumentationFetcher *)self setCachedDocumentation:0];
    }
  }
  id v11 = [(SUBDocumentationFetcher *)self _documentationQuery];
  [v11 returnTypes:2];
  id v12 = [v11 queryMetaDataSync];
  if (v12)
  {
    id v13 = v12;
    id v14 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v35 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : Failed to query for documenation assets when purging: %{public}ld", buf, 0xCu);
    }
    v7[2](v7);
  }
  else
  {
    v28 = v11;
    v15 = [v11 results];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v30;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v21 = [v20 attributes];
          uint64_t v22 = [v21 objectForKey:@"SUDocumentationID"];

          if (!v6
            || ([v6 documentationID],
                id v23 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v24 = [v23 isEqualToString:v22],
                v23,
                (v24 & 1) == 0))
          {
            id v25 = (char *)[v20 state];
            if ((unint64_t)(v25 - 2) >= 2)
            {
              if (v25 == (char *)4)
              {
                v27 = softwareupdatebridge_log;
                if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v35 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : canceling documentation asset download: %{public}@", buf, 0xCu);
                }
                [v20 cancelDownload:&stru_10002D3B0];
              }
            }
            else
            {
              id v26 = softwareupdatebridge_log;
              if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v35 = v20;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : Purging documentation asset: %{public}@", buf, 0xCu);
              }
              [v20 purge:&stru_10002D3D0];
            }
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v17);
    }
    v7[2](v7);

    id v11 = v28;
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)cachedDocumentationID
{
  return self->_cachedDocumentationID;
}

- (void)setCachedDocumentationID:(id)a3
{
}

- (SUBDocumentation)cachedDocumentation
{
  return self->_cachedDocumentation;
}

- (void)setCachedDocumentation:(id)a3
{
}

- (NSMutableDictionary)localDocumentationFetchCompletions
{
  return self->_localDocumentationFetchCompletions;
}

- (void)setLocalDocumentationFetchCompletions:(id)a3
{
}

- (NSMutableDictionary)remoteDocumentationFetchCompletions
{
  return self->_remoteDocumentationFetchCompletions;
}

- (void)setRemoteDocumentationFetchCompletions:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_remoteDocumentationFetchCompletions, 0);
  objc_storeStrong((id *)&self->_localDocumentationFetchCompletions, 0);
  objc_storeStrong((id *)&self->_cachedDocumentation, 0);
  objc_storeStrong((id *)&self->_cachedDocumentationID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end