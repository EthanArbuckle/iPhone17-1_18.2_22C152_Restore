@interface WDList
- (BOOL)isAnyListLevelOverridden;
- (WDList)initWithDocument:(id)a3 listId:(int)a4 listDefinitionId:(int)a5;
- (id)addLevelOverrideWithLevel:(unsigned __int8)a3;
- (id)description;
- (id)levelOverrideAt:(unint64_t)a3;
- (id)levelOverrideForLevel:(unsigned __int8)a3;
- (id)levelOverrides;
- (int)listDefinitionId;
- (int)listId;
- (unint64_t)levelOverrideCount;
- (void)removeLevelOverride:(id)a3;
@end

@implementation WDList

- (unint64_t)levelOverrideCount
{
  return [(NSMutableArray *)self->mLevelOverrides count];
}

- (id)levelOverrideAt:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mLevelOverrides objectAtIndex:a3];
}

- (id)levelOverrideForLevel:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->mLevelOverrides;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "level", (void)v11) == v3)
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

- (id)addLevelOverrideWithLevel:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v5 = [WDListLevelOverride alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  v7 = [(WDListLevelOverride *)v5 initWithDocument:WeakRetained level:v3];

  [(NSMutableArray *)self->mLevelOverrides addObject:v7];
  return v7;
}

- (void)removeLevelOverride:(id)a3
{
}

- (id)levelOverrides
{
  return self->mLevelOverrides;
}

- (BOOL)isAnyListLevelOverridden
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->mLevelOverrides;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isListLevelOverridden", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (WDList)initWithDocument:(id)a3 listId:(int)a4 listDefinitionId:(int)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WDList;
  long long v9 = [(WDList *)&v14 init];
  long long v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->mDocument, v8);
    v10->mListId = a4;
    v10->mListDefinitionId = a5;
    long long v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mLevelOverrides = v10->mLevelOverrides;
    v10->mLevelOverrides = v11;
  }
  return v10;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDList;
  v2 = [(WDList *)&v4 description];
  return v2;
}

- (int)listId
{
  return self->mListId;
}

- (int)listDefinitionId
{
  return self->mListDefinitionId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLevelOverrides, 0);
  objc_destroyWeak((id *)&self->mDocument);
}

@end