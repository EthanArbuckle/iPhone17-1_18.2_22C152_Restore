@interface PLCloudPhotoLibraryBatchContainer
- (BOOL)reachedMinSplit;
- (BOOL)wasFixed;
- (BOOL)wasSplit;
- (CPLChangeBatch)batch;
- (NSMutableSet)computeSyncRelevantAssetsInBatch;
- (PLCloudPhotoLibraryBatchContainer)init;
- (id)batchesSplitForError;
- (id)description;
- (id)lastAddedRecord;
- (unint64_t)count;
- (unint64_t)retryCount;
- (void)addRecord:(id)a3;
- (void)incrementRetryCount;
- (void)setBatch:(id)a3;
- (void)setComputeSyncRelevantAssetsInBatch:(id)a3;
- (void)setReachedMinSplit:(BOOL)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setWasFixed:(BOOL)a3;
- (void)setWasSplit:(BOOL)a3;
@end

@implementation PLCloudPhotoLibraryBatchContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computeSyncRelevantAssetsInBatch, 0);
  objc_storeStrong((id *)&self->_batch, 0);
}

- (void)setWasFixed:(BOOL)a3
{
  self->_wasFixed = a3;
}

- (BOOL)wasFixed
{
  return self->_wasFixed;
}

- (void)setReachedMinSplit:(BOOL)a3
{
  self->_reachedMinSplit = a3;
}

- (BOOL)reachedMinSplit
{
  return self->_reachedMinSplit;
}

- (void)setWasSplit:(BOOL)a3
{
  self->_wasSplit = a3;
}

- (BOOL)wasSplit
{
  return self->_wasSplit;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setComputeSyncRelevantAssetsInBatch:(id)a3
{
}

- (NSMutableSet)computeSyncRelevantAssetsInBatch
{
  return self->_computeSyncRelevantAssetsInBatch;
}

- (void)setBatch:(id)a3
{
}

- (CPLChangeBatch)batch
{
  return self->_batch;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(CPLChangeBatch *)self->_batch records];
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
        v9 = [NSString stringWithFormat:@"  %@\r", *(void *)(*((void *)&v11 + 1) + 8 * i)];
        [v3 appendString:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)batchesSplitForError
{
  v31[1] = *MEMORY[0x1E4F143B8];
  if ([(PLCloudPhotoLibraryBatchContainer *)self reachedMinSplit]
    || [(PLCloudPhotoLibraryBatchContainer *)self count] <= 1)
  {
    [(PLCloudPhotoLibraryBatchContainer *)self setWasSplit:1];
    [(PLCloudPhotoLibraryBatchContainer *)self incrementRetryCount];
    v31[0] = self;
    id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    goto LABEL_31;
  }
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[PLCloudPhotoLibraryBatchContainer count](self, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(CPLChangeBatch *)self->_batch records];
  uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v4)
  {
    id v6 = 0;
    id v7 = 0;
    v8 = 0;
    goto LABEL_30;
  }
  uint64_t v5 = v4;
  id v6 = 0;
  id v7 = 0;
  v8 = 0;
  uint64_t v9 = *(void *)v27;
  v10 = off_1E585E000;
  do
  {
    uint64_t v11 = 0;
    long long v12 = v7;
    do
    {
      if (*(void *)v27 != v9) {
        objc_enumerationMutation(obj);
      }
      long long v13 = *(void **)(*((void *)&v26 + 1) + 8 * v11);
      if (!v12) {
        goto LABEL_18;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v14 = v8 != 0;
      }
      else
      {
        uint64_t v15 = v9;
        uint64_t v16 = v3;
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          v17 = [v13 masterScopedIdentifier];
          v18 = [v8 scopedIdentifier];
          char v23 = [v17 isEqual:v18];

          if (v23) {
            goto LABEL_17;
          }

          v8 = 0;
          BOOL v14 = 1;
        }
        else
        {
          unint64_t v19 = [v6 count];
          unint64_t v20 = [(PLCloudPhotoLibraryBatchContainer *)self count];

          v8 = 0;
          if (v19 < v20 >> 1)
          {
LABEL_17:
            v3 = v16;
            uint64_t v9 = v15;
            v10 = off_1E585E000;
LABEL_18:
            if (v6) {
              goto LABEL_24;
            }
            goto LABEL_23;
          }
          BOOL v14 = 0;
        }
        v3 = v16;
        uint64_t v9 = v15;
        v10 = off_1E585E000;
      }
      [v6 setReachedMinSplit:v14];

LABEL_23:
      id v6 = objc_alloc_init(v10[135]);
      objc_msgSend(v6, "setRetryCount:", -[PLCloudPhotoLibraryBatchContainer retryCount](self, "retryCount") + 1);
      [v6 setWasSplit:1];
      [v3 addObject:v6];
LABEL_24:
      [v6 addRecord:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = v13;

        v8 = v21;
      }
      id v7 = v13;

      ++v11;
      long long v12 = v7;
    }
    while (v5 != v11);
    uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  }
  while (v5);
LABEL_30:

  id v2 = v3;
LABEL_31:
  return v2;
}

- (id)lastAddedRecord
{
  id v2 = [(CPLChangeBatch *)self->_batch records];
  v3 = [v2 lastObject];

  return v3;
}

- (void)incrementRetryCount
{
}

- (void)addRecord:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(CPLChangeBatch *)self->_batch addRecord:v4];
  }
  else if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v5 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Trying to add empty record to the batch, skipping.", v6, 2u);
    }
  }
}

- (unint64_t)count
{
  return [(CPLChangeBatch *)self->_batch count];
}

- (PLCloudPhotoLibraryBatchContainer)init
{
  v8.receiver = self;
  v8.super_class = (Class)PLCloudPhotoLibraryBatchContainer;
  id v2 = [(PLCloudPhotoLibraryBatchContainer *)&v8 init];
  if (v2)
  {
    v3 = (CPLChangeBatch *)objc_alloc_init(MEMORY[0x1E4F59848]);
    batch = v2->_batch;
    v2->_batch = v3;

    uint64_t v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    computeSyncRelevantAssetsInBatch = v2->_computeSyncRelevantAssetsInBatch;
    v2->_computeSyncRelevantAssetsInBatch = v5;
  }
  return v2;
}

@end