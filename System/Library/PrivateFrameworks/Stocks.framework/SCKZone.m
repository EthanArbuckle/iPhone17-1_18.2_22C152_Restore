@interface SCKZone
- (BOOL)isDirty;
- (BOOL)needsFirstSync;
- (NSArray)clientRecords;
- (SCKZone)initWithSchema:(id)a3 store:(id)a4;
- (SCKZoneDiff)clientDiff;
- (SCKZoneSchema)schema;
- (SCKZoneStore)store;
- (void)setStore:(id)a3;
@end

@implementation SCKZone

- (SCKZone)initWithSchema:(id)a3 store:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCKZone;
  v9 = [(SCKZone *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_schema, a3);
    objc_storeStrong((id *)&v10->_store, a4);
  }

  return v10;
}

- (NSArray)clientRecords
{
  v3 = [(SCKZone *)self schema];
  v4 = [(SCKZone *)self clientDiff];
  v5 = [(SCKZone *)self store];
  v6 = [v5 serverRecords];
  id v7 = [v4 applyToRecords:v6];
  id v8 = [v3 validateRecords:v7];

  return (NSArray *)v8;
}

- (SCKZoneDiff)clientDiff
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [SCKZoneModificationSilo alloc];
  v4 = [(SCKZone *)self schema];
  v5 = [(SCKZone *)self store];
  v6 = [v5 serverRecords];
  id v7 = [(SCKZoneModificationSilo *)v3 initWithZoneSchema:v4 contents:v6];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [(SCKZone *)self store];
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

  v14 = [(SCKZoneModificationSilo *)v7 diff];

  return (SCKZoneDiff *)v14;
}

- (BOOL)needsFirstSync
{
  v2 = [(SCKZone *)self store];
  v3 = [v2 lastSyncDate];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)isDirty
{
  v3 = [(SCKZone *)self store];
  BOOL v4 = [v3 lastSyncDate];

  v5 = [(SCKZone *)self store];
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

- (SCKZoneSchema)schema
{
  return self->_schema;
}

- (SCKZoneStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_schema, 0);
}

@end