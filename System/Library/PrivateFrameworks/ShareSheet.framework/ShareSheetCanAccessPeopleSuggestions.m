@interface ShareSheetCanAccessPeopleSuggestions
@end

@implementation ShareSheetCanAccessPeopleSuggestions

void ___ShareSheetCanAccessPeopleSuggestions_block_invoke()
{
  CFAllocatorRef Default = CFAllocatorGetDefault();
  v1 = SecTaskCreateFromSelf(Default);
  if (v1)
  {
    v2 = v1;
    id v3 = (id)SecTaskCopyValueForEntitlement(v1, @"com.apple.sharesheet.allow-suggestions", 0);
    CFRelease(v2);
    _ShareSheetCanAccessPeopleSuggestions_hostHasEntitlement = [v3 BOOLValue];
  }
}

void ___ShareSheetCanAccessPeopleSuggestions_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = v5;
  if (a3)
  {
    v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      ___ShareSheetCanAccessPeopleSuggestions_block_invoke_2_cold_2(a3, v7);
    }
  }
  else
  {
    id v8 = v5;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    v9 = (uint64_t (*)(id))gettcc_authorization_record_get_authorization_rightSymbolLoc_ptr;
    v21 = gettcc_authorization_record_get_authorization_rightSymbolLoc_ptr;
    if (!gettcc_authorization_record_get_authorization_rightSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __gettcc_authorization_record_get_authorization_rightSymbolLoc_block_invoke;
      v23 = (const char *)&unk_1E5A216E8;
      v24 = &v18;
      v10 = (void *)TCCLibrary();
      v11 = dlsym(v10, "tcc_authorization_record_get_authorization_right");
      *(void *)(v24[1] + 24) = v11;
      gettcc_authorization_record_get_authorization_rightSymbolLoc_ptr = *(_UNKNOWN **)(v24[1] + 24);
      v9 = (uint64_t (*)(id))v19[3];
    }
    _Block_object_dispose(&v18, 8);
    if (!v9)
    {
      __85___UIActivityApplicationExtensionsCache__startPrecachingContinuousExtensionDiscovery__block_invoke_cold_1();
      __break(1u);
    }
    uint64_t v12 = v9(v8);

    unint64_t v13 = v12 & 0xFFFFFFFFFFFFFFFELL;
    BOOL v14 = (v12 & 0xFFFFFFFFFFFFFFFELL) == 2;
    v15 = share_sheet_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = "no";
      uint64_t v17 = *(void *)(a1 + 40);
      if (v13 == 2) {
        v16 = "yes";
      }
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = "_ShareSheetCanAccessPeopleSuggestions_block_invoke";
      *(_WORD *)&buf[22] = 2082;
      v23 = v16;
      _os_log_impl(&dword_1A0AD8000, v15, OS_LOG_TYPE_INFO, "TCC authorization request for service name:%@ (%{public}s) was granted: %{public}s", buf, 0x20u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v14;
  }
}

void ___ShareSheetCanAccessPeopleSuggestions_block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136446466;
  id v3 = "_ShareSheetCanAccessPeopleSuggestions_block_invoke_2";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_ERROR, "TCC authorization request (%{public}s) failed: %{public}@", (uint8_t *)&v2, 0x16u);
}

@end