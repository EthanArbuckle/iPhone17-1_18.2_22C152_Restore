uint64_t WLKIsRegulatedSKU()
{
  int v0;
  void *v1;
  void *v2;
  BOOL v3;
  uint64_t v4;

  v0 = MGGetBoolAnswer();
  v1 = (void *)MGCopyAnswer();
  v2 = v1;
  if (v1) {
    v3 = [v1 caseInsensitiveCompare:@"CH"] == 0;
  }
  else {
    v3 = 0;
  }
  v4 = v0 | v3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    WLKIsRegulatedSKU_cold_1(v4);
  }

  return v4;
}

void WLKIsRegulatedSKU_cold_1(char a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1 = @"NO";
  if (a1) {
    v1 = @"YES";
  }
  int v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_1BA2E8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[WLKRegionUtilities]: Is regulated SKU: %@", (uint8_t *)&v2, 0xCu);
}

id WLKRestrictionsMaximumEffectiveTVShowRanking()
{
  v0 = [MEMORY[0x1E4F74230] sharedConnection];
  v1 = [v0 effectiveValueForSetting:*MEMORY[0x1E4F740C8]];

  int v2 = [v1 intValue];
  if (v2 == *MEMORY[0x1E4F4BE18]) {
    id v3 = 0;
  }
  else {
    id v3 = v1;
  }

  return v3;
}

id WLKRestrictionsMaximumEffectiveMovieRanking()
{
  v0 = [MEMORY[0x1E4F74230] sharedConnection];
  v1 = [v0 effectiveValueForSetting:*MEMORY[0x1E4F740C0]];

  int v2 = [v1 intValue];
  if (v2 == *MEMORY[0x1E4F4BE18]) {
    id v3 = 0;
  }
  else {
    id v3 = v1;
  }

  return v3;
}

void sub_1BA2EC6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WLKCurrentProtocolVersion()
{
  if (WLKCurrentProtocolVersion_onceToken != -1) {
    dispatch_once(&WLKCurrentProtocolVersion_onceToken, &__block_literal_global);
  }
  if (os_variant_has_internal_content()) {
    BOOL v0 = WLKCurrentProtocolVersion_overrideValue == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0 || (unint64_t)[(id)WLKCurrentProtocolVersion_overrideValue unsignedIntegerValue] < 0x53) {
    return 82;
  }
  v1 = (void *)WLKCurrentProtocolVersion_overrideValue;

  return [v1 unsignedIntegerValue];
}

id WLKRestrictionsCountryCode()
{
  BOOL v0 = (void *)CRCopyRestrictionsDictionary();
  v1 = [v0 objectForKey:*MEMORY[0x1E4F4BE08]];
  if ([v1 length]) {
    int v2 = v1;
  }
  else {
    int v2 = (void *)*MEMORY[0x1E4F4BE10];
  }
  id v3 = [v2 uppercaseString];

  return v3;
}

void __WLKSortDictionaries_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  WLKSortDictionaries(a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v6 forKey:v5];
}

WLKSortedKeyDictionary *WLKSortDictionaries(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v2 = (WLKSortedKeyDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[WLKSortedKeyDictionary count](v1, "count"));
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __WLKSortDictionaries_block_invoke;
    v16[3] = &unk_1E620AB90;
    v17 = v2;
    id v3 = v2;
    [(WLKSortedKeyDictionary *)v1 enumerateKeysAndObjectsUsingBlock:v16];
    uint64_t v4 = [[WLKSortedKeyDictionary alloc] initWithDictionary:v3];

    id v5 = v17;
    v1 = v4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_13;
    }
    id v3 = (WLKSortedKeyDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[WLKSortedKeyDictionary count](v1, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v1;
    uint64_t v6 = [(WLKSortedKeyDictionary *)v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = WLKSortDictionaries(*(void *)(*((void *)&v12 + 1) + 8 * i));
          -[WLKSortedKeyDictionary addObject:](v3, "addObject:", v10, (void)v12);
        }
        uint64_t v7 = [(WLKSortedKeyDictionary *)v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
      }
      while (v7);
    }

    v1 = (WLKSortedKeyDictionary *)[(WLKSortedKeyDictionary *)v3 copy];
  }

LABEL_13:

  return v1;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __WLKIgnoreHTTPCacheOverride_block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.WatchListKit"];
  uint64_t v0 = [v2 objectForKey:@"IgnoreHTTPCache"];
  v1 = (void *)v0;
  if (v0)
  {
    NSLog(&cfstr_Wlkignorehttpc.isa, v0);
    objc_storeStrong((id *)&WLKIgnoreHTTPCacheOverride_retVal, v1);
  }
}

void __WLKIsTVApp_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 bundleIdentifier];

  WLKIsTVApp_retVal = [v1 isEqualToString:@"com.apple.tv"];
}

void __WLKIsDaemon_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 bundleIdentifier];

  WLKIsDaemon_retVal = [v1 isEqualToString:@"com.apple.watchlistd"];
}

void sub_1BA2EF15C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA2EF564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
}

void sub_1BA2EF798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA2EF9A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BA2F0E90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id WLKPushNotificationsLogObject()
{
  if (WLKPushNotificationsLogObject_onceToken != -1) {
    dispatch_once(&WLKPushNotificationsLogObject_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)WLKPushNotificationsLogObject_logger;

  return v0;
}

id WLKTVAppEnabledOverride()
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"TVAppEnabledOverride", @"com.apple.tv", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    id v1 = [NSNumber numberWithBool:AppBooleanValue != 0];
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

void WLKFetchNotificationCategories(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4FA9C70] app];
  id v3 = [v2 arrayForKey:kBagKeyUVSearchEnabledNotificationTypes];

  if (!v3)
  {
    uint64_t v7 = 0;
    if (!v1) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  v11 = v3;
  id v4 = v3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 isEqual:@"Explicit"])
        {
          v7 |= 1uLL;
        }
        else if ([v10 isEqual:@"Implicit"])
        {
          v7 |= 2uLL;
        }
        else if ([v10 isEqual:@"Marketing"])
        {
          v7 |= 4uLL;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  id v3 = v11;
  if (v1) {
LABEL_20:
  }
    v1[2](v1, v7, 0);
LABEL_21:
}

void sub_1BA2F19F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,char a21)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v22 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BA2F2404(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(a1);
}

void sub_1BA2F2770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA2F2ABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t WLKPostPlayAutoPlayCheckHasActiveAccount(void *a1)
{
  uint64_t v2 = +[WLKAccountMonitor sharedInstance];
  id v3 = [v2 activeAccount];

  char v4 = [v3 isAuthenticated];
  char v5 = v4;
  if (a1 && (v4 & 1) == 0)
  {
    *a1 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WLKPostPlayAutoPlayErrorDomain" code:-2 userInfo:0];
  }
  if (v5) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = WLKIsRunningTest();
  }

  return v6;
}

uint64_t WLKCurrentAPIVersion()
{
  if (WLKCurrentAPIVersion_onceToken != -1) {
    dispatch_once(&WLKCurrentAPIVersion_onceToken, &__block_literal_global_3);
  }
  if (os_variant_has_internal_content()) {
    BOOL v0 = WLKCurrentAPIVersion_overrideValue == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0 || (unint64_t)[(id)WLKCurrentAPIVersion_overrideValue unsignedIntegerValue] < 4) {
    return 3;
  }
  id v1 = (void *)WLKCurrentAPIVersion_overrideValue;

  return [v1 unsignedIntegerValue];
}

void sub_1BA2F4514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WLKNetworkSignpostLogObject()
{
  if (WLKNetworkSignpostLogObject_onceToken != -1) {
    dispatch_once(&WLKNetworkSignpostLogObject_onceToken, &__block_literal_global_19_0);
  }
  BOOL v0 = (void *)WLKNetworkSignpostLogObject_logger;

  return v0;
}

id WLKIgnoreHTTPCacheOverride()
{
  if (WLKIgnoreHTTPCacheOverride_onceToken != -1) {
    dispatch_once(&WLKIgnoreHTTPCacheOverride_onceToken, &__block_literal_global_43);
  }
  BOOL v0 = (void *)WLKIgnoreHTTPCacheOverride_retVal;

  return v0;
}

void sub_1BA2F4904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA2F4B18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t WLKIsNLSBubbleTipEnabledInCache(void *a1)
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __WLKIsNLSBubbleTipEnabledInCache_block_invoke;
  v11[3] = &unk_1E620A240;
  long long v13 = &v21;
  long long v14 = &v15;
  id v3 = v2;
  long long v12 = v3;
  WLKFetchIsBubbleTipEnabled(1, v11);
  dispatch_time_t v4 = dispatch_time(0, 500000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WLKFeatureEnablerHelperDomain" code:1 userInfo:0];
    uint64_t v6 = (void *)v16[5];
    v16[5] = v5;

    uint64_t v7 = WLKSystemLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKFeatureEnablerHelpers - Timed out accessing cached config for feature enablement for bubble tip.", v10, 2u);
    }
  }
  if (a1) {
    *a1 = (id) v16[5];
  }
  uint64_t v8 = *((unsigned __int8 *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v8;
}

void sub_1BA2F55EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void WLKFetchIsBubbleTipEnabled(int a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = +[WLKConfigurationManager sharedInstance];
  if (a1) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __WLKFetchIsBubbleTipEnabled_block_invoke;
  v7[3] = &unk_1E620A218;
  id v8 = v3;
  id v6 = v3;
  [v4 fetchConfigurationWithOptions:0 cachePolicy:v5 queryParameters:0 completion:v7];
}

void sub_1BA2F66AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

id WLKNetworkingLogObject()
{
  if (WLKNetworkingLogObject_onceToken != -1) {
    dispatch_once(&WLKNetworkingLogObject_onceToken, &__block_literal_global_10);
  }
  BOOL v0 = (void *)WLKNetworkingLogObject_logger;

  return v0;
}

void __WLKFetchIsBubbleTipEnabled_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (!a2 || v5)
  {
    v10 = WLKSystemLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __WLKFetchIsSportsEnabled_block_invoke_cold_1((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);
    }

    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    int v7 = [a2 naturalLanguageSearchProperty];
    id v8 = WLKSystemLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v17[0] = 67109120;
      v17[1] = v7;
      _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKFeatureEnablerHelpers - NLS Bubble Tip enabled from config %d", (uint8_t *)v17, 8u);
    }

    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v9();
}

void __WLKIsNLSBubbleTipEnabledInCache_block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id WLKBaseURLReturningError()
{
  BOOL v0 = WLKBaseURLOverride();
  id v1 = v0;
  if (v0)
  {
    id v2 = v0;
  }
  else
  {
    id v3 = [MEMORY[0x1E4FA9C70] app];
    dispatch_time_t v4 = [v3 cachedURLForKey:kBagKeyUVSearchUtsApiBaseURL];

    id v2 = [v4 absoluteString];
  }

  return v2;
}

id WLKBaseURLOverride()
{
  if (os_variant_has_internal_content())
  {
    BOOL v0 = (void *)CFPreferencesCopyAppValue(@"APIBaseURL", @"com.apple.WatchListKit");
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __WLKBaseURLOverride_block_invoke;
    block[3] = &unk_1E620A708;
    id v1 = v0;
    id v4 = v1;
    if (WLKBaseURLOverride_onceToken != -1) {
      dispatch_once(&WLKBaseURLOverride_onceToken, block);
    }
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

void sub_1BA2F7AB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA2F7D7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA2F8B0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id WLKStartupSignpostLogObject()
{
  if (WLKStartupSignpostLogObject_onceToken != -1) {
    dispatch_once(&WLKStartupSignpostLogObject_onceToken, &__block_literal_global_16);
  }
  BOOL v0 = (void *)WLKStartupSignpostLogObject_logger;

  return v0;
}

void sub_1BA2F9038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WLKSystemLogObject()
{
  if (WLKSystemLogObject_onceToken != -1) {
    dispatch_once(&WLKSystemLogObject_onceToken, &__block_literal_global_19);
  }
  BOOL v0 = (void *)WLKSystemLogObject_logger;

  return v0;
}

void sub_1BA2FA8D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_1BA2FACE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA2FAFE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WLKSubscriptionSyncLogObject()
{
  if (WLKSubscriptionSyncLogObject_onceToken != -1) {
    dispatch_once(&WLKSubscriptionSyncLogObject_onceToken, &__block_literal_global_25_0);
  }
  BOOL v0 = (void *)WLKSubscriptionSyncLogObject_logger;

  return v0;
}

void sub_1BA2FB6C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_1BA2FBFC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t WLKIsDaemon()
{
  if (WLKIsDaemon_onceToken != -1) {
    dispatch_once(&WLKIsDaemon_onceToken, &__block_literal_global_37);
  }
  return WLKIsDaemon_retVal;
}

void sub_1BA2FC948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t WLKIsTVApp()
{
  if (WLKIsTVApp_onceToken != -1) {
    dispatch_once(&WLKIsTVApp_onceToken, &__block_literal_global_45);
  }
  return WLKIsTVApp_retVal;
}

void sub_1BA2FD364(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t WLKShouldRunInProcess()
{
  if (WLKShouldRunInProcess_onceToken != -1) {
    dispatch_once(&WLKShouldRunInProcess_onceToken, &__block_literal_global_43);
  }
  return WLKShouldRunInProcess_retVal;
}

id WLKConnectionServerInterface()
{
  BOOL v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F13EC780];
  uint64_t v1 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  id v5 = objc_msgSend(v1, "setWithObjects:", v2, v3, v4, objc_opt_class(), 0);
  [v0 setClasses:v5 forSelector:sel_fetchApplications_ argumentIndex:0 ofReply:1];
  id v6 = (void *)MEMORY[0x1E4F1CA80];
  int v7 = WLKPlistClasses();
  id v8 = [v6 setWithSet:v7];

  [v8 addObject:objc_opt_class()];
  [v0 setClasses:v8 forSelector:sel_readSettingsStore_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v8 forSelector:sel_writeSettingsStore_replyHandler_ argumentIndex:0 ofReply:0];
  uint64_t v9 = WLKPlistClasses();
  [v0 setClasses:v9 forSelector:sel_fetchSettings_ argumentIndex:0 ofReply:1];

  v10 = WLKPlistClasses();
  [v0 setClasses:v10 forSelector:sel_postSettings_replyHandler_ argumentIndex:0 ofReply:0];

  uint64_t v11 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v12 = WLKPlistClasses();
  uint64_t v13 = [v11 setWithSet:v12];

  [v13 addObject:objc_opt_class()];
  [v0 setClasses:v13 forSelector:sel_requestDecoratedNowPlayingSummaries_ argumentIndex:0 ofReply:1];
  uint64_t v14 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v15 = WLKPlistClasses();
  uint64_t v16 = [v14 setWithSet:v15];

  [v16 addObject:objc_opt_class()];
  [v0 setClasses:v16 forSelector:sel_requestNowPlayingSummaries_ argumentIndex:0 ofReply:1];
  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v17 forSelector:sel_fetchSubscriptionData_callerProcessID_completion_ argumentIndex:0 ofReply:1];
  uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = WLKPlistClasses();
  id v20 = [v18 setWithSet:v19];

  [v0 setClasses:v20 forSelector:sel_performSportsFavoritesAction_ids_caller_completion_ argumentIndex:1 ofReply:0];
  [v0 setClasses:v20 forSelector:sel_performSportsFavoritesAction_ids_caller_completion_ argumentIndex:0 ofReply:1];
  uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  char v24 = objc_msgSend(v21, "setWithObjects:", v22, v23, objc_opt_class(), 0);
  [v0 setClasses:v24 forSelector:sel_vppaConsentedBundleIDsWithCompletion_ argumentIndex:0 ofReply:1];

  return v0;
}

id WLKPlistClasses()
{
  if (WLKPlistClasses_onceToken != -1) {
    dispatch_once(&WLKPlistClasses_onceToken, &__block_literal_global_16);
  }
  BOOL v0 = (void *)WLKPlistClasses___plistClasses;

  return v0;
}

void sub_1BA2FD914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t WLKConnectionClientInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F13EC720];
}

void __WLKDefaultSupportPath_block_invoke()
{
  v15[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = CPSharedResourcesDirectory();
  uint64_t v1 = (void *)v0;
  if (v0)
  {
    v15[0] = v0;
    v15[1] = @"Library";
    v15[2] = @"com.apple.WatchListKit";
    uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
    uint64_t v3 = [NSString pathWithComponents:v2];
    uint64_t v4 = (void *)WLKDefaultSupportPath__path;
    WLKDefaultSupportPath__path = v3;

    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([v5 fileExistsAtPath:WLKDefaultSupportPath__path])
    {
      id v14 = 0;
      char v6 = [v5 removeItemAtPath:WLKDefaultSupportPath__path error:&v14];
      id v7 = v14;
      id v8 = v7;
      if ((v6 & 1) == 0 && v7)
      {
        uint64_t v9 = WLKSystemLogObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          __WLKDefaultSupportPath_block_invoke_cold_1(v8, v9);
        }
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v11 = [v10 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.tv.sharedcontainer"];
  uint64_t v12 = [v11 path];
  uint64_t v13 = (void *)WLKDefaultSupportPath__path;
  WLKDefaultSupportPath__path = v12;
}

uint64_t WLKIsRunningTest()
{
  if (WLKIsRunningTest_onceToken != -1) {
    dispatch_once(&WLKIsRunningTest_onceToken, &__block_literal_global_58);
  }
  return WLKIsRunningTest_retVal;
}

void sub_1BA2FE004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WLKDefaultSupportPath()
{
  if (WLKDefaultSupportPath_onceToken != -1) {
    dispatch_once(&WLKDefaultSupportPath_onceToken, &__block_literal_global_50);
  }
  uint64_t v0 = (void *)WLKDefaultSupportPath__path;

  return v0;
}

void __WLKIsRunningTest_block_invoke()
{
  id v1 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v0 = [v1 processName];
  WLKIsRunningTest_retVal = [v0 isEqualToString:@"WatchListKitUnitTestsRunner"];
}

void sub_1BA2FF76C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA2FFAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __WLKBaseURLOverride_block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    NSLog(&cfstr_Wlkbaseurlover.isa, *(void *)(a1 + 32));
  }
}

void sub_1BA3008E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,id a23)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

uint64_t __WLKSystemLogObject_block_invoke()
{
  WLKSystemLogObject_logger = (uint64_t)os_log_create("com.apple.WatchListKit", "System");

  return MEMORY[0x1F41817F8]();
}

uint64_t __WLKSubscriptionSyncLogObject_block_invoke()
{
  WLKSubscriptionSyncLogObject_logger = (uint64_t)os_log_create("com.apple.WatchListKit", "SubscriptionSync");

  return MEMORY[0x1F41817F8]();
}

uint64_t __WLKStartupSignpostLogObject_block_invoke()
{
  WLKStartupSignpostLogObject_logger = (uint64_t)os_log_create("com.apple.WatchListKit", "startup");

  return MEMORY[0x1F41817F8]();
}

uint64_t __WLKPushNotificationsLogObject_block_invoke()
{
  WLKPushNotificationsLogObject_logger = (uint64_t)os_log_create("com.apple.WatchListKit", "PushNotifications");

  return MEMORY[0x1F41817F8]();
}

uint64_t __WLKNetworkingLogObject_block_invoke()
{
  WLKNetworkingLogObject_logger = (uint64_t)os_log_create("com.apple.WatchListKit", "Networking");

  return MEMORY[0x1F41817F8]();
}

uint64_t __WLKNetworkSignpostLogObject_block_invoke()
{
  WLKNetworkSignpostLogObject_logger = (uint64_t)os_log_create("com.apple.WatchListKit", "network");

  return MEMORY[0x1F41817F8]();
}

void __WLKShouldRunInProcess_block_invoke()
{
  if (WLKIsDaemon_onceToken != -1) {
    dispatch_once(&WLKIsDaemon_onceToken, &__block_literal_global_37);
  }
  WLKShouldRunInProcess_retVal = WLKIsDaemon_retVal;
}

void __WLKCurrentProtocolVersion_block_invoke()
{
  uint64_t v0 = WLKProtocolVersionOverride();
  id v1 = (void *)WLKCurrentProtocolVersion_overrideValue;
  WLKCurrentProtocolVersion_overrideValue = v0;

  if (WLKCurrentProtocolVersion_overrideValue) {
    NSLog(&cfstr_Wlknetworkrequ.isa, WLKCurrentProtocolVersion_overrideValue);
  }
}

id WLKProtocolVersionOverride()
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"WLKProtocolVersion", @"com.apple.WatchListKit", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    id v1 = [NSNumber numberWithLong:AppIntegerValue];
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

void __WLKCurrentAPIVersion_block_invoke()
{
  uint64_t v0 = WLKAPIVersionOverride();
  id v1 = (void *)WLKCurrentAPIVersion_overrideValue;
  WLKCurrentAPIVersion_overrideValue = v0;

  if (WLKCurrentAPIVersion_overrideValue) {
    NSLog(&cfstr_Wlknetworkrequ_0.isa, WLKCurrentAPIVersion_overrideValue);
  }
}

id WLKAPIVersionOverride()
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"APIVersionOverride", @"com.apple.WatchListKit", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    id v1 = [NSNumber numberWithLong:AppIntegerValue];
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

void sub_1BA303394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA3035D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __WLKPlistClasses_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  WLKPlistClasses___plistClasses = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);

  return MEMORY[0x1F41817F8]();
}

void sub_1BA303DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA304004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA305C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t WLKRequireNonNilParameter(uint64_t result)
{
  if (!result) {
    return [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", 0 format];
  }
  return result;
}

void WLKRequireParameterIsKindOfClass(void *a1, void *a2)
{
  id v4 = a1;
  id v3 = a2;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must be an instance of %@", v4, v3 format];
  }
}

void sub_1BA3078C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA307C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void WLKFetchIsSportsEnabled(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  uint64_t v2 = WLKSportsEnabledOverride();
  if (v2)
  {
    id v3 = WLKSystemLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v8 = [v2 BOOLValue];
      _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKFeatureEnablerHelpers - Sports enabled *override*: %d", buf, 8u);
    }

    v1[2](v1, [v2 BOOLValue], 0);
  }
  else
  {
    id v4 = +[WLKConfigurationManager sharedInstance];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __WLKFetchIsSportsEnabled_block_invoke;
    v5[3] = &unk_1E620A218;
    char v6 = v1;
    [v4 fetchConfigurationWithCompletionHandler:v5];
  }
}

void __WLKFetchIsSportsEnabled_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5) {
    goto LABEL_8;
  }
  if (v6) {
    goto LABEL_8;
  }
  uint64_t v8 = [v5 features];
  if (!v8) {
    goto LABEL_8;
  }
  uint64_t v9 = (void *)v8;
  v10 = [v5 features];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    uint64_t v12 = [v5 features];
    int v13 = objc_msgSend(v12, "wlk_BOOLForKey:defaultValue:", @"sports", 0);

    id v14 = WLKSystemLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v23[0] = 67109120;
      v23[1] = v13;
      _os_log_impl(&dword_1BA2E8000, v14, OS_LOG_TYPE_DEFAULT, "WLKFeatureEnablerHelpers - Sports enabled from config %d", (uint8_t *)v23, 8u);
    }

    uint64_t v15 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
LABEL_8:
    uint64_t v16 = WLKSystemLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __WLKFetchIsSportsEnabled_block_invoke_cold_1((uint64_t)v7, v16, v17, v18, v19, v20, v21, v22);
    }

    uint64_t v15 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v15();
}

uint64_t WLKIsSportsEnabled(void *a1)
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  int v13 = __Block_byref_object_copy_;
  id v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __WLKIsSportsEnabled_block_invoke;
  v6[3] = &unk_1E620A240;
  uint64_t v8 = &v16;
  uint64_t v9 = &v10;
  id v3 = v2;
  id v7 = v3;
  WLKFetchIsSportsEnabled(v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  if (a1) {
    *a1 = (id) v11[5];
  }
  uint64_t v4 = *((unsigned __int8 *)v17 + 24);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
  return v4;
}

void sub_1BA308814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void __WLKIsSportsEnabled_block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t WLKIsSportsFavoritesEnabled(void *a1)
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  char v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __WLKIsSportsFavoritesEnabled_block_invoke;
  v11[3] = &unk_1E620A240;
  int v13 = &v21;
  id v14 = &v15;
  id v3 = v2;
  uint64_t v12 = v3;
  WLKFetchIsSportsFavoritesEnabled(v11);
  dispatch_time_t v4 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WLKFeatureEnablerHelperDomain" code:1 userInfo:0];
    id v6 = (void *)v16[5];
    v16[5] = v5;

    id v7 = WLKSystemLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKFeatureEnablerHelpers - Timed out getting the config.", v10, 2u);
    }
  }
  if (a1) {
    *a1 = (id) v16[5];
  }
  uint64_t v8 = *((unsigned __int8 *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v8;
}

void sub_1BA308A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void WLKFetchIsSportsFavoritesEnabled(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  dispatch_semaphore_t v2 = WLKSportsFavoritesEnabledOverride();
  if (v2)
  {
    id v3 = WLKSystemLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v8 = [v2 BOOLValue];
      _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKFeatureEnablerHelpers - Sports favorites enabled *override*: %d", buf, 8u);
    }

    v1[2](v1, [v2 BOOLValue], 0);
  }
  else
  {
    dispatch_time_t v4 = +[WLKConfigurationManager sharedInstance];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __WLKFetchIsSportsFavoritesEnabled_block_invoke;
    v5[3] = &unk_1E620A218;
    id v6 = v1;
    [v4 fetchConfigurationWithCompletionHandler:v5];
  }
}

void __WLKIsSportsFavoritesEnabled_block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __WLKFetchIsSportsFavoritesEnabled_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5) {
    goto LABEL_8;
  }
  if (v6) {
    goto LABEL_8;
  }
  uint64_t v8 = [v5 features];
  if (!v8) {
    goto LABEL_8;
  }
  uint64_t v9 = (void *)v8;
  uint64_t v10 = [v5 features];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    uint64_t v12 = [v5 features];
    int v13 = objc_msgSend(v12, "wlk_BOOLForKey:defaultValue:", @"sportsFavorites", 0);

    id v14 = WLKSystemLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v23[0] = 67109120;
      v23[1] = v13;
      _os_log_impl(&dword_1BA2E8000, v14, OS_LOG_TYPE_DEFAULT, "WLKFeatureEnablerHelpers - Sports enabled from config %d", (uint8_t *)v23, 8u);
    }

    uint64_t v15 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
LABEL_8:
    uint64_t v16 = WLKSystemLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __WLKFetchIsSportsEnabled_block_invoke_cold_1((uint64_t)v7, v16, v17, v18, v19, v20, v21, v22);
    }

    uint64_t v15 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v15();
}

uint64_t WLKIsNLSBubbleTipEnabled(void *a1)
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __WLKIsNLSBubbleTipEnabled_block_invoke;
  v11[3] = &unk_1E620A240;
  int v13 = &v21;
  id v14 = &v15;
  id v3 = v2;
  uint64_t v12 = v3;
  WLKFetchIsBubbleTipEnabled(0, v11);
  dispatch_time_t v4 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WLKFeatureEnablerHelperDomain" code:1 userInfo:0];
    id v6 = (void *)v16[5];
    v16[5] = v5;

    id v7 = WLKSystemLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKFeatureEnablerHelpers - Timed out getting the config for feature enablement for bubble tip.", v10, 2u);
    }
  }
  if (a1) {
    *a1 = (id) v16[5];
  }
  uint64_t v8 = *((unsigned __int8 *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v8;
}

void sub_1BA308FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void __WLKIsNLSBubbleTipEnabled_block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id WLKLaunchOptionsForPlayback(int a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F62688]];
  if (a1)
  {
    [v2 addEntriesFromDictionary:&unk_1F13D9968];
    [v2 setObject:&unk_1F13D9968 forKey:*MEMORY[0x1E4F62660]];
  }

  return v2;
}

void sub_1BA30ABC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA30BFA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA30C614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_1BA30D27C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA30D468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WLKIsTVAppEnabled()
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  dispatch_semaphore_t v0 = dispatch_semaphore_create(0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __WLKIsTVAppEnabled_block_invoke;
  v4[3] = &unk_1E620A340;
  id v6 = &v7;
  uint64_t v1 = v0;
  id v5 = v1;
  WLKFetchNowPlayingEnabled(v4);
  dispatch_semaphore_wait(v1, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = *((unsigned __int8 *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v2;
}

void sub_1BA30D564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void WLKFetchNowPlayingEnabled(void *a1)
{
  id v1 = a1;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __WLKFetchNowPlayingEnabled_block_invoke;
  v3[3] = &unk_1E620A368;
  id v4 = v1;
  id v2 = v1;
  WLKFetchNowPlayingEnabledReturningError(v3);
}

intptr_t __WLKIsTVAppEnabled_block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t WLKIsLocationEnabled()
{
  dispatch_semaphore_t v0 = WLKLocationEnabledOverride();
  id v1 = v0;
  if (v0)
  {
    NSLog(&cfstr_Wlkislocatione.isa, [v0 BOOLValue]);
    uint64_t v2 = [v1 BOOLValue];
  }
  else
  {
    id v3 = [MEMORY[0x1E4FA9C70] app];
    id v4 = [v3 BOOLeanForKey:kBagKeyUVSearchLocationEnabled];

    uint64_t v2 = [v4 BOOLValue];
  }

  return v2;
}

void WLKFetchNowPlayingEnabledReturningError(void *a1)
{
  id v1 = a1;
  uint64_t v2 = WLKTVAppEnabledOverride();
  id v3 = v2;
  if (v2)
  {
    NSLog(&cfstr_Wlkisnowplayin.isa, [v2 BOOLValue]);
    id v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
    objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "BOOLValue"), @"lastKnownTVAppEnabledValue");

    if (v1) {
      v1[2](v1, [v3 BOOLValue], 0);
    }
  }
  else
  {
    id v5 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __WLKFetchNowPlayingEnabledReturningError_block_invoke;
    block[3] = &unk_1E620A390;
    uint64_t v7 = v1;
    dispatch_async(v5, block);
  }
}

uint64_t __WLKFetchNowPlayingEnabled_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __WLKFetchNowPlayingEnabledReturningError_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4FA9C70] app];
  id v3 = [v2 cachedBooleanForKey:kBagKeyUVSearchNowPlayingEnabled];

  id v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "Fetch now playing enabled: %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = [v3 BOOLValue];
  if (!v3)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
    [v6 setBool:v5 forKey:@"lastKnownTVAppEnabledValue"];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, void))(v7 + 16))(v7, v5, 0);
  }
}

void WLKFetchPrivacyAcknowledgementURLWithCompletionHandler(void *a1)
{
  id v3 = a1;
  id v1 = [MEMORY[0x1E4FA9C70] app];
  uint64_t v2 = [v1 urlForKey:kBagAcknowledgePrivacyLink];

  if (v3) {
    v3[2](v3, v2, 0);
  }
}

void WLKFetchBaseURLWithCompletion(void *a1)
{
  id v1 = a1;
  uint64_t v2 = WLKBaseURLOverride();
  if (v2)
  {
    if (v1) {
      v1[2](v1, v2, 0);
    }
  }
  else
  {
    id v3 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __WLKFetchBaseURLWithCompletion_block_invoke;
    block[3] = &unk_1E620A390;
    uint64_t v5 = v1;
    dispatch_async(v3, block);
  }
}

void __WLKFetchBaseURLWithCompletion_block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4FA9C70] app];
  id v5 = [v2 cachedURLForKey:kBagKeyUVSearchUtsApiBaseURL];

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = [v5 absoluteString];
    (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, 0);
  }
}

void sub_1BA30E464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA30EDB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA30FDD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t WLKIsSandboxed()
{
  if (WLKIsSandboxed_onceToken != -1) {
    dispatch_once(&WLKIsSandboxed_onceToken, &__block_literal_global_35);
  }
  return WLKIsSandboxed_retVal;
}

uint64_t __WLKIsSandboxed_block_invoke()
{
  getpid();
  uint64_t result = sandbox_check();
  WLKIsSandboxed_retVal = result != 0;
  return result;
}

__CFString *WLKTVAppBundleID()
{
  return @"com.apple.tv";
}

uint64_t WLKIsTool()
{
  if (WLKIsTool_onceToken != -1) {
    dispatch_once(&WLKIsTool_onceToken, &__block_literal_global_47);
  }
  return WLKIsTool_retVal;
}

void __WLKIsTool_block_invoke()
{
  dispatch_semaphore_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 bundleIdentifier];

  WLKIsTool_retVal = [v1 isEqualToString:@"com.apple.watchlisttool"];
}

__CFString *WLKNewsAppBundleID()
{
  return @"com.apple.news";
}

uint64_t WLKIsWatchlisttool()
{
  if (WLKIsWatchlisttool_onceToken != -1) {
    dispatch_once(&WLKIsWatchlisttool_onceToken, &__block_literal_global_64);
  }
  return WLKIsWatchlisttool_retVal;
}

void __WLKIsWatchlisttool_block_invoke()
{
  id v1 = [MEMORY[0x1E4F28F80] processInfo];
  dispatch_semaphore_t v0 = [v1 processName];
  WLKIsWatchlisttool_retVal = [v0 isEqualToString:@"watchlisttool"];
}

uint64_t WLKIsNewsApp()
{
  if (WLKIsNewsApp_onceToken != -1) {
    dispatch_once(&WLKIsNewsApp_onceToken, &__block_literal_global_69);
  }
  return WLKIsNewsApp_retVal;
}

void __WLKIsNewsApp_block_invoke()
{
  dispatch_semaphore_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 bundleIdentifier];

  WLKIsNewsApp_retVal = [v1 isEqualToString:@"com.apple.news"];
}

id fetchedApplicationsCompletion_block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = @"Installed";
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)[a2 copy];
  v18[0] = v11;
  v17[1] = @"Subscribed";
  uint64_t v12 = (void *)[v10 copy];

  v18[1] = v12;
  _DWORD v17[2] = @"Test";
  int v13 = (void *)[v9 copy];

  v18[2] = v13;
  v17[3] = @"NonConforming";
  id v14 = (void *)[v8 copy];

  v18[3] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

void _configureDemoBundles(void *a1, void *a2, void *a3)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = WLKStartupSignpostLogObject();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = WLKStartupSignpostLogObject();
  uint64_t v11 = v10;
  unint64_t v48 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "LibraryCore.configureDemoBundles", "", buf, 2u);
  }
  os_signpost_id_t spid = v9;

  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = (id)CFPreferencesCopyAppValue(@"DemoInstalledBundleIdentifiers", @"com.apple.WatchListKit");
  uint64_t v12 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v52 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v64 != v52) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        if (objc_msgSend(v5, "count", spid))
        {
          uint64_t v16 = 0;
          while (1)
          {
            uint64_t v17 = [v5 objectAtIndexedSubscript:v16];
            uint64_t v18 = [v17 bundleIdentifier];
            char v19 = [v18 isEqualToString:v15];

            if (v19) {
              break;
            }
            if (++v16 >= (unint64_t)[v5 count]) {
              goto LABEL_15;
            }
          }
          [v5 removeObjectAtIndex:v16];
        }
LABEL_15:
        id v20 = [WLKAppProxy alloc];
        uint64_t v21 = WLKAppProxyDictionaryForDemoBundleID(v15, 0);
        uint64_t v22 = [(WLKAppProxy *)v20 initWithDictionary:v21];

        [v5 addObject:v22];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
    }
    while (v13);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v49 = (id)CFPreferencesCopyAppValue(@"DemoSubscribedBundleIdentifiers", @"com.apple.WatchListKit");
  uint64_t v23 = [v49 countByEnumeratingWithState:&v59 objects:v69 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v53 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v60 != v53) {
          objc_enumerationMutation(v49);
        }
        v26 = *(void **)(*((void *)&v59 + 1) + 8 * j);
        if (objc_msgSend(v6, "count", spid))
        {
          uint64_t v27 = 0;
          while (1)
          {
            v28 = [v6 objectAtIndexedSubscript:v27];
            v29 = [v28 bundleIdentifier];
            char v30 = [v29 isEqualToString:v26];

            if (v30) {
              break;
            }
            if (++v27 >= (unint64_t)[v6 count]) {
              goto LABEL_28;
            }
          }
          [v6 removeObjectAtIndex:v27];
        }
LABEL_28:
        v31 = WLKAppProxyDictionaryForDemoBundleID(v26, 0);
        v32 = (void *)[v31 mutableCopy];

        [v32 setObject:@"Demo" forKey:@"WLKAppProxy.subscriptionInfo"];
        v33 = [[WLKAppProxy alloc] initWithDictionary:v32];
        [v6 addObject:v33];
      }
      uint64_t v24 = [v49 countByEnumeratingWithState:&v59 objects:v69 count:16];
    }
    while (v24);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v51 = (id)CFPreferencesCopyAppValue(@"DemoTestBundleIdentifiers", @"com.apple.WatchListKit");
  uint64_t v34 = [v51 countByEnumeratingWithState:&v55 objects:v68 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v54 = *(void *)v56;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v56 != v54) {
          objc_enumerationMutation(v51);
        }
        v37 = *(void **)(*((void *)&v55 + 1) + 8 * k);
        if (objc_msgSend(v7, "count", spid))
        {
          uint64_t v38 = 0;
          while (1)
          {
            v39 = [v7 objectAtIndexedSubscript:v38];
            v40 = [v39 bundleIdentifier];
            char v41 = [v40 isEqualToString:v37];

            if (v41) {
              break;
            }
            if (++v38 >= (unint64_t)[v7 count]) {
              goto LABEL_41;
            }
          }
          [v7 removeObjectAtIndex:v38];
        }
LABEL_41:
        v42 = WLKAppProxyDictionaryForDemoBundleID(v37, 1);
        v43 = (void *)[v42 mutableCopy];

        v44 = [[WLKAppProxy alloc] initWithDictionary:v43];
        [v7 addObject:v44];
      }
      uint64_t v35 = [v51 countByEnumeratingWithState:&v55 objects:v68 count:16];
    }
    while (v35);
  }

  v45 = WLKStartupSignpostLogObject();
  v46 = v45;
  if (v48 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v46, OS_SIGNPOST_INTERVAL_END, spid, "LibraryCore.configureDemoBundles", "", buf, 2u);
  }
}

void sub_1BA3166A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA316DD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1BA3170FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WLKError(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v5)
  {
    id v8 = (void *)[v5 copy];
    [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  if (v6)
  {
    os_signpost_id_t v9 = (void *)[v6 copy];
    [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WLKErrorDomain" code:a1 userInfo:v7];

  return v10;
}

id WLKCancelledError()
{
  return WLKError(-1, 0, @"cancelled");
}

id WLKCancelledErrorWithUnderlyingError(void *a1)
{
  return WLKError(-1, a1, @"cancelled");
}

uint64_t WLKHTTPStatusCodeForAMSError(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 domain];
  uint64_t v3 = (void *)*MEMORY[0x1E4F4DA40];

  if (v2 == v3)
  {
    id v5 = [v1 userInfo];
    id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4DA58]];
    uint64_t v4 = [v6 integerValue];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_1BA31A330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_1BA31E948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WLKAppVisibilityLogObject()
{
  if (WLKAppVisibilityLogObject_onceToken != -1) {
    dispatch_once(&WLKAppVisibilityLogObject_onceToken, &__block_literal_global_7);
  }
  dispatch_semaphore_t v0 = (void *)WLKAppVisibilityLogObject_logger;

  return v0;
}

uint64_t __WLKAppVisibilityLogObject_block_invoke()
{
  WLKAppVisibilityLogObject_logger = (uint64_t)os_log_create("com.apple.WatchListKit", "Visibility");

  return MEMORY[0x1F41817F8]();
}

id WLKPlaybackTrackingLogObject()
{
  if (WLKPlaybackTrackingLogObject_onceToken != -1) {
    dispatch_once(&WLKPlaybackTrackingLogObject_onceToken, &__block_literal_global_13);
  }
  dispatch_semaphore_t v0 = (void *)WLKPlaybackTrackingLogObject_logger;

  return v0;
}

uint64_t __WLKPlaybackTrackingLogObject_block_invoke()
{
  WLKPlaybackTrackingLogObject_logger = (uint64_t)os_log_create("com.apple.WatchListKit", "PlaybackTracking");

  return MEMORY[0x1F41817F8]();
}

id WLKSiriActionsLogObject()
{
  if (WLKSiriActionsLogObject_onceToken != -1) {
    dispatch_once(&WLKSiriActionsLogObject_onceToken, &__block_literal_global_22_0);
  }
  dispatch_semaphore_t v0 = (void *)WLKSiriActionsLogObject_logger;

  return v0;
}

uint64_t __WLKSiriActionsLogObject_block_invoke()
{
  WLKSiriActionsLogObject_logger = (uint64_t)os_log_create("com.apple.WatchListKit", "SiriActions");

  return MEMORY[0x1F41817F8]();
}

void sub_1BA3201AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3202A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id WLKSubscriptionIdentifierForBundleID(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[WLKAppLibrary defaultAppLibrary];
  uint64_t v3 = [v2 subscriptionInfoForBundle:v1];

  uint64_t v4 = [v3 dataUsingEncoding:4];
  if (v4)
  {
    id v9 = 0;
    id v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v9];
    id v6 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v5 objectForKeyedSubscript:@"account"];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v6 = 0;
    id v7 = 0;
  }

  return v7;
}

id WLKAppProxyDictionaryForLSApplicationRecord(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = [v1 bundleIdentifier];
  objc_msgSend(v2, "wlk_setObjectUnlessNil:forKey:", v3, @"WLKAppProxy.bundleIdentifier");

  uint64_t v4 = [v1 shortVersionString];
  objc_msgSend(v2, "wlk_setObjectUnlessNil:forKey:", v4, @"WLKAppProxy.version");

  id v5 = [v1 entitlements];
  id v6 = [v5 objectForKey:@"com.apple.smoot.subscriptionservice" ofClass:objc_opt_class()];

  id v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "BOOLValue"));
  [v2 setObject:v7 forKey:@"WLKAppProxy.isEntitled"];

  if ([v1 isBeta]) {
    [v2 setObject:MEMORY[0x1E4F1CC38] forKey:@"WLKAppProxy.isBeta"];
  }
  if ([v1 isAppStoreVendable]) {
    [v2 setObject:MEMORY[0x1E4F1CC38] forKey:@"WLKAppProxy.isAppStoreVendable"];
  }
  if ([v1 developerType] == 1) {
    [v2 setObject:MEMORY[0x1E4F1CC38] forKey:@"WLKAppProxy.isSystem"];
  }
  id v8 = [v1 infoDictionary];
  id v9 = [v8 objectForKey:@"UISupportsTVApp" ofClass:objc_opt_class()];

  objc_msgSend(v2, "wlk_setObjectUnlessNil:forKey:", v9, @"WLKAppProxy.supportsTVApp");
  id v10 = [v1 iTunesMetadata];
  uint64_t v11 = [v10 storeItemIdentifier];

  if (v11)
  {
    uint64_t v12 = [NSNumber numberWithUnsignedLongLong:v11];
    [v2 setObject:v12 forKeyedSubscript:@"WLKAppProxy.itemID"];
  }
  uint64_t v13 = (void *)[v2 copy];

  return v13;
}

WLKAppProxy *WLKAppProxyForLSApplicationRecord(void *a1)
{
  id v1 = a1;
  id v2 = [WLKAppProxy alloc];
  uint64_t v3 = WLKAppProxyDictionaryForLSApplicationRecord(v1);

  uint64_t v4 = [(WLKAppProxy *)v2 initWithDictionary:v3];

  return v4;
}

id WLKAppProxyDictionaryForDemoBundleID(void *a1, int a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a1;
  id v5 = objc_alloc_init(v3);
  [v5 setObject:v4 forKey:@"WLKAppProxy.bundleIdentifier"];

  [v5 setObject:MEMORY[0x1E4F1CC38] forKey:@"WLKAppProxy.isEntitled"];
  if (a2) {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKey:@"WLKAppProxy.isBeta"];
  }
  id v6 = (void *)[v5 copy];

  return v6;
}

void sub_1BA323D7C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BA3241BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA3244FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3257DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_1BA326418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BA327158(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_1BA327BFC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1BA328320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA32A224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA32A47C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t WLKEqualObjects(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3 == v4)
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
    if (v3 && v4) {
      uint64_t v6 = [v3 isEqual:v4];
    }
  }

  return v6;
}

void sub_1BA32BCF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA32BE4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA32C198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA32C2EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA32CAC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA32DA74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA32F9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void __getASDPurchaseClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("ASDPurchase");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getASDPurchaseClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getASDPurchaseClass_block_invoke_cold_1();
    AppStoreDaemonLibrary();
  }
}

void AppStoreDaemonLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!AppStoreDaemonLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __AppStoreDaemonLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E620B548;
    uint64_t v3 = 0;
    AppStoreDaemonLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  dispatch_semaphore_t v0 = (void *)v1[0];
  if (!AppStoreDaemonLibraryCore_frameworkLibrary)
  {
    dispatch_semaphore_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __AppStoreDaemonLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppStoreDaemonLibraryCore_frameworkLibrary = result;
  return result;
}

void __getASDPurchaseManagerClass_block_invoke(uint64_t a1)
{
  AppStoreDaemonLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("ASDPurchaseManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getASDPurchaseManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getASDPurchaseManagerClass_block_invoke_cold_1();
    __28__WLKSubscriptionStore_init__block_invoke(v2);
  }
}

void sub_1BA3310B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, id a19)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

void sub_1BA3315CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3317F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_1BA333214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA333C88(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BA333F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA334A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_1BA335EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1BA336E78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA3370A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_1BA337E38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
  objc_sync_exit(v23);
  _Unwind_Resume(a1);
}

void sub_1BA3382F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_1BA338480(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA339A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_1BA33A3B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, id a19)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

void sub_1BA33B89C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

void sub_1BA33C948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA33D554(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BA33DE10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA33DF3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BA33E234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA33E648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WLKSystemSettingsDebugOverride()
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SystemSettingsDebug", @"com.apple.WatchListKit", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    uint64_t v1 = [NSNumber numberWithBool:AppBooleanValue != 0];
    NSLog(&cfstr_Wlksystemsetti.isa, v1);
  }
  else
  {
    uint64_t v1 = 0;
  }

  return v1;
}

id WLKSportsEnabledOverride()
{
  Boolean keyExistsAndHasValidFormat = 0;
  WLKTVAppBundleID();
  dispatch_semaphore_t v0 = (__CFString *)objc_claimAutoreleasedReturnValue();
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"WLKSportsEnabledOverride", v0, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    uint64_t v2 = [NSNumber numberWithBool:AppBooleanValue != 0];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id WLKSportsFavoritesEnabledOverride()
{
  Boolean keyExistsAndHasValidFormat = 0;
  WLKTVAppBundleID();
  dispatch_semaphore_t v0 = (__CFString *)objc_claimAutoreleasedReturnValue();
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"WLKSportsFavoritesEnabledOverride", v0, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    uint64_t v2 = [NSNumber numberWithBool:AppBooleanValue != 0];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id WLKLocationEnabledOverride()
{
  Boolean keyExistsAndHasValidFormat = 0;
  WLKTVAppBundleID();
  dispatch_semaphore_t v0 = (__CFString *)objc_claimAutoreleasedReturnValue();
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"WLKLocationEnabledOverride", v0, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    uint64_t v2 = [NSNumber numberWithBool:AppBooleanValue != 0];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id WLKBulletinTimeoutOverride()
{
  Boolean keyExistsAndHasValidFormat = 0;
  dispatch_semaphore_t v0 = WLKTVAppBundleID();
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"BulletinTimeout", v0, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    uint64_t v2 = [NSNumber numberWithLong:AppIntegerValue];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t WLKRetryOnBackgroundTimeOutJSOverride()
{
  if (WLKRetryOnBackgroundTimeOutJSOverride_onceToken != -1) {
    dispatch_once(&WLKRetryOnBackgroundTimeOutJSOverride_onceToken, &__block_literal_global_53);
  }
  dispatch_semaphore_t v0 = (void *)WLKRetryOnBackgroundTimeOutJSOverride_retVal;

  return [v0 BOOLValue];
}

void __WLKRetryOnBackgroundTimeOutJSOverride_block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CB18]);
  uint64_t v0 = [v2 objectForKey:@"RetryOnLongBackgroundedTimeOut"];
  uint64_t v1 = (void *)v0;
  if (v0)
  {
    NSLog(&cfstr_Wlkretryonback.isa, v0);
    objc_storeStrong((id *)&WLKRetryOnBackgroundTimeOutJSOverride_retVal, v1);
  }
}

void sub_1BA342F60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

uint64_t WLKCheckAuthentication(void *a1)
{
  id v2 = +[WLKAccountMonitor sharedInstance];
  uint64_t v3 = [v2 activeAccount];
  char v4 = [v3 isAuthenticated];

  if (a1 && (v4 & 1) == 0)
  {
    *a1 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WLKSportsFavoriteErrorDomain" code:-3 userInfo:0];
  }
  if (v4) {
    return 1;
  }

  return WLKIsRunningTest();
}

id WLKXPCSafeErrorFromError(void *a1)
{
  if (a1)
  {
    uint64_t v1 = (void *)MEMORY[0x1E4F28C58];
    id v2 = a1;
    uint64_t v3 = [v2 domain];
    uint64_t v4 = [v2 code];

    id v5 = [v1 errorWithDomain:v3 code:v4 userInfo:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void sub_1BA345DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA346540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA3476D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1BA347C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1BA348CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA34905C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA34B220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _WLKDeepReplacement(void *a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = ___WLKDeepReplacement_block_invoke;
    v25[3] = &unk_1E620C478;
    id v9 = v8;
    id v26 = v9;
    id v10 = v6;
    id v27 = v10;
    id v11 = v7;
    id v28 = v11;
    [v5 enumerateKeysAndObjectsUsingBlock:v25];
    uint64_t v12 = [v9 objectForKey:v10];

    if (v12) {
      [v9 setObject:v11 forKey:v10];
    }
    uint64_t v13 = [v9 copy];

    id v14 = v26;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_15;
    }
    id v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v14 = v5;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = _WLKDeepReplacement(*(void *)(*((void *)&v21 + 1) + 8 * i), v6, v7);
          objc_msgSend(v9, "addObject:", v19, (void)v21);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v16);
    }

    uint64_t v13 = [v9 copy];
  }

  id v5 = (id)v13;
LABEL_15:

  return v5;
}

void sub_1BA34C238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA34D948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __WLKFetchIsSportsEnabled_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t __getASDPurchaseClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getASDPurchaseManagerClass_block_invoke_cold_1(v0);
}

void __getASDPurchaseManagerClass_block_invoke_cold_1()
{
}

void __WLKDefaultSupportPath_block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 localizedDescription];
  int v4 = 136315138;
  uint64_t v5 = [v3 UTF8String];
  _os_log_error_impl(&dword_1BA2E8000, a2, OS_LOG_TYPE_ERROR, "WLKPathUtilities - Failed to remove previous DefaultSupportPath location file with error: %s", (uint8_t *)&v4, 0xCu);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

uint64_t CFHashBytes()
{
  return MEMORY[0x1F40D7BA8]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t CRCopyRestrictionsDictionary()
{
  return MEMORY[0x1F4109918]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1F417CE10]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFURLStorageSessionCopyCache()
{
  return MEMORY[0x1F40D5780]();
}

uint64_t _CFURLStorageSessionCreate()
{
  return MEMORY[0x1F40D5790]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x1F40F2870]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x1F40F2878]();
}

uint64_t nw_activity_complete_with_reason_and_underlying_error()
{
  return MEMORY[0x1F40F2880]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x1F40F2898]();
}

uint64_t nw_activity_is_activated()
{
  return MEMORY[0x1F40F28D0]();
}

uint64_t nw_activity_is_complete()
{
  return MEMORY[0x1F40F28D8]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}