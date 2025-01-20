@interface NSItemProvider
- (void)_generateFileURLDataForCachingFileAtURL:(void *)a3 typeIdentifier:(void *)a4 completionHandler:;
@end

@implementation NSItemProvider

id __99__NSItemProvider_UIKitAdditions__registerFileProviderItemForTypeIdentifier_visibility_loadHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__NSItemProvider_UIKitAdditions__registerFileProviderItemForTypeIdentifier_visibility_loadHandler___block_invoke_2;
  v10[3] = &unk_1E52FF360;
  id v11 = v4;
  v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  id v7 = v4;
  v8 = v6(v5, v10);

  return v8;
}

void __99__NSItemProvider_UIKitAdditions__registerFileProviderItemForTypeIdentifier_visibility_loadHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if (!v9 || a3)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v5 = [MEMORY[0x1E4F28D80] resultWithError:a3];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v5);
  }
  else
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F881E8]) initWithFPItem:v9];
    v6 = [v5 nsURLWrapper];
    id v7 = [MEMORY[0x1E4F28D80] resultWithData:0 urlWrapper:v6 cleanupHandler:0 error:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __66__NSItemProvider_UIKitAdditions___highestFidelityClassForLoading___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 lastObject];
  v6 = [v4 lastObject];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __80__NSItemProvider_UIKitAdditions___loadObjectOfClass_userInfo_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  id v9 = v6;
  if (v5 && !v6)
  {
    v10 = *(void **)(a1 + 32);
    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 64);
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v19 = 0;
      v13 = (id *)&v19;
      uint64_t v14 = [v10 newObjectOfClass:v11 fromData:v5 ofType:v12 outError:&v19];
    }
    else
    {
      if (!*(unsigned char *)(a1 + 72))
      {
        uint64_t v8 = 0;
        id v9 = 0;
        goto LABEL_8;
      }
      v15 = *(void **)(a1 + 64);
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v17 = *(void *)(a1 + 48);
      uint64_t v18 = 0;
      v13 = (id *)&v18;
      uint64_t v14 = [v15 _objectWithItemProviderData:v5 typeIdentifier:v16 userInfo:v17 error:&v18];
    }
    uint64_t v8 = (void *)v14;
    id v9 = *v13;
  }
LABEL_8:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __78__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationIfPossible__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:a2 allowUndeclared:1];
  if ([v6 conformsToType:*MEMORY[0x1E4F444F8]])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

id __112__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationForOpenInPlaceWithTypeIdentifier_visibility___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __112__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationForOpenInPlaceWithTypeIdentifier_visibility___block_invoke_2;
    v8[3] = &unk_1E52FF420;
    id v9 = v5;
    id v10 = WeakRetained;
    id v11 = v3;
    id v6 = [WeakRetained loadInPlaceFileRepresentationForTypeIdentifier:v9 completionHandler:v8];
  }
  else
  {
    (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
    id v6 = 0;
  }

  return v6;
}

void __112__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationForOpenInPlaceWithTypeIdentifier_visibility___block_invoke_2(uint64_t a1, void *a2, char a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (v7)
  {
    if (a3)
    {
      id v9 = v7;
      id v10 = [(id)*MEMORY[0x1E4F443B8] identifier];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __112__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationForOpenInPlaceWithTypeIdentifier_visibility___block_invoke_108;
      v18[3] = &unk_1E52EC188;
      id v19 = v9;
      id v20 = *(id *)(a1 + 48);
      id v11 = v9;
      id v12 = (id)[v11 loadDataWithTypeIdentifier:v10 forItemProviderCompletionHandler:v18];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v22 = v17;
        _os_log_error_impl(&dword_1853B0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not load item provider file representation for type “%{public}@” in place. Falling back to copying.", buf, 0xCu);
      }
      -[NSItemProvider _generateFileURLDataForCachingFileAtURL:typeIdentifier:completionHandler:](*(void *)(a1 + 40), v7, *(void **)(a1 + 32), *(void **)(a1 + 48));
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v16;
      __int16 v23 = 2114;
      id v24 = v8;
      _os_log_error_impl(&dword_1853B0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not load item provider file representation for type “%{public}@”. Error: %{public}@", buf, 0x16u);
    }
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = *(void (**)(uint64_t, void, id))(v13 + 16);
    id v15 = v8;
    v14(v13, 0, v15);
  }
}

- (void)_generateFileURLDataForCachingFileAtURL:(void *)a3 typeIdentifier:(void *)a4 completionHandler:
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    if (qword_1EB2620D8 != -1) {
      dispatch_once(&qword_1EB2620D8, &__block_literal_global_113_5);
    }
    uint64_t v49 = 0;
    v50 = (id *)&v49;
    uint64_t v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__146;
    v53 = __Block_byref_object_dispose__146;
    id v54 = 0;
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x3032000000;
    v47[3] = __Block_byref_object_copy__146;
    v47[4] = __Block_byref_object_dispose__146;
    id v48 = 0;
    id v10 = qword_1EB2620C8;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke_118;
    block[3] = &unk_1E52FF4C8;
    v45 = v47;
    block[4] = a1;
    id v11 = v8;
    id v44 = v11;
    v46 = &v49;
    dispatch_sync(v10, block);
    id v12 = v50[5];
    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v12;
        _os_log_impl(&dword_1853B0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Returning cached url for sharing: %@", buf, 0xCu);
      }
    }
    else if (v7)
    {
      uint64_t v13 = _UITemporaryFolderURL(@"com.apple.uikit.itemprovider.temporary");
      if (v13)
      {
        uint64_t v14 = [v7 lastPathComponent];
        id v15 = [v13 URLByAppendingPathComponent:v14];

        if (v15 && !_UICloneFile(v7, v15))
        {
          objc_storeStrong(v50 + 5, v15);
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v13;
            _os_log_impl(&dword_1853B0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Caching temporary files for sharing at %@", buf, 0xCu);
          }
          uint64_t v17 = qword_1EB2620C8;
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke_124;
          v39[3] = &unk_1E52FF478;
          v41 = v47;
          v42 = &v49;
          id v40 = v11;
          dispatch_sync(v17, v39);
          uint64_t v18 = dispatch_get_global_queue(9, 0);
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v56 = __Block_byref_object_copy__125;
          v57 = __Block_byref_object_dispose__126;
          id v58 = 0;
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke_127;
          aBlock[3] = &unk_1E52FF4C8;
          v37 = v47;
          v38 = buf;
          id v35 = v18;
          id v36 = v13;
          id v19 = v18;
          id v20 = _Block_copy(aBlock);
          v21 = _Block_copy(v20);
          uint64_t v22 = *(void **)(*(void *)&buf[8] + 40);
          *(void *)(*(void *)&buf[8] + 40) = v21;

          dispatch_time_t v23 = dispatch_time(0, (uint64_t)(*(double *)&qword_1EB2620D0 * 1000000000.0));
          dispatch_after(v23, v19, v20);

          _Block_object_dispose(buf, 8);
          uint64_t v16 = v40;
        }
        else
        {
          uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v16 removeItemAtURL:v13 error:0];
        }
      }
    }
    id v24 = v50[5];
    if (v24)
    {
      id v33 = 0;
      id v25 = (id)objc_msgSend(v24, "ui_issueReadSandboxExtensionWithError:", &v33);
      id v26 = v33;
      if (v26 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v30 = v50[5];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v26;
        _os_log_error_impl(&dword_1853B0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Cannot issue sandbox extension to temporary file at %@ Error: %@. Sharing anwyay.", buf, 0x16u);
      }
      id v27 = v50[5];
      v28 = [(id)*MEMORY[0x1E4F443B8] identifier];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke_129;
      v31[3] = &unk_1E52FF4F0;
      id v32 = v9;
      id v29 = (id)[v27 loadDataWithTypeIdentifier:v28 forItemProviderCompletionHandler:v31];
    }
    else
    {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }

    _Block_object_dispose(v47, 8);
    _Block_object_dispose(&v49, 8);
  }
}

void __112__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationForOpenInPlaceWithTypeIdentifier_visibility___block_invoke_108(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  LODWORD(v5) = [v5 startAccessingSecurityScopedResource];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  if (v5)
  {
    id v8 = *(void **)(a1 + 32);
    [v8 stopAccessingSecurityScopedResource];
  }
}

void __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v1 = dispatch_queue_create("UIKit file url representation cache queue", v0);
  v2 = (void *)qword_1EB2620C8;
  qword_1EB2620C8 = (uint64_t)v1;

  id v3 = _UIKitUserDefaults();
  id v8 = [v3 objectForKey:@"TemporaryFileURLCacheDeletionTimeInterval"];

  id v4 = v8;
  uint64_t v5 = 0x4072C00000000000;
  if (v8)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v4 = v8;
    if (isKindOfClass)
    {
      [v8 doubleValue];
      id v4 = v8;
      uint64_t v5 = v7;
    }
  }
  qword_1EB2620D0 = v5;
}

void __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke_118(uint64_t a1)
{
  uint64_t v2 = objc_getAssociatedObject(*(id *)(a1 + 32), &_generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___cacheStateKey);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v5)
  {
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    objc_setAssociatedObject(*(id *)(a1 + 32), &_generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___cacheStateKey, *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), (void *)0x301);
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  id v13 = [v5 typeIdentifier];
  if ([v13 isEqualToString:*(void *)(a1 + 40)])
  {
    uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) url];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    id v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:*(double *)&qword_1EB2620D0];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setExpirationDate:v12];
  }
}

uint64_t __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke_124(void *a1)
{
  [*(id *)(*(void *)(a1[5] + 8) + 40) setUrl:*(void *)(*(void *)(a1[6] + 8) + 40)];
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void **)(*(void *)(a1[5] + 8) + 40);
  return [v3 setTypeIdentifier:v2];
}

void __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke_127(uint64_t a1)
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  uint64_t v2 = qword_1EB2620C8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke_2;
  block[3] = &unk_1E52FF4A0;
  long long v7 = *(_OWORD *)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  id v8 = &v9;
  id v6 = *(id *)(a1 + 40);
  dispatch_sync(v2, block);
  if (*((unsigned char *)v10 + 24))
  {
    uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v3 removeItemAtURL:*(void *)(a1 + 40) error:0];
  }
  _Block_object_dispose(&v9, 8);
}

void __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) expirationDate];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 timeIntervalSinceNow];
    if (v4 > 0.0)
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        dispatch_time_t v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
        dispatch_after(v5, *(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1853B0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Deleting temporary files for sharing at %@", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setUrl:0];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setTypeIdentifier:0];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setExpirationDate:0];
  }
}

uint64_t __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke_129(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __131__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationByCopyingAndCachingRepresentationWithTypeIdentifier_visibility___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_time_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __131__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationByCopyingAndCachingRepresentationWithTypeIdentifier_visibility___block_invoke_2;
    v9[3] = &unk_1E52FF518;
    v9[4] = WeakRetained;
    id v10 = v6;
    id v11 = v3;
    int v7 = [v5 loadFileRepresentationForTypeIdentifier:v10 completionHandler:v9];
  }
  else
  {
    (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
    int v7 = 0;
  }

  return v7;
}

void __131__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationByCopyingAndCachingRepresentationWithTypeIdentifier_visibility___block_invoke_2(uint64_t a1, void *a2)
{
}

@end