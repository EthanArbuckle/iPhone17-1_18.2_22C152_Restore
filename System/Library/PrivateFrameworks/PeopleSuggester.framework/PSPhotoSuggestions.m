@interface PSPhotoSuggestions
@end

@implementation PSPhotoSuggestions

void __39___PSPhotoSuggestions_sharedMADService__block_invoke()
{
  v0 = (void *)MEMORY[0x1A6243860]();
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v1 = (void *)getMADServiceClass_softClass;
  uint64_t v8 = getMADServiceClass_softClass;
  if (!getMADServiceClass_softClass)
  {
    MediaAnalysisServicesLibraryCore();
    v6[3] = (uint64_t)objc_getClass("MADService");
    getMADServiceClass_softClass = v6[3];
    v1 = (void *)v6[3];
  }
  id v2 = v1;
  _Block_object_dispose(&v5, 8);
  uint64_t v3 = [v2 service];
  v4 = (void *)sharedMADService__pasExprOnceResult;
  sharedMADService__pasExprOnceResult = v3;
}

void __49___PSPhotoSuggestions_allOutstandingRequestsLock__block_invoke()
{
  v0 = (void *)MEMORY[0x1A6243860]();
  id v1 = objc_alloc(MEMORY[0x1E4F93B70]);
  id v2 = objc_opt_new();
  uint64_t v3 = [v1 initWithGuardedData:v2];
  v4 = (void *)allOutstandingRequestsLock__pasExprOnceResult;
  allOutstandingRequestsLock__pasExprOnceResult = v3;
}

void __79___PSPhotoSuggestions_mdPersonIDsOfPeopleInSharedPhotoAttachments_forBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

BOOL __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 photoAnalysisRequestType] != 0;
}

void __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_371(uint64_t a1, int a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v5 = +[_PSPhotoSuggestions allOutstandingRequestsLock];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_2_372;
  v40[3] = &unk_1E5AE1568;
  v40[4] = &v42;
  int v41 = a2;
  [v5 runWithLockAcquired:v40];

  if (*((unsigned char *)v43 + 24))
  {
    if (v26)
    {
      if ([v26 isEqual:*(void *)(a1 + 48)])
      {
        v6 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1A314B000, v6, OS_LOG_TYPE_DEFAULT, "Media Analysis request was cancelled (due to timeout or other reasons)", (uint8_t *)&buf, 2u);
        }
      }
      else
      {
        v6 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v22 = [v26 localizedDescription];
          __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_371_cold_1(v22, v53, v6);
        }
      }
    }
    else
    {
      uint64_t v7 = [*(id *)(a1 + 32) results];
      uint64_t v8 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [v7 count];
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v9;
        _os_log_impl(&dword_1A314B000, v8, OS_LOG_TYPE_DEFAULT, "Got results back from MAD, fetched %tu people in photo", (uint8_t *)&buf, 0xCu);
      }

      v6 = v7;
      if ([v7 count])
      {
        v10 = objc_opt_new();
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        obuint64_t j = v7;
        uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v55 count:16];
        if (v11)
        {
          uint64_t v28 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v37 != v28) {
                objc_enumerationMutation(obj);
              }
              id v13 = *(id *)(*((void *)&v36 + 1) + 8 * i);
              long long v32 = 0u;
              long long v33 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              v14 = [v13 resultItems];
              uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v54 count:16];
              if (v15)
              {
                uint64_t v16 = *(void *)v33;
                do
                {
                  for (uint64_t j = 0; j != v15; ++j)
                  {
                    if (*(void *)v33 != v16) {
                      objc_enumerationMutation(v14);
                    }
                    v18 = *(void **)(*((void *)&v32 + 1) + 8 * j);
                    if (*(unsigned char *)(a1 + 72)) {
                      [v18 mdID];
                    }
                    else {
                    v19 = [v18 personIdentifier];
                    }
                    if (v19) {
                      [v10 addObject:v19];
                    }
                  }
                  uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v54 count:16];
                }
                while (v15);
              }
            }
            uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v55 count:16];
          }
          while (v11);
        }

        if ([v10 count])
        {
          v20 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138477827;
            *(void *)((char *)&buf + 4) = v10;
            _os_log_impl(&dword_1A314B000, v20, OS_LOG_TYPE_DEFAULT, "Adding personIdentifiers: %{private}@", (uint8_t *)&buf, 0xCu);
          }

          v21 = *(void **)(a1 + 40);
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_374;
          v30[3] = &unk_1E5AE1590;
          id v31 = v10;
          [v21 runWithLockAcquired:v30];
        }
        v6 = obj;
      }
    }

    if (atomic_fetch_add((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 64) + 8) + 24), 0xFFFFFFFFFFFFFFFFLL) == 1)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v49 = 0x3032000000;
      v50 = __Block_byref_object_copy__20;
      v51 = __Block_byref_object_dispose__20;
      id v52 = 0;
      v23 = *(void **)(a1 + 40);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_376;
      v29[3] = &unk_1E5AE15B8;
      v29[4] = &buf;
      [v23 runWithLockAcquired:v29];
      v24 = +[_PSLogging heuristicsChannel];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)v46 = 138477827;
        uint64_t v47 = v25;
        _os_log_impl(&dword_1A314B000, v24, OS_LOG_TYPE_DEFAULT, "IDsOfPeopleInSharedPhotoAssets invoking callback with identifiers %{private}@", v46, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      _Block_object_dispose(&buf, 8);
    }
  }
  _Block_object_dispose(&v42, 8);
}

void __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_2_372(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v15 = v3;
  if (v3)
  {
    if (*((unsigned char *)v3 + 8))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
LABEL_6:
      *((unsigned char *)v3 + 8) = 0;
      v10 = (void *)*((void *)v3 + 2);
      goto LABEL_7;
    }
    id v4 = (void *)*((void *)v3 + 2);
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = NSNumber;
  uint64_t v6 = *(unsigned int *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = [v5 numberWithInt:v6];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v9 != 0;

  id v3 = v15;
  if (v15) {
    goto LABEL_6;
  }
  v10 = 0;
LABEL_7:
  uint64_t v11 = NSNumber;
  uint64_t v12 = *(unsigned int *)(a1 + 40);
  id v13 = v10;
  v14 = [v11 numberWithInt:v12];
  [v13 setObject:0 forKeyedSubscript:v14];
}

uint64_t __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_374(uint64_t a1, void *a2)
{
  return [a2 unionSet:*(void *)(a1 + 32)];
}

uint64_t __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_376(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 copy];

  return MEMORY[0x1F41817F8]();
}

void __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_378(uint64_t a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3) {
    v3[8] = 1;
  }
  uint64_t v5 = (void *)MEMORY[0x1A6243AD0](*(void *)(a1 + 64));
  int v6 = [*(id *)(a1 + 32) photoAnalysisRequestType];
  switch(v6)
  {
    case 1:
      goto LABEL_7;
    case 2:
      v17 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [*(id *)(a1 + 32) photoLocalIdentifier];
        *(_DWORD *)long long buf = 138477827;
        *(void *)&buf[4] = v18;
        _os_log_impl(&dword_1A314B000, v17, OS_LOG_TYPE_DEFAULT, "Fetching attachment info from photoLocalIdentifier: %{private}@", buf, 0xCu);
      }
      v10 = [*(id *)(a1 + 80) sharedMADService];
      uint64_t v49 = *(void *)(a1 + 40);
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
      v20 = [*(id *)(a1 + 32) photoLocalIdentifier];
      uint64_t v45 = 0;
      v46 = &v45;
      uint64_t v47 = 0x2050000000;
      v21 = (void *)getPHPhotoLibraryClass_softClass_1;
      uint64_t v48 = getPHPhotoLibraryClass_softClass_1;
      if (!getPHPhotoLibraryClass_softClass_1)
      {
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getPHPhotoLibraryClass_block_invoke_1;
        id v52 = &unk_1E5ADE858;
        v53 = &v45;
        __getPHPhotoLibraryClass_block_invoke_1((uint64_t)buf);
        v21 = (void *)v46[3];
      }
      id v22 = v21;
      _Block_object_dispose(&v45, 8);
      v23 = [v22 systemPhotoLibraryURL];
      *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v10 performRequests:v19 onAssetWithLocalIdentifier:v20 fromPhotoLibraryWithURL:v23 completionHandler:v5];

      uint64_t v12 = (uint64_t)v5;
      goto LABEL_15;
    case 0:
      __break(1u);
LABEL_7:
      id v7 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [*(id *)(a1 + 32) contentURL];
        uint64_t v9 = [*(id *)(a1 + 32) photoLocalIdentifier];
        *(_DWORD *)long long buf = 138478083;
        *(void *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2113;
        *(void *)&buf[14] = v9;
        _os_log_impl(&dword_1A314B000, v7, OS_LOG_TYPE_DEFAULT, "Fetching attachment info from fileURL: %{private}@ (photoLocalIdentifier: %{private}@)", buf, 0x16u);
      }
      v10 = [*(id *)(a1 + 32) contentURLSandboxExtension];
      [v10 bytes];
      uint64_t v11 = sandbox_extension_consume();
      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2810000000;
      id v52 = &unk_1A3285F7A;
      LOBYTE(v53) = 0;
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_380;
      v41[3] = &unk_1E5AE1608;
      v43 = buf;
      uint64_t v44 = v11;
      id v42 = *(id *)(a1 + 64);
      uint64_t v12 = MEMORY[0x1A6243AD0](v41);

      id v13 = [*(id *)(a1 + 80) sharedMADService];
      uint64_t v50 = *(void *)(a1 + 40);
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
      id v15 = [*(id *)(a1 + 32) contentURL];
      uint64_t v16 = [*(id *)(a1 + 32) photoLocalIdentifier];
      *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v13 performRequests:v14 onImageURL:v15 withIdentifier:v16 completionHandler:v12];

      _Block_object_dispose(buf, 8);
LABEL_15:

      uint64_t v5 = (void *)v12;
      break;
  }
  if (v4 && *((unsigned char *)v4 + 8))
  {
    *((unsigned char *)v4 + 8) = 0;
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    long long v36 = __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_382;
    long long v37 = &unk_1E5AE1630;
    id v24 = *(id *)(a1 + 64);
    uint64_t v26 = a1 + 72;
    uint64_t v25 = *(void *)(a1 + 72);
    id v39 = v24;
    uint64_t v40 = v25;
    id v38 = *(id *)(a1 + 48);
    v27 = (void *)MEMORY[0x1A6243AD0](&v34);
    uint64_t v28 = NSNumber;
    uint64_t v29 = *(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    id v30 = *((id *)v4 + 2);
    id v31 = objc_msgSend(v28, "numberWithInt:", v29, v34, v35, v36, v37);
    [v30 setObject:v27 forKeyedSubscript:v31];

    long long v32 = *(void **)(a1 + 56);
    long long v33 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)v26 + 8) + 24)];
    [v32 addObject:v33];
  }
}

void __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_380(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 32), 1u) & 1) == 0) {
    sandbox_extension_release();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_382(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], *(unsigned int *)(*(void *)(a1[6] + 8) + 24), a1[4]);
}

void __46___PSPhotoSuggestions_cancelRequestWithToken___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    id v3 = *(void **)(a2 + 16);
  }
  else {
    id v3 = 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v5 = [v8 objectForKeyedSubscript:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_371_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A314B000, log, OS_LOG_TYPE_ERROR, "Media Analysis returned an error %@", buf, 0xCu);
}

@end