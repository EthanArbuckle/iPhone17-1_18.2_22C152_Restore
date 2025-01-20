@interface PLSearchDonationProgress
- (PLSearchDonationProgress)initWithPathManager:(id)a3 contextProviderBlock:(id)a4;
- (id)_newSearchQueryForTaskID:(unint64_t)a3 completionHandler:(id)a4;
- (id)_setupProgressForTaskID:(unint64_t)a3 completionHandler:(id)a4;
- (id)_updateProgressForTaskID:(unint64_t)a3;
- (id)donationProgressForMediaProcessingTaskIDs:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
@end

@implementation PLSearchDonationProgress

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryByTaskID, 0);
  objc_storeStrong((id *)&self->_progressByTaskID, 0);
  objc_storeStrong((id *)&self->_versionProvider, 0);
  objc_storeStrong(&self->_contextProviderBlock, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
}

- (id)_updateProgressForTaskID:(unint64_t)a3
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__61269;
  v9 = __Block_byref_object_dispose__61270;
  id v10 = 0;
  PLRunWithUnfairLock();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __53__PLSearchDonationProgress__updateProgressForTaskID___block_invoke(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1[4] + 48);
  id v3 = [NSNumber numberWithUnsignedInteger:a1[6]];
  v4 = [v2 objectForKeyedSubscript:v3];

  uint64_t v5 = *(void **)(a1[4] + 40);
  v6 = [NSNumber numberWithUnsignedInteger:a1[6]];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  uint64_t v8 = *(void *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (v4 && *(void *)(*(void *)(a1[5] + 8) + 40))
  {
    id v10 = PLSearchBackendDonationProgressGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = [NSNumber numberWithUnsignedInteger:a1[6]];
      uint64_t v12 = [*(id *)(*(void *)(a1[5] + 8) + 40) completedUnitCount];
      int v15 = 138412802;
      v16 = v11;
      __int16 v17 = 2048;
      uint64_t v18 = v12;
      __int16 v19 = 2048;
      uint64_t v20 = [v4 foundItemCount];
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "taskID %@ updating completed count %lld to %llu", (uint8_t *)&v15, 0x20u);
    }
    objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "setCompletedUnitCount:", objc_msgSend(v4, "foundItemCount"));
  }
  else
  {
    v13 = PLSearchBackendDonationProgressGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = [NSNumber numberWithUnsignedInteger:a1[6]];
      int v15 = 138412290;
      v16 = v14;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Unable to update progress for taskID %@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (id)_setupProgressForTaskID:(unint64_t)a3 completionHandler:(id)a4
{
  v70[1] = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, void, uint64_t))a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v8 = +[PLManagedAsset entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  id v10 = PLInternalPredicateForMediaProcessingTaskID(a3, 0, 0, 0, 0, 0.0);
  [v9 setPredicate:v10];

  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v64 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__61269;
  v59 = __Block_byref_object_dispose__61270;
  id v60 = 0;
  uint64_t v11 = MEMORY[0x19F38D650](self->_contextProviderBlock);
  uint64_t v12 = (void *)v11;
  if (v11)
  {
    v13 = (*(void (**)(uint64_t))(v11 + 16))(v11);
    if (v13) {
      goto LABEL_12;
    }
  }
  else
  {
    v14 = PLSearchBackendDonationProgressGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Context provider block is nil", buf, 2u);
    }

    int v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v69 = *MEMORY[0x1E4F28228];
    v70[0] = @"Context provider block is nil";
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:&v69 count:1];
    uint64_t v17 = [v15 errorWithDomain:*MEMORY[0x1E4F8C500] code:46502 userInfo:v16];
    uint64_t v18 = (void *)v56[5];
    v56[5] = v17;
  }
  if (!v56[5])
  {
    __int16 v19 = PLSearchBackendDonationProgressGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "MOC returned from context provider block is nil", buf, 2u);
    }

    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v67 = *MEMORY[0x1E4F28228];
    v68 = @"MOC returned from context provider block is nil";
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
    uint64_t v22 = [v20 errorWithDomain:*MEMORY[0x1E4F8C500] code:46502 userInfo:v21];
    v23 = (void *)v56[5];
    v56[5] = v22;
  }
  v13 = 0;
LABEL_12:
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __70__PLSearchDonationProgress__setupProgressForTaskID_completionHandler___block_invoke;
  v49[3] = &unk_1E586C338;
  v52 = &v61;
  id v24 = v13;
  id v50 = v24;
  id v25 = v9;
  id v51 = v25;
  v53 = &v55;
  unint64_t v54 = a3;
  [v24 performBlockAndWait:v49];
  if (v62[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6[2](v6, 0, v56[5]);
    id v26 = 0;
  }
  else
  {
    *(void *)buf = 0;
    v44 = buf;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__61269;
    v47 = __Block_byref_object_dispose__61270;
    id v48 = 0;
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__61269;
    v41 = __Block_byref_object_dispose__61270;
    id v42 = 0;
    uint64_t v33 = MEMORY[0x1E4F143A8];
    v34 = self;
    unint64_t v36 = a3;
    v27 = v6;
    PLRunWithUnfairLock();
    v28 = (void *)v38[5];
    if (v28)
    {
      objc_msgSend(v28, "start", v33, 3221225472, __70__PLSearchDonationProgress__setupProgressForTaskID_completionHandler___block_invoke_56, &unk_1E586C360, self, v27, buf, &v61, &v37, v36);
      id v26 = *((id *)v44 + 5);
    }
    else
    {
      v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v65 = *MEMORY[0x1E4F28228];
      v66 = @"nil CSSearchQuery";
      v30 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1, v33, 3221225472, __70__PLSearchDonationProgress__setupProgressForTaskID_completionHandler___block_invoke_56, &unk_1E586C360, v34, v27, buf, &v61, &v37, v36);
      v31 = [v29 errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:v30];

      v27[2](v27, 0, v31);
      id v26 = 0;
    }

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(buf, 8);
  }
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  return v26;
}

void __70__PLSearchDonationProgress__setupProgressForTaskID_completionHandler___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v9 = 0;
  uint64_t v4 = [v2 countForFetchRequest:v3 error:&v9];
  id v5 = v9;
  id v6 = v9;
  *(void *)(*(void *)(a1[6] + 8) + 24) = v4;
  if (*(void *)(*(void *)(a1[6] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = PLSearchBackendDonationProgressGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:a1[8]];
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Failure to get count of allowed assets for taskID %@: %@", buf, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v5);
  }
}

void __70__PLSearchDonationProgress__setupProgressForTaskID_completionHandler___block_invoke_56(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v7)
  {
    [v7 setTotalUnitCount:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    __int16 v12 = *(void **)(*(void *)(a1 + 32) + 40);
    id v13 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
    [v12 setObject:v11 forKeyedSubscript:v13];
  }
  uint64_t v14 = [*(id *)(a1 + 32) _newSearchQueryForTaskID:*(void *)(a1 + 72) completionHandler:*(void *)(a1 + 40)];
  uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v17)
  {
    uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 48);
    id v19 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
    [v18 setObject:v17 forKeyedSubscript:v19];
  }
}

- (id)_newSearchQueryForTaskID:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = 0;
  uint64_t v8 = 0;
  switch(a3)
  {
    case 1uLL:
      id v7 = (id)*MEMORY[0x1E4F232D0];
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLSearchDonationProgressVersionProvider mediaAnalysisVersion](self->_versionProvider, "mediaAnalysisVersion"));
      goto LABEL_8;
    case 2uLL:
      id v7 = (id)*MEMORY[0x1E4F23320];
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithShort:", -[PLSearchDonationProgressVersionProvider sceneAnalysisVersion](self->_versionProvider, "sceneAnalysisVersion"));
      goto LABEL_8;
    case 3uLL:
      id v7 = (id)*MEMORY[0x1E4F23288];
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithShort:", -[PLSearchDonationProgressVersionProvider faceAnalysisVersion](self->_versionProvider, "faceAnalysisVersion"));
      goto LABEL_8;
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
      goto LABEL_13;
    case 0xAuLL:
      id v7 = (id)*MEMORY[0x1E4F23258];
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithShort:", -[PLSearchDonationProgressVersionProvider characterRecognitionAlgorithmVersion](self->_versionProvider, "characterRecognitionAlgorithmVersion"));
      goto LABEL_8;
    default:
      if (a3 != 17) {
        goto LABEL_13;
      }
      id v7 = (id)*MEMORY[0x1E4F232C8];
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithShort:", -[PLSearchDonationProgressVersionProvider mediaAnalysisImageVersion](self->_versionProvider, "mediaAnalysisImageVersion"));
LABEL_8:
      uint64_t v8 = (void *)v9;
      if (v7) {
        BOOL v10 = v9 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10)
      {
LABEL_13:
        uint64_t v15 = PLSearchBackendDonationProgressGetLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
          *(_DWORD *)buf = 138412290;
          v27 = v11;
          _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "No search query for taskID %@", buf, 0xCu);
        }
        __int16 v12 = 0;
      }
      else
      {
        id v13 = NSString;
        uint64_t v14 = +[PLSpotlightDonationUtilities photosBundleIdentifier];
        uint64_t v15 = [v13 stringWithFormat:@"%@ == %@ && %@ >= %@", *MEMORY[0x1E4F22B50], v14, v7, v8];

        id v16 = objc_alloc_init(MEMORY[0x1E4F23830]);
        uint64_t v17 = NSString;
        uint64_t v18 = [NSNumber numberWithUnsignedInteger:a3];
        id v19 = [v17 stringWithFormat:@"PLSearchDonationProgress:%@:%@", v18, v7];
        [v16 setReason:v19];

        [v16 setDisableBlockingOnIndex:1];
        if (+[PLSpotlightDonationUtilities spotlightPrivateIndexEnabled])
        {
          uint64_t v20 = [(PLPhotoLibraryPathManager *)self->_pathManager spotlightSearchIndexPath];
          __int16 v12 = (void *)[objc_alloc(MEMORY[0x1E4F237F0]) initWithPath:v20 queryString:v15 context:v16];
        }
        else
        {
          __int16 v12 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v15 queryContext:v16];
        }
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __71__PLSearchDonationProgress__newSearchQueryForTaskID_completionHandler___block_invoke;
        v25[3] = &__block_descriptor_40_e17_v16__0__NSArray_8l;
        v25[4] = a3;
        [v12 setFoundItemsHandler:v25];
        objc_initWeak((id *)buf, self);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __71__PLSearchDonationProgress__newSearchQueryForTaskID_completionHandler___block_invoke_46;
        v22[3] = &unk_1E586C310;
        v24[1] = (id)a3;
        objc_copyWeak(v24, (id *)buf);
        id v23 = v6;
        [v12 setCompletionHandler:v22];

        objc_destroyWeak(v24);
        objc_destroyWeak((id *)buf);
      }
      return v12;
  }
}

void __71__PLSearchDonationProgress__newSearchQueryForTaskID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PLSearchBackendDonationProgressGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    BOOL v10 = v6;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "Query for taskID %@ found %@ items", (uint8_t *)&v7, 0x16u);
  }
}

void __71__PLSearchDonationProgress__newSearchQueryForTaskID_completionHandler___block_invoke_46(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = PLSearchBackendDonationProgressGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
      int v9 = 138412546;
      BOOL v10 = v5;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Query for taskID %@ completed with error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v7 = [WeakRetained _updateProgressForTaskID:*(void *)(a1 + 48)];

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v7, v3);
  }
}

- (id)donationProgressForMediaProcessingTaskIDs:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v19 = a4;
  int v7 = dispatch_group_create();
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__61269;
  v33[4] = __Block_byref_object_dispose__61270;
  id v34 = 0;
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        __int16 v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "unsignedIntegerValue", v19);
        dispatch_group_enter(v7);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __88__PLSearchDonationProgress_donationProgressForMediaProcessingTaskIDs_completionHandler___block_invoke;
        v26[3] = &unk_1E58733C0;
        uint64_t v28 = v33;
        v27 = v7;
        uint64_t v13 = [(PLSearchDonationProgress *)self donationProgressForMediaProcessingTaskID:v12 completionHandler:v26];
        if (v13) {
          [v21 setObject:v13 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }

  uint64_t v14 = dispatch_queue_create("-[PLSearchDonationProgress donationProgressForMediaProcessingTaskIDs:completionHandler:]", 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PLSearchDonationProgress_donationProgressForMediaProcessingTaskIDs_completionHandler___block_invoke_2;
  block[3] = &unk_1E58753C0;
  id v15 = v19;
  id v24 = v15;
  id v16 = v21;
  id v23 = v16;
  id v25 = v33;
  dispatch_group_notify(v7, v14, block);
  uint64_t v17 = (void *)[v16 copy];

  _Block_object_dispose(v33, 8);
  return v17;
}

void __88__PLSearchDonationProgress_donationProgressForMediaProcessingTaskIDs_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __88__PLSearchDonationProgress_donationProgressForMediaProcessingTaskIDs_completionHandler___block_invoke_2(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 40))
  {
    if (![*(id *)(a1 + 32) count] && !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      v2 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v3 = *MEMORY[0x1E4F8C500];
      uint64_t v10 = *MEMORY[0x1E4F28228];
      v11[0] = @"No valid child progress objects";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      uint64_t v5 = [v2 errorWithDomain:v3 code:41008 userInfo:v4];
      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
      int v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = (void *)[*(id *)(a1 + 32) copy];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
}

- (void)invalidate
{
}

void __38__PLSearchDonationProgress_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v6++) cancel];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = 0;
}

- (PLSearchDonationProgress)initWithPathManager:(id)a3 contextProviderBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PLSearchDonationProgress;
  long long v9 = [(PLSearchDonationProgress *)&v20 init];
  long long v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pathManager, a3);
    uint64_t v11 = MEMORY[0x19F38D650](v8);
    id contextProviderBlock = v10->_contextProviderBlock;
    v10->_id contextProviderBlock = (id)v11;

    uint64_t v13 = objc_alloc_init(PLSearchDonationProgressVersionProvider);
    versionProvider = v10->_versionProvider;
    v10->_versionProvider = v13;

    id v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    progressByTaskID = v10->_progressByTaskID;
    v10->_progressByTaskID = v15;

    uint64_t v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    queryByTaskID = v10->_queryByTaskID;
    v10->_queryByTaskID = v17;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

@end