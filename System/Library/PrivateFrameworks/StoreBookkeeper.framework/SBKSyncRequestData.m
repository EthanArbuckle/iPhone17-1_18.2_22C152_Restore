@interface SBKSyncRequestData
- (BOOL)_needsConflictDetection;
- (id)_serializableConflictDetectionOrdinalForKey:(id)a3;
- (id)_serializableConflictDetectionValue;
- (id)_serializableDeleteItemPayloadDictionaryForKey:(id)a3;
- (id)_serializableUpdateItemPayloadDictionaryForKey:(id)a3;
- (id)serializableRequestBodyPropertyList;
@end

@implementation SBKSyncRequestData

- (id)_serializableDeleteItemPayloadDictionaryForKey:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = @"op";
  v10[1] = @"key";
  v11[0] = @"delete";
  v11[1] = a3;
  v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v11 forKeys:v10 count:2];
  v7 = (void *)[v6 mutableCopy];

  v8 = [(SBKSyncRequestData *)self _serializableConflictDetectionOrdinalForKey:v5];

  if (v8) {
    [v7 setObject:v8 forKey:@"ordinal"];
  }

  return v7;
}

- (id)_serializableUpdateItemPayloadDictionaryForKey:(id)a3
{
  v17[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SBKSyncRequestData *)self syncTransaction];
  v6 = [v5 keyValuePairForUpdatedKey:v4];
  v7 = [v6 kvsPayload];

  if (v7)
  {
    uint64_t v8 = [v7 SBKDataByDeflatingWithNoZipHeader];
    v9 = (void *)v8;
    if (v8) {
      v10 = (void *)v8;
    }
    else {
      v10 = v7;
    }
    id v11 = v10;

    v16[0] = @"op";
    v16[1] = @"key";
    v17[0] = @"put";
    v17[1] = v4;
    v16[2] = @"value";
    v17[2] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];

    v13 = (void *)[v12 mutableCopy];
    v14 = [(SBKSyncRequestData *)self _serializableConflictDetectionOrdinalForKey:v4];
    if (v14) {
      [v13 setObject:v14 forKey:@"ordinal"];
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_needsConflictDetection
{
  v2 = [(SBKSyncRequestData *)self syncTransaction];
  BOOL v3 = [v2 conflictDetectionType] != 0;

  return v3;
}

- (id)_serializableConflictDetectionOrdinalForKey:(id)a3
{
  id v4 = a3;
  if ([(SBKSyncRequestData *)self _needsConflictDetection])
  {
    id v5 = [(SBKSyncRequestData *)self syncTransaction];
    v6 = [v5 conflictDetectionOrdinalForKey:v4];

    if (v6)
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v6, "longLongValue"));
      goto LABEL_6;
    }
  }
  else
  {
    v6 = 0;
  }
  v7 = 0;
LABEL_6:

  return v7;
}

- (id)_serializableConflictDetectionValue
{
  v12[3] = *MEMORY[0x263EF8340];
  if ([(SBKSyncRequestData *)self _needsConflictDetection])
  {
    v11[0] = &unk_26DF16B30;
    v11[1] = &unk_26DF16B48;
    v12[0] = @"none";
    v12[1] = @"ordinal";
    v11[2] = &unk_26DF16B60;
    v12[2] = @"version";
    BOOL v3 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
    id v4 = NSNumber;
    id v5 = [(SBKSyncRequestData *)self syncTransaction];
    v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "conflictDetectionType"));
    v7 = [v3 objectForKey:v6];

    if ([(__CFString *)v7 isEqualToString:@"none"])
    {
      uint64_t v8 = 0;
    }
    else
    {
      if (v7) {
        v9 = v7;
      }
      else {
        v9 = @"none";
      }
      uint64_t v8 = v9;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)serializableRequestBodyPropertyList
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  context = (void *)MEMORY[0x230F4DC00](self, a2);
  BOOL v3 = [MEMORY[0x263EFF980] array];
  id v4 = [MEMORY[0x263EFF980] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v5 = [(SBKSyncRequestData *)self syncTransaction];
  v6 = [v5 keysToUpdate];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v12 = [(SBKSyncRequestData *)self _serializableUpdateItemPayloadDictionaryForKey:v11];
        if (v12)
        {
          [v3 addObject:v12];
        }
        else
        {
          v13 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v11;
            _os_log_impl(&dword_22B807000, v13, OS_LOG_TYPE_DEFAULT, "WARNING: no data was provided for updated key %@, skipping just that item", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v8);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v14 = [(SBKSyncRequestData *)self syncTransaction];
  v15 = [v14 keysToDelete];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [(SBKSyncRequestData *)self _serializableDeleteItemPayloadDictionaryForKey:*(void *)(*((void *)&v32 + 1) + 8 * j)];
        [v4 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v17);
  }

  v21 = [(SBKSyncRequestData *)self _serializableConflictDetectionValue];
  v22 = [v3 arrayByAddingObjectsFromArray:v4];
  v40[0] = @"domain";
  v23 = [(SBKSyncRequestData *)self syncTransaction];
  v24 = [v23 domain];
  v41[0] = v24;
  v40[1] = @"version";
  v25 = [(SBKSyncRequestData *)self syncTransaction];
  v26 = [v25 syncAnchor];
  v40[2] = @"ops";
  v41[1] = v26;
  v41[2] = v22;
  v27 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];
  v28 = (void *)[v27 mutableCopy];

  if ([v21 length]) {
    [v28 setObject:v21 forKey:@"conflict-detection"];
  }
  v29 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v28;
    _os_log_impl(&dword_22B807000, v29, OS_LOG_TYPE_DEFAULT, "Sync request payload (plist): %@", buf, 0xCu);
  }

  return v28;
}

@end