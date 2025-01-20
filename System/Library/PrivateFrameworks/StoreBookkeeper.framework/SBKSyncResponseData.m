@interface SBKSyncResponseData
+ (id)deserializedResponseBodyWithTransaction:(id)a3 responseDictionary:(id)a4 response:(id)a5;
- (NSArray)conflictedKeys;
- (NSArray)deletedKeys;
- (NSArray)successfullyDeletedKeys;
- (NSArray)successfullyUpdatedKeys;
- (NSArray)updatedKeys;
- (NSMutableDictionary)responseOpEntiesByKey;
- (NSString)syncAnchor;
- (SBKSyncResponseData)initWithTransaction:(id)a3 responseDictionary:(id)a4 response:(id)a5;
- (SBKSyncTransaction)transaction;
- (id)description;
- (id)payloadDataForUpdateResponseKey:(id)a3;
- (void)_deserializeResponseDictionary:(id)a3 response:(id)a4;
- (void)setResponseOpEntiesByKey:(id)a3;
@end

@implementation SBKSyncResponseData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseOpEntiesByKey, 0);
  objc_storeStrong((id *)&self->_successfullyDeletedKeys, 0);
  objc_storeStrong((id *)&self->_successfullyUpdatedKeys, 0);
  objc_storeStrong((id *)&self->_deletedKeys, 0);
  objc_storeStrong((id *)&self->_conflictedKeys, 0);
  objc_storeStrong((id *)&self->_updatedKeys, 0);
  objc_storeStrong((id *)&self->_syncAnchor, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

- (void)setResponseOpEntiesByKey:(id)a3
{
}

- (NSMutableDictionary)responseOpEntiesByKey
{
  return self->_responseOpEntiesByKey;
}

- (NSArray)successfullyDeletedKeys
{
  return self->_successfullyDeletedKeys;
}

- (NSArray)successfullyUpdatedKeys
{
  return self->_successfullyUpdatedKeys;
}

- (NSArray)deletedKeys
{
  return self->_deletedKeys;
}

- (NSArray)conflictedKeys
{
  return self->_conflictedKeys;
}

- (NSArray)updatedKeys
{
  return self->_updatedKeys;
}

- (NSString)syncAnchor
{
  return self->_syncAnchor;
}

- (SBKSyncTransaction)transaction
{
  return self->_transaction;
}

- (void)_deserializeResponseDictionary:(id)a3 response:(id)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke;
    v20[3] = &unk_2648AF0F0;
    id v7 = v5;
    id v21 = v7;
    v8 = (void (**)(void, void, void, void, void))MEMORY[0x230F4DE10](v20);
    ((void (**)(void, NSArray *, __CFString *, __CFString *, void *))v8)[2](v8, self->_deletedKeys, @"peer-ops", @"deletes", &__block_literal_global_201);
    updatedKeys = self->_updatedKeys;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke_4;
    v19[3] = &unk_2648AF138;
    v19[4] = self;
    ((void (**)(void, NSArray *, __CFString *, __CFString *, void *))v8)[2](v8, updatedKeys, @"peer-ops", @"puts", v19);
    ((void (**)(void, NSArray *, __CFString *, __CFString *, void *))v8)[2](v8, self->_conflictedKeys, @"ops", @"rejected", &__block_literal_global_53);
    successfullyUpdatedKeys = self->_successfullyUpdatedKeys;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke_54;
    v18[3] = &unk_2648AF138;
    v18[4] = self;
    ((void (**)(void, NSArray *, __CFString *, __CFString *, void *))v8)[2](v8, successfullyUpdatedKeys, @"ops", @"put-ok", v18);
    successfullyDeletedKeys = self->_successfullyDeletedKeys;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke_2_55;
    v17[3] = &unk_2648AF138;
    v17[4] = self;
    ((void (**)(void, NSArray *, __CFString *, __CFString *, void *))v8)[2](v8, successfullyDeletedKeys, @"ops", @"deleted-ok", v17);
    v12 = [v7 valueForKey:@"version"];
    syncAnchor = self->_syncAnchor;
    self->_syncAnchor = v12;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v14 = objc_opt_respondsToSelector();
      v15 = self->_syncAnchor;
      if (v14)
      {
        v16 = [(NSString *)v15 stringValue];
        v15 = self->_syncAnchor;
      }
      else
      {
        v16 = 0;
      }
      self->_syncAnchor = v16;
    }
  }
}

void __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v42[1] = *MEMORY[0x263EF8340];
  id v29 = a2;
  id v9 = a3;
  id v26 = a4;
  id v10 = a5;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke_2;
  v38[3] = &unk_2648AF0C8;
  id v22 = v10;
  id v39 = v22;
  v11 = (unsigned int (**)(void, void, void))MEMORY[0x230F4DE10](v38);
  v23 = v9;
  v12 = [*(id *)(a1 + 32) objectForKey:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v42[0] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:1];

    v12 = (void *)v13;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v12;
  uint64_t v27 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v27)
  {
    uint64_t v25 = *(void *)v35;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v14;
        v15 = [*(id *)(*((void *)&v34 + 1) + 8 * v14) objectForKey:v26];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v40 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v31 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              id v21 = [v20 objectForKey:@"key"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && [v21 length]
                && ((unsigned int (**)(void, void *, void *))v11)[2](v11, v20, v21))
              {
                [v29 addObject:v21];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v40 count:16];
          }
          while (v17);
        }

        uint64_t v14 = v28 + 1;
      }
      while (v28 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
    }
    while (v27);
  }
}

uint64_t __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1;
}

uint64_t __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke_54(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "containsObject:") ^ 1;
}

uint64_t __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke_2_55(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "containsObject:") ^ 1;
}

uint64_t __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 objectForKey:@"reason"];
  int v7 = [v6 isEqual:@"oversize"];

  if (v7)
  {
    v8 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_22B807000, v8, OS_LOG_TYPE_ERROR, "ERROR: server rejected %@ because the payload was too big.", (uint8_t *)&v12, 0xCu);
    }
  }
  id v9 = [v4 objectForKey:@"reason"];
  uint64_t v10 = [v9 isEqual:@"conflicted"];

  return v10;
}

uint64_t __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke_3()
{
  return 1;
}

uint64_t __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return (*(uint64_t (**)(void))(v1 + 16))();
  }
  else {
    return 1;
  }
}

- (id)payloadDataForUpdateResponseKey:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_responseOpEntiesByKey objectForKey:a3];
  id v4 = [v3 objectForKey:@"value"];

  id v5 = [v4 SBKDataByInflatingWithNoZipHeader];
  if (!v5) {
    id v5 = v4;
  }

  return v5;
}

- (id)description
{
  v15 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)SBKSyncResponseData;
  v3 = [(SBKSyncResponseData *)&v16 description];
  syncAnchor = self->_syncAnchor;
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_successfullyUpdatedKeys, "count"));
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_successfullyDeletedKeys, "count"));
  int v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_updatedKeys, "count"));
  v8 = shortArrayDescription(self->_updatedKeys);
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_conflictedKeys, "count"));
  uint64_t v10 = shortArrayDescription(self->_conflictedKeys);
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_deletedKeys, "count"));
  int v12 = shortArrayDescription(self->_deletedKeys);
  id v13 = [v15 stringWithFormat:@"%@ response: syncAnchor = %@\n\nput-oks(%@), delete-oks(%@), updatedKeys(%@) = %@\n\nconflictedKeys(%@) = %@\n\ndeletedKeys(%@) = %@\n\n", v3, syncAnchor, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (SBKSyncResponseData)initWithTransaction:(id)a3 responseDictionary:(id)a4 response:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)SBKSyncResponseData;
  int v12 = [(SBKSyncResponseData *)&v27 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_transaction, a3);
    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    responseOpEntiesByKey = v13->_responseOpEntiesByKey;
    v13->_responseOpEntiesByKey = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x263EFF980] array];
    updatedKeys = v13->_updatedKeys;
    v13->_updatedKeys = (NSArray *)v16;

    uint64_t v18 = [MEMORY[0x263EFF980] array];
    deletedKeys = v13->_deletedKeys;
    v13->_deletedKeys = (NSArray *)v18;

    uint64_t v20 = [MEMORY[0x263EFF980] array];
    conflictedKeys = v13->_conflictedKeys;
    v13->_conflictedKeys = (NSArray *)v20;

    uint64_t v22 = [MEMORY[0x263EFF980] array];
    successfullyUpdatedKeys = v13->_successfullyUpdatedKeys;
    v13->_successfullyUpdatedKeys = (NSArray *)v22;

    uint64_t v24 = [MEMORY[0x263EFF980] array];
    successfullyDeletedKeys = v13->_successfullyDeletedKeys;
    v13->_successfullyDeletedKeys = (NSArray *)v24;

    [(SBKSyncResponseData *)v13 _deserializeResponseDictionary:v10 response:v11];
  }

  return v13;
}

+ (id)deserializedResponseBodyWithTransaction:(id)a3 responseDictionary:(id)a4 response:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTransaction:v9 responseDictionary:v8 response:v7];

  return v10;
}

@end