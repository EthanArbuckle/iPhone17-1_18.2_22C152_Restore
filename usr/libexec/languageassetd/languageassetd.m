uint64_t start()
{
  void *v0;

  [+[LanguageAssetLoaderDaemon sharedInstance] run];
  return 0;
}

void sub_10000257C(id a1)
{
  qword_10000C5A8 = objc_alloc_init(LanguageAssetLoaderDaemon);
}

void sub_1000026A8(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string)
  {
    v3 = +[NSString stringWithUTF8String:string];
    CFPreferencesAppSynchronize(@"com.apple.purplebuddy");
    if (CFPreferencesGetAppBooleanValue(@"ForceNoBuddy", @"com.apple.purplebuddy", 0)) {
      BOOL v4 = 0;
    }
    else {
      BOOL v4 = CFPreferencesGetAppBooleanValue(@"SetupDone", @"com.apple.purplebuddy", 0) == 0;
    }
    if (![(NSString *)v3 isEqualToString:@"com.apple.purplebuddy.setupdone"]
      && (![(NSString *)v3 isEqualToString:@"AppleLanguagePreferencesChangedNotification"]
       || v4)
      && (![(NSString *)v3 isEqualToString:@"AppleKeyboardsPreferencesChangedNotification"]
       || v4))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v3;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[_setupXPCEventHandler] needn't handle event: %@", buf, 0xCu);
      }
    }
    else
    {
      [+[LanguageAssetLoader sharedInstance] setIsKeyboardsChanged:[(NSString *)v3 isEqualToString:@"AppleKeyboardsPreferencesChangedNotification"]];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000028CC;
      block[3] = &unk_100008388;
      block[4] = v3;
      if ([(NSString *)v3 isEqualToString:@"com.apple.purplebuddy.setupdone"]) {
        int64_t v5 = 60000000000;
      }
      else {
        int64_t v5 = 1000000000;
      }
      dispatch_time_t v6 = dispatch_time(0, v5);
      dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

id sub_1000028CC(uint64_t a1)
{
  NSLog(@"downloadLanguageAssets: eventString=[%@]", *(void *)(a1 + 32));
  v1 = +[LanguageAssetLoader sharedInstance];

  return [(LanguageAssetLoader *)v1 downloadLanguageAssets];
}

void sub_10000296C(id a1, OS_xpc_object *a2)
{
  xpc_connection_set_event_handler(a2, &stru_1000083C8);

  xpc_connection_resume(a2);
}

void sub_1000029F8(id a1)
{
  qword_10000C5B8 = objc_alloc_init(LanguageAssetLoader);
}

void sub_100002CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100002CC4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSLog(@"Catelog download failed. Error=%ld", a2);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    id v3 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.DictionaryServices.dictionary2"];
    [v3 returnTypes:2];
    [v3 setDoNotBlockBeforeFirstUnlock:1];
    id v4 = [v3 queryMetaDataSync];
    if (v4)
    {
      NSLog(@"Query meta data failed. Error=%ld", v4);
    }
    else
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v5 = [v3 results];
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v14;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(v5);
            }
            v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
            id v11 = [[[v10 attributes] objectForKey:@"DictionaryPackageName"];
            if ([v10 state] == (id)2) {
              NSLog(@"Local asset: %@", v11);
            }
            else {
              NSLog(@"Remote asset: %@", v11);
            }
          }
          id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v7);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

void sub_100002EBC(id a1)
{
  CFDictionaryRef v1 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v1)
  {
    CFStringRef v2 = (const __CFString *)v1;
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v1, _kCFSystemVersionBuildVersionKey);
    if (Value)
    {
      CFStringRef v4 = Value;
      CFRetain(Value);
      CFRelease(v2);
      CFStringRef v5 = (const __CFString *)CFPreferencesCopyAppValue(@"LastSystemVersion", @"com.apple.languageassetd");
      if (v5)
      {
        CFStringRef v6 = v5;
        if (CFStringCompare(v4, v5, 1uLL))
        {
          CFPreferencesSetAppValue(@"AssetDownloadStarted", 0, @"com.apple.languageassetd");
          CFPreferencesSetAppValue(@"LastSystemVersion", v4, @"com.apple.languageassetd");
          CFPreferencesSetAppValue(@"HandledLanguages", 0, @"com.apple.languageassetd");
          CFPreferencesAppSynchronize(@"com.apple.languageassetd");
          ASSetAssetServerURLForAssetType();
        }
        CFRelease(v6);
      }
      else
      {
        CFPreferencesSetAppValue(@"AssetDownloadStarted", 0, @"com.apple.languageassetd");
        CFPreferencesSetAppValue(@"LastSystemVersion", v4, @"com.apple.languageassetd");
        CFPreferencesSetAppValue(@"HandledLanguages", 0, @"com.apple.languageassetd");
        CFPreferencesAppSynchronize(@"com.apple.languageassetd");
        ASSetAssetServerURLForAssetType();
      }
    }
    else
    {
      CFStringRef v4 = v2;
    }
    CFRelease(v4);
  }
}

void sub_1000050EC(uint64_t a1, uint64_t a2)
{
  NSLog(@"startCatalogDownload completed: assetType=[%@] result=%ld", *(void *)(a1 + 32), a2);
  if (a2)
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 24) = 1;
  }
  else if (![*(id *)(a1 + 32) isEqualToString:kFSFontAssetType] {
         || [*(id *)(a1 + 40) checkFontAssetsSanityWithLanguageAssetInfo:*(void *)(a1 + 48)])
  }
  {
    id v4 = [*(id *)(a1 + 40) effectiveAssetFlagArrayForAssetInfo:*(void *)(a1 + 48)];
    if (!*(unsigned char *)(*(void *)(a1 + 40) + 24))
    {
      CFStringRef v5 = v4;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v6 = [v4 countByEnumeratingWithState:&v66 objects:v75 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = 0;
        uint64_t v9 = *(void *)v67;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v67 != v9) {
              objc_enumerationMutation(v5);
            }
            v8 += [[*(id *)(*((void *)&v66 + 1) + 8 * i) objectForKeyedSubscript:@"downloadNeeded"] BOOLValue];
          }
          id v7 = [v5 countByEnumeratingWithState:&v66 objects:v75 count:16];
        }
        while (v7);
      }
      else
      {
        uint64_t v8 = 0;
      }
      id v11 = [[TIInputModeController sharedInputModeController] enabledInputModeIdentifiers];
      v12 = +[NSMutableArray arrayWithCapacity:0];
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v13 = (char *)[v11 countByEnumeratingWithState:&v62 objects:v74 count:16];
      if (v13)
      {
        long long v14 = v13;
        uint64_t v15 = *(void *)v63;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(void *)v63 != v15) {
              objc_enumerationMutation(v11);
            }
            id v17 = [*(id *)(a1 + 40) normalizedLanguage:TIInputModeGetLanguageWithRegion()];
            if (v17) {
              [(NSMutableArray *)v12 addObject:v17];
            }
          }
          long long v14 = (char *)[v11 countByEnumeratingWithState:&v62 objects:v74 count:16];
        }
        while (v14);
      }
      [*(id *)(a1 + 40) setDownloadFlagToAssetFlagArray:v5 primaryLanguages:v12 assetInfo:*(void *)(a1 + 48)];
      if (!*(unsigned char *)(*(void *)(a1 + 40) + 25))
      {
        v18 = +[NSMutableArray arrayWithCapacity:0];
        v19 = +[NSLocale preferredLanguages];
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v20 = [(NSArray *)v19 countByEnumeratingWithState:&v58 objects:v73 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v59;
          do
          {
            for (k = 0; k != v21; k = (char *)k + 1)
            {
              if (*(void *)v59 != v22) {
                objc_enumerationMutation(v19);
              }
              id v24 = [*(id *)(a1 + 40) normalizedLanguage:*(void *)(*((void *)&v58 + 1) + 8 * (void)k)];
              if (v24) {
                [(NSMutableArray *)v18 addObject:v24];
              }
            }
            id v21 = [(NSArray *)v19 countByEnumeratingWithState:&v58 objects:v73 count:16];
          }
          while (v21);
        }
        [*(id *)(a1 + 40) setDownloadFlagToAssetFlagArray:v5 primaryLanguages:v18 assetInfo:*(void *)(a1 + 48)];
      }
      if ([*(id *)(a1 + 32) isEqualToString:@"com.apple.MobileAsset.DictionaryServices.dictionary2"])
      {
        id v25 = [*(id *)(a1 + 40) oldDictionaryAssetsWithLanguageAssetInfo:*(void *)(a1 + 48)];
        if (!((char *)[v25 count] + v8)) {
          id v25 = (id)DCSDictionaryAssetCopyDownloadedDictionaryIdentifiers();
        }
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v44 = [v25 countByEnumeratingWithState:&v54 objects:v72 count:16];
        if (v44)
        {
          id obj = v25;
          uint64_t v43 = *(void *)v55;
          do
          {
            for (m = 0; m != v44; m = (char *)m + 1)
            {
              if (*(void *)v55 != v43) {
                objc_enumerationMutation(obj);
              }
              uint64_t v27 = *(void *)(*((void *)&v54 + 1) + 8 * (void)m);
              long long v50 = 0u;
              long long v51 = 0u;
              long long v52 = 0u;
              long long v53 = 0u;
              id v28 = [v5 countByEnumeratingWithState:&v50 objects:v71 count:16];
              if (v28)
              {
                id v29 = v28;
                uint64_t v30 = *(void *)v51;
                while (2)
                {
                  for (n = 0; n != v29; n = (char *)n + 1)
                  {
                    if (*(void *)v51 != v30) {
                      objc_enumerationMutation(v5);
                    }
                    v32 = *(void **)(*((void *)&v50 + 1) + 8 * (void)n);
                    id v33 = [v32 objectForKeyedSubscript:@"asset"];
                    if (objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "assetIdentifier:assetInfo:", v33, *(void *)(a1 + 48)), "isEqualToString:", v27))
                    {
                      if ([v33 state] == (id)1) {
                        [v32 setObject:&__kCFBooleanTrue forKeyedSubscript:@"downloadNeeded"];
                      }
                      goto LABEL_54;
                    }
                  }
                  id v29 = [v5 countByEnumeratingWithState:&v50 objects:v71 count:16];
                  if (v29) {
                    continue;
                  }
                  break;
                }
              }
LABEL_54:
              ;
            }
            id v44 = [obj countByEnumeratingWithState:&v54 objects:v72 count:16];
          }
          while (v44);
        }
      }
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v34 = [v5 countByEnumeratingWithState:&v46 objects:v70 count:16];
      if (v34)
      {
        id v35 = v34;
        uint64_t v36 = *(void *)v47;
        do
        {
          for (ii = 0; ii != v35; ii = (char *)ii + 1)
          {
            if (*(void *)v47 != v36) {
              objc_enumerationMutation(v5);
            }
            v38 = *(void **)(*((void *)&v46 + 1) + 8 * (void)ii);
            if (objc_msgSend(objc_msgSend(v38, "objectForKeyedSubscript:", @"downloadNeeded"), "BOOLValue"))
            {
              id v39 = [v38 objectForKeyedSubscript:@"asset"];
              id v40 = [*(id *)(a1 + 40) assetIdentifier:v39 assetInfo:*(void *)(a1 + 48)];
              [*(id *)(a1 + 40) updatePreferenceWithAssetIdentifier:v40];
              NSLog(@"AssetType:%@: start downloading asset \"%@\"", *(void *)(a1 + 32), v40);
              id v41 = [*(id *)(a1 + 40) downloadOptions:*(void *)(a1 + 32)];
              v45[0] = _NSConcreteStackBlock;
              v45[1] = 3221225472;
              v45[2] = sub_100005708;
              v45[3] = &unk_100008550;
              v45[4] = *(void *)(a1 + 32);
              v45[5] = v40;
              v45[6] = v39;
              [v39 startDownload:v41 then:v45];
            }
          }
          id v35 = [v5 countByEnumeratingWithState:&v46 objects:v70 count:16];
        }
        while (v35);
      }
    }
  }
}

id sub_100005708(uint64_t a1, uint64_t a2)
{
  NSLog(@"AssetType:%@: download completed: asset \"%@\", result=%ld", *(void *)(a1 + 32), *(void *)(a1 + 40), a2);
  id result = [*(id *)(a1 + 32) isEqualToString:@"com.apple.MobileAsset.DictionaryServices.dictionary2"];
  if (result)
  {
    id v4 = [*(id *)(a1 + 48) attributes];
    return (id)_DCSDictionaryAssetAttributesDownloaded(v4);
  }
  return result;
}

id sub_100005834(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 reachabilityChanged];
}

void sub_100005A38(uint64_t a1, uint64_t a2)
{
  NSLog(@"V1 dictionary (%@) was installed and purged with error=%@", *(void *)(a1 + 32), a2);
}

void sub_100005AF0()
{
  if (qword_10000C5D0 != -1) {
    dispatch_once(&qword_10000C5D0, &stru_100008598);
  }
}

void sub_100005B18(id a1)
{
  qword_10000C5D8 = (uint64_t)os_log_create("com.apple.LanguageAssetLoader", "LanguageAssetLoaderLog");
}

void sub_100005B48()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "\t primaryLanguage is nil. Return.", v0, 2u);
}

void sub_100005B90(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "\t Error running language asset query: error %@.", (uint8_t *)&v1, 0xCu);
}

uint64_t ASSetAssetServerURLForAssetType()
{
  return _ASSetAssetServerURLForAssetType();
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

uint64_t DCSDictionaryAssetCopyDownloadedDictionaryIdentifiers()
{
  return _DCSDictionaryAssetCopyDownloadedDictionaryIdentifiers();
}

uint64_t DCSDictionaryAssetCopyRemovedDictionaryIdentifiers()
{
  return _DCSDictionaryAssetCopyRemovedDictionaryIdentifiers();
}

uint64_t DCSDictionaryAssetGetCompatibilityVersion()
{
  return _DCSDictionaryAssetGetCompatibilityVersion();
}

uint64_t DCSPreferredOrderOfDictionaryAssetAttributesForLanguages()
{
  return _DCSPreferredOrderOfDictionaryAssetAttributesForLanguages();
}

uint64_t FSGetMaxSupportedFontAssetCompatibilityVersion()
{
  return _FSGetMaxSupportedFontAssetCompatibilityVersion();
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return _IOPSDrawingUnlimitedPower();
}

uint64_t IOPSGetPercentRemaining()
{
  return _IOPSGetPercentRemaining();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

void NSLog(NSString *format, ...)
{
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return _SCNetworkReachabilityCreateWithName(allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return _SCNetworkReachabilityGetFlags(target, flags);
}

Boolean SCNetworkReachabilityScheduleWithRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return _SCNetworkReachabilityScheduleWithRunLoop(target, runLoop, runLoopMode);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return _SCNetworkReachabilitySetCallback(target, callout, context);
}

Boolean SCNetworkReachabilityUnscheduleFromRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return _SCNetworkReachabilityUnscheduleFromRunLoop(target, runLoop, runLoopMode);
}

uint64_t TIInputModeGetLanguageWithRegion()
{
  return _TIInputModeGetLanguageWithRegion();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend__daemonDidLaunch(void *a1, const char *a2, ...)
{
  return [a1 _daemonDidLaunch];
}

id objc_msgSend_actualDownloadLanguageAssets(void *a1, const char *a2, ...)
{
  return [a1 actualDownloadLanguageAssets];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_assetType(void *a1, const char *a2, ...)
{
  return [a1 assetType];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_enabledInputModeIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 enabledInputModeIdentifiers];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isPowerRequestSatisfied(void *a1, const char *a2, ...)
{
  return [a1 isPowerRequestSatisfied];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_purgeSync(void *a1, const char *a2, ...)
{
  return [a1 purgeSync];
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return [a1 queryMetaDataSync];
}

id objc_msgSend_refreshState(void *a1, const char *a2, ...)
{
  return [a1 refreshState];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedInputModeController(void *a1, const char *a2, ...)
{
  return [a1 sharedInputModeController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_updatePreferenceWithLanguageOrID_(void *a1, const char *a2, ...)
{
  return [a1 updatePreferenceWithLanguageOrID];
}