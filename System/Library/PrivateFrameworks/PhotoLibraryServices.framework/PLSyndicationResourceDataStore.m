@interface PLSyndicationResourceDataStore
+ (BOOL)_markSyndicationResourceAsLocallyAvailableWithURL:(id)a3 resource:(id)a4 inode:(unint64_t)a5 error:(id *)a6;
+ (BOOL)_safeCopyItemAtURL:(id)a3 toURLAndReplaceIfNeeded:(id)a4 error:(id *)a5;
+ (BOOL)_shouldUseDataInterfaceForBundleID:(id)a3;
+ (BOOL)_unpackPVTBundleAtURL:(id)a3 primaryURL:(id *)a4 secondaryURL:(id *)a5 error:(id *)a6;
+ (BOOL)markResource:(id)a3 purgeableAndLocallyAvailableWithFileURL:(id)a4 error:(id *)a5;
+ (id)supportedRecipes;
+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3;
+ (unsigned)storeClassID;
+ (void)_addTemporaryURL:(id)a3 itemIdentifier:(id)a4 error:(id)a5 toResults:(id)a6 andFileHandles:(id)a7;
+ (void)_provideFileURLAndUnwrapLivePhotoIfNeededForBundleID:(id)a3 syndicationIdentifier:(id)a4 typeIdentifier:(id)a5 isLivePhoto:(BOOL)a6 options:(int64_t)a7 completionHandler:(id)a8;
+ (void)_provideFileURLForBundleID:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 completionHandler:(id)a7;
+ (void)_provideFileURLsForBundleID:(id)a3 itemIdentifiers:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 completionHandler:(id)a7;
+ (void)_provideTemporaryFileURLFromDataForBundleID:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 completionHandler:(id)a7;
+ (void)provideFileURLAndUnwrapLivePhotoIfNeededForItemIdentifiersWithBundleIDs:(id)a3 destURLs:(id)a4 options:(id)a5 resultHandler:(id)a6 completionHandler:(id)a7;
- (BOOL)_copyAndMarkAsLocallyAvailablePairedLivePhotoResourceForRequestedResource:(id)a3 requestedVideoComplement:(BOOL)a4 sourceURL:(id)a5 error:(id *)a6;
- (BOOL)_copyAndMarkPurgeableItemAtURL:(id)a3 withPathManager:(id)a4 destFileIdentifier:(id)a5 inode:(unint64_t *)a6 error:(id *)a7;
- (BOOL)canMarkAsynchronousLocalRenderAsOptionalForProgress:(id)a3;
- (BOOL)canStoreExternalResource:(id)a3;
- (BOOL)canStreamResource:(id)a3;
- (BOOL)dataStoreSubtypeIsDownloadable:(int64_t)a3;
- (BOOL)storeExternalResource:(id)a3 forAsset:(id)a4 options:(id)a5 error:(id *)a6 resultingResource:(id *)a7;
- (BOOL)videoResource:(id)a3 matchesOrExceedsQualityLevel:(unsigned int)a4;
- (id)_errorForUnderlyingError:(id)a3;
- (id)_getDestinationURLAndFixLocalAvailabilityIfNeededForResource:(id)a3 fileIdentifier:(id *)a4 isLocallyAvailable:(BOOL *)a5 error:(id *)a6;
- (id)_requestLocalAvailabilityChangeForSyndicationOriginalResource:(id)a3 options:(id)a4 completion:(id)a5;
- (id)descriptionForSubtype:(int64_t)a3;
- (id)expectedFileURLForResource:(id)a3 asset:(id)a4;
- (id)imageConversionClientForResourceGenerator:(id)a3;
- (id)keyFromKeyStruct:(const void *)a3;
- (id)metadataForResourceGenerator:(id)a3 fromFileURL:(id)a4;
- (id)name;
- (id)requestLocalAvailabilityChange:(signed __int16)a3 forResource:(id)a4 options:(id)a5 completion:(id)a6;
- (id)resourceDataForKey:(id)a3 assetID:(id)a4;
- (id)resourceURLForKey:(id)a3 assetID:(id)a4;
- (id)updateDerivativeResourcesForAsset:(id)a3 forLifecycleEvent:(unsigned int)a4;
- (id)videoConversionClientForResourceGenerator:(id)a3;
- (id)virtualResourcesForAsset:(id)a3;
@end

@implementation PLSyndicationResourceDataStore

+ (id)supportedRecipes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if (a3 >= 0x10u) {
    int v4 = 16;
  }
  else {
    int v4 = a3;
  }
  if (v4 == 3 || v4 == 4 || v4 == 16) {
    v5 = objc_opt_class();
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  return [v6 keyLengthWithDataPreview:v3];
}

+ (unsigned)storeClassID
{
  return 3;
}

+ (BOOL)markResource:(id)a3 purgeableAndLocallyAvailableWithFileURL:(id)a4 error:(id *)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v13 = 0;
  if (!+[PLCacheDeleteSupport markPurgeableForFileAtURL:v8 withUrgency:0 outInode:&v13])
  {
    v9 = PLSyndicationGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "[resource] failed to mark file purgeable at url: %@", buf, 0xCu);
    }
  }
  uint64_t v12 = 0;
  char v10 = [a1 _markSyndicationResourceAsLocallyAvailableWithURL:v8 resource:v7 inode:v13 error:&v12];

  return v10;
}

+ (void)provideFileURLAndUnwrapLivePhotoIfNeededForItemIdentifiersWithBundleIDs:(id)a3 destURLs:(id)a4 options:(id)a5 resultHandler:(id)a6 completionHandler:(id)a7
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v37 = a4;
  id v38 = a5;
  id v36 = a6;
  id v35 = a7;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obuint64_t j = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v57 objects:v68 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v58 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        v18 = [obj objectForKeyedSubscript:v17];
        id v19 = [v13 objectForKeyedSubscript:v18];
        if (!v19)
        {
          id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v13 setObject:v19 forKeyedSubscript:v18];
        }
        [v19 addObject:v17];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v57 objects:v68 count:16];
    }
    while (v14);
  }

  v20 = dispatch_group_create();
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__89376;
  v55[4] = __Block_byref_object_dispose__89377;
  id v56 = 0;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v39 = v13;
  uint64_t v21 = [v39 countByEnumeratingWithState:&v51 objects:v67 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v52 != v22) {
          objc_enumerationMutation(v39);
        }
        v24 = *(void **)(*((void *)&v51 + 1) + 8 * j);
        dispatch_group_enter(v20);
        v25 = [v39 objectForKeyedSubscript:v24];
        uint64_t v26 = PLSyndicationCSProvideOptionsFromRequestOptions(v38, v24);
        v27 = PLSyndicationGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          uint64_t v28 = [v25 count];
          *(_DWORD *)buf = 134218498;
          uint64_t v62 = v28;
          __int16 v63 = 2114;
          v64 = v24;
          __int16 v65 = 2048;
          uint64_t v66 = v26;
          _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_INFO, "[resource] issuing batch request for %tu fileURLs for bundle ID %{public}@ with options 0x%tx", buf, 0x20u);
        }

        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __155__PLSyndicationResourceDataStore_provideFileURLAndUnwrapLivePhotoIfNeededForItemIdentifiersWithBundleIDs_destURLs_options_resultHandler_completionHandler___block_invoke;
        v44[3] = &unk_1E5870D70;
        v44[4] = v24;
        id v29 = v25;
        id v45 = v29;
        id v46 = v37;
        id v50 = a1;
        id v48 = v36;
        v49 = v55;
        v47 = v20;
        [a1 _provideFileURLsForBundleID:v24 itemIdentifiers:v29 typeIdentifier:&stru_1EEB2EB80 options:v26 completionHandler:v44];
      }
      uint64_t v21 = [v39 countByEnumeratingWithState:&v51 objects:v67 count:16];
    }
    while (v21);
  }

  v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  qos_class_t v31 = qos_class_self();
  v32 = dispatch_queue_attr_make_with_qos_class(v30, v31, 0);
  v33 = dispatch_queue_create("PLSyndicationResourceDataStore-provideURLs", v32);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __155__PLSyndicationResourceDataStore_provideFileURLAndUnwrapLivePhotoIfNeededForItemIdentifiersWithBundleIDs_destURLs_options_resultHandler_completionHandler___block_invoke_132;
  block[3] = &unk_1E5870D98;
  id v42 = v35;
  v43 = v55;
  id v34 = v35;
  dispatch_group_notify(v20, v33, block);

  _Block_object_dispose(v55, 8);
}

void __155__PLSyndicationResourceDataStore_provideFileURLAndUnwrapLivePhotoIfNeededForItemIdentifiersWithBundleIDs_destURLs_options_resultHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v55 = a2;
  int v4 = a3;
  v5 = PLSyndicationGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    uint64_t v69 = v6;
    __int16 v70 = 2048;
    uint64_t v71 = [v55 count];
    __int16 v72 = 2112;
    v73 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "[resource] batch request for bundle ID %{public}@ returned %tu results, error: %@", buf, 0x20u);
  }

  if (!v55)
  {
    uint64_t v45 = *(void *)(*(void *)(a1 + 72) + 8);
    id v46 = v4;
    id v7 = *(id *)(v45 + 40);
    *(void *)(v45 + 40) = v46;
    goto LABEL_49;
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v7 = *(id *)(a1 + 40);
  uint64_t v56 = [v7 countByEnumeratingWithState:&v64 objects:v78 count:16];
  if (v56)
  {
    v47 = v4;
    uint64_t v54 = *(void *)v65;
    uint64_t v49 = *MEMORY[0x1E4F28228];
    uint64_t v50 = *MEMORY[0x1E4F8C520];
    uint64_t v48 = *MEMORY[0x1E4F8CED8];
    obuint64_t j = v7;
    while (1)
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v65 != v54) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v64 + 1) + 8 * i);
        char v10 = [v55 objectForKeyedSubscript:v9];
        v11 = v10;
        if (v10)
        {
          id v12 = [v10 url];

          if (v12)
          {
            id v13 = 0;
            int v14 = 1;
            goto LABEL_17;
          }
          id v13 = [v11 error];
          v18 = PLSyndicationGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            id v19 = [v11 error];
            *(_DWORD *)buf = 138543618;
            uint64_t v69 = v9;
            __int16 v70 = 2112;
            uint64_t v71 = (uint64_t)v19;
            _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "[resource] batch result for item identifier %{public}@ returned error %@", buf, 0x16u);
          }
        }
        else
        {
          uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v76 = v49;
          uint64_t v16 = [NSString stringWithFormat:@"no batch result for item identifier: %@", v9];
          v77 = v16;
          uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
          id v13 = [v15 errorWithDomain:v50 code:4 userInfo:v17];

          v18 = PLSyndicationGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v69 = v9;
            _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "[resource] no batch result for item identifier %{public}@", buf, 0xCu);
          }
        }

        int v14 = 0;
LABEL_17:
        v20 = [*(id *)(a1 + 48) objectForKeyedSubscript:v9];
        long long v57 = v20;
        if (!v14)
        {
          id v29 = v13;
          v30 = 0;
          id v28 = 0;
          id v27 = 0;
          qos_class_t v31 = 0;
          v32 = 0;
          goto LABEL_45;
        }
        uint64_t v21 = v20;
        if ([v20 count] != 2)
        {
          id v29 = v13;
          v33 = PLSyndicationGetLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            uint64_t v34 = [v21 count];
            *(_DWORD *)buf = 134217984;
            uint64_t v69 = v34;
            _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "[resource] invalid number of destination URLs provided: %tu", buf, 0xCu);
          }
          v30 = 0;
          id v53 = 0;
          id v27 = 0;
          qos_class_t v31 = 0;
          v32 = 0;
          goto LABEL_44;
        }
        uint64_t v22 = [v11 url];
        v23 = [v22 pathExtension];
        char v24 = [v23 isEqualToString:v48];

        if ((v24 & 1) == 0)
        {
          id v29 = v13;
          id v27 = [v11 url];
          id v28 = 0;
LABEL_27:
          id v53 = v28;
          v32 = [v27 lastPathComponent];
          qos_class_t v31 = [v57 objectAtIndexedSubscript:0];
          id v35 = *(void **)(a1 + 80);
          id v60 = 0;
          char v36 = [v35 _safeCopyItemAtURL:v27 toURLAndReplaceIfNeeded:v31 error:&v60];
          id v37 = v60;
          id v38 = v37;
          if (v36)
          {

            if (!v28)
            {
              v30 = 0;
              goto LABEL_37;
            }
            v33 = [v57 objectAtIndexedSubscript:1];
            uint64_t v39 = [MEMORY[0x1E4F28CB8] defaultManager];
            [(id)v39 removeItemAtURL:v33 error:0];

            v40 = *(void **)(a1 + 80);
            id v59 = 0;
            LOBYTE(v39) = [v40 _safeCopyItemAtURL:v28 toURLAndReplaceIfNeeded:v33 error:&v59];
            id v41 = v59;
            id v42 = v41;
            if (v39)
            {

              v30 = v33;
LABEL_37:
              v33 = PLSyndicationGetLog();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                uint64_t v69 = v9;
                __int16 v70 = 2112;
                uint64_t v71 = (uint64_t)v31;
                _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEFAULT, "[resource] delivering individual result of batch download for identifier: %{public}@, primary url: %@", buf, 0x16u);
              }
            }
            else
            {
              v44 = PLSyndicationGetLog();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138544130;
                uint64_t v69 = v9;
                __int16 v70 = 2112;
                uint64_t v71 = (uint64_t)v53;
                __int16 v72 = 2112;
                v73 = v33;
                __int16 v74 = 2112;
                v75 = v42;
                _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_ERROR, "[resource] failed to copy secondary resource for identifier: %{public}@ from url: %@ to url: %@, error: %@", buf, 0x2Au);
              }

              if (!v29) {
                id v29 = v42;
              }

              v30 = 0;
            }
          }
          else
          {
            v43 = PLSyndicationGetLog();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138544130;
              uint64_t v69 = v9;
              __int16 v70 = 2112;
              uint64_t v71 = (uint64_t)v27;
              __int16 v72 = 2112;
              v73 = v31;
              __int16 v74 = 2112;
              v75 = v38;
              _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_ERROR, "[resource] failed to copy primary resource for identifier: %{public}@ from url: %@ to url: %@, error: %@", buf, 0x2Au);
            }

            if (!v29) {
              id v29 = v38;
            }

            v30 = 0;
            v33 = v31;
            qos_class_t v31 = 0;
          }
LABEL_44:

          id v28 = v53;
          goto LABEL_45;
        }
        v25 = *(void **)(a1 + 80);
        uint64_t v26 = [v11 url];
        id v62 = 0;
        id v63 = 0;
        id v61 = v13;
        int v52 = [v25 _unpackPVTBundleAtURL:v26 primaryURL:&v63 secondaryURL:&v62 error:&v61];
        id v27 = v63;
        id v28 = v62;
        id v29 = v61;

        v30 = 0;
        qos_class_t v31 = 0;
        v32 = 0;
        if (v52) {
          goto LABEL_27;
        }
LABEL_45:
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
      id v7 = obj;
      uint64_t v56 = [obj countByEnumeratingWithState:&v64 objects:v78 count:16];
      if (!v56)
      {
        int v4 = v47;
        break;
      }
    }
  }
LABEL_49:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __155__PLSyndicationResourceDataStore_provideFileURLAndUnwrapLivePhotoIfNeededForItemIdentifiersWithBundleIDs_destURLs_options_resultHandler_completionHandler___block_invoke_132(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

+ (BOOL)_safeCopyItemAtURL:(id)a3 toURLAndReplaceIfNeeded:(id)a4 error:(id *)a5
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 pathComponents];
  char v10 = v9;
  if (!v8 || (unint64_t)[v9 count] < 6) {
    goto LABEL_12;
  }
  v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v10, "count") - 3);
  if (![v11 isEqualToString:*MEMORY[0x1E4F8C4E8]]) {
    goto LABEL_11;
  }
  id v12 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v10, "count") - 4);
  if (([v12 isEqualToString:*MEMORY[0x1E4F8C538]] & 1) == 0)
  {

LABEL_11:
    goto LABEL_12;
  }
  id v13 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v10, "count") - 5);
  int v14 = [v13 isEqualToString:*MEMORY[0x1E4F8C530]];

  if (!v14)
  {
LABEL_12:
    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F8C520];
    uint64_t v41 = *MEMORY[0x1E4F28228];
    v23 = [NSString stringWithFormat:@"invalid url for syndication data store: %@", v8];
    id v42 = v23;
    char v24 = (void *)MEMORY[0x1E4F1C9E8];
    v25 = &v42;
    uint64_t v26 = &v41;
    goto LABEL_13;
  }
  if (!v7
    || ([MEMORY[0x1E4F28CB8] defaultManager],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        [v7 path],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v15 fileExistsAtPath:v16],
        v16,
        v15,
        !v17))
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F8C520];
    uint64_t v43 = *MEMORY[0x1E4F28228];
    v23 = [NSString stringWithFormat:@"invalid copy from url: %@", v7];
    v44 = v23;
    char v24 = (void *)MEMORY[0x1E4F1C9E8];
    v25 = &v44;
    uint64_t v26 = &v43;
    goto LABEL_13;
  }
  char v40 = 0;
  v18 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v19 = [v8 path];
  int v20 = [v18 fileExistsAtPath:v19 isDirectory:&v40];

  if (v40)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F8C520];
    uint64_t v45 = *MEMORY[0x1E4F28228];
    v23 = [NSString stringWithFormat:@"copy to url is a directory: %@", v8];
    v46[0] = v23;
    char v24 = (void *)MEMORY[0x1E4F1C9E8];
    v25 = (void **)v46;
    uint64_t v26 = &v45;
LABEL_13:
    id v27 = [v24 dictionaryWithObjects:v25 forKeys:v26 count:1];
    id v28 = [v21 errorWithDomain:v22 code:0 userInfo:v27];

    goto LABEL_14;
  }
  if (v20)
  {
    qos_class_t v31 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v31 removeItemAtURL:v8 error:0];
  }
  v32 = [v8 URLByDeletingLastPathComponent];
  v33 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v39 = 0;
  int v34 = [v33 createDirectoryAtURL:v32 withIntermediateDirectories:1 attributes:0 error:&v39];
  id v28 = v39;

  if (v34)
  {
    id v38 = 0;
    int v35 = [MEMORY[0x1E4F8B908] copyItemAtURL:v7 toURL:v8 error:&v38];
    id v36 = v38;
    id v37 = v36;
    if (v35)
    {

      BOOL v29 = 1;
      goto LABEL_17;
    }

    id v28 = v37;
  }
  else
  {
  }
LABEL_14:
  if (a5) {
    *a5 = v28;
  }

  BOOL v29 = 0;
LABEL_17:

  return v29;
}

+ (void)_provideTemporaryFileURLFromDataForBundleID:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __134__PLSyndicationResourceDataStore__provideTemporaryFileURLFromDataForBundleID_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke;
  v19[3] = &unk_1E5870D20;
  id v20 = v12;
  id v21 = v11;
  id v22 = v13;
  id v23 = v14;
  int64_t v24 = a6;
  id v15 = v13;
  id v16 = v14;
  id v17 = v11;
  id v18 = v12;
  PLUTIAndSizeFromCSSearchableItemIdentifier(v18, v17, v19);
}

void __134__PLSyndicationResourceDataStore__provideTemporaryFileURLFromDataForBundleID_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v7)
  {
    id v19 = PLSyndicationGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      id v51 = 0;
      __int16 v52 = 2114;
      uint64_t v53 = v20;
      __int16 v54 = 2114;
      uint64_t v55 = v21;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "UTI not found for syndication ingest: %{public}@ item %{public}@ bundleID %{public}@", buf, 0x20u);
    }

    id v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F8C500];
    uint64_t v48 = *MEMORY[0x1E4F28228];
    int64_t v24 = [NSString stringWithFormat:@"UTI not found for syndication ingest of item %@ bundleID %@", *(void *)(a1 + 32), *(void *)(a1 + 40)];
    uint64_t v49 = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    id v18 = [v22 errorWithDomain:v23 code:49504 userInfo:v25];

    goto LABEL_13;
  }
  if (!v8 || [v8 integerValue] > 0x100000)
  {
    char v10 = PLSyndicationGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      id v51 = v8;
      __int16 v52 = 2114;
      uint64_t v53 = v11;
      __int16 v54 = 2114;
      uint64_t v55 = v12;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Invalid size for syndication ingest: %{public}@ item %{public}@ bundleID %{public}@", buf, 0x20u);
    }

    if (v8) {
      uint64_t v13 = 49502;
    }
    else {
      uint64_t v13 = 49503;
    }
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F8C500];
    uint64_t v46 = *MEMORY[0x1E4F28228];
    id v16 = [NSString stringWithFormat:@"Invalid size for syndication ingest: %@ for item %@ bundleID %@", v8, *(void *)(a1 + 32), *(void *)(a1 + 40)];
    v47 = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    id v18 = [v14 errorWithDomain:v15 code:v13 userInfo:v17];

LABEL_13:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_14;
  }
  id v18 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v7];
  if (v18)
  {
    uint64_t v26 = [v8 integerValue];
    id v27 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
    uint64_t v28 = *(void *)(a1 + 32);
    uint64_t v29 = *(void *)(a1 + 64);
    uint64_t v37 = *(void *)(a1 + 40);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __134__PLSyndicationResourceDataStore__provideTemporaryFileURLFromDataForBundleID_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke_92;
    v38[3] = &unk_1E5870CF8;
    uint64_t v30 = *(void *)(a1 + 48);
    id v42 = *(id *)(a1 + 56);
    uint64_t v43 = v26;
    id v39 = *(id *)(a1 + 32);
    id v40 = *(id *)(a1 + 40);
    id v41 = v18;
    [v27 provideDataForBundle:v37 itemIdentifier:v28 typeIdentifier:v30 options:v29 completionHandler:v38];

    qos_class_t v31 = v42;
  }
  else
  {
    uint64_t v32 = *(void *)(a1 + 56);
    v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F8C500];
    uint64_t v44 = *MEMORY[0x1E4F28228];
    qos_class_t v31 = [NSString stringWithFormat:@"nil UTType for syndication ingest of item %@ bundleID %@", *(void *)(a1 + 32), *(void *)(a1 + 40)];
    uint64_t v45 = v31;
    int v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    id v36 = [v33 errorWithDomain:v34 code:49504 userInfo:v35];
    (*(void (**)(uint64_t, void, void *))(v32 + 16))(v32, 0, v36);
  }
LABEL_14:
}

void __134__PLSyndicationResourceDataStore__provideTemporaryFileURLFromDataForBundleID_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke_92(void *a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if ([v5 length] != a1[8])
    {
      id v7 = PLSyndicationGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = a1[8];
        uint64_t v9 = [v5 length];
        uint64_t v10 = a1[4];
        uint64_t v11 = (void *)a1[5];
        *(_DWORD *)buf = 134218754;
        uint64_t v42 = v8;
        __int16 v43 = 2048;
        uint64_t v44 = v9;
        __int16 v45 = 2114;
        uint64_t v46 = v10;
        __int16 v47 = 2114;
        uint64_t v48 = v11;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Warning: CoreSpotlight size %td != data length %tu for item %{public}@ bundleID %{public}@", buf, 0x2Au);
      }
    }
    if ((unint64_t)[v5 length] <= 0x100000)
    {
      uint64_t v21 = NSTemporaryDirectory();
      id v22 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v23 = [v22 UUIDString];
      int64_t v24 = [v21 stringByAppendingPathComponent:v23];

      uint64_t v20 = [v24 stringByAppendingPathExtensionForType:a1[6]];

      v25 = PLSyndicationGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = [v5 length];
        uint64_t v27 = a1[4];
        uint64_t v28 = a1[5];
        *(_DWORD *)buf = 134218754;
        uint64_t v42 = v26;
        __int16 v43 = 2114;
        uint64_t v44 = v27;
        __int16 v45 = 2114;
        uint64_t v46 = v28;
        __int16 v47 = 2112;
        uint64_t v48 = v20;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_INFO, "Writing temporary file for ingest %tu bytes, item %{public}@ bundleID %{public}@ to %@", buf, 0x2Au);
      }

      id v38 = 0;
      int v29 = [v5 writeToFile:v20 options:0 error:&v38];
      id v30 = v38;
      qos_class_t v31 = PLSyndicationGetLog();
      uint64_t v32 = v31;
      if (v29)
      {
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          uint64_t v33 = [v5 length];
          uint64_t v34 = a1[4];
          int v35 = (void *)a1[5];
          *(_DWORD *)buf = 134218754;
          uint64_t v42 = v33;
          __int16 v43 = 2112;
          uint64_t v44 = (uint64_t)v20;
          __int16 v45 = 2114;
          uint64_t v46 = v34;
          __int16 v47 = 2114;
          uint64_t v48 = v35;
          _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_INFO, "%tu bytes written to path %@ for item %{public}@ bundleID %{public}@", buf, 0x2Au);
        }

        uint64_t v36 = a1[7];
        uint64_t v37 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v20];
        (*(void (**)(uint64_t, void *, void))(v36 + 16))(v36, v37, 0);
      }
      else
      {
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v42 = (uint64_t)v20;
          __int16 v43 = 2112;
          uint64_t v44 = (uint64_t)v30;
          _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "Data write to file %@ failed: %@", buf, 0x16u);
        }

        (*(void (**)(void))(a1[7] + 16))();
      }
    }
    else
    {
      uint64_t v12 = PLSyndicationGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = [v5 length];
        uint64_t v14 = a1[4];
        uint64_t v15 = a1[5];
        *(_DWORD *)buf = 134218498;
        uint64_t v42 = v13;
        __int16 v43 = 2114;
        uint64_t v44 = v14;
        __int16 v45 = 2114;
        uint64_t v46 = v15;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Invalid size for syndication ingest: %tu item %{public}@ bundleID %{public}@", buf, 0x20u);
      }

      id v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F8C500];
      uint64_t v39 = *MEMORY[0x1E4F28228];
      id v18 = [NSString stringWithFormat:@"Data size %tu exceeds max allowable size for syndication ingest of item %@ bundleID %@", objc_msgSend(v5, "length"), a1[4], a1[5]];
      id v40 = v18;
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      uint64_t v20 = [v16 errorWithDomain:v17 code:49502 userInfo:v19];

      (*(void (**)(void))(a1[7] + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

+ (void)_provideFileURLsForBundleID:(id)a3 itemIdentifiers:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if ([a1 _shouldUseDataInterfaceForBundleID:v12])
  {
    id v30 = v15;
    id v34 = v12;
    context = (void *)MEMORY[0x19F38D3B0]();
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    queue = dispatch_queue_create("+[PLSyndicationResourceDataStore _provideFileURLsForBundleID:itemIdentifiers:typeIdentifier:options:completionHandler:]", v17);

    id v18 = dispatch_group_create();
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v31 = v13;
    obuint64_t j = v13;
    uint64_t v20 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v48 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          dispatch_group_enter(v18);
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __119__PLSyndicationResourceDataStore__provideFileURLsForBundleID_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke;
          v40[3] = &unk_1E5870CD0;
          id v41 = v18;
          v25 = queue;
          id v46 = a1;
          uint64_t v42 = v25;
          uint64_t v43 = v24;
          id v44 = v16;
          id v45 = v19;
          [a1 _provideTemporaryFileURLFromDataForBundleID:v34 itemIdentifier:v24 typeIdentifier:v14 options:a6 completionHandler:v40];
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v21);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __119__PLSyndicationResourceDataStore__provideFileURLsForBundleID_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke_3;
    block[3] = &unk_1E58710F0;
    id v15 = v30;
    id v39 = v30;
    id v36 = v16;
    id v37 = v19;
    id v38 = obj;
    id v26 = v19;
    id v27 = v16;
    dispatch_group_notify(v18, queue, block);

    id v12 = v34;
    id v13 = v31;
  }
  else
  {
    uint64_t v28 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
    [v28 provideFileURLsForBundle:v12 itemIdentifiers:v13 typeIdentifier:v14 options:a6 completionHandler:v15];
  }
}

void __119__PLSyndicationResourceDataStore__provideFileURLsForBundleID_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(a1 + 32);
  uint64_t v8 = *(NSObject **)(a1 + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __119__PLSyndicationResourceDataStore__provideFileURLsForBundleID_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke_2;
  v14[3] = &unk_1E5870CA8;
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void **)(a1 + 56);
  id v15 = v5;
  uint64_t v16 = v10;
  uint64_t v20 = v9;
  id v17 = v6;
  id v18 = v11;
  id v19 = *(id *)(a1 + 64);
  id v12 = v6;
  id v13 = v5;
  dispatch_group_async(v7, v8, v14);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __119__PLSyndicationResourceDataStore__provideFileURLsForBundleID_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * v6), (void)v10);
        id v8 = [v7 error];
        if (!v8)
        {
          uint64_t v9 = [v7 url];

          if (!v9) {
            goto LABEL_10;
          }
          id v8 = [v7 url];
          unlink((const char *)[v8 fileSystemRepresentation]);
        }

LABEL_10:
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

uint64_t __119__PLSyndicationResourceDataStore__provideFileURLsForBundleID_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 72) _addTemporaryURL:*(void *)(a1 + 32) itemIdentifier:*(void *)(a1 + 40) error:*(void *)(a1 + 48) toResults:*(void *)(a1 + 56) andFileHandles:*(void *)(a1 + 64)];
}

+ (void)_addTemporaryURL:(id)a3 itemIdentifier:(id)a4 error:(id)a5 toResults:(id)a6 andFileHandles:(id)a7
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v14)
  {
    if (v13)
    {
LABEL_3:
      id v18 = [v13 path];
      uint64_t v19 = open((const char *)[v18 fileSystemRepresentation], 0);

      if ((v19 & 0x80000000) != 0)
      {
        int v21 = *__error();
        uint64_t v22 = PLSyndicationGetLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = [v13 path];
          *(_DWORD *)buf = 67109378;
          int v38 = v21;
          __int16 v39 = 2112;
          id v40 = v23;
          _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "open failed with errno %d for file at path %@", buf, 0x12u);
        }
        if (!v15)
        {
          uint64_t v24 = v21;
          v25 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v26 = *MEMORY[0x1E4F28798];
          uint64_t v35 = *MEMORY[0x1E4F289D0];
          id v36 = v13;
          id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
          id v15 = [v25 errorWithDomain:v26 code:v24 userInfo:v27];
        }
      }
      else
      {
        uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v19 closeOnDealloc:1];
        [v17 addObject:v20];
      }
      uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F237D8]) initWithFileURL:v13 andError:v15];
      goto LABEL_14;
    }
  }
  else
  {
    int v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"PLSyndicationResourceDataStore.m", 334, @"Invalid parameter not satisfying: %@", @"itemIdentifier" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  if (!v15)
  {
    id v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, a1, @"PLSyndicationResourceDataStore.m", 350, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];
  }
  id v30 = objc_alloc(MEMORY[0x1E4F237D8]);
  id v31 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v32 = NSTemporaryDirectory();
  uint64_t v33 = [v31 fileURLWithPath:v32];
  uint64_t v28 = (void *)[v30 initWithFileURL:v33 andError:v15];

LABEL_14:
  [v16 setObject:v28 forKeyedSubscript:v14];
}

+ (void)_provideFileURLForBundleID:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if ([a1 _shouldUseDataInterfaceForBundleID:v12])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __117__PLSyndicationResourceDataStore__provideFileURLForBundleID_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke;
    v17[3] = &unk_1E5870C80;
    id v18 = v15;
    [a1 _provideTemporaryFileURLFromDataForBundleID:v12 itemIdentifier:v13 typeIdentifier:v14 options:a6 completionHandler:v17];
  }
  else
  {
    id v16 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
    [v16 provideFileURLForBundle:v12 itemIdentifier:v13 typeIdentifier:v14 options:a6 completionHandler:v15];
  }
}

void __117__PLSyndicationResourceDataStore__provideFileURLForBundleID_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = v4;
  if (v4)
  {
    unlink((const char *)[v4 fileSystemRepresentation]);
    uint64_t v3 = v4;
  }
}

+ (BOOL)_shouldUseDataInterfaceForBundleID:(id)a3
{
  return [a3 isEqualToString:@"com.apple.Stickers"];
}

+ (void)_provideFileURLAndUnwrapLivePhotoIfNeededForBundleID:(id)a3 syndicationIdentifier:(id)a4 typeIdentifier:(id)a5 isLivePhoto:(BOOL)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a8;
  id v16 = a5;
  id v17 = PLSyndicationGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v27 = v13;
    __int16 v28 = 2114;
    id v29 = v14;
    __int16 v30 = 2048;
    int64_t v31 = a7;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "[resource] making file provider request with bundleID: %{public}@, syndicationID: %{public}@, options: %lu", buf, 0x20u);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __162__PLSyndicationResourceDataStore__provideFileURLAndUnwrapLivePhotoIfNeededForBundleID_syndicationIdentifier_typeIdentifier_isLivePhoto_options_completionHandler___block_invoke;
  v21[3] = &unk_1E5870C50;
  id v24 = v15;
  id v25 = a1;
  id v22 = v13;
  id v23 = v14;
  id v18 = v14;
  id v19 = v13;
  id v20 = v15;
  [a1 _provideFileURLForBundleID:v19 itemIdentifier:v18 typeIdentifier:v16 options:a7 completionHandler:v21];
}

void __162__PLSyndicationResourceDataStore__provideFileURLAndUnwrapLivePhotoIfNeededForBundleID_syndicationIdentifier_typeIdentifier_isLivePhoto_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  if (v6)
  {
    id v7 = PLSyndicationGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v28 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "[resource] error from provideFileURL: %@", buf, 0xCu);
    }
LABEL_12:
    LOBYTE(v8) = 0;
    goto LABEL_13;
  }
  if (![MEMORY[0x1E4F8B9C8] fileURLHasSecurityScope:v5])
  {
    id v7 = PLSyndicationGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      long long v11 = [v5 path];
      *(_DWORD *)buf = 138412290;
      __int16 v28 = v11;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "[resource] providerURL does not have security scope for path %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  int v8 = [v5 startAccessingSecurityScopedResource];
  id v7 = PLSyndicationGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (v8) {
      uint64_t v9 = @"was";
    }
    else {
      uint64_t v9 = @"was not";
    }
    long long v10 = [v5 path];
    *(_DWORD *)buf = 138412546;
    __int16 v28 = v9;
    __int16 v29 = 2112;
    __int16 v30 = v10;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "[resource] providerURL has security scope. accessing %@ started for URL path %@", buf, 0x16u);
  }
LABEL_13:

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __162__PLSyndicationResourceDataStore__provideFileURLAndUnwrapLivePhotoIfNeededForBundleID_syndicationIdentifier_typeIdentifier_isLivePhoto_options_completionHandler___block_invoke_67;
  v23[3] = &unk_1E5870C28;
  id v25 = *(id *)(a1 + 48);
  char v26 = v8;
  id v12 = v5;
  id v24 = v12;
  id v13 = (void (**)(void, void, void, void))MEMORY[0x19F38D650](v23);
  id v14 = [v12 pathExtension];
  int v15 = [v14 isEqualToString:*MEMORY[0x1E4F8CED8]];

  if (v15)
  {
    id v16 = *(void **)(a1 + 56);
    id v21 = 0;
    id v22 = 0;
    id v20 = v6;
    [v16 _unpackPVTBundleAtURL:v12 primaryURL:&v22 secondaryURL:&v21 error:&v20];
    id v17 = v22;
    id v18 = v21;
    id v19 = v20;

    uint64_t v6 = v19;
  }
  else
  {
    id v17 = v12;
    id v18 = 0;
  }
  ((void (**)(void, id, id, __CFString *))v13)[2](v13, v17, v18, v6);
}

uint64_t __162__PLSyndicationResourceDataStore__provideFileURLAndUnwrapLivePhotoIfNeededForBundleID_syndicationIdentifier_typeIdentifier_isLivePhoto_options_completionHandler___block_invoke_67(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 stopAccessingSecurityScopedResource];
  }
  return result;
}

+ (BOOL)_unpackPVTBundleAtURL:(id)a3 primaryURL:(id *)a4 secondaryURL:(id *)a5 error:(id *)a6
{
  v31[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (objc_class *)MEMORY[0x1E4F8CE20];
  id v10 = a3;
  long long v11 = (void *)[[v9 alloc] initWithBundleAtURL:v10];

  if (v11
    && ([v11 imagePath], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v13 = (void *)v12,
        [v11 videoPath],
        id v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        v14))
  {
    int v15 = PLSyndicationGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v29 = 0;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "[resource] found image and video complement in live photo bundle", v29, 2u);
    }

    id v16 = (void *)MEMORY[0x1E4F1CB10];
    id v17 = [v11 imagePath];
    id v18 = [v16 fileURLWithPath:v17 isDirectory:0];

    id v19 = (void *)MEMORY[0x1E4F1CB10];
    id v20 = [v11 videoPath];
    id v21 = [v19 fileURLWithPath:v20 isDirectory:0];
    id v22 = 0;
    BOOL v23 = 1;
  }
  else
  {
    id v24 = PLSyndicationGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v29 = 0;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "[resource] unable to unpack live photo bundle", v29, 2u);
    }

    id v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F8C520];
    uint64_t v30 = *MEMORY[0x1E4F28228];
    v31[0] = @"Unable to unpack live photo bundle";
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    id v22 = [v25 errorWithDomain:v26 code:4 userInfo:v20];
    BOOL v23 = 0;
    id v21 = 0;
    id v18 = 0;
  }

  if (a4) {
    *a4 = v18;
  }
  if (a5) {
    *a5 = v21;
  }
  if (a6) {
    char v27 = v23;
  }
  else {
    char v27 = 1;
  }
  if ((v27 & 1) == 0) {
    *a6 = v22;
  }

  return v23;
}

+ (BOOL)_markSyndicationResourceAsLocallyAvailableWithURL:(id)a3 resource:(id)a4 inode:(unint64_t)a5 error:(id *)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = v12;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, a1, @"PLSyndicationResourceDataStore.m", 83, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];

    if (v13)
    {
LABEL_3:
      if (!a5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  id v36 = [MEMORY[0x1E4F28B00] currentHandler];
  [v36 handleFailureInMethod:a2, a1, @"PLSyndicationResourceDataStore.m", 84, @"Invalid parameter not satisfying: %@", @"resource" object file lineNumber description];

  if (a5) {
LABEL_4:
  }
    [v13 setFileID:a5];
LABEL_5:
  uint64_t v14 = [v13 resourceType];
  uint64_t v15 = [v13 version];
  uint64_t v16 = [v13 recipeID];
  id v17 = [v13 uniformTypeIdentifier];
  id v18 = +[PLResourceInstaller generatedValidatedExternalSyndicationResourceOfType:v14 version:v15 recipeID:v16 fileURL:v11 requireFileToBePresent:1 uniformTypeIdentifier:v17];

  if (v18)
  {
    id v19 = [PLPrimaryResourceDataStoreKey alloc];
    id v20 = [v13 asset];
    id v21 = [(PLPrimaryResourceDataStoreKey *)v19 initFromExistingLocationOfExternalResource:v18 asset:v20];

    id v22 = [v21 keyData];
    [v13 setDataStoreKeyData:v22];

    objc_msgSend(v13, "setDataLength:", objc_msgSend(v18, "dataLength"));
    [v13 setSyndicationLocalAvailabilityWithAvailable:1];
    BOOL v23 = [v13 fileURL];
    id v24 = v23;
    if (v23)
    {
      if ([(__CFString *)v23 isEqual:v11])
      {
        id v25 = PLSyndicationGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = [v13 singleLineDescription];
          *(_DWORD *)buf = 138412290;
          int v38 = v26;
          _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "[resource] marked resource as locally available: %@", buf, 0xCu);
        }
        BOOL v27 = 1;
        goto LABEL_20;
      }
      __int16 v28 = [NSString stringWithFormat:@"Resource data store key url: (%@) does not match initial syndication resource url: (%@)", v24, v11];
    }
    else
    {
      __int16 v28 = @"Failed to store syndication resource data store key data, url is nil";
    }

    id v24 = v28;
  }
  else
  {
    id v24 = @"Failed to generate external resource, file may not be present";
  }
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v29 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F28228]];
  uint64_t v30 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C520] code:4 userInfo:v29];
  uint64_t v31 = PLSyndicationGetLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    uint64_t v32 = [v13 singleLineDescription];
    *(_DWORD *)buf = 138412546;
    int v38 = v32;
    __int16 v39 = 2112;
    id v40 = v30;
    _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "[resource] failed to mark resource (%@) as locally available with error: %@", buf, 0x16u);
  }
  uint64_t v33 = v30;
  id v25 = v33;
  BOOL v27 = 0;
  if (a6) {
    *a6 = v33;
  }
  id v21 = v25;
LABEL_20:

  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_imageConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_libraryBundle, 0);
}

- (id)metadataForResourceGenerator:(id)a3 fromFileURL:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F8CC48];
  id v6 = a4;
  id v7 = [v5 alloc];
  int v8 = [(PLPhotoLibraryBundle *)self->_libraryBundle timeZoneLookup];
  uint64_t v9 = (void *)[v7 initWithImageURL:v6 contentType:0 options:13 timeZoneLookup:v8 cacheImageSource:1 cacheImageData:1];

  return v9;
}

- (id)videoConversionClientForResourceGenerator:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (!v5->_videoConversionServiceClient)
  {
    id v6 = (PAVideoConversionServiceClient *)objc_alloc_init(MEMORY[0x1E4F748E0]);
    videoConversionServiceClient = v5->_videoConversionServiceClient;
    v5->_videoConversionServiceClient = v6;
  }
  objc_sync_exit(v5);

  int v8 = v5->_videoConversionServiceClient;
  return v8;
}

- (id)imageConversionClientForResourceGenerator:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (!v5->_imageConversionServiceClient)
  {
    id v6 = (PAImageConversionServiceClient *)objc_alloc_init(MEMORY[0x1E4F74898]);
    imageConversionServiceClient = v5->_imageConversionServiceClient;
    v5->_imageConversionServiceClient = v6;
  }
  objc_sync_exit(v5);

  int v8 = v5->_imageConversionServiceClient;
  return v8;
}

- (BOOL)canMarkAsynchronousLocalRenderAsOptionalForProgress:(id)a3
{
  return 0;
}

- (BOOL)canStreamResource:(id)a3
{
  return 0;
}

- (BOOL)videoResource:(id)a3 matchesOrExceedsQualityLevel:(unsigned int)a4
{
  return 0;
}

- (BOOL)dataStoreSubtypeIsDownloadable:(int64_t)a3
{
  return 1;
}

- (id)requestLocalAvailabilityChange:(signed __int16)a3 forResource:(id)a4 options:(id)a5 completion:(id)a6
{
  v148[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (!v9)
  {
    uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F8C520];
    uint64_t v147 = *MEMORY[0x1E4F28228];
    v148[0] = @"nil resource";
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v148 forKeys:&v147 count:1];
    uint64_t v32 = [v30 errorWithDomain:v31 code:4 userInfo:v15];
    (*((void (**)(id, void *, void, void))v11 + 2))(v11, v32, 0, 0);

    goto LABEL_58;
  }
  if (!self->_libraryBundle)
  {
    id v12 = [v9 photoLibrary];
    id v13 = [v12 libraryBundle];
    libraryBundle = self->_libraryBundle;
    self->_libraryBundle = v13;
  }
  uint64_t v15 = [v9 asset];
  uint64_t v16 = [v15 uniformTypeIdentifier];

  if (v16) {
    goto LABEL_5;
  }
  unsigned int v33 = [v15 kind];
  if (v33 - 2 < 2)
  {
    uint64_t v52 = PLSyndicationGetLog();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      id v53 = v10;
      __int16 v54 = [v10 taskIdentifier];
      uint64_t v55 = [v15 uuid];
      unsigned int v56 = [v15 kind];
      if (v56 > 3) {
        long long v57 = 0;
      }
      else {
        long long v57 = off_1E5865870[(unsigned __int16)v56];
      }
      id v63 = v57;
      *(_DWORD *)buf = 138543874;
      v142 = v54;
      __int16 v143 = 2114;
      v144 = v55;
      __int16 v145 = 2114;
      v146 = v63;
      _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_ERROR, "[resource] %{public}@ asset (%{public}@) of type %{public}@ missing UTI, request will fail", buf, 0x20u);

      id v10 = v53;
    }

    goto LABEL_39;
  }
  if (v33 > 1)
  {
LABEL_39:
    id v120 = v10;
    long long v64 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v65 = *MEMORY[0x1E4F8C520];
    uint64_t v139 = *MEMORY[0x1E4F28228];
    long long v66 = NSString;
    long long v67 = [v15 uuid];
    unsigned int v68 = [v15 kind];
    if (v68 > 3) {
      uint64_t v69 = 0;
    }
    else {
      uint64_t v69 = off_1E5865870[(unsigned __int16)v68];
    }
    __int16 v70 = v69;
    uint64_t v71 = [v66 stringWithFormat:@"asset %@ missing UTI and invalid type %@", v67, v70];
    v140 = v71;
    __int16 v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
    v73 = [v64 errorWithDomain:v65 code:4 userInfo:v72];
    (*((void (**)(id, void *, void, void))v11 + 2))(v11, v73, 0, 0);

    id v10 = v120;
    goto LABEL_58;
  }
  id v34 = PLSyndicationGetLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    id v35 = v10;
    id v36 = [v10 taskIdentifier];
    id v37 = [v15 uuid];
    unsigned int v38 = [v15 kind];
    if (v38 > 3) {
      __int16 v39 = 0;
    }
    else {
      __int16 v39 = off_1E5865870[(unsigned __int16)v38];
    }
    id v62 = v39;
    *(_DWORD *)buf = 138543874;
    v142 = v36;
    __int16 v143 = 2114;
    v144 = v37;
    __int16 v145 = 2114;
    v146 = v62;
    _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "[resource] %{public}@ asset (%{public}@) of type %{public}@ missing UTI, request will attempt to continue", buf, 0x20u);

    id v10 = v35;
  }

LABEL_5:
  if (PLSyndicationAssetRequiresBlastDoorToAccessOriginals(v15))
  {
    uint64_t v17 = [v15 uniformTypeIdentifier];
    if (v17)
    {
      id v18 = (void *)v17;
      id v19 = (void *)MEMORY[0x1E4F442D8];
      [v15 uniformTypeIdentifier];
      id v21 = v20 = v10;
      id v22 = [v19 typeWithIdentifier:v21];
      int v23 = [v22 conformsToType:*MEMORY[0x1E4F44498]];

      id v10 = v20;
      if (v23)
      {
        id v24 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v25 = *MEMORY[0x1E4F8C520];
        uint64_t v137 = *MEMORY[0x1E4F28228];
        v138 = @"Unable to decode syndication RAW image";
        uint64_t v26 = (void *)MEMORY[0x1E4F1C9E8];
        BOOL v27 = &v138;
        __int16 v28 = &v137;
LABEL_32:
        id v60 = [v26 dictionaryWithObjects:v27 forKeys:v28 count:1];
        id v61 = [v24 errorWithDomain:v25 code:4 userInfo:v60];
        (*((void (**)(id, void *, void, void))v11 + 2))(v11, v61, 0, 0);

        id v10 = v20;
        goto LABEL_58;
      }
    }
  }
  if ([v9 dataStoreSubtype] == 1 || objc_msgSend(v9, "dataStoreSubtype") == 18)
  {
    id v29 = [(PLSyndicationResourceDataStore *)self _requestLocalAvailabilityChangeForSyndicationOriginalResource:v9 options:v10 completion:v11];
  }
  else
  {
    uint64_t v40 = [v9 dataStoreSubtype];
    uint64_t v41 = PLSyndicationGetLog();
    uint64_t v42 = v41;
    if (v40 != 4)
    {
      id v20 = v10;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        long long v58 = [v10 taskIdentifier];
        id v59 = [v9 singleLineDescription];
        *(_DWORD *)buf = 138543618;
        v142 = v58;
        __int16 v143 = 2112;
        v144 = v59;
        _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_ERROR, "[resource] %{public}@ resource (%@) unsupported by syndication data store", buf, 0x16u);
      }
      id v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F8C520];
      uint64_t v133 = *MEMORY[0x1E4F28228];
      v134 = @"resource unuspported by syndication data store";
      uint64_t v26 = (void *)MEMORY[0x1E4F1C9E8];
      BOOL v27 = &v134;
      __int16 v28 = &v133;
      goto LABEL_32;
    }
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v43 = [v10 taskIdentifier];
      [v15 uuid];
      id v45 = v44 = v10;
      *(_DWORD *)buf = 138543618;
      v142 = v43;
      __int16 v143 = 2114;
      v144 = v45;
      _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_DEFAULT, "[resource] %{public}@ on demand request for derivative image for asset: %{public}@", buf, 0x16u);

      id v10 = v44;
    }

    char v132 = 0;
    id v130 = 0;
    id v131 = 0;
    id v46 = [(PLSyndicationResourceDataStore *)self _getDestinationURLAndFixLocalAvailabilityIfNeededForResource:v9 fileIdentifier:&v131 isLocallyAvailable:&v132 error:&v130];
    id v47 = v131;
    id v48 = v130;
    long long v49 = v48;
    if (v46)
    {
      if (v132)
      {
        long long v50 = PLSyndicationGetLog();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          id v51 = [v10 taskIdentifier];
          *(_DWORD *)buf = 138543618;
          v142 = v51;
          __int16 v143 = 2112;
          v144 = v46;
          _os_log_impl(&dword_19B3C7000, v50, OS_LOG_TYPE_DEFAULT, "[resource] %{public}@ resource is already local at url: %@", buf, 0x16u);
        }
        (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v46);
      }
      else
      {
        id v116 = v47;
        v84 = [v9 asset];
        v85 = [v84 syndicationOriginalResource];

        v114 = v85;
        if (v85)
        {
          v118 = v49;
          v119 = v46;
          v121 = v10;
          v113 = [v85 objectID];
          v86 = [v85 photoLibrary];
          v87 = [v9 asset];
          unsigned int v110 = [v9 resourceType];
          uint64_t v88 = [v9 version];
          uint64_t v89 = [v9 recipeID];
          v90 = [v9 uniformTypeIdentifier];
          v91 = [v90 identifier];
          id v129 = 0;
          uint64_t v92 = [v87 syndicationResourceURLForResourceType:v110 version:v88 recipeID:v89 utiString:v91 error:&v129];
          id v93 = v129;

          v94 = (void *)v92;
          v111 = v93;
          v112 = v86;
          if (v92)
          {
            v122[0] = MEMORY[0x1E4F143A8];
            v122[1] = 3221225472;
            v122[2] = __96__PLSyndicationResourceDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke;
            v122[3] = &unk_1E5870E38;
            id v10 = v121;
            id v123 = v121;
            id v124 = v86;
            id v125 = v113;
            v126 = self;
            id v128 = v11;
            id v127 = v94;
            v95 = v114;
            id v96 = [(PLSyndicationResourceDataStore *)self _requestLocalAvailabilityChangeForSyndicationOriginalResource:v114 options:v123 completion:v122];

            id v97 = v123;
          }
          else
          {
            v95 = v114;
            id v97 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            [v97 setObject:@"missing destination url" forKeyedSubscript:*MEMORY[0x1E4F28228]];
            id v10 = v121;
            if (v93) {
              [v97 setObject:v93 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
            }
            v108 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C520] code:4 userInfo:v97];
            (*((void (**)(id, void *, void, void))v11 + 2))(v11, v108, 0, 0);
          }
          id v47 = v116;
          long long v49 = v118;

          id v46 = v119;
          v107 = v112;
          v106 = v113;
        }
        else
        {
          v98 = PLSyndicationGetLog();
          id v47 = v116;
          if (os_log_type_enabled(v98, OS_LOG_TYPE_FAULT))
          {
            v99 = [v9 asset];
            [v99 syndicationDescription];
            v101 = id v100 = v10;
            *(_DWORD *)buf = 138543362;
            v142 = v101;
            _os_log_impl(&dword_19B3C7000, v98, OS_LOG_TYPE_FAULT, "Syndication asset %{public}@ missing original resource", buf, 0xCu);

            id v10 = v100;
            id v47 = v116;
          }
          v102 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v103 = *MEMORY[0x1E4F8C520];
          uint64_t v135 = *MEMORY[0x1E4F28228];
          v136 = @"missing original resource";
          uint64_t v104 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
          v105 = v102;
          v106 = (void *)v104;
          v107 = [v105 errorWithDomain:v103 code:4 userInfo:v104];
          (*((void (**)(id, void *, void, void))v11 + 2))(v11, v107, 0, 0);
          v95 = 0;
        }
      }
    }
    else
    {
      id v117 = v48;
      __int16 v74 = PLSyndicationGetLog();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      {
        v75 = [v10 taskIdentifier];
        [v15 uuid];
        id v115 = v47;
        v77 = id v76 = v10;
        v78 = [v9 singleLineDescription];
        *(_DWORD *)buf = 138543874;
        v142 = v75;
        __int16 v143 = 2114;
        v144 = v77;
        __int16 v145 = 2112;
        v146 = v78;
        _os_log_impl(&dword_19B3C7000, v74, OS_LOG_TYPE_ERROR, "[resource] %{public}@ unable to resolve destination url for asset %{public}@, resource: %@", buf, 0x20u);

        id v10 = v76;
        id v47 = v115;
      }
      uint64_t v79 = NSString;
      v80 = [v15 uuid];
      v81 = [v9 singleLineDescription];
      v82 = [v79 stringWithFormat:@"Unable to resolve destination url for syndication asset: %@, resource: %@", v80, v81];
      long long v49 = v117;
      v83 = PLResourceDataStoreErrorCreate();
      (*((void (**)(id, void *, void, void))v11 + 2))(v11, v83, 0, 0);

      id v46 = 0;
    }
  }
LABEL_58:

  return 0;
}

void __96__PLSyndicationResourceDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = PLSyndicationGetLog();
  int v8 = v7;
  if (a4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) taskIdentifier];
      *(_DWORD *)buf = 138543362;
      id v22 = v9;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "[resource] %{public}@ request for derivative image made original resource available, requesting sanitization", buf, 0xCu);
    }
    id v10 = *(void **)(a1 + 40);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __96__PLSyndicationResourceDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_169;
    v14[3] = &unk_1E58751C0;
    id v15 = v10;
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    id v16 = v11;
    uint64_t v17 = v12;
    id v18 = *(id *)(a1 + 32);
    id v20 = *(id *)(a1 + 72);
    id v19 = *(id *)(a1 + 64);
    [v15 performBlock:v14];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v13 = [*(id *)(a1 + 32) taskIdentifier];
      *(_DWORD *)buf = 138543618;
      id v22 = v13;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "[resource] %{public}@ unable to make original resource available, will fail request for derivative image, error: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __96__PLSyndicationResourceDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_169(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = [v2 existingObjectWithID:*(void *)(a1 + 40) error:0];

  if (v3)
  {
    id v4 = [[PLSyndicationSanitizedResourceGenerator alloc] initWithDelegate:*(void *)(a1 + 48)];
    id v5 = PLSyndicationGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 56) taskIdentifier];
      id v7 = [v3 singleLineDescription];
      *(_DWORD *)buf = 138543618;
      __int16 v23 = v6;
      __int16 v24 = 2112;
      uint64_t v25 = v7;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "[resource] %{public}@ attempting to generate sanitized derivatives from resource: %@", buf, 0x16u);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __96__PLSyndicationResourceDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_171;
    v15[3] = &unk_1E5870E10;
    id v16 = *(id *)(a1 + 32);
    id v17 = *(id *)(a1 + 56);
    id v19 = *(id *)(a1 + 72);
    id v18 = *(id *)(a1 + 64);
    [(PLSyndicationSanitizedResourceGenerator *)v4 generateAndStoreDerivativeResourcesForSyndicationResource:v3 completion:v15];

    int v8 = v16;
  }
  else
  {
    id v9 = PLSyndicationGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [*(id *)(a1 + 56) taskIdentifier];
      id v11 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      __int16 v23 = v10;
      __int16 v24 = 2112;
      uint64_t v25 = v11;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "[resource] %{public}@ unable to refetch original resource (%@)", buf, 0x16u);
    }
    uint64_t v12 = *(void *)(a1 + 72);
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F8C520];
    uint64_t v20 = *MEMORY[0x1E4F28228];
    id v21 = @"unable to referch original resource";
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    int v8 = [v13 errorWithDomain:v14 code:4 userInfo:v4];
    (*(void (**)(uint64_t, void *, void, void))(v12 + 16))(v12, v8, 0, 0);
  }
}

void __96__PLSyndicationResourceDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_171(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) managedObjectContext];
  if (v9 == v7)
  {
    id v10 = [*(id *)(a1 + 32) managedObjectContext];
  }
  else
  {
    id v10 = v7;
  }
  id v11 = v10;

  if ([v11 hasChanges])
  {
    id v20 = 0;
    char v12 = [v11 save:&v20];
    id v13 = v20;
    uint64_t v14 = v13;
    if ((v12 & 1) == 0)
    {
      if (!v8) {
        id v8 = v13;
      }
      id v15 = PLSyndicationGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = [*(id *)(a1 + 40) taskIdentifier];
        *(_DWORD *)buf = 138543618;
        id v22 = v16;
        __int16 v23 = 2112;
        id v24 = v14;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "[resource] %{public}@ failed to save changes with error %@", buf, 0x16u);
      }
    }
  }
  if (a2)
  {
    id v17 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    id v18 = PLSyndicationGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = [*(id *)(a1 + 40) taskIdentifier];
      *(_DWORD *)buf = 138543618;
      id v22 = v19;
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "[resource] %{public}@ failed to generate derivatives with error: %@", buf, 0x16u);
    }
    id v17 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v17();
}

- (id)_requestLocalAvailabilityChangeForSyndicationOriginalResource:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v43 = a4;
  id v9 = a5;
  id v10 = [v8 asset];
  uint64_t v40 = [v10 pathManager];
  uint64_t v42 = [v10 uuid];
  id v11 = [v10 filename];
  BOOL v12 = v11 == 0;

  __int16 v39 = [v8 objectID];
  char v61 = 0;
  id v59 = 0;
  id v60 = 0;
  id v13 = [(PLSyndicationResourceDataStore *)self _getDestinationURLAndFixLocalAvailabilityIfNeededForResource:v8 fileIdentifier:&v60 isLocallyAvailable:&v61 error:&v59];
  id v38 = v60;
  id v41 = v59;
  if (v13)
  {
    if (v61)
    {
      uint64_t v14 = PLSyndicationGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v43 taskIdentifier];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v15;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v42;
        *(_WORD *)&buf[22] = 2112;
        id v63 = v13;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "[resource] %{public}@ original resource for asset %{public}@ is already local at url: %@", buf, 0x20u);
      }
      (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v13);
    }
    else
    {
      BOOL v24 = [v10 kind] == 0;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v63) = 0;
      LOBYTE(v63) = [v10 kindSubtype] == 2;
      BOOL v25 = [v8 resourceType] == 3;
      uint64_t v26 = [v10 additionalAttributes];
      id v36 = [v26 syndicationIdentifier];

      BOOL v27 = [v10 additionalAttributes];
      id v37 = [v27 importedByBundleIdentifier];

      __int16 v28 = [v8 photoLibrary];
      BOOL v35 = v24;
      uint64_t v34 = PLSyndicationCSProvideOptionsFromRequestOptions(v43, v37);
      unsigned int v33 = objc_opt_class();
      id v29 = [v10 uniformTypeIdentifier];
      uint64_t v30 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __115__PLSyndicationResourceDataStore__requestLocalAvailabilityChangeForSyndicationOriginalResource_options_completion___block_invoke;
      v44[3] = &unk_1E5870DE8;
      BOOL v56 = v12;
      id v31 = v28;
      id v45 = v31;
      id v46 = v10;
      uint64_t v55 = buf;
      id v47 = v43;
      id v48 = self;
      BOOL v57 = v25;
      id v49 = v40;
      id v50 = v38;
      id v51 = v39;
      id v52 = v13;
      BOOL v58 = v35;
      id v53 = v42;
      id v54 = v9;
      [v33 _provideFileURLAndUnwrapLivePhotoIfNeededForBundleID:v37 syndicationIdentifier:v36 typeIdentifier:v29 isLivePhoto:v30 options:v34 completionHandler:v44];

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    id v16 = PLSyndicationGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = [v43 taskIdentifier];
      id v18 = [v8 singleLineDescription];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v42;
      *(_WORD *)&buf[22] = 2112;
      id v63 = v18;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "[resource] %{public}@ unable to resolve destination url for asset %{public}@, resource: %@", buf, 0x20u);
    }
    id v19 = NSString;
    id v20 = [v10 uuid];
    id v21 = [v8 singleLineDescription];
    id v22 = [v19 stringWithFormat:@"Unable to resolve destination url for syndication asset: %@, resource: %@", v20, v21];
    __int16 v23 = PLResourceDataStoreErrorCreate();
    (*((void (**)(id, void *, void, void))v9 + 2))(v9, v23, 0, 0);
  }
  return 0;
}

void __115__PLSyndicationResourceDataStore__requestLocalAvailabilityChangeForSyndicationOriginalResource_options_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v55 = 0;
  BOOL v56 = (id *)&v55;
  uint64_t v57 = 0x3032000000;
  BOOL v58 = __Block_byref_object_copy__89376;
  id v59 = __Block_byref_object_dispose__89377;
  id v9 = a4;
  id v60 = v9;
  uint64_t v51 = 0;
  id v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 1;
  if (v7)
  {
    if (*(unsigned char *)(a1 + 120))
    {
      id v10 = *(void **)(a1 + 32);
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __115__PLSyndicationResourceDataStore__requestLocalAvailabilityChangeForSyndicationOriginalResource_options_completion___block_invoke_2;
      v48[3] = &unk_1E5875E18;
      id v49 = v7;
      id v50 = *(id *)(a1 + 40);
      [v10 performTransactionAndWait:v48];
    }
    if (v8) {
      goto LABEL_13;
    }
  }
  else
  {
    id v11 = PLSyndicationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = [*(id *)(a1 + 48) taskIdentifier];
      id v13 = v56[5];
      *(_DWORD *)buf = 138543618;
      id v62 = v12;
      __int16 v63 = 2112;
      id v64 = v13;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "[resource] %{public}@ did not receive file url from provider, error: %@", buf, 0x16u);
    }
    *((unsigned char *)v52 + 24) = 0;
    if (v8) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24))
  {
    uint64_t v14 = PLSyndicationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = [*(id *)(a1 + 48) taskIdentifier];
      id v16 = v56[5];
      *(_DWORD *)buf = 138543618;
      id v62 = v15;
      __int16 v63 = 2112;
      id v64 = v16;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "[resource] %{public}@ did not receive video complement file url from provider, error: %@", buf, 0x16u);
    }
    *((unsigned char *)v52 + 24) = 0;
    uint64_t v47 = 0;
    goto LABEL_24;
  }
LABEL_13:
  int v17 = *((unsigned __int8 *)v52 + 24);
  uint64_t v47 = 0;
  if (!v17)
  {
LABEL_24:
    uint64_t v29 = *(void *)(a1 + 104);
    uint64_t v30 = [*(id *)(a1 + 56) _errorForUnderlyingError:v56[5]];
    (*(void (**)(uint64_t, void *, void, void))(v29 + 16))(v29, v30, 0, 0);

    goto LABEL_25;
  }
  id v18 = PLSyndicationGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [*(id *)(a1 + 48) taskIdentifier];
    *(_DWORD *)buf = 138543618;
    id v62 = v19;
    __int16 v63 = 2112;
    id v64 = v7;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "[resource] %{public}@ received file url from spotlight provider: %@", buf, 0x16u);
  }
  if (*(unsigned char *)(a1 + 121)) {
    id v20 = v8;
  }
  else {
    id v20 = v7;
  }
  id v21 = *(void **)(a1 + 56);
  uint64_t v22 = *(void *)(a1 + 64);
  uint64_t v23 = *(void *)(a1 + 72);
  BOOL v24 = v56;
  obuint64_t j = v56[5];
  char v25 = [v21 _copyAndMarkPurgeableItemAtURL:v20 withPathManager:v22 destFileIdentifier:v23 inode:&v47 error:&obj];
  objc_storeStrong(v24 + 5, obj);
  if ((v25 & 1) == 0)
  {
    *((unsigned char *)v52 + 24) = 0;
    goto LABEL_24;
  }
  if (!*((unsigned char *)v52 + 24)) {
    goto LABEL_24;
  }
  uint64_t v26 = *(void **)(a1 + 32);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  void v31[2] = __115__PLSyndicationResourceDataStore__requestLocalAvailabilityChangeForSyndicationOriginalResource_options_completion___block_invoke_156;
  v31[3] = &unk_1E5870DC0;
  id v32 = v26;
  id v27 = *(id *)(a1 + 80);
  uint64_t v40 = &v55;
  uint64_t v28 = *(void *)(a1 + 56);
  id v33 = v27;
  uint64_t v34 = v28;
  id v35 = *(id *)(a1 + 88);
  id v41 = &v51;
  char v44 = *(unsigned char *)(a1 + 122);
  uint64_t v42 = *(void *)(a1 + 112);
  uint64_t v43 = v47;
  id v36 = v8;
  id v37 = *(id *)(a1 + 48);
  id v38 = *(id *)(a1 + 96);
  char v45 = *(unsigned char *)(a1 + 121);
  id v39 = v7;
  [v32 performTransactionAndWait:v31];

  if (!*((unsigned char *)v52 + 24)) {
    goto LABEL_24;
  }
  (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
LABEL_25:
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);
}

void __115__PLSyndicationResourceDataStore__requestLocalAvailabilityChangeForSyndicationOriginalResource_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) lastPathComponent];
  uint64_t v3 = PLSyndicationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 40) uuid];
    int v5 = 138543618;
    id v6 = v4;
    __int16 v7 = 2112;
    id v8 = v2;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "[resource.prefetch] setting filename and directory for asset: %{public}@ with original filename: %@", (uint8_t *)&v5, 0x16u);
  }
  [*(id *)(a1 + 40) setSyndicationFilenameAndDirectoryWithOriginalFilename:v2];
}

void __115__PLSyndicationResourceDataStore__requestLocalAvailabilityChangeForSyndicationOriginalResource_options_completion___block_invoke_156(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 96) + 8);
  obuint64_t j = *(id *)(v4 + 40);
  int v5 = [v2 existingObjectWithID:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  if (!v5
    || (id v6 = objc_opt_class(),
        uint64_t v7 = *(void *)(a1 + 56),
        uint64_t v8 = *(void *)(a1 + 120),
        uint64_t v9 = *(void *)(*(void *)(a1 + 96) + 8),
        id v30 = *(id *)(v9 + 40),
        char v10 = [v6 _markSyndicationResourceAsLocallyAvailableWithURL:v7 resource:v5 inode:v8 error:&v30], objc_storeStrong((id *)(v9 + 40), v30), (v10 & 1) == 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
  }
  if (*(unsigned char *)(a1 + 128))
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24))
    {
      id v11 = *(void **)(a1 + 64);
      if (v11)
      {
        BOOL v12 = (void *)MEMORY[0x1E4F442D8];
        id v13 = [v11 pathExtension];
        uint64_t v14 = [v12 typeWithFilenameExtension:v13 conformingToType:*MEMORY[0x1E4F44448]];

        if (v14 && ([v14 isDynamic] & 1) == 0)
        {
          char v25 = [v5 asset];
          int v26 = [v25 becomeSyndicationLivePhotoWithVideoComplementContentType:v14];

          id v27 = PLSyndicationGetLog();
          id v15 = v27;
          if (v26)
          {
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v28 = [*(id *)(a1 + 72) taskIdentifier];
              *(_DWORD *)buf = 138543362;
              id v33 = v28;
              _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "[resource] %{public}@ received video complement URL, promoted photo to live photo", buf, 0xCu);
            }
            *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 1;
            goto LABEL_13;
          }
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            uint64_t v29 = *(void **)(a1 + 80);
            id v16 = [v14 identifier];
            *(_DWORD *)buf = 138543618;
            id v33 = v29;
            __int16 v34 = 2114;
            id v35 = v16;
            id v18 = "[resource] failed to promote asset to live photo: %{public}@, content type: %{public}@";
            goto LABEL_11;
          }
        }
        else
        {
          id v15 = PLSyndicationGetLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            id v16 = [*(id *)(a1 + 64) pathExtension];
            int v17 = *(void **)(a1 + 80);
            *(_DWORD *)buf = 138543618;
            id v33 = v16;
            __int16 v34 = 2114;
            id v35 = v17;
            id v18 = "[resource] ignoring video complement with unexpected uti for file extension: %{public}@, asset: %{public}@";
LABEL_11:
            _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, v18, buf, 0x16u);
          }
        }

LABEL_13:
      }
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24))
  {
    id v19 = PLSyndicationGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [*(id *)(a1 + 72) taskIdentifier];
      *(_DWORD *)buf = 138543362;
      id v33 = v20;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "[resource] %{public}@ attempting to make live photo paired resource locally available as well", buf, 0xCu);
    }
    char v21 = objc_msgSend(*(id *)(a1 + 48), "_copyAndMarkAsLocallyAvailablePairedLivePhotoResourceForRequestedResource:requestedVideoComplement:sourceURL:error:", v5);
    id v22 = 0;
    if ((v21 & 1) == 0)
    {
      uint64_t v23 = PLSyndicationGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        BOOL v24 = [*(id *)(a1 + 72) taskIdentifier];
        *(_DWORD *)buf = 138543618;
        id v33 = v24;
        __int16 v34 = 2112;
        id v35 = v22;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "[resource] %{public}@ failed to make paired live photo resource available with error: %@", buf, 0x16u);
      }
    }
  }
}

- (BOOL)storeExternalResource:(id)a3 forAsset:(id)a4 options:(id)a5 error:(id *)a6 resultingResource:(id *)a7
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2, self, @"PLSyndicationResourceDataStore.m", 823, @"Invalid parameter not satisfying: %@", @"externalResource" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  char v54 = [MEMORY[0x1E4F28B00] currentHandler];
  [v54 handleFailureInMethod:a2, self, @"PLSyndicationResourceDataStore.m", 824, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

LABEL_3:
  id v16 = [v14 managedObjectContext];
  if (v16)
  {
    int v17 = [v13 uniformTypeIdentifier];

    if (!v17)
    {
      id v18 = -[PLResourceDataStore guessUTIForExternalResource:forAssetKind:](self, "guessUTIForExternalResource:forAssetKind:", v13, [v14 kind]);
      [v13 setUniformTypeIdentifier:v18];

      id v19 = PLImageManagerGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [v14 uuid];
        *(_DWORD *)buf = 138543618;
        id v56 = v13;
        __int16 v57 = 2114;
        BOOL v58 = v20;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "[RM] guessed UTI for external resource: %{public}@ for asset uuid: %{public}@", buf, 0x16u);
      }
    }
    if ([v15 assumeNoExistingResources])
    {
      char v21 = [v14 objectID];
      id v22 = +[PLInternalResource insertResourceForAssetObjectID:v21 resourceIdentity:v13 inManagedObjectContext:v16];
    }
    else
    {
      id v22 = [v14 fetchOrCreateResourceWithIdentity:v13];
    }
    if ([v22 isInserted]) {
      [v22 ensureInitialValuesForSyndication];
    }
    id v30 = [v13 codecFourCharCode];

    if (v30)
    {
      id v31 = [v13 codecFourCharCode];
      [v22 setCodecFourCharCodeName:v31];
    }
    objc_msgSend(v22, "setUnorientedWidth:", objc_msgSend(v13, "unorientedWidth"));
    objc_msgSend(v22, "setUnorientedHeight:", objc_msgSend(v13, "unorientedHeight"));
    objc_msgSend(v22, "setDataLength:", objc_msgSend(v13, "dataLength"));
    id v32 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v33 = [v32 BOOLForKey:@"PADisablePhotosBlastDoorProcessing"];

    if ((v33 & 1) != 0 || [v13 version]) {
      int v34 = 1;
    }
    else {
      int v34 = [v13 recipeID] & 1;
    }
    id v35 = [v13 fileURL];

    id v28 = 0;
    char v36 = 1;
    if (v35 && v34)
    {
      id v37 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v38 = [v13 fileURL];
      id v39 = [v38 path];
      int v40 = [v37 fileExistsAtPath:v39];

      if (v40)
      {
        id v28 = [[PLPrimaryResourceDataStoreKey alloc] initFromExistingLocationOfExternalResource:v13 asset:v14];
        if (v28)
        {
          uint64_t v41 = [v22 dataStoreKey];
          if (v41)
          {
            uint64_t v42 = (void *)v41;
            uint64_t v43 = [v22 dataStoreKey];
            char v44 = [v28 isEqualToKey:v43];

            if ((v44 & 1) == 0)
            {
              char v45 = [v22 dataStoreKey];
              id v46 = [v14 assetID];
              uint64_t v47 = [v45 fileURLForAssetID:v46];

              id v48 = [v14 assetID];
              id v49 = [v28 fileURLForAssetID:v48];

              if (([MEMORY[0x1E4F8B908] fileURL:v47 isEqualToFileURL:v49] & 1) == 0)
              {
                id v50 = [NSString stringWithFormat:@"Attempt to overwrite syndication store resource with existing key: %@ with new key: %@, on resource: %@.  Store will orphan the previous key."], v47, v49, v22);
                PLSimulateCrash();
              }
            }
          }
          char v36 = 0;
          goto LABEL_34;
        }
      }
      else
      {
        id v28 = 0;
      }
      char v36 = 1;
    }
LABEL_34:
    uint64_t v51 = [v28 keyData];
    [v22 setDataStoreKeyData:v51];

    if (v36)
    {
      [v22 setSyndicationLocalAvailabilityWithAvailable:0];
      if (!a7) {
        goto LABEL_39;
      }
    }
    else
    {
      [v22 setSyndicationLocalAvailabilityWithAvailable:1];
      [v22 setLocalAvailabilityTarget:0];
      if (!a7)
      {
LABEL_39:
        BOOL v29 = v22 != 0;
        goto LABEL_40;
      }
    }
    *a7 = v22;
    goto LABEL_39;
  }
  uint64_t v23 = PLSyndicationGetLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    BOOL v24 = [v14 uuid];
    *(_DWORD *)buf = 138543362;
    id v56 = v24;
    _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "asset %{public}@ managed object context is nil, cannot complete storing external resource", buf, 0xCu);
  }
  char v25 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v26 = *MEMORY[0x1E4F8C500];
  uint64_t v59 = *MEMORY[0x1E4F28228];
  v60[0] = @"asset managed object context is nil";
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];
  id v27 = [v25 errorWithDomain:v26 code:47001 userInfo:v22];
  id v28 = v27;
  if (a6)
  {
    id v28 = v27;
    BOOL v29 = 0;
    *a6 = v28;
  }
  else
  {
    BOOL v29 = 0;
  }
LABEL_40:

  return v29;
}

- (BOOL)canStoreExternalResource:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)virtualResourcesForAsset:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)updateDerivativeResourcesForAsset:(id)a3 forLifecycleEvent:(unsigned int)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "set", a3, *(void *)&a4);
}

- (id)expectedFileURLForResource:(id)a3 asset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 bundleScope] == 3)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F8B978]);
    uint64_t v8 = [v7 uuid];
    uint64_t v9 = [v7 bundleScope];
    char v10 = [v6 uniformTypeIdentifier];
    id v11 = [v10 identifier];
    uint64_t v12 = [v6 version];
    uint64_t v13 = [v6 resourceType];
    id v20 = self;
    uint64_t v14 = [v6 recipeID];
    id v15 = [v7 originalFilename];
    id v16 = (void *)[v21 initWithAssetUuid:v8 bundleScope:v9 uti:v11 resourceVersion:v12 resourceType:v13 recipeID:v14 originalFilename:v15];

    int v17 = [(PLResourceDataStore *)v20 pathManager];
    id v18 = [v17 readOnlyUrlWithIdentifier:v16];
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (id)resourceURLForKey:(id)a3 assetID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PLSyndicationResourceDataStore.m", 781, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  uint64_t v9 = [v7 fileURLForAssetID:v8];

  return v9;
}

- (id)resourceDataForKey:(id)a3 assetID:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1C9B8];
  id v8 = [(PLSyndicationResourceDataStore *)self resourceURLForKey:a3 assetID:v6];
  id v14 = 0;
  uint64_t v9 = [v7 dataWithContentsOfURL:v8 options:2 error:&v14];
  id v10 = v14;

  if (!v9)
  {
    id v11 = PLSyndicationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [v6 uuid];
      *(_DWORD *)buf = 138543618;
      id v16 = v12;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "[resource] failed to read data for resource with asset: %{public}@, error: %@", buf, 0x16u);
    }
  }

  return v9;
}

- (id)keyFromKeyStruct:(const void *)a3
{
  id v3 = [[PLPrimaryResourceDataStoreKey alloc] initWithKeyStruct:a3];
  return v3;
}

- (id)descriptionForSubtype:(int64_t)a3
{
  id v3 = @"medium image derivative";
  uint64_t v4 = @"original video complement";
  if (a3 != 18) {
    uint64_t v4 = 0;
  }
  if (a3 != 4) {
    id v3 = v4;
  }
  int v5 = @"unknown";
  id v6 = @"original resource";
  if (a3 != 1) {
    id v6 = 0;
  }
  if (a3) {
    int v5 = v6;
  }
  if ((int)a3 <= 3) {
    return v5;
  }
  else {
    return v3;
  }
}

- (id)name
{
  return @"Syndication";
}

- (id)_errorForUnderlyingError:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (id)*MEMORY[0x1E4F8C520];
  if (PLUnderlyingErrorIsSyndicationMessagesNeedsDownload(v3))
  {
    uint64_t v5 = 6;
    if (v3)
    {
LABEL_3:
      uint64_t v9 = *MEMORY[0x1E4F28A50];
      v10[0] = v3;
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
      goto LABEL_9;
    }
  }
  else
  {
    if (PLUnderlyingErrorIsSyndicationMessagesDownloadTimeout(v3)) {
      uint64_t v5 = 9;
    }
    else {
      uint64_t v5 = 4;
    }
    if (v3) {
      goto LABEL_3;
    }
  }
  id v6 = 0;
LABEL_9:
  id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:v4 code:v5 userInfo:v6];

  return v7;
}

- (BOOL)_copyAndMarkAsLocallyAvailablePairedLivePhotoResourceForRequestedResource:(id)a3 requestedVideoComplement:(BOOL)a4 sourceURL:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = [v9 asset];
  char v45 = [v11 pathManager];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __149__PLSyndicationResourceDataStore__copyAndMarkAsLocallyAvailablePairedLivePhotoResourceForRequestedResource_requestedVideoComplement_sourceURL_error___block_invoke;
  v51[3] = &__block_descriptor_33_e28_B16__0__PLInternalResource_8l;
  BOOL v52 = v7;
  uint64_t v12 = [v11 firstPersistedResourceMatching:v51];
  if (v12)
  {
    LOBYTE(v48) = 0;
    id v49 = 0;
    id v50 = 0;
    uint64_t v13 = [(PLSyndicationResourceDataStore *)self _getDestinationURLAndFixLocalAvailabilityIfNeededForResource:v12 fileIdentifier:&v50 isLocallyAvailable:&v48 error:&v49];
    id v14 = v50;
    id v15 = v49;
    id v16 = v15;
    BOOL v17 = v13 != 0;
    if (v13)
    {
      if (!(_BYTE)v48)
      {
        id v47 = v15;
        uint64_t v48 = 0;
        id v43 = v10;
        BOOL v28 = [(PLSyndicationResourceDataStore *)self _copyAndMarkPurgeableItemAtURL:v10 withPathManager:v45 destFileIdentifier:v14 inode:&v48 error:&v47];
        id v29 = v47;

        if (v28)
        {
          id v46 = v29;
          char v30 = [(id)objc_opt_class() _markSyndicationResourceAsLocallyAvailableWithURL:v13 resource:v12 inode:v48 error:&v46];
          id v31 = v46;

          id v32 = PLSyndicationGetLog();
          char v33 = v32;
          if (v30)
          {
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              if (v7) {
                int v34 = @"image";
              }
              else {
                int v34 = @"video complement";
              }
              id v35 = [v11 uuid];
              *(_DWORD *)buf = 138543618;
              char v54 = v34;
              __int16 v55 = 2114;
              id v56 = v35;
              _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEFAULT, "[resource] marked paired %{public}@ resource as locally available for asset: %{public}@", buf, 0x16u);
            }
            BOOL v17 = 1;
          }
          else
          {
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              if (v7) {
                id v39 = @"image";
              }
              else {
                id v39 = @"video complement";
              }
              int v40 = [v11 uuid];
              *(_DWORD *)buf = 138543618;
              char v54 = v39;
              __int16 v55 = 2114;
              id v56 = v40;
              _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "[resource] unable to mark paired %{public}@ resource as locally available for asset: %{public}@", buf, 0x16u);
            }
            BOOL v17 = 0;
          }
          id v38 = v31;
          id v10 = v43;
          uint64_t v26 = a6;
        }
        else
        {
          id v41 = v29;
          char v33 = PLSyndicationGetLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            if (v7) {
              char v36 = @"image";
            }
            else {
              char v36 = @"video complement";
            }
            id v37 = objc_msgSend(v11, "uuid", v29);
            *(_DWORD *)buf = 138543618;
            char v54 = v36;
            __int16 v55 = 2114;
            id v56 = v37;
            _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "[resource] unable to copy paired %{public}@ url for asset: %{public}@", buf, 0x16u);
          }
          BOOL v17 = 0;
          id v10 = v43;
          uint64_t v26 = a6;
          id v38 = v41;
        }

        id v16 = v38;
        if (v26) {
          goto LABEL_18;
        }
        goto LABEL_19;
      }
      id v18 = PLSyndicationGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = @"video complement";
        if (v7) {
          uint64_t v19 = @"image";
        }
        *(_DWORD *)buf = 138543362;
        char v54 = v19;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "[resource] paired %{public}@ resource is already locally available", buf, 0xCu);
      }
    }
    else
    {
      id v18 = PLSyndicationGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        BOOL v24 = [v11 uuid];
        [v9 singleLineDescription];
        v25 = id v42 = v10;
        *(_DWORD *)buf = 138543618;
        char v54 = v24;
        __int16 v55 = 2112;
        id v56 = v25;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "[resource] unable to resolve destination url for asset %{public}@, resource: %@", buf, 0x16u);

        id v10 = v42;
      }
    }
  }
  else
  {
    id v20 = PLSyndicationGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = v10;
      if (v7) {
        id v22 = @"image";
      }
      else {
        id v22 = @"video complement";
      }
      uint64_t v23 = [v11 uuid];
      *(_DWORD *)buf = 138543618;
      char v54 = v22;
      id v10 = v21;
      __int16 v55 = 2114;
      id v56 = v23;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "[resource] unable to find paired %{public}@ resource for live photo to copy for asset: %{public}@", buf, 0x16u);
    }
    id v14 = 0;
    uint64_t v13 = 0;
    id v16 = 0;
    BOOL v17 = 0;
  }
  uint64_t v26 = a6;
  if (a6) {
LABEL_18:
  }
    *uint64_t v26 = v16;
LABEL_19:

  return v17;
}

BOOL __149__PLSyndicationResourceDataStore__copyAndMarkAsLocallyAvailablePairedLivePhotoResourceForRequestedResource_requestedVideoComplement_sourceURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  LODWORD(a1) = *(unsigned __int8 *)(a1 + 32);
  int v4 = [v3 resourceType];
  if (a1)
  {
    if (v4) {
      goto LABEL_6;
    }
  }
  else if (v4 != 3)
  {
    goto LABEL_6;
  }
  if (![v3 recipeID])
  {
    BOOL v5 = [v3 version] == 0;
    goto LABEL_7;
  }
LABEL_6:
  BOOL v5 = 0;
LABEL_7:

  return v5;
}

- (BOOL)_copyAndMarkPurgeableItemAtURL:(id)a3 withPathManager:(id)a4 destFileIdentifier:(id)a5 inode:(unint64_t *)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_10:
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PLSyndicationResourceDataStore.m", 456, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  id v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"PLSyndicationResourceDataStore.m", 455, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];

  if (!v14) {
    goto LABEL_10;
  }
LABEL_3:
  if (v15) {
    goto LABEL_4;
  }
LABEL_11:
  id v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"PLSyndicationResourceDataStore.m", 457, @"Invalid parameter not satisfying: %@", @"destFileIdentifier" object file lineNumber description];

LABEL_4:
  uint64_t v39 = 0;
  int v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 1;
  uint64_t v33 = 0;
  int v34 = &v33;
  uint64_t v35 = 0x3032000000;
  char v36 = __Block_byref_object_copy__89376;
  id v37 = __Block_byref_object_dispose__89377;
  id v38 = 0;
  uint64_t v29 = 0;
  char v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __112__PLSyndicationResourceDataStore__copyAndMarkPurgeableItemAtURL_withPathManager_destFileIdentifier_inode_error___block_invoke;
  v23[3] = &unk_1E5870D48;
  id v16 = v13;
  id v24 = v16;
  uint64_t v26 = &v39;
  id v27 = &v33;
  BOOL v28 = &v29;
  id v17 = v15;
  id v25 = v17;
  [v14 obtainAccessAndWaitWithFileWithIdentifier:v17 mode:2 toURLWithHandler:v23];
  if (a6) {
    *a6 = v30[3];
  }
  if (a7) {
    *a7 = (id) v34[5];
  }
  char v18 = *((unsigned char *)v40 + 24);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  return v18;
}

void __112__PLSyndicationResourceDataStore__copyAndMarkPurgeableItemAtURL_withPathManager_destFileIdentifier_inode_error___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = a1[4];
    id v22 = 0;
    char v8 = [MEMORY[0x1E4F8B908] copyItemAtURL:v7 toURL:v5 error:&v22];
    id v9 = v22;
    if ((v8 & 1) == 0)
    {
      int v18 = PLIsErrorOrUnderlyingErrorFileExists();
      uint64_t v19 = PLSyndicationGetLog();
      id v10 = v19;
      if (!v18)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v24 = v5;
          __int16 v25 = 2112;
          id v26 = v9;
          _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "[resource] error copying file to url: %@, error: %@", buf, 0x16u);
        }

        *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
        uint64_t v20 = *(void *)(a1[7] + 8);
        id v21 = v9;
        id v10 = *(NSObject **)(v20 + 40);
        *(void *)(v20 + 40) = v21;
        goto LABEL_16;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v5;
        id v11 = "[resource] file already exists at url: %@";
        uint64_t v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_INFO;
        goto LABEL_12;
      }
LABEL_16:

      goto LABEL_17;
    }
    if (!+[PLCacheDeleteSupport markPurgeableForFileAtURL:v5 withUrgency:0 outInode:*(void *)(a1[8] + 8) + 24])
    {
      id v10 = PLSyndicationGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v5;
        id v11 = "[resource] failed to mark file purgeable at url: %@";
        uint64_t v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_12:
        _os_log_impl(&dword_19B3C7000, v12, v13, v11, buf, 0xCu);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  else
  {
    id v14 = PLSyndicationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = (void *)a1[5];
      *(_DWORD *)buf = 138543618;
      id v24 = v15;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "[resource] unable to obtain access to file identifier: %{public}@ error: %@", buf, 0x16u);
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    uint64_t v16 = *(void *)(a1[7] + 8);
    id v17 = v6;
    id v9 = *(id *)(v16 + 40);
    *(void *)(v16 + 40) = v17;
  }
LABEL_17:
}

- (id)_getDestinationURLAndFixLocalAvailabilityIfNeededForResource:(id)a3 fileIdentifier:(id *)a4 isLocallyAvailable:(BOOL *)a5 error:(id *)a6
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (!v10)
  {
    id v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"PLSyndicationResourceDataStore.m", 130, @"Invalid parameter not satisfying: %@", @"resource" object file lineNumber description];
  }
  id v11 = [v10 asset];
  uint64_t v12 = [v10 resourceType];
  uint64_t v13 = [v10 version];
  uint64_t v14 = [v10 recipeID];
  id v15 = [v10 uniformTypeIdentifier];
  uint64_t v16 = [v15 identifier];
  id v17 = [v11 syndicationFileIdentifierForResourceType:v12 version:v13 recipeID:v14 utiString:v16];

  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x3032000000;
  uint64_t v59 = __Block_byref_object_copy__89376;
  id v60 = __Block_byref_object_dispose__89377;
  id v61 = 0;
  uint64_t v52 = 0;
  uint64_t v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  uint64_t v46 = 0;
  id v47 = &v46;
  uint64_t v48 = 0x3032000000;
  id v49 = __Block_byref_object_copy__89376;
  id v50 = __Block_byref_object_dispose__89377;
  id v51 = 0;
  int v18 = [v11 pathManager];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __135__PLSyndicationResourceDataStore__getDestinationURLAndFixLocalAvailabilityIfNeededForResource_fileIdentifier_isLocallyAvailable_error___block_invoke;
  v41[3] = &unk_1E5870C00;
  id v43 = &v56;
  char v44 = &v46;
  char v45 = &v52;
  id v19 = v17;
  id v42 = v19;
  [v18 obtainAccessAndWaitWithFileWithIdentifier:v19 mode:1 toURLWithHandler:v41];

  if (*((unsigned char *)v53 + 24) && ([v10 isLocallyAvailable] & 1) == 0)
  {
    uint64_t v20 = PLSyndicationGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v10 singleLineDescription];
      uint64_t v22 = v57[5];
      *(_DWORD *)buf = 138412546;
      __int16 v63 = v21;
      __int16 v64 = 2112;
      uint64_t v65 = v22;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "[resource] fixing model for resource (%@), file exists but is not marked locally available at URL: %@", buf, 0x16u);
    }
    [(id)objc_opt_class() _markSyndicationResourceAsLocallyAvailableWithURL:v57[5] resource:v10 inode:0 error:0];
    if ([v10 hasInvalidFileID])
    {
      uint64_t v23 = PLSyndicationGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [v10 singleLineDescription];
        uint64_t v25 = v57[5];
        *(_DWORD *)buf = 138412546;
        __int16 v63 = v24;
        __int16 v64 = 2112;
        uint64_t v65 = v25;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "[resource] found resource (%@) with invalid fileID, attempting to mark purgeable for file url: %@", buf, 0x16u);
      }
      uint64_t v40 = 0;
      if (+[PLCacheDeleteSupport markPurgeableForFileAtURL:v57[5] withUrgency:0 outInode:&v40])
      {
        [v10 setFileID:v40];
      }
      else
      {
        id v26 = PLSyndicationGetLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = (void *)v57[5];
          *(_DWORD *)buf = 138412290;
          __int16 v63 = v27;
          _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "[resource] failed to mark file purgeable at url: %@", buf, 0xCu);
        }
      }
    }
    BOOL v28 = [v10 managedObjectContext];
    int v29 = [v28 hasChanges];

    if (v29)
    {
      char v30 = [v10 managedObjectContext];
      id v39 = 0;
      char v31 = [v30 save:&v39];
      id v32 = v39;

      if ((v31 & 1) == 0)
      {
        uint64_t v33 = PLSyndicationGetLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          int v34 = [v10 singleLineDescription];
          *(_DWORD *)buf = 138412290;
          __int16 v63 = v34;
          _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "[resource] failed to save changes to fix local availability for resource: %@", buf, 0xCu);
        }
      }
    }
  }
  if (a4) {
    *a4 = v19;
  }
  if (a5) {
    *a5 = *((unsigned char *)v53 + 24);
  }
  if (a6) {
    *a6 = (id) v47[5];
  }
  id v35 = (id)v57[5];

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  return v35;
}

void __135__PLSyndicationResourceDataStore__getDestinationURLAndFixLocalAvailabilityIfNeededForResource_fileIdentifier_isLocallyAvailable_error___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    char v14 = 0;
    char v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v9 = [*(id *)(*(void *)(a1[5] + 8) + 40) path];
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [v8 fileExistsAtPath:v9 isDirectory:&v14];

    if (v14)
    {
      id v10 = PLSyndicationGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = a1[4];
        *(_DWORD *)buf = 138543362;
        uint64_t v16 = v11;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "[resource] file identifier points to a directory: %{public}@", buf, 0xCu);
      }

      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
    }
  }
  else
  {
    uint64_t v12 = PLSyndicationGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = a1[4];
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "[resource] unable to obtain access to file identifier: %{public}@ error: %@", buf, 0x16u);
    }
  }
}

@end