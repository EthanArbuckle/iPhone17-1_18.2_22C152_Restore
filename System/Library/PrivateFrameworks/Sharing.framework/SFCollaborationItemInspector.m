@interface SFCollaborationItemInspector
+ (id)_collaborationItemForFileURL:(id)a3 itemProvider:(id)a4 activityItem:(id)a5 service:(id)a6 managedFileURL:(id)a7;
+ (id)_collaborationItemFromItemProvider:(id)a3 forActivityItem:(id)a4 service:(id)a5 shouldInspectFiles:(BOOL)a6 managedFileURL:(id)a7 isURLProviderSupported:(BOOL)a8;
+ (id)inspectActivityItemValue:(id)a3 activityItem:(id)a4 service:(id)a5 shouldInspectFiles:(BOOL)a6 managedFileURL:(id)a7 isURLProviderSupported:(BOOL)a8;
@end

@implementation SFCollaborationItemInspector

+ (id)inspectActivityItemValue:(id)a3 activityItem:(id)a4 service:(id)a5 shouldInspectFiles:(BOOL)a6 managedFileURL:(id)a7 isURLProviderSupported:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a6;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v17 = share_sheet_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    *(_DWORD *)buf = 138740739;
    id v29 = v13;
    __int16 v30 = 2114;
    v31 = v19;
    __int16 v32 = 2117;
    id v33 = v14;
    __int16 v34 = 2112;
    v35 = v21;
    _os_log_impl(&dword_1A5389000, v17, OS_LOG_TYPE_DEFAULT, "Inspect activityItemValue:%{sensitive}@, activityItemValueType:%{public}@ activityItem:%{sensitive}@ activityItemType:%@", buf, 0x2Au);
  }
  if (!v13) {
    id v13 = v14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = v13;
    if ([v22 hasItemConformingToTypeIdentifier:@"com.apple.group-activities.activity"])
    {
      id v23 = 0;
      goto LABEL_12;
    }
    uint64_t v24 = +[SFCollaborationItemInspector _collaborationItemFromItemProvider:v22 forActivityItem:v14 service:v15 shouldInspectFiles:v10 managedFileURL:v16 isURLProviderSupported:v8];
  }
  else
  {
    if (!v10)
    {
      id v23 = 0;
      goto LABEL_15;
    }
    id v22 = +[SFCollaborationUtilities urlFromActivityItem:v13 allowsLoading:1];
    uint64_t v24 = +[SFCollaborationItemInspector _collaborationItemForFileURL:v22 itemProvider:0 activityItem:v14 service:v15 managedFileURL:v16];
  }
  id v23 = (id)v24;
LABEL_12:

  if (v23)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __135__SFCollaborationItemInspector_inspectActivityItemValue_activityItem_service_shouldInspectFiles_managedFileURL_isURLProviderSupported___block_invoke;
    v26[3] = &unk_1E5BBE270;
    id v23 = v23;
    id v27 = v23;
    +[SFCollaborationUtilities isShareOwnerOrAdminForCollaborationItem:v23 service:v15 completionHandler:v26];
  }
LABEL_15:

  return v23;
}

void __135__SFCollaborationItemInspector_inspectActivityItemValue_activityItem_service_shouldInspectFiles_managedFileURL_isURLProviderSupported___block_invoke(uint64_t a1, int a2, unsigned int a3)
{
  id v4 = [NSNumber numberWithBool:a2 | a3];
  [*(id *)(a1 + 32) setCanAddPeople:v4];
}

+ (id)_collaborationItemForFileURL:(id)a3 itemProvider:(id)a4 activityItem:(id)a5 service:(id)a6 managedFileURL:(id)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ([v11 isFileURL])
  {
    id v16 = gelato_sharing_log();
    os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, v11);

    v18 = gelato_sharing_log();
    v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A5389000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "CollaborationItemForFileURL", "", (uint8_t *)&buf, 2u);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v36 = 0x2020000000;
    char v37 = 1;
    if (([v11 isiWorkDocument] & 1) == 0)
    {
      v20 = share_sheet_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v31 = 138412290;
        id v32 = v11;
        _os_log_impl(&dword_1A5389000, v20, OS_LOG_TYPE_DEFAULT, "request default share mode for URL:%@", v31, 0xCu);
      }

      if (objc_opt_respondsToSelector())
      {
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __110__SFCollaborationItemInspector__collaborationItemForFileURL_itemProvider_activityItem_service_managedFileURL___block_invoke;
        v28[3] = &unk_1E5BBE298;
        id v29 = v11;
        p_long long buf = &buf;
        [v14 requestDefaultShareModeCollaborationForURL:v29 completionHandler:v28];
      }
    }
    v21 = share_sheet_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
        id v22 = @"YES";
      }
      else {
        id v22 = @"NO";
      }
      *(_DWORD *)v31 = 138412546;
      id v32 = v11;
      __int16 v33 = 2112;
      __int16 v34 = v22;
      _os_log_impl(&dword_1A5389000, v21, OS_LOG_TYPE_DEFAULT, "defaultShareModeCollaboration for fileURL:%@ = %@", v31, 0x16u);
    }

    id v23 = +[SFCollaborationItem collaborationItemForFileURL:v11 itemProvider:v12 activityItem:v13 defaultCollaboration:*(unsigned __int8 *)(*((void *)&buf + 1) + 24) managedFileURL:v15];
    uint64_t v24 = gelato_sharing_log();
    v25 = v24;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)v31 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A5389000, v25, OS_SIGNPOST_INTERVAL_END, v17, "CollaborationItemForFileURL", "", v31, 2u);
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v26 = share_sheet_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138477827;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1A5389000, v26, OS_LOG_TYPE_DEFAULT, "URL is not a fileURL: %{private}@", (uint8_t *)&buf, 0xCu);
    }

    id v23 = 0;
  }

  return v23;
}

void __110__SFCollaborationItemInspector__collaborationItemForFileURL_itemProvider_activityItem_service_managedFileURL___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = share_sheet_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __110__SFCollaborationItemInspector__collaborationItemForFileURL_itemProvider_activityItem_service_managedFileURL___block_invoke_cold_1(a1, (uint64_t)v5, v6);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

+ (id)_collaborationItemFromItemProvider:(id)a3 forActivityItem:(id)a4 service:(id)a5 shouldInspectFiles:(BOOL)a6 managedFileURL:(id)a7 isURLProviderSupported:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a6;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  os_signpost_id_t v17 = gelato_sharing_log();
  os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v17, v13);

  v19 = gelato_sharing_log();
  v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "CollaborationItemForItemProvider", "", buf, 2u);
  }

  v21 = +[SFCollaborationItem collaborationItemForItemProvider:v13 activityItem:v14 isURLProviderSupported:v8];
  if (!v21 && v10)
  {
    *(void *)long long buf = 0;
    v44 = buf;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__2;
    v47 = __Block_byref_object_dispose__2;
    id v48 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = &v37;
    uint64_t v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__2;
    v41 = __Block_byref_object_dispose__2;
    id v42 = 0;
    dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __148__SFCollaborationItemInspector__collaborationItemFromItemProvider_forActivityItem_service_shouldInspectFiles_managedFileURL_isURLProviderSupported___block_invoke;
    v33[3] = &unk_1E5BBE2C0;
    v35 = buf;
    uint64_t v36 = &v37;
    id v23 = v22;
    __int16 v34 = v23;
    [v13 loadFileURLRequiringOpenInPlace:1 completionHandler:v33];
    uint64_t v24 = v23;
    dispatch_time_t v25 = dispatch_time(0, 2000000000);
    intptr_t v26 = dispatch_semaphore_wait(v24, v25);

    if (v26) {
      __148__SFCollaborationItemInspector__collaborationItemFromItemProvider_forActivityItem_service_shouldInspectFiles_managedFileURL_isURLProviderSupported___block_invoke_2();
    }
    uint64_t v27 = *((void *)v44 + 5);
    if (v27)
    {
      v21 = +[SFCollaborationItemInspector _collaborationItemForFileURL:v27 itemProvider:v13 activityItem:v14 service:v15 managedFileURL:v16];
    }
    else
    {
      v28 = share_sheet_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = v38[5];
        *(_DWORD *)v49 = 138412546;
        id v50 = v13;
        __int16 v51 = 2112;
        uint64_t v52 = v29;
        _os_log_impl(&dword_1A5389000, v28, OS_LOG_TYPE_DEFAULT, "Couldn't load in-place file URL for Collaboration Item Provider:%@ : %@", v49, 0x16u);
      }

      v21 = 0;
    }

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(buf, 8);
  }
  __int16 v30 = gelato_sharing_log();
  v31 = v30;
  if (v18 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v30))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v31, OS_SIGNPOST_INTERVAL_END, v18, "CollaborationItemForItemProvider", "", buf, 2u);
  }

  return v21;
}

void __148__SFCollaborationItemInspector__collaborationItemFromItemProvider_forActivityItem_service_shouldInspectFiles_managedFileURL_isURLProviderSupported___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v11 = a2;
  if ([v11 isFileURL]) {
    v7 = v11;
  }
  else {
    v7 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;
  id v10 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __148__SFCollaborationItemInspector__collaborationItemFromItemProvider_forActivityItem_service_shouldInspectFiles_managedFileURL_isURLProviderSupported___block_invoke_2()
{
  v0 = share_sheet_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __148__SFCollaborationItemInspector__collaborationItemFromItemProvider_forActivityItem_service_shouldInspectFiles_managedFileURL_isURLProviderSupported___block_invoke_2_cold_1(v0);
  }
}

void __110__SFCollaborationItemInspector__collaborationItemForFileURL_itemProvider_activityItem_service_managedFileURL___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1A5389000, log, OS_LOG_TYPE_ERROR, "Failed to request default share mode for fileURL:%@ error:%@", (uint8_t *)&v4, 0x16u);
}

void __148__SFCollaborationItemInspector__collaborationItemFromItemProvider_forActivityItem_service_shouldInspectFiles_managedFileURL_isURLProviderSupported___block_invoke_2_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134217984;
  uint64_t v2 = 0x4000000000000000;
  _os_log_error_impl(&dword_1A5389000, log, OS_LOG_TYPE_ERROR, "Could not load URL from the item provider for collaboration even after waiting for %.1f seconds.", (uint8_t *)&v1, 0xCu);
}

@end