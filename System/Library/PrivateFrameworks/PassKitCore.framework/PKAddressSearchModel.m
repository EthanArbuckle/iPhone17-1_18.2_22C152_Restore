@interface PKAddressSearchModel
- (CLGeocoder)geocoder;
- (CLLocationManager)locationManager;
- (CNContactStore)contactStore;
- (MKLocalSearch)localSearch;
- (MKLocalSearchCompleter)completer;
- (NSArray)completionSearchResults;
- (NSArray)contactsSearchResults;
- (NSArray)recentsSearchResults;
- (OS_dispatch_queue)resultsQueue;
- (PKAddressSearchModel)init;
- (PKAddressSearchModelDelegate)delegate;
- (void)beginSearch:(id)a3;
- (void)completerDidUpdateResults:(id)a3;
- (void)endSearch;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)selectMapSearchCompletion:(id)a3;
- (void)setCompleter:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGeocoder:(id)a3;
- (void)setLocalSearch:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setResultsQueue:(id)a3;
@end

@implementation PKAddressSearchModel

- (PKAddressSearchModel)init
{
  v13.receiver = self;
  v13.super_class = (Class)PKAddressSearchModel;
  v2 = [(PKAddressSearchModel *)&v13 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.passkit.address.search", 0);
    resultsQueue = v2->_resultsQueue;
    v2->_resultsQueue = (OS_dispatch_queue *)v3;

    v5 = (MKLocalSearchCompleter *)objc_alloc_init((Class)getMKLocalSearchCompleterClass[0]());
    completer = v2->_completer;
    v2->_completer = v5;

    [(MKLocalSearchCompleter *)v2->_completer setDelegate:v2];
    [(MKLocalSearchCompleter *)v2->_completer setEntriesType:0];
    id v7 = objc_alloc(MEMORY[0x1E4F1E600]);
    v8 = PKPassKitCoreBundle();
    v9 = [v8 bundlePath];
    uint64_t v10 = [v7 initWithEffectiveBundlePath:v9 delegate:v2 onQueue:MEMORY[0x1E4F14428]];
    locationManager = v2->_locationManager;
    v2->_locationManager = (CLLocationManager *)v10;

    [(CLLocationManager *)v2->_locationManager setDesiredAccuracy:*MEMORY[0x1E4F1E748]];
    [(CLLocationManager *)v2->_locationManager startUpdatingLocation];
  }
  return v2;
}

- (void)beginSearch:(id)a3
{
  id v4 = a3;
  completer = self->_completer;
  v6 = [v4 fragment];
  [(MKLocalSearchCompleter *)completer setFragment:v6];

  if (!self->_contactStore)
  {
    id v7 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E4F1B980]);
    contactStore = self->_contactStore;
    self->_contactStore = v7;
  }
  id v9 = objc_alloc(MEMORY[0x1E4F1B908]);
  uint64_t v10 = [v4 keysToFetch];
  v11 = (void *)[v9 initWithKeysToFetch:v10];

  v12 = [v4 predicate];
  [v11 setPredicate:v12];

  objc_super v13 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__PKAddressSearchModel_beginSearch___block_invoke;
  block[3] = &unk_1E56D8AB8;
  block[4] = self;
  id v18 = v11;
  id v19 = v4;
  id v14 = v4;
  id v15 = v11;
  dispatch_async(v13, block);

  v16 = [v14 fragment];
  [(PKAddressSearchModel *)self _updateRecents:v16];
}

void __36__PKAddressSearchModel_beginSearch___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 72);
  id v17 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __36__PKAddressSearchModel_beginSearch___block_invoke_2;
  v14[3] = &unk_1E56E8918;
  id v15 = *(id *)(a1 + 48);
  id v5 = v2;
  id v16 = v5;
  LODWORD(v4) = [v4 enumerateContactsAndMatchInfoWithFetchRequest:v3 error:&v17 usingBlock:v14];
  id v6 = v17;
  if (v4)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 80);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__PKAddressSearchModel_beginSearch___block_invoke_3;
    block[3] = &unk_1E56D8A90;
    block[4] = v7;
    id v13 = v5;
    dispatch_sync(v8, block);
    id v9 = [*(id *)(a1 + 32) delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      v11 = [*(id *)(a1 + 32) delegate];
      [v11 contactsSearchUpdated:*(void *)(a1 + 32)];
    }
  }
}

void __36__PKAddressSearchModel_beginSearch___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) contactFilter];
  uint64_t v7 = (void *)v6;
  if (!v6 || (*(unsigned int (**)(uint64_t, id))(v6 + 16))(v6, v19))
  {
    v8 = [v5 matchedProperties];
    id v9 = [*(id *)(a1 + 32) outputKey];
    char v10 = [v8 objectForKey:v9];

    if (([v5 matchedNameProperty] & 1) == 0)
    {
      v11 = [v5 matchedProperties];
      v12 = [v11 objectForKey:*MEMORY[0x1E4F1AED8]];
      if (v12)
      {
      }
      else
      {
        uint64_t v13 = [*(id *)(a1 + 32) type];

        if (v13 != 1)
        {
          if (![v10 count]) {
            goto LABEL_9;
          }
          id v17 = *(void **)(a1 + 40);
          id v15 = [*(id *)(a1 + 32) outputKey];
          id v16 = [v10 firstObject];
          id v18 = [v19 pkDeconstructContactUsingKey:v15 substring:v16];
          [v17 addObjectsFromArray:v18];

LABEL_8:
LABEL_9:

          goto LABEL_10;
        }
      }
    }
    id v14 = *(void **)(a1 + 40);
    id v15 = [*(id *)(a1 + 32) outputKey];
    id v16 = [v19 pkDeconstructContactUsingKey:v15];
    [v14 addObjectsFromArray:v16];
    goto LABEL_8;
  }
LABEL_10:
}

void __36__PKAddressSearchModel_beginSearch___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;
}

- (void)selectMapSearchCompletion:(id)a3
{
  id v4 = a3;
  localSearch = self->_localSearch;
  if (localSearch)
  {
    [(MKLocalSearch *)localSearch cancel];
    uint64_t v6 = self->_localSearch;
    self->_localSearch = 0;
  }
  uint64_t v7 = (void *)[objc_alloc(_MergedGlobals_176()) initWithCompletion:v4];
  v8 = (MKLocalSearch *)[objc_alloc((Class)off_1EB402458()) initWithRequest:v7];
  id v9 = self->_localSearch;
  self->_localSearch = v8;

  char v10 = self->_localSearch;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__PKAddressSearchModel_selectMapSearchCompletion___block_invoke;
  v11[3] = &unk_1E56E8940;
  v11[4] = self;
  [(MKLocalSearch *)v10 startWithCompletionHandler:v11];
}

void __50__PKAddressSearchModel_selectMapSearchCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 mapItems];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    id v25 = v6;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    char v10 = [v5 mapItems];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = [*(id *)(*((void *)&v26 + 1) + 8 * v14) _placeCardContact];
          id v16 = (void *)[v15 mutableCopy];

          [v16 setGivenName:&stru_1EE0F5368];
          [v16 setFamilyName:&stru_1EE0F5368];
          id v17 = (void *)[v16 copy];
          [v9 addObject:v17];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v12);
    }

    id v18 = [*(id *)(a1 + 32) delegate];
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      v20 = [*(id *)(a1 + 32) delegate];
      v21 = [v9 firstObject];
      [v20 selectedAddress:v21 withError:0];
    }
    id v6 = v25;
  }
  else
  {
    v22 = [*(id *)(a1 + 32) delegate];
    uint64_t v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      v24 = [*(id *)(a1 + 32) delegate];
      [v24 selectedAddress:0 withError:v6];
    }
  }
}

- (void)endSearch
{
  [(MKLocalSearchCompleter *)self->_completer cancel];
  [(MKLocalSearch *)self->_localSearch cancel];
  localSearch = self->_localSearch;
  self->_localSearch = 0;
}

- (NSArray)contactsSearchResults
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__34;
  char v10 = __Block_byref_object_dispose__34;
  id v11 = 0;
  resultsQueue = self->_resultsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PKAddressSearchModel_contactsSearchResults__block_invoke;
  v5[3] = &unk_1E56DC5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resultsQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __45__PKAddressSearchModel_contactsSearchResults__block_invoke(uint64_t a1)
{
}

- (NSArray)completionSearchResults
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__34;
  char v10 = __Block_byref_object_dispose__34;
  id v11 = 0;
  resultsQueue = self->_resultsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__PKAddressSearchModel_completionSearchResults__block_invoke;
  v5[3] = &unk_1E56DC5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resultsQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __47__PKAddressSearchModel_completionSearchResults__block_invoke(uint64_t a1)
{
}

- (void)completerDidUpdateResults:(id)a3
{
  id v4 = a3;
  if ([v4 resultsAreCurrent])
  {
    resultsQueue = self->_resultsQueue;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __50__PKAddressSearchModel_completerDidUpdateResults___block_invoke;
    uint64_t v12 = &unk_1E56D8A90;
    uint64_t v13 = self;
    id v14 = v4;
    dispatch_sync(resultsQueue, &v9);
    uint64_t v6 = [(PKAddressSearchModel *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      uint64_t v8 = [(PKAddressSearchModel *)self delegate];
      [v8 mapSearchUpdated:self];
    }
  }
}

void __50__PKAddressSearchModel_completerDidUpdateResults___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 40) results];
  uint64_t v2 = objc_msgSend(v5, "pk_objectsPassingTest:", &__block_literal_global_107);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;
}

BOOL __50__PKAddressSearchModel_completerDidUpdateResults___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _type] == 2;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Obtained location for address search model", v11, 2u);
  }

  uint64_t v9 = [v7 lastObject];
  [(MKLocalSearchCompleter *)self->_completer setDeviceLocation:v9];
  [v9 horizontalAccuracy];
  if (v10 > *MEMORY[0x1E4F1E748]) {
    [v6 stopUpdatingLocation];
  }
}

- (NSArray)recentsSearchResults
{
  return self->_recentsSearchResults;
}

- (PKAddressSearchModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKAddressSearchModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (MKLocalSearchCompleter)completer
{
  return self->_completer;
}

- (void)setCompleter:(id)a3
{
}

- (CLGeocoder)geocoder
{
  return self->_geocoder;
}

- (void)setGeocoder:(id)a3
{
}

- (MKLocalSearch)localSearch
{
  return self->_localSearch;
}

- (void)setLocalSearch:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (OS_dispatch_queue)resultsQueue
{
  return self->_resultsQueue;
}

- (void)setResultsQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsQueue, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_localSearch, 0);
  objc_storeStrong((id *)&self->_geocoder, 0);
  objc_storeStrong((id *)&self->_completer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recentsSearchResults, 0);
  objc_storeStrong((id *)&self->_completionSearchResults, 0);
  objc_storeStrong((id *)&self->_contactsSearchResults, 0);
}

@end