@interface NSItemProvider
@end

@implementation NSItemProvider

id __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_2;
  v10[3] = &unk_265585FD0;
  id v13 = v5;
  v6 = *(void **)(a1 + 32);
  id v11 = v6;
  id v12 = *(id *)(a1 + 40);
  id v7 = v5;
  v8 = objc_msgSend(v6, "loadWithOptions_v2:completionHandler:", a2, v10);

  return v8;
}

void __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_2(id *a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 data];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = NSURL;
    id v7 = [v3 data];
    v8 = [a1[4] typeIdentifier];
    id v30 = 0;
    v9 = [v6 objectWithItemProviderData:v7 typeIdentifier:v8 error:&v30];
    id v10 = v30;
    id v11 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    if (v12)
    {
      v21 = [v12 scheme];
      if (([v21 isEqualToString:@"http"] & 1) != 0
        || ([v21 isEqualToString:@"https"] & 1) != 0)
      {
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_9;
        v26[3] = &unk_265585FA8;
        id v29 = a1[6];
        id v27 = v3;
        id v28 = a1[5];
        objc_msgSend(v12, "_wp_removeTrackingInformation:", v26);
      }
      else
      {
        v23 = WPOSLogAPI();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2617B2000, v23, OS_LOG_TYPE_INFO, "Skipping URL returned from item provider (scheme is not HTTP-family)", buf, 2u);
        }
        (*((void (**)(void))a1[6] + 2))();
      }
    }
    else
    {
      v22 = (id)WPOSLogAPI();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v24 = [v3 data];
        uint64_t v25 = [v24 length];
        *(_DWORD *)buf = 134218242;
        uint64_t v32 = v25;
        __int16 v33 = 2112;
        id v34 = v10;
        _os_log_error_impl(&dword_2617B2000, v22, OS_LOG_TYPE_ERROR, "Failed to deserialize NSURL from item provider data (%zu bytes) with error: %@", buf, 0x16u);
      }
      (*((void (**)(void))a1[6] + 2))();
    }
  }
  else
  {
    id v13 = WPOSLogAPI();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_2_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_10;
    v14[3] = &unk_265585F80;
    uint64_t v4 = *(void *)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 32);
    id v5 = (id)[v3 loadDataWithTypeIdentifier:v4 forItemProviderCompletionHandler:v14];
  }
  else
  {
    v6 = WPOSLogAPI();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_9_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 length])
  {
    uint64_t v7 = WPOSLogAPI();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_10_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = (void *)[*(id *)(a1 + 32) copyWithData:v5 urlWrapper:0 cleanupHandler:0 error:0];
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
  }
}

void __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_9_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_10_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end