@interface STStatusDomainDataChangeRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BSIntegerSet)domainsWithData;
- (BSIntegerSet)domainsWithSignificantData;
- (NSString)description;
- (STStatusDomainDataChangeRecord)init;
- (STStatusDomainDataChangeRecord)initWithCoder:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)_initWithFallbackDataByClientKeyByDomain:(void *)a3 entriesByDomain:;
- (id)currentDataForDomain:(unint64_t)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)fallbackDataForClientKey:(id)a3 domain:(unint64_t)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)_combineTrailingDiffEntriesIfPossible:(uint64_t)a1;
- (void)addDiff:(id)a3 forClientKey:(id)a4 domain:(unint64_t)a5;
- (void)addEntriesFromDataChangeRecord:(id)a3 forDomain:(unint64_t)a4 replacingClientKeysWithKey:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateEntriesByDomainUsingBlock:(id)a3;
- (void)removeAllEntriesForClientKey:(id)a3 domain:(unint64_t)a4;
- (void)setData:(id)a3 forClientKey:(id)a4 domain:(unint64_t)a5;
- (void)setFallbackData:(id)a3 forClientKey:(id)a4 domain:(unint64_t)a5;
@end

@implementation STStatusDomainDataChangeRecord

- (void)addDiff:(id)a3 forClientKey:(id)a4 domain:(unint64_t)a5
{
  if (self) {
    entriesByDomain = self->_entriesByDomain;
  }
  else {
    entriesByDomain = 0;
  }
  v21 = entriesByDomain;
  v10 = NSNumber;
  id v11 = a4;
  id v12 = a3;
  v13 = [v10 numberWithUnsignedInteger:a5];
  v14 = [(NSMutableDictionary *)v21 objectForKey:v13];

  if (!v14)
  {
    v14 = [MEMORY[0x1E4F1CA48] array];
    v15 = [NSNumber numberWithUnsignedInteger:a5];
    [(NSMutableDictionary *)v21 setObject:v14 forKey:v15];
  }
  v16 = [[STStatusDomainDataChangeRecordDiffEntry alloc] initWithDiff:v12 clientKey:v11];

  [v14 addObject:v16];
  -[STStatusDomainDataChangeRecord _combineTrailingDiffEntriesIfPossible:]((uint64_t)self, v14);
  if (self) {
    cachedCurrentDataByDomain = self->_cachedCurrentDataByDomain;
  }
  else {
    cachedCurrentDataByDomain = 0;
  }
  v18 = NSNumber;
  v19 = cachedCurrentDataByDomain;
  v20 = [v18 numberWithUnsignedInteger:a5];
  [(NSMutableDictionary *)v19 removeObjectForKey:v20];
}

- (id)fallbackDataForClientKey:(id)a3 domain:(unint64_t)a4
{
  if (self) {
    fallbackDataByClientKeyByDomain = self->_fallbackDataByClientKeyByDomain;
  }
  else {
    fallbackDataByClientKeyByDomain = 0;
  }
  v7 = NSNumber;
  v8 = fallbackDataByClientKeyByDomain;
  id v9 = a3;
  v10 = [v7 numberWithUnsignedInteger:a4];
  id v11 = [(NSMutableDictionary *)v8 objectForKey:v10];

  id v12 = [v11 objectForKey:v9];

  return v12;
}

- (id)currentDataForDomain:(unint64_t)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (self) {
    cachedCurrentDataByDomain = self->_cachedCurrentDataByDomain;
  }
  else {
    cachedCurrentDataByDomain = 0;
  }
  v6 = cachedCurrentDataByDomain;
  v7 = [NSNumber numberWithUnsignedInteger:a3];
  v8 = [(NSMutableDictionary *)v6 objectForKey:v7];

  if (!v8)
  {
    if (self) {
      entriesByDomain = self->_entriesByDomain;
    }
    else {
      entriesByDomain = 0;
    }
    v10 = NSNumber;
    id v11 = entriesByDomain;
    id v12 = [v10 numberWithUnsignedInteger:a3];
    v13 = [(NSMutableDictionary *)v11 objectForKey:v12];

    if ([v13 count])
    {
      v14 = [v13 firstObject];
      v26 = v14;
      if ([v14 entryType])
      {
        v15 = [v14 clientKey];
        v8 = [(STStatusDomainDataChangeRecord *)self fallbackDataForClientKey:v15 domain:a3];
      }
      else
      {
        v8 = 0;
      }
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v16 = v13;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v28 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if ([v21 entryType])
            {
              v22 = [v21 diff];
              uint64_t v23 = [v8 dataByApplyingDiff:v22];

              v8 = (void *)v23;
            }
            else
            {
              [v21 data];
              v8 = v22 = v8;
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v18);
      }

      v24 = [NSNumber numberWithUnsignedInteger:a3];
      [(NSMutableDictionary *)v6 setObject:v8 forKey:v24];
    }
    else
    {

      v8 = 0;
    }
  }

  return v8;
}

- (void)_combineTrailingDiffEntriesIfPossible:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = [v3 lastObject];
    v6 = [MEMORY[0x1E4F1CA70] orderedSet];
    v7 = [MEMORY[0x1E4F1CA60] dictionary];
    if (v5)
    {
      while ([v5 entryType] == 1)
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __72__STStatusDomainDataChangeRecord__combineTrailingDiffEntriesIfPossible___block_invoke;
        v21[3] = &unk_1E6B645E8;
        id v8 = v5;
        id v22 = v8;
        id v9 = v7;
        id v23 = v9;
        if (objc_msgSend(v6, "bs_containsObjectPassingTest:", v21))
        {

          v5 = 0;
          break;
        }
        v10 = [v8 clientKey];
        id v11 = [v8 diff];
        id v12 = [v9 valueForKey:v10];
        v13 = [v12 diff];

        if (v13)
        {
          id v14 = [v11 diffByApplyingDiff:v13];
        }
        else
        {
          id v14 = v11;
        }
        v15 = v14;
        id v16 = [[STStatusDomainDataChangeRecordDiffEntry alloc] initWithDiff:v14 clientKey:v10];
        [v9 setObject:v16 forKey:v10];
        [v6 addObject:v10];
        [v4 removeLastObject];
        v5 = [v4 lastObject];

        if (!v5) {
          break;
        }
      }
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72__STStatusDomainDataChangeRecord__combineTrailingDiffEntriesIfPossible___block_invoke_2;
    v18[3] = &unk_1E6B64610;
    id v19 = v7;
    id v20 = v4;
    id v17 = v7;
    [v6 enumerateObjectsWithOptions:2 usingBlock:v18];
  }
}

BOOL __53__STStatusDomainDataChangeRecord__isDataSignificant___block_invoke(uint64_t a1, void *a2)
{
  return (*(void *)(a1 + 32) & [a2 eligibleDisplayModes]) != 0;
}

- (BSIntegerSet)domainsWithSignificantData
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F790]);
  if (self) {
    cachedCurrentDataByDomain = self->_cachedCurrentDataByDomain;
  }
  else {
    cachedCurrentDataByDomain = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__STStatusDomainDataChangeRecord_domainsWithSignificantData__block_invoke;
  v9[3] = &unk_1E6B64548;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [(NSMutableDictionary *)cachedCurrentDataByDomain enumerateKeysAndObjectsUsingBlock:v9];
  v6 = v10;
  id v7 = v5;

  return (BSIntegerSet *)v7;
}

uint64_t __72__STStatusDomainDataChangeRecord__combineTrailingDiffEntriesIfPossible___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) valueForKey:a2];
  if (v3) {
    [*(id *)(a1 + 40) addObject:v3];
  }

  return MEMORY[0x1F41817F8]();
}

void __60__STStatusDomainDataChangeRecord_domainsWithSignificantData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  if (!v5) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v12 = objc_alloc_init((Class)objc_opt_class());
      char v13 = [v6 isEqual:v12];

      if (v13) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
LABEL_6:

    goto LABEL_9;
  }
  id v7 = v6;
  uint64_t v8 = [v7 activeDisplayModes];
  id v9 = [v7 attributions];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__STStatusDomainDataChangeRecord__isDataSignificant___block_invoke;
  v15[3] = &__block_descriptor_40_e51_B16__0__STLocationStatusDomainLocationAttribution_8l;
  v15[4] = v8;
  id v10 = objc_msgSend(v9, "bs_filter:", v15);

  uint64_t v11 = [v10 count];
  if (v11) {
LABEL_8:
  }
    objc_msgSend(*(id *)(a1 + 40), "addValue:", objc_msgSend(v14, "integerValue", v14));
LABEL_9:
}

uint64_t __72__STStatusDomainDataChangeRecord__combineTrailingDiffEntriesIfPossible___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) clientKey];
  char v5 = [v4 isEqual:v3];

  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v7 = [*(id *)(a1 + 40) valueForKey:v3];
    uint64_t v8 = [v7 diff];

    id v9 = [*(id *)(a1 + 32) diff];
    LODWORD(v7) = [v9 isOrthogonalToDiff:v8];

    uint64_t v6 = v7 ^ 1;
  }

  return v6;
}

- (void)setData:(id)a3 forClientKey:(id)a4 domain:(unint64_t)a5
{
  id v21 = a3;
  id v8 = a4;
  if (v21)
  {
    id v9 = [[STStatusDomainDataChangeRecordDataEntry alloc] initWithData:v21 clientKey:v8];
    id v10 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v9, 0);
    if (self) {
      entriesByDomain = self->_entriesByDomain;
    }
    else {
      entriesByDomain = 0;
    }
    id v12 = NSNumber;
    char v13 = entriesByDomain;
    id v14 = [v12 numberWithUnsignedInteger:a5];
    [(NSMutableDictionary *)v13 setObject:v10 forKey:v14];
  }
  else
  {
    if (self) {
      v15 = self->_entriesByDomain;
    }
    else {
      v15 = 0;
    }
    id v16 = NSNumber;
    id v10 = v15;
    id v9 = [v16 numberWithUnsignedInteger:a5];
    [(NSMutableDictionary *)v10 removeObjectForKey:v9];
  }

  if (self) {
    cachedCurrentDataByDomain = self->_cachedCurrentDataByDomain;
  }
  else {
    cachedCurrentDataByDomain = 0;
  }
  uint64_t v18 = NSNumber;
  id v19 = cachedCurrentDataByDomain;
  id v20 = [v18 numberWithUnsignedInteger:a5];
  [(NSMutableDictionary *)v19 removeObjectForKey:v20];
}

- (STStatusDomainDataChangeRecord)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  char v5 = (STStatusDomainDataChangeRecord *)-[STStatusDomainDataChangeRecord _initWithFallbackDataByClientKeyByDomain:entriesByDomain:]((id *)&self->super.isa, v3, v4);

  return v5;
}

- (id)_initWithFallbackDataByClientKeyByDomain:(void *)a3 entriesByDomain:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)STStatusDomainDataChangeRecord;
    id v8 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v10 = a1[3];
      a1[3] = v9;
    }
  }

  return a1;
}

- (BSIntegerSet)domainsWithData
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (STStatusDomainDataChangeRecord *)self->_entriesByDomain;
  }
  v2 = [(STStatusDomainDataChangeRecord *)self allKeys];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4F790]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addValue:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "integerValue", (void)v11));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  id v9 = (void *)[v3 copy];

  return (BSIntegerSet *)v9;
}

- (void)setFallbackData:(id)a3 forClientKey:(id)a4 domain:(unint64_t)a5
{
  id v14 = a3;
  id v8 = a4;
  if (self) {
    fallbackDataByClientKeyByDomain = self->_fallbackDataByClientKeyByDomain;
  }
  else {
    fallbackDataByClientKeyByDomain = 0;
  }
  id v10 = fallbackDataByClientKeyByDomain;
  long long v11 = [NSNumber numberWithUnsignedInteger:a5];
  long long v12 = [(NSMutableDictionary *)v10 objectForKey:v11];

  if (!v12)
  {
    long long v12 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v13 = [NSNumber numberWithUnsignedInteger:a5];
    [(NSMutableDictionary *)v10 setObject:v12 forKey:v13];
  }
  [v12 setObject:v14 forKey:v8];
}

- (void)removeAllEntriesForClientKey:(id)a3 domain:(unint64_t)a4
{
  id v6 = a3;
  if (self) {
    fallbackDataByClientKeyByDomain = self->_fallbackDataByClientKeyByDomain;
  }
  else {
    fallbackDataByClientKeyByDomain = 0;
  }
  id v8 = fallbackDataByClientKeyByDomain;
  id v9 = [NSNumber numberWithUnsignedInteger:a4];
  id v10 = [(NSMutableDictionary *)v8 objectForKey:v9];

  [v10 removeObjectForKey:v6];
  if (![v10 count])
  {
    long long v11 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v8 removeObjectForKey:v11];
  }
  if (self) {
    entriesByDomain = self->_entriesByDomain;
  }
  else {
    entriesByDomain = 0;
  }
  long long v13 = entriesByDomain;
  id v14 = [NSNumber numberWithUnsignedInteger:a4];
  v15 = [(NSMutableDictionary *)v13 objectForKey:v14];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __70__STStatusDomainDataChangeRecord_removeAllEntriesForClientKey_domain___block_invoke;
  v23[3] = &unk_1E6B64570;
  id v16 = v6;
  id v24 = v16;
  id v17 = [v15 indexesOfObjectsPassingTest:v23];
  [v15 removeObjectsAtIndexes:v17];
  if (![v15 count])
  {
    id v22 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v13 removeObjectForKey:v22];

    if (self) {
      goto LABEL_9;
    }
LABEL_12:
    cachedCurrentDataByDomain = 0;
    goto LABEL_10;
  }
  -[STStatusDomainDataChangeRecord _combineTrailingDiffEntriesIfPossible:]((uint64_t)self, v15);
  if (!self) {
    goto LABEL_12;
  }
LABEL_9:
  cachedCurrentDataByDomain = self->_cachedCurrentDataByDomain;
LABEL_10:
  id v19 = NSNumber;
  id v20 = cachedCurrentDataByDomain;
  id v21 = [v19 numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)v20 removeObjectForKey:v21];
}

uint64_t __70__STStatusDomainDataChangeRecord_removeAllEntriesForClientKey_domain___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 clientKey];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)addEntriesFromDataChangeRecord:(id)a3 forDomain:(unint64_t)a4 replacingClientKeysWithKey:(id)a5
{
  id v8 = a5;
  if (a3) {
    id v9 = (void *)*((void *)a3 + 2);
  }
  else {
    id v9 = 0;
  }
  id v10 = NSNumber;
  id v11 = v9;
  long long v12 = [v10 numberWithUnsignedInteger:a4];
  long long v13 = [v11 objectForKey:v12];

  if (v13)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __102__STStatusDomainDataChangeRecord_addEntriesFromDataChangeRecord_forDomain_replacingClientKeysWithKey___block_invoke;
    v26 = &unk_1E6B64598;
    long long v27 = self;
    id v28 = v8;
    objc_msgSend(v13, "bs_map:", &v23);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (self)
    {
      v15 = self->_entriesByDomain;
      id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a4, v23, v24, v25, v26, v27);
      id v17 = [(NSMutableDictionary *)v15 objectForKey:v16];

      if (!v17)
      {
        id v17 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v18 = [NSNumber numberWithUnsignedInteger:a4];
        [(NSMutableDictionary *)v15 setObject:v17 forKey:v18];
      }
      [v17 addObjectsFromArray:v14];
      -[STStatusDomainDataChangeRecord _combineTrailingDiffEntriesIfPossible:]((uint64_t)self, v17);
      cachedCurrentDataByDomain = self->_cachedCurrentDataByDomain;
      id v20 = NSNumber;
      id v21 = cachedCurrentDataByDomain;
      id v22 = [v20 numberWithUnsignedInteger:a4];
      [(NSMutableDictionary *)v21 removeObjectForKey:v22];
    }
  }
}

id __102__STStatusDomainDataChangeRecord_addEntriesFromDataChangeRecord_forDomain_replacingClientKeysWithKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = v2;
  if (v3)
  {
    if ([v4 entryType])
    {
      id v6 = [STStatusDomainDataChangeRecordDiffEntry alloc];
      uint64_t v7 = [v4 diff];
      uint64_t v8 = [(STStatusDomainDataChangeRecordDiffEntry *)v6 initWithDiff:v7 clientKey:v5];
    }
    else
    {
      id v9 = [STStatusDomainDataChangeRecordDataEntry alloc];
      uint64_t v7 = [v4 data];
      uint64_t v8 = [(STStatusDomainDataChangeRecordDataEntry *)v9 initWithData:v7 clientKey:v5];
    }
    id v10 = (void *)v8;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)enumerateEntriesByDomainUsingBlock:(id)a3
{
  id v4 = a3;
  if (self) {
    entriesByDomain = self->_entriesByDomain;
  }
  else {
    entriesByDomain = 0;
  }
  id v6 = entriesByDomain;
  uint64_t v7 = [(STStatusDomainDataChangeRecord *)self domainsWithData];
  uint64_t v8 = (void *)[v7 copy];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__STStatusDomainDataChangeRecord_enumerateEntriesByDomainUsingBlock___block_invoke;
  v11[3] = &unk_1E6B645C0;
  long long v12 = v6;
  id v13 = v4;
  id v9 = v4;
  id v10 = v6;
  [v8 enumerateWithBlock:v11];
}

void __69__STStatusDomainDataChangeRecord_enumerateEntriesByDomainUsingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = [NSNumber numberWithInteger:a2];
  uint64_t v7 = [v5 objectForKey:v6];
  uint64_t v8 = (void *)[v7 copy];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  *a3 = 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  if (self) {
    fallbackDataByClientKeyByDomain = self->_fallbackDataByClientKeyByDomain;
  }
  else {
    fallbackDataByClientKeyByDomain = 0;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __42__STStatusDomainDataChangeRecord_isEqual___block_invoke;
  v18[3] = &unk_1E6B63058;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendObject:fallbackDataByClientKeyByDomain counterpart:v18];
  if (self) {
    self = (STStatusDomainDataChangeRecord *)self->_entriesByDomain;
  }
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __42__STStatusDomainDataChangeRecord_isEqual___block_invoke_2;
  id v16 = &unk_1E6B63058;
  id v17 = v7;
  id v9 = v7;
  id v10 = (id)[v5 appendObject:self counterpart:&v13];
  char v11 = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return v11;
}

id __42__STStatusDomainDataChangeRecord_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return *(id *)(v1 + 8);
  }
  else {
    return 0;
  }
}

id __42__STStatusDomainDataChangeRecord_isEqual___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return *(id *)(v1 + 16);
  }
  else {
    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = v3;
  if (self)
  {
    id v5 = (id)[v3 appendObject:self->_fallbackDataByClientKeyByDomain];
    entriesByDomain = self->_entriesByDomain;
  }
  else
  {
    id v10 = (id)[v3 appendObject:0];
    entriesByDomain = 0;
  }
  id v7 = (id)[v4 appendObject:entriesByDomain];
  unint64_t v8 = [v4 hash];

  return v8;
}

- (NSString)description
{
  return (NSString *)[(STStatusDomainDataChangeRecord *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STStatusDomainDataChangeRecord *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(STStatusDomainDataChangeRecord *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = -[STStatusDomainDataChangeRecord _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  id v4 = [v3 build];

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  if (a1)
  {
    id v5 = a2;
    id v6 = [a1 succinctDescriptionBuilder];
    [v6 setUseDebugDescription:a3];
    [v6 setActiveMultilinePrefix:v5];

    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    unint64_t v8 = (void *)a1[2];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__STStatusDomainDataChangeRecord__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v12[3] = &unk_1E6B64658;
    id v13 = v7;
    id v9 = v7;
    [v8 enumerateKeysAndObjectsUsingBlock:v12];
    id v10 = [v6 activeMultilinePrefix];
    [v6 appendDictionarySection:v9 withName:@"entries" multilinePrefix:v10 skipIfEmpty:1];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STStatusDomainDataChangeRecord _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __82__STStatusDomainDataChangeRecord__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  unint64_t v6 = [a2 integerValue];
  id v7 = STSystemStatusDescriptionForDomain(v6);
  unint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", v6);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v10 = v9;

  [*(id *)(a1 + 32) setObject:v5 forKey:v10];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (self)
  {
    [a3 encodeObject:self->_fallbackDataByClientKeyByDomain forKey:@"fallbackDataByClientKeyByDomain"];
    entriesByDomain = self->_entriesByDomain;
  }
  else
  {
    [a3 encodeObject:0 forKey:@"fallbackDataByClientKeyByDomain"];
    entriesByDomain = 0;
  }
  [a3 encodeObject:entriesByDomain forKey:@"entriesByDomain"];
}

- (STStatusDomainDataChangeRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
  unint64_t v6 = STValidStatusDomainDataTypes();
  id v7 = (void *)[v5 initWithSet:v6];

  [v7 addObject:objc_opt_class()];
  [v7 addObject:objc_opt_class()];
  [v7 addObject:objc_opt_class()];
  id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"fallbackDataByClientKeyByDomain"];
  self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v11 = 0;
LABEL_10:
    id v22 = 0;
    goto LABEL_17;
  }
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  long long v27 = __89__STStatusDomainDataChangeRecord__validatedFallbackDataByClientKeyByDomainForDictionary___block_invoke;
  id v28 = &unk_1E6B646A8;
  long long v30 = &v31;
  id v10 = v9;
  id v29 = v10;
  [v8 enumerateKeysAndObjectsUsingBlock:&v25];
  if (*((unsigned char *)v32 + 24)) {
    id v11 = 0;
  }
  else {
    id v11 = v10;
  }

  _Block_object_dispose(&v31, 8);
  if (!v11) {
    goto LABEL_10;
  }
  uint64_t v24 = self;
  long long v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  id v17 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, objc_opt_class(), 0);
  id v18 = [v4 decodeObjectOfClasses:v17 forKey:@"entriesByDomain"];
  self;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    long long v27 = __73__STStatusDomainDataChangeRecord__validatedEntriesByDomainForDictionary___block_invoke;
    id v28 = &unk_1E6B646D0;
    long long v30 = &v31;
    id v20 = v19;
    id v29 = v20;
    [v18 enumerateKeysAndObjectsUsingBlock:&v25];
    self = v24;
    if (*((unsigned char *)v32 + 24)) {
      id v21 = 0;
    }
    else {
      id v21 = v20;
    }

    _Block_object_dispose(&v31, 8);
    if (v21)
    {
      self = -[STStatusDomainDataChangeRecord _initWithFallbackDataByClientKeyByDomain:entriesByDomain:]((id *)&v24->super.isa, v11, v21);
      id v22 = self;
    }
    else
    {
      id v22 = 0;
    }
  }
  else
  {

    id v21 = 0;
    id v22 = 0;
    self = v24;
  }

LABEL_17:
  return v22;
}

void __92__STStatusDomainDataChangeRecord__validatedFallbackDataByClientKeyForDictionary_domainName___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && STIsValidDataForStatusDomain(v7))
  {
    [*(id *)(a1 + 32) setObject:v7 forKey:v8];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __89__STStatusDomainDataChangeRecord__validatedFallbackDataByClientKeyByDomainForDictionary___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v13 = a2;
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_12;
  }
  uint64_t v8 = [v13 integerValue];
  id v9 = v7;
  self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_10:
    id v12 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_11;
  }
  id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__STStatusDomainDataChangeRecord__validatedFallbackDataByClientKeyForDictionary_domainName___block_invoke;
  v14[3] = &unk_1E6B64680;
  uint64_t v16 = &v18;
  uint64_t v17 = v8;
  id v11 = v10;
  id v15 = v11;
  [v9 enumerateKeysAndObjectsUsingBlock:v14];
  if (*((unsigned char *)v19 + 24)) {
    id v12 = 0;
  }
  else {
    id v12 = v11;
  }

  _Block_object_dispose(&v18, 8);
  if (!v12) {
    goto LABEL_10;
  }
  [*(id *)(a1 + 32) setObject:v12 forKey:v13];
LABEL_11:

LABEL_12:
}

void __73__STStatusDomainDataChangeRecord__validatedEntriesByDomainForDictionary___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v16 = v8;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
              goto LABEL_14;
            }
          }
          [v9 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a4 = 1;
    }
    else {
      [*(id *)(a1 + 32) setObject:v9 forKey:v7];
    }

    id v8 = v16;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCurrentDataByDomain, 0);
  objc_storeStrong((id *)&self->_entriesByDomain, 0);

  objc_storeStrong((id *)&self->_fallbackDataByClientKeyByDomain, 0);
}

@end