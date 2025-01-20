@interface PKSearchService
- (BOOL)canProvideFullResults;
- (BOOL)hasSearchableContentForQuery:(id)a3;
- (PKSearchService)init;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)errorHandlerForMethod:(SEL)a3 completion:(id)a4;
- (void)_accessObserversWithHandler:(id)a3;
- (void)cancelQueryWithIdentifier:(id)a3;
- (void)indexedPassesWithCompletion:(id)a3;
- (void)indexedTransactionWithIdentifier:(id)a3 completion:(id)a4;
- (void)indexedTransactionsWithCompletion:(id)a3;
- (void)invalidateSearchResults;
- (void)regionsWithCompletion:(id)a3;
- (void)registerObserver:(id)a3;
- (void)resetRegionsCoordinatesWithCompletion:(id)a3;
- (void)resetRegionsWithCompletion:(id)a3;
- (void)searchDidCompleteWithError:(id)a3 forIdentifier:(id)a4;
- (void)searchDidReceivePartialResults:(id)a3 forIdentifier:(id)a4;
- (void)searchWithQuery:(id)a3;
- (void)transactionsMissingRegionsWithCompletion:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateRegionWithIdentifier:(id)a3 localizedName:(id)a4 boundingRegion:(id *)a5 mapsIdentifier:(unint64_t)a6 providerIdentifier:(int)a7 completion:(id)a8;
@end

@implementation PKSearchService

- (PKSearchService)init
{
  v17.receiver = self;
  v17.super_class = (Class)PKSearchService;
  v2 = [(PKSearchService *)&v17 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.passkit.search.reply", v4);
    replyQueue = v2->_replyQueue;
    v2->_replyQueue = (OS_dispatch_queue *)v5;

    v7 = [PKXPCService alloc];
    v8 = PKSearchServiceDaemonInterface();
    v9 = PKSearchServiceClientInterface();
    uint64_t v10 = [(PKXPCService *)v7 initWithMachServiceName:@"com.apple.passd.search" remoteObjectInterface:v8 exportedObjectInterface:v9 exportedObject:v2];
    remoteService = v2->_remoteService;
    v2->_remoteService = (PKXPCService *)v10;

    v2->_lockObservers._os_unfair_lock_opaque = 0;
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v12;

    v2->_lockResults._os_unfair_lock_opaque = 0;
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    results = v2->_results;
    v2->_results = v14;
  }
  return v2;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    [(NSHashTable *)self->_observers addObject:v4];
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    [(NSHashTable *)self->_observers removeObject:v4];
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    dispatch_queue_t v5 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__PKSearchService__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E56D8A18;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(replyQueue, v8);
  }
}

void __47__PKSearchService__accessObserversWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)errorHandlerForMethod:(SEL)a3 completion:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PKSearchService_errorHandlerForMethod_completion___block_invoke;
  aBlock[3] = &unk_1E56DC960;
  id v12 = v6;
  SEL v13 = a3;
  aBlock[4] = self;
  id v7 = v6;
  long long v8 = _Block_copy(aBlock);
  long long v9 = _Block_copy(v8);

  return v9;
}

void __52__PKSearchService_errorHandlerForMethod_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PKLogFacilityTypeGetObject(0x12uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKSearchService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__PKSearchService_errorHandlerForMethod_completion___block_invoke_17;
  v11[3] = &unk_1E56D8428;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v3;
  uint64_t v13 = v8;
  id v14 = v7;
  long long v9 = v11;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  v16 = __dispatch_async_ar_block_invoke_15;
  objc_super v17 = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v3;
  dispatch_async(v6, &buf);
}

uint64_t __52__PKSearchService_errorHandlerForMethod_completion___block_invoke_17(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PKXPCService *)self->_remoteService remoteObjectProxyWithErrorHandler:a3];
}

- (BOOL)canProvideFullResults
{
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  remoteService = self->_remoteService;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__PKSearchService_canProvideFullResults__block_invoke;
  v7[3] = &unk_1E56DE248;
  v7[4] = &v8;
  id v3 = [(PKSearchService *)self errorHandlerForMethod:a2 completion:v7];
  uint64_t v4 = [(PKXPCService *)remoteService synchronousRemoteObjectProxyWithErrorHandler:v3];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__PKSearchService_canProvideFullResults__block_invoke_2;
  v6[3] = &unk_1E56D86D0;
  v6[4] = &v8;
  [v4 canProvideFullResultsWithCompletion:v6];
  LOBYTE(v3) = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)v3;
}

uint64_t __40__PKSearchService_canProvideFullResults__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __40__PKSearchService_canProvideFullResults__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)hasSearchableContentForQuery:(id)a3
{
  id v5 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  remoteService = self->_remoteService;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__PKSearchService_hasSearchableContentForQuery___block_invoke;
  v11[3] = &unk_1E56DE248;
  void v11[4] = &v12;
  id v7 = [(PKSearchService *)self errorHandlerForMethod:a2 completion:v11];
  uint64_t v8 = [(PKXPCService *)remoteService synchronousRemoteObjectProxyWithErrorHandler:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__PKSearchService_hasSearchableContentForQuery___block_invoke_2;
  v10[3] = &unk_1E56D86D0;
  v10[4] = &v12;
  [v8 hasSearchableContentForQuery:v5 withCompletion:v10];
  LOBYTE(v7) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v7;
}

uint64_t __48__PKSearchService_hasSearchableContentForQuery___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __48__PKSearchService_hasSearchableContentForQuery___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)searchWithQuery:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5 && ([v5 identifier], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __35__PKSearchService_searchWithQuery___block_invoke;
    v13[3] = &unk_1E56E15A8;
    objc_copyWeak(&v15, &location);
    id v8 = v6;
    id v14 = v8;
    long long v9 = [(PKSearchService *)self errorHandlerForMethod:a2 completion:v13];
    uint64_t v10 = [(PKSearchService *)self _remoteObjectProxyWithErrorHandler:v9];

    [v10 searchWithQuery:v8];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    char v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSearchErrorDomain" code:3 userInfo:0];
    uint64_t v12 = [v6 identifier];
    [(PKSearchService *)self searchDidCompleteWithError:v11 forIdentifier:v12];
  }
}

void __35__PKSearchService_searchWithQuery___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = [*(id *)(a1 + 32) identifier];
    [WeakRetained searchDidCompleteWithError:v5 forIdentifier:v4];
  }
}

- (void)cancelQueryWithIdentifier:(id)a3
{
  id v5 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__PKSearchService_cancelQueryWithIdentifier___block_invoke;
  v9[3] = &unk_1E56E15A8;
  objc_copyWeak(&v11, &location);
  id v6 = v5;
  id v10 = v6;
  id v7 = [(PKSearchService *)self errorHandlerForMethod:a2 completion:v9];
  id v8 = [(PKSearchService *)self _remoteObjectProxyWithErrorHandler:v7];

  [v8 cancelQueryWithIdentifier:v6];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __45__PKSearchService_cancelQueryWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained searchDidCompleteWithError:v5 forIdentifier:*(void *)(a1 + 32)];
  }
}

- (void)updateRegionWithIdentifier:(id)a3 localizedName:(id)a4 boundingRegion:(id *)a5 mapsIdentifier:(unint64_t)a6 providerIdentifier:(int)a7 completion:(id)a8
{
  double v14 = v11;
  double v15 = v10;
  double v16 = v9;
  double v17 = v8;
  id v22 = *(id *)&a7;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __120__PKSearchService_updateRegionWithIdentifier_localizedName_boundingRegion_mapsIdentifier_providerIdentifier_completion___block_invoke;
  v31[3] = &unk_1E56D8388;
  id v23 = v22;
  id v32 = v23;
  id v24 = a4;
  id v25 = a3;
  v26 = [(PKSearchService *)self errorHandlerForMethod:a2 completion:v31];
  v27 = [(PKSearchService *)self _remoteObjectProxyWithErrorHandler:v26];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __120__PKSearchService_updateRegionWithIdentifier_localizedName_boundingRegion_mapsIdentifier_providerIdentifier_completion___block_invoke_2;
  v29[3] = &unk_1E56F07E8;
  id v30 = v23;
  id v28 = v23;
  objc_msgSend(v27, "updateRegionWithIdentifier:localizedName:boundingRegion:mapsIdentifier:providerIdentifier:completion:", v25, v24, a5, a6, v29, v17, v16, v15, v14);
}

uint64_t __120__PKSearchService_updateRegionWithIdentifier_localizedName_boundingRegion_mapsIdentifier_providerIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __120__PKSearchService_updateRegionWithIdentifier_localizedName_boundingRegion_mapsIdentifier_providerIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)searchDidReceivePartialResults:(id)a3 forIdentifier:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = PKSearchDetailedLoggingEnabledInWallet();
  double v9 = PKLogFacilityTypeGetObject(0x12uLL);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (!v10) {
      goto LABEL_7;
    }
    *(_DWORD *)v35 = 138412546;
    *(void *)&v35[4] = v7;
    *(_WORD *)&v35[12] = 2112;
    *(void *)&v35[14] = v6;
    double v11 = "searchDidReceivePartialResults identifier: %@, results: %@";
    uint64_t v12 = v9;
    uint32_t v13 = 22;
  }
  else
  {
    if (!v10) {
      goto LABEL_7;
    }
    *(_DWORD *)v35 = 138412290;
    *(void *)&v35[4] = v7;
    double v11 = "searchDidReceivePartialResults identifier: %@";
    uint64_t v12 = v9;
    uint32_t v13 = 12;
  }
  _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, v11, v35, v13);
LABEL_7:

  p_lockResults = &self->_lockResults;
  os_unfair_lock_lock(&self->_lockResults);
  uint64_t v15 = [(NSMutableDictionary *)self->_results objectForKey:v7];
  if (v15)
  {
    id v16 = (id)v15;
    double v17 = [v6 categoryResults];

    if (v17)
    {
      id v18 = [v6 categoryResults];
      [v16 setCategoryResults:v18];
    }
    uint64_t v19 = objc_msgSend(v6, "merchantResults", *(_OWORD *)v35, *(void *)&v35[16], v36);

    if (v19)
    {
      v20 = [v6 merchantResults];
      [v16 setMerchantResults:v20];
    }
    v21 = [v6 transactionResults];

    if (v21)
    {
      id v22 = [v6 transactionResults];
      [v16 setTransactionResults:v22];
    }
    id v23 = [v6 locationResults];

    if (v23)
    {
      id v24 = [v6 locationResults];
      [v16 setLocationResults:v24];
    }
    id v25 = [v6 personResults];

    if (v25)
    {
      v26 = [v6 personResults];
      [v16 setPersonResults:v26];
    }
    v27 = [v6 barcodePassResults];

    if (v27)
    {
      id v28 = [v6 barcodePassResults];
      [v16 setBarcodePassResults:v28];
    }
    v29 = [v6 paymentPassResults];

    if (v29)
    {
      id v30 = [v6 paymentPassResults];
      [v16 setPaymentPassResults:v30];
    }
    v31 = [v6 suggestedAutocompleteTokens];

    if (v31)
    {
      id v32 = [v6 suggestedAutocompleteTokens];
      [v16 setSuggestedAutocompleteTokens:v32];
    }
    v33 = [v6 transactionTagResults];

    if (v33)
    {
      v34 = [v6 transactionTagResults];
      [v16 setTransactionTagResults:v34];
    }
  }
  else
  {
    id v16 = v6;
    [(NSMutableDictionary *)self->_results setObject:v16 forKey:v7];
  }
  os_unfair_lock_unlock(p_lockResults);
}

- (void)searchDidCompleteWithError:(id)a3 forIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = PKLogFacilityTypeGetObject(0x12uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "searchDidCompleteWithError %@ identifier: %@", buf, 0x16u);
  }

  if (v7)
  {
    os_unfair_lock_lock(&self->_lockResults);
    double v9 = [(NSMutableDictionary *)self->_results objectForKey:v7];
    [(NSMutableDictionary *)self->_results removeObjectForKey:v7];
    os_unfair_lock_unlock(&self->_lockResults);
  }
  else
  {
    double v9 = 0;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__PKSearchService_searchDidCompleteWithError_forIdentifier___block_invoke;
  v13[3] = &unk_1E56F0810;
  id v14 = v6;
  id v15 = v9;
  id v16 = v7;
  id v10 = v7;
  id v11 = v9;
  id v12 = v6;
  [(PKSearchService *)self _accessObserversWithHandler:v13];
}

void __60__PKSearchService_searchDidCompleteWithError_forIdentifier___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 searchDidCompleteWithError:a1[4] results:a1[5] forIdentifier:a1[6]];
  }
}

- (void)invalidateSearchResults
{
}

void __42__PKSearchService_invalidateSearchResults__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 invalidateSearchResults];
  }
}

- (void)regionsWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__PKSearchService_regionsWithCompletion___block_invoke;
    v12[3] = &unk_1E56D8388;
    id v7 = v5;
    id v13 = v7;
    int v8 = [(PKSearchService *)self errorHandlerForMethod:a2 completion:v12];
    double v9 = [(PKSearchService *)self _remoteObjectProxyWithErrorHandler:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__PKSearchService_regionsWithCompletion___block_invoke_2;
    v10[3] = &unk_1E56E4710;
    id v11 = v7;
    [v9 regionsWithCompletion:v10];
  }
}

uint64_t __41__PKSearchService_regionsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __41__PKSearchService_regionsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetRegionsWithCompletion:(id)a3
{
  id v5 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__PKSearchService_resetRegionsWithCompletion___block_invoke;
  v12[3] = &unk_1E56D8388;
  id v6 = v5;
  id v13 = v6;
  id v7 = [(PKSearchService *)self errorHandlerForMethod:a2 completion:v12];
  int v8 = [(PKSearchService *)self _remoteObjectProxyWithErrorHandler:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__PKSearchService_resetRegionsWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D8360;
  id v11 = v6;
  id v9 = v6;
  [v8 resetRegionsWithCompletion:v10];
}

uint64_t __46__PKSearchService_resetRegionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __46__PKSearchService_resetRegionsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)resetRegionsCoordinatesWithCompletion:(id)a3
{
  id v5 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__PKSearchService_resetRegionsCoordinatesWithCompletion___block_invoke;
  v12[3] = &unk_1E56D8388;
  id v6 = v5;
  id v13 = v6;
  id v7 = [(PKSearchService *)self errorHandlerForMethod:a2 completion:v12];
  int v8 = [(PKSearchService *)self _remoteObjectProxyWithErrorHandler:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__PKSearchService_resetRegionsCoordinatesWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D8360;
  id v11 = v6;
  id v9 = v6;
  [v8 resetRegionsCoordinatesWithCompletion:v10];
}

uint64_t __57__PKSearchService_resetRegionsCoordinatesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __57__PKSearchService_resetRegionsCoordinatesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)transactionsMissingRegionsWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__PKSearchService_transactionsMissingRegionsWithCompletion___block_invoke;
    v12[3] = &unk_1E56D8388;
    id v7 = v5;
    id v13 = v7;
    int v8 = [(PKSearchService *)self errorHandlerForMethod:a2 completion:v12];
    id v9 = [(PKSearchService *)self _remoteObjectProxyWithErrorHandler:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__PKSearchService_transactionsMissingRegionsWithCompletion___block_invoke_2;
    v10[3] = &unk_1E56F0858;
    id v11 = v7;
    [v9 transactionsMissingRegionsWithCompletion:v10];
  }
}

uint64_t __60__PKSearchService_transactionsMissingRegionsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__PKSearchService_transactionsMissingRegionsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)indexedTransactionsWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__PKSearchService_indexedTransactionsWithCompletion___block_invoke;
    v12[3] = &unk_1E56D8388;
    id v7 = v5;
    id v13 = v7;
    int v8 = [(PKSearchService *)self errorHandlerForMethod:a2 completion:v12];
    id v9 = [(PKSearchService *)self _remoteObjectProxyWithErrorHandler:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__PKSearchService_indexedTransactionsWithCompletion___block_invoke_2;
    v10[3] = &unk_1E56D90D8;
    id v11 = v7;
    [v9 indexedTransactionsWithCompletion:v10];
  }
}

uint64_t __53__PKSearchService_indexedTransactionsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __53__PKSearchService_indexedTransactionsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)indexedTransactionWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  int v8 = v7;
  if (v7)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__PKSearchService_indexedTransactionWithIdentifier_completion___block_invoke;
    v15[3] = &unk_1E56D8388;
    id v9 = v7;
    id v16 = v9;
    id v10 = a3;
    id v11 = [(PKSearchService *)self errorHandlerForMethod:a2 completion:v15];
    id v12 = [(PKSearchService *)self _remoteObjectProxyWithErrorHandler:v11];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__PKSearchService_indexedTransactionWithIdentifier_completion___block_invoke_2;
    v13[3] = &unk_1E56F0880;
    id v14 = v9;
    [v12 indexedTransactionWithIdentifier:v10 completion:v13];
  }
}

uint64_t __63__PKSearchService_indexedTransactionWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63__PKSearchService_indexedTransactionWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)indexedPassesWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__PKSearchService_indexedPassesWithCompletion___block_invoke;
    v12[3] = &unk_1E56D8388;
    id v7 = v5;
    id v13 = v7;
    int v8 = [(PKSearchService *)self errorHandlerForMethod:a2 completion:v12];
    id v9 = [(PKSearchService *)self _remoteObjectProxyWithErrorHandler:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__PKSearchService_indexedPassesWithCompletion___block_invoke_2;
    v10[3] = &unk_1E56D90D8;
    id v11 = v7;
    [v9 indexedPassesWithCompletion:v10];
  }
}

uint64_t __47__PKSearchService_indexedPassesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __47__PKSearchService_indexedPassesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

@end