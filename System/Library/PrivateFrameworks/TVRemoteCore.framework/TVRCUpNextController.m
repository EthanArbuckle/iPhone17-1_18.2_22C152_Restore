@interface TVRCUpNextController
- (NSArray)upNextInfos;
- (id)fetchUpNextInfosImpl;
- (void)_fetchPlayableOpenURLForMediaIdentifier:(id)a3 type:(int64_t)a4 completion:(id)a5;
- (void)_fetchUpNextInfosWithPaginationToken:(id)a3 completion:(id)a4;
- (void)_openURL:(id)a3 completion:(id)a4;
- (void)_openURLString:(id)a3 completion:(id)a4;
- (void)_playItemForMediaIdentifier:(id)a3 kind:(unint64_t)a4 completion:(id)a5;
- (void)addItemWithMediaIdentifier:(id)a3 completion:(id)a4;
- (void)fetchUpNextInfosWithPaginationToken:(id)a3 completion:(id)a4;
- (void)markAsWatchedWithMediaIdentifier:(id)a3 completion:(id)a4;
- (void)playItem:(id)a3 completion:(id)a4;
- (void)removeItemWithMediaIdentifier:(id)a3 completion:(id)a4;
- (void)setFetchUpNextInfosImpl:(id)a3;
- (void)setUpNextInfos:(id)a3;
@end

@implementation TVRCUpNextController

- (void)fetchUpNextInfosWithPaginationToken:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(TVRCUpNextController *)self fetchUpNextInfosImpl];

  if (v7)
  {
    v8 = [(TVRCUpNextController *)self fetchUpNextInfosImpl];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
  else
  {
    [(TVRCUpNextController *)self _fetchUpNextInfosWithPaginationToken:v9 completion:v6];
  }
}

- (void)markAsWatchedWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc(MEMORY[0x263F85B40]) initWithItemID:v5];
  objc_initWeak(&location, v7);
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __68__TVRCUpNextController_markAsWatchedWithMediaIdentifier_completion___block_invoke;
  v14 = &unk_2647AE828;
  objc_copyWeak(&v17, &location);
  id v8 = v5;
  id v15 = v8;
  id v9 = v6;
  id v16 = v9;
  [v7 setCompletionBlock:&v11];
  v10 = objc_msgSend(MEMORY[0x263F08A48], "wlkDefaultQueue", v11, v12, v13, v14);
  [v10 addOperation:v7];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __68__TVRCUpNextController_markAsWatchedWithMediaIdentifier_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = [WeakRetained error];
  if (v3)
  {
    v4 = _TVRCRapportLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __68__TVRCUpNextController_markAsWatchedWithMediaIdentifier_completion___block_invoke_cold_1();
    }
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__TVRCUpNextController_markAsWatchedWithMediaIdentifier_completion___block_invoke_1;
  v7[3] = &unk_2647AE800;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __68__TVRCUpNextController_markAsWatchedWithMediaIdentifier_completion___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)addItemWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc(MEMORY[0x263F85B20]) initWithCanonicalID:v5];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__TVRCUpNextController_addItemWithMediaIdentifier_completion___block_invoke;
  v10[3] = &unk_2647AE850;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 makeRequestWithCompletion:v10];
}

void __62__TVRCUpNextController_addItemWithMediaIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _TVRCRapportLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __62__TVRCUpNextController_addItemWithMediaIdentifier_completion___block_invoke_cold_1();
    }
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__TVRCUpNextController_addItemWithMediaIdentifier_completion___block_invoke_4;
  v8[3] = &unk_2647AE800;
  id v6 = *(id *)(a1 + 40);
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __62__TVRCUpNextController_addItemWithMediaIdentifier_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)removeItemWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x263F85B50]) initWithCanonicalID:v5];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__TVRCUpNextController_removeItemWithMediaIdentifier_completion___block_invoke;
  v10[3] = &unk_2647AE850;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 makeRequestWithCompletion:v10];
}

void __65__TVRCUpNextController_removeItemWithMediaIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _TVRCRapportLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __65__TVRCUpNextController_removeItemWithMediaIdentifier_completion___block_invoke_cold_1();
    }
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__TVRCUpNextController_removeItemWithMediaIdentifier_completion___block_invoke_7;
  v8[3] = &unk_2647AE800;
  id v6 = *(id *)(a1 + 40);
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __65__TVRCUpNextController_removeItemWithMediaIdentifier_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)playItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if ([v6 hasMediaIdentifierAndKind])
  {
    id v8 = [v6 mediaIdentifier];
    id v9 = [v6 kind];
    -[TVRCUpNextController _playItemForMediaIdentifier:kind:completion:](self, "_playItemForMediaIdentifier:kind:completion:", v8, [v9 integerValue], v7);

LABEL_5:
    goto LABEL_9;
  }
  if ([v6 hasURL])
  {
    id v8 = [v6 url];
    [(TVRCUpNextController *)self _openURL:v8 completion:v7];
    goto LABEL_5;
  }
  id v10 = _TVRCRapportLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[TVRCUpNextController playItem:completion:](v10);
  }

  v7[2](v7, 0);
LABEL_9:
}

- (void)_playItemForMediaIdentifier:(id)a3 kind:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = 3;
  if (a4 != 1) {
    uint64_t v10 = 1;
  }
  if (a4 == 3) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10;
  }
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__TVRCUpNextController__playItemForMediaIdentifier_kind_completion___block_invoke;
  v13[3] = &unk_2647AE878;
  objc_copyWeak(&v15, &location);
  id v12 = v9;
  id v14 = v12;
  [(TVRCUpNextController *)self _fetchPlayableOpenURLForMediaIdentifier:v8 type:v11 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __68__TVRCUpNextController__playItemForMediaIdentifier_kind_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _openURLString:v4 completion:*(void *)(a1 + 32)];
}

- (void)_fetchUpNextInfosWithPaginationToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x263F85B38]) initWithQueryParameters:0];
  objc_initWeak(&location, v8);
  objc_initWeak(&from, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__TVRCUpNextController__fetchUpNextInfosWithPaginationToken_completion___block_invoke;
  v11[3] = &unk_2647AE8C8;
  objc_copyWeak(&v13, &from);
  objc_copyWeak(&v14, &location);
  id v9 = v7;
  id v12 = v9;
  [v8 setCompletionBlock:v11];
  uint64_t v10 = [MEMORY[0x263F08A48] wlkDefaultQueue];
  [v10 addOperation:v8];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __72__TVRCUpNextController__fetchUpNextInfosWithPaginationToken_completion___block_invoke(id *a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = objc_loadWeakRetained(a1 + 6);
  id v4 = v3;
  if (WeakRetained)
  {
    id v5 = [v3 error];
    if (v5)
    {
      id v6 = _TVRCRapportLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __72__TVRCUpNextController__fetchUpNextInfosWithPaginationToken_completion___block_invoke_cold_1((uint64_t)v5, v6);
      }
    }
    v20 = v4;
    id v7 = [v4 response];
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v19 = v7;
    id v9 = [v7 items];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [*(id *)(*((void *)&v25 + 1) + 8 * i) dictionary];
          id v15 = +[TVRCUpNextInfo upNextInfoWithDictionary:v14];
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v11);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__TVRCUpNextController__fetchUpNextInfosWithPaginationToken_completion___block_invoke_12;
    block[3] = &unk_2647AE8A0;
    block[4] = WeakRetained;
    id v22 = v8;
    id v16 = a1[4];
    id v23 = v5;
    id v24 = v16;
    id v17 = v5;
    id v18 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);

    id v4 = v20;
  }
}

uint64_t __72__TVRCUpNextController__fetchUpNextInfosWithPaginationToken_completion___block_invoke_12(uint64_t a1)
{
  [*(id *)(a1 + 32) setUpNextInfos:*(void *)(a1 + 40)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v2();
}

- (void)_fetchPlayableOpenURLForMediaIdentifier:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F85B30]) initWithCanonicalID:v8];
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__TVRCUpNextController__fetchPlayableOpenURLForMediaIdentifier_type_completion___block_invoke;
  v13[3] = &unk_2647AE8F0;
  objc_copyWeak(&v16, &location);
  id v11 = v8;
  id v14 = v11;
  id v12 = v9;
  id v15 = v12;
  [v10 makeRequestWithCompletion:v13 canonicalType:a4];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __80__TVRCUpNextController__fetchPlayableOpenURLForMediaIdentifier_type_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = _TVRCRapportLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __80__TVRCUpNextController__fetchPlayableOpenURLForMediaIdentifier_type_completion___block_invoke_cold_1();
      }
    }
    else
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v12 = [v5 playables];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v24;
LABEL_10:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v23 + 1) + 8 * v16);
          if ([v17 isEntitled] & 1) != 0 || (objc_msgSend(v17, "isEntitledAnywhere")) {
            break;
          }
          if (v14 == ++v16)
          {
            uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
            if (v14) {
              goto LABEL_10;
            }
            goto LABEL_17;
          }
        }
        id v8 = v17;

        if (!v8) {
          goto LABEL_20;
        }
        id v9 = [v8 playPunchoutURL];
        goto LABEL_6;
      }
LABEL_17:

LABEL_20:
      id v8 = _TVRCRapportLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        v19 = [v5 playables];
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = v18;
        __int16 v29 = 2112;
        uint64_t v30 = v19;
        _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Failed to find an entitled playable to play %{public}@ - playables=%@", buf, 0x16u);
      }
    }
    id v9 = 0;
LABEL_6:

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __80__TVRCUpNextController__fetchPlayableOpenURLForMediaIdentifier_type_completion___block_invoke_14;
    v20[3] = &unk_2647AE800;
    id v10 = *(id *)(a1 + 40);
    id v21 = v9;
    id v22 = v10;
    id v11 = v9;
    dispatch_async(MEMORY[0x263EF83A0], v20);
  }
}

uint64_t __80__TVRCUpNextController__fetchPlayableOpenURLForMediaIdentifier_type_completion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_openURLString:(id)a3 completion:(id)a4
{
  id v6 = NSURL;
  id v7 = (void (**)(id, void))a4;
  id v10 = [v6 URLWithString:a3];
  id v8 = [v10 absoluteString];
  uint64_t v9 = [v8 length];

  if (v9) {
    [(TVRCUpNextController *)self _openURL:v10 completion:v7];
  }
  else {
    v7[2](v7, 0);
  }
}

- (void)_openURL:(id)a3 completion:(id)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F018D8]);
  uint64_t v8 = *MEMORY[0x263F3F5C8];
  v16[0] = *MEMORY[0x263F3F5E8];
  v16[1] = v8;
  v17[0] = MEMORY[0x263EFFA88];
  v17[1] = &unk_26DA62F60;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  [v7 setFrontBoardOptions:v9];

  id v10 = [MEMORY[0x263F01880] defaultWorkspace];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__TVRCUpNextController__openURL_completion___block_invoke;
  v13[3] = &unk_2647AE918;
  id v14 = v5;
  id v15 = v6;
  id v11 = v6;
  id v12 = v5;
  [v10 openURL:v12 configuration:v7 completionHandler:v13];
}

void __44__TVRCUpNextController__openURL_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _TVRCRapportLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __44__TVRCUpNextController__openURL_completion___block_invoke_cold_1();
    }
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__TVRCUpNextController__openURL_completion___block_invoke_22;
  v8[3] = &unk_2647AE800;
  id v6 = *(id *)(a1 + 40);
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __44__TVRCUpNextController__openURL_completion___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (NSArray)upNextInfos
{
  return self->_upNextInfos;
}

- (void)setUpNextInfos:(id)a3
{
}

- (id)fetchUpNextInfosImpl
{
  return self->_fetchUpNextInfosImpl;
}

- (void)setFetchUpNextInfosImpl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchUpNextInfosImpl, 0);

  objc_storeStrong((id *)&self->_upNextInfos, 0);
}

void __68__TVRCUpNextController_markAsWatchedWithMediaIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2266D3000, v0, v1, "Error marking %{public}@ as watched: %{public}@");
}

void __62__TVRCUpNextController_addItemWithMediaIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2266D3000, v0, v1, "Error adding to upNext %{public}@: %{public}@");
}

void __65__TVRCUpNextController_removeItemWithMediaIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2266D3000, v0, v1, "Error removing %{public}@ from UpNext: %{public}@");
}

- (void)playItem:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_2266D3000, log, OS_LOG_TYPE_ERROR, "Error playing item - misconfigured?", v1, 2u);
}

void __72__TVRCUpNextController__fetchUpNextInfosWithPaginationToken_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2266D3000, a2, OS_LOG_TYPE_ERROR, "Error fetching up next infos: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __80__TVRCUpNextController__fetchPlayableOpenURLForMediaIdentifier_type_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2266D3000, v0, v1, "Error requesting playables to play %{public}@: %{public}@");
}

void __44__TVRCUpNextController__openURL_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2266D3000, v0, v1, "Error attempting to openURL %@: %{public}@");
}

@end