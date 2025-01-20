@interface PLSyndicationResourcePrefetchEngine
- (PLSyndicationResourcePrefetchEngine)initWithDelegate:(id)a3;
- (PLSyndicationResourcePrefetchEngineDelegate)delegate;
- (id)_fetchDownloadThrottlingDateAndClearIfNeededWithManagedObjectContext:(id)a3;
- (id)_resourcesForPrefetchWithManagedObjectContext:(id)a3 predicate:(id)a4;
- (id)highPriorityResourcesForPrefetchWithManagedObjectContext:(id)a3;
- (id)lowPriorityResourcesForPrefetchWithManagedObjectContext:(id)a3;
- (void)_handleDownloadFinishedWithSuccess:(BOOL)a3 error:(id)a4 resource:(id)a5 downloadThrottlingDate:(id)a6 networkAccessAllowed:(BOOL)a7 managedObjectContext:(id)a8;
- (void)_prepareResourceForPrefetch:(id)a3;
- (void)prefetchResourceWithObjectID:(id)a3 completion:(id)a4;
- (void)prefetchResourceWithObjectIDs:(id)a3 completion:(id)a4;
@end

@implementation PLSyndicationResourcePrefetchEngine

- (void).cxx_destruct
{
}

- (PLSyndicationResourcePrefetchEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLSyndicationResourcePrefetchEngineDelegate *)WeakRetained;
}

- (void)prefetchResourceWithObjectIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_group_t v8 = dispatch_group_create();
  qos_class_t v9 = qos_class_self();
  v10 = dispatch_queue_attr_make_with_qos_class(0, v9, 0);
  dispatch_queue_t v11 = dispatch_queue_create("com.apple.photos.syndicationPrefetch", v10);

  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__91955;
  v54[4] = __Block_byref_object_dispose__91956;
  id v55 = 0;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v31 = v7;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v16 = [(PLSyndicationResourcePrefetchEngine *)self delegate];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke;
  v46[3] = &unk_1E5871588;
  v53 = v54;
  v46[4] = self;
  id v17 = v6;
  id v47 = v17;
  id v30 = v15;
  id v48 = v30;
  v18 = v8;
  v49 = v18;
  id v19 = v12;
  id v50 = v19;
  id v32 = v13;
  id v51 = v32;
  id v20 = v14;
  id v52 = v20;
  [v16 performTransactionForPrefetchManager:self synchronous:1 block:v46];

  v21 = objc_alloc_init(PLResourceLocalAvailabilityRequestOptions);
  [(PLResourceLocalAvailabilityRequestOptions *)v21 setNetworkAccessAllowed:1];
  v29 = v17;
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F59958]) initWithIntent:5 priority:2];
  [(PLResourceLocalAvailabilityRequestOptions *)v21 setDownloadOptions:v22];
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = 0;
  uint64_t v23 = [v19 count];
  v24 = [(PLSyndicationResourcePrefetchEngine *)self delegate];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_52;
  v40[3] = &unk_1E5871628;
  v40[4] = self;
  id v25 = v20;
  id v41 = v25;
  v42 = v18;
  v43 = v45;
  v44 = v54;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_66;
  v33[3] = &unk_1E5871678;
  v26 = v42;
  v34 = v26;
  v27 = v11;
  v35 = v27;
  v36 = self;
  v38 = v45;
  uint64_t v39 = v23;
  id v28 = v31;
  id v37 = v28;
  [v24 batchRequestResourcesForPrefetchManager:self itemIdentifiersWithBundleIDs:v19 destURLs:v32 options:v21 resultHandler:v40 completionHandler:v33];

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v54, 8);
}

void __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke(id *a1, void *a2)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [a1[4] _fetchDownloadThrottlingDateAndClearIfNeededWithManagedObjectContext:v3];
  uint64_t v5 = *((void *)a1[11] + 1);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v7 = a1[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v66 objects:v77 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v57 = *(void *)v67;
    id v52 = (void *)*MEMORY[0x1E4F44490];
    id v55 = v7;
    v53 = a1;
    id v54 = v3;
    do
    {
      uint64_t v10 = 0;
      uint64_t v56 = v9;
      do
      {
        if (*(void *)v67 != v57) {
          objc_enumerationMutation(v7);
        }
        dispatch_queue_t v11 = *(NSObject **)(*((void *)&v66 + 1) + 8 * v10);
        id v65 = 0;
        id v12 = [v3 existingObjectWithID:v11 error:&v65];
        id v13 = v65;
        id v14 = v13;
        if (v12)
        {
          id v58 = v13;
          id v15 = [v12 asset];
          v16 = [v15 additionalAttributes];
          id v17 = [v16 syndicationIdentifier];

          v18 = [v12 asset];
          id v19 = [v18 additionalAttributes];
          uint64_t v20 = [v19 importedByBundleIdentifier];

          v59 = (void *)v20;
          if (v17) {
            BOOL v21 = v20 == 0;
          }
          else {
            BOOL v21 = 1;
          }
          if (v21)
          {
            PLSyndicationGetLog();
            v22 = (PLResourceLocalAvailabilityRequestOptions *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v22->super, OS_LOG_TYPE_ERROR))
            {
              uint64_t v23 = [v12 objectID];
              *(_DWORD *)buf = 138543874;
              v71 = v17;
              __int16 v72 = 2114;
              v73 = v59;
              __int16 v74 = 2114;
              v75 = v23;
              _os_log_impl(&dword_19B3C7000, &v22->super, OS_LOG_TYPE_ERROR, "[resource.prefetch] asset missing syndicationIdentifier (%{public}@) or bundleID (%{public}@), skipping resource with object id: %{public}@", buf, 0x20u);
            }
LABEL_20:
            id v14 = v58;
          }
          else
          {
            [a1[4] _prepareResourceForPrefetch:v12];
            v24 = [v12 asset];
            int v25 = [v24 syndicationOriginalResourcesAreLocal];

            if (v25)
            {
              id v26 = a1[6];
              v27 = [v12 objectID];
              [v26 addObject:v27];

              id v28 = [v12 asset];
              v29 = [v28 uuid];

              id v30 = PLSyndicationGetLog();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v71 = v29;
                _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEFAULT, "[resource.prefetch] attempting to generate derivative for asset with local originals: %{public}@", buf, 0xCu);
              }

              dispatch_group_enter((dispatch_group_t)a1[7]);
              v22 = objc_alloc_init(PLResourceLocalAvailabilityRequestOptions);
              v31 = [a1[4] delegate];
              id v32 = a1[4];
              v60[0] = MEMORY[0x1E4F143A8];
              v60[1] = 3221225472;
              v60[2] = __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_50;
              v60[3] = &unk_1E5871560;
              v60[4] = v32;
              v61 = v29;
              id v33 = v12;
              id v34 = a1[11];
              id v62 = v33;
              id v64 = v34;
              id v63 = a1[7];
              v35 = v29;
              id v36 = (id)[v31 requestLocalAvailabilityChangeForPrefetchManager:v32 resource:v33 options:v22 completion:v60];

              id v7 = v55;
              uint64_t v9 = v56;
              goto LABEL_20;
            }
            id v37 = [v12 asset];
            v22 = [v37 syndicationOriginalResource];

            if (v22)
            {
              v38 = [v12 asset];
              uint64_t v39 = [(PLResourceLocalAvailabilityRequestOptions *)v22 resourceType];
              uint64_t v40 = [(PLResourceLocalAvailabilityRequestOptions *)v22 version];
              uint64_t v41 = [(PLResourceLocalAvailabilityRequestOptions *)v22 recipeID];
              v42 = [(PLResourceLocalAvailabilityRequestOptions *)v22 uniformTypeIdentifier];
              v43 = [v42 identifier];
              v44 = [v38 syndicationResourceURLForResourceType:v39 version:v40 recipeID:v41 utiString:v43 error:0];

              v45 = [v12 asset];
              v46 = [v52 identifier];
              id v47 = [v45 syndicationResourceURLForResourceType:3 version:0 recipeID:0 utiString:v46 error:0];

              if (v44 && v47)
              {
                a1 = v53;
                [v53[8] setObject:v59 forKey:v17];
                v76[0] = v44;
                v76[1] = v47;
                id v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
                [v53[9] setObject:v48 forKeyedSubscript:v17];

                v49 = [v12 objectID];
                [v53[10] setObject:v49 forKeyedSubscript:v17];
              }
              else
              {
                v49 = PLSyndicationGetLog();
                a1 = v53;
                if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                {
                  id v51 = [v12 objectID];
                  *(_DWORD *)buf = 138543362;
                  v71 = v51;
                  _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_ERROR, "[resource.prefetch] asset has malformed original URL, skipping resource with object id: %{public}@", buf, 0xCu);
                }
              }
              id v3 = v54;
              id v7 = v55;
            }
            else
            {
              v44 = PLSyndicationGetLog();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                id v50 = [v12 objectID];
                *(_DWORD *)buf = 138543362;
                v71 = v50;
                _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_ERROR, "[resource.prefetch] asset missing original resource, skipping resource with object id: %{public}@", buf, 0xCu);
              }
            }
            id v14 = v58;

            uint64_t v9 = v56;
          }

          goto LABEL_32;
        }
        id v17 = PLSyndicationGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v71 = v11;
          __int16 v72 = 2112;
          v73 = v14;
          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "[resource.prefetch] unable to fetch resource with object id: %{public}@, error: %@", buf, 0x16u);
        }
LABEL_32:

        ++v10;
      }
      while (v9 != v10);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v66 objects:v77 count:16];
    }
    while (v9);
  }
}

void __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_52(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = PLSyndicationGetLog();
  id v17 = v16;
  if (v12)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [*(id *)(a1 + 32) delegate];
      id v19 = [v18 name];
      *(_DWORD *)buf = 138544130;
      id v36 = v19;
      __int16 v37 = 2114;
      id v38 = v11;
      __int16 v39 = 2112;
      id v40 = v12;
      __int16 v41 = 2112;
      id v42 = v13;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "[resource.prefetch] %{public}@ prefetched file for identifier: %{public}@, fileURL: %@, secondary fileURL: %@", buf, 0x2Au);
    }
    uint64_t v20 = [*(id *)(a1 + 32) delegate];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_53;
    v26[3] = &unk_1E5871600;
    uint64_t v21 = *(void *)(a1 + 32);
    v27 = *(id *)(a1 + 40);
    id v28 = v11;
    id v29 = v12;
    id v30 = v13;
    id v31 = v14;
    id v22 = *(id *)(a1 + 48);
    uint64_t v23 = *(void *)(a1 + 32);
    id v32 = v22;
    uint64_t v33 = v23;
    long long v34 = *(_OWORD *)(a1 + 56);
    [v20 performTransactionForPrefetchManager:v21 synchronous:1 block:v26];

    id v17 = v27;
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v24 = [*(id *)(a1 + 32) delegate];
    int v25 = [v24 name];
    *(_DWORD *)buf = 138543874;
    id v36 = v25;
    __int16 v37 = 2114;
    id v38 = v11;
    __int16 v39 = 2112;
    id v40 = v15;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "[resource.prefetch] %{public}@ failed to prefetch file with identifier: %{public}@, error: %@", buf, 0x20u);
  }
}

void __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_66(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  uint64_t v5 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_2;
  block[3] = &unk_1E5871650;
  uint64_t v6 = *(void *)(a1 + 48);
  id v11 = v3;
  uint64_t v12 = v6;
  uint64_t v14 = *(void *)(a1 + 72);
  long long v9 = *(_OWORD *)(a1 + 56);
  id v7 = (id)v9;
  long long v13 = v9;
  id v8 = v3;
  dispatch_group_notify(v4, v5, block);
}

uint64_t __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = PLSyndicationGetLog();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [*(id *)(a1 + 40) delegate];
      uint64_t v6 = [v5 name];
      uint64_t v7 = *(void *)(a1 + 32);
      int v17 = 138543618;
      v18 = v6;
      __int16 v19 = 2112;
      uint64_t v20 = v7;
      id v8 = "[resource.prefetch] %{public}@ batch download request failed with error: %@";
      long long v9 = v4;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      uint32_t v11 = 22;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v9, v10, v8, (uint8_t *)&v17, v11);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 40) delegate];
    uint64_t v6 = [v5 name];
    uint64_t v12 = *(void *)(a1 + 64);
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    int v17 = 138543874;
    v18 = v6;
    __int16 v19 = 2048;
    uint64_t v20 = v13;
    __int16 v21 = 2048;
    uint64_t v22 = v12;
    id v8 = "[resource.prefetch] %{public}@ batch download request completed, %tu out of %tu items generated successfully";
    long long v9 = v4;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    uint32_t v11 = 32;
    goto LABEL_6;
  }

  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), v14, v15);
}

void __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_53(uint64_t a1, void *a2)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v3 objectForKeyedSubscript:v4];
  id v87 = 0;
  uint64_t v7 = [v5 existingObjectWithID:v6 error:&v87];

  id v8 = v87;
  v73 = v8;
  if (v7)
  {
    id v9 = [v7 asset];
    os_log_type_t v10 = [v9 uuid];
    uint32_t v11 = [v9 filename];

    if (!v11)
    {
      uint64_t v12 = PLSyndicationGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void **)(a1 + 64);
        *(_DWORD *)buf = 138543618;
        id v89 = v10;
        __int16 v90 = 2112;
        id v91 = v13;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "[resource.prefetch] setting filename and directory for asset: %{public}@ with original filename: %@", buf, 0x16u);
      }

      [v9 setSyndicationFilenameAndDirectoryWithOriginalFilename:*(void *)(a1 + 64)];
    }
    if (![v9 isPhoto]
      || ([v9 isPhotoIris] & 1) != 0
      || (uint64_t v14 = *(void **)(a1 + 56)) == 0)
    {
      char v21 = 0;
      goto LABEL_15;
    }
    uint64_t v15 = (void *)MEMORY[0x1E4F442D8];
    v16 = [v14 pathExtension];
    int v17 = [v15 typeWithFilenameExtension:v16 conformingToType:*MEMORY[0x1E4F44448]];

    if (v17 && ([v17 isDynamic] & 1) == 0)
    {
      int v71 = [v9 becomeSyndicationLivePhotoWithVideoComplementContentType:v17];
      __int16 v72 = PLSyndicationGetLog();
      v18 = v72;
      if (v71)
      {
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v89 = v10;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "[resource.prefetch] found video complement URL, promoted asset (%{public}@) to live photo", buf, 0xCu);
        }
        char v21 = 1;
        goto LABEL_69;
      }
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = [v17 identifier];
        *(_DWORD *)buf = 138543618;
        id v89 = v10;
        __int16 v90 = 2114;
        id v91 = v19;
        uint64_t v20 = "[resource.prefetch] failed to promote asset to live photo: %{public}@, content type: %{public}@";
        goto LABEL_13;
      }
    }
    else
    {
      v18 = PLSyndicationGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = [*(id *)(a1 + 56) pathExtension];
        *(_DWORD *)buf = 138543618;
        id v89 = v19;
        __int16 v90 = 2114;
        id v91 = v10;
        uint64_t v20 = "[resource.prefetch] ignoring video complement with unexpected uti for file extension: %{public}@, asset: %{public}@";
LABEL_13:
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, v20, buf, 0x16u);
      }
    }
    char v21 = 0;
LABEL_69:

LABEL_15:
    if (!*(void *)(a1 + 48)) {
      goto LABEL_38;
    }
    uint64_t v22 = [v9 syndicationOriginalResource];

    if (v22)
    {
      uint64_t v23 = [v9 syndicationOriginalResource];
      uint64_t v24 = *(void *)(a1 + 48);
      id v84 = 0;
      BOOL v25 = +[PLSyndicationResourceDataStore markResource:v23 purgeableAndLocallyAvailableWithFileURL:v24 error:&v84];
      id v26 = v84;

      if (v25)
      {
LABEL_37:

LABEL_38:
        if (!*(void *)(a1 + 56))
        {
LABEL_59:
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 72));
          __int16 v41 = objc_alloc_init(PLResourceLocalAvailabilityRequestOptions);
          id v65 = [*(id *)(a1 + 80) delegate];
          uint64_t v66 = *(void *)(a1 + 80);
          v74[0] = MEMORY[0x1E4F143A8];
          v74[1] = 3221225472;
          v74[2] = __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_57;
          v74[3] = &unk_1E58715D8;
          v74[4] = v66;
          id v75 = v10;
          uint64_t v78 = *(void *)(a1 + 88);
          id v67 = v7;
          uint64_t v68 = *(void *)(a1 + 96);
          id v76 = v67;
          uint64_t v79 = v68;
          id v77 = *(id *)(a1 + 72);
          id v69 = v10;
          id v70 = (id)[v65 requestLocalAvailabilityChangeForPrefetchManager:v66 resource:v67 options:v41 completion:v74];

          goto LABEL_60;
        }
        if ((v21 & 1) != 0 || [v9 isPhotoIris])
        {
          id v47 = [v9 syndicationOriginalVideoComplementResource];

          if (v47)
          {
            id v48 = [v9 syndicationOriginalVideoComplementResource];
            uint64_t v49 = *(void *)(a1 + 56);
            id v82 = 0;
            BOOL v50 = +[PLSyndicationResourceDataStore markResource:v48 purgeableAndLocallyAvailableWithFileURL:v49 error:&v82];
            id v51 = v82;

            if (v50)
            {
LABEL_58:

              goto LABEL_59;
            }
            id v52 = PLSyndicationGetLog();
            if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
LABEL_57:

              goto LABEL_58;
            }
            *(_DWORD *)buf = 138543618;
            id v89 = v10;
            __int16 v90 = 2112;
            id v91 = v51;
            v53 = "[resource.prefetch] failed to mark video complement resource as locally available for asset: %{public}@, error: %@";
            id v54 = v52;
            uint32_t v55 = 22;
LABEL_56:
            _os_log_impl(&dword_19B3C7000, v54, OS_LOG_TYPE_ERROR, v53, buf, v55);
            goto LABEL_57;
          }
          uint64_t v56 = PLSyndicationGetLog();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            uint64_t v57 = *(void **)(a1 + 56);
            *(_DWORD *)buf = 138543618;
            id v89 = v10;
            __int16 v90 = 2112;
            id v91 = v57;
            _os_log_impl(&dword_19B3C7000, v56, OS_LOG_TYPE_ERROR, "[resource.prefetch] asset %{public}@ does not have a video complement resource, cannot ingest file at url: %@", buf, 0x16u);
          }

          id v58 = [MEMORY[0x1E4F28CB8] defaultManager];
          uint64_t v59 = *(void *)(a1 + 56);
          id v81 = 0;
          char v60 = [v58 removeItemAtURL:v59 error:&v81];
          id v51 = v81;

          if (v60) {
            goto LABEL_58;
          }
          id v52 = PLSyndicationGetLog();
          if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
            goto LABEL_57;
          }
          *(_DWORD *)buf = 138412290;
          id v89 = v51;
          v53 = "[resource.prefetch] failed to remove erroneous video complement file: %@";
        }
        else
        {
          v61 = PLSyndicationGetLog();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v89 = v10;
            _os_log_impl(&dword_19B3C7000, v61, OS_LOG_TYPE_ERROR, "[resource.prefetch] received video complement file for non-live photo asset: %{public}@, removing", buf, 0xCu);
          }

          id v62 = [MEMORY[0x1E4F28CB8] defaultManager];
          uint64_t v63 = *(void *)(a1 + 56);
          id v80 = 0;
          char v64 = [v62 removeItemAtURL:v63 error:&v80];
          id v51 = v80;

          if (v64) {
            goto LABEL_58;
          }
          id v52 = PLSyndicationGetLog();
          if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
            goto LABEL_57;
          }
          *(_DWORD *)buf = 138412290;
          id v89 = v51;
          v53 = "[resource.prefetch] failed to remove erroneous video complement file: %@";
        }
        id v54 = v52;
        uint32_t v55 = 12;
        goto LABEL_56;
      }
      v27 = PLSyndicationGetLog();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
LABEL_36:

        goto LABEL_37;
      }
      *(_DWORD *)buf = 138543618;
      id v89 = v10;
      __int16 v90 = 2112;
      id v91 = v26;
      id v28 = "[resource.prefetch] failed to mark original resource as locally available for asset: %{public}@, error: %@";
      id v29 = v27;
      uint32_t v30 = 22;
    }
    else
    {
      id v42 = PLSyndicationGetLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        uint64_t v43 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        id v89 = v10;
        __int16 v90 = 2112;
        id v91 = v43;
        _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_ERROR, "[resource.prefetch] asset %{public}@ does not have an original resource, cannot ingest file at url: %@", buf, 0x16u);
      }

      v44 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v45 = *(void *)(a1 + 48);
      id v83 = 0;
      char v46 = [v44 removeItemAtURL:v45 error:&v83];
      id v26 = v83;

      if (v46) {
        goto LABEL_37;
      }
      v27 = PLSyndicationGetLog();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      *(_DWORD *)buf = 138412290;
      id v89 = v26;
      id v28 = "[resource.prefetch] failed to remove erroneous original file: %@";
      id v29 = v27;
      uint32_t v30 = 12;
    }
    _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
    goto LABEL_36;
  }
  id v31 = v8;
  id v32 = PLSyndicationGetLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v89 = v6;
    __int16 v90 = 2112;
    id v91 = v31;
    _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "[resource.prefetch] unable to fetch resource with object id: %{public}@, error: %@", buf, 0x16u);
  }

  uint64_t v33 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v34 = *(void *)(a1 + 48);
  id v86 = 0;
  char v35 = [v33 removeItemAtURL:v34 error:&v86];
  id v36 = v86;

  if ((v35 & 1) == 0)
  {
    __int16 v37 = PLSyndicationGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v89 = v36;
      _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "[resource.prefetch] failed to clean up file after resource fetch failure: %@", buf, 0xCu);
    }
  }
  if (*(void *)(a1 + 56))
  {
    id v38 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v39 = *(void *)(a1 + 56);
    id v85 = v36;
    char v40 = [v38 removeItemAtURL:v39 error:&v85];
    id v9 = v85;

    if (v40)
    {
LABEL_61:
      id v36 = v9;
      goto LABEL_62;
    }
    PLSyndicationGetLog();
    __int16 v41 = (PLResourceLocalAvailabilityRequestOptions *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v41->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v89 = v9;
      _os_log_impl(&dword_19B3C7000, &v41->super, OS_LOG_TYPE_ERROR, "[resource.prefetch] failed to clean up file after resource fetch failure: %@", buf, 0xCu);
    }
LABEL_60:

    goto LABEL_61;
  }
LABEL_62:
}

void __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_57(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v8 = PLSyndicationGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [*(id *)(a1 + 32) delegate];
    os_log_type_t v10 = [v9 name];
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = @"N";
    *(_DWORD *)buf = 138543874;
    uint64_t v24 = v10;
    if (v7) {
      uint64_t v12 = @"Y";
    }
    __int16 v25 = 2114;
    uint64_t v26 = v11;
    __int16 v27 = 2114;
    id v28 = v12;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "[resource.prefetch] %{public}@ finished generating derivative for asset: %{public}@ with success: %{public}@", buf, 0x20u);
  }
  if (v7) {
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
  uint64_t v13 = [*(id *)(a1 + 32) delegate];
  uint64_t v14 = *(void *)(a1 + 32);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_64;
  v18[3] = &unk_1E58715B0;
  BOOL v22 = v7 != 0;
  v18[4] = v14;
  id v19 = v6;
  id v15 = *(id *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 72);
  id v20 = v15;
  uint64_t v21 = v16;
  id v17 = v6;
  [v13 performTransactionForPrefetchManager:v14 synchronous:1 block:v18];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_64(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleDownloadFinishedWithSuccess:*(unsigned __int8 *)(a1 + 64) error:*(void *)(a1 + 40) resource:*(void *)(a1 + 48) downloadThrottlingDate:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) networkAccessAllowed:1 managedObjectContext:a2];
}

void __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_50(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v8 = PLSyndicationGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [*(id *)(a1 + 32) delegate];
    os_log_type_t v10 = [v9 name];
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v10;
    __int16 v25 = 2114;
    uint64_t v26 = v11;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "[resource.prefetch] %{public}@ finished generating derivative for asset: %{public}@", buf, 0x16u);
  }
  uint64_t v12 = [*(id *)(a1 + 32) delegate];
  uint64_t v13 = *(void *)(a1 + 32);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_51;
  v18[3] = &unk_1E5871538;
  v18[4] = v13;
  id v19 = v7;
  id v20 = v6;
  id v14 = *(id *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 64);
  id v21 = v14;
  uint64_t v22 = v15;
  id v16 = v6;
  id v17 = v7;
  [v12 performTransactionForPrefetchManager:v13 synchronous:1 block:v18];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_51(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleDownloadFinishedWithSuccess:*(void *)(a1 + 40) != 0 error:*(void *)(a1 + 48) resource:*(void *)(a1 + 56) downloadThrottlingDate:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) networkAccessAllowed:1 managedObjectContext:a2];
}

- (void)prefetchResourceWithObjectID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__91955;
  v21[4] = __Block_byref_object_dispose__91956;
  id v22 = 0;
  id v8 = [(PLSyndicationResourcePrefetchEngine *)self delegate];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectID_completion___block_invoke;
  v18[3] = &unk_1E5871498;
  id v20 = v21;
  v18[4] = self;
  id v9 = v6;
  id v19 = v9;
  [v8 performTransactionForPrefetchManager:self synchronous:1 block:v18];

  os_log_type_t v10 = [(PLSyndicationResourcePrefetchEngine *)self delegate];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectID_completion___block_invoke_2;
  v13[3] = &unk_1E5871510;
  id v11 = v9;
  id v14 = v11;
  uint64_t v15 = self;
  id v17 = v21;
  id v12 = v7;
  id v16 = v12;
  [v10 performTransactionForPrefetchManager:self synchronous:0 block:v13];

  _Block_object_dispose(v21, 8);
}

void __79__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 _fetchDownloadThrottlingDateAndClearIfNeededWithManagedObjectContext:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = [v4 existingObjectWithID:*(void *)(a1 + 40) error:0];

  [*(id *)(a1 + 32) _prepareResourceForPrefetch:v8];
}

void __79__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v27 = 0;
  id v4 = [a2 existingObjectWithID:v3 error:&v27];
  id v5 = v27;
  uint64_t v6 = PLSyndicationGetLog();
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 40) delegate];
      id v9 = [v8 name];
      os_log_type_t v10 = [v4 singleLineDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v9;
      __int16 v30 = 2112;
      id v31 = v10;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "[resource.sync] %{public}@ performing work on resource: %@", buf, 0x16u);
    }
    id v11 = objc_alloc_init(PLResourceLocalAvailabilityRequestOptions);
    id v12 = [*(id *)(a1 + 40) delegate];
    if ([v12 isNetworkAccessAllowed]) {
      BOOL v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) == 0;
    }
    else {
      BOOL v13 = 0;
    }

    [(PLResourceLocalAvailabilityRequestOptions *)v11 setNetworkAccessAllowed:v13];
    id v17 = (void *)[objc_alloc(MEMORY[0x1E4F59958]) initWithIntent:0 priority:2];
    [(PLResourceLocalAvailabilityRequestOptions *)v11 setDownloadOptions:v17];

    v18 = [*(id *)(a1 + 40) delegate];
    uint64_t v19 = *(void *)(a1 + 40);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __79__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectID_completion___block_invoke_36;
    v23[3] = &unk_1E58714E8;
    v23[4] = v19;
    id v24 = v4;
    BOOL v26 = v13;
    long long v22 = *(_OWORD *)(a1 + 48);
    id v20 = (id)v22;
    long long v25 = v22;
    id v21 = (id)[v18 requestLocalAvailabilityChangeForPrefetchManager:v19 resource:v24 options:v11 completion:v23];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v14 = [*(id *)(a1 + 40) delegate];
      uint64_t v15 = [v14 name];
      id v16 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v15;
      __int16 v30 = 2114;
      id v31 = v16;
      __int16 v32 = 2112;
      id v33 = v5;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "[resource.sync] %{public}@ failed to fetch resource with object ID: %{public}@, error: %@", buf, 0x20u);
    }
    id v11 = (PLResourceLocalAvailabilityRequestOptions *)PLErrorCreate();
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __79__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectID_completion___block_invoke_36(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  unint64_t v7 = a4;
  unint64_t v8 = (unint64_t)v6;
  id v9 = (void *)v8;
  if (v8 | v7)
  {
    os_log_type_t v10 = (void *)v8;
    if (v7)
    {
      id v11 = PLSyndicationGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [*(id *)(a1 + 32) delegate];
        BOOL v13 = [v12 name];
        *(_DWORD *)buf = 138543362;
        char v35 = v13;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "[resource.sync] %{public}@ generated image derivative", buf, 0xCu);
      }
      os_log_type_t v10 = v9;
      goto LABEL_9;
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F8C500];
    uint64_t v38 = *MEMORY[0x1E4F28228];
    v39[0] = @"unknown error sanitizing syndication resource";
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    os_log_type_t v10 = [v14 errorWithDomain:v15 code:47001 userInfo:v16];
  }
  id v11 = PLSyndicationGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v17 = [*(id *)(a1 + 32) delegate];
    v18 = [v17 name];
    *(_DWORD *)buf = 138543618;
    char v35 = v18;
    __int16 v36 = 2112;
    __int16 v37 = v10;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "[resource.sync] %{public}@ error generating image derivative: %@", buf, 0x16u);
  }
LABEL_9:

  uint64_t v19 = [*(id *)(a1 + 32) delegate];
  uint64_t v20 = *(void *)(a1 + 32);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __79__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectID_completion___block_invoke_42;
  v28[3] = &unk_1E58714C0;
  v28[4] = v20;
  id v29 = (id)v7;
  id v30 = v10;
  id v21 = *(id *)(a1 + 40);
  uint64_t v22 = *(void *)(a1 + 56);
  id v31 = v21;
  uint64_t v32 = v22;
  char v33 = *(unsigned char *)(a1 + 64);
  id v23 = v10;
  id v24 = (id)v7;
  [v19 performTransactionForPrefetchManager:v20 synchronous:1 block:v28];

  (*(void (**)(void, id, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v23, v25, v26, v27);
}

uint64_t __79__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectID_completion___block_invoke_42(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleDownloadFinishedWithSuccess:*(void *)(a1 + 40) != 0 error:*(void *)(a1 + 48) resource:*(void *)(a1 + 56) downloadThrottlingDate:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) networkAccessAllowed:*(unsigned __int8 *)(a1 + 72) managedObjectContext:a2];
}

- (id)lowPriorityResourcesForPrefetchWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = +[PLInternalResource predicateForSyndicationResourcesRequiringBackgroundDownload];
  id v6 = [(PLSyndicationResourcePrefetchEngine *)self _resourcesForPrefetchWithManagedObjectContext:v4 predicate:v5];

  return v6;
}

- (id)highPriorityResourcesForPrefetchWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = +[PLInternalResource predicateForSyndicationResourcesRequiringSanitization];
  id v6 = [(PLSyndicationResourcePrefetchEngine *)self _resourcesForPrefetchWithManagedObjectContext:v4 predicate:v5];

  return v6;
}

- (void)_handleDownloadFinishedWithSuccess:(BOOL)a3 error:(id)a4 resource:(id)a5 downloadThrottlingDate:(id)a6 networkAccessAllowed:(BOOL)a7 managedObjectContext:(id)a8
{
  BOOL v12 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if (v12)
  {
    v18 = [MEMORY[0x1E4F1C9C8] date];
    [v15 setCloudLastPrefetchDate:v18];

    [v15 setCloudPrefetchCount:0];
  }
  else
  {
    if (PLErrorOrUnderlyingErrorHasDomainAndCode()) {
      [v15 setSyndicationLocalAvailabilityWithAvailable:0 additionalFlags:4];
    }
    if (PLUnderlyingErrorIsSyndicationMessagesNeedsDownload(v14) && !a7)
    {
      if (v16)
      {
        [v15 setCloudLastPrefetchDate:v16];
      }
      else
      {
        uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
        [v15 setCloudLastPrefetchDate:v19];
      }
      [v15 setCloudPrefetchCount:0];
      uint64_t v20 = PLSyndicationGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        id v21 = [(PLSyndicationResourcePrefetchEngine *)self delegate];
        uint64_t v22 = [v21 name];
        *(_DWORD *)buf = 138543362;
        uint64_t v32 = v22;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEBUG, "[resource.sync] %{public}@ downloads not permitted, will try again when network access allowed", buf, 0xCu);
      }
    }
    id v30 = 0;
    PLUnderlyingErrorIsSyndicationMessagesRetry(v14, &v30);
    int v24 = v23;
    id v25 = v30;
    if (v24)
    {
      uint64_t v26 = [(PLSyndicationResourcePrefetchEngine *)self delegate];
      [v26 prefetchManager:self receivedNewDownloadThrottlingDate:v25 managedObjectContext:v17];

      uint64_t v27 = PLSyndicationGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = [(PLSyndicationResourcePrefetchEngine *)self delegate];
        id v29 = [v28 name];
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v29;
        __int16 v33 = 2114;
        id v34 = v25;
        _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "[resource.sync.throttle] %{public}@ server has indicated that network prefetch should be disabled until: %{public}@", buf, 0x16u);
      }
      [v15 setCloudLastPrefetchDate:v25];
      [v15 setCloudPrefetchCount:0];
    }
  }
}

- (void)_prepareResourceForPrefetch:(id)a3
{
  id v8 = a3;
  [v8 clearRequiresSanitizationFlag];
  int v3 = [v8 cloudPrefetchCount];
  __int16 v4 = v3;
  double v5 = 86400.0;
  if (v3)
  {
    int v6 = v3;
    do
    {
      double v5 = v5 + v5;
      --v6;
    }
    while (v6);
  }
  unint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v5];
  [v8 setCloudLastPrefetchDate:v7];
  [v8 setCloudPrefetchCount:(__int16)(v4 + 1)];
}

- (id)_fetchDownloadThrottlingDateAndClearIfNeededWithManagedObjectContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(PLSyndicationResourcePrefetchEngine *)self delegate];
  int v6 = [v5 downloadThrottlingDateForPrefetchManager:self];

  if (v6)
  {
    [v6 timeIntervalSinceNow];
    if (v7 <= 0.0)
    {
      id v8 = PLSyndicationGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [(PLSyndicationResourcePrefetchEngine *)self delegate];
        os_log_type_t v10 = [v9 name];
        int v13 = 138543618;
        id v14 = v10;
        __int16 v15 = 2114;
        id v16 = v6;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "[resource.sync.throttle] %{public}@ server time limit for disabling network prefetch has expired (%{public}@), allowing network prefetch", (uint8_t *)&v13, 0x16u);
      }
      id v11 = [(PLSyndicationResourcePrefetchEngine *)self delegate];
      [v11 prefetchManager:self receivedNewDownloadThrottlingDate:0 managedObjectContext:v4];

      int v6 = 0;
    }
  }

  return v6;
}

- (id)_resourcesForPrefetchWithManagedObjectContext:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__91955;
  id v21 = __Block_byref_object_dispose__91956;
  id v22 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__PLSyndicationResourcePrefetchEngine__resourcesForPrefetchWithManagedObjectContext_predicate___block_invoke;
  v12[3] = &unk_1E5875368;
  id v8 = v7;
  id v13 = v8;
  id v16 = &v17;
  id v9 = v6;
  id v14 = v9;
  __int16 v15 = self;
  [v9 performBlockAndWait:v12];
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __95__PLSyndicationResourcePrefetchEngine__resourcesForPrefetchWithManagedObjectContext_predicate___block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1C0D0];
  int v3 = +[PLInternalResource entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  [v4 setPredicate:*(void *)(a1 + 32)];
  [v4 setResultType:1];
  [v4 setFetchLimit:100];
  double v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"asset.addedDate" ascending:0];
  v20[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [v4 setSortDescriptors:v6];

  id v7 = *(void **)(a1 + 40);
  id v15 = 0;
  uint64_t v8 = [v7 executeFetchRequest:v4 error:&v15];
  id v9 = v15;
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    BOOL v12 = PLSyndicationGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [*(id *)(a1 + 48) delegate];
      id v14 = [v13 name];
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "[resource.sync] %{public}@ failed to fetch work items with error: %@", buf, 0x16u);
    }
  }
}

- (PLSyndicationResourcePrefetchEngine)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PLSyndicationResourcePrefetchEngine;
  double v5 = [(PLSyndicationResourcePrefetchEngine *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

@end