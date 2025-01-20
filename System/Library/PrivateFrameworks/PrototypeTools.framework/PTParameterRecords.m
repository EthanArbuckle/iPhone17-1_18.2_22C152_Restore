@interface PTParameterRecords
- (NSMutableDictionary)recordDictionary;
- (PTParameterRecords)initWithDictionary:(id)a3;
- (void)addRecordWithKeyPath:(id)a3 domainID:(id)a4 recordClassName:(id)a5 value:(id)a6;
- (void)removeRecordWithKeyPath:(id)a3 domainID:(id)a4;
- (void)setRecordDictionary:(id)a3;
@end

@implementation PTParameterRecords

- (PTParameterRecords)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PTParameterRecords;
  v5 = [(PTParameterRecords *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(PTParameterRecords *)v5 setRecordDictionary:v4];
    if (!_parameterRecordsQueue)
    {
      dispatch_queue_t v7 = dispatch_queue_create("com.apple.PrototypeTools.PTParameterRecords", 0);
      v8 = (void *)_parameterRecordsQueue;
      _parameterRecordsQueue = (uint64_t)v7;
    }
  }

  return v6;
}

- (void)addRecordWithKeyPath:(id)a3 domainID:(id)a4 recordClassName:(id)a5 value:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = _parameterRecordsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PTParameterRecords_addRecordWithKeyPath_domainID_recordClassName_value___block_invoke;
  block[3] = &unk_1E63BC808;
  block[4] = self;
  id v20 = v11;
  id v21 = v10;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  dispatch_async(v14, block);
}

void __74__PTParameterRecords_addRecordWithKeyPath_domainID_recordClassName_value___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) recordDictionary];
  v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (!v3)
  {
    id v4 = [*(id *)(a1 + 32) recordDictionary];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v4 setValue:v5 forKey:*(void *)(a1 + 40)];
  }
  if ([*(id *)(a1 + 48) isEqual:&stru_1F19C8540])
  {
    v6 = PTLogObjectForTopic(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BEC4F000, v6, OS_LOG_TYPE_DEFAULT, "keyPath is an empty string.", buf, 2u);
    }
  }
  else
  {
    id v18 = [*(id *)(a1 + 48) componentsSeparatedByString:@"."];
    dispatch_queue_t v7 = [*(id *)(a1 + 32) recordDictionary];
    v8 = [v7 objectForKey:*(void *)(a1 + 40)];

    if ([v18 count] == 1)
    {
      v9 = v8;
    }
    else
    {
      unint64_t v10 = 0;
      do
      {
        id v11 = [v18 objectAtIndexedSubscript:v10];
        id v12 = [v8 objectForKey:v11];

        if (!v12)
        {
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v14 = [v18 objectAtIndexedSubscript:v10];
          [v8 setValue:v13 forKey:v14];
        }
        id v15 = [v18 objectAtIndexedSubscript:v10];
        v9 = [v8 objectForKey:v15];

        ++v10;
        v8 = v9;
      }
      while ([v18 count] - 1 > v10);
    }
    id v16 = [[PTParameterRecordLeaf alloc] initWithRecordClassName:*(void *)(a1 + 56) value:*(void *)(a1 + 64)];
    id v17 = [v18 lastObject];
    [v9 setValue:v16 forKey:v17];
  }
}

- (void)removeRecordWithKeyPath:(id)a3 domainID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _parameterRecordsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PTParameterRecords_removeRecordWithKeyPath_domainID___block_invoke;
  block[3] = &unk_1E63BC628;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __55__PTParameterRecords_removeRecordWithKeyPath_domainID___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) recordDictionary];
  v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    id v21 = [*(id *)(a1 + 48) componentsSeparatedByString:@"."];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = [*(id *)(a1 + 32) recordDictionary];
    id v7 = [v6 objectForKey:*(void *)(a1 + 40)];

    [v5 addObject:*(void *)(a1 + 40)];
    if ([v21 count])
    {
      unint64_t v8 = 0;
      id v9 = v21;
      while (1)
      {
        id v10 = [v9 objectAtIndexedSubscript:v8];
        id v11 = [v7 objectForKey:v10];

        if (!v11) {
          break;
        }
        id v12 = [v7 allKeys];
        unint64_t v13 = [v12 count];

        if (v13 >= 2)
        {
          uint64_t v14 = [v5 copy];

          id v4 = (id)v14;
        }
        id v15 = [v21 objectAtIndexedSubscript:v8];
        [v5 addObject:v15];

        ++v8;
        id v7 = v11;
        BOOL v16 = [v21 count] > v8;
        id v9 = v21;
        if (!v16) {
          goto LABEL_11;
        }
      }
    }
    else
    {
      id v11 = v7;
LABEL_11:
      id v17 = [*(id *)(a1 + 32) recordDictionary];

      if ([v4 count])
      {
        unint64_t v18 = 0;
        do
        {
          v19 = [v4 objectAtIndexedSubscript:v18];
          id v7 = [v17 objectForKey:v19];

          ++v18;
          id v17 = v7;
        }
        while ([v4 count] > v18);
      }
      else
      {
        id v7 = v17;
      }
      id v20 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "count"));
      [v7 removeObjectForKey:v20];
    }
  }
}

- (NSMutableDictionary)recordDictionary
{
  return self->_recordDictionary;
}

- (void)setRecordDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end