@interface MRPlaybackQueueSubscriptionController
+ (BOOL)supportsSecureCoding;
- (BOOL)hasRequest:(id)a3;
- (MRPlaybackQueueSubscriptionController)initWithCoder:(id)a3;
- (MRPlaybackQueueSubscriptionController)initWithPlayerPath:(id)a3;
- (MRPlayerPath)playerPath;
- (id)contentItemIdentifierForOffset:(int64_t)a3;
- (id)description;
- (id)filteredContentItemsBySubscriptionsForContentItems:(id)a3;
- (id)offsetForIdentifier:(id)a3;
- (id)requestForSubscribedContentItemIdentifier:(id)a3;
- (void)_removeRequestID:(uint64_t)a1;
- (void)addRequest:(id)a3;
- (void)augmentCommandOptions:(id)a3 forCommand:(unsigned int)a4;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateFilteredContentItemsBySubscriptionsForContentItems:(id)a3 block:(id)a4;
- (void)invalidate;
- (void)removeRequest:(id)a3;
- (void)restoreStateFromController:(id)a3;
- (void)subscribeToPlaybackQueue:(id)a3 forRequest:(id)a4;
@end

@implementation MRPlaybackQueueSubscriptionController

void __77__MRPlaybackQueueSubscriptionController_subscribeToPlaybackQueue_forRequest___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = [a2 identifier];
  if ([*(id *)(a1 + 32) hasLocation])
  {
    uint64_t v5 = [*(id *)(a1 + 32) range] + a3;
    v6 = *(void **)(*(void *)(a1 + 40) + 24);
    v7 = [NSNumber numberWithLong:v5];
    [v6 setObject:v9 forKey:v7];
  }
  v8 = [*(id *)(a1 + 48) second];
  [v8 addObject:v9];
}

void __77__MRPlaybackQueueSubscriptionController_subscribeToPlaybackQueue_forRequest___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) requestIdentifier];

  if (v2)
  {
    v3 = *(void **)(*(void *)(a1 + 40) + 16);
    v4 = [*(id *)(a1 + 32) requestIdentifier];
    [v3 addObject:v4];
  }
  if ([*(id *)(a1 + 48) hasLocation])
  {
    [*(id *)(a1 + 48) range];
    uint64_t v6 = v5;
    unint64_t v7 = [*(id *)(a1 + 32) range];
    if (v7 < v7 + v6)
    {
      unint64_t v8 = v7;
      do
      {
        id v9 = *(void **)(*(void *)(a1 + 40) + 24);
        v10 = [NSNumber numberWithLong:v8];
        [v9 removeObjectForKey:v10];

        ++v8;
        --v6;
      }
      while (v6);
    }
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v11 = *(id *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v32;
LABEL_9:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v32 != v14) {
        objc_enumerationMutation(v11);
      }
      v16 = *(void **)(*((void *)&v31 + 1) + 8 * v15);
      v17 = [v16 first];
      char v18 = [v17 exactMatch:*(void *)(a1 + 32)];

      if (v18) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v13) {
          goto LABEL_9;
        }
        goto LABEL_15;
      }
    }
    id v19 = v16;

    if (v19) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_15:
  }
  id v20 = objc_alloc(MEMORY[0x1E4F77970]);
  LODWORD(v21) = 1008981770;
  v22 = (void *)[v20 initWithCapacity:500 falsePositiveTolerance:v21];
  id v19 = (id)[objc_alloc(MEMORY[0x1E4F779D8]) initWithFirst:*(void *)(a1 + 32) second:v22];
  [*(id *)(*(void *)(a1 + 40) + 8) addObject:v19];

LABEL_18:
  v23 = [*(id *)(a1 + 48) contentItems];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __77__MRPlaybackQueueSubscriptionController_subscribeToPlaybackQueue_forRequest___block_invoke_2;
  v27[3] = &unk_1E57D88C0;
  id v24 = *(id *)(a1 + 48);
  uint64_t v25 = *(void *)(a1 + 40);
  id v28 = v24;
  uint64_t v29 = v25;
  id v30 = v19;
  id v26 = v19;
  [v23 enumerateObjectsUsingBlock:v27];
}

uint64_t __51__MRPlaybackQueueSubscriptionController_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
}

- (MRPlaybackQueueSubscriptionController)initWithPlayerPath:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MRPlaybackQueueSubscriptionController;
  uint64_t v6 = [(MRPlaybackQueueSubscriptionController *)&v19 init];
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_playerPath, a3);
    unint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.MediaRemote.MRPlaybackQueueClient/serialQueue", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    uint64_t v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    requestFilters = v7->_requestFilters;
    v7->_requestFilters = v12;

    uint64_t v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    requests = v7->_requests;
    v7->_requests = v14;

    v16 = (MSVMutableBidirectionalDictionary *)objc_alloc_init(MEMORY[0x1E4F779B8]);
    offsets = v7->_offsets;
    v7->_offsets = v16;
  }
  return v7;
}

void __52__MRPlaybackQueueSubscriptionController_addRequest___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  dispatch_time_t v2 = dispatch_time(0, 420000000000);
  v3 = dispatch_get_global_queue(-2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MRPlaybackQueueSubscriptionController_addRequest___block_invoke_2;
  block[3] = &unk_1E57D12A8;
  objc_copyWeak(&v6, &location);
  id v5 = *(id *)(a1 + 40);
  dispatch_after(v2, v3, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)addRequest:(id)a3
{
  v4 = [a3 requestIdentifier];
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__MRPlaybackQueueSubscriptionController_addRequest___block_invoke;
    v7[3] = &unk_1E57D0790;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

- (void)subscribeToPlaybackQueue:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__MRPlaybackQueueSubscriptionController_subscribeToPlaybackQueue_forRequest___block_invoke;
    block[3] = &unk_1E57D1B18;
    id v11 = v7;
    uint64_t v12 = self;
    id v13 = v6;
    dispatch_sync(queue, block);
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MRPlaybackQueueSubscriptionController_invalidate__block_invoke;
  block[3] = &unk_1E57D0518;
  void block[4] = self;
  dispatch_sync(queue, block);
}

void __83__MRPlaybackQueueSubscriptionController_requestForSubscribedContentItemIdentifier___block_invoke(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1[4] + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "second", (void)v15);
        int v9 = [v8 containsObject:a1[5]];

        if (v9)
        {
          dispatch_queue_t v10 = [v7 first];
          id v11 = *(void **)(*(void *)(a1[6] + 8) + 40);
          if (v11)
          {
            [v11 mergeFrom:v10];
          }
          else
          {
            uint64_t v12 = [v10 copy];
            uint64_t v13 = *(void *)(a1[6] + 8);
            uint64_t v14 = *(void **)(v13 + 40);
            *(void *)(v13 + 40) = v12;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

uint64_t __52__MRPlaybackQueueSubscriptionController_hasRequest___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 16) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (BOOL)hasRequest:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MRPlaybackQueueSubscriptionController_hasRequest___block_invoke;
  block[3] = &unk_1E57D1C88;
  id v9 = v4;
  dispatch_queue_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

void __52__MRPlaybackQueueSubscriptionController_addRequest___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[MRPlaybackQueueSubscriptionController _removeRequestID:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
}

- (void)_removeRequestID:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && v3)
  {
    uint64_t v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__MRPlaybackQueueSubscriptionController__removeRequestID___block_invoke;
    v6[3] = &unk_1E57D0790;
    v6[4] = a1;
    id v7 = v3;
    dispatch_sync(v5, v6);
  }
}

- (id)filteredContentItemsBySubscriptionsForContentItems:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__MRPlaybackQueueSubscriptionController_filteredContentItemsBySubscriptionsForContentItems___block_invoke;
  v10[3] = &unk_1E57D88E8;
  id v11 = v6;
  id v7 = v6;
  [(MRPlaybackQueueSubscriptionController *)self enumerateFilteredContentItemsBySubscriptionsForContentItems:v5 block:v10];

  id v8 = (void *)[v7 copy];

  return v8;
}

- (void)enumerateFilteredContentItemsBySubscriptionsForContentItems:(id)a3 block:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *, unsigned char *))a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        char v14 = [v13 identifier];
        long long v15 = [(MRPlaybackQueueSubscriptionController *)self requestForSubscribedContentItemIdentifier:v14];

        if (v15)
        {
          long long v16 = MRContentItemCreateFromRequest(v13, v15);
          if (v16)
          {
            char v17 = 0;
            v7[2](v7, v16, v15, &v17);
            if (v17)
            {

              goto LABEL_14;
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (id)requestForSubscribedContentItemIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__36;
  long long v16 = __Block_byref_object_dispose__36;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__MRPlaybackQueueSubscriptionController_requestForSubscribedContentItemIdentifier___block_invoke;
  block[3] = &unk_1E57D3118;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __92__MRPlaybackQueueSubscriptionController_filteredContentItemsBySubscriptionsForContentItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!MRContentItemIsEmpty(v3)) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p playerPath=%@>", objc_opt_class(), self, self->_playerPath];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MRPlaybackQueueSubscriptionController)initWithCoder:(id)a3
{
  v26[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playerPath"];
  if (v5)
  {
    id v6 = [(MRPlaybackQueueSubscriptionController *)self initWithPlayerPath:v5];
    if (v6)
    {
      id v7 = (void *)MEMORY[0x1E4F1CAD0];
      v26[0] = objc_opt_class();
      v26[1] = objc_opt_class();
      v26[2] = objc_opt_class();
      v26[3] = objc_opt_class();
      v26[4] = objc_opt_class();
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:5];
      uint64_t v9 = [v7 setWithArray:v8];
      uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"requestFilters"];
      requestFilters = v6->_requestFilters;
      v6->_requestFilters = (NSMutableArray *)v10;

      uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
      v25[0] = objc_opt_class();
      v25[1] = objc_opt_class();
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
      uint64_t v14 = [v12 setWithArray:v13];
      uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"requests"];
      requests = v6->_requests;
      v6->_requests = (NSMutableSet *)v15;

      id v17 = (void *)MEMORY[0x1E4F1CAD0];
      v24[0] = objc_opt_class();
      v24[1] = objc_opt_class();
      v24[2] = objc_opt_class();
      long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
      long long v19 = [v17 setWithArray:v18];
      uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"offsets"];
      offsets = v6->_offsets;
      v6->_offsets = (MSVMutableBidirectionalDictionary *)v20;
    }
    self = v6;
    v22 = self;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__MRPlaybackQueueSubscriptionController_encodeWithCoder___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __57__MRPlaybackQueueSubscriptionController_encodeWithCoder___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 40) forKey:@"playerPath"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 8) forKey:@"requestFilters"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 16) forKey:@"requests"];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 24);

  return [v2 encodeObject:v3 forKey:@"offsets"];
}

- (void)restoreStateFromController:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"MRPlaybackQueueClient.m", 106, @"Unexpected class attempting to restore controller: %@", objc_opt_class() object file lineNumber description];
  }
  id v6 = [v5 playerPath];
  id v7 = [(MRPlaybackQueueSubscriptionController *)self playerPath];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v13 = [v5 playerPath];
    uint64_t v14 = [(MRPlaybackQueueSubscriptionController *)self playerPath];
    [v12 handleFailureInMethod:a2, self, @"MRPlaybackQueueClient.m", 107, @"Attempting to restore state for unrelated player path: %@ vs %@", v13, v14 object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__MRPlaybackQueueSubscriptionController_restoreStateFromController___block_invoke;
  block[3] = &unk_1E57D0790;
  void block[4] = self;
  id v16 = v5;
  id v10 = v5;
  dispatch_sync(queue, block);
}

void __68__MRPlaybackQueueSubscriptionController_restoreStateFromController___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(*(void *)(a1 + 40) + 8));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(*(void *)(a1 + 40) + 16));
  id v2 = *(void **)(*(void *)(a1 + 40) + 24);
  uint64_t v3 = (id *)(*(void *)(a1 + 32) + 24);

  objc_storeStrong(v3, v2);
}

- (void)removeRequest:(id)a3
{
  id v4 = [a3 requestIdentifier];
  -[MRPlaybackQueueSubscriptionController _removeRequestID:]((uint64_t)self, v4);
}

- (id)contentItemIdentifierForOffset:(int64_t)a3
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__36;
  uint64_t v11 = __Block_byref_object_dispose__36;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__MRPlaybackQueueSubscriptionController_contentItemIdentifierForOffset___block_invoke;
  block[3] = &unk_1E57D4A48;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __72__MRPlaybackQueueSubscriptionController_contentItemIdentifierForOffset___block_invoke(void *a1)
{
  id v2 = *(void **)(a1[4] + 24);
  id v6 = [NSNumber numberWithLong:a1[6]];
  uint64_t v3 = [v2 objectForKey:v6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)offsetForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__36;
  id v16 = __Block_byref_object_dispose__36;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MRPlaybackQueueSubscriptionController_offsetForIdentifier___block_invoke;
  block[3] = &unk_1E57D1C88;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __61__MRPlaybackQueueSubscriptionController_offsetForIdentifier___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 24) keyForObject:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (void)augmentCommandOptions:(id)a3 forCommand:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = MRMediaRemoteCopyCommandDescription(v4);
  if (MRMediaRemoteCommandRequiresSourcePositionOption(v4))
  {
    char v8 = [v6 objectForKeyedSubscript:@"kMRMediaRemoteOptionPlaybackQueueOffset"];
    uint64_t v9 = [v6 objectForKeyedSubscript:@"kMRMediaRemoteOptionContentItemID"];
    id v10 = v9;
    if (v8) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__MRPlaybackQueueSubscriptionController_augmentCommandOptions_forCommand___block_invoke;
      block[3] = &unk_1E57D3480;
      void block[4] = self;
      uint64_t v14 = &v41;
      id v41 = v8;
      uint64_t v15 = &v42;
      id v42 = v6;
      id v16 = &v43;
      id v43 = v7;
      id v17 = block;
    }
    else
    {
      if (v9) {
        BOOL v12 = v8 == 0;
      }
      else {
        BOOL v12 = 0;
      }
      if (!v12) {
        goto LABEL_14;
      }
      queue = self->_queue;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __74__MRPlaybackQueueSubscriptionController_augmentCommandOptions_forCommand___block_invoke_35;
      v36[3] = &unk_1E57D3480;
      v36[4] = self;
      uint64_t v14 = &v37;
      id v37 = v9;
      uint64_t v15 = &v38;
      id v38 = v6;
      id v16 = &v39;
      id v39 = v7;
      id v17 = v36;
    }
    dispatch_sync(queue, v17);

LABEL_14:
  }
  if (MRMediaRemoteCommandRequiresDestinationPositionOption(v4))
  {
    long long v18 = [v6 objectForKeyedSubscript:@"kMRMediaRemoteOptionPlaybackQueueDestinationOffset"];
    long long v19 = [v6 objectForKeyedSubscript:@"kMRMediaRemoteOptionInsertAfterContentItemID"];
    uint64_t v20 = v19;
    if (v18) {
      BOOL v21 = v19 == 0;
    }
    else {
      BOOL v21 = 0;
    }
    if (v21)
    {
      uint64_t v23 = self->_queue;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __74__MRPlaybackQueueSubscriptionController_augmentCommandOptions_forCommand___block_invoke_36;
      v32[3] = &unk_1E57D3480;
      v32[4] = self;
      id v24 = &v33;
      id v33 = v18;
      uint64_t v25 = &v34;
      id v34 = v6;
      id v26 = &v35;
      id v35 = v7;
      v27 = v32;
    }
    else
    {
      if (v19) {
        BOOL v22 = v18 == 0;
      }
      else {
        BOOL v22 = 0;
      }
      if (!v22) {
        goto LABEL_28;
      }
      uint64_t v23 = self->_queue;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __74__MRPlaybackQueueSubscriptionController_augmentCommandOptions_forCommand___block_invoke_37;
      v28[3] = &unk_1E57D3480;
      v28[4] = self;
      id v24 = &v29;
      id v29 = v19;
      uint64_t v25 = &v30;
      id v30 = v6;
      id v26 = &v31;
      id v31 = v7;
      v27 = v28;
    }
    dispatch_sync(v23, v27);

LABEL_28:
  }
}

void __74__MRPlaybackQueueSubscriptionController_augmentCommandOptions_forCommand___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    [*(id *)(a1 + 48) setObject:v2 forKeyedSubscript:@"kMRMediaRemoteOptionContentItemID"];
  }
  else
  {
    uint64_t v3 = _MRLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 56);
      int v6 = 138412802;
      id v7 = @"kMRMediaRemoteOptionPlaybackQueueOffset";
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRPlaybackQueueClient] No ContentItem in playback queue with provided '%@':%@ for command <%@>", (uint8_t *)&v6, 0x20u);
    }
  }
}

void __74__MRPlaybackQueueSubscriptionController_augmentCommandOptions_forCommand___block_invoke_35(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) keyForObject:*(void *)(a1 + 40)];
  if (v2)
  {
    [*(id *)(a1 + 48) setObject:v2 forKeyedSubscript:@"kMRMediaRemoteOptionPlaybackQueueOffset"];
  }
  else
  {
    uint64_t v3 = _MRLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 56);
      int v6 = 138412802;
      id v7 = @"kMRMediaRemoteOptionContentItemID";
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRPlaybackQueueClient] No ContentItem in playback queue with provided '%@':%@ for command <%@>", (uint8_t *)&v6, 0x20u);
    }
  }
}

void __74__MRPlaybackQueueSubscriptionController_augmentCommandOptions_forCommand___block_invoke_36(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(*(id *)(a1 + 40), "longValue") - 1);
  uint64_t v4 = [v2 objectForKey:v3];

  if (v4)
  {
    [*(id *)(a1 + 48) setObject:v4 forKeyedSubscript:@"kMRMediaRemoteOptionInsertAfterContentItemID"];
  }
  else
  {
    uint64_t v5 = _MRLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 56);
      int v8 = 138412802;
      uint64_t v9 = @"kMRMediaRemoteOptionPlaybackQueueDestinationOffset";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRPlaybackQueueClient] No ContentItem in playback queue with provided '%@':%@ for command <%@>", (uint8_t *)&v8, 0x20u);
    }
  }
}

void __74__MRPlaybackQueueSubscriptionController_augmentCommandOptions_forCommand___block_invoke_37(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) keyForObject:*(void *)(a1 + 40)];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v2, "longValue") + 1);
    [*(id *)(a1 + 48) setObject:v4 forKeyedSubscript:@"kMRMediaRemoteOptionPlaybackQueueDestinationOffset"];
  }
  else
  {
    uint64_t v4 = _MRLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 56);
      int v7 = 138412802;
      int v8 = @"kMRMediaRemoteOptionInsertAfterContentItemID";
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[MRPlaybackQueueClient] No ContentItem in playback queue with provided '%@':%@ for command <%@>", (uint8_t *)&v7, 0x20u);
    }
  }
}

uint64_t __58__MRPlaybackQueueSubscriptionController__removeRequestID___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_offsets, 0);
  objc_storeStrong((id *)&self->_requests, 0);

  objc_storeStrong((id *)&self->_requestFilters, 0);
}

@end