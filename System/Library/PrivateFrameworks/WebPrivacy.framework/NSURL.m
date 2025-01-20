@interface NSURL
@end

@implementation NSURL

void __57__NSURL_WebPrivacyExtras___wp_removeTrackingInformation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v7 = a3;
  if (v7)
  {
    v8 = WPOSLogAPI();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __57__NSURL_WebPrivacyExtras___wp_removeTrackingInformation___block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  uint64_t v15 = *(void *)(a1 + 40);
  v16 = WebPrivacy::filterUsingCachedParameters(*(WebPrivacy **)(a1 + 32), v6);
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
}

void __57__NSURL_WebPrivacyExtras___wp_removeTrackingInformation___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end