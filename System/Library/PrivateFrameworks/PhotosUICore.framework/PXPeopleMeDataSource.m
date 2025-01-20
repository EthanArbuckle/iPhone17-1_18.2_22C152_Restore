@interface PXPeopleMeDataSource
+ (id)new;
- (BOOL)hasRequestedMeContact;
- (BOOL)hasRequestedSuggestedPerson;
- (CNContact)meContact;
- (OS_dispatch_queue)fetchQueue;
- (OS_dispatch_queue)meContactIsolationQueue;
- (PHPerson)suggestedPerson;
- (PHPhotoLibrary)photoLibrary;
- (PXPeopleMeDataSource)init;
- (PXPeopleMeDataSource)initWithPhotoLibrary:(id)a3;
- (id)_fetchPersonWithUri:(id)a3;
- (id)_fetchQueue_suggestedPersonForMe;
- (void)_assertIsOnFetchQueue;
- (void)_fetchQueue_persistSuggestedPersonAsMe;
- (void)_fetchQueue_requestMeContactWithCompletion:(id)a3;
- (void)confirmSuggestedMePerson;
- (void)rejectSuggestedMePerson;
- (void)requestSuggestedMePersonWithCompletion:(id)a3;
- (void)setMeContact:(id)a3;
- (void)setRequestedMeContact:(BOOL)a3;
- (void)setRequestedSuggestedPerson:(BOOL)a3;
- (void)setSuggestedPerson:(id)a3;
@end

@implementation PXPeopleMeDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meContactIsolationQueue, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_suggestedPerson, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)setRequestedMeContact:(BOOL)a3
{
  self->_requestedMeContact = a3;
}

- (BOOL)hasRequestedMeContact
{
  return self->_requestedMeContact;
}

- (void)setRequestedSuggestedPerson:(BOOL)a3
{
  self->_requestedSuggestedPerson = a3;
}

- (BOOL)hasRequestedSuggestedPerson
{
  return self->_requestedSuggestedPerson;
}

- (OS_dispatch_queue)meContactIsolationQueue
{
  return self->_meContactIsolationQueue;
}

- (void)setMeContact:(id)a3
{
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (void)setSuggestedPerson:(id)a3
{
}

- (PHPerson)suggestedPerson
{
  return self->_suggestedPerson;
}

- (OS_dispatch_queue)fetchQueue
{
  return self->_fetchQueue;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXPeopleMeDataSource)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeopleMeDataSource.m", 231, @"%s is not available as initializer", "-[PXPeopleMeDataSource init]");

  abort();
}

- (void)_assertIsOnFetchQueue
{
  label = dispatch_queue_get_label(0);
  v5 = [(PXPeopleMeDataSource *)self fetchQueue];
  v6 = dispatch_queue_get_label(v5);

  if (label != v6)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXPeopleMeDataSource.m", 225, @"Invalid parameter not satisfying: %@", @"dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL) == dispatch_queue_get_label(self.fetchQueue)" object file lineNumber description];
  }
}

- (id)_fetchPersonWithUri:(id)a3
{
  return +[PXPeopleUtilities personWithPersonUri:a3];
}

- (void)_fetchQueue_persistSuggestedPersonAsMe
{
  [(PXPeopleMeDataSource *)self _assertIsOnFetchQueue];
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__PXPeopleMeDataSource__fetchQueue_persistSuggestedPersonAsMe__block_invoke;
  v3[3] = &unk_1E5DC1F68;
  objc_copyWeak(&v4, &location);
  [(PXPeopleMeDataSource *)self _fetchQueue_requestMeContactWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __62__PXPeopleMeDataSource__fetchQueue_persistSuggestedPersonAsMe__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained suggestedPerson];

  if (v5)
  {
    v6 = [v5 localIdentifier];
    id v7 = +[PXPeopleUtilities personWithLocalIdentifier:v6];

    if (v3 && v7)
    {
      v8 = [v3 identifier];
      v9 = [MEMORY[0x1E4F391F0] fullNameFromContact:v3];
      v10 = [MEMORY[0x1E4F391F0] displayNameFromContact:v3];
      v11 = [v7 photoLibrary];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __62__PXPeopleMeDataSource__fetchQueue_persistSuggestedPersonAsMe__block_invoke_2;
      v20[3] = &unk_1E5DC1F40;
      id v7 = v7;
      id v21 = v7;
      id v22 = v3;
      id v12 = v8;
      id v23 = v12;
      id v13 = v9;
      id v24 = v13;
      id v14 = v10;
      id v25 = v14;
      id v19 = 0;
      char v15 = [v11 performChangesAndWait:v20 error:&v19];
      id v16 = v19;
      if ((v15 & 1) == 0)
      {
        v17 = PLUIGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = [v7 localIdentifier];
          *(_DWORD *)buf = 138543618;
          v27 = v18;
          __int16 v28 = 2112;
          id v29 = v16;
          _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_DEFAULT, "Failed to change name for person: %{public}@ (%@)", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    id v7 = 0;
  }
}

void __62__PXPeopleMeDataSource__fetchQueue_persistSuggestedPersonAsMe__block_invoke_2(uint64_t a1)
{
  id v6 = [MEMORY[0x1E4F39200] changeRequestForPerson:*(void *)(a1 + 32)];
  v2 = +[PXPeopleUtilities sharedContactStore];
  id v3 = [MEMORY[0x1E4F8A768] matchingDictionaryForContact:*(void *)(a1 + 40) contactStore:v2];
  [v6 setContactMatchingDictionary:v3];
  [v6 setPersonUri:*(void *)(a1 + 48)];
  id v4 = [*(id *)(a1 + 32) name];
  uint64_t v5 = [v4 length];

  if (!v5)
  {
    [v6 setName:*(void *)(a1 + 56)];
    [v6 setDisplayName:*(void *)(a1 + 64)];
  }
}

- (id)_fetchQueue_suggestedPersonForMe
{
  v29[2] = *MEMORY[0x1E4F143B8];
  [(PXPeopleMeDataSource *)self _assertIsOnFetchQueue];
  if ([(PXPeopleMeDataSource *)self hasRequestedSuggestedPerson])
  {
    id v3 = [(PXPeopleMeDataSource *)self suggestedPerson];
    goto LABEL_25;
  }
  id v4 = +[PXPeopleUISettings sharedInstance];
  char v5 = [v4 alwaysShowMe];

  if (PFOSVariantHasInternalUI())
  {
    id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v7 = [v6 integerForKey:@"PhotosPeopleSuggestedMeIndex"];

    if (((v7 < 0) & v5) != 0) {
      uint64_t v7 = 0;
    }
    if ((v7 & 0x8000000000000000) == 0)
    {
      v8 = (void *)MEMORY[0x1E4F390A0];
      v9 = [(PXPeopleMeDataSource *)self photoLibrary];
      v10 = [v8 fetchOptionsWithPhotoLibrary:v9 orObject:0];

      [v10 setPersonContext:1];
      v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"manualOrder" ascending:1];
      v29[0] = v11;
      id v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
      v29[1] = v12;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
      [v10 setSortDescriptors:v13];

      id v14 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v10];
      uint64_t v15 = [v14 objectAtIndex:v7];
      if (v15)
      {
        id v3 = (void *)v15;
        id v16 = PLUIGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = [v3 localIdentifier];
          *(_DWORD *)buf = 138543362;
          id v28 = v17;
          _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEFAULT, "Using Debug suggested me person specified by PhotosPeopelSuggestedMeIndex: %{public}@", buf, 0xCu);
        }
LABEL_16:
        id v23 = [v3 personUri];
        if ([v23 length]) {
          char v24 = v5;
        }
        else {
          char v24 = 1;
        }
        if ((v24 & 1) == 0)
        {

          id v3 = 0;
        }
        [(PXPeopleMeDataSource *)self setSuggestedPerson:v3];
        [(PXPeopleMeDataSource *)self setRequestedSuggestedPerson:1];

        goto LABEL_25;
      }
    }
  }
  v18 = [(PXPeopleMeDataSource *)self photoLibrary];
  id v26 = 0;
  id v19 = [v18 suggestedMePersonIdentifierWithError:&v26];
  id v20 = v26;

  id v21 = PLUIGetLog();
  id v22 = v21;
  if (v19)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v19;
      _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_DEFAULT, "Fetching suggested me person with identifier: %{public}@", buf, 0xCu);
    }

    id v3 = +[PXPeopleUtilities personWithLocalIdentifier:v19];

    if (v3) {
      goto LABEL_16;
    }
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v20;
      _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_ERROR, "Failed to get suggested me person identifier: %@", buf, 0xCu);
    }

    id v3 = 0;
  }
LABEL_25:
  return v3;
}

- (void)_fetchQueue_requestMeContactWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  [(PXPeopleMeDataSource *)self _assertIsOnFetchQueue];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__175063;
  v18 = __Block_byref_object_dispose__175064;
  id v19 = 0;
  char v5 = [(PXPeopleMeDataSource *)self meContactIsolationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PXPeopleMeDataSource__fetchQueue_requestMeContactWithCompletion___block_invoke;
  block[3] = &unk_1E5DD0588;
  block[4] = self;
  block[5] = &v14;
  dispatch_sync(v5, block);

  if (v15[5] || [(PXPeopleMeDataSource *)self hasRequestedMeContact])
  {
    if (v4) {
      v4[2](v4, v15[5]);
    }
  }
  else
  {
    [(PXPeopleMeDataSource *)self setRequestedMeContact:1];
    id v6 = +[PXPeopleUtilities sharedContactStore];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__PXPeopleMeDataSource__fetchQueue_requestMeContactWithCompletion___block_invoke_2;
    v8[3] = &unk_1E5DCD048;
    id v12 = &v14;
    id v7 = v6;
    id v9 = v7;
    v10 = self;
    v11 = v4;
    [v7 requestAccessForEntityType:0 completionHandler:v8];
  }
  _Block_object_dispose(&v14, 8);
}

void __67__PXPeopleMeDataSource__fetchQueue_requestMeContactWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) meContact];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __67__PXPeopleMeDataSource__fetchQueue_requestMeContactWithCompletion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Error gaining access to Contacts for Me person fetching: %@", buf, 0xCu);
    }
  }
  if (a2)
  {
    id v7 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    v8 = *(void **)(a1 + 32);
    id v20 = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    id v19 = v5;
    uint64_t v10 = [v8 _crossPlatformUnifiedMeContactWithKeysToFetch:v9 error:&v19];
    id v11 = v19;

    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v10;

    if (v11)
    {
      uint64_t v14 = PLUIGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v11;
        _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "Error gaining access to the Me contact: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v11 = v5;
  }
  uint64_t v15 = [*(id *)(a1 + 40) meContactIsolationQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__PXPeopleMeDataSource__fetchQueue_requestMeContactWithCompletion___block_invoke_217;
  v18[3] = &unk_1E5DD0588;
  uint64_t v16 = *(void *)(a1 + 56);
  v18[4] = *(void *)(a1 + 40);
  v18[5] = v16;
  dispatch_sync(v15, v18);

  uint64_t v17 = *(void *)(a1 + 48);
  if (v17) {
    (*(void (**)(uint64_t, void))(v17 + 16))(v17, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  }
}

uint64_t __67__PXPeopleMeDataSource__fetchQueue_requestMeContactWithCompletion___block_invoke_217(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMeContact:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)rejectSuggestedMePerson
{
  uint64_t v2 = [(PXPeopleMeDataSource *)self fetchQueue];
  dispatch_async(v2, &__block_literal_global_175069);
}

uint64_t __47__PXPeopleMeDataSource_rejectSuggestedMePerson__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v0 setBool:1 forKey:@"PXPeopleMePrompted"];

  v1 = (void *)MEMORY[0x1E4F56658];
  uint64_t v2 = MEMORY[0x1E4F1CC08];
  return [v1 sendEvent:@"com.apple.photos.CPAnalytics.people.me.rejected" withPayload:v2];
}

- (void)confirmSuggestedMePerson
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(PXPeopleMeDataSource *)self fetchQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__PXPeopleMeDataSource_confirmSuggestedMePerson__block_invoke;
  v4[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

uint64_t __48__PXPeopleMeDataSource_confirmSuggestedMePerson__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 setBool:1 forKey:@"PXPeopleMePrompted"];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fetchQueue_persistSuggestedPersonAsMe");

  id v4 = (void *)MEMORY[0x1E4F56658];
  uint64_t v5 = MEMORY[0x1E4F1CC08];
  return [v4 sendEvent:@"com.apple.photos.CPAnalytics.people.me.confirmed" withPayload:v5];
}

- (void)requestSuggestedMePersonWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PXPeopleMeDataSource.m" lineNumber:56 description:@"completion must not be nil!"];
  }
  objc_initWeak(&location, self);
  id v6 = [(PXPeopleMeDataSource *)self fetchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PXPeopleMeDataSource_requestSuggestedMePersonWithCompletion___block_invoke;
  block[3] = &unk_1E5DD1848;
  id v10 = v5;
  id v7 = v5;
  objc_copyWeak(&v11, &location);
  dispatch_async(v6, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __63__PXPeopleMeDataSource_requestSuggestedMePersonWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v3 = [v2 BOOLForKey:@"PXPeopleMePrompted"];

  id v4 = +[PXPeopleUISettings sharedInstance];
  char v5 = [v4 alwaysShowMe];

  if (!v3 || (v5 & 1) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__PXPeopleMeDataSource_requestSuggestedMePersonWithCompletion___block_invoke_2;
    v8[3] = &unk_1E5DC1F18;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    char v11 = v5;
    id v9 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_fetchQueue_requestMeContactWithCompletion:", v8);

    objc_destroyWeak(&v10);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v6();
  }
}

void __63__PXPeopleMeDataSource_requestSuggestedMePersonWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (!v8) {
    goto LABEL_5;
  }
  int v3 = [v8 identifier];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v5 = [WeakRetained _fetchPersonWithUri:v3];

  if (!v5 || *(unsigned char *)(a1 + 48))
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    id v7 = objc_msgSend(v6, "_fetchQueue_suggestedPersonForMe");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
LABEL_5:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (PXPeopleMeDataSource)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXPeopleMeDataSource;
  id v6 = [(PXPeopleMeDataSource *)&v18 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.photos.people.meDataSource.fetch", v9);
    fetchQueue = v7->_fetchQueue;
    v7->_fetchQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.photos.people.meDataSource.meContactIsolation", v13);
    meContactIsolationQueue = v7->_meContactIsolationQueue;
    v7->_meContactIsolationQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v16 registerDefaults:&unk_1F02DB798];
  }
  return v7;
}

+ (id)new
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXPeopleMeDataSource.m", 235, @"%s is not available as initializer", "+[PXPeopleMeDataSource new]");

  abort();
}

@end