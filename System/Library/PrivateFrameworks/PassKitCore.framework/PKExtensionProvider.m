@interface PKExtensionProvider
+ (id)providerForExtensionPoint:(id)a3;
- (BOOL)isBeginningMatching;
- (NSDictionary)passKitExtensions;
- (NSMutableArray)beginMatchingCompletions;
- (NSString)extensionPoint;
- (OS_dispatch_queue)extensionQueue;
- (OS_dispatch_source)extensionMatchTimer;
- (PKExtensionProvider)init;
- (PKExtensionProvider)initWithExtensionPoint:(id)a3;
- (id)_extensionMatchingEntitlementAttribute;
- (id)_extensionsForContainingApplicationIdentifiers:(id)a3;
- (id)matchingContext;
- (void)_beginMatchingExtensionsWithCompletion:(id)a3;
- (void)_endMatchingExtensions;
- (void)_finishedMatchingExtensions:(id)a3 withError:(id)a4;
- (void)_invokeAndClearBeginMatchingCompletionsWithError:(id)a3;
- (void)beginExtensionRequestWithExtension:(id)a3 inputItems:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)extensionWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)extensionsWithContainingApplicationIdentifiers:(id)a3 completion:(id)a4;
- (void)setBeginMatchingCompletions:(id)a3;
- (void)setExtensionMatchTimer:(id)a3;
- (void)setExtensionPoint:(id)a3;
- (void)setExtensionQueue:(id)a3;
- (void)setIsBeginningMatching:(BOOL)a3;
- (void)setMatchingContext:(id)a3;
- (void)setPassKitExtensions:(id)a3;
@end

@implementation PKExtensionProvider

+ (id)providerForExtensionPoint:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_257);
  v4 = [(id)qword_1EB4032C0 objectForKey:v3];
  if (!v4)
  {
    v4 = [[PKExtensionProvider alloc] initWithExtensionPoint:v3];
    v5 = (void *)qword_1EB4032C0;
    if (!qword_1EB4032C0)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v7 = (void *)qword_1EB4032C0;
      qword_1EB4032C0 = (uint64_t)v6;

      v5 = (void *)qword_1EB4032C0;
    }
    [v5 setObject:v4 forKey:v3];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_257);

  return v4;
}

- (PKExtensionProvider)init
{
  return 0;
}

- (PKExtensionProvider)initWithExtensionPoint:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKExtensionProvider;
  id v6 = [(PKExtensionProvider *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extensionPoint, a3);
    v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    passKitExtensions = v7->_passKitExtensions;
    v7->_passKitExtensions = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    beginMatchingCompletions = v7->_beginMatchingCompletions;
    v7->_beginMatchingCompletions = v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.PassKit.extension-queue", 0);
    extensionQueue = v7->_extensionQueue;
    v7->_extensionQueue = (OS_dispatch_queue *)v12;
  }
  return v7;
}

- (void)dealloc
{
  [(PKExtensionProvider *)self _endMatchingExtensions];
  v3.receiver = self;
  v3.super_class = (Class)PKExtensionProvider;
  [(PKExtensionProvider *)&v3 dealloc];
}

- (void)extensionWithBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Getting extension with bundle identifier: %@", buf, 0xCu);
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__PKExtensionProvider_extensionWithBundleIdentifier_completion___block_invoke;
    aBlock[3] = &unk_1E56EEE30;
    id v9 = v6;
    id v17 = v9;
    id v18 = v7;
    v10 = _Block_copy(aBlock);
    extensionQueue = self->_extensionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__PKExtensionProvider_extensionWithBundleIdentifier_completion___block_invoke_32;
    block[3] = &unk_1E56D89F0;
    block[4] = self;
    id v14 = v9;
    id v15 = v10;
    id v12 = v10;
    dispatch_async(extensionQueue, block);
  }
}

void __64__PKExtensionProvider_extensionWithBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Finished getting extension with bundle identifier: %@, matched extension: %@, error: %@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __64__PKExtensionProvider_extensionWithBundleIdentifier_completion___block_invoke_32(id *a1)
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__57;
  __int16 v13 = __Block_byref_object_dispose__57;
  id v14 = [*((id *)a1[4] + 3) objectForKey:a1[5]];
  if (v10[5])
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    objc_initWeak(&location, a1[4]);
    id v2 = a1[4];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __64__PKExtensionProvider_extensionWithBundleIdentifier_completion___block_invoke_33;
    v3[3] = &unk_1E56EEE58;
    objc_copyWeak(&v7, &location);
    id v5 = a1[6];
    id v6 = &v9;
    id v4 = a1[5];
    [v2 _beginMatchingExtensionsWithCompletion:v3];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v9, 8);
}

void __64__PKExtensionProvider_extensionWithBundleIdentifier_completion___block_invoke_33(uint64_t a1, void *a2)
{
  id v10 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = (uint64_t)v10;
    if (!v10)
    {
      uint64_t v6 = [WeakRetained[3] objectForKey:*(void *)(a1 + 32)];
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        uint64_t v5 = 0;
      }
      else
      {
        uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1001 userInfo:0];
      }
    }
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    id v10 = (id)v5;
  }
  else
  {
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

- (void)extensionsWithContainingApplicationIdentifiers:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Getting extensions with containing application identifiers: %@", buf, 0xCu);
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__PKExtensionProvider_extensionsWithContainingApplicationIdentifiers_completion___block_invoke;
    aBlock[3] = &unk_1E56D90B0;
    id v9 = v6;
    id v17 = v9;
    id v18 = v7;
    id v10 = _Block_copy(aBlock);
    extensionQueue = self->_extensionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__PKExtensionProvider_extensionsWithContainingApplicationIdentifiers_completion___block_invoke_38;
    block[3] = &unk_1E56D89F0;
    block[4] = self;
    id v14 = v9;
    id v15 = v10;
    id v12 = v10;
    dispatch_async(extensionQueue, block);
  }
}

void __81__PKExtensionProvider_extensionsWithContainingApplicationIdentifiers_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Finished getting extensions with containing application identifiers: %@, matched extensions: %@, error: %@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81__PKExtensionProvider_extensionsWithContainingApplicationIdentifiers_completion___block_invoke_38(id *a1)
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__57;
  __int16 v13 = __Block_byref_object_dispose__57;
  id v14 = [a1[4] _extensionsForContainingApplicationIdentifiers:a1[5]];
  if ([(id)v10[5] count])
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    objc_initWeak(&location, a1[4]);
    id v2 = a1[4];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __81__PKExtensionProvider_extensionsWithContainingApplicationIdentifiers_completion___block_invoke_2;
    v3[3] = &unk_1E56EEE58;
    objc_copyWeak(&v7, &location);
    id v5 = a1[6];
    id v6 = &v9;
    id v4 = a1[5];
    [v2 _beginMatchingExtensionsWithCompletion:v3];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v9, 8);
}

void __81__PKExtensionProvider_extensionsWithContainingApplicationIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = (uint64_t)v10;
    if (!v10)
    {
      uint64_t v6 = [WeakRetained _extensionsForContainingApplicationIdentifiers:*(void *)(a1 + 32)];
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
      {
        uint64_t v5 = 0;
      }
      else
      {
        uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1001 userInfo:0];
      }
    }
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    id v10 = (id)v5;
  }
  else
  {
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

- (void)beginExtensionRequestWithExtension:(id)a3 inputItems:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 extension];
  if (v10)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __80__PKExtensionProvider_beginExtensionRequestWithExtension_inputItems_completion___block_invoke;
    v12[3] = &unk_1E56E4E70;
    id v14 = v9;
    id v13 = v7;
    [v10 beginExtensionRequestWithInputItems:v8 completion:v12];
  }
  else if (v9)
  {
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1001 userInfo:0];
    (*((void (**)(id, id, void, void *))v9 + 2))(v9, v7, 0, v11);
  }
}

uint64_t __80__PKExtensionProvider_beginExtensionRequestWithExtension_inputItems_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(result + 16))(result, *(void *)(a1 + 32), a2, a3);
  }
  return result;
}

- (void)_finishedMatchingExtensions:(id)a3 withError:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  self->_isBeginningMatching = 0;
  extensionMatchTimer = self->_extensionMatchTimer;
  if (extensionMatchTimer)
  {
    dispatch_source_cancel(extensionMatchTimer);
    id v9 = self->_extensionMatchTimer;
    self->_extensionMatchTimer = 0;
  }
  if (v7)
  {
    [(PKExtensionProvider *)self _invokeAndClearBeginMatchingCompletionsWithError:v7];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __61__PKExtensionProvider__finishedMatchingExtensions_withError___block_invoke;
    v20[3] = &unk_1E56EEE80;
    id v21 = v10;
    v22 = self;
    uint64_t v11 = v10;
    [v6 enumerateObjectsUsingBlock:v20];
    passKitExtensions = self->_passKitExtensions;
    if (v11) {
      BOOL v13 = passKitExtensions == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13) {
      int v14 = passKitExtensions == v11;
    }
    else {
      int v14 = [(NSDictionary *)passKitExtensions isEqual:v11];
    }
    uint64_t v15 = (NSDictionary *)[(NSDictionary *)v11 copy];
    v16 = self->_passKitExtensions;
    self->_passKitExtensions = v15;

    [(PKExtensionProvider *)self _invokeAndClearBeginMatchingCompletionsWithError:0];
    if (v14)
    {
      id v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v23 = @"PKExtensionAvailableExtensions";
      id v18 = [(NSDictionary *)self->_passKitExtensions allValues];
      v24[0] = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      [v17 postNotificationName:@"PKExtensionAvailableExtensionsChangedNotification" object:0 userInfo:v19];
    }
  }
}

void __61__PKExtensionProvider__finishedMatchingExtensions_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 identifier];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [[PKExtension alloc] initWithIdentifier:v6 extension:v3 provider:*(void *)(a1 + 40)];

  [v4 setObject:v5 forKey:v6];
}

- (void)_beginMatchingExtensionsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    beginMatchingCompletions = self->_beginMatchingCompletions;
    id v7 = _Block_copy(v4);
    [(NSMutableArray *)beginMatchingCompletions addObject:v7];
  }
  if (self->_matchingContext)
  {
    if (!self->_isBeginningMatching) {
      [(PKExtensionProvider *)self _invokeAndClearBeginMatchingCompletionsWithError:0];
    }
  }
  else
  {
    self->_isBeginningMatching = 1;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v8 setObject:self->_extensionPoint forKey:*MEMORY[0x1E4F282B0]];
    id v9 = [(PKExtensionProvider *)self _extensionMatchingEntitlementAttribute];
    if (v9) {
      [v8 setObject:MEMORY[0x1E4F1CC38] forKey:v9];
    }
    objc_initWeak(&location, self);
    id v10 = (void *)MEMORY[0x1E4F28C70];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__PKExtensionProvider__beginMatchingExtensionsWithCompletion___block_invoke;
    v19[3] = &unk_1E56DD060;
    objc_copyWeak(&v20, &location);
    uint64_t v11 = [v10 beginMatchingExtensionsWithAttributes:v8 completion:v19];
    id matchingContext = self->_matchingContext;
    self->_id matchingContext = v11;

    if (self->_matchingContext)
    {
      BOOL v13 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_extensionQueue);
      extensionMatchTimer = self->_extensionMatchTimer;
      self->_extensionMatchTimer = v13;

      uint64_t v15 = self->_extensionMatchTimer;
      dispatch_time_t v16 = dispatch_time(0, 3000000000);
      dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      id v17 = self->_extensionMatchTimer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __62__PKExtensionProvider__beginMatchingExtensionsWithCompletion___block_invoke_3;
      handler[3] = &unk_1E56D8AE0;
      handler[4] = self;
      dispatch_source_set_event_handler(v17, handler);
      dispatch_resume((dispatch_object_t)self->_extensionMatchTimer);
    }
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __62__PKExtensionProvider__beginMatchingExtensionsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained[7];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__PKExtensionProvider__beginMatchingExtensionsWithCompletion___block_invoke_2;
    block[3] = &unk_1E56D8AB8;
    block[4] = WeakRetained;
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __62__PKExtensionProvider__beginMatchingExtensionsWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishedMatchingExtensions:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
}

void __62__PKExtensionProvider__beginMatchingExtensionsWithCompletion___block_invoke_3(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28228];
  v6[0] = @"Extension matching timed out";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = [v2 errorWithDomain:@"PKPassKitErrorDomain" code:-1001 userInfo:v3];
  [v1 _finishedMatchingExtensions:0 withError:v4];
}

- (void)_endMatchingExtensions
{
  if (self->_matchingContext)
  {
    objc_msgSend(MEMORY[0x1E4F28C70], "endMatchingExtensions:");
    id matchingContext = self->_matchingContext;
    self->_id matchingContext = 0;
  }
  extensionMatchTimer = self->_extensionMatchTimer;
  if (extensionMatchTimer)
  {
    dispatch_source_cancel(extensionMatchTimer);
    uint64_t v5 = self->_extensionMatchTimer;
    self->_extensionMatchTimer = 0;
  }
}

- (void)_invokeAndClearBeginMatchingCompletionsWithError:(id)a3
{
  id v4 = a3;
  beginMatchingCompletions = self->_beginMatchingCompletions;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__PKExtensionProvider__invokeAndClearBeginMatchingCompletionsWithError___block_invoke;
  v7[3] = &unk_1E56EEEA8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)beginMatchingCompletions enumerateObjectsUsingBlock:v7];
  [(NSMutableArray *)self->_beginMatchingCompletions removeAllObjects];
}

uint64_t __72__PKExtensionProvider__invokeAndClearBeginMatchingCompletionsWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (id)_extensionsForContainingApplicationIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSDictionary *)self->_passKitExtensions allValues];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__PKExtensionProvider__extensionsForContainingApplicationIdentifiers___block_invoke;
  v9[3] = &unk_1E56EEEF8;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "pk_objectsPassingTest:", v9);

  return v7;
}

uint64_t __70__PKExtensionProvider__extensionsForContainingApplicationIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__PKExtensionProvider__extensionsForContainingApplicationIdentifiers___block_invoke_2;
  v8[3] = &unk_1E56EEED0;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "pk_containsObjectPassingTest:", v8);

  return v6;
}

uint64_t __70__PKExtensionProvider__extensionsForContainingApplicationIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) containingApplicationIdentifier];
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v6 == v5)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (id)_extensionMatchingEntitlementAttribute
{
  id v2 = self->_extensionPoint;
  if (v2 == @"com.apple.PassKit.payment-information-event") {
    return @"ENTITLEMENT:com.apple.developer.payment-information-event-eligible";
  }
  id v3 = v2;
  if (v2
    && (int v4 = [(__CFString *)v2 isEqualToString:@"com.apple.PassKit.payment-information-event"], v3, v4))
  {
    return @"ENTITLEMENT:com.apple.developer.payment-information-event-eligible";
  }
  else
  {
    return 0;
  }
}

- (NSString)extensionPoint
{
  return self->_extensionPoint;
}

- (void)setExtensionPoint:(id)a3
{
}

- (NSDictionary)passKitExtensions
{
  return self->_passKitExtensions;
}

- (void)setPassKitExtensions:(id)a3
{
}

- (id)matchingContext
{
  return self->_matchingContext;
}

- (void)setMatchingContext:(id)a3
{
}

- (BOOL)isBeginningMatching
{
  return self->_isBeginningMatching;
}

- (void)setIsBeginningMatching:(BOOL)a3
{
  self->_isBeginningMatching = a3;
}

- (NSMutableArray)beginMatchingCompletions
{
  return self->_beginMatchingCompletions;
}

- (void)setBeginMatchingCompletions:(id)a3
{
}

- (OS_dispatch_source)extensionMatchTimer
{
  return self->_extensionMatchTimer;
}

- (void)setExtensionMatchTimer:(id)a3
{
}

- (OS_dispatch_queue)extensionQueue
{
  return self->_extensionQueue;
}

- (void)setExtensionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionQueue, 0);
  objc_storeStrong((id *)&self->_extensionMatchTimer, 0);
  objc_storeStrong((id *)&self->_beginMatchingCompletions, 0);
  objc_storeStrong(&self->_matchingContext, 0);
  objc_storeStrong((id *)&self->_passKitExtensions, 0);
  objc_storeStrong((id *)&self->_extensionPoint, 0);
}

@end