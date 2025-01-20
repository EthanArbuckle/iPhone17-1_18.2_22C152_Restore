@interface STStatusDomainDataChangeLog
- (BSIntegerSet)domainsWithData;
- (STStatusDomainDataChangeLog)initWithRecordKeys:(id)a3;
- (id)currentDataForDomain:(unint64_t)a3;
- (id)recordForKey:(id)a3;
@end

@implementation STStatusDomainDataChangeLog

- (id)recordForKey:(id)a3
{
  if (self) {
    self = (STStatusDomainDataChangeLog *)self->_recordsByKey;
  }
  return (id)[(STStatusDomainDataChangeLog *)self objectForKey:a3];
}

- (id)currentDataForDomain:(unint64_t)a3
{
  if (self) {
    recordsByKey = self->_recordsByKey;
  }
  else {
    recordsByKey = 0;
  }
  v6 = recordsByKey;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  if (self) {
    sortedRecordKeys = self->_sortedRecordKeys;
  }
  else {
    sortedRecordKeys = 0;
  }
  v8 = sortedRecordKeys;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__STStatusDomainDataChangeLog_currentDataForDomain___block_invoke;
  v12[3] = &unk_1E6B64520;
  v9 = v6;
  v13 = v9;
  v14 = &v16;
  unint64_t v15 = a3;
  [(NSOrderedSet *)v8 enumerateObjectsWithOptions:2 usingBlock:v12];

  id v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

void __52__STStatusDomainDataChangeLog_currentDataForDomain___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v9 = [*(id *)(a1 + 32) objectForKey:a2];
  uint64_t v6 = [v9 currentDataForDomain:*(void *)(a1 + 48)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

- (STStatusDomainDataChangeLog)initWithRecordKeys:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)STStatusDomainDataChangeLog;
  v5 = [(STStatusDomainDataChangeLog *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sortedRecordKeys = v5->_sortedRecordKeys;
    v5->_sortedRecordKeys = (NSOrderedSet *)v6;

    v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
          unint64_t v15 = objc_alloc_init(STStatusDomainDataChangeRecord);
          objc_msgSend(v8, "setObject:forKey:", v15, v14, (void)v19);

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v11);
    }

    uint64_t v16 = [v8 copy];
    recordsByKey = v5->_recordsByKey;
    v5->_recordsByKey = (NSDictionary *)v16;
  }
  return v5;
}

- (BSIntegerSet)domainsWithData
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F790]);
  if (self) {
    self = (STStatusDomainDataChangeLog *)self->_recordsByKey;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__STStatusDomainDataChangeLog_domainsWithData__block_invoke;
  v6[3] = &unk_1E6B644F8;
  id v4 = v3;
  id v7 = v4;
  [(STStatusDomainDataChangeLog *)self enumerateKeysAndObjectsUsingBlock:v6];

  return (BSIntegerSet *)v4;
}

void __46__STStatusDomainDataChangeLog_domainsWithData__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 domainsWithData];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__STStatusDomainDataChangeLog_domainsWithData__block_invoke_2;
  v5[3] = &unk_1E6B644D0;
  id v6 = *(id *)(a1 + 32);
  [v4 enumerateWithBlock:v5];
}

uint64_t __46__STStatusDomainDataChangeLog_domainsWithData__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addValue:a2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsByKey, 0);

  objc_storeStrong((id *)&self->_sortedRecordKeys, 0);
}

@end