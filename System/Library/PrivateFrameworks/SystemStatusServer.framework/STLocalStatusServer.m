@interface STLocalStatusServer
- (BSIntegerSet)publishedDomains;
- (NSString)description;
- (STLocalStatusServer)init;
- (STLocalStatusServerDelegate)delegate;
- (id)_internalQueue_dataForClient:(uint64_t)a3 domain:(void *)a4 presentationData:;
- (id)_internalQueue_dataForDomain:(uint64_t)a1;
- (id)_internalQueue_fallbackDataForPublisherClient:(uint64_t)a3 domain:;
- (id)_internalQueue_presentationDataForDomain:(uint64_t)a1;
- (id)_internalQueue_publishedDomains;
- (id)_internalQueue_volatileDataForDomain:(uint64_t)a1;
- (id)dataForDomain:(unint64_t)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)publishedDataForDomain:(unint64_t)a3;
- (id)publishedVolatileDataForDomain:(unint64_t)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_internalQueue_mutateDataForDomain:(void *)a3 withChangeContext:(void *)a4 block:;
- (void)_internalQueue_publishData:(void *)a3 forPublisherClient:(uint64_t)a4 domain:(void *)a5 inDataChangeRecord:(void *)a6 withChangeContext:(void *)a7 completion:;
- (void)_internalQueue_replaceDataChangeRecord:(void *)a3 forPublisherClient:(void *)a4 inDataChangeRecord:(void *)a5 applyBlock:(void *)a6 completion:;
- (void)addClientDataTransformerProvider:(id)a3 forDomain:(unint64_t)a4;
- (void)addDataTransformer:(id)a3 forDomain:(unint64_t)a4;
- (void)modifyClientDataTransformerProvider:(id)a3 forDomain:(unint64_t)a4 usingBlock:(id)a5;
- (void)modifyDataTransformer:(id)a3 forDomain:(unint64_t)a4 usingBlock:(id)a5;
- (void)publishData:(id)a3 forPublisherClient:(id)a4 domain:(unint64_t)a5 withChangeContext:(id)a6 completion:(id)a7;
- (void)publishVolatileData:(id)a3 forPublisherClient:(id)a4 domain:(unint64_t)a5 withChangeContext:(id)a6 completion:(id)a7;
- (void)registerClient:(id)a3 forDomain:(unint64_t)a4;
- (void)registerPublisherClient:(id)a3 forDomain:(unint64_t)a4 fallbackData:(id)a5;
- (void)removeClient:(id)a3 forDomain:(unint64_t)a4;
- (void)removeClientDataTransformerProvider:(id)a3 forDomain:(unint64_t)a4;
- (void)removeDataTransformer:(id)a3 forDomain:(unint64_t)a4;
- (void)removePublisherClient:(id)a3 forDomain:(unint64_t)a4;
- (void)replaceDataChangeRecord:(id)a3 forPublisherClient:(id)a4 completion:(id)a5;
- (void)replaceVolatileDataChangeRecord:(id)a3 forPublisherClient:(id)a4 completion:(id)a5;
- (void)reportUserInteraction:(id)a3 forClient:(id)a4 domain:(unint64_t)a5;
- (void)setDelegate:(id)a3;
- (void)updateDataForPublisherClient:(id)a3 domain:(unint64_t)a4 usingDiffProvider:(id)a5 completion:(id)a6;
- (void)updateVolatileDataForPublisherClient:(id)a3 domain:(unint64_t)a4 usingDiffProvider:(id)a5 completion:(id)a6;
@end

@implementation STLocalStatusServer

id __82__STLocalStatusServer__internalQueue_mutateDataForDomain_withChangeContext_block___block_invoke_2(uint64_t a1, void *a2)
{
  return -[STLocalStatusServer _internalQueue_dataForClient:domain:presentationData:](*(void *)(a1 + 32), a2, *(void *)(a1 + 48), *(void **)(a1 + 40));
}

id __82__STLocalStatusServer__internalQueue_mutateDataForDomain_withChangeContext_block___block_invoke(uint64_t a1, void *a2)
{
  return -[STLocalStatusServer _internalQueue_dataForClient:domain:presentationData:](*(void *)(a1 + 32), a2, *(void *)(a1 + 48), *(void **)(a1 + 40));
}

void __82__STLocalStatusServer__internalQueue_mutateDataForDomain_withChangeContext_block___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    unint64_t v2 = 0;
    do
    {
      v3 = [*(id *)(a1 + 32) objectAtIndex:v2];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {

        v3 = 0;
      }
      v4 = [*(id *)(a1 + 40) objectAtIndex:v2];
      [v4 observeData:v3 forDomain:*(void *)(a1 + 64) withChangeContext:*(void *)(a1 + 48)];

      ++v2;
    }
    while (v2 < *(void *)(a1 + 56));
  }
}

void __96__STLocalStatusServer_updateVolatileDataForPublisherClient_domain_usingDiffProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    unint64_t v2 = (void *)v2[3];
  }
  uint64_t v3 = *(void *)(a1 + 64);
  v4 = v2;
  v5 = [v4 objectForKey:v3];
  int v6 = [v5 containsObject:*(void *)(a1 + 40)];

  if (v6)
  {
    v7 = -[STLocalStatusServer _internalQueue_volatileDataForDomain:](*(void *)(a1 + 32), *(void *)(a1 + 64));
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      -[STLocalStatusServer _internalQueue_fallbackDataForPublisherClient:domain:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void *)(a1 + 64));
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v13 = v9;

    v31 = v13;
    v14 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v15 = 0;
    uint64_t v17 = *(void *)(a1 + 32);
    v16 = *(void **)(a1 + 40);
    if (v17) {
      v18 = *(void **)(v17 + 40);
    }
    else {
      v18 = 0;
    }
    uint64_t v19 = *(void *)(a1 + 64);
    id v20 = v18;
    v21 = [v20 recordForKey:@"volatileData"];
    v22 = *(void **)(a1 + 56);
    id v23 = v14;
    id v24 = v16;
    id v25 = v21;
    id v26 = v15;
    v27 = v22;
    if (v17)
    {
      if ([v23 isEmpty])
      {
        if (v27) {
          v27[2](v27);
        }
      }
      else
      {
        id v28 = *(id *)(v17 + 32);
        v29 = [v28 objectForKey:v24];

        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v33 = __124__STLocalStatusServer__internalQueue_publishDiff_forPublisherClient_domain_inDataChangeRecord_withChangeContext_completion___block_invoke;
        v34 = &unk_1E6AD20E8;
        id v35 = v25;
        id v36 = v23;
        id v37 = v29;
        uint64_t v38 = v19;
        id v30 = v29;
        -[STLocalStatusServer _internalQueue_mutateDataForDomain:withChangeContext:block:](v17, v19, v26, &buf);
        if (v27) {
          v27[2](v27);
        }
      }
    }
  }
  else
  {
    v10 = STSystemStatusLogServer();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = STSystemStatusDescriptionForDomain();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1D8320000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring volatile diff from unknown publisher for %{public}@ domain", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v12 = *(void *)(a1 + 56);
    if (v12) {
      (*(void (**)(void))(v12 + 16))();
    }
  }
}

- (void)updateVolatileDataForPublisherClient:(id)a3 domain:(unint64_t)a4 usingDiffProvider:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__STLocalStatusServer_updateVolatileDataForPublisherClient_domain_usingDiffProvider_completion___block_invoke;
  block[3] = &unk_1E6AD21D0;
  id v20 = v12;
  unint64_t v21 = a4;
  block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_sync(internalQueue, block);
}

- (id)_internalQueue_volatileDataForDomain:(uint64_t)a1
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
    v4 = [*(id *)(a1 + 40) recordForKey:@"volatileData"];
    v5 = [v4 currentDataForDomain:a2];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_internalQueue_mutateDataForDomain:(void *)a3 withChangeContext:(void *)a4 block:
{
  id v7 = a3;
  v8 = a4;
  id v9 = v8;
  if (a1 && v8)
  {
    id v10 = -[STLocalStatusServer _internalQueue_presentationDataForDomain:](a1, a2);
    id v11 = -[STLocalStatusServer _internalQueue_publishedDomains]((dispatch_queue_t *)a1);
    v40 = [*(id *)(a1 + 16) objectForKey:a2];
    id v12 = [v40 allObjects];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __82__STLocalStatusServer__internalQueue_mutateDataForDomain_withChangeContext_block___block_invoke;
    v58[3] = &unk_1E6AD22E8;
    v58[4] = a1;
    uint64_t v60 = a2;
    id v39 = v10;
    id v59 = v39;
    id v13 = objc_msgSend(v12, "bs_map:", v58);
    v9[2](v9);
    id v14 = -[STLocalStatusServer _internalQueue_presentationDataForDomain:](a1, a2);
    id v15 = (void *)[v14 copyWithZone:0];

    uint64_t v16 = [v12 count];
    if (v16)
    {
      uint64_t v17 = v16;
      v34 = v11;
      id v35 = v9;
      id v36 = v7;
      uint64_t v37 = a2;
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __82__STLocalStatusServer__internalQueue_mutateDataForDomain_withChangeContext_block___block_invoke_2;
      v55[3] = &unk_1E6AD22E8;
      uint64_t v38 = a1;
      v55[4] = a1;
      uint64_t v57 = a2;
      id v56 = v15;
      id v18 = objc_msgSend(v12, "bs_map:", v55);
      id v19 = [MEMORY[0x1E4F1CA48] array];
      id v20 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v21 = 0;
      v33 = v15;
      do
      {
        v22 = objc_msgSend(v13, "objectAtIndex:", v21, v33);
        id v23 = [v18 objectAtIndex:v21];
        if (([v22 isEqual:v23] & 1) == 0)
        {
          id v24 = [v12 objectAtIndex:v21];
          [v19 addObject:v24];

          [v20 addObject:v23];
        }

        ++v21;
      }
      while (v17 != v21);
      uint64_t v25 = [v19 count];
      id v7 = v36;
      if (v25)
      {
        id v26 = *(NSObject **)(v38 + 96);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __82__STLocalStatusServer__internalQueue_mutateDataForDomain_withChangeContext_block___block_invoke_3;
        block[3] = &unk_1E6AD2310;
        uint64_t v53 = v25;
        id v50 = v20;
        id v51 = v19;
        uint64_t v54 = v37;
        id v52 = v36;
        dispatch_async(v26, block);
      }
      id v11 = v34;
      id v9 = v35;
      a2 = v37;
      a1 = v38;
      id v15 = v33;
    }
    v27 = *(NSObject **)(a1 + 96);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __82__STLocalStatusServer__internalQueue_mutateDataForDomain_withChangeContext_block___block_invoke_4;
    v45[3] = &unk_1E6AD2110;
    uint64_t v48 = a2;
    id v28 = v15;
    id v46 = v28;
    id v47 = v7;
    dispatch_async(v27, v45);
    v29 = -[STLocalStatusServer _internalQueue_publishedDomains]((dispatch_queue_t *)a1);
    if (([v11 isEqual:v29] & 1) == 0)
    {
      id v30 = [(id)a1 delegate];
      v31 = v30;
      if (v30)
      {
        v32 = *(NSObject **)(a1 + 96);
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __82__STLocalStatusServer__internalQueue_mutateDataForDomain_withChangeContext_block___block_invoke_150;
        v41[3] = &unk_1E6AD2248;
        id v42 = v30;
        uint64_t v43 = a1;
        id v44 = v29;
        dispatch_async(v32, v41);
      }
    }
  }
}

- (id)_internalQueue_publishedDomains
{
  v1 = (id *)a1;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[11]);
    unint64_t v2 = [v1[5] recordForKey:@"volatileData"];
    uint64_t v3 = [v2 domainsWithSignificantData];
    v1 = (id *)[v3 copy];
  }
  return v1;
}

- (id)_internalQueue_presentationDataForDomain:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
    v4 = [*(id *)(a1 + 40) currentDataForDomain:a2];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = *(void **)(a1 + 64);
    int v6 = (void *)MEMORY[0x1E4F28ED0];
    id v7 = v5;
    v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", a2, 0);
    id v9 = [v7 objectForKey:v8];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        id v14 = v4;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v4 = [*(id *)(*((void *)&v16 + 1) + 8 * v13) transformedDataForData:v14];

          ++v13;
          id v14 = v4;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_internalQueue_dataForClient:(uint64_t)a3 domain:(void *)a4 presentationData:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
    id v9 = v8;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v10 = *(void **)(a1 + 72);
    uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
    id v12 = v10;
    uint64_t v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", a3, 0);
    id v14 = [v12 objectForKey:v13];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        uint64_t v18 = 0;
        long long v19 = v9;
        do
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          id v20 = [*(id *)(*((void *)&v22 + 1) + 8 * v18) dataTransformerForClient:v7];
          id v9 = [v20 transformedDataForData:v19];

          ++v18;
          long long v19 = v9;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v16);
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __124__STLocalStatusServer__internalQueue_publishDiff_forPublisherClient_domain_inDataChangeRecord_withChangeContext_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addDiff:*(void *)(a1 + 40) forClientKey:*(void *)(a1 + 48) domain:*(void *)(a1 + 56)];
}

- (STLocalStatusServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (STLocalStatusServerDelegate *)WeakRetained;
}

void __82__STLocalStatusServer__internalQueue_mutateDataForDomain_withChangeContext_block___block_invoke_4(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (STSystemStatusIsInternalLoggingEnabled())
  {
    unint64_t v2 = STSystemStatusLogServer();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = STSystemStatusDescriptionForDomain();
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 138543874;
      id v7 = v3;
      __int16 v8 = 2114;
      uint64_t v9 = v4;
      __int16 v10 = 2114;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1D8320000, v2, OS_LOG_TYPE_DEFAULT, "Server data changed for %{public}@ domain: %{public}@ -- context: %{public}@", (uint8_t *)&v6, 0x20u);
    }
  }
}

void __88__STLocalStatusServer_updateDataForPublisherClient_domain_usingDiffProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    unint64_t v2 = (void *)v2[3];
  }
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = v2;
  uint64_t v5 = [v4 objectForKey:v3];
  int v6 = [v5 containsObject:*(void *)(a1 + 40)];

  if (v6)
  {
    id v7 = -[STLocalStatusServer _internalQueue_dataForDomain:](*(void *)(a1 + 32), *(void *)(a1 + 64));
    __int16 v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      -[STLocalStatusServer _internalQueue_fallbackDataForPublisherClient:domain:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void *)(a1 + 64));
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v13 = v9;

    uint64_t v14 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v15 = 0;
    uint64_t v16 = (void *)[v13 mutableCopyWithZone:0];
    long long v24 = (void *)v14;
    [v16 applyDiff:v14];
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = (void *)[v16 copyWithZone:0];
    uint64_t v19 = *(void *)(a1 + 64);
    id v20 = *(void **)(a1 + 32);
    uint64_t v21 = *(void **)(a1 + 40);
    if (v20) {
      id v20 = (void *)v20[5];
    }
    long long v22 = v20;
    long long v23 = [v22 recordForKey:@"data"];
    -[STLocalStatusServer _internalQueue_publishData:forPublisherClient:domain:inDataChangeRecord:withChangeContext:completion:](v17, v18, v21, v19, v23, v15, *(void **)(a1 + 56));
  }
  else
  {
    __int16 v10 = STSystemStatusLogServer();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = STSystemStatusDescriptionForDomain();
      *(_DWORD *)long long buf = 138543362;
      id v26 = v11;
      _os_log_impl(&dword_1D8320000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring diff from unknown publisher for %{public}@ domain", buf, 0xCu);
    }
    uint64_t v12 = *(void *)(a1 + 56);
    if (v12) {
      (*(void (**)(void))(v12 + 16))();
    }
  }
}

uint64_t __124__STLocalStatusServer__internalQueue_publishData_forPublisherClient_domain_inDataChangeRecord_withChangeContext_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setData:*(void *)(a1 + 40) forClientKey:*(void *)(a1 + 48) domain:*(void *)(a1 + 56)];
}

- (void)updateDataForPublisherClient:(id)a3 domain:(unint64_t)a4 usingDiffProvider:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__STLocalStatusServer_updateDataForPublisherClient_domain_usingDiffProvider_completion___block_invoke;
  block[3] = &unk_1E6AD21D0;
  id v20 = v12;
  unint64_t v21 = a4;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_sync(internalQueue, block);
}

- (void)_internalQueue_publishData:(void *)a3 forPublisherClient:(uint64_t)a4 domain:(void *)a5 inDataChangeRecord:(void *)a6 withChangeContext:(void *)a7 completion:
{
  unint64_t v13 = a2;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = a7;
  if (a1)
  {
    uint64_t v18 = [v15 currentDataForDomain:a4];
    id v19 = (void *)v18;
    if (v13 | v18 && ([(id)v18 isEqual:v13] & 1) == 0)
    {
      id v20 = *(id *)(a1 + 32);
      unint64_t v21 = [v20 objectForKey:v14];

      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __124__STLocalStatusServer__internalQueue_publishData_forPublisherClient_domain_inDataChangeRecord_withChangeContext_completion___block_invoke;
      v23[3] = &unk_1E6AD20E8;
      id v24 = v15;
      id v25 = (id)v13;
      id v26 = v21;
      uint64_t v27 = a4;
      id v22 = v21;
      -[STLocalStatusServer _internalQueue_mutateDataForDomain:withChangeContext:block:](a1, a4, v16, v23);
      if (v17) {
        v17[2](v17);
      }
    }
    else if (v17)
    {
      v17[2](v17);
    }
  }
}

- (id)_internalQueue_dataForDomain:(uint64_t)a1
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
    uint64_t v4 = [*(id *)(a1 + 40) recordForKey:@"data"];
    uint64_t v5 = [v4 currentDataForDomain:a2];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (STLocalStatusServer)init
{
  v32[2] = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)STLocalStatusServer;
  unint64_t v2 = [(STLocalStatusServer *)&v31 init];
  if (v2)
  {
    uint64_t v3 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
    clientsByDomain = v2->_clientsByDomain;
    v2->_clientsByDomain = v3;

    uint64_t v5 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
    publisherClientsByDomain = v2->_publisherClientsByDomain;
    v2->_publisherClientsByDomain = v5;

    id v7 = (void *)MEMORY[0x1E4F1CAA0];
    v32[0] = @"data";
    v32[1] = @"volatileData";
    __int16 v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    id v9 = [v7 orderedSetWithArray:v8];

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FA9500]) initWithRecordKeys:v9];
    dataChangeLog = v2->_dataChangeLog;
    v2->_dataChangeLog = (STStatusDomainDataChangeLog *)v10;

    uint64_t v12 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    changeLogKeysByPublisherClient = v2->_changeLogKeysByPublisherClient;
    v2->_changeLogKeysByPublisherClient = (NSMapTable *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    dataTransformersByDomain = v2->_dataTransformersByDomain;
    v2->_dataTransformersByDomain = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    clientDataTransformerProvidersByDomain = v2->_clientDataTransformerProvidersByDomain;
    v2->_clientDataTransformerProvidersByDomain = (NSMutableDictionary *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    domainsByChangeLogKey = v2->_domainsByChangeLogKey;
    v2->_domainsByChangeLogKey = (NSMutableDictionary *)v18;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)Serial;

    uint64_t v22 = BSDispatchQueueCreateSerial();
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v22;

    id v24 = [[STStatusDomainXPCClientListener alloc] initWithServerHandle:v2];
    xpcClientListener = v2->_xpcClientListener;
    v2->_xpcClientListener = v24;

    id v26 = [[STStatusDomainPublisherXPCClientListener alloc] initWithServerHandle:v2];
    publisherXPCClientListener = v2->_publisherXPCClientListener;
    v2->_publisherXPCClientListener = v26;

    id v30 = v2;
    id v28 = (id)BSLogAddStateCaptureBlockWithTitle();
  }
  return v2;
}

uint64_t __27__STLocalStatusServer_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) description];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__STLocalStatusServer_setDelegate___block_invoke;
  v7[3] = &unk_1E6AD1EE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

id __35__STLocalStatusServer_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (BSIntegerSet)publishedDomains
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__STLocalStatusServer_publishedDomains__block_invoke;
  v5[3] = &unk_1E6AD2098;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (BSIntegerSet *)v3;
}

uint64_t __39__STLocalStatusServer_publishedDomains__block_invoke(uint64_t a1)
{
  uint64_t v2 = -[STLocalStatusServer _internalQueue_publishedDomains](*(dispatch_queue_t **)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)publishedDataForDomain:(unint64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__STLocalStatusServer_publishedDataForDomain___block_invoke;
  block[3] = &unk_1E6AD20C0;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(internalQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __46__STLocalStatusServer_publishedDataForDomain___block_invoke(uint64_t *a1)
{
  -[STLocalStatusServer _internalQueue_dataForDomain:](a1[4], a1[6]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copyWithZone:0];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)publishedVolatileDataForDomain:(unint64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__STLocalStatusServer_publishedVolatileDataForDomain___block_invoke;
  block[3] = &unk_1E6AD20C0;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(internalQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __54__STLocalStatusServer_publishedVolatileDataForDomain___block_invoke(uint64_t *a1)
{
  -[STLocalStatusServer _internalQueue_volatileDataForDomain:](a1[4], a1[6]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copyWithZone:0];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)registerPublisherClient:(id)a3 forDomain:(unint64_t)a4 fallbackData:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__STLocalStatusServer_registerPublisherClient_forDomain_fallbackData___block_invoke;
  v13[3] = &unk_1E6AD20E8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(internalQueue, v13);
}

void __70__STLocalStatusServer_registerPublisherClient_forDomain_fallbackData___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[3];
  }
  id v15 = v2;
  uint64_t v3 = [v15 objectForKey:a1[7]];
  if (!v3)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
    [v15 setObject:v3 forKey:a1[7]];
  }
  [v3 addObject:a1[5]];
  id v4 = (void *)a1[4];
  if (v4) {
    id v4 = (void *)v4[4];
  }
  id v5 = v4;
  uint64_t v6 = [v5 objectForKey:a1[5]];
  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v6 = [v7 UUIDString];

    [v5 setObject:v6 forKey:a1[5]];
  }
  id v8 = (void *)a1[4];
  if (v8) {
    id v8 = (void *)v8[10];
  }
  id v9 = v8;
  uint64_t v10 = [v9 objectForKey:v6];
  if (!v10)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    [v9 setObject:v10 forKey:v6];
  }
  id v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a1[7]];
  [v10 addObject:v11];

  uint64_t v12 = a1[4];
  if (v12) {
    unint64_t v13 = *(void **)(v12 + 40);
  }
  else {
    unint64_t v13 = 0;
  }
  id v14 = [v13 recordForKey:@"volatileData"];
  [v14 setFallbackData:a1[6] forClientKey:v6 domain:a1[7]];
}

- (void)removePublisherClient:(id)a3 forDomain:(unint64_t)a4
{
  id v6 = a3;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__STLocalStatusServer_removePublisherClient_forDomain___block_invoke;
  block[3] = &unk_1E6AD2110;
  id v10 = v6;
  unint64_t v11 = a4;
  void block[4] = self;
  id v8 = v6;
  dispatch_sync(internalQueue, block);
}

void __55__STLocalStatusServer_removePublisherClient_forDomain___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[3];
  }
  uint64_t v3 = v2;
  id v4 = [v3 objectForKey:a1[6]];
  [v4 removeObject:a1[5]];
  id v5 = (void *)a1[4];
  if (v5) {
    id v5 = (void *)v5[4];
  }
  id v6 = v5;
  uint64_t v7 = [v6 objectForKey:a1[5]];
  id v8 = (void *)a1[4];
  if (v8) {
    id v8 = (void *)v8[5];
  }
  id v9 = v8;
  id v10 = [v9 recordForKey:@"volatileData"];

  uint64_t v11 = a1[4];
  uint64_t v12 = a1[6];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __55__STLocalStatusServer_removePublisherClient_forDomain___block_invoke_2;
  v20[3] = &unk_1E6AD2110;
  id v13 = v10;
  id v21 = v13;
  id v14 = v7;
  uint64_t v15 = a1[6];
  id v22 = v14;
  uint64_t v23 = v15;
  -[STLocalStatusServer _internalQueue_mutateDataForDomain:withChangeContext:block:](v11, v12, 0, v20);
  if (![v4 count]) {
    [v3 removeObjectForKey:a1[6]];
  }
  unint64_t v16 = (void *)a1[4];
  if (v16) {
    unint64_t v16 = (void *)v16[10];
  }
  uint64_t v17 = v16;
  uint64_t v18 = [v17 objectForKey:v14];
  id v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a1[6]];
  [v18 removeObject:v19];

  if (![v18 count])
  {
    [v17 removeObjectForKey:v14];
    [v6 removeObjectForKey:a1[5]];
  }
}

uint64_t __55__STLocalStatusServer_removePublisherClient_forDomain___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAllEntriesForClientKey:*(void *)(a1 + 40) domain:*(void *)(a1 + 48)];
}

- (void)replaceDataChangeRecord:(id)a3 forPublisherClient:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__STLocalStatusServer_replaceDataChangeRecord_forPublisherClient_completion___block_invoke;
  v15[3] = &unk_1E6AD2180;
  id v16 = v8;
  uint64_t v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(internalQueue, v15);
}

void __77__STLocalStatusServer_replaceDataChangeRecord_forPublisherClient_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) domainsWithData];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3) {
    uint64_t v3 = (void *)v3[3];
  }
  id v4 = v3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__STLocalStatusServer_replaceDataChangeRecord_forPublisherClient_completion___block_invoke_2;
  v13[3] = &unk_1E6AD2138;
  id v5 = v4;
  id v14 = v5;
  id v15 = *(id *)(a1 + 48);
  id v16 = &v17;
  [v2 enumerateWithBlock:v13];
  if (*((unsigned char *)v18 + 24))
  {
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      id v8 = *(void **)(v7 + 40);
    }
    else {
      id v8 = 0;
    }
    id v9 = *(void **)(a1 + 32);
    id v10 = *(void **)(a1 + 48);
    id v11 = v8;
    id v12 = [v11 recordForKey:@"data"];
    -[STLocalStatusServer _internalQueue_replaceDataChangeRecord:forPublisherClient:inDataChangeRecord:applyBlock:completion:](v7, v9, v10, v12, &__block_literal_global_137, *(void **)(a1 + 56));
  }
  _Block_object_dispose(&v17, 8);
}

void __77__STLocalStatusServer_replaceDataChangeRecord_forPublisherClient_completion___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = [*(id *)(a1 + 32) objectForKey:a2];
  char v6 = [v5 containsObject:*(void *)(a1 + 40)];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = STSystemStatusLogServer();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = STSystemStatusDescriptionForDomain();
      int v9 = 138543362;
      id v10 = v8;
      _os_log_impl(&dword_1D8320000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring change record from unknown publisher for %{public}@ domain", (uint8_t *)&v9, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }
}

void __77__STLocalStatusServer_replaceDataChangeRecord_forPublisherClient_completion___block_invoke_134(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [a2 currentDataForDomain:a5];
  [v9 setData:v10 forClientKey:v8 domain:a5];
}

- (void)_internalQueue_replaceDataChangeRecord:(void *)a3 forPublisherClient:(void *)a4 inDataChangeRecord:(void *)a5 applyBlock:(void *)a6 completion:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a1)
  {
    id v16 = *(id *)(a1 + 32);
    uint64_t v17 = [v16 objectForKey:v12];

    id v18 = [v11 domainsWithData];
    id v19 = objc_alloc_init(MEMORY[0x1E4F4F790]);
    [v19 unionSet:v18];
    char v20 = [v13 domainsWithData];
    [v19 unionSet:v20];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __122__STLocalStatusServer__internalQueue_replaceDataChangeRecord_forPublisherClient_inDataChangeRecord_applyBlock_completion___block_invoke;
    v23[3] = &unk_1E6AD22C0;
    void v23[4] = a1;
    id v24 = v12;
    id v25 = v13;
    id v26 = v17;
    id v27 = v18;
    id v29 = v14;
    id v28 = v11;
    id v21 = v18;
    id v22 = v17;
    [v19 enumerateWithBlock:v23];
    if (v15) {
      v15[2](v15);
    }
  }
}

- (void)replaceVolatileDataChangeRecord:(id)a3 forPublisherClient:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__STLocalStatusServer_replaceVolatileDataChangeRecord_forPublisherClient_completion___block_invoke;
  v15[3] = &unk_1E6AD2180;
  id v16 = v8;
  uint64_t v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(internalQueue, v15);
}

void __85__STLocalStatusServer_replaceVolatileDataChangeRecord_forPublisherClient_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) domainsWithData];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3) {
    uint64_t v3 = (void *)v3[3];
  }
  id v4 = v3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__STLocalStatusServer_replaceVolatileDataChangeRecord_forPublisherClient_completion___block_invoke_2;
  v13[3] = &unk_1E6AD2138;
  id v5 = v4;
  id v14 = v5;
  id v15 = *(id *)(a1 + 48);
  id v16 = &v17;
  [v2 enumerateWithBlock:v13];
  if (*((unsigned char *)v18 + 24))
  {
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      id v8 = *(void **)(v7 + 40);
    }
    else {
      id v8 = 0;
    }
    id v9 = *(void **)(a1 + 32);
    id v10 = *(void **)(a1 + 48);
    id v11 = v8;
    id v12 = [v11 recordForKey:@"volatileData"];
    -[STLocalStatusServer _internalQueue_replaceDataChangeRecord:forPublisherClient:inDataChangeRecord:applyBlock:completion:](v7, v9, v10, v12, &__block_literal_global_140, *(void **)(a1 + 56));
  }
  _Block_object_dispose(&v17, 8);
}

void __85__STLocalStatusServer_replaceVolatileDataChangeRecord_forPublisherClient_completion___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = [*(id *)(a1 + 32) objectForKey:a2];
  char v6 = [v5 containsObject:*(void *)(a1 + 40)];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = STSystemStatusLogServer();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = STSystemStatusDescriptionForDomain();
      int v9 = 138543362;
      id v10 = v8;
      _os_log_impl(&dword_1D8320000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring volatile change record from unknown publisher for %{public}@ domain", (uint8_t *)&v9, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }
}

uint64_t __85__STLocalStatusServer_replaceVolatileDataChangeRecord_forPublisherClient_completion___block_invoke_138(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return [a3 addEntriesFromDataChangeRecord:a2 forDomain:a5 replacingClientKeysWithKey:a4];
}

- (void)publishData:(id)a3 forPublisherClient:(id)a4 domain:(unint64_t)a5 withChangeContext:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __90__STLocalStatusServer_publishData_forPublisherClient_domain_withChangeContext_completion___block_invoke;
  v21[3] = &unk_1E6AD21A8;
  v21[4] = self;
  id v22 = v13;
  id v23 = v12;
  id v24 = v14;
  id v25 = v15;
  unint64_t v26 = a5;
  id v17 = v15;
  id v18 = v14;
  id v19 = v12;
  id v20 = v13;
  dispatch_async(internalQueue, v21);
}

void __90__STLocalStatusServer_publishData_forPublisherClient_domain_withChangeContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[3];
  }
  uint64_t v3 = *(void *)(a1 + 72);
  id v4 = v2;
  id v5 = [v4 objectForKey:v3];
  int v6 = [v5 containsObject:*(void *)(a1 + 40)];

  if (v6)
  {
    id v8 = *(void **)(a1 + 40);
    uint64_t v7 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 72);
    if (v9) {
      uint64_t v11 = *(void **)(v9 + 40);
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;
    id v16 = [v12 recordForKey:@"data"];
    -[STLocalStatusServer _internalQueue_publishData:forPublisherClient:domain:inDataChangeRecord:withChangeContext:completion:](v9, v7, v8, v10, v16, *(void **)(a1 + 56), *(void **)(a1 + 64));
  }
  else
  {
    id v13 = STSystemStatusLogServer();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = STSystemStatusDescriptionForDomain();
      *(_DWORD *)long long buf = 138543362;
      id v18 = v14;
      _os_log_impl(&dword_1D8320000, v13, OS_LOG_TYPE_DEFAULT, "Ignoring data from unknown publisher for %{public}@ domain", buf, 0xCu);
    }
    uint64_t v15 = *(void *)(a1 + 64);
    if (v15) {
      (*(void (**)(void))(v15 + 16))();
    }
  }
}

- (void)publishVolatileData:(id)a3 forPublisherClient:(id)a4 domain:(unint64_t)a5 withChangeContext:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __98__STLocalStatusServer_publishVolatileData_forPublisherClient_domain_withChangeContext_completion___block_invoke;
  v21[3] = &unk_1E6AD21A8;
  v21[4] = self;
  id v22 = v13;
  id v23 = v12;
  id v24 = v14;
  id v25 = v15;
  unint64_t v26 = a5;
  id v17 = v15;
  id v18 = v14;
  id v19 = v12;
  id v20 = v13;
  dispatch_async(internalQueue, v21);
}

void __98__STLocalStatusServer_publishVolatileData_forPublisherClient_domain_withChangeContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[3];
  }
  uint64_t v3 = *(void *)(a1 + 72);
  id v4 = v2;
  id v5 = [v4 objectForKey:v3];
  int v6 = [v5 containsObject:*(void *)(a1 + 40)];

  if (v6)
  {
    id v8 = *(void **)(a1 + 40);
    uint64_t v7 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 72);
    if (v9) {
      uint64_t v11 = *(void **)(v9 + 40);
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;
    id v16 = [v12 recordForKey:@"volatileData"];
    -[STLocalStatusServer _internalQueue_publishData:forPublisherClient:domain:inDataChangeRecord:withChangeContext:completion:](v9, v7, v8, v10, v16, *(void **)(a1 + 56), *(void **)(a1 + 64));
  }
  else
  {
    id v13 = STSystemStatusLogServer();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = STSystemStatusDescriptionForDomain();
      *(_DWORD *)long long buf = 138543362;
      id v18 = v14;
      _os_log_impl(&dword_1D8320000, v13, OS_LOG_TYPE_DEFAULT, "Ignoring volatile data from unknown publisher for %{public}@ domain", buf, 0xCu);
    }
    uint64_t v15 = *(void *)(a1 + 64);
    if (v15) {
      (*(void (**)(void))(v15 + 16))();
    }
  }
}

- (id)_internalQueue_fallbackDataForPublisherClient:(uint64_t)a3 domain:
{
  if (a1)
  {
    id v5 = *(NSObject **)(a1 + 88);
    id v6 = a2;
    dispatch_assert_queue_V2(v5);
    uint64_t v7 = [*(id *)(a1 + 32) objectForKey:v6];

    id v8 = [*(id *)(a1 + 40) recordForKey:@"volatileData"];
    uint64_t v9 = [v8 fallbackDataForClientKey:v7 domain:a3];
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (id)dataForDomain:(unint64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__STLocalStatusServer_dataForDomain___block_invoke;
  block[3] = &unk_1E6AD20C0;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(internalQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __37__STLocalStatusServer_dataForDomain___block_invoke(uint64_t *a1)
{
  -[STLocalStatusServer _internalQueue_presentationDataForDomain:](a1[4], a1[6]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copyWithZone:0];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)registerClient:(id)a3 forDomain:(unint64_t)a4
{
  id v6 = a3;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__STLocalStatusServer_registerClient_forDomain___block_invoke;
  block[3] = &unk_1E6AD2110;
  id v10 = v6;
  unint64_t v11 = a4;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

void __48__STLocalStatusServer_registerClient_forDomain___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[2];
  }
  id v12 = v2;
  uint64_t v3 = [v12 objectForKey:*(void *)(a1 + 48)];
  if (!v3)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
    [v12 setObject:v3 forKey:*(void *)(a1 + 48)];
  }
  [v3 addObject:*(void *)(a1 + 40)];
  id v4 = -[STLocalStatusServer _internalQueue_presentationDataForDomain:](*(void *)(a1 + 32), *(void *)(a1 + 48));
  id v5 = (void *)[v4 copyWithZone:0];

  if (v5)
  {
    id v6 = -[STLocalStatusServer _internalQueue_dataForClient:domain:presentationData:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void *)(a1 + 48), v5);
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v10 = v6;
  if (v7)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v7 + 88));
    unint64_t v11 = *(NSObject **)(v7 + 96);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__STLocalStatusServer__internalQueue_notifyClient_ofData_forDomain___block_invoke;
    block[3] = &unk_1E6AD2110;
    id v14 = v9;
    id v15 = v10;
    uint64_t v16 = v8;
    dispatch_async(v11, block);
  }
}

- (void)removeClient:(id)a3 forDomain:(unint64_t)a4
{
  id v6 = a3;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__STLocalStatusServer_removeClient_forDomain___block_invoke;
  block[3] = &unk_1E6AD2110;
  id v10 = v6;
  unint64_t v11 = a4;
  void block[4] = self;
  id v8 = v6;
  dispatch_sync(internalQueue, block);
}

void __46__STLocalStatusServer_removeClient_forDomain___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[2];
  }
  id v4 = v2;
  uint64_t v3 = [v4 objectForKey:a1[6]];
  [v3 removeObject:a1[5]];
  if (![v3 count]) {
    [v4 removeObjectForKey:a1[6]];
  }
}

- (void)reportUserInteraction:(id)a3 forClient:(id)a4 domain:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__STLocalStatusServer_reportUserInteraction_forClient_domain___block_invoke;
  v14[3] = &unk_1E6AD20E8;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  unint64_t v17 = a5;
  id v12 = v8;
  id v13 = v10;
  dispatch_async(internalQueue, v14);
}

void __62__STLocalStatusServer_reportUserInteraction_forClient_domain___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[2];
  }
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = v2;
  id v5 = [v4 objectForKey:v3];
  int v6 = [v5 containsObject:*(void *)(a1 + 40)];

  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    unint64_t v17 = __62__STLocalStatusServer_reportUserInteraction_forClient_domain___block_invoke_2;
    id v18 = &unk_1E6AD21F8;
    uint64_t v8 = *(void *)(a1 + 56);
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    id v19 = v9;
    uint64_t v20 = v10;
    unint64_t v11 = &v15;
    if (v7)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v7 + 88));
      id v12 = objc_msgSend(*(id *)(v7 + 24), "objectForKey:", v8, v15, v16, v17, v18);
      id v13 = (void *)[v12 copy];

      if ([v13 count])
      {
        id v14 = *(NSObject **)(v7 + 96);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __94__STLocalStatusServer__internalQueue_enumeratePublisherClientsForDomain_withClientQueueBlock___block_invoke;
        block[3] = &unk_1E6AD2338;
        id v22 = v13;
        id v23 = v11;
        dispatch_async(v14, block);
      }
    }
  }
}

uint64_t __62__STLocalStatusServer_reportUserInteraction_forClient_domain___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 handleUserInteraction:*(void *)(a1 + 32) forDomain:*(void *)(a1 + 40)];
}

- (NSString)description
{
  return (NSString *)[(STLocalStatusServer *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(STLocalStatusServer *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(STLocalStatusServer *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(STLocalStatusServer *)self succinctDescriptionBuilder];
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__STLocalStatusServer_descriptionBuilderWithMultilinePrefix___block_invoke;
  block[3] = &unk_1E6AD2248;
  id v7 = v5;
  id v12 = v7;
  id v13 = v4;
  id v14 = self;
  id v8 = v4;
  dispatch_sync(internalQueue, block);
  id v9 = v7;

  return v9;
}

void __61__STLocalStatusServer_descriptionBuilderWithMultilinePrefix___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__STLocalStatusServer_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v3[3] = &unk_1E6AD1EE0;
  v3[4] = a1[6];
  id v4 = v1;
  [v4 appendBodySectionWithName:0 multilinePrefix:v2 block:v3];
}

void __61__STLocalStatusServer_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[5];
  }
  uint64_t v3 = v2;
  id v4 = [v3 recordForKey:@"data"];
  id v5 = [v4 domainsWithData];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__STLocalStatusServer_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v13[3] = &unk_1E6AD2220;
  id v14 = v4;
  id v15 = *(id *)(a1 + 40);
  id v6 = v4;
  [v5 enumerateWithBlock:v13];
  id v7 = [v3 recordForKey:@"volatileData"];
  id v8 = [v7 domainsWithData];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__STLocalStatusServer_descriptionBuilderWithMultilinePrefix___block_invoke_4;
  v10[3] = &unk_1E6AD2220;
  id v11 = v7;
  id v12 = *(id *)(a1 + 40);
  id v9 = v7;
  [v8 enumerateWithBlock:v10];
}

void __61__STLocalStatusServer_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) currentDataForDomain:a2];
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = STSystemStatusDescriptionForDomain();
  id v5 = (id)[v3 appendObject:v6 withName:v4];
}

void __61__STLocalStatusServer_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) currentDataForDomain:a2];
  uint64_t v3 = NSString;
  id v4 = STSystemStatusDescriptionForDomain();
  id v5 = [v3 stringWithFormat:@"%@ (volatile)", v4];

  id v6 = (id)[*(id *)(a1 + 40) appendObject:v7 withName:v5];
}

- (void)addDataTransformer:(id)a3 forDomain:(unint64_t)a4
{
  id v6 = a3;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__STLocalStatusServer_addDataTransformer_forDomain___block_invoke;
  block[3] = &unk_1E6AD2110;
  id v10 = v6;
  unint64_t v11 = a4;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

void __52__STLocalStatusServer_addDataTransformer_forDomain___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[8];
  }
  uint64_t v3 = v2;
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 48)];
  id v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 48)];
    [v3 setObject:v5 forKey:v6];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__STLocalStatusServer_addDataTransformer_forDomain___block_invoke_2;
  v11[3] = &unk_1E6AD1EE0;
  id v9 = v5;
  id v12 = v9;
  id v10 = *(id *)(a1 + 40);
  id v13 = v10;
  if (v7)
  {
    -[STLocalStatusServer _internalQueue_mutateDataForDomain:withChangeContext:block:](v7, v8, 0, v11);
    id v10 = v13;
  }
}

uint64_t __52__STLocalStatusServer_addDataTransformer_forDomain___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

- (void)removeDataTransformer:(id)a3 forDomain:(unint64_t)a4
{
  id v6 = a3;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__STLocalStatusServer_removeDataTransformer_forDomain___block_invoke;
  block[3] = &unk_1E6AD2110;
  id v10 = v6;
  unint64_t v11 = a4;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

void __55__STLocalStatusServer_removeDataTransformer_forDomain___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__STLocalStatusServer_removeDataTransformer_forDomain___block_invoke_2;
  v4[3] = &unk_1E6AD2110;
  v4[4] = v1;
  uint64_t v6 = v2;
  id v3 = *(id *)(a1 + 40);
  id v5 = v3;
  if (v1)
  {
    -[STLocalStatusServer _internalQueue_mutateDataForDomain:withChangeContext:block:](v1, v2, 0, v4);
    id v3 = v5;
  }
}

void __55__STLocalStatusServer_removeDataTransformer_forDomain___block_invoke_2(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[8];
  }
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v4 = a1[6];
  id v5 = v2;
  id v7 = [v3 numberWithUnsignedInteger:v4];
  uint64_t v6 = [v5 objectForKey:v7];
  [v6 removeObject:a1[5]];
}

- (void)modifyDataTransformer:(id)a3 forDomain:(unint64_t)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__STLocalStatusServer_modifyDataTransformer_forDomain_usingBlock___block_invoke;
  v13[3] = &unk_1E6AD2270;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(internalQueue, v13);
}

void __66__STLocalStatusServer_modifyDataTransformer_forDomain_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[8];
  }
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = v2;
  uint64_t v6 = [v3 numberWithUnsignedInteger:v4];
  id v7 = [v5 objectForKey:v6];
  int v8 = [v7 containsObject:*(void *)(a1 + 40)];

  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__STLocalStatusServer_modifyDataTransformer_forDomain_usingBlock___block_invoke_2;
    v12[3] = &unk_1E6AD2338;
    uint64_t v10 = *(void *)(a1 + 56);
    id v14 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 40);
    id v13 = v11;
    if (v9)
    {
      -[STLocalStatusServer _internalQueue_mutateDataForDomain:withChangeContext:block:](v9, v10, 0, v12);
      id v11 = v13;
    }
  }
}

uint64_t __66__STLocalStatusServer_modifyDataTransformer_forDomain_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)addClientDataTransformerProvider:(id)a3 forDomain:(unint64_t)a4
{
  id v6 = a3;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__STLocalStatusServer_addClientDataTransformerProvider_forDomain___block_invoke;
  block[3] = &unk_1E6AD2110;
  id v10 = v6;
  unint64_t v11 = a4;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

void __66__STLocalStatusServer_addClientDataTransformerProvider_forDomain___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[9];
  }
  id v3 = v2;
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 48)];
  id v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 48)];
    [v3 setObject:v5 forKey:v6];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__STLocalStatusServer_addClientDataTransformerProvider_forDomain___block_invoke_2;
  v11[3] = &unk_1E6AD1EE0;
  id v9 = v5;
  id v12 = v9;
  id v10 = *(id *)(a1 + 40);
  id v13 = v10;
  if (v7)
  {
    -[STLocalStatusServer _internalQueue_mutateDataForDomain:withChangeContext:block:](v7, v8, 0, v11);
    id v10 = v13;
  }
}

uint64_t __66__STLocalStatusServer_addClientDataTransformerProvider_forDomain___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

- (void)removeClientDataTransformerProvider:(id)a3 forDomain:(unint64_t)a4
{
  id v6 = a3;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__STLocalStatusServer_removeClientDataTransformerProvider_forDomain___block_invoke;
  block[3] = &unk_1E6AD2110;
  id v10 = v6;
  unint64_t v11 = a4;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

void __69__STLocalStatusServer_removeClientDataTransformerProvider_forDomain___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__STLocalStatusServer_removeClientDataTransformerProvider_forDomain___block_invoke_2;
  v4[3] = &unk_1E6AD2110;
  v4[4] = v1;
  uint64_t v6 = v2;
  id v3 = *(id *)(a1 + 40);
  id v5 = v3;
  if (v1)
  {
    -[STLocalStatusServer _internalQueue_mutateDataForDomain:withChangeContext:block:](v1, v2, 0, v4);
    id v3 = v5;
  }
}

void __69__STLocalStatusServer_removeClientDataTransformerProvider_forDomain___block_invoke_2(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[9];
  }
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v4 = a1[6];
  id v5 = v2;
  id v7 = [v3 numberWithUnsignedInteger:v4];
  uint64_t v6 = [v5 objectForKey:v7];
  [v6 removeObject:a1[5]];
}

- (void)modifyClientDataTransformerProvider:(id)a3 forDomain:(unint64_t)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__STLocalStatusServer_modifyClientDataTransformerProvider_forDomain_usingBlock___block_invoke;
  v13[3] = &unk_1E6AD2270;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(internalQueue, v13);
}

void __80__STLocalStatusServer_modifyClientDataTransformerProvider_forDomain_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[9];
  }
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = v2;
  uint64_t v6 = [v3 numberWithUnsignedInteger:v4];
  id v7 = [v5 objectForKey:v6];
  int v8 = [v7 containsObject:*(void *)(a1 + 40)];

  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __80__STLocalStatusServer_modifyClientDataTransformerProvider_forDomain_usingBlock___block_invoke_2;
    v12[3] = &unk_1E6AD2338;
    uint64_t v10 = *(void *)(a1 + 56);
    id v14 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 40);
    id v13 = v11;
    if (v9)
    {
      -[STLocalStatusServer _internalQueue_mutateDataForDomain:withChangeContext:block:](v9, v10, 0, v12);
      id v11 = v13;
    }
  }
}

uint64_t __80__STLocalStatusServer_modifyClientDataTransformerProvider_forDomain_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __122__STLocalStatusServer__internalQueue_replaceDataChangeRecord_forPublisherClient_inDataChangeRecord_applyBlock_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __122__STLocalStatusServer__internalQueue_replaceDataChangeRecord_forPublisherClient_inDataChangeRecord_applyBlock_completion___block_invoke_2;
  v5[3] = &unk_1E6AD2298;
  v5[4] = v4;
  id v6 = *(id *)(a1 + 40);
  uint64_t v12 = a2;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 80);
  id v10 = *(id *)(a1 + 72);
  -[STLocalStatusServer _internalQueue_mutateDataForDomain:withChangeContext:block:](v4, a2, 0, v5);
}

void __122__STLocalStatusServer__internalQueue_replaceDataChangeRecord_forPublisherClient_inDataChangeRecord_applyBlock_completion___block_invoke_2(uint64_t a1)
{
  -[STLocalStatusServer _internalQueue_fallbackDataForPublisherClient:domain:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void *)(a1 + 88));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 48) removeAllEntriesForClientKey:*(void *)(a1 + 56) domain:*(void *)(a1 + 88)];
  if ([*(id *)(a1 + 64) containsValue:*(void *)(a1 + 88)])
  {
    [*(id *)(a1 + 48) setFallbackData:v2 forClientKey:*(void *)(a1 + 56) domain:*(void *)(a1 + 88)];
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

uint64_t __82__STLocalStatusServer__internalQueue_mutateDataForDomain_withChangeContext_block___block_invoke_150(uint64_t a1)
{
  return [*(id *)(a1 + 32) systemStatusServer:*(void *)(a1 + 40) publishedDomainsDidChange:*(void *)(a1 + 48)];
}

void __94__STLocalStatusServer__internalQueue_enumeratePublisherClientsForDomain_withClientQueueBlock___block_invoke(uint64_t a1)
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

uint64_t __68__STLocalStatusServer__internalQueue_notifyClient_ofData_forDomain___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) observeData:*(void *)(a1 + 40) forDomain:*(void *)(a1 + 48) withChangeContext:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_domainsByChangeLogKey, 0);
  objc_storeStrong((id *)&self->_clientDataTransformerProvidersByDomain, 0);
  objc_storeStrong((id *)&self->_dataTransformersByDomain, 0);
  objc_storeStrong((id *)&self->_publisherXPCClientListener, 0);
  objc_storeStrong((id *)&self->_xpcClientListener, 0);
  objc_storeStrong((id *)&self->_dataChangeLog, 0);
  objc_storeStrong((id *)&self->_changeLogKeysByPublisherClient, 0);
  objc_storeStrong((id *)&self->_publisherClientsByDomain, 0);
  objc_storeStrong((id *)&self->_clientsByDomain, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end