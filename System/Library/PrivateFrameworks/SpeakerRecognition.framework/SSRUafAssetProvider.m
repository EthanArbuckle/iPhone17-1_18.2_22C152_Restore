@interface SSRUafAssetProvider
- (CSUAFAssetManager)uafAssetManager;
- (SSRUafAssetProvider)init;
- (id)installedAssetOfType:(unint64_t)a3 forLanguageCode:(id)a4;
- (unint64_t)getAssetProviderType;
- (void)dealloc;
- (void)setUafAssetManager:(id)a3;
@end

@implementation SSRUafAssetProvider

- (void).cxx_destruct
{
}

- (void)setUafAssetManager:(id)a3
{
}

- (CSUAFAssetManager)uafAssetManager
{
  return self->_uafAssetManager;
}

- (id)installedAssetOfType:(unint64_t)a3 forLanguageCode:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a4;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__5344;
  v29 = __Block_byref_object_dispose__5345;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5344;
  v23 = __Block_byref_object_dispose__5345;
  id v24 = 0;
  uafAssetManager = self->_uafAssetManager;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__SSRUafAssetProvider_installedAssetOfType_forLanguageCode___block_invoke;
  v15[3] = &unk_264429958;
  v17 = &v25;
  v18 = &v19;
  v9 = v7;
  v16 = v9;
  [(CSUAFAssetManager *)uafAssetManager getInstalledAssetofType:a3 forLocale:v6 completion:v15];
  dispatch_time_t v10 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v9, v10);
  uint64_t v11 = v26[5];
  if (v11)
  {
    v12 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[SSRUafAssetProvider installedAssetOfType:forLanguageCode:]";
      __int16 v33 = 2112;
      uint64_t v34 = v11;
      _os_log_error_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_ERROR, "%s uaf asset fetching error: %@", buf, 0x16u);
    }
  }
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

void __60__SSRUafAssetProvider_installedAssetOfType_forLanguageCode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (unint64_t)getAssetProviderType
{
  return 2;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uafAssetManager = self->_uafAssetManager;
  self->_uafAssetManager = 0;

  v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_semaphore_t v7 = "-[SSRUafAssetProvider dealloc]";
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v5.receiver = self;
  v5.super_class = (Class)SSRUafAssetProvider;
  [(SSRUafAssetProvider *)&v5 dealloc];
}

- (SSRUafAssetProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)SSRUafAssetProvider;
  v2 = [(SSRUafAssetProvider *)&v7 init];
  if (!v2) {
    goto LABEL_6;
  }
  if (([MEMORY[0x263F380D0] supportsUnderstandingOnDevice] & 1) != 0
    || [MEMORY[0x263F380D0] supportsHybridUnderstandingOnDevice])
  {
    v3 = (CSUAFAssetManager *)objc_alloc_init(MEMORY[0x263F380C8]);
    uafAssetManager = v2->_uafAssetManager;
    v2->_uafAssetManager = v3;
  }
  if (!v2->_uafAssetManager) {
    objc_super v5 = 0;
  }
  else {
LABEL_6:
  }
    objc_super v5 = v2;

  return v5;
}

@end