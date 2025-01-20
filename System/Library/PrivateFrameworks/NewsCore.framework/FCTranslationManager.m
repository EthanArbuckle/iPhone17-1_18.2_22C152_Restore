@interface FCTranslationManager
- (FCAsyncSerialQueue)queue;
- (FCContentContext)contentContext;
- (FCTranslationManager)initWithContentContext:(id)a3;
- (FCTranslationMap)translationMap;
- (FCTranslationProvider)possiblyUnfetchedTranslationProvider;
- (void)fetchTranslationProvider:(id)a3;
- (void)setContentContext:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTranslationMap:(id)a3;
@end

@implementation FCTranslationManager

- (FCTranslationProvider)possiblyUnfetchedTranslationProvider
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v3 = [(FCTranslationManager *)self translationMap];

  if (v3)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __60__FCTranslationManager_possiblyUnfetchedTranslationProvider__block_invoke;
    v27[3] = &unk_1E5B58BA8;
    v27[4] = self;
    __60__FCTranslationManager_possiblyUnfetchedTranslationProvider__block_invoke((uint64_t)v27);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v6 = [v5 objectForKey:@"translationMapResourceID"];

    if (v6)
    {
      id v7 = v6;
      v8 = [FCResourcesFetchOperation alloc];
      v9 = [(FCTranslationManager *)self contentContext];
      v28[0] = v7;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
      v11 = [(FCResourcesFetchOperation *)v8 initWithContext:v9 resourceIDs:v10 downloadAssets:0];

      [(FCFetchOperation *)v11 setCachePolicy:3];
      [(FCFetchOperation *)v11 setCanSendFetchCompletionSynchronously:1];
      *(void *)buf = 0;
      v22 = buf;
      uint64_t v23 = 0x3032000000;
      v24 = __Block_byref_object_copy__56;
      v25 = __Block_byref_object_dispose__56;
      id v26 = 0;
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __60__FCTranslationManager_possiblyUnfetchedTranslationProvider__block_invoke_6;
      v18 = &unk_1E5B58BD0;
      v20 = buf;
      id v12 = v7;
      id v19 = v12;
      [(FCFetchOperation *)v11 setFetchCompletionBlock:&v15];
      [(FCOperation *)v11 start];
      [(FCResourcesFetchOperation *)v11 waitUntilFinished];
      id v4 = *((id *)v22 + 5);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v13 = FCTranslationLog;
      if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "No translation map resource ID available in User Defaults, we have no translation map to synchronously return", buf, 2u);
      }
      id v4 = 0;
    }
  }
  return (FCTranslationProvider *)v4;
}

- (FCTranslationMap)translationMap
{
  return self->_translationMap;
}

- (FCTranslationManager)initWithContentContext:(id)a3
{
  id v4 = (FCContentContext *)a3;
  v11.receiver = self;
  v11.super_class = (Class)FCTranslationManager;
  v5 = [(FCTranslationManager *)&v11 init];
  contentContext = v5->_contentContext;
  v5->_contentContext = v4;
  id v7 = v4;

  v8 = [[FCAsyncSerialQueue alloc] initWithQualityOfService:25];
  queue = v5->_queue;
  v5->_queue = v8;

  return v5;
}

id __60__FCTranslationManager_possiblyUnfetchedTranslationProvider__block_invoke(uint64_t a1)
{
  v2 = FCTranslationLog;
  if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Already have a translation map, returning it", v5, 2u);
  }
  v3 = [*(id *)(a1 + 32) translationMap];
  return v3;
}

void __60__FCTranslationManager_possiblyUnfetchedTranslationProvider__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];

  if (!v4)
  {
    v5 = FCTranslationLog;
    if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "Synchronous Fetch operation completed", buf, 2u);
    }
    objc_opt_class();
    objc_opt_class();
    v6 = [v3 fetchedObject];
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
    id v8 = v7;
    v9 = [v8 firstObject];
    if (v9)
    {
      if (objc_opt_isKindOfClass()) {
        v10 = v9;
      }
      else {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      id v12 = v11;
      v13 = FCTranslationLog;
      if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v12;
        _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "Got resource %@", buf, 0xCu);
      }
      v14 = [v12 fileURL];
      uint64_t v15 = v14;
      if (v14)
      {
        id v16 = v14;
        v17 = FCTranslationLog;
        if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v35 = v16;
          _os_log_impl(&dword_1A460D000, v17, OS_LOG_TYPE_DEFAULT, "Got fileURL %@", buf, 0xCu);
        }
        v18 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v16];
        id v19 = v18;
        if (v18)
        {
          id v20 = v18;
          v21 = (void *)FCTranslationLog;
          id v22 = v20;
          if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = NSNumber;
            v24 = v21;
            v25 = objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v22, "length"));
            *(_DWORD *)buf = 138412290;
            id v35 = v25;
            _os_log_impl(&dword_1A460D000, v24, OS_LOG_TYPE_DEFAULT, "Got back data of length %@", buf, 0xCu);
          }
          id v26 = (void *)[objc_alloc(MEMORY[0x1E4F82C38]) initWithData:v22];
          v27 = v26;
          if (v26)
          {
            id v33 = v16;
            id v28 = v22;
            id v29 = v26;
            v30 = [[FCTranslationMap alloc] initWithPBTranslationMap:v29 resourceID:*(void *)(a1 + 32)];

            id v22 = v28;
            id v16 = v33;
            uint64_t v31 = *(void *)(*(void *)(a1 + 40) + 8);
            v32 = *(void **)(v31 + 40);
            *(void *)(v31 + 40) = v30;
          }
        }
      }
    }
  }
}

- (void)fetchTranslationProvider:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(FCTranslationManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke;
  v7[3] = &unk_1E5B58C70;
  id v6 = v4;
  id v8 = v6;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  [v5 enqueueBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__FCTranslationManager_fetchTranslationProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke_2;
  aBlock[3] = &unk_1E5B58BF8;
  id v24 = *(id *)(a1 + 40);
  id v4 = v3;
  id v25 = v4;
  v5 = _Block_copy(aBlock);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v9 = FCTranslationLog;
    if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "Attempting Translation Map Resource Fetch", buf, 2u);
    }
    v10 = [v8 contentContext];
    id v11 = [v10 appConfigurationManager];
    id v12 = dispatch_get_global_queue(25, 0);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke_29;
    v15[3] = &unk_1E5B58C48;
    v15[5] = v8;
    id v16 = v5;
    v15[4] = *(void *)(a1 + 32);
    v13 = v5;
    [v11 fetchAppConfigurationIfNeededWithCompletionQueue:v12 completion:v15];

    goto LABEL_7;
  }
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __49__FCTranslationManager_fetchTranslationProvider___block_invoke_3;
  v21 = &unk_1E5B4CA88;
  id v22 = v5;
  if (v5)
  {
    v14 = (void (*)(void))v5[2];
    id v8 = v5;
    v14();
    v13 = v22;
LABEL_7:
  }
}

void __49__FCTranslationManager_fetchTranslationProvider___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

uint64_t __49__FCTranslationManager_fetchTranslationProvider___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __49__FCTranslationManager_fetchTranslationProvider___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    id v9 = FCTranslationLog;
    if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "App Config Manager Returned", buf, 2u);
    }
    v10 = [v5 translationMapResourceID];
    if (!v10)
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke_31;
      v32[3] = &unk_1E5B4CA88;
      id v33 = *(id *)(a1 + 48);
      __49__FCTranslationManager_fetchTranslationProvider___block_invoke_31((uint64_t)v32);

      id v8 = 0;
      goto LABEL_16;
    }
    id v8 = v10;
    uint64_t v11 = [*(id *)(a1 + 32) translationMap];
    if (!v11) {
      goto LABEL_10;
    }
    id v12 = (void *)v11;
    v13 = [*(id *)(a1 + 32) translationMap];
    v14 = [v13 resourceID];
    int v15 = [v14 isEqualToString:v8];

    if (v15)
    {
      uint64_t v16 = *(void *)(a1 + 48);
      if (!v16)
      {
LABEL_14:

        goto LABEL_16;
      }
      v17 = [*(id *)(a1 + 32) translationMap];
      (*(void (**)(uint64_t, FCResourcesFetchOperation *, void))(v16 + 16))(v16, v17, 0);
    }
    else
    {
LABEL_10:
      uint64_t v18 = FCTranslationLog;
      if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v8;
        _os_log_impl(&dword_1A460D000, v18, OS_LOG_TYPE_DEFAULT, "Found translationMapResourceID %@, building fetch operation", buf, 0xCu);
      }
      uint64_t v19 = [FCResourcesFetchOperation alloc];
      id v20 = [*(id *)(a1 + 32) contentContext];
      id v37 = v8;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
      v17 = [(FCResourcesFetchOperation *)v19 initWithContext:v20 resourceIDs:v21 downloadAssets:1];

      [(FCFetchOperation *)v17 setCachePolicy:1];
      [(FCOperation *)v17 setQualityOfService:25];
      [(FCOperation *)v17 setRelativePriority:1];
      id v22 = [(FCOperation *)v17 shortOperationDescription];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke_37;
      v26[3] = &unk_1E5B58C20;
      id v27 = v22;
      id v28 = 0;
      id v31 = *(id *)(a1 + 48);
      id v23 = v8;
      uint64_t v24 = *(void *)(a1 + 40);
      id v29 = v23;
      uint64_t v30 = v24;
      id v25 = v22;
      [(FCFetchOperation *)v17 setFetchCompletionBlock:v26];
      [(FCOperation *)v17 start];
    }
    goto LABEL_14;
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke_2_30;
  v34[3] = &unk_1E5B4CC80;
  id v35 = v6;
  id v36 = *(id *)(a1 + 48);
  __49__FCTranslationManager_fetchTranslationProvider___block_invoke_2_30((uint64_t)v34);

  id v8 = v35;
LABEL_16:
}

uint64_t __49__FCTranslationManager_fetchTranslationProvider___block_invoke_2_30(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCTranslationLog;
  if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "App Config Returned Error: %@", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

void __49__FCTranslationManager_fetchTranslationProvider___block_invoke_31(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = FCTranslationLog;
  if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "App Config contained no translationMapResourceID", v7, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28568];
    v9[0] = @"Didn't find a translation map resource ID in the News app configuration";
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    uint64_t v6 = [v4 errorWithDomain:@"FCErrorDomain" code:19 userInfo:v5];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v6);
  }
}

void __49__FCTranslationManager_fetchTranslationProvider___block_invoke_37(id *a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke_2_38;
    v45[3] = &unk_1E5B4E088;
    id v46 = a1[4];
    id v47 = a1[5];
    id v48 = a1[8];
    __49__FCTranslationManager_fetchTranslationProvider___block_invoke_2_38(v45);

    id v5 = v46;
  }
  else
  {
    uint64_t v6 = FCTranslationLog;
    if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "Fetch operation completed", buf, 2u);
    }
    objc_opt_class();
    objc_opt_class();
    uint64_t v7 = [v3 fetchedObject];
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    id v9 = v8;
    v10 = [v9 firstObject];
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      id v5 = v12;
      v13 = FCTranslationLog;
      if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v50 = v5;
        _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "Got resource %@", buf, 0xCu);
      }
      v14 = [v5 fileURL];
      int v15 = v14;
      if (v14)
      {
        id v16 = v14;
        v17 = FCTranslationLog;
        if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v50 = v16;
          _os_log_impl(&dword_1A460D000, v17, OS_LOG_TYPE_DEFAULT, "Got fileURL %@", buf, 0xCu);
        }
        uint64_t v18 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v16];
        uint64_t v19 = v18;
        if (v18)
        {
          id v20 = v18;
          v21 = (void *)FCTranslationLog;
          if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
          {
            id v22 = NSNumber;
            id v23 = v21;
            uint64_t v24 = objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v20, "length"));
            *(_DWORD *)buf = 138412290;
            id v50 = v24;
            _os_log_impl(&dword_1A460D000, v23, OS_LOG_TYPE_DEFAULT, "Got back data of length %@", buf, 0xCu);
          }
          id v25 = (void *)[objc_alloc(MEMORY[0x1E4F82C38]) initWithData:v20];
          id v26 = v25;
          if (v25)
          {
            id v27 = v25;
            id v28 = [[FCTranslationMap alloc] initWithPBTranslationMap:v27 resourceID:a1[6]];
            [a1[7] setTranslationMap:v28];

            id v29 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
            [v29 setObject:a1[6] forKey:@"translationMapResourceID"];

            uint64_t v30 = (void (**)(id, void *, void))a1[8];
            if (v30)
            {
              id v31 = [a1[7] translationMap];
              v30[2](v30, v31, 0);
            }
          }
          else
          {
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke_52;
            v32[3] = &unk_1E5B4C7C0;
            id v34 = a1[8];
            id v33 = v20;
            __49__FCTranslationManager_fetchTranslationProvider___block_invoke_52((uint64_t)v32);

            id v27 = v34;
          }
        }
        else
        {
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke_48;
          v35[3] = &unk_1E5B4CC80;
          id v36 = v16;
          id v37 = a1[8];
          __49__FCTranslationManager_fetchTranslationProvider___block_invoke_48((uint64_t)v35);

          id v20 = v36;
        }
      }
      else
      {
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke_44;
        v38[3] = &unk_1E5B4C7C0;
        id v40 = a1[8];
        id v39 = v5;
        __49__FCTranslationManager_fetchTranslationProvider___block_invoke_44((uint64_t)v38);

        id v16 = v40;
      }
    }
    else
    {
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke_39;
      v41[3] = &unk_1E5B4F080;
      id v44 = a1[8];
      id v42 = a1[6];
      id v43 = v3;
      __49__FCTranslationManager_fetchTranslationProvider___block_invoke_39((uint64_t)v41);

      id v5 = 0;
    }
  }
}

uint64_t __49__FCTranslationManager_fetchTranslationProvider___block_invoke_2_38(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = FCTranslationLog;
  if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    int v6 = 138412546;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "Fetch operation %@ error %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, a1[5]);
  }
  return result;
}

void __49__FCTranslationManager_fetchTranslationProvider___block_invoke_39(uint64_t a1)
{
  v2 = FCTranslationLog;
  if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "No resource provided back from fetch operation", buf, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = NSString;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 40) fetchedObject];
    __int16 v8 = [v5 stringWithFormat:@"Failed to find a resource for ID %@, got back %@", v6, v7];
    uint64_t v9 = objc_msgSend(v4, "fc_missingResourceErrorWithDescription:", v8);
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v9);
  }
}

void __49__FCTranslationManager_fetchTranslationProvider___block_invoke_44(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = FCTranslationLog;
  if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Resource had no fileURL", buf, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    uint64_t v5 = [NSString stringWithFormat:@"Got a nil fileURL for resource %@", *(void *)(a1 + 32)];
    v10[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v7 = [v4 errorWithDomain:@"FCErrorDomain" code:19 userInfo:v6];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v7);
  }
}

void __49__FCTranslationManager_fetchTranslationProvider___block_invoke_48(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = FCTranslationLog;
  if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Failed to get data from fileURL %@", buf, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    uint64_t v6 = [NSString stringWithFormat:@"Failed to get data from fileURL %@", *(void *)(a1 + 32)];
    uint64_t v10 = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    __int16 v8 = [v5 errorWithDomain:@"FCErrorDomain" code:19 userInfo:v7];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v8);
  }
}

void __49__FCTranslationManager_fetchTranslationProvider___block_invoke_52(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = FCTranslationLog;
  if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Failed to turn data into NTPBTranslationMap", buf, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    uint64_t v5 = [NSString stringWithFormat:@"Failed to initialize NTPBTranslationMap with data %@", *(void *)(a1 + 32)];
    v10[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v7 = [v4 errorWithDomain:@"FCErrorDomain" code:19 userInfo:v6];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v7);
  }
}

- (FCAsyncSerialQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)setTranslationMap:(id)a3
{
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)setContentContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_translationMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end