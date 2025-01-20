@interface WBSAutoFillAssociatedDomainsManager
- (NSArray)domainsToConsiderIdentical;
- (NSArray)domainsWithAssociatedCredentials;
- (WBSAutoFillAssociatedDomainsManager)init;
- (WBSAutoFillAssociatedDomainsManager)initWithDomainsWithAssociatedCredentials:(id)a3;
- (WBSAutoFillAssociatedDomainsManager)initWithDomainsWithAssociatedCredentials:(id)a3 domainsToConsiderIdentical:(id)a4;
- (id)domainsToConsiderIdenticalToDomain:(id)a3;
- (id)domainsWithAssociatedCredentialsForDomain:(id)a3;
- (void)_updateDomainToDomainsToConsiderIdentical;
- (void)_updateDomainToDomainsWithAssociatedCredentials;
- (void)setDomainsToConsiderIdentical:(id)a3;
- (void)setDomainsWithAssociatedCredentials:(id)a3;
@end

@implementation WBSAutoFillAssociatedDomainsManager

- (WBSAutoFillAssociatedDomainsManager)init
{
  return 0;
}

- (WBSAutoFillAssociatedDomainsManager)initWithDomainsWithAssociatedCredentials:(id)a3
{
  return [(WBSAutoFillAssociatedDomainsManager *)self initWithDomainsWithAssociatedCredentials:a3 domainsToConsiderIdentical:0];
}

- (WBSAutoFillAssociatedDomainsManager)initWithDomainsWithAssociatedCredentials:(id)a3 domainsToConsiderIdentical:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WBSAutoFillAssociatedDomainsManager;
  v8 = [(WBSAutoFillAssociatedDomainsManager *)&v18 init];
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = NSString;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    id v13 = [v10 stringWithFormat:@"com.apple.SafariCore.%@.%p", v12, v8];
    dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], v9);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v14;

    [(WBSAutoFillAssociatedDomainsManager *)v8 setDomainsWithAssociatedCredentials:v6];
    [(WBSAutoFillAssociatedDomainsManager *)v8 setDomainsToConsiderIdentical:v7];
    v16 = v8;
  }
  return v8;
}

- (void)setDomainsWithAssociatedCredentials:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__WBSAutoFillAssociatedDomainsManager_setDomainsWithAssociatedCredentials___block_invoke;
  v7[3] = &unk_1E615A6C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __75__WBSAutoFillAssociatedDomainsManager_setDomainsWithAssociatedCredentials___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  v5 = *(void **)(a1 + 32);
  return [v5 _updateDomainToDomainsWithAssociatedCredentials];
}

- (void)setDomainsToConsiderIdentical:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__WBSAutoFillAssociatedDomainsManager_setDomainsToConsiderIdentical___block_invoke;
  v7[3] = &unk_1E615A6C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __69__WBSAutoFillAssociatedDomainsManager_setDomainsToConsiderIdentical___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = *(void **)(a1 + 32);
  return [v5 _updateDomainToDomainsToConsiderIdentical];
}

- (id)domainsWithAssociatedCredentialsForDomain:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    dispatch_queue_t v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__WBSAutoFillAssociatedDomainsManager_domainsWithAssociatedCredentialsForDomain___block_invoke;
    block[3] = &unk_1E615A6F0;
    v10 = &v11;
    block[4] = self;
    id v9 = v4;
    dispatch_sync(queue, block);
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __81__WBSAutoFillAssociatedDomainsManager_domainsWithAssociatedCredentialsForDomain___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "safari_highLevelDomainFromHost");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if ([v8 length])
    {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v8];
      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
  }
}

- (id)domainsToConsiderIdenticalToDomain:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    dispatch_queue_t v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__WBSAutoFillAssociatedDomainsManager_domainsToConsiderIdenticalToDomain___block_invoke;
    block[3] = &unk_1E615A6F0;
    v10 = &v11;
    block[4] = self;
    id v9 = v4;
    dispatch_sync(queue, block);
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __74__WBSAutoFillAssociatedDomainsManager_domainsToConsiderIdenticalToDomain___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_updateDomainToDomainsWithAssociatedCredentials
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  domainToDomainsWithAssociatedCredentials = self->_domainToDomainsWithAssociatedCredentials;
  self->_domainToDomainsWithAssociatedCredentials = v3;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = self->_domainsWithAssociatedCredentials;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = v9;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v18 + 1) + 8 * j);
              if ([v16 length]) {
                [(NSMutableDictionary *)self->_domainToDomainsWithAssociatedCredentials setObject:v10 forKeyedSubscript:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v13);
        }
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }
}

- (void)_updateDomainToDomainsToConsiderIdentical
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  domainsToDomainsToConsiderIdentical = self->_domainsToDomainsToConsiderIdentical;
  self->_domainsToDomainsToConsiderIdentical = v3;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = self->_domainsToConsiderIdentical;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = v9;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v18 + 1) + 8 * j);
              if ([v16 length]) {
                [(NSMutableDictionary *)self->_domainsToDomainsToConsiderIdentical setObject:v10 forKeyedSubscript:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v13);
        }
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }
}

- (NSArray)domainsWithAssociatedCredentials
{
  return self->_domainsWithAssociatedCredentials;
}

- (NSArray)domainsToConsiderIdentical
{
  return self->_domainsToConsiderIdentical;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainsToConsiderIdentical, 0);
  objc_storeStrong((id *)&self->_domainsWithAssociatedCredentials, 0);
  objc_storeStrong((id *)&self->_domainsToDomainsToConsiderIdentical, 0);
  objc_storeStrong((id *)&self->_domainToDomainsWithAssociatedCredentials, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end