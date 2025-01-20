@interface NSItemProvider
@end

@implementation NSItemProvider

void __113__NSItemProvider_MobileSafariFrameworkExtras__safari_loadObjectsFromItemProviders_usingLoader_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  v6 = *(void **)(a1 + 32);
  v7 = [NSNumber numberWithUnsignedInteger:a3];
  [v6 setObject:v8 forKeyedSubscript:v7];

  objc_sync_exit(v5);
}

void __113__NSItemProvider_MobileSafariFrameworkExtras__safari_loadObjectsFromItemProviders_usingLoader_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(NSObject **)(a1 + 32);
  id v6 = a2;
  dispatch_group_enter(v5);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __113__NSItemProvider_MobileSafariFrameworkExtras__safari_loadObjectsFromItemProviders_usingLoader_completionHandler___block_invoke_3;
  v8[3] = &unk_1E54ECBB0;
  v7 = *(void (**)(id, void *))(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = a3;
  id v9 = *(id *)(a1 + 32);
  v7(v6, v8);
}

void __113__NSItemProvider_MobileSafariFrameworkExtras__safari_loadObjectsFromItemProviders_usingLoader_completionHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v2);
}

void __113__NSItemProvider_MobileSafariFrameworkExtras__safari_loadObjectsFromItemProviders_usingLoader_completionHandler___block_invoke_4(uint64_t a1)
{
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  v2 = objc_msgSend(MEMORY[0x1E4F1C978], "safari_arrayFromDictionaryOfObjectsByIndex:", *(void *)(a1 + 40));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __113__NSItemProvider_MobileSafariFrameworkExtras__safari_loadObjectsFromItemProviders_usingLoader_completionHandler___block_invoke_5;
  v5[3] = &unk_1E54EA478;
  id v3 = *(id *)(a1 + 48);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __113__NSItemProvider_MobileSafariFrameworkExtras__safari_loadObjectsFromItemProviders_usingLoader_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __92__NSItemProvider_MobileSafariFrameworkExtras__safari_loadObjectOfClasses_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = WBS_LOG_CHANNEL_PREFIXItemProvider();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __92__NSItemProvider_MobileSafariFrameworkExtras__safari_loadObjectOfClasses_completionHandler___block_invoke_cold_2(v8, v6);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __92__NSItemProvider_MobileSafariFrameworkExtras__safari_loadObjectOfClasses_completionHandler___block_invoke_cold_1(v8);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __101__NSItemProvider_MobileSafariFrameworkExtras__safari_registerFileRepresentationForQuickLookDocument___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 saveToFileIfNeeded];
  id v5 = [*(id *)(a1 + 32) savedURLWithProperExtension];
  v4[2](v4, v5, 1, 0);

  return 0;
}

void __92__NSItemProvider_MobileSafariFrameworkExtras__safari_loadObjectOfClasses_completionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  int v2 = 138543362;
  uint64_t v3 = objc_opt_class();
  _os_log_debug_impl(&dword_18C354000, v1, OS_LOG_TYPE_DEBUG, "Loaded item of class: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __92__NSItemProvider_MobileSafariFrameworkExtras__safari_loadObjectOfClasses_completionHandler___block_invoke_cold_2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_18C354000, v3, OS_LOG_TYPE_ERROR, "Could not load item: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end