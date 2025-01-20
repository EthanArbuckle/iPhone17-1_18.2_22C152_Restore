void _handleATCStartupCompletedNotification(uint64_t a1, void *a2)
{
  if (a2) {
    [a2 setupInstallCoordinatorObserver];
  }
}

void sub_5CC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Uninstall of %{public}@ with install coordinator succeeded with error %{public}@.", (uint8_t *)&v6, 0x16u);
  }

  +[AITransactionLog logStep:7 byParty:1 phase:2 success:v3 == 0 forBundleID:*(void *)(a1 + 32) description:@"Uninstall app"];
}

void sub_9310(uint64_t a1, uint64_t a2)
{
  v4 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Prioritize %{public}@ finished with error %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_9614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_9638(void *a1)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 80) containsObject:a1[5]];
  uint64_t v2 = a1[5];
  id v3 = *(void **)(a1[4] + 80);

  return [v3 addObject:v2];
}

void sub_9688(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 88) containsObject:*(void *)(a1 + 40)])
  {
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
    --*(void *)(*(void *)(a1 + 32) + 128);
    [*(id *)(*(void *)(a1 + 32) + 88) removeObject:*(void *)(a1 + 40)];
    uint64_t v2 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 128);
      int v5 = 138543618;
      uint64_t v6 = v3;
      __int16 v7 = 2048;
      uint64_t v8 = v4;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "IC cancelled coordinator for restoring app bundle %{public}@ _restoringPlaceholderCount %lld", (uint8_t *)&v5, 0x16u);
    }
  }
}

BOOL sub_A458(BOOL result)
{
  if (result)
  {
    v1 = (void *)result;
    objc_opt_class();
    return (objc_opt_isKindOfClass() & 1) != 0
        && [v1 rangeOfString:@"/.."] == (id)0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

intptr_t sub_A8FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _ATLogCategorySyncBundle();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      int v10 = 138543362;
      uint64_t v11 = a2;
      uint64_t v6 = "refreshReceiptsWithCompletionBlock failed: %{public}@";
      __int16 v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v10) = 0;
    uint64_t v6 = "refreshReceiptsWithCompletionBlock succeeded";
    __int16 v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_A9DC(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 80);

  return [v2 removeAllObjects];
}

void sub_B054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_B0C8(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "containsObject:", objc_msgSend(*(id *)(a1 + 40), "identifier"));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "containsObject:", objc_msgSend(*(id *)(a1 + 40), "identifier"));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "identifier"));
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 80);
  id v4 = [v2 identifier];

  return [v3 removeObject:v4];
}

id sub_C49C(uint64_t a1, void *a2)
{
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v5 = [a2 bundleVersion];
  if (v5) {
    [(NSMutableDictionary *)v4 setObject:v5 forKeyedSubscript:kCFBundleVersionKey];
  }
  id v6 = [a2 bundleIdentifier];
  if (v6) {
    [(NSMutableDictionary *)v4 setObject:v6 forKeyedSubscript:kCFBundleIdentifierKey];
  }
  id v7 = objc_msgSend(objc_msgSend(a2, "bundleContainerURL"), "path");
  if (v7) {
    [(NSMutableDictionary *)v4 setObject:v7 forKeyedSubscript:@"Container"];
  }
  uint32_t v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a2 installType] == (char *)&dword_0 + 2);
  if (v8) {
    [(NSMutableDictionary *)v4 setObject:v8 forKeyedSubscript:@"IsRestore"];
  }
  uint64_t v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a2 installType] == &dword_8);
  if (v9) {
    [(NSMutableDictionary *)v4 setObject:v9 forKeyedSubscript:@"intentional_demoted_app"];
  }
  int v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a2 installType] == (char *)&dword_4 + 3);
  if (v10) {
    [(NSMutableDictionary *)v4 setObject:v10 forKeyedSubscript:@"auto_demoted_app"];
  }
  uint64_t v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(objc_msgSend(a2, "applicationType"), "isEqualToString:", @"System"));
  if (v11) {
    [(NSMutableDictionary *)v4 setObject:v11 forKeyedSubscript:@"system_app"];
  }
  id v12 = objc_msgSend(objc_msgSend(a2, "bundleURL"), "path");
  if (v12) {
    [(NSMutableDictionary *)v4 setObject:v12 forKeyedSubscript:@"Path"];
  }
  v13 = *(void **)(a1 + 32);
  id v14 = [a2 applicationIdentifier];

  return [v13 setObject:v4 forKey:v14];
}

void *sub_C678(void *result)
{
  if (*((unsigned char *)result + 48)) {
    return [*(id *)(result[4] + 72) addObject:result[5]];
  }
  return result;
}

void sub_C9E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_CA0C(uint64_t a1, void *a2)
{
  id result = objc_msgSend(objc_msgSend(a2, "applicationType"), "isEqualToString:", @"User");
  if (result)
  {
    id result = objc_msgSend(objc_msgSend(objc_msgSend(a2, "diskUsage"), "staticUsage"), "unsignedLongLongValue");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return result;
}

void sub_CBC8(uint64_t a1, void *a2)
{
  id v5 = objc_msgSend(objc_msgSend(objc_msgSend(a2, "bundleContainerURL"), "path"), "stringByAppendingPathComponent:", @"iTunesMetadata.plist");
  id v6 = +[NSDictionary dictionaryWithContentsOfFile:v5];
  id v7 = [(NSDictionary *)v6 objectForKey:@"appleId"];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = (void *)sub_CE6C((uint64_t)v7, v8, @"appleID");
  id v10 = [(NSDictionary *)v6 objectForKey:@"com.apple.iTunesStore.downloadInfo"];
  uint64_t v11 = objc_opt_class();
  id v12 = [(id)sub_CE6C((uint64_t)v10 v11:@"downloadInfo"), "objectForKey:", @"accountInfo"];
  uint64_t v13 = objc_opt_class();
  id v14 = [(id)sub_CE6C((uint64_t)v12 v13:@"accountInfo"), "objectForKey:", @"AppleID"];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = (void *)sub_CE6C((uint64_t)v14, v15, @"AppleID");
  if ([v9 length] && objc_msgSend(v16, "length"))
  {
    if (([v9 isEqual:v16] & 1) == 0)
    {
      uint64_t v17 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138543874;
        id v22 = [a2 applicationIdentifier];
        __int16 v23 = 2114;
        id v24 = v9;
        __int16 v25 = 2114;
        v26 = v16;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "mismatched AppleID keys for %{public}@: %{public}@ vs %{public}@", (uint8_t *)&v21, 0x20u);
      }
    }
    [*(id *)(a1 + 32) addObject:v9];
    goto LABEL_10;
  }
  if ([v9 length])
  {
    uint64_t v18 = *(void **)(a1 + 32);
    v19 = v9;
LABEL_11:
    [v18 addObject:v19];
    goto LABEL_12;
  }
  if ([v16 length])
  {
LABEL_10:
    uint64_t v18 = *(void **)(a1 + 32);
    v19 = v16;
    goto LABEL_11;
  }
  v20 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138543618;
    id v22 = [a2 applicationIdentifier];
    __int16 v23 = 2114;
    id v24 = v5;
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "unknown AppleID for %{public}@ (plist at %{public}@)", (uint8_t *)&v21, 0x16u);
  }
LABEL_12:
}

uint64_t sub_CE6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1;
  if (a1 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543362;
      uint64_t v8 = a3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "unexpected type for %{public}@", (uint8_t *)&v7, 0xCu);
    }
    return 0;
  }
  return v3;
}

void sub_D080(uint64_t a1, void *a2)
{
  id v5 = +[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", objc_msgSend(objc_msgSend(objc_msgSend(a2, "bundleContainerURL"), "path"), "stringByAppendingPathComponent:", @"iTunesMetadata.plist"));
  id v6 = [(NSDictionary *)v5 objectForKey:@"com.apple.iTunesStore.downloadInfo"];
  uint64_t v7 = objc_opt_class();
  id v8 = [(id)sub_CE6C((uint64_t)v6 v7:@"downloadInfo"), "objectForKey:", @"accountInfo"];
  uint64_t v9 = objc_opt_class();
  id v10 = (void *)sub_CE6C((uint64_t)v8, v9, @"accountInfo");
  id v11 = [v10 objectForKey:@"AppleID"];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = sub_CE6C((uint64_t)v11, v12, @"AppleID");
  if (v13
    || (id v14 = [(NSDictionary *)v5 objectForKey:@"appleId"],
        uint64_t v15 = objc_opt_class(),
        (uint64_t v13 = sub_CE6C((uint64_t)v14, v15, @"appleID")) != 0))
  {
    if (([*(id *)(a1 + 32) containsObject:v13] & 1) == 0)
    {
      id v16 = [v10 objectForKey:@"DSPersonID"];
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = sub_CE6C((uint64_t)v16, v17, @"DSPersonID");
      id v19 = [v10 objectForKey:@"AltDSID"];
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = sub_CE6C((uint64_t)v19, v20, @"AltDSID");
      id v22 = objc_alloc_init((Class)ATMutableAccountInfo);
      [v22 setDSID:v18];
      [v22 setAppleID:v13];
      [v22 setAltDSID:v21];
      [*(id *)(a1 + 40) addObject:v22];
      [*(id *)(a1 + 32) addObject:v13];
    }
  }
}

void sub_D408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_D420(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "containsObject:", objc_msgSend(*(id *)(a1 + 40), "identifier"));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_D578(id a1, LSBundleProxy *a2, BOOL *a3)
{
  id v5 = objc_msgSend(objc_msgSend(-[LSBundleProxy bundleContainerURL](a2, "bundleContainerURL"), "path"), "stringByAppendingPathComponent:", @"iTunesMetadata.plist");
  id v6 = +[NSMutableDictionary dictionaryWithContentsOfFile:v5];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [(NSMutableDictionary *)v6 objectForKey:@"DeviceBasedVPP"];
    unsigned int v9 = [(LSBundleProxy *)a2 hasMIDBasedSINF];
    if (v8) {
      int v10 = 1;
    }
    else {
      int v10 = v9;
    }
    if (v10 == 1)
    {
      unsigned int v11 = v9;
      uint64_t v12 = v9 ? &__kCFBooleanTrue : &__kCFBooleanFalse;
      [(NSMutableDictionary *)v7 setObject:v12 forKey:@"DeviceBasedVPP"];
      uint64_t v13 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543618;
        id v18 = [(LSBundleProxy *)a2 bundleIdentifier];
        __int16 v19 = 1024;
        unsigned int v20 = v11;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Updated DeviceBasedVPP state for : %{public}@ to %d", (uint8_t *)&v17, 0x12u);
      }
    }
    id v14 = [(NSMutableDictionary *)v7 objectForKey:@"is-auto-download"];
    if (v14 && [v14 BOOLValue])
    {
      [(NSMutableDictionary *)v7 removeObjectForKey:@"is-auto-download"];
      uint64_t v15 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [(LSBundleProxy *)a2 bundleIdentifier];
        int v17 = 138543362;
        id v18 = v16;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "clearing is-auto-download value for %{public}@", (uint8_t *)&v17, 0xCu);
      }
      goto LABEL_16;
    }
    if (v10) {
LABEL_16:
    }
      [(NSMutableDictionary *)v7 writeToFile:v5 atomically:1];
  }
}

void sub_E5FC(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 88) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
    ++*(void *)(*(void *)(a1 + 32) + 128);
    [*(id *)(*(void *)(a1 + 32) + 88) addObject:*(void *)(a1 + 40)];
    uint64_t v2 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 128);
      int v5 = 138543618;
      uint64_t v6 = v3;
      __int16 v7 = 2048;
      uint64_t v8 = v4;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "DataMigrator will wait for IC to install placeholder for %{public}@, _restoringPlaceholderCount %lld", (uint8_t *)&v5, 0x16u);
    }
  }
}

void sub_E758(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 88) containsObject:*(void *)(a1 + 40)])
  {
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
    --*(void *)(*(void *)(a1 + 32) + 128);
    [*(id *)(*(void *)(a1 + 32) + 88) removeObject:*(void *)(a1 + 40)];
    uint64_t v2 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 128);
      int v5 = 138543618;
      uint64_t v6 = v3;
      __int16 v7 = 2048;
      uint64_t v8 = v4;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "DataMigrator cancelled coordinator for restoring app bundle %{public}@ _restoringPlaceholderCount %lld", (uint8_t *)&v5, 0x16u);
    }
  }
}

void sub_E8B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 96))
  {
    if ([*(id *)(v1 + 88) containsObject:*(void *)(a1 + 40)])
    {
      dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
      --*(void *)(*(void *)(a1 + 32) + 128);
      [*(id *)(*(void *)(a1 + 32) + 88) removeObject:*(void *)(a1 + 40)];
      uint64_t v3 = _ATLogCategorySyncBundle();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 128);
      int v12 = 138543618;
      uint64_t v13 = v4;
      __int16 v14 = 2048;
      uint64_t v15 = v5;
      uint64_t v6 = "IC finished installing placeholder for %{public}@, _restoringPlaceholderCount %lld";
      __int16 v7 = v3;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
      uint32_t v9 = 22;
    }
    else
    {
      int v10 = _ATLogCategorySyncBundle();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        return;
      }
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138543362;
      uint64_t v13 = v11;
      uint64_t v6 = "Ignoring notification from IC about installing placeholder for %{public}@";
      __int16 v7 = v10;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 12;
    }
    _os_log_impl(&dword_0, v7, v8, v6, (uint8_t *)&v12, v9);
  }
}

void sub_F344(uint64_t a1)
{
  uint64_t v2 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Finished waiting for placeholder installs", v3, 2u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 96) = 1;
}

uint64_t sub_F808(uint64_t a1, void *a2)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t result = (uint64_t)objc_msgSend(objc_msgSend(a2, "appState"), "isPlaceholder");
    if (result)
    {
      uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
      return v5();
    }
  }
  return result;
}

void sub_FA04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_FA28(uint64_t a1, uint64_t a2)
{
}

void sub_FA38(uint64_t a1)
{
}

uint64_t sub_FA44(uint64_t a1, void *a2)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t result = (uint64_t)objc_msgSend(objc_msgSend(a2, "appState"), "isPlaceholder");
    if (result)
    {
      uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      id v6 = [a2 bundleIdentifier];
      return (uint64_t)[v5 addObject:v6];
    }
  }
  return result;
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return _CFBundleCreate(allocator, bundleURL);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithData(data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return _CGImageDestinationFinalize(idst);
}

uint64_t IXCreateUserPresentableError()
{
  return _IXCreateUserPresentableError();
}

uint64_t LICreateDeviceAppropriateHomeScreenIconImageFromBundle()
{
  return _LICreateDeviceAppropriateHomeScreenIconImageFromBundle();
}

uint64_t MobileInstallationClearUninstalled()
{
  return _MobileInstallationClearUninstalled();
}

uint64_t MobileInstallationLookupUninstalled()
{
  return _MobileInstallationLookupUninstalled();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t SBGetFlattenedIconState()
{
  return _SBGetFlattenedIconState();
}

uint64_t SBSSpringBoardBlockableServerPort()
{
  return _SBSSpringBoardBlockableServerPort();
}

uint64_t SBSetIconState()
{
  return _SBSetIconState();
}

uint64_t _ATLogCategorySyncBundle()
{
  return __ATLogCategorySyncBundle();
}

uint64_t _ATLogCategorySyncBundle_Oversize()
{
  return __ATLogCategorySyncBundle_Oversize();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

int utimes(const char *a1, const timeval *a2)
{
  return _utimes(a1, a2);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

id objc_msgSend__appInstallationAllowed(void *a1, const char *a2, ...)
{
  return [a1 _appInstallationAllowed];
}

id objc_msgSend__appRemovalAllowed(void *a1, const char *a2, ...)
{
  return [a1 _appRemovalAllowed];
}

id objc_msgSend__fetchResults(void *a1, const char *a2, ...)
{
  return [a1 _fetchResults];
}

id objc_msgSend__getAndResetNumAppInstallsAttempted(void *a1, const char *a2, ...)
{
  return [a1 _getAndResetNumAppInstallsAttempted];
}

id objc_msgSend__getSystemAppPlaceholders(void *a1, const char *a2, ...)
{
  return [a1 _getSystemAppPlaceholders];
}

id objc_msgSend__inProgressAssetIDs(void *a1, const char *a2, ...)
{
  return [a1 _inProgressAssetIDs];
}

id objc_msgSend__isATCDaemon(void *a1, const char *a2, ...)
{
  return [a1 _isATCDaemon];
}

id objc_msgSend__processItunesRestoreInfo(void *a1, const char *a2, ...)
{
  return [a1 _processItunesRestoreInfo];
}

id objc_msgSend__restoringAssetIDs(void *a1, const char *a2, ...)
{
  return [a1 _restoringAssetIDs];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return [a1 appState];
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationIdentifier];
}

id objc_msgSend_applicationType(void *a1, const char *a2, ...)
{
  return [a1 applicationType];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleContainerURL(void *a1, const char *a2, ...)
{
  return [a1 bundleContainerURL];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return [a1 bundleVersion];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_creatorIdentifier(void *a1, const char *a2, ...)
{
  return [a1 creatorIdentifier];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_diskUsage(void *a1, const char *a2, ...)
{
  return [a1 diskUsage];
}

id objc_msgSend_downloadProgress(void *a1, const char *a2, ...)
{
  return [a1 downloadProgress];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_hasAppAssetPromise(void *a1, const char *a2, ...)
{
  return [a1 hasAppAssetPromise];
}

id objc_msgSend_hasInitialODRAssetPromises(void *a1, const char *a2, ...)
{
  return [a1 hasInitialODRAssetPromises];
}

id objc_msgSend_hasInstallOptions(void *a1, const char *a2, ...)
{
  return [a1 hasInstallOptions];
}

id objc_msgSend_hasMIDBasedSINF(void *a1, const char *a2, ...)
{
  return [a1 hasMIDBasedSINF];
}

id objc_msgSend_hasPlaceholderPromise(void *a1, const char *a2, ...)
{
  return [a1 hasPlaceholderPromise];
}

id objc_msgSend_hasUserDataPromise(void *a1, const char *a2, ...)
{
  return [a1 hasUserDataPromise];
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return [a1 icon];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_infoPlist(void *a1, const char *a2, ...)
{
  return [a1 infoPlist];
}

id objc_msgSend_installPhase(void *a1, const char *a2, ...)
{
  return [a1 installPhase];
}

id objc_msgSend_installProgress(void *a1, const char *a2, ...)
{
  return [a1 installProgress];
}

id objc_msgSend_installProgressSync(void *a1, const char *a2, ...)
{
  return [a1 installProgressSync];
}

id objc_msgSend_installState(void *a1, const char *a2, ...)
{
  return [a1 installState];
}

id objc_msgSend_installType(void *a1, const char *a2, ...)
{
  return [a1 installType];
}

id objc_msgSend_isComplete(void *a1, const char *a2, ...)
{
  return [a1 isComplete];
}

id objc_msgSend_isDownload(void *a1, const char *a2, ...)
{
  return [a1 isDownload];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 isPlaceholder];
}

id objc_msgSend_isRestore(void *a1, const char *a2, ...)
{
  return [a1 isRestore];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_prettyName(void *a1, const char *a2, ...)
{
  return [a1 prettyName];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_staticUsage(void *a1, const char *a2, ...)
{
  return [a1 staticUsage];
}

id objc_msgSend_storePID(void *a1, const char *a2, ...)
{
  return [a1 storePID];
}

id objc_msgSend_storePlist(void *a1, const char *a2, ...)
{
  return [a1 storePlist];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_variantOptions(void *a1, const char *a2, ...)
{
  return [a1 variantOptions];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}