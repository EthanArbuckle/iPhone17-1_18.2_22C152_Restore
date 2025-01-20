@interface SCWZone
- (BOOL)isDirty;
- (BOOL)needsFirstSync;
- (NSArray)clientRecords;
- (SCWZone)initWithSchema:(id)a3 store:(id)a4;
- (SCWZoneDiff)clientDiff;
- (SCWZoneSchema)schema;
- (SCWZoneStore)store;
- (void)setStore:(id)a3;
@end

@implementation SCWZone

- (SCWZone)initWithSchema:(id)a3 store:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCWZone;
  v9 = [(SCWZone *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_schema, a3);
    objc_storeStrong((id *)&v10->_store, a4);
  }

  return v10;
}

- (BOOL)needsFirstSync
{
  v2 = [(SCWZone *)self store];
  v3 = [v2 lastSyncDate];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)isDirty
{
  v3 = [(SCWZone *)self store];
  BOOL v4 = [v3 lastSyncDate];

  v5 = [(SCWZone *)self store];
  v6 = [v5 lastDirtyDate];

  if (v4)
  {
    if (v6) {
      BOOL v7 = [v6 compare:v4] == 1;
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (NSArray)clientRecords
{
  v3 = [(SCWZone *)self schema];
  BOOL v4 = [(SCWZone *)self clientDiff];
  v5 = [(SCWZone *)self store];
  v6 = [v5 serverRecords];
  BOOL v7 = [v4 applyToRecords:v6];
  id v8 = [v3 validateRecords:v7];

  return (NSArray *)v8;
}

- (SCWZoneSchema)schema
{
  return self->_schema;
}

- (SCWZoneDiff)clientDiff
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [SCWZoneModificationSilo alloc];
  BOOL v4 = [(SCWZone *)self schema];
  v5 = [(SCWZone *)self store];
  v6 = [v5 serverRecords];
  BOOL v7 = [(SCWZoneModificationSilo *)v3 initWithZoneSchema:v4 contents:v6];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [(SCWZone *)self store];
  v9 = [v8 pendingCommands];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * i) executeWithZone:v7];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  v14 = [(SCWZoneModificationSilo *)v7 diff];

  return (SCWZoneDiff *)v14;
}

- (SCWZoneStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_schema, 0);
}

- (void)setStore:(id)a3
{
}

@end