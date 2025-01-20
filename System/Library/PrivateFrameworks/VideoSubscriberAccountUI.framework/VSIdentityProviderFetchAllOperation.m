@interface VSIdentityProviderFetchAllOperation
- (NSArray)applicationAccountProviders;
- (NSOperationQueue)subqueue;
- (VSAuditToken)auditToken;
- (VSDevice)currentDevice;
- (VSIdentityProviderFetchAllOperation)init;
- (VSOptional)result;
- (void)executionDidBegin;
- (void)setApplicationAccountProviders:(id)a3;
- (void)setAuditToken:(id)a3;
- (void)setCurrentDevice:(id)a3;
- (void)setResult:(id)a3;
- (void)setSubqueue:(id)a3;
@end

@implementation VSIdentityProviderFetchAllOperation

- (VSIdentityProviderFetchAllOperation)init
{
  v10.receiver = self;
  v10.super_class = (Class)VSIdentityProviderFetchAllOperation;
  v2 = [(VSIdentityProviderFetchAllOperation *)&v10 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    subqueue = v2->_subqueue;
    v2->_subqueue = v3;

    [(NSOperationQueue *)v2->_subqueue setName:@"VSIdentityProviderFetchAllOperation"];
    v5 = (VSOptional *)objc_alloc_init(MEMORY[0x263F1E250]);
    v6 = v2->_result;
    v2->_result = v5;

    v7 = (VSDevice *)objc_alloc_init(MEMORY[0x263F1E1F0]);
    currentDevice = v2->_currentDevice;
    v2->_currentDevice = v7;
  }
  return v2;
}

- (void)executionDidBegin
{
  id v3 = objc_alloc_init(MEMORY[0x263F1E1E0]);
  v4 = objc_alloc_init(VSIdentityProviderFetchAllFromStoreOperation);
  v5 = [(VSIdentityProviderFetchAllOperation *)self auditToken];
  [(VSIdentityProviderFetchAllFromStoreOperation *)v4 setAuditToken:v5];

  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x263F086D0];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke;
  v11[3] = &unk_265076CD0;
  v7 = v4;
  v12 = v7;
  objc_copyWeak(&v15, &location);
  id v8 = v3;
  id v13 = v8;
  v14 = self;
  v9 = [v6 blockOperationWithBlock:v11];
  [v9 addDependency:v8];
  [v9 addDependency:v7];
  objc_super v10 = [(VSIdentityProviderFetchAllOperation *)self subqueue];
  [v10 addOperation:v7];
  [v10 addOperation:v8];
  [v10 addOperation:v9];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke(id *a1)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = [a1[4] result];
  v4 = [v3 forceUnwrapObject];
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_2;
  v54[3] = &unk_265076C30;
  v25 = &v56;
  objc_copyWeak(&v56, a1 + 7);
  id v5 = v2;
  id v55 = v5;
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_3;
  v52[3] = &unk_265076C58;
  v26 = &v53;
  objc_copyWeak(&v53, a1 + 7);
  [v4 unwrapObject:v54 error:v52];

  v6 = [a1[5] result];
  v7 = [v6 forceUnwrapObject];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_10;
  v49[3] = &unk_265076C30;
  id location = &v51;
  objc_copyWeak(&v51, a1 + 7);
  id v28 = v5;
  id v50 = v28;
  [v7 unwrapObject:v49 error:&__block_literal_global_1];

  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__0;
  v47 = __Block_byref_object_dispose__0;
  id v48 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__0;
  v41 = __Block_byref_object_dispose__0;
  id v42 = 0;
  id v8 = objc_alloc_init(MEMORY[0x263F1E290]);
  v9 = [a1[6] currentDevice];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_30;
  v33[3] = &unk_265076CA8;
  v35 = &v43;
  v36 = &v37;
  id v10 = v8;
  id v34 = v10;
  [v9 fetchSetTopBoxProfileWithCompletion:v33];

  [v10 wait];
  if (v44[5])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v11 = v28;
    uint64_t v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v61, 16, &v56, &v53, &v51);
    if (v12)
    {
      uint64_t v13 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if (([v15 isApplication] & 1) == 0)
          {
            v16 = [v15 uniqueID];
            v17 = [v16 forceUnwrapObject];
            int v18 = [v17 isEqualToString:v44[5]];

            if (v18)
            {
              v19 = VSDefaultLogObject();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                v20 = [v15 uniqueID];
                *(_DWORD *)buf = 138412546;
                v58 = v20;
                __int16 v59 = 2048;
                uint64_t v60 = -10;
                _os_log_impl(&dword_23F9AB000, v19, OS_LOG_TYPE_DEFAULT, "Identity provider with ID %@ is STB vendor, setting rank override %ld", buf, 0x16u);
              }
              [v15 setRankForSorting:&unk_26F37E5D8];
              if ([(id)v38[5] length]) {
                [v15 setUserToken:v38[5]];
              }
              v21 = VSDefaultLogObject();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                v22 = [v15 providerID];
                *(_DWORD *)buf = 138412290;
                v58 = v22;
                _os_log_impl(&dword_23F9AB000, v21, OS_LOG_TYPE_DEFAULT, "VSIdentityProviderFetchAllOperation: Found STB provider %@", buf, 0xCu);
              }
              goto LABEL_19;
            }
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v61 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_19:
  }
  v23 = VSDefaultLogObject();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
    *(_DWORD *)buf = 138412290;
    v58 = v24;
    _os_log_impl(&dword_23F9AB000, v23, OS_LOG_TYPE_DEFAULT, "Will finish with %@ providers", buf, 0xCu);
  }
  [a1[6] finishExecutionIfPossible];

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  objc_destroyWeak(location);
  objc_destroyWeak(v26);

  objc_destroyWeak(v25);
}

void __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [*(id *)(a1 + 32) addObjectsFromArray:v4];

  id v5 = (void *)MEMORY[0x263F1E250];
  v6 = [MEMORY[0x263F1E208] failableWithObject:*(void *)(a1 + 32)];
  v7 = [v5 optionalWithObject:v6];
  [WeakRetained setResult:v7];
}

void __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_3_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v12 = (void *)MEMORY[0x263F1E250];
  uint64_t v13 = [MEMORY[0x263F1E208] failableWithError:v3];
  v14 = [v12 optionalWithObject:v13];
  [WeakRetained setResult:v14];
}

void __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_10(uint64_t a1, void *a2)
{
  *(void *)((char *)&v113[2] + 4) = *MEMORY[0x263EF8340];
  id v67 = a2;
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "count"));
    *(_DWORD *)buf = 138412290;
    v113[0] = v4;
    _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Did obtain %@ developer providers", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = [WeakRetained applicationAccountProviders];
  id v64 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v60 = WeakRetained;
  uint64_t v7 = [WeakRetained applicationAccountProviders];

  uint64_t v61 = a1;
  __int16 v59 = v6;
  if (v7)
  {
    if (!v6) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The applicationProvidersOrNil parameter must not be nil."];
    }
    id v8 = v6;
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    obuint64_t j = v8;
    uint64_t v70 = [obj countByEnumeratingWithState:&v99 objects:v111 count:16];
    if (v70)
    {
      uint64_t v68 = *(void *)v100;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v100 != v68) {
            objc_enumerationMutation(obj);
          }
          uint64_t v71 = v10;
          id v11 = *(void **)(*((void *)&v99 + 1) + 8 * v10);
          long long v95 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          id v12 = v67;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v95 objects:v110 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v96;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v96 != v15) {
                  objc_enumerationMutation(v12);
                }
                v17 = *(void **)(*((void *)&v95 + 1) + 8 * i);
                int v18 = [v11 identifier];
                v19 = [v17 providerID];
                v20 = [v19 forceUnwrapObject];
                int v21 = [v18 isEqualToString:v20];

                if (v21)
                {
                  v22 = VSErrorLogObject();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
                    __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_10_cold_1(buf, v11, v113, v22);
                  }

                  [v9 addObject:v11];
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v95 objects:v110 count:16];
            }
            while (v14);
          }

          uint64_t v10 = v71 + 1;
        }
        while (v71 + 1 != v70);
        uint64_t v70 = [obj countByEnumeratingWithState:&v99 objects:v111 count:16];
      }
      while (v70);
    }

    v23 = (void *)[obj mutableCopy];
    [v23 removeObjectsInArray:v9];

    id v64 = v23;
    a1 = v61;
  }
  id v72 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v73 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v62 = *(id *)(a1 + 32);
  id obja = (id)[v62 countByEnumeratingWithState:&v91 objects:v109 count:16];
  if (obja)
  {
    uint64_t v63 = *(void *)v92;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v92 != v63) {
          objc_enumerationMutation(v62);
        }
        uint64_t v69 = v24;
        v25 = *(void **)(*((void *)&v91 + 1) + 8 * v24);
        v26 = [v25 providerID];
        v27 = [v26 forceUnwrapObject];

        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        id v28 = v67;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v87 objects:v108 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v88;
          do
          {
            for (uint64_t j = 0; j != v30; ++j)
            {
              if (*(void *)v88 != v31) {
                objc_enumerationMutation(v28);
              }
              v33 = *(void **)(*((void *)&v87 + 1) + 8 * j);
              id v34 = [v33 providerID];
              v83[0] = MEMORY[0x263EF8330];
              v83[1] = 3221225472;
              v83[2] = __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_16;
              v83[3] = &unk_265076C80;
              id v84 = v27;
              id v85 = v73;
              v86 = v25;
              v82[0] = MEMORY[0x263EF8330];
              v82[1] = 3221225472;
              v82[2] = __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_18;
              v82[3] = &unk_265076A18;
              v82[4] = v33;
              [v34 conditionallyUnwrapObject:v83 otherwise:v82];
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v87 objects:v108 count:16];
          }
          while (v30);
        }

        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v35 = v64;
        uint64_t v36 = [v35 countByEnumeratingWithState:&v78 objects:v107 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v79;
          do
          {
            for (uint64_t k = 0; k != v37; ++k)
            {
              if (*(void *)v79 != v38) {
                objc_enumerationMutation(v35);
              }
              v40 = *(void **)(*((void *)&v78 + 1) + 8 * k);
              v41 = [v40 identifier];
              int v42 = [v27 isEqualToString:v41];

              if (v42)
              {
                uint64_t v43 = VSErrorLogObject();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v105 = 138412290;
                  uint64_t v106 = (uint64_t)v27;
                  _os_log_error_impl(&dword_23F9AB000, v43, OS_LOG_TYPE_ERROR, "Application Provider %@ conflicts with production provider.  Using production provider instead.", v105, 0xCu);
                }

                [v72 addObject:v40];
              }
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v78 objects:v107 count:16];
          }
          while (v37);
        }

        uint64_t v24 = v69 + 1;
      }
      while ((id)(v69 + 1) != obja);
      id obja = (id)[v62 countByEnumeratingWithState:&v91 objects:v109 count:16];
    }
    while (obja);
  }

  v44 = (void *)[v64 mutableCopy];
  [v44 removeObjectsInArray:v72];
  [*(id *)(v61 + 32) removeObjectsInArray:v73];
  [*(id *)(v61 + 32) addObjectsFromArray:v67];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v45 = (id)[v44 copy];
  uint64_t v46 = [v45 countByEnumeratingWithState:&v74 objects:v104 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v75;
    do
    {
      for (uint64_t m = 0; m != v47; ++m)
      {
        if (*(void *)v75 != v48) {
          objc_enumerationMutation(v45);
        }
        id v50 = (void *)[objc_alloc(MEMORY[0x263F1E218]) initWithApplicationProvider:*(void *)(*((void *)&v74 + 1) + 8 * m)];
        [*(id *)(v61 + 32) addObject:v50];
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v74 objects:v104 count:16];
    }
    while (v47);
  }

  id v51 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"nameForSorting" ascending:1 selector:sel_localizedCaseInsensitiveCompare_];
  v52 = *(void **)(v61 + 32);
  v103 = v51;
  id v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v103 count:1];
  [v52 sortUsingDescriptors:v53];

  v54 = VSDefaultLogObject();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v55 = [*(id *)(v61 + 32) count];
    *(_DWORD *)v105 = 134217984;
    uint64_t v106 = v55;
    _os_log_impl(&dword_23F9AB000, v54, OS_LOG_TYPE_DEFAULT, "Obtained %ld all providers", v105, 0xCu);
  }

  id v56 = (void *)MEMORY[0x263F1E250];
  v57 = [MEMORY[0x263F1E208] failableWithObject:*(void *)(v61 + 32)];
  v58 = [v56 optionalWithObject:v57];
  [v60 setResult:v58];
}

uint64_t __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_16(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) isEqualToString:a2];
  if (result)
  {
    id v4 = VSDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Dev provider conflicts with store", v5, 2u);
    }

    return [*(id *)(a1 + 40) addObject:*(void *)(a1 + 48)];
  }
  return result;
}

void __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_18(uint64_t a1)
{
  id v2 = VSErrorLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_18_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

void __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_28(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_28_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

uint64_t __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_30(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 providerID];
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = [v3 userToken];

  uint64_t v8 = *(void *)(a1[6] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = (void *)a1[4];
  return [v10 signal];
}

- (VSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
}

- (NSArray)applicationAccountProviders
{
  return self->_applicationAccountProviders;
}

- (void)setApplicationAccountProviders:(id)a3
{
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSOperationQueue)subqueue
{
  return self->_subqueue;
}

- (void)setSubqueue:(id)a3
{
}

- (VSDevice)currentDevice
{
  return self->_currentDevice;
}

- (void)setCurrentDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDevice, 0);
  objc_storeStrong((id *)&self->_subqueue, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_applicationAccountProviders, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
}

void __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_10_cold_1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 identifier];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_23F9AB000, a4, OS_LOG_TYPE_ERROR, "Application Provider %@ conflicts with developer-added provider.  Using developer provider instead.", a1, 0xCu);
}

void __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_18_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_28_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end