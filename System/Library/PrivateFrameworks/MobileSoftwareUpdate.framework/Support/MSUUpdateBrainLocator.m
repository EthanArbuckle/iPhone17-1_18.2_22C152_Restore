@interface MSUUpdateBrainLocator
+ (id)brainLocatorWithUpdateAttributes:(id)a3;
+ (id)locatorsDictionary;
+ (id)locatorsStateQueue;
+ (id)newBrainAssetName:(id)a3;
+ (id)stateSummary:(id)a3;
- (BOOL)_purgeInstalledUpdateBrains:(id *)a3;
- (BOOL)cancelAllDownloadsExcept:(id)a3 error:(id *)a4;
- (BOOL)cancelInstall:(id *)a3;
- (BOOL)purgeInstalledUpdateBrains:(id *)a3;
- (MAAsset)brainAsset;
- (MSUUpdateBrainLocator)initWithUpdateAssetAttributes:(id)a3;
- (NSDictionary)updateAssetAttributes;
- (NSString)brainVersion;
- (NSString)deviceType;
- (char)copyUpdateBrainPath:(id *)a3;
- (id)newBestAssetFromResults:(id)a3 error:(id *)a4;
- (id)newBrainAsset:(id *)a3;
- (id)newBrainQuery;
- (id)newFilteredBrainQuery;
- (void)_clientRequestBegin:(id)a3;
- (void)_clientRequestComplete:(id)a3 nameForNumber:(id)a4 valueForNumber:(int64_t)a5 withError:(id)a6 handler:(id)a7;
- (void)_clientRequestComplete:(id)a3 reportingState:(id)a4 withError:(id)a5 moreToCome:(BOOL)a6 handler:(id)a7;
- (void)_clientRequestComplete:(id)a3 withError:(id)a4;
- (void)_clientRequestComplete:(id)a3 withError:(id)a4 handler:(id)a5;
- (void)_clientRequestComplete:(id)a3 withError:(id)a4 wasSuccessful:(BOOL)a5;
- (void)adjustDownloadOptions:(id)a3 handler:(id)a4;
- (void)adjustMADownloadOptions:(id)a3 callback:(id)a4;
- (void)appendCatalogDownloadOptionsToExistingOptions:(id)a3;
- (void)createBestAsset:(id)a3;
- (void)dealloc;
- (void)downloadBrainAsset:(id)a3 handler:(id)a4;
- (void)installMAUpdateBrain:(id)a3 handler:(id)a4;
- (void)installUpdateBrain:(id)a3 handler:(id)a4;
- (void)requiredDiskSpace:(id)a3;
- (void)setUpdateAssetAttributes:(id)a3;
@end

@implementation MSUUpdateBrainLocator

+ (id)brainLocatorWithUpdateAttributes:(id)a3
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  uint64_t v18 = 0;
  if (os_variant_allows_internal_security_policies())
  {
    CFPropertyListRef v4 = _MSUPreferencesCopyValue(@"MSUUpdateBrainLocationOverride");
    v5 = v4;
    if (v4)
    {
      CFTypeID v6 = CFGetTypeID(v4);
      if (v6 == CFStringGetTypeID())
      {
        v7 = a3
           ? CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, (CFDictionaryRef)a3)
           : CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        v8 = v7;
        if (v7)
        {
          CFDictionarySetValue(v7, @"__msu_brain-location_key", v5);
          v9 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            CFStringRef v20 = @"MSUUpdateBrainLocationOverride";
            __int16 v21 = 2114;
            CFStringRef v22 = @"com.apple.MobileSoftwareUpdate";
            __int16 v23 = 2114;
            v24 = v5;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] WARNING WARNING WARNING: '%{public}@' default is defined in '%{public}@' domain with path {%{public}@}. Will attempt to use specified custom brain path.", buf, 0x20u);
          }
          a3 = v8;
        }
      }
      CFRelease(v5);
    }
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __58__MSUUpdateBrainLocator_brainLocatorWithUpdateAttributes___block_invoke;
  v12[3] = &unk_100059450;
  v12[4] = a3;
  v12[5] = &v13;
  dispatch_sync((dispatch_queue_t)+[MSUUpdateBrainLocator locatorsStateQueue], v12);
  v10 = (void *)v14[5];
  _Block_object_dispose(&v13, 8);
  return v10;
}

void __58__MSUUpdateBrainLocator_brainLocatorWithUpdateAttributes___block_invoke(uint64_t a1)
{
  v2 = *(NSNull **)(a1 + 32);
  if (!v2) {
    v2 = +[NSNull null];
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(+[MSUUpdateBrainLocator locatorsDictionary](MSUUpdateBrainLocator, "locatorsDictionary"), "objectForKey:", v2);
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [[MSUUpdateBrainLocator alloc] initWithUpdateAssetAttributes:*(void *)(a1 + 32)];
    objc_msgSend(+[MSUUpdateBrainLocator locatorsDictionary](MSUUpdateBrainLocator, "locatorsDictionary"), "setObject:forKey:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
    v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
}

+ (id)locatorsStateQueue
{
  if (locatorsStateQueue_queueOnce != -1) {
    dispatch_once(&locatorsStateQueue_queueOnce, &__block_literal_global_4);
  }
  return (id)locatorsStateQueue_queue;
}

void __43__MSUUpdateBrainLocator_locatorsStateQueue__block_invoke(id a1)
{
  locatorsStateQueue_queue = (uint64_t)dispatch_queue_create("com.apple.mobile.softwareupdate.MSUUpdateBrainLocator", 0);
}

+ (id)locatorsDictionary
{
  if (locatorsDictionary_locatorsOnce != -1) {
    dispatch_once(&locatorsDictionary_locatorsOnce, &__block_literal_global_10);
  }
  return (id)locatorsDictionary_locators;
}

void __43__MSUUpdateBrainLocator_locatorsDictionary__block_invoke(id a1)
{
  locatorsDictionary_locators = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);
}

- (MSUUpdateBrainLocator)initWithUpdateAssetAttributes:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MSUUpdateBrainLocator;
  CFPropertyListRef v4 = [(MSUUpdateBrainLocator *)&v6 init];
  if (v4)
  {
    v4->_updateAssetAttributes = (NSDictionary *)a3;
    v4->_brainAsset = 0;
    v4->_brainVersion = 0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MSUUpdateBrainLocator;
  [(MSUUpdateBrainLocator *)&v3 dealloc];
}

- (NSString)deviceType
{
  v2 = (void *)MGCopyAnswer();
  return (NSString *)v2;
}

- (char)copyUpdateBrainPath:(id *)a3
{
  v26 = 0;
  [(MSUUpdateBrainLocator *)self _clientRequestBegin:@"copyUpdateBrainPath"];
  if ([(MSUUpdateBrainLocator *)self updateAssetAttributes]
    && (v5 = -[NSDictionary objectForKey:](-[MSUUpdateBrainLocator updateAssetAttributes](self, "updateAssetAttributes"), "objectForKey:", @"__msu_brain-location_key")) != 0&& (objc_super v6 = v5, [v5 UTF8String]))
  {
    v7 = strdup((const char *)[v6 UTF8String]);
    v8 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v28 = @"copyUpdateBrainPath";
      __int16 v29 = 2082;
      uint64_t v30 = (uint64_t)v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {%{public}@} | Using provided local brain location at: %{public}s", buf, 0x16u);
    }
    v9 = 0;
    id v10 = 0;
  }
  else
  {
    id v10 = [(MSUUpdateBrainLocator *)self newFilteredBrainQuery];
    [v10 returnTypes:1];
    [v10 setDoNotBlockOnNetworkStatus:1];
    v11 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v28 = @"copyUpdateBrainPath";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {%{public}@} | queryMetaDataSync...", buf, 0xCu);
    }
    if ([v10 queryMetaDataSync])
    {
      char v12 = MAStringForMAQueryResult();
      CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 35, 0, 0, @"Failed to query for update brain asset, result:%@", v13, v14, v15, v12);
      v26 = (id)CFMakeCollectable(error_internal_cf);
      if (os_log_type_enabled((os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
      {
        -[MSUUpdateBrainLocator copyUpdateBrainPath:]();
      }
    }
    else
    {
      v17 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = MAStringForMAQueryResult();
        *(_DWORD *)buf = 138543618;
        CFStringRef v28 = @"copyUpdateBrainPath";
        __int16 v29 = 2114;
        uint64_t v30 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {%{public}@} | ...queryMetaDataSync | SUCCESS | MAQueryResult:%{public}@", buf, 0x16u);
      }
      id v19 = -[MSUUpdateBrainLocator newBestAssetFromResults:error:](self, "newBestAssetFromResults:error:", [v10 results], &v26);
      if (v19)
      {
        v9 = v19;
        v7 = strdup((const char *)objc_msgSend(objc_msgSend(objc_msgSend(v19, "getLocalUrl"), "path"), "UTF8String"));
        goto LABEL_17;
      }
      if (!v26)
      {
        CFErrorRef v24 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 35, 0, 0, @"Could not find best update brain asset from results", v20, v21, v22, v25);
        v7 = 0;
        v9 = 0;
        v26 = (id)CFMakeCollectable(v24);
        goto LABEL_17;
      }
    }
    v7 = 0;
    v9 = 0;
  }
LABEL_17:

  [(MSUUpdateBrainLocator *)self _clientRequestComplete:@"copyUpdateBrainPath" withError:v26 wasSuccessful:v7 != 0];
  if (a3 && v26) {
    *a3 = v26;
  }
  return v7;
}

- (id)newFilteredBrainQuery
{
  objc_super v3 = +[NSNull null];
  CFPropertyListRef v4 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v10 = 20;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {newFilteredBrainQuery} | Using standard _CompatibilityVersion=%d", buf, 8u);
  }
  id v5 = +[NSString stringWithFormat:@"%d", 20];
  id v6 = objc_alloc((Class)MAAssetQuery);
  id v7 = [v6 initWithType:MSUBrainAssetType[0]];
  [v7 addKeyValuePair:ASAttributeCompatibilityVersion with:v5];
  objc_msgSend(v7, "addKeyValueArray:with:", MSUBrainAttributeSupportedDevicesKey, +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v3, -[MSUUpdateBrainLocator deviceType](self, "deviceType"), 0));
  return v7;
}

- (id)newBestAssetFromResults:(id)a3 error:(id *)a4
{
  id v7 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v43 = [a3 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {newBestAssetFromResults} | starting with: %lu query results", buf, 0xCu);
  }
  if (!a3 || ![a3 count])
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 803, 0, 0, @"Query resulted in no update brain assets", v8, v9, v10, v33);
    __int16 v29 = (id)CFMakeCollectable(error_internal_cf);
    v31 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {newBestAssetFromResults} | Nil array or zero assets from brain query, aborting", buf, 2u);
    }
    goto LABEL_18;
  }
  id v11 = [a3 sortedArrayUsingComparator:&__block_literal_global_37];
  id v12 = objc_msgSend(objc_msgSend(v11, "lastObject"), "attributes");
  id v13 = [v12 objectForKey:ASAttributeContentVersion];
  id v14 = objc_msgSend(objc_msgSend(v11, "lastObject"), "attributes");
  id v15 = [v14 objectForKey:ASAttributeMasteredVersion];
  id v16 = +[NSMutableArray array];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = __55__MSUUpdateBrainLocator_newBestAssetFromResults_error___block_invoke_42;
  v39[3] = &unk_1000594F8;
  v39[4] = v13;
  v39[5] = v15;
  v39[6] = v16;
  [v11 enumerateObjectsUsingBlock:v39];
  id v17 = +[NSMutableArray array];
  id v18 = +[NSMutableArray array];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = __55__MSUUpdateBrainLocator_newBestAssetFromResults_error___block_invoke_2;
  v38[3] = &unk_1000594F8;
  v38[4] = v17;
  v38[5] = self;
  v38[6] = v18;
  [v16 enumerateObjectsUsingBlock:v38];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v40[0] = v17;
  v40[1] = v18;
  id v19 = +[NSArray arrayWithObjects:v40 count:2];
  id v20 = [(NSArray *)v19 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v35;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * (void)v22) sortUsingComparator:&__block_literal_global_46];
        uint64_t v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [(NSArray *)v19 countByEnumeratingWithState:&v34 objects:v41 count:16];
    }
    while (v20);
  }
  if (![v18 count] && (id v18 = v17, !objc_msgSend(v17, "count"))
    || (id v26 = [v18 lastObject], v27 = v26, !v26))
  {
    CFErrorRef v28 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 805, 0, 0, @"No matching update brains found", v23, v24, v25, v33);
    __int16 v29 = (id)CFMakeCollectable(v28);
LABEL_18:
    id v26 = 0;
    if (a4 && v29)
    {
      id v26 = 0;
      *a4 = v29;
    }
  }
  return v26;
}

int64_t __55__MSUUpdateBrainLocator_newBestAssetFromResults_error___block_invoke(id a1, MAAsset *a2, MAAsset *a3)
{
  id v5 = [(MAAsset *)a2 attributes];
  int64_t result = (int64_t)objc_msgSend(objc_msgSend(v5, "objectForKey:", ASAttributeContentVersion), "compare:", objc_msgSend(-[MAAsset attributes](a3, "attributes"), "objectForKey:", ASAttributeContentVersion));
  if (!result)
  {
    id v7 = [(MAAsset *)a2 attributes];
    uint64_t v8 = ASAttributeMasteredVersion;
    if ([v7 objectForKey:ASAttributeMasteredVersion]
      || (int64_t result = (int64_t)objc_msgSend(-[MAAsset attributes](a3, "attributes"), "objectForKey:", v8)) != 0)
    {
      if (objc_msgSend(-[MAAsset attributes](a2, "attributes"), "objectForKey:", v8))
      {
        if (objc_msgSend(-[MAAsset attributes](a3, "attributes"), "objectForKey:", v8))
        {
          id v9 = objc_alloc_init((Class)NSNumberFormatter);
          objc_msgSend(v9, "setFormatterBehavior:", +[NSNumberFormatter defaultFormatterBehavior](NSNumberFormatter, "defaultFormatterBehavior"));
          id v10 = objc_msgSend(v9, "numberFromString:", objc_msgSend(-[MAAsset attributes](a2, "attributes"), "objectForKey:", v8));
          id v11 = objc_msgSend(v9, "numberFromString:", objc_msgSend(-[MAAsset attributes](a3, "attributes"), "objectForKey:", v8));
          return (int64_t)[v10 compare:v11];
        }
        else
        {
          return 1;
        }
      }
      else
      {
        return -1;
      }
    }
  }
  return result;
}

id __55__MSUUpdateBrainLocator_newBestAssetFromResults_error___block_invoke_42(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 attributes];
  id result = objc_msgSend(objc_msgSend(v7, "objectForKey:", ASAttributeContentVersion), "isEqualToNumber:", *(void *)(a1 + 32));
  if (result)
  {
    if (!*(void *)(a1 + 40)
      || (id v9 = [a2 attributes],
          id result = objc_msgSend(objc_msgSend(v9, "objectForKey:", ASAttributeMasteredVersion), "isEqualToString:", *(void *)(a1 + 40)), result))
    {
      id result = [*(id *)(a1 + 48) addObject:a2];
    }
  }
  *a4 = 0;
  return result;
}

id __55__MSUUpdateBrainLocator_newBestAssetFromResults_error___block_invoke_2(id *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 attributes];
  if (![v7 objectForKey:MSUBrainAttributeSupportedDevicesKey])
  {
    id v10 = a1 + 4;
    goto LABEL_5;
  }
  id v8 = [a2 attributes];
  id result = objc_msgSend(objc_msgSend(v8, "objectForKey:", MSUBrainAttributeSupportedDevicesKey), "containsObject:", objc_msgSend(a1[5], "deviceType"));
  if (result)
  {
    id v10 = a1 + 6;
LABEL_5:
    id result = [*v10 addObject:a2];
  }
  *a4 = 0;
  return result;
}

int64_t __55__MSUUpdateBrainLocator_newBestAssetFromResults_error___block_invoke_3(id a1, MAAsset *a2, MAAsset *a3)
{
  CFPropertyListRef v4 = +[NSNumber numberWithInt:dword_100040B68[(void)[(MAAsset *)a2 state]]];
  id v5 = +[NSNumber numberWithInt:dword_100040B68[(void)[(MAAsset *)a3 state]]];
  return [(NSNumber *)v4 compare:v5];
}

- (void)installUpdateBrain:(id)a3 handler:(id)a4
{
}

- (void)installMAUpdateBrain:(id)a3 handler:(id)a4
{
  [(MSUUpdateBrainLocator *)self _clientRequestBegin:@"installMAUpdateBrain"];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke;
  v7[3] = &unk_1000595E0;
  v7[4] = self;
  v7[5] = @"installMAUpdateBrain";
  v7[6] = a3;
  v7[7] = a4;
  [(MSUUpdateBrainLocator *)self downloadBrainAsset:a3 handler:v7];
}

void __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = +[MSUUpdateBrainLocator locatorsStateQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_2;
  v8[3] = &unk_1000595B8;
  v8[4] = a3;
  v8[5] = a2;
  long long v7 = *(_OWORD *)(a1 + 48);
  long long v9 = *(_OWORD *)(a1 + 32);
  long long v10 = v7;
  dispatch_sync(v6, v8);
}

id __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(void *)(a1 + 32))
  {
LABEL_2:
    long long v9 = *(void **)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    return objc_msgSend(v9, "_clientRequestComplete:reportingState:withError:moreToCome:handler:", v10, 0);
  }
  if (!*(void *)(a1 + 40))
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 806, 0, 0, @"Unable to download update brain asset", a6, a7, a8, v36);
    (id)CFMakeCollectable(error_internal_cf);
    goto LABEL_2;
  }
  id v12 = +[MSUUpdateBrainLocator newBrainAssetName:](MSUUpdateBrainLocator, "newBrainAssetName:");
  [*(id *)(a1 + 40) logAsset];

  *(void *)(*(void *)(a1 + 48) + 8) = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "attributes"), "objectForKeyedSubscript:", @"Build"), "copy");
  if ([*(id *)(a1 + 40) state] == (id)2)
  {
    *(void *)(*(void *)(a1 + 48) + 24) = 0;
    id v13 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      uint64_t v47 = v14;
      __int16 v48 = 2114;
      id v49 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[BRAIN LOCATOR] {%{public}@} | No need to download %{public}@ - it is already installed", buf, 0x16u);
    }

    return [*(id *)(a1 + 48) _clientRequestComplete:*(void *)(a1 + 56) reportingState:0 withError:0 moreToCome:0 handler:*(void *)(a1 + 72)];
  }
  else
  {
    *(void *)(*(void *)(a1 + 48) + 24) = *(id *)(a1 + 40);
    id v16 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 56);
      id v18 = *(void **)(*(void *)(a1 + 48) + 8);
      *(_DWORD *)buf = 138543874;
      uint64_t v47 = v17;
      __int16 v48 = 2114;
      id v49 = v18;
      __int16 v50 = 2114;
      id v51 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {%{public}@} | We have found a brain (%{public}@) we need to download %{public}@, we will commit self-destruction", buf, 0x20u);
    }
    CFStringRef v44 = @"CommitSelfDestruct";
    v45 = &__kCFBooleanTrue;
    id v19 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    id v43 = 0;
    id v20 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {%{public}@} | Attempting purge of old assets", buf, 0xCu);
    }
    unsigned int v22 = [*(id *)(a1 + 48) _purgeInstalledUpdateBrains:&v43];
    uint64_t v23 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    uint64_t v24 = v23;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138543362;
        uint64_t v47 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {%{public}@} | SUCCESS | old assets purged", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_2_cold_1();
    }
    id v26 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {%{public}@} | Attempting to cancel other downloads", buf, 0xCu);
    }
    if (([*(id *)(a1 + 48) cancelAllDownloadsExcept:*(void *)(a1 + 40) error:&v43] & 1) == 0)
    {
      CFErrorRef v28 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138543618;
        uint64_t v47 = v29;
        __int16 v48 = 2114;
        id v49 = v43;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {%{public}@} | Cancel failed, error:%{public}@", buf, 0x16u);
      }
    }
    uint64_t v30 = *(void **)(a1 + 40);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_64;
    v42[3] = &unk_100059540;
    v42[4] = *(void *)(a1 + 56);
    [v30 attachProgressCallBack:v42];
    v31 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      uint64_t v47 = v32;
      __int16 v48 = 2114;
      id v49 = v12;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {%{public}@} | %{public}@ | startDownload...", buf, 0x16u);
    }
    char v33 = *(void **)(a1 + 40);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_72;
    v37[3] = &unk_100059590;
    long long v38 = *(_OWORD *)(a1 + 48);
    uint64_t v34 = *(void *)(a1 + 64);
    uint64_t v35 = *(void *)(a1 + 72);
    v40 = v19;
    uint64_t v41 = v35;
    id v39 = v12;
    return [v33 startDownload:v34 then:v37];
  }
}

void __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_64(uint64_t a1, void *a2)
{
  CFPropertyListRef v4 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [a2 totalWritten];
    id v7 = [a2 totalExpected];
    unsigned int v8 = [a2 isStalled];
    CFStringRef v9 = @"NO";
    int v10 = 138544130;
    uint64_t v11 = v5;
    __int16 v12 = 2048;
    if (v8) {
      CFStringRef v9 = @"YES";
    }
    id v13 = v6;
    __int16 v14 = 2048;
    id v15 = v7;
    __int16 v16 = 2114;
    CFStringRef v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {%{public}@} | Brain download progress: written:%lld, expected:%lld, stalled:%{public}@", (uint8_t *)&v10, 0x2Au);
  }
}

void __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_72(uint64_t a1, uint64_t a2)
{
  CFPropertyListRef v4 = +[MSUUpdateBrainLocator locatorsStateQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_2_73;
  v6[3] = &unk_100059568;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = a2;
  long long v5 = *(_OWORD *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 32);
  long long v8 = v5;
  dispatch_sync(v4, v6);
}

void __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_2_73(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = 0;
  uint64_t v2 = *(void *)(a1 + 72);
  if (v2) {
    BOOL v3 = v2 == 10;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    CFPropertyListRef v4 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v5;
      __int16 v21 = 2114;
      uint64_t v22 = v6;
      __int16 v23 = 2114;
      uint64_t v24 = MAStringForMADownloadResult();
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {%{public}@} | %{public}@ | ...startDownload | SUCCESS | MADownLoadResult:%{public}@", buf, 0x20u);
    }
    long long v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    CFTypeRef v11 = 0;
  }
  else
  {
    char v12 = MAStringForMADownloadResult();
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 806, 0, 0, @"Failed to download update brain asset, MADownLoadResult:%@", v13, v14, v15, v12);
    CFTypeRef v17 = (id)CFMakeCollectable(error_internal_cf);
    if (os_log_type_enabled((os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
    {
      __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_2_73_cold_1();
    }
    long long v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 64);
    uint64_t v9 = 0;
    CFTypeRef v11 = v17;
  }
  [v7 _clientRequestComplete:v8 reportingState:v9 withError:v11 moreToCome:0 handler:v10];
}

- (void)adjustMADownloadOptions:(id)a3 callback:(id)a4
{
  [(MSUUpdateBrainLocator *)self _clientRequestBegin:@"adjustMADownloadOptions"];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __58__MSUUpdateBrainLocator_adjustMADownloadOptions_callback___block_invoke;
  v7[3] = &unk_100059608;
  v7[4] = self;
  v7[5] = @"adjustMADownloadOptions";
  v7[6] = a3;
  v7[7] = a4;
  dispatch_sync((dispatch_queue_t)+[MSUUpdateBrainLocator locatorsStateQueue], v7);
}

id __58__MSUUpdateBrainLocator_adjustMADownloadOptions_callback___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) brainAsset])
  {
    if ((objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "brainAsset"), "refreshState") & 1) == 0)
    {
      uint64_t v5 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __58__MSUUpdateBrainLocator_adjustMADownloadOptions_callback___block_invoke_cold_2(a1, v5);
      }
    }
    id v6 = +[MSUUpdateBrainLocator newBrainAssetName:](MSUUpdateBrainLocator, "newBrainAssetName:", [*(id *)(a1 + 32) brainAsset]);
    if (objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "brainAsset"), "state") == (id)4)
    {
      uint64_t v10 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v33 = v11;
        __int16 v34 = 2114;
        id v35 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {%{public}@} | %{public}@ | configDownloadSync...", buf, 0x16u);
      }
      if (objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "brainAsset"), "configDownloadSync:", *(void *)(a1 + 48)))
      {
        char v12 = MAStringForMAOperationResult();
        CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 808, 0, 0, @"Failed to adjust download configuration, MAOperationResult:%@", v13, v14, v15, v12);
        CFTypeRef v17 = (id)CFMakeCollectable(error_internal_cf);
        id v18 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = *(void *)(a1 + 40);
          uint64_t v20 = MAStringForMAOperationResult();
          *(_DWORD *)buf = 138543874;
          uint64_t v33 = v19;
          __int16 v34 = 2114;
          id v35 = v6;
          __int16 v36 = 2114;
          uint64_t v37 = v20;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {%{public}@} | %{public}@ | ...configDownloadSync | FAILURE | MAOperationResult:%{public}@", buf, 0x20u);
        }
      }
      else
      {
        CFErrorRef v28 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = *(void *)(a1 + 40);
          uint64_t v30 = MAStringForMAOperationResult();
          *(_DWORD *)buf = 138543874;
          uint64_t v33 = v29;
          __int16 v34 = 2114;
          id v35 = v6;
          __int16 v36 = 2114;
          uint64_t v37 = v30;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {%{public}@} | %{public}@ | ...configDownloadSync | SUCCESS | MAOperationResult:%{public}@", buf, 0x20u);
        }
        CFTypeRef v17 = 0;
      }
    }
    else
    {
      CFErrorRef v27 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 809, 0, 0, @"Not adjusting configuration since asset is not in downloading state", v7, v8, v9, v31);
      CFTypeRef v17 = (id)CFMakeCollectable(v27);
      if (os_log_type_enabled((os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
      {
        __58__MSUUpdateBrainLocator_adjustMADownloadOptions_callback___block_invoke_cold_1();
      }
    }

    return [*(id *)(a1 + 32) _clientRequestComplete:*(void *)(a1 + 40) withError:v17 handler:*(void *)(a1 + 56)];
  }
  else
  {
    CFErrorRef v21 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 807, 0, 0, @"Attempted to change download priority of a nil asset", v2, v3, v4, v31);
    CFTypeRef v22 = (id)CFMakeCollectable(v21);
    __int16 v23 = *(void **)(a1 + 32);
    uint64_t v24 = *(void *)(a1 + 40);
    uint64_t v25 = *(void *)(a1 + 56);
    return [v23 _clientRequestComplete:v24 withError:v22 handler:v25];
  }
}

- (void)adjustDownloadOptions:(id)a3 handler:(id)a4
{
  id v6 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = [a3 safeSummary];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {adjustDownloadOptions} | Ignored options are: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  (*((void (**)(id, void))a4 + 2))(a4, 0);
}

- (BOOL)cancelInstall:(id *)a3
{
  CFErrorRef v28 = 0;
  [(MSUUpdateBrainLocator *)self _clientRequestBegin:@"cancelInstall"];
  id v8 = [(MSUUpdateBrainLocator *)self newBrainAsset:&v28];
  if (!v8)
  {
    if (v28)
    {
      BOOL v18 = 0;
      id v9 = 0;
    }
    else
    {
      CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 807, 0, 0, @"Could not locate any available update brain asset", v5, v6, v7, v27);
      BOOL v18 = 0;
      id v9 = 0;
      CFErrorRef v28 = (id)CFMakeCollectable(error_internal_cf);
    }
    goto LABEL_18;
  }
  id v9 = +[MSUUpdateBrainLocator newBrainAssetName:v8];
  id v10 = [v8 state];
  uint64_t v11 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10 != (id)4)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v30 = @"cancelInstall";
      __int16 v31 = 2114;
      id v32 = v9;
      uint64_t v19 = "[BRAIN_LOCATOR] {%{public}@} | Skipping cancel as %{public}@ is not downloading";
      uint64_t v20 = v11;
      uint32_t v21 = 22;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    }
LABEL_17:
    BOOL v18 = 1;
    goto LABEL_18;
  }
  if (v12)
  {
    *(_DWORD *)buf = 138543618;
    CFStringRef v30 = @"cancelInstall";
    __int16 v31 = 2114;
    id v32 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {%{public}@} | %{public}@ | cancelDownloadSync...", buf, 0x16u);
  }
  if (![v8 cancelDownloadSync])
  {
    __int16 v23 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = MAStringForMACancelDownloadResult();
      *(_DWORD *)buf = 138543874;
      CFStringRef v30 = @"cancelInstall";
      __int16 v31 = 2114;
      id v32 = v9;
      __int16 v33 = 2114;
      uint64_t v34 = v24;
      uint64_t v19 = "[BRAIN_LOCATOR] {%{public}@} | %{public}@ | ...cancelDownloadSync | SUCCESS | MACancelDownloadResult:%{public}@";
      uint64_t v20 = v23;
      uint32_t v21 = 32;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  MAStringForMACancelDownloadResult();
  CFErrorRef v16 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 810, 0, 0, @"Could not cancel update brain download on %@, MACancelDownloadResult:%@", v13, v14, v15, (char)v8);
  CFErrorRef v28 = (id)CFMakeCollectable(v16);
  CFTypeRef v17 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v26 = MAStringForMACancelDownloadResult();
    *(_DWORD *)buf = 138544130;
    CFStringRef v30 = @"cancelInstall";
    __int16 v31 = 2114;
    id v32 = v9;
    __int16 v33 = 2114;
    uint64_t v34 = v26;
    __int16 v35 = 2114;
    __int16 v36 = v28;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[BRAIN_LOCATOR] {%{public}@} | %{public}@ | ...cancelDownloadSync | FAILURE | MACancelDownloadResult:%{public}@, error:%{public}@", buf, 0x2Au);
  }
  BOOL v18 = 0;
LABEL_18:

  [(MSUUpdateBrainLocator *)self _clientRequestComplete:@"cancelInstall" withError:v28 wasSuccessful:v18];
  if (a3 && v28) {
    *a3 = v28;
  }
  return v18;
}

- (void)createBestAsset:(id)a3
{
  CFTypeRef v16 = 0;
  id v5 = [(MSUUpdateBrainLocator *)self newFilteredBrainQuery];
  [v5 returnTypes:0];
  uint64_t v6 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {createBestAsset} | queryMetaDataSync...", buf, 2u);
  }
  if ([v5 queryMetaDataSync])
  {
    char v7 = MAStringForMAQueryResult();
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 811, 0, 0, @"Failed to query for assets, MAQueryResult:%@", v8, v9, v10, v7);
    CFTypeRef v12 = (id)CFMakeCollectable(error_internal_cf);
    CFTypeRef v16 = v12;
    if (os_log_type_enabled((os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
    {
      -[MSUUpdateBrainLocator createBestAsset:]();
    }
    (*((void (**)(id, void, CFTypeRef))a3 + 2))(a3, 0, v12);
  }
  else
  {
    uint64_t v13 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = MAStringForMAQueryResult();
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {createBestAsset} | ...queryMetaDataSync | SUCCESS | MAQueryResult:%{public}@", buf, 0xCu);
    }
    id v15 = -[MSUUpdateBrainLocator newBestAssetFromResults:error:](self, "newBestAssetFromResults:error:", [v5 results], &v16);
    (*((void (**)(id, id, void))a3 + 2))(a3, v15, 0);
  }
}

- (void)appendCatalogDownloadOptionsToExistingOptions:(id)a3
{
  if (a3)
  {
    id v5 = objc_opt_new();
    uint64_t v6 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v11 = 20;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {appendCatalogDownloadOptionsToExistingOptions} | Using standard _CompatibilityVersion=%d", buf, 8u);
    }
    [v5 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d", 20), @"CompatibilityVersion" forKey];
    id v7 = [(NSDictionary *)[(MSUUpdateBrainLocator *)self updateAssetAttributes] objectForKey:@"Build"];
    if (v7)
    {
      id v8 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v5 setObject:v8 forKey:@"TargetBuildVersion"];
      }
    }
    [a3 setAdditionalServerParams:v5];
  }
  else
  {
    uint64_t v9 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MSUUpdateBrainLocator appendCatalogDownloadOptionsToExistingOptions:](v9);
    }
  }
}

- (void)downloadBrainAsset:(id)a3 handler:(id)a4
{
  if (a3)
  {
    id v7 = a3;
    id v8 = a3;
  }
  else
  {
    id v8 = objc_opt_new();
    [v8 setDiscretionary:0];
  }
  [(MSUUpdateBrainLocator *)self appendCatalogDownloadOptionsToExistingOptions:v8];
  uint64_t v9 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"client provided";
    if (!a3) {
      CFStringRef v10 = @"default";
    }
    *(_DWORD *)buf = 138543618;
    CFStringRef v14 = v10;
    __int16 v15 = 2114;
    CFTypeRef v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {downloadBrainAsset} | Using %{public}@ downloadOptions for brainAssetDownload, options:%{public}@", buf, 0x16u);
  }
  int v11 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {downloadBrainAsset} | startCatalogDownload...", buf, 2u);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __52__MSUUpdateBrainLocator_downloadBrainAsset_handler___block_invoke;
  v12[3] = &unk_100059630;
  v12[5] = v8;
  void v12[6] = a4;
  v12[4] = self;
  +[MAAsset startCatalogDownload:MSUBrainAssetType[0] options:v8 completionWithError:v12];
}

void __52__MSUUpdateBrainLocator_downloadBrainAsset_handler___block_invoke(uint64_t a1, uint64_t a2, const void *a3)
{
  if (a2 != 10 && a2)
  {
    char v6 = MAStringForMADownloadResult();
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 812, a3, 0, @"Failed to download catalog, MADownloadResult:%@", v7, v8, v9, v6);
    (id)CFMakeCollectable(error_internal_cf);
    if (os_log_type_enabled((os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
    {
      __52__MSUUpdateBrainLocator_downloadBrainAsset_handler___block_invoke_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v4 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = MAStringForMADownloadResult();
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {downloadBrainAsset} | ...startCatalogDownload | SUCCESS | MADownLoadResult:%{public}@", buf, 0xCu);
    }
    [*(id *)(a1 + 32) createBestAsset:*(void *)(a1 + 48)];
  }
}

- (id)newBrainAsset:(id *)a3
{
  id v5 = [(MSUUpdateBrainLocator *)self newFilteredBrainQuery];
  unint64_t v38 = 0;
  uint64_t v32 = 0;
  __int16 v33 = &v32;
  uint64_t v34 = 0x3052000000;
  __int16 v35 = __Block_byref_object_copy__3;
  __int16 v36 = __Block_byref_object_dispose__3;
  dispatch_semaphore_t v37 = 0;
  dispatch_semaphore_t v37 = dispatch_semaphore_create(0);
  uint64_t v26 = 0;
  char v27 = &v26;
  uint64_t v28 = 0x3052000000;
  uint64_t v29 = __Block_byref_object_copy__3;
  CFStringRef v30 = __Block_byref_object_dispose__3;
  uint64_t v31 = 0;
  char v6 = objc_opt_new();
  [(MSUUpdateBrainLocator *)self appendCatalogDownloadOptionsToExistingOptions:v6];
  [v6 setDiscretionary:0];
  uint64_t v7 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {newBrainAsset} | startCatalogDownload...", buf, 2u);
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __39__MSUUpdateBrainLocator_newBrainAsset___block_invoke;
  v24[3] = &unk_100059658;
  v24[4] = v5;
  v24[5] = v6;
  v24[6] = &v26;
  v24[7] = &v32;
  +[MAAsset startCatalogDownload:MSUBrainAssetType[0] options:v6 then:v24];
  uint64_t v8 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {newBrainAsset} | BEGIN WAIT | startCatalogDownload", buf, 2u);
  }
  uint64_t v9 = v33[5];
  dispatch_time_t v10 = dispatch_time(0, 1200000000000);
  dispatch_semaphore_wait(v9, v10);
  int v11 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {newBrainAsset} | END WAIT | startCatalogDownload", buf, 2u);
  }
  dispatch_release((dispatch_object_t)v33[5]);

  uint64_t v15 = v27[5];
  if (!v15)
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 803, 0, 0, @"Could not get assets of type %@", v12, v13, v14, (char)MSUBrainAssetType[0]);
    uint64_t v20 = (id)CFMakeCollectable(error_internal_cf);
    goto LABEL_11;
  }
  unint64_t v16 = [(MSUUpdateBrainLocator *)self newBestAssetFromResults:v15 error:&v38];

  uint64_t v20 = (void *)v38;
  if (!(v16 | v38))
  {
    CFErrorRef v21 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 805, 0, 0, @"Could not determine best update brain asset of type %@", v17, v18, v19, (char)MSUBrainAssetType[0]);
    uint64_t v20 = (id)CFMakeCollectable(v21);
LABEL_11:
    unint64_t v16 = 0;
    unint64_t v38 = (unint64_t)v20;
  }
  if (a3 && v20) {
    *a3 = v20;
  }
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  return (id)v16;
}

intptr_t __39__MSUUpdateBrainLocator_newBrainAsset___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 != 10 && a2)
  {
    if (os_log_type_enabled((os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
    {
      __39__MSUUpdateBrainLocator_newBrainAsset___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v3 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      uint64_t v10 = MAStringForMADownloadResult();
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {newBrainAsset} | ...startCatalogDownload | SUCCESS | MADownLoadResult:%{public}@", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v4 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {newBrainAsset} | queryMetaDataSync...", (uint8_t *)&v9, 2u);
    }
    id v5 = [*(id *)(a1 + 32) queryMetaDataSync];
    char v6 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    uint64_t v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __39__MSUUpdateBrainLocator_newBrainAsset___block_invoke_cold_2();
      }
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {newBrainAsset} | ...queryMetaDataSync | SUCCESS", (uint8_t *)&v9, 2u);
      }
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) results];
    }
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
}

- (id)newBrainQuery
{
  id v2 = objc_alloc((Class)MAAssetQuery);
  uint64_t v3 = MSUBrainAssetType[0];
  return [v2 initWithType:v3];
}

- (BOOL)purgeInstalledUpdateBrains:(id *)a3
{
  uint64_t v7 = 0;
  [(MSUUpdateBrainLocator *)self _clientRequestBegin:@"purgeInstalledUpdateBrains"];
  BOOL v5 = [(MSUUpdateBrainLocator *)self _purgeInstalledUpdateBrains:&v7];
  [(MSUUpdateBrainLocator *)self _clientRequestComplete:@"purgeInstalledUpdateBrains" withError:v7 wasSuccessful:v5];
  if (a3 && v7) {
    *a3 = v7;
  }
  return v5;
}

- (BOOL)_purgeInstalledUpdateBrains:(id *)a3
{
  id v4 = [(MSUUpdateBrainLocator *)self newBrainQuery];
  [v4 returnTypes:1];
  [v4 setDoNotBlockOnNetworkStatus:1];
  BOOL v5 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v42 = @"purgeInstalledUpdateBrains";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {%{public}@} | queryMetaDataSync...", buf, 0xCu);
  }
  if ([v4 queryMetaDataSync])
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 811, 0, 0, @"Failed to query for installed update brains", v6, v7, v8, v32);
    uint64_t v10 = (id)CFMakeCollectable(error_internal_cf);
    if (os_log_type_enabled((os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
    {
      -[MSUUpdateBrainLocator _purgeInstalledUpdateBrains:]();
    }
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v34 = a3;
    id v12 = [v4 results];
    uint64_t v13 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = MAStringForMAQueryResult();
      *(_DWORD *)buf = 138543618;
      CFStringRef v42 = @"purgeInstalledUpdateBrains";
      __int16 v43 = 2114;
      uint64_t v44 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {%{public}@} | ...queryMetaDataSync | SUCCESS | MAQueryResult:%{public}@", buf, 0x16u);
    }
    id v33 = v4;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v15 = [v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v15)
    {
      id v16 = v15;
      CFTypeRef v35 = 0;
      uint64_t v17 = *(void *)v37;
      char v18 = 1;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v37 != v17) {
            objc_enumerationMutation(v12);
          }
          uint64_t v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          CFErrorRef v21 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            CFStringRef v42 = @"purgeInstalledUpdateBrains";
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {%{public}@} | purgeSync...", buf, 0xCu);
          }
          if ([v20 purgeSync])
          {
            if (v18)
            {
              char v22 = MAStringForMAPurgeResult();
              CFErrorRef v26 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 813, 0, 0, @"Failed to purge update brain asset: %@", v23, v24, v25, v22);
              CFTypeRef v35 = (id)CFMakeCollectable(v26);
              char v18 = 0;
            }
            char v27 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              uint64_t v28 = MAStringForMAPurgeResult();
              *(_DWORD *)buf = 138543618;
              CFStringRef v42 = @"purgeInstalledUpdateBrains";
              __int16 v43 = 2114;
              uint64_t v44 = v28;
              _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "[BRAIN_LOCATOR] {%{public}@} | ...purgeSync | FAILURE | MAPurgeResult:%{public}@", buf, 0x16u);
            }
          }
          else
          {
            uint64_t v29 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v30 = MAStringForMAPurgeResult();
              *(_DWORD *)buf = 138543618;
              CFStringRef v42 = @"purgeInstalledUpdateBrains";
              __int16 v43 = 2114;
              uint64_t v44 = v30;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {%{public}@} | ...purgeSync | SUCCESS | MAPurgeResult:%{public}@", buf, 0x16u);
            }
          }
        }
        id v16 = [v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v16);
    }
    else
    {
      CFTypeRef v35 = 0;
      char v18 = 1;
    }
    BOOL v11 = v18 & 1;
    id v4 = v33;
    a3 = v34;
    uint64_t v10 = (void *)v35;
  }

  if (a3 && v10) {
    *a3 = v10;
  }
  return v11;
}

- (void)requiredDiskSpace:(id)a3
{
  [(MSUUpdateBrainLocator *)self _clientRequestBegin:@"requiredDiskSpace"];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __43__MSUUpdateBrainLocator_requiredDiskSpace___block_invoke;
  v5[3] = &unk_100059680;
  v5[4] = self;
  v5[5] = @"requiredDiskSpace";
  v5[6] = a3;
  [(MSUUpdateBrainLocator *)self downloadBrainAsset:0 handler:v5];
}

id __43__MSUUpdateBrainLocator_requiredDiskSpace___block_invoke(void *a1, void *a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFTypeRef v8 = a3;
  if (!a2 || a3)
  {
    if (!a3)
    {
      CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 806, 0, 0, @"Failed to download update brain asset", 0, a7, a8, v27);
      CFTypeRef v8 = (id)CFMakeCollectable(error_internal_cf);
    }
    BOOL v11 = (void *)a1[4];
    uint64_t v12 = a1[5];
    uint64_t v13 = a1[6];
    CFStringRef v14 = 0;
    goto LABEL_8;
  }
  if ([a2 state] == (id)2)
  {
    BOOL v11 = (void *)a1[4];
    uint64_t v12 = a1[5];
    uint64_t v13 = a1[6];
    CFStringRef v14 = @"requiredSpace";
    CFTypeRef v8 = 0;
LABEL_8:
    return [v11 _clientRequestComplete:v12 nameForNumber:v14 valueForNumber:0 withError:v8 handler:v13];
  }
  uint64_t v28 = 0;
  if ([a2 spaceCheck:&v28])
  {
    uint64_t v20 = (void *)a1[4];
    uint64_t v21 = a1[5];
    uint64_t v22 = v28;
    uint64_t v23 = a1[6];
    CFStringRef v24 = @"requiredSpace";
    CFTypeRef v25 = 0;
  }
  else
  {
    CFErrorRef v26 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 814, 0, 0, @"Could not determine disk space requirements for update brain asset", v17, v18, v19, v27);
    CFTypeRef v25 = (id)CFMakeCollectable(v26);
    uint64_t v20 = (void *)a1[4];
    uint64_t v21 = a1[5];
    uint64_t v23 = a1[6];
    CFStringRef v24 = 0;
    uint64_t v22 = 0;
  }
  return [v20 _clientRequestComplete:v21 nameForNumber:v24 valueForNumber:v22 withError:v25 handler:v23];
}

- (BOOL)cancelAllDownloadsExcept:(id)a3 error:(id *)a4
{
  id v6 = +[MSUUpdateBrainLocator newBrainAssetName:](MSUUpdateBrainLocator, "newBrainAssetName:");
  uint64_t v7 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v46 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {cancelAllDownloadsExcept} | %{public}@", buf, 0xCu);
  }

  id v8 = [(MSUUpdateBrainLocator *)self newBrainQuery];
  [v8 returnTypes:0];
  long long v37 = v8;
  if ([v8 queryMetaDataSync])
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 811, 0, 0, @"Failed to query for update brains", v9, v10, v11, v36);
    v40 = (id)CFMakeCollectable(error_internal_cf);
    BOOL v39 = 0;
    goto LABEL_28;
  }
  id v13 = [v8 results];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (!v14)
  {
    v40 = 0;
    BOOL v39 = 1;
    goto LABEL_28;
  }
  id v15 = v14;
  v40 = 0;
  uint64_t v16 = *(void *)v42;
  BOOL v39 = 1;
  do
  {
    uint64_t v17 = 0;
    do
    {
      if (*(void *)v42 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v17);
      id v19 = +[MSUUpdateBrainLocator newBrainAssetName:v18];
      if ((objc_msgSend(objc_msgSend(v18, "assetId"), "isEqualToString:", objc_msgSend(a3, "assetId")) & 1) != 0
        || [v18 state] != (id)4)
      {
        char v27 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_21;
        }
        *(_DWORD *)buf = 138543362;
        id v46 = v19;
        uint64_t v28 = v27;
        uint64_t v29 = "[BRAIN_LOCATOR] {cancelAllDownloadsExcept} | %{public}@ | not canceling";
        uint32_t v30 = 12;
        goto LABEL_20;
      }
      uint64_t v20 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v46 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] {cancelAllDownloadsExcept} | %{public}@ | cancelDownloadSync...", buf, 0xCu);
      }
      if ([v18 cancelDownloadSync])
      {
        char v21 = MAStringForMACancelDownloadResult();
        CFErrorRef v25 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 815, 0, 0, @"Failed to cancel asset download, MACancelDownloadResult:%@", v22, v23, v24, v21);
        v40 = (id)CFMakeCollectable(v25);
        CFErrorRef v26 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          uint64_t v33 = MAStringForMACancelDownloadResult();
          *(_DWORD *)buf = 138543874;
          id v46 = v19;
          __int16 v47 = 2114;
          uint64_t v48 = v33;
          __int16 v49 = 2114;
          __int16 v50 = v40;
          _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[BRAIN_LOCATOR] {cancelAllDownloadsExcept} | %{public}@ | ...cancelDownloadSync | FAILURE | MACancelDownloadResult:%{public}@, error:%{public}@", buf, 0x20u);
        }
        BOOL v39 = 0;
      }
      else
      {
        uint64_t v31 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = MAStringForMACancelDownloadResult();
          *(_DWORD *)buf = 138543618;
          id v46 = v19;
          __int16 v47 = 2114;
          uint64_t v48 = v32;
          uint64_t v28 = v31;
          uint64_t v29 = "[BRAIN_LOCATOR] {cancelAllDownloadsExcept} | %{public}@ | ...cancelDownloadSync | SUCCESS | MACancelDown"
                "loadResult:%{public}@";
          uint32_t v30 = 22;
LABEL_20:
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v29, buf, v30);
        }
      }
LABEL_21:

      uint64_t v17 = (char *)v17 + 1;
    }
    while (v15 != v17);
    id v34 = [v13 countByEnumeratingWithState:&v41 objects:v51 count:16];
    id v15 = v34;
  }
  while (v34);
LABEL_28:

  if (a4 && v40) {
    *a4 = v40;
  }
  return v39;
}

- (void)_clientRequestBegin:(id)a3
{
  id v4 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] | %{public}@ | BEGIN client request", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_clientRequestComplete:(id)a3 withError:(id)a4
{
  id v6 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  uint64_t v7 = v6;
  if (a4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MSUUpdateBrainLocator _clientRequestComplete:withError:]();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] | %{public}@ | END client request | SUCCESS", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_clientRequestComplete:(id)a3 withError:(id)a4 wasSuccessful:(BOOL)a5
{
  BOOL v5 = a5;
  int v8 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  id v9 = v8;
  if (a4)
  {
    BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v10) {
        -[MSUUpdateBrainLocator _clientRequestComplete:withError:wasSuccessful:]();
      }
    }
    else if (v10)
    {
      -[MSUUpdateBrainLocator _clientRequestComplete:withError:]();
    }
  }
  else
  {
    BOOL v11 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v11) {
        return;
      }
      int v13 = 138543362;
      id v14 = a3;
      uint64_t v12 = "[BRAIN_LOCATOR] | %{public}@ | END client request | SUCCESS";
    }
    else
    {
      if (!v11) {
        return;
      }
      int v13 = 138543362;
      id v14 = a3;
      uint64_t v12 = "[BRAIN_LOCATOR] | %{public}@ | END client request | FAILURE | no error provided";
    }
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 0xCu);
  }
}

- (void)_clientRequestComplete:(id)a3 withError:(id)a4 handler:(id)a5
{
  int v8 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  id v9 = v8;
  if (a5)
  {
    if (a4)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MSUUpdateBrainLocator _clientRequestComplete:withError:handler:]();
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] | %{public}@ | END client request (calling completion handler) | SUCCESS", (uint8_t *)&v10, 0xCu);
    }
    (*((void (**)(id, id))a5 + 2))(a5, a4);
  }
  else if (a4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MSUUpdateBrainLocator _clientRequestComplete:withError:handler:]();
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] | %{public}@ | END client request (no completion handler) | SUCCESS", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_clientRequestComplete:(id)a3 reportingState:(id)a4 withError:(id)a5 moreToCome:(BOOL)a6 handler:(id)a7
{
  BOOL v8 = a6;
  uint64_t v12 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  int v13 = v12;
  if (a7)
  {
    if (a5)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[MSUUpdateBrainLocator _clientRequestComplete:withError:handler:]();
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = +[MSUUpdateBrainLocator stateSummary:a4];
      CFStringRef v15 = @"NO";
      int v18 = 138543874;
      id v19 = a3;
      __int16 v20 = 2114;
      if (v8) {
        CFStringRef v15 = @"YES";
      }
      id v21 = v14;
      __int16 v22 = 2114;
      CFStringRef v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] | %{public}@ | END client request (calling completion handler) | SUCCESS | state:%{public}@, moreToCome:%{public}@", (uint8_t *)&v18, 0x20u);
    }
    (*((void (**)(id, id, id, BOOL))a7 + 2))(a7, a4, a5, v8);
  }
  else if (a5)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MSUUpdateBrainLocator _clientRequestComplete:withError:handler:]();
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = +[MSUUpdateBrainLocator stateSummary:a4];
    CFStringRef v17 = @"NO";
    int v18 = 138543874;
    id v19 = a3;
    __int16 v20 = 2114;
    if (v8) {
      CFStringRef v17 = @"YES";
    }
    id v21 = v16;
    __int16 v22 = 2114;
    CFStringRef v23 = v17;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] | %{public}@ | END client request (no completion handler) | SUCCESS | state:%{public}@, moreToCome:%{public}@", (uint8_t *)&v18, 0x20u);
  }
}

- (void)_clientRequestComplete:(id)a3 nameForNumber:(id)a4 valueForNumber:(int64_t)a5 withError:(id)a6 handler:(id)a7
{
  if (a6)
  {
    BOOL v10 = os_log_type_enabled((os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger", a3, a4, a5), "oslog"), OS_LOG_TYPE_ERROR);
    if (a7)
    {
      if (v10) {
        -[MSUUpdateBrainLocator _clientRequestComplete:withError:handler:]();
      }
      id v11 = 0;
LABEL_9:
      (*((void (**)(id, NSNumber *, id))a7 + 2))(a7, v11, a6);
      return;
    }
    if (v10) {
      -[MSUUpdateBrainLocator _clientRequestComplete:withError:handler:]();
    }
  }
  else
  {
    id v11 = +[NSNumber numberWithLongLong:a5];
    id v14 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (a7)
    {
      if (v15)
      {
        int v16 = 138543874;
        id v17 = a3;
        __int16 v18 = 2114;
        id v19 = a4;
        __int16 v20 = 2048;
        int64_t v21 = a5;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] | %{public}@ | END client request (calling completion handler) | SUCCESS | %{public}@=%llu", (uint8_t *)&v16, 0x20u);
      }
      goto LABEL_9;
    }
    if (v15)
    {
      int v16 = 138543874;
      id v17 = a3;
      __int16 v18 = 2114;
      id v19 = a4;
      __int16 v20 = 2048;
      int64_t v21 = a5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOCATOR] | %{public}@ | END client request (no completion handler) | SUCCESS | %{public}@=%lld", (uint8_t *)&v16, 0x20u);
    }
  }
}

+ (id)stateSummary:(id)a3
{
  if (!a3) {
    return @"NONE";
  }
  CFStringRef v4 = @"CommitSelfDestruct";
  if ([a3 objectForKeyedSubscript:@"CommitSelfDestruct"]) {
    return (id)v4;
  }
  return [a3 safeSummary];
}

+ (id)newBrainAssetName:(id)a3
{
  id v4 = objc_alloc((Class)NSString);
  id v5 = [a3 assetId];
  [a3 state];
  return [v4 initWithFormat:@"brainAsset[%@](%@)", v5, MAStringForMAAssetState()];
}

- (NSString)brainVersion
{
  return self->_brainVersion;
}

- (NSDictionary)updateAssetAttributes
{
  return self->_updateAssetAttributes;
}

- (void)setUpdateAssetAttributes:(id)a3
{
}

- (MAAsset)brainAsset
{
  return self->_brainAsset;
}

- (void)copyUpdateBrainPath:.cold.1()
{
  OUTLINED_FUNCTION_6();
  MAStringForMAQueryResult();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "[BRAIN_LOCATOR] {%{public}@} | ...queryMetaDataSync | FAILURE | MAQueryResult:%{public}@, error:%{public}@", v2, v3, v4, v5, 2u);
}

- (void)newBestAssetFromResults:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v0, v1, "[BRAIN_LOCATOR] {newBestAssetFromResults} | FAILURE | Exception %{public}@ occurred while sorting brain asset results=%{public}@");
}

void __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v0, v1, "[BRAIN_LOCATOR] {%{public}@} | FAILURE | Purge failed, error:%{public}@");
}

void __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_2_73_cold_1()
{
  MAStringForMADownloadResult();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "[BRAIN_LOCATOR] {%{public}@} | %{public}@ | ...startDownload | FAILURE | MADownLoadResult:%{public}@", v2, v3, v4, v5, 2u);
}

void __58__MSUUpdateBrainLocator_adjustMADownloadOptions_callback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v0, v1, "[BRAIN_LOCATOR] {%{public}@} | %{public}@ | Not adjusting configuration since asset is not in downloading state");
}

void __58__MSUUpdateBrainLocator_adjustMADownloadOptions_callback___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[BRAIN_LOCATOR] {%{public}@} | Could not determine state of asset while trying to adjust priority, attempting anyway", (uint8_t *)&v3, 0xCu);
}

- (void)createBestAsset:.cold.1()
{
  OUTLINED_FUNCTION_6();
  MAStringForMAQueryResult();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7((void *)&_mh_execute_header, v0, v1, "[BRAIN_LOCATOR] {createBestAsset} | ...queryMetaDataSync | FAILURE | MAQueryResult:%{public}@, error:%{public}@", v2, v3, v4, v5, v6);
}

- (void)appendCatalogDownloadOptionsToExistingOptions:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[BRAIN_LOCATOR] {appendCatalogDownloadOptionsToExistingOptions} | Invalid options argument passed", v1, 2u);
}

void __52__MSUUpdateBrainLocator_downloadBrainAsset_handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  MAStringForMADownloadResult();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7((void *)&_mh_execute_header, v0, v1, "[BRAIN_LOCATOR] {downloadBrainAsset} | ...startCatalogDownload | FAILURE | MADownLoadResult:%{public}@, error:%{public}@", v2, v3, v4, v5, v6);
}

void __39__MSUUpdateBrainLocator_newBrainAsset___block_invoke_cold_1()
{
  MAStringForMADownloadResult();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "[BRAIN_LOCATOR] {newBrainAsset} | ...startCatalogDownload | FAILURE | MADownLoadResult:%{public}@", v2, v3, v4, v5, 2u);
}

void __39__MSUUpdateBrainLocator_newBrainAsset___block_invoke_cold_2()
{
  MAStringForMAQueryResult();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "[BRAIN_LOCATOR] {newBrainAsset} | ...queryMetaDataSync | FAILURE | MAQueryResult:%{public}@", v2, v3, v4, v5, 2u);
}

- (void)_purgeInstalledUpdateBrains:.cold.1()
{
  OUTLINED_FUNCTION_6();
  MAStringForMAQueryResult();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "[BRAIN_LOCATOR] {%{public}@} | ...queryMetaDataSync | FAILURE | MAQueryResult:%{public}@, error:%{public}@", v2, v3, v4, v5, 2u);
}

- (void)_clientRequestComplete:withError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v0, v1, "[BRAIN_LOCATOR] | %{public}@ | END client request | FAILURE | error:%{public}@");
}

- (void)_clientRequestComplete:withError:wasSuccessful:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v0, v1, "[BRAIN_LOCATOR] | %{public}@ | END client request | FAILURE | was successful with error:%{public}@");
}

- (void)_clientRequestComplete:withError:handler:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v0, v1, "[BRAIN_LOCATOR] | {%{public}@} | END client request (no completion handler) | FAILURE | error:%{public}@");
}

- (void)_clientRequestComplete:withError:handler:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v0, v1, "[BRAIN_LOCATOR] | %{public}@ | END client request (calling completion handler) | FAILURE | error:%{public}@");
}

@end