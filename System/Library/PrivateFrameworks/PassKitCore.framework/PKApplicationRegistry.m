@interface PKApplicationRegistry
- (BOOL)applicationIsRegisteredWithBundleIdentifier:(id)a3;
- (BOOL)registerApplicationWithBundleIdentifier:(id)a3;
- (PKApplicationRegistry)initWithArchiveFileURL:(id)a3;
- (void)_requestArchiveToDisk;
- (void)_validateRegisteredApplications;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
@end

@implementation PKApplicationRegistry

- (PKApplicationRegistry)initWithArchiveFileURL:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKApplicationRegistry;
  v5 = [(PKApplicationRegistry *)&v13 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.passkit.applicationregistry", 0);
    applicationRegistryQueue = v5->_applicationRegistryQueue;
    v5->_applicationRegistryQueue = (OS_dispatch_queue *)v6;

    v8 = v5->_applicationRegistryQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__PKApplicationRegistry_initWithArchiveFileURL___block_invoke;
    v10[3] = &unk_1E56D8A90;
    v11 = v5;
    id v12 = v4;
    dispatch_sync(v8, v10);
  }
  return v5;
}

void __48__PKApplicationRegistry_initWithArchiveFileURL___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  dispatch_semaphore_t v3 = dispatch_semaphore_create(1);
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 8);
  *(void *)(v7 + 8) = v6;

  v9 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v9 addObserver:*(void *)(a1 + 32)];
  v10 = [*(id *)(a1 + 40) path];
  int v11 = [v2 fileExistsAtPath:v10];

  if (v11)
  {
    id v12 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:*(void *)(a1 + 40) options:1 error:0];
    if (!v12)
    {
LABEL_11:

      goto LABEL_12;
    }
    id v26 = 0;
    objc_super v13 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v12 error:&v26];
    id v14 = v26;
    id v15 = v14;
    if (v13)
    {
      if (v14)
      {
        [v13 finishDecoding];
      }
      else
      {
        v16 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v17 = objc_opt_class();
        v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
        id v25 = 0;
        v19 = [v13 decodeTopLevelObjectOfClasses:v18 forKey:@"registeredBundleIdentifiers" error:&v25];
        id v15 = v25;

        uint64_t v20 = [v19 mutableCopy];
        uint64_t v21 = *(void *)(a1 + 32);
        v22 = *(void **)(v21 + 8);
        *(void *)(v21 + 8) = v20;

        [*(id *)(a1 + 32) _validateRegisteredApplications];
        [v13 finishDecoding];
        if (!v15)
        {
LABEL_10:

          goto LABEL_11;
        }
      }
    }
    v23 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v24;
      __int16 v29 = 2114;
      id v30 = v15;
      _os_log_error_impl(&dword_190E10000, v23, OS_LOG_TYPE_ERROR, "PKApplicationRegistry: error trying to read %{public}@. The data will be discarded. %{public}@.", buf, 0x16u);
    }

    goto LABEL_10;
  }
LABEL_12:
}

- (void)dealloc
{
  dispatch_semaphore_t v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKApplicationRegistry;
  [(PKApplicationRegistry *)&v4 dealloc];
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  applicationRegistryQueue = self->_applicationRegistryQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PKApplicationRegistry_applicationsDidUninstall___block_invoke;
  v7[3] = &unk_1E56D8A90;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(applicationRegistryQueue, v7);
}

uint64_t __50__PKApplicationRegistry_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__PKApplicationRegistry_applicationsDidUninstall___block_invoke_2;
  v4[3] = &unk_1E56F3760;
  v4[4] = *(void *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v4];
  return [*(id *)(a1 + 40) _requestArchiveToDisk];
}

void __50__PKApplicationRegistry_applicationsDidUninstall___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 bundleIdentifier];
  [*(id *)(*(void *)(a1 + 32) + 8) removeObject:v3];
}

- (BOOL)registerApplicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  applicationRegistryQueue = self->_applicationRegistryQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PKApplicationRegistry_registerApplicationWithBundleIdentifier___block_invoke;
  block[3] = &unk_1E56E4F00;
  id v9 = v4;
  v10 = self;
  int v11 = &v12;
  id v6 = v4;
  dispatch_sync(applicationRegistryQueue, block);
  LOBYTE(applicationRegistryQueue) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)applicationRegistryQueue;
}

void __65__PKApplicationRegistry_registerApplicationWithBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F223C8]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v10 = 0;
  id v4 = (void *)[v2 initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v10];
  id v5 = v10;
  if (v5)
  {
    id v6 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKApplicationRegistry failed to obtain application record for %@ with error %@", buf, 0x16u);
    }
  }
  if (([*(id *)(*(void *)(a1 + 40) + 8) containsObject:*(void *)(a1 + 32)] & 1) != 0
    || ([v4 applicationState],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isInstalled],
        v8,
        v9))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(*(void *)(a1 + 40) + 8) addObject:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) _requestArchiveToDisk];
  }
}

- (BOOL)applicationIsRegisteredWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  applicationRegistryQueue = self->_applicationRegistryQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKApplicationRegistry_applicationIsRegisteredWithBundleIdentifier___block_invoke;
  block[3] = &unk_1E56F3548;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(applicationRegistryQueue, block);
  LOBYTE(applicationRegistryQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)applicationRegistryQueue;
}

uint64_t __69__PKApplicationRegistry_applicationIsRegisteredWithBundleIdentifier___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 8) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)_validateRegisteredApplications
{
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  registeredBundleIdentifiers = self->_registeredBundleIdentifiers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PKApplicationRegistry__validateRegisteredApplications__block_invoke;
  v6[3] = &unk_1E56DD010;
  id v7 = v3;
  id v5 = v3;
  [(NSMutableSet *)registeredBundleIdentifiers enumerateObjectsUsingBlock:v6];
  [(NSMutableSet *)self->_registeredBundleIdentifiers minusSet:v5];
  [(PKApplicationRegistry *)self _requestArchiveToDisk];
}

void __56__PKApplicationRegistry__validateRegisteredApplications__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v6 allowPlaceholder:1 error:0];
  id v4 = [v3 applicationState];
  char v5 = [v4 isInstalled];

  if ((v5 & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

- (void)_requestArchiveToDisk
{
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_archiveSemaphore, 0))
  {
    dispatch_time_t v3 = dispatch_time(0, 2000000000);
    applicationRegistryQueue = self->_applicationRegistryQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PKApplicationRegistry__requestArchiveToDisk__block_invoke;
    block[3] = &unk_1E56D8AE0;
    void block[4] = self;
    dispatch_after(v3, applicationRegistryQueue, block);
  }
}

intptr_t __46__PKApplicationRegistry__requestArchiveToDisk__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 16))
  {
    if (![*(id *)(v1 + 8) count]) {
      goto LABEL_7;
    }
    dispatch_time_t v3 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Archiving Application Registry", v7, 2u);
    }

    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [v4 encodeObject:*(void *)(*(void *)(a1 + 32) + 8) forKey:@"registeredBundleIdentifiers"];
    [v4 finishEncoding];
    char v5 = [v4 encodedData];

    if (v5)
    {
      [v5 writeToURL:*(void *)(*(void *)(a1 + 32) + 16) atomically:1];
      PKExcludeFileURLFromBackup(*(void **)(*(void *)(a1 + 32) + 16));
    }
    else
    {
LABEL_7:
      char v5 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v5 removeItemAtURL:*(void *)(*(void *)(a1 + 32) + 16) error:0];
    }

    uint64_t v1 = *(void *)(a1 + 32);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 24));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationRegistryQueue, 0);
  objc_storeStrong((id *)&self->_archiveSemaphore, 0);
  objc_storeStrong((id *)&self->_archiveFileURL, 0);
  objc_storeStrong((id *)&self->_registeredBundleIdentifiers, 0);
}

@end