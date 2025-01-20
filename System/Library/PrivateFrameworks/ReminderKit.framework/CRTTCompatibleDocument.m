@interface CRTTCompatibleDocument
- (CRTTCompatibleDocument)initWithVersion:(id)a3 startVersion:(id)a4 rootObject:(id)a5 replica:(id)a6;
- (CRTTCompatibleDocument)initWithVersion:(id)a3 startVersion:(id)a4 rootObject:(id)a5 replica:(id)a6 topoTimestamp:(id)a7;
- (NSMutableArray)stringsWithClocksNeedingUpdating;
- (NSMutableArray)stringsWithClocksToResetAfterRealizingLocalChanges;
- (TTCRVectorMultiTimestamp)sharedTopotextTimestamp;
- (unint64_t)mergeResultForMergingWithDocument:(id)a3;
- (void)mergeTimestampWithDocument:(id)a3;
- (void)realizeLocalChanges;
- (void)setSharedTopotextTimestamp:(id)a3;
- (void)setStringsWithClocksNeedingUpdating:(id)a3;
- (void)setStringsWithClocksToResetAfterRealizingLocalChanges:(id)a3;
@end

@implementation CRTTCompatibleDocument

- (CRTTCompatibleDocument)initWithVersion:(id)a3 startVersion:(id)a4 rootObject:(id)a5 replica:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[TTCRVectorMultiTimestamp alloc] initWithCapacity:2];
  v15 = [(CRTTCompatibleDocument *)self initWithVersion:v13 startVersion:v12 rootObject:v11 replica:v10 topoTimestamp:v14];

  return v15;
}

- (CRTTCompatibleDocument)initWithVersion:(id)a3 startVersion:(id)a4 rootObject:(id)a5 replica:(id)a6 topoTimestamp:(id)a7
{
  id v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)CRTTCompatibleDocument;
  id v13 = [(CRDocument *)&v18 initWithVersion:a3 startVersion:a4 rootObject:a5 replica:a6];
  v14 = v13;
  if (v13)
  {
    [(CRTTCompatibleDocument *)v13 setSharedTopotextTimestamp:v12];
    v15 = [MEMORY[0x1E4F1CA48] array];
    [(CRTTCompatibleDocument *)v14 setStringsWithClocksNeedingUpdating:v15];

    v16 = [MEMORY[0x1E4F1CA48] array];
    [(CRTTCompatibleDocument *)v14 setStringsWithClocksToResetAfterRealizingLocalChanges:v16];
  }
  return v14;
}

- (unint64_t)mergeResultForMergingWithDocument:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = REMDynamicCast(v5, (uint64_t)v4);
  if (v6
    && ([(CRTTCompatibleDocument *)self sharedTopotextTimestamp],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v6 sharedTopotextTimestamp],
        v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v7 compareTo:v8],
        v8,
        v7,
        (v9 & 1) != 0))
  {
    unint64_t v10 = 2;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CRTTCompatibleDocument;
    unint64_t v10 = [(CRDocument *)&v12 mergeResultForMergingWithDocument:v4];
  }

  return v10;
}

- (void)mergeTimestampWithDocument:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CRTTCompatibleDocument;
  [(CRDocument *)&v20 mergeTimestampWithDocument:v4];
  uint64_t v5 = objc_opt_class();
  v6 = REMDynamicCast(v5, (uint64_t)v4);
  if (v6)
  {
    v7 = [(CRTTCompatibleDocument *)self sharedTopotextTimestamp];
    v8 = [v6 sharedTopotextTimestamp];
    [v7 mergeWithTimestamp:v8];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    char v9 = [(CRTTCompatibleDocument *)self stringsWithClocksNeedingUpdating];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
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
          v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          [v14 updateClock];
          [v14 checkTimestampLogStyleErrors:1];
          [v14 resetLocalReplicaClocksToTimestampValues];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v11);
    }

    v15 = [(CRTTCompatibleDocument *)self stringsWithClocksNeedingUpdating];
    [v15 removeAllObjects];
  }
}

- (void)realizeLocalChanges
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)CRTTCompatibleDocument;
  [(CRDocument *)&v15 realizeLocalChanges];
  v3 = [(CRTTCompatibleDocument *)self stringsWithClocksToResetAfterRealizingLocalChanges];
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [(CRTTCompatibleDocument *)self stringsWithClocksToResetAfterRealizingLocalChanges];
  [v5 removeAllObjects];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "resetLocalReplicaClocksToTimestampValues", (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }
}

- (TTCRVectorMultiTimestamp)sharedTopotextTimestamp
{
  return self->_sharedTopotextTimestamp;
}

- (void)setSharedTopotextTimestamp:(id)a3
{
}

- (NSMutableArray)stringsWithClocksNeedingUpdating
{
  return self->_stringsWithClocksNeedingUpdating;
}

- (void)setStringsWithClocksNeedingUpdating:(id)a3
{
}

- (NSMutableArray)stringsWithClocksToResetAfterRealizingLocalChanges
{
  return self->_stringsWithClocksToResetAfterRealizingLocalChanges;
}

- (void)setStringsWithClocksToResetAfterRealizingLocalChanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringsWithClocksToResetAfterRealizingLocalChanges, 0);
  objc_storeStrong((id *)&self->_stringsWithClocksNeedingUpdating, 0);

  objc_storeStrong((id *)&self->_sharedTopotextTimestamp, 0);
}

@end