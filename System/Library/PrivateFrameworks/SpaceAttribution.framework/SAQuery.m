@interface SAQuery
+ (BOOL)getAppPathForContainer:(id)a3 identifier:(id)a4 containerClass:(unint64_t)a5 personaString:(id)a6 existingQuery:(container_query_s *)a7 block:(id)a8;
+ (id)getFSPurgeableInfo:(id)a3 options:(int)a4;
+ (id)getLSBundleRecordForBundle:(id)a3;
+ (id)getVendorNameForBundleSet:(id)a3;
+ (id)getVendorNameFromBundleRecord:(id)a3;
+ (id)guesstimateBundleId:(id)a3;
+ (void)enumerateAppPathsOnVolume:(id)a3;
+ (void)enumerateWithContainerQuery:(unint64_t)a3 existingQuery:(container_query_s *)a4 outQuery:(container_query_s *)a5 block:(id)a6;
+ (void)installedAppGroupsAtVolume:(id)a3;
+ (void)installedAppsAtVolume:(BOOL)a3 sortForUrgency:(int)a4 options:(int)a5 block:(id)a6;
@end

@implementation SAQuery

+ (void)installedAppsAtVolume:(BOOL)a3 sortForUrgency:(int)a4 options:(int)a5 block:(id)a6
{
  char v6 = a5;
  id v8 = a6;
  recentlyUsedAppsDictionary();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100025E80;
  v11[3] = &unk_10004D358;
  int v14 = a4;
  char v15 = v6 & 1;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v8;
  id v9 = v8;
  id v10 = v12;
  +[SAQuery enumerateAppPathsOnVolume:v11];
}

+ (void)installedAppGroupsAtVolume:(id)a3
{
  id v3 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 1;
  if (container_query_create())
  {
    container_query_set_class();
    container_query_operation_set_flags();
    container_query_set_include_other_owners();
    v16 = v3;
    int iterate_results_sync = container_query_iterate_results_sync();
    container_query_get_last_error();
    char v6 = (void *)container_error_copy_unlocalized_description();
    if (iterate_results_sync)
    {
      v7 = SALog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_10003331C();
      }
    }
    else
    {
      v7 = SALog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100033384();
      }
    }

    free(v6);
    container_query_free();
    id v8 = v16;
  }
  else
  {
    id v8 = SALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000332E4(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  _Block_object_dispose(v17, 8);
}

+ (id)getLSBundleRecordForBundle:(id)a3
{
  return +[LSBundleRecord bundleRecordWithBundleIdentifier:a3 allowPlaceholder:1 error:0];
}

+ (void)enumerateAppPathsOnVolume:(id)a3
{
  uint64_t v4 = 0;
  id v3 = a3;
  +[SAQuery enumerateWithContainerQuery:2 existingQuery:0 outQuery:&v4 block:v3];
  +[SAQuery enumerateWithContainerQuery:4 existingQuery:v4 outQuery:0 block:v3];

  if (v4) {
    container_query_free();
  }
}

+ (void)enumerateWithContainerQuery:(unint64_t)a3 existingQuery:(container_query_s *)a4 outQuery:(container_query_s *)a5 block:(id)a6
{
  id v9 = a6;
  uint64_t v10 = (container_query_s *)container_query_create();
  uint64_t v11 = objc_opt_new();
  uint64_t v12 = objc_opt_new();
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 1;
  if (v10)
  {
    v27 = a4;
    container_query_set_class();
    container_query_operation_set_flags();
    container_query_set_include_other_owners();
    v35 = _NSConcreteStackBlock;
    uint64_t v36 = 3221225472;
    v37 = sub_100026868;
    v38 = &unk_10004D3A8;
    uint64_t v13 = v11;
    v39 = v13;
    id v14 = v12;
    id v40 = v14;
    v41 = v42;
    int iterate_results_sync = container_query_iterate_results_sync();
    container_query_get_last_error();
    v16 = (void *)container_error_copy_unlocalized_description();
    if (iterate_results_sync)
    {
      v17 = SALog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_10003331C();
      }
    }
    else
    {
      v17 = SALog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100033384();
      }
    }

    free(v16);
    id v26 = [v13 count];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100026A0C;
    block[3] = &unk_10004D3D0;
    id v30 = v14;
    v31 = v13;
    unint64_t v33 = a3;
    v34 = v27;
    id v32 = v9;
    dispatch_apply((size_t)v26, 0, block);
    if (a5) {
      *a5 = v10;
    }
    else {
      container_query_free();
    }

    char v18 = v39;
  }
  else
  {
    char v18 = SALog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000332E4(v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }

  _Block_object_dispose(v42, 8);
}

+ (BOOL)getAppPathForContainer:(id)a3 identifier:(id)a4 containerClass:(unint64_t)a5 personaString:(id)a6 existingQuery:(container_query_s *)a7 block:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 1;
  if (a5 == 4)
  {
    uint64_t v36 = 0;
    v17 = (id *)&v36;
    uint64_t v18 = +[LSApplicationExtensionRecord bundleRecordWithBundleIdentifier:v14 allowPlaceholder:1 error:&v36];
  }
  else
  {
    uint64_t v35 = 0;
    v17 = (id *)&v35;
    uint64_t v18 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v14 allowPlaceholder:1 error:&v35];
  }
  uint64_t v19 = (void *)v18;
  id v20 = *v17;
  uint64_t v21 = v20;
  if (!v19 || v20)
  {
    uint64_t v24 = SALog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1000334CC();
    }
    BOOL v23 = 1;
  }
  else
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100026D5C;
    v26[3] = &unk_10004D3F8;
    v27 = v19;
    char v33 = 0;
    BOOL v34 = a5 == 4;
    id v28 = v15;
    id v32 = a7;
    id v29 = v14;
    v31 = &v37;
    id v30 = v16;
    uint64_t v22 = objc_retainBlock(v26);
    ((void (*)(void *, id))v22[2])(v22, v13);
    BOOL v23 = *((unsigned char *)v38 + 24) != 0;

    uint64_t v24 = v27;
  }

  _Block_object_dispose(&v37, 8);
  return v23;
}

+ (id)getFSPurgeableInfo:(id)a3 options:(int)a4
{
  id v5 = a3;
  unsigned int valuePtr = (a4 >> 2) & 1;
  if ((a4 & 4) != 0) {
    CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  }
  else {
    CFNumberRef v6 = 0;
  }
  id v7 = [v5 path];
  CFStringRef v8 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)[v7 UTF8String], 0x8000100u);

  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(Mutable, @"CACHE_DELETE_VOLUME", v8);
  if (v6) {
    CFDictionarySetValue(Mutable, @"CACHE_DELETE_NO_CACHE", v6);
  }
  id v10 = (id)CacheDeleteCopyItemizedPurgeableSpaceWithInfo();
  id v11 = [v10 copy];
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (v10) {
    CFRelease(v10);
  }

  return v11;
}

+ (id)getVendorNameFromBundleRecord:(id)a3
{
  id v3 = a3;
  if ([v3 developerType] == 1)
  {
    uint64_t v4 = @"Apple";
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v3;
      CFNumberRef v6 = [v5 containingBundleRecord];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [v5 containingBundleRecord];
      }
      else
      {
        id v7 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v7 = v3;
      }
      else {
        id v7 = 0;
      }
    }
    CFStringRef v8 = [v7 iTunesMetadata];
    id v9 = [v8 artistName];

    if (v9)
    {
      uint64_t v4 = [v8 artistName];
    }
    else
    {
      uint64_t v4 = @"Unknown";
    }
  }
  return v4;
}

+ (id)guesstimateBundleId:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[SAQuery getLSBundleRecordForBundle:v3];
  id v5 = +[SAQuery getVendorNameFromBundleRecord:v4];

  if ([v5 hasPrefix:@"Apple Inc."])
  {
    CFNumberRef v6 = SALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      id v10 = "+[SAQuery guesstimateBundleId:]";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Shorten Apple Inc for %@", (uint8_t *)&v9, 0x16u);
    }

    id v7 = @"Apple";
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

+ (id)getVendorNameForBundleSet:(id)a3
{
  id v3 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_100027AA0;
  id v20 = sub_100027AB0;
  id v21 = +[NSMutableSet setWithCapacity:5];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100027AB8;
  v15[3] = &unk_10004D0B0;
  v15[4] = &v16;
  [v3 enumerateObjectsUsingBlock:v15];
  if ([(id)v17[5] count])
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = sub_100027AA0;
    id v13 = sub_100027AB0;
    id v14 = 0;
    uint64_t v4 = (void *)v17[5];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100027B44;
    v8[3] = &unk_10004D420;
    v8[4] = &v9;
    [v4 enumerateObjectsUsingBlock:v8];
    id v5 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    CFNumberRef v6 = SALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100033814();
    }

    id v5 = 0;
  }
  _Block_object_dispose(&v16, 8);

  return v5;
}

@end