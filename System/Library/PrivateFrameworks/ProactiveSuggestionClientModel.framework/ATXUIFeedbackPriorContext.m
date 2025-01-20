@interface ATXUIFeedbackPriorContext
+ (BOOL)supportsSecureCoding;
- (ATXProactiveSuggestionFeedbackContextProtocol)context;
- (ATXUIFeedbackPriorContext)init;
- (ATXUIFeedbackPriorContext)initWithCacheUpdateOrdering:(id)a3 blendingModelCacheUpdates:(id)a4 clientModelCacheUpdates:(id)a5 context:(id)a6 pinnedBlendingModelUICacheUpdateUUID:(id)a7;
- (ATXUIFeedbackPriorContext)initWithCoder:(id)a3;
- (ATXUIFeedbackPriorContext)initWithProto:(id)a3;
- (ATXUIFeedbackPriorContext)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXUIFeedbackPriorContext:(id)a3;
- (NSDictionary)blendingModelCacheUpdates;
- (NSDictionary)clientModelCacheUpdates;
- (NSOrderedSet)cacheUpdateOrdering;
- (NSUUID)pinnedBlendingModelUICacheUpdateUUID;
- (id)_referencedClientModelCaches;
- (id)blendingModelUICacheUpdateForUUID:(id)a3;
- (id)clientModelCacheUpdatesForUICacheUpdateUUID:(id)a3;
- (id)encodeAsProto;
- (id)proto;
- (id)validContextClassNames;
- (unint64_t)hash;
- (void)_pruneBlendingModelCachesOlderThanUUID:(id)a3;
- (void)_validateCacheUpdateOrderingAndCacheDictMapping;
- (void)addBlendingModelUICacheUpdate:(id)a3;
- (void)addClientModelCacheUpdate:(id)a3;
- (void)addContext:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)pruneBlendingModelCachesOverMaxNum;
- (void)pruneContextStateOlderThanBlendingUUID:(id)a3;
- (void)pruneUnreferencedClientModelCachesIfPossible;
- (void)updatePinnedBlendingModelUICacheUpdateUUID:(id)a3;
@end

@implementation ATXUIFeedbackPriorContext

- (ATXUIFeedbackPriorContext)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = [(ATXUIFeedbackPriorContext *)self initWithCacheUpdateOrdering:v3 blendingModelCacheUpdates:v4 clientModelCacheUpdates:v5 context:0 pinnedBlendingModelUICacheUpdateUUID:0];

  return v6;
}

- (ATXUIFeedbackPriorContext)initWithCacheUpdateOrdering:(id)a3 blendingModelCacheUpdates:(id)a4 clientModelCacheUpdates:(id)a5 context:(id)a6 pinnedBlendingModelUICacheUpdateUUID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)ATXUIFeedbackPriorContext;
  v17 = [(ATXUIFeedbackPriorContext *)&v25 init];
  if (v17)
  {
    uint64_t v18 = [v12 mutableCopy];
    cacheUpdateOrdering = v17->_cacheUpdateOrdering;
    v17->_cacheUpdateOrdering = (NSMutableOrderedSet *)v18;

    uint64_t v20 = [v13 mutableCopy];
    blendingModelCacheUpdates = v17->_blendingModelCacheUpdates;
    v17->_blendingModelCacheUpdates = (NSMutableDictionary *)v20;

    uint64_t v22 = [v14 mutableCopy];
    clientModelCacheUpdates = v17->_clientModelCacheUpdates;
    v17->_clientModelCacheUpdates = (NSMutableDictionary *)v22;

    objc_storeStrong((id *)&v17->_context, a6);
    objc_storeStrong((id *)&v17->_pinnedBlendingModelUICacheUpdateUUID, a7);
  }

  return v17;
}

- (void)addClientModelCacheUpdate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 uuid];

  if (v5)
  {
    cacheUpdateOrdering = self->_cacheUpdateOrdering;
    v7 = [v4 uuid];
    [(NSMutableOrderedSet *)cacheUpdateOrdering addObject:v7];

    clientModelCacheUpdates = self->_clientModelCacheUpdates;
    v9 = [v4 uuid];
    [(NSMutableDictionary *)clientModelCacheUpdates setObject:v4 forKey:v9];

    v10 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      int v14 = 138412546;
      id v15 = v12;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_1AE67F000, v10, OS_LOG_TYPE_DEFAULT, "%@ - added client model cache update %@", (uint8_t *)&v14, 0x16u);
    }
    [(ATXUIFeedbackPriorContext *)self pruneUnreferencedClientModelCachesIfPossible];
  }
  else
  {
    id v13 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXUIFeedbackPriorContext addClientModelCacheUpdate:]();
    }
  }
}

- (void)addBlendingModelUICacheUpdate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 uuid];

  if (v5)
  {
    cacheUpdateOrdering = self->_cacheUpdateOrdering;
    v7 = [v4 uuid];
    [(NSMutableOrderedSet *)cacheUpdateOrdering addObject:v7];

    blendingModelCacheUpdates = self->_blendingModelCacheUpdates;
    v9 = [v4 uuid];
    [(NSMutableDictionary *)blendingModelCacheUpdates setObject:v4 forKey:v9];

    v10 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      int v14 = 138412546;
      id v15 = v12;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_1AE67F000, v10, OS_LOG_TYPE_DEFAULT, "%@ - added blending ui cache update %@", (uint8_t *)&v14, 0x16u);
    }
    [(ATXUIFeedbackPriorContext *)self pruneBlendingModelCachesOverMaxNum];
  }
  else
  {
    id v13 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXUIFeedbackPriorContext addBlendingModelUICacheUpdate:]();
    }
  }
}

- (void)addContext:(id)a3
{
}

- (void)updatePinnedBlendingModelUICacheUpdateUUID:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_pinnedBlendingModelUICacheUpdateUUID, a3);
    id v5 = v6;
  }
}

- (id)blendingModelUICacheUpdateForUUID:(id)a3
{
  if (a3)
  {
    id v4 = -[NSMutableDictionary objectForKey:](self->_blendingModelCacheUpdates, "objectForKey:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)clientModelCacheUpdatesForUICacheUpdateUUID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(ATXUIFeedbackPriorContext *)self blendingModelUICacheUpdateForUUID:v4];
    id v6 = objc_opt_new();
    if (v5)
    {
      context = (void *)MEMORY[0x1B3E6F520]();
      uint64_t v20 = v5;
      v7 = [v5 clientModelCacheUpdateUUIDs];
      v8 = [v7 allValues];

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v9 = [(NSMutableDictionary *)self->_clientModelCacheUpdates allValues];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v9);
            }
            int v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            id v15 = [v14 uuid];
            int v16 = [v8 containsObject:v15];

            if (v16) {
              [v6 addObject:v14];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v11);
      }

      id v5 = v20;
    }
    id v17 = (void *)[v6 copy];
  }
  else
  {
    id v17 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v17;
}

- (void)pruneContextStateOlderThanBlendingUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(NSMutableOrderedSet *)self->_cacheUpdateOrdering containsObject:v4])
    {
      [(ATXUIFeedbackPriorContext *)self _pruneBlendingModelCachesOlderThanUUID:v4];
      [(ATXUIFeedbackPriorContext *)self pruneUnreferencedClientModelCachesIfPossible];
      [(ATXUIFeedbackPriorContext *)self _validateCacheUpdateOrderingAndCacheDictMapping];
    }
    else
    {
      id v5 = __atxlog_handle_feedback();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        [(ATXUIFeedbackPriorContext *)(uint64_t)self pruneContextStateOlderThanBlendingUUID:v5];
      }
    }
  }
}

- (void)pruneBlendingModelCachesOverMaxNum
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)[(NSMutableDictionary *)self->_blendingModelCacheUpdates count] < 3) {
    return;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [(NSMutableOrderedSet *)self->_cacheUpdateOrdering reversedOrderedSet];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (!v4)
  {
LABEL_12:
    id v11 = v3;
    goto LABEL_17;
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v16;
LABEL_4:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v16 != v7) {
      objc_enumerationMutation(v3);
    }
    v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
    uint64_t v10 = [(NSMutableDictionary *)self->_blendingModelCacheUpdates objectForKey:v9];

    if (!v10) {
      goto LABEL_10;
    }
    if (v6) {
      break;
    }
    uint64_t v6 = 1;
LABEL_10:
    if (v5 == ++v8)
    {
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (v5) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  id v11 = v9;

  if (!v11) {
    return;
  }
  [(ATXUIFeedbackPriorContext *)self pruneContextStateOlderThanBlendingUUID:v11];
  uint64_t v12 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (objc_class *)objc_opt_class();
    int v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138412546;
    uint64_t v20 = v14;
    __int16 v21 = 2048;
    uint64_t v22 = 2;
    _os_log_impl(&dword_1AE67F000, v12, OS_LOG_TYPE_DEFAULT, "%@ - reached more than %lu ui cache updates, pruned context state", buf, 0x16u);
  }
LABEL_17:
}

- (void)_pruneBlendingModelCachesOlderThanUUID:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  id v20 = (id)objc_opt_new();
  cacheUpdateOrdering = self->_cacheUpdateOrdering;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__ATXUIFeedbackPriorContext__pruneBlendingModelCachesOlderThanUUID___block_invoke;
  v11[3] = &unk_1E5F00DE8;
  id v6 = v4;
  id v12 = v6;
  id v13 = self;
  int v14 = &v15;
  [(NSMutableOrderedSet *)cacheUpdateOrdering enumerateObjectsUsingBlock:v11];
  [(NSMutableOrderedSet *)self->_cacheUpdateOrdering removeObjectsInArray:v16[5]];
  uint64_t v7 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    uint64_t v10 = v16[5];
    *(_DWORD *)buf = 138412546;
    uint64_t v22 = v9;
    __int16 v23 = 2112;
    uint64_t v24 = v10;
    _os_log_impl(&dword_1AE67F000, v7, OS_LOG_TYPE_DEFAULT, "%@ - _pruneBlendingModelCachesOlderThanUUID removed blending caches with UUIDs: %@", buf, 0x16u);
  }
  _Block_object_dispose(&v15, 8);
}

void __68__ATXUIFeedbackPriorContext__pruneBlendingModelCachesOlderThanUUID___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if ([v10 isEqual:a1[4]])
  {
    *a4 = 1;
  }
  else
  {
    id v6 = [*(id *)(a1[5] + 16) objectForKey:v10];
    uint64_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = *(void **)(a1[5] + 40);
      v9 = [v6 uuid];
      LOBYTE(v8) = [v8 isEqual:v9];

      if ((v8 & 1) == 0)
      {
        [*(id *)(a1[5] + 16) removeObjectForKey:v10];
        [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v10];
      }
    }
  }
}

- (void)pruneUnreferencedClientModelCachesIfPossible
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__4;
  v19[4] = __Block_byref_object_dispose__4;
  id v20 = [(ATXUIFeedbackPriorContext *)self _referencedClientModelCaches];
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__4;
  uint64_t v17 = __Block_byref_object_dispose__4;
  id v18 = (id)objc_opt_new();
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__4;
  v9[4] = __Block_byref_object_dispose__4;
  id v10 = (id)objc_opt_new();
  uint64_t v3 = [(NSMutableOrderedSet *)self->_cacheUpdateOrdering reversedOrderedSet];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__ATXUIFeedbackPriorContext_pruneUnreferencedClientModelCachesIfPossible__block_invoke;
  v8[3] = &unk_1E5F00E10;
  v8[4] = self;
  v8[5] = v11;
  v8[6] = v19;
  v8[7] = &v13;
  v8[8] = v9;
  [v3 enumerateObjectsUsingBlock:v8];

  [(NSMutableOrderedSet *)self->_cacheUpdateOrdering removeObjectsInArray:v14[5]];
  id v4 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = v14[5];
    *(_DWORD *)buf = 138412546;
    uint64_t v22 = v6;
    __int16 v23 = 2112;
    uint64_t v24 = v7;
    _os_log_impl(&dword_1AE67F000, v4, OS_LOG_TYPE_DEFAULT, "%@ - _pruneUnreferencedClientModelCaches removed client caches with UUIDs: %@", buf, 0x16u);
  }
  _Block_object_dispose(v9, 8);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(v19, 8);
}

uint64_t __73__ATXUIFeedbackPriorContext_pruneUnreferencedClientModelCachesIfPossible__block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
  id v12 = v3;
  uint64_t v5 = objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "containsObject:");
  if (v4)
  {
    id v6 = v12;
    if (v5) {
      goto LABEL_15;
    }
    uint64_t v7 = [*(id *)(a1[4] + 24) objectForKey:v12];
    if (v7)
    {
      [*(id *)(a1[4] + 24) removeObjectForKey:v12];
      [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:v12];
    }
    goto LABEL_13;
  }
  if (!v5)
  {
    uint64_t v7 = [*(id *)(a1[4] + 24) objectForKey:v12];
    uint64_t v8 = [v7 clientModelId];
    if (v8)
    {
      if ([*(id *)(*(void *)(a1[8] + 8) + 40) containsObject:v8])
      {
        [*(id *)(a1[4] + 24) removeObjectForKey:v12];
        v9 = *(void **)(*(void *)(a1[7] + 8) + 40);
        id v10 = v12;
      }
      else
      {
        v9 = *(void **)(*(void *)(a1[8] + 8) + 40);
        id v10 = v8;
      }
      [v9 addObject:v10];
    }

LABEL_13:
    goto LABEL_14;
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
LABEL_14:
  id v6 = v12;
LABEL_15:
  return MEMORY[0x1F41817F8](v5, v6);
}

- (void)_validateCacheUpdateOrderingAndCacheDictMapping
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1AE67F000, log, OS_LOG_TYPE_ERROR, "%@ - pruned UUIDs without mappings: %@", buf, 0x16u);
}

void __76__ATXUIFeedbackPriorContext__validateCacheUpdateOrderingAndCacheDictMapping__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v5];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:v5];
  if (!(v3 | v4)) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
  }
}

- (id)_referencedClientModelCaches
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(NSMutableDictionary *)self->_blendingModelCacheUpdates allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) clientModelCacheUpdateUUIDs];
        id v10 = [v9 allValues];
        [v3 addObjectsFromArray:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v11 = (void *)[v3 copy];
  return v11;
}

- (id)validContextClassNames
{
  v2 = (void *)MEMORY[0x1B3E6F520](self, a2);
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"ATXPredictionContext", @"ATXUIFeedbackTestPredictionContext", 0);
  return v3;
}

- (ATXUIFeedbackPriorContext)initWithProtoData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1B3E6F520]();
    uint64_t v6 = [[ATXPBUIFeedbackPriorContext alloc] initWithData:v4];
    self = [(ATXUIFeedbackPriorContext *)self initWithProto:v6];

    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (ATXUIFeedbackPriorContext)initWithProto:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [v5 cacheUpdateOrderings];
      uint64_t v7 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_6);

      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v7];
      uint64_t v9 = [v5 cacheUpdateOrderingsCount];
      if (v9 == [v8 count])
      {
        v64 = v8;
        v65 = v7;
        id v10 = objc_opt_new();
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        v66 = v5;
        id v11 = [v5 blendingModelCacheUpdates];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v71 objects:v76 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v72;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v72 != v14) {
                objc_enumerationMutation(v11);
              }
              long long v16 = [[ATXBlendingModelUICacheUpdate alloc] initWithProto:*(void *)(*((void *)&v71 + 1) + 8 * i)];
              uint64_t v17 = v16;
              if (v16)
              {
                uint64_t v18 = [(ATXBlendingModelUICacheUpdate *)v16 uuid];
                [v10 setObject:v17 forKey:v18];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v71 objects:v76 count:16];
          }
          while (v13);
        }

        uint64_t v5 = v66;
        uint64_t v19 = [v66 blendingModelCacheUpdatesCount];
        if (v19 == [v10 count])
        {
          v63 = self;
          id v20 = objc_opt_new();
          long long v67 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          __int16 v21 = [v66 clientModelCacheUpdates];
          uint64_t v22 = [v21 countByEnumeratingWithState:&v67 objects:v75 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v68;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v68 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = [[ATXClientModelCacheUpdate alloc] initWithProto:*(void *)(*((void *)&v67 + 1) + 8 * j)];
                v27 = v26;
                if (v26)
                {
                  v28 = [(ATXClientModelCacheUpdate *)v26 uuid];
                  [v20 setObject:v27 forKey:v28];
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v67 objects:v75 count:16];
            }
            while (v23);
          }

          uint64_t v5 = v66;
          uint64_t v29 = [v66 clientModelCacheUpdatesCount];
          uint64_t v8 = v64;
          if (v29 == [v20 count])
          {
            v30 = [v66 contextClassString];
            uint64_t v31 = [v66 context];
            v32 = (void *)v31;
            v33 = 0;
            if (v30 && v31)
            {
              v34 = [(ATXUIFeedbackPriorContext *)v63 validContextClassNames];
              int v35 = [v34 containsObject:v30];

              if (v35) {
                v33 = (void *)[objc_alloc(NSClassFromString((NSString *)&v30->isa)) initWithProtoData:v32];
              }
              else {
                v33 = 0;
              }
            }
            v62 = v32;
            if ([v66 hasPinnedBlendingModelUICacheUpdateUUID])
            {
              id v58 = objc_alloc(MEMORY[0x1E4F29128]);
              v59 = [v66 pinnedBlendingModelUICacheUpdateUUID];
              v60 = (void *)[v58 initWithUUIDString:v59];
            }
            else
            {
              v60 = 0;
            }
            uint64_t v7 = v65;
            self = [(ATXUIFeedbackPriorContext *)v63 initWithCacheUpdateOrdering:v64 blendingModelCacheUpdates:v10 clientModelCacheUpdates:v20 context:v33 pinnedBlendingModelUICacheUpdateUUID:v60];

            v36 = self;
            uint64_t v5 = v66;
          }
          else
          {
            v30 = __atxlog_handle_blending_ecosystem();
            self = v63;
            uint64_t v7 = v65;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
              -[ATXUIFeedbackPriorContext initWithProto:](v30, v51, v52, v53, v54, v55, v56, v57);
            }
            v36 = 0;
          }
        }
        else
        {
          id v20 = __atxlog_handle_blending_ecosystem();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
            -[ATXUIFeedbackPriorContext initWithProto:](v20, v44, v45, v46, v47, v48, v49, v50);
          }
          v36 = 0;
          uint64_t v7 = v65;
        }
      }
      else
      {
        id v10 = __atxlog_handle_blending_ecosystem();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
          -[ATXUIFeedbackPriorContext initWithProto:](v10, v37, v38, v39, v40, v41, v42, v43);
        }
        v36 = 0;
      }
    }
    else
    {
      uint64_t v5 = __atxlog_handle_blending_ecosystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXLightweightClientModelCacheUpdate initWithProto:]((uint64_t)self, v5);
      }
      v36 = 0;
    }
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

id __43__ATXUIFeedbackPriorContext_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (id)proto
{
  id v3 = objc_opt_new();
  id v4 = [(NSMutableOrderedSet *)self->_cacheUpdateOrdering array];
  uint64_t v5 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_22);
  uint64_t v6 = (void *)[v5 mutableCopy];
  [v3 setCacheUpdateOrderings:v6];

  uint64_t v7 = [(NSMutableDictionary *)self->_blendingModelCacheUpdates allValues];
  uint64_t v8 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_25);
  uint64_t v9 = (void *)[v8 mutableCopy];
  [v3 setBlendingModelCacheUpdates:v9];

  id v10 = [(NSMutableDictionary *)self->_clientModelCacheUpdates allValues];
  id v11 = objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_28);
  uint64_t v12 = (void *)[v11 mutableCopy];
  [v3 setClientModelCacheUpdates:v12];

  uint64_t v13 = [(ATXProactiveSuggestionFeedbackContextProtocol *)self->_context encodeAsProto];
  [v3 setContext:v13];

  uint64_t v14 = (objc_class *)objc_opt_class();
  long long v15 = NSStringFromClass(v14);
  [v3 setContextClassString:v15];

  pinnedBlendingModelUICacheUpdateUUID = self->_pinnedBlendingModelUICacheUpdateUUID;
  if (pinnedBlendingModelUICacheUpdateUUID)
  {
    uint64_t v17 = [(NSUUID *)pinnedBlendingModelUICacheUpdateUUID UUIDString];
    [v3 setPinnedBlendingModelUICacheUpdateUUID:v17];
  }
  return v3;
}

uint64_t __34__ATXUIFeedbackPriorContext_proto__block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

uint64_t __34__ATXUIFeedbackPriorContext_proto__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 proto];
}

uint64_t __34__ATXUIFeedbackPriorContext_proto__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 proto];
}

- (id)encodeAsProto
{
  v2 = [(ATXUIFeedbackPriorContext *)self proto];
  id v3 = [v2 data];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXUIFeedbackPriorContext *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXUIFeedbackPriorContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = __atxlog_handle_blending_ecosystem();
  uint64_t v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"protobufData" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXBiomeUIContext" errorCode:-1 logHandle:v7];

  if (v8 && ([v4 error], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    self = [(ATXUIFeedbackPriorContext *)self initWithProtoData:v8];
    id v10 = self;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXUIFeedbackPriorContext *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXUIFeedbackPriorContext *)self isEqualToATXUIFeedbackPriorContext:v5];

  return v6;
}

- (BOOL)isEqualToATXUIFeedbackPriorContext:(id)a3
{
  id v4 = (id *)a3;
  cacheUpdateOrdering = self->_cacheUpdateOrdering;
  BOOL v6 = (NSMutableOrderedSet *)v4[1];
  if (cacheUpdateOrdering == v6)
  {
  }
  else
  {
    uint64_t v7 = v6;
    uint64_t v8 = cacheUpdateOrdering;
    char v9 = [(NSMutableOrderedSet *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_15;
    }
  }
  blendingModelCacheUpdates = self->_blendingModelCacheUpdates;
  id v11 = (NSMutableDictionary *)v4[2];
  if (blendingModelCacheUpdates == v11)
  {
  }
  else
  {
    uint64_t v12 = v11;
    uint64_t v13 = blendingModelCacheUpdates;
    char v14 = [(NSMutableDictionary *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_15;
    }
  }
  clientModelCacheUpdates = self->_clientModelCacheUpdates;
  long long v16 = (NSMutableDictionary *)v4[3];
  if (clientModelCacheUpdates == v16)
  {
  }
  else
  {
    uint64_t v17 = v16;
    uint64_t v18 = clientModelCacheUpdates;
    char v19 = [(NSMutableDictionary *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_15;
    }
  }
  context = self->_context;
  __int16 v21 = (ATXProactiveSuggestionFeedbackContextProtocol *)v4[4];
  if (context == v21)
  {
  }
  else
  {
    uint64_t v22 = v21;
    uint64_t v23 = context;
    char v24 = [(ATXProactiveSuggestionFeedbackContextProtocol *)v23 isEqual:v22];

    if ((v24 & 1) == 0)
    {
LABEL_15:
      char v25 = 0;
      goto LABEL_21;
    }
  }
  uint64_t v26 = self->_pinnedBlendingModelUICacheUpdateUUID;
  v27 = v26;
  if (v26 == v4[5]) {
    char v25 = 1;
  }
  else {
    char v25 = -[NSUUID isEqual:](v26, "isEqual:");
  }

LABEL_21:
  return v25;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableOrderedSet *)self->_cacheUpdateOrdering hash];
  uint64_t v4 = [(NSMutableDictionary *)self->_blendingModelCacheUpdates hash] - v3 + 32 * v3;
  uint64_t v5 = [(NSMutableDictionary *)self->_clientModelCacheUpdates hash] - v4 + 32 * v4;
  uint64_t v6 = [(ATXProactiveSuggestionFeedbackContextProtocol *)self->_context hash] - v5 + 32 * v5;
  return [(NSUUID *)self->_pinnedBlendingModelUICacheUpdateUUID hash] - v6 + 32 * v6;
}

- (NSOrderedSet)cacheUpdateOrdering
{
  return &self->_cacheUpdateOrdering->super;
}

- (NSDictionary)blendingModelCacheUpdates
{
  return &self->_blendingModelCacheUpdates->super;
}

- (NSDictionary)clientModelCacheUpdates
{
  return &self->_clientModelCacheUpdates->super;
}

- (ATXProactiveSuggestionFeedbackContextProtocol)context
{
  return self->_context;
}

- (NSUUID)pinnedBlendingModelUICacheUpdateUUID
{
  return self->_pinnedBlendingModelUICacheUpdateUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedBlendingModelUICacheUpdateUUID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_clientModelCacheUpdates, 0);
  objc_storeStrong((id *)&self->_blendingModelCacheUpdates, 0);
  objc_storeStrong((id *)&self->_cacheUpdateOrdering, 0);
}

- (void)addClientModelCacheUpdate:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_2(&dword_1AE67F000, v2, v3, "%@ - cannot add client model cache update, missing UUID", v4, v5, v6, v7, 2u);
}

- (void)addBlendingModelUICacheUpdate:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_2(&dword_1AE67F000, v2, v3, "%@ - cannot add blending ui cache update, missing UUID", v4, v5, v6, v7, 2u);
}

- (void)pruneContextStateOlderThanBlendingUUID:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = [*(id *)(a1 + 16) allKeys];
  int v9 = 138412802;
  id v10 = v7;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  __int16 v13 = 2112;
  char v14 = v8;
  _os_log_error_impl(&dword_1AE67F000, a3, OS_LOG_TYPE_ERROR, "%@ - attempting to prune blending ui cache updates for nonexisting uuid %@, current blending cache uuids: %@", (uint8_t *)&v9, 0x20u);
}

- (void)initWithProto:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AE67F000, a1, a3, "Could not deserialize all clientModelCacheUpdates from protobuf, returning nil", a5, a6, a7, a8, 0);
}

- (void)initWithProto:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AE67F000, a1, a3, "Could not deserialize all blendingModelCacheUpdates from protobuf, returning nil", a5, a6, a7, a8, 0);
}

- (void)initWithProto:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AE67F000, a1, a3, "Could not deserialize all cacheUpdateOrderings from protobuf, returning nil", a5, a6, a7, a8, 0);
}

@end