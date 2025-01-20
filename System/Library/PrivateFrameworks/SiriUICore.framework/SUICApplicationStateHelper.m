@interface SUICApplicationStateHelper
- (SUICApplicationStateHelper)init;
- (id)_foregroundAppInfosFor:(int64_t)a3;
- (id)foregroundAppInfos;
- (id)foregroundAppInfosForCarPlay;
- (void)_appInfoDictionariesForDisplayLayout:(id)a3 completion:(id)a4;
- (void)_handleApplicationStateUpdate:(id)a3;
- (void)_updateForAppInfoDictionaries:(id)a3;
- (void)_updateForAppInfoDictionaries:(id)a3 displayType:(id)a4;
- (void)dealloc;
@end

@implementation SUICApplicationStateHelper

uint64_t __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  if (![v11 layoutRole])
  {
    v6 = [*(id *)(a1 + 32) displayConfiguration];
    int v7 = [v6 isCarDisplay];

    if (!v7) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if ([v11 layoutRole] == 1)
  {
LABEL_7:
    uint64_t v8 = [v11 bundleIdentifier];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    goto LABEL_8;
  }
  if ([v11 layoutRole] == 2)
  {
    uint64_t v3 = [v11 bundleIdentifier];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v11 level];
  }
LABEL_8:
}

void __34__SUICApplicationStateHelper_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleApplicationStateUpdate:v3];
}

void __34__SUICApplicationStateHelper_init__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateForAppInfoDictionaries:v3 displayType:&unk_1EFB501A8];
}

void __34__SUICApplicationStateHelper_init__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __34__SUICApplicationStateHelper_init__block_invoke_2;
  v12[3] = &unk_1E5C594C0;
  objc_copyWeak(&v13, v10);
  [WeakRetained _appInfoDictionariesForDisplayLayout:v8 completion:v12];

  objc_destroyWeak(&v13);
}

- (void)_appInfoDictionariesForDisplayLayout:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke;
  block[3] = &unk_1E5C59628;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  id v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void __72__SUICApplicationStateHelper__updateForAppInfoDictionaries_displayType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F4E230];
  id v4 = a2;
  id v15 = [v4 objectForKey:v3];
  v5 = [v4 objectForKey:*MEMORY[0x1E4F4E258]];
  uint64_t v6 = [v5 intValue];

  id v7 = [v4 objectForKey:*MEMORY[0x1E4F4E248]];
  int v8 = [v7 unsignedIntValue];

  id v9 = [v4 objectForKey:*MEMORY[0x1E4F4E240]];

  LOBYTE(v4) = [v9 BOOLValue];
  id v10 = objc_alloc_init(MEMORY[0x1E4F4E3C0]);
  [v10 setIdentifier:v15];
  [v10 setPid:v6];
  id v11 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];
  [v11 removeObject:v10];

  if ((v4 & 1) == 0 && (v8 == 32 || v8 == 8))
  {
    id v13 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];
    if (!v13)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [*(id *)(*(void *)(a1 + 32) + 32) setObject:v13 forKey:*(void *)(a1 + 40)];
    }
    id v14 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];
    [v14 addObject:v10];
  }
}

- (void)_handleApplicationStateUpdate:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:v9 count:1];
  [(SUICApplicationStateHelper *)self _updateForAppInfoDictionaries:v6 displayType:&unk_1EFB501D8];

  id v8 = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];

  [(SUICApplicationStateHelper *)self _updateForAppInfoDictionaries:v7 displayType:&unk_1EFB501F0];
}

- (void)_updateForAppInfoDictionaries:(id)a3 displayType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__SUICApplicationStateHelper__updateForAppInfoDictionaries_displayType___block_invoke;
  block[3] = &unk_1E5C59538;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke(uint64_t a1)
{
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__0;
  v40 = __Block_byref_object_dispose__0;
  id v41 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  id v35 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0x7FFFFFFFFFFFFFFFLL;
  v2 = [*(id *)(a1 + 32) elements];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke_2;
  v24[3] = &unk_1E5C59560;
  v26 = &v36;
  v27 = &v30;
  v28 = v29;
  id v25 = *(id *)(a1 + 32);
  [v2 enumerateObjectsUsingBlock:v24];

  uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  id v4 = dispatch_group_create();
  id v5 = v4;
  if (v37[5])
  {
    dispatch_group_enter(v4);
    id v6 = *(void **)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = v37[5];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke_3;
    v21[3] = &unk_1E5C59588;
    id v22 = v3;
    v23 = v5;
    [v6 applicationInfoForApplication:v7 completion:v21];
  }
  uint64_t v8 = v31[5];
  if (v8)
  {
    id v9 = *(void **)(*(void *)(a1 + 40) + 8);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke_4;
    v16[3] = &unk_1E5C595D8;
    v17 = v5;
    v20 = v29;
    id v18 = v3;
    v19 = *(id *)(a1 + 48);
    [v9 applicationInfoForApplication:v8 completion:v16];
    id v10 = (id *)&v17;
    id v11 = &v18;
    id v12 = v19;
  }
  else
  {
    id v12 = dispatch_get_global_queue(21, 0);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke_6;
    v13[3] = &unk_1E5C59600;
    id v10 = &v15;
    id v15 = *(id *)(a1 + 48);
    id v11 = &v14;
    id v14 = v3;
    dispatch_group_notify(v5, v12, v13);
  }

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
}

void __72__SUICApplicationStateHelper__updateForAppInfoDictionaries_displayType___block_invoke(void *a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__SUICApplicationStateHelper__updateForAppInfoDictionaries_displayType___block_invoke_2;
  v3[3] = &unk_1E5C59510;
  v1 = (void *)a1[4];
  v2 = (void *)a1[6];
  v3[4] = a1[5];
  id v4 = v2;
  [v1 enumerateObjectsUsingBlock:v3];
}

- (SUICApplicationStateHelper)init
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)SUICApplicationStateHelper;
  v2 = [(SUICApplicationStateHelper *)&v31 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    foregroundAppInfos = v2->_foregroundAppInfos;
    v2->_foregroundAppInfos = v3;

    id v5 = (BKSApplicationStateMonitor *)objc_alloc_init(MEMORY[0x1E4F4E278]);
    appStateMonitor = v2->_appStateMonitor;
    v2->_appStateMonitor = v5;

    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.SUICApplicationStateHelper.queue", v7);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    objc_initWeak(&location, v2);
    id v10 = v2->_appStateMonitor;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __34__SUICApplicationStateHelper_init__block_invoke;
    v28[3] = &unk_1E5C59498;
    objc_copyWeak(&v29, &location);
    [(BKSApplicationStateMonitor *)v10 setHandler:v28];
    id v11 = [MEMORY[0x1E4F62958] configurationForDefaultMainDisplayMonitor];
    id v12 = (NSObject **)MEMORY[0x1E4F4E360];
    if (v11)
    {
      id v13 = *MEMORY[0x1E4F4E360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[SUICApplicationStateHelper init]";
        _os_log_impl(&dword_1A64CC000, v13, OS_LOG_TYPE_INFO, "%s MainDisplayMonitor configuration is not nil. Proceeding to setup DisplayLayoutMonitor", buf, 0xCu);
      }
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __34__SUICApplicationStateHelper_init__block_invoke_4;
      v26[3] = &unk_1E5C594E8;
      objc_copyWeak(&v27, &location);
      [v11 setTransitionHandler:v26];
      uint64_t v14 = [MEMORY[0x1E4F62940] monitorWithConfiguration:v11];
      displayLayoutMonitor = v2->_displayLayoutMonitor;
      v2->_displayLayoutMonitor = (FBSDisplayLayoutMonitor *)v14;

      objc_destroyWeak(&v27);
    }
    v16 = [MEMORY[0x1E4F62958] configurationForCarDisplayMonitor];
    if (v16)
    {
      v17 = *v12;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[SUICApplicationStateHelper init]";
        _os_log_impl(&dword_1A64CC000, v17, OS_LOG_TYPE_INFO, "%s CarDisplayMonitor configuration is not nil. Proceeding to setup carplayDisplayLayoutMonitor", buf, 0xCu);
      }
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __34__SUICApplicationStateHelper_init__block_invoke_9;
      v24 = &unk_1E5C594E8;
      objc_copyWeak(&v25, &location);
      [v16 setTransitionHandler:&v21];
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F62940], "monitorWithConfiguration:", v16, v21, v22, v23, v24);
      carplayDisplayLayoutMonitor = v2->_carplayDisplayLayoutMonitor;
      v2->_carplayDisplayLayoutMonitor = (FBSDisplayLayoutMonitor *)v18;

      objc_destroyWeak(&v25);
    }

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __34__SUICApplicationStateHelper_init__block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __34__SUICApplicationStateHelper_init__block_invoke_2_10;
  v12[3] = &unk_1E5C594C0;
  objc_copyWeak(&v13, v10);
  [WeakRetained _appInfoDictionariesForDisplayLayout:v8 completion:v12];

  objc_destroyWeak(&v13);
}

void __34__SUICApplicationStateHelper_init__block_invoke_2_10(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateForAppInfoDictionaries:v3 displayType:&unk_1EFB501C0];
}

- (void)dealloc
{
  [(BKSApplicationStateMonitor *)self->_appStateMonitor invalidate];
  displayLayoutMonitor = self->_displayLayoutMonitor;
  if (displayLayoutMonitor) {
    [(FBSDisplayLayoutMonitor *)displayLayoutMonitor invalidate];
  }
  carplayDisplayLayoutMonitor = self->_carplayDisplayLayoutMonitor;
  if (carplayDisplayLayoutMonitor) {
    [(FBSDisplayLayoutMonitor *)carplayDisplayLayoutMonitor invalidate];
  }
  v5.receiver = self;
  v5.super_class = (Class)SUICApplicationStateHelper;
  [(SUICApplicationStateHelper *)&v5 dealloc];
}

- (id)foregroundAppInfos
{
  return [(SUICApplicationStateHelper *)self _foregroundAppInfosFor:0];
}

- (id)foregroundAppInfosForCarPlay
{
  return [(SUICApplicationStateHelper *)self _foregroundAppInfosFor:3];
}

- (id)_foregroundAppInfosFor:(int64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__0;
  id v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SUICApplicationStateHelper__foregroundAppInfosFor___block_invoke;
  block[3] = &unk_1E5C593C8;
  void block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __53__SUICApplicationStateHelper__foregroundAppInfosFor___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 32);
  id v7 = [NSNumber numberWithInteger:a1[6]];
  id v3 = [v2 objectForKey:v7];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)_updateForAppInfoDictionaries:(id)a3
{
}

void __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  uint64_t v5 = dispatch_get_global_queue(21, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke_5;
  v8[3] = &unk_1E5C595B0;
  uint64_t v6 = *(void *)(a1 + 56);
  id v9 = v3;
  uint64_t v12 = v6;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v7 = v3;
  dispatch_group_notify(v4, v5, v8);
}

uint64_t __78__SUICApplicationStateHelper__appInfoDictionariesForDisplayLayout_completion___block_invoke_5(void *a1)
{
  if (a1[4])
  {
    unint64_t v2 = *(void *)(*(void *)(a1[7] + 8) + 24) - 2;
    id v3 = (void *)a1[5];
    if (v2 > 0x7FFFFFFFFFFFFFFCLL) {
      objc_msgSend(v3, "insertObject:atIndex:");
    }
    else {
      objc_msgSend(v3, "addObject:");
    }
  }
  uint64_t v4 = *(uint64_t (**)(void))(a1[6] + 16);

  return v4();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_foregroundAppInfos, 0);
  objc_storeStrong((id *)&self->_carplayDisplayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);

  objc_storeStrong((id *)&self->_appStateMonitor, 0);
}

@end