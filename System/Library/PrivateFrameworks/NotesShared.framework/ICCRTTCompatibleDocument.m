@interface ICCRTTCompatibleDocument
+ (id)makeSharedTopotextTimestampFromData:(id)a3;
- (ICCRTTCompatibleDocument)initWithVersion:(id)a3 startVersion:(id)a4 rootObject:(id)a5 replica:(id)a6;
- (ICCRTTCompatibleDocument)initWithVersion:(id)a3 startVersion:(id)a4 rootObject:(id)a5 replica:(id)a6 topoTimestamp:(id)a7;
- (NSMutableArray)stringsWithClocksNeedingUpdating;
- (NSMutableArray)stringsWithClocksToResetAfterRealizingLocalChanges;
- (TTICCRVectorMultiTimestamp)sharedTopotextTimestamp;
- (unint64_t)mergeResultForMergingWithDocument:(id)a3;
- (void)mergeTimestampWithDocument:(id)a3;
- (void)realizeLocalChanges;
- (void)setSharedTopotextTimestamp:(id)a3;
- (void)setStringsWithClocksNeedingUpdating:(id)a3;
- (void)setStringsWithClocksToResetAfterRealizingLocalChanges:(id)a3;
@end

@implementation ICCRTTCompatibleDocument

- (ICCRTTCompatibleDocument)initWithVersion:(id)a3 startVersion:(id)a4 rootObject:(id)a5 replica:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[TTICCRVectorMultiTimestamp alloc] initWithCapacity:2];
  v15 = [(ICCRTTCompatibleDocument *)self initWithVersion:v13 startVersion:v12 rootObject:v11 replica:v10 topoTimestamp:v14];

  return v15;
}

- (ICCRTTCompatibleDocument)initWithVersion:(id)a3 startVersion:(id)a4 rootObject:(id)a5 replica:(id)a6 topoTimestamp:(id)a7
{
  id v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)ICCRTTCompatibleDocument;
  id v13 = [(ICCRDocument *)&v18 initWithVersion:a3 startVersion:a4 rootObject:a5 replica:a6];
  v14 = v13;
  if (v13)
  {
    [(ICCRTTCompatibleDocument *)v13 setSharedTopotextTimestamp:v12];
    v15 = [MEMORY[0x1E4F1CA48] array];
    [(ICCRTTCompatibleDocument *)v14 setStringsWithClocksNeedingUpdating:v15];

    v16 = [MEMORY[0x1E4F1CA48] array];
    [(ICCRTTCompatibleDocument *)v14 setStringsWithClocksToResetAfterRealizingLocalChanges:v16];
  }
  return v14;
}

+ (id)makeSharedTopotextTimestampFromData:(id)a3
{
  id v3 = a3;
  v4 = [(ICTTVectorMultiTimestamp *)[TTICCRVectorMultiTimestamp alloc] initWithData:v3 andCapacity:2];

  return v4;
}

- (unint64_t)mergeResultForMergingWithDocument:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = ICDynamicCast();
  if (v5
    && ([(ICCRTTCompatibleDocument *)self sharedTopotextTimestamp],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v5 sharedTopotextTimestamp],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v6 compareTo:v7],
        v7,
        v6,
        (v8 & 1) != 0))
  {
    unint64_t v9 = 2;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ICCRTTCompatibleDocument;
    unint64_t v9 = [(ICCRDocument *)&v11 mergeResultForMergingWithDocument:v4];
  }

  return v9;
}

- (void)mergeTimestampWithDocument:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ICCRTTCompatibleDocument;
  [(ICCRDocument *)&v19 mergeTimestampWithDocument:v4];
  objc_opt_class();
  v5 = ICDynamicCast();
  if (v5)
  {
    v6 = [(ICCRTTCompatibleDocument *)self sharedTopotextTimestamp];
    v7 = [v5 sharedTopotextTimestamp];
    [v6 mergeWithTimestamp:v7];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    char v8 = [(ICCRTTCompatibleDocument *)self stringsWithClocksNeedingUpdating];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          [v13 updateClock];
          [v13 checkTimestampLogStyleErrors:1];
          [v13 resetLocalReplicaClocksToTimestampValues];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }

    v14 = [(ICCRTTCompatibleDocument *)self stringsWithClocksNeedingUpdating];
    [v14 removeAllObjects];
  }
}

- (void)realizeLocalChanges
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)ICCRTTCompatibleDocument;
  [(ICCRDocument *)&v15 realizeLocalChanges];
  id v3 = [(ICCRTTCompatibleDocument *)self stringsWithClocksToResetAfterRealizingLocalChanges];
  id v4 = (void *)[v3 copy];

  v5 = [(ICCRTTCompatibleDocument *)self stringsWithClocksToResetAfterRealizingLocalChanges];
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

- (TTICCRVectorMultiTimestamp)sharedTopotextTimestamp
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