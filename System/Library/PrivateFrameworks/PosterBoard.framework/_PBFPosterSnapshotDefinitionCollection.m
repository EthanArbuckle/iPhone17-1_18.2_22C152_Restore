@interface _PBFPosterSnapshotDefinitionCollection
- (NSCountedSet)displayContextRequestFailures;
- (NSMapTable)failedPreviewImageForDisplayContext;
- (NSMapTable)previewImageRequestForDisplayContext;
- (NSMapTable)receivedPreviewImageForDisplayContext;
- (_PBFPosterSnapshotDefinitionCollection)init;
- (int64_t)requestStatusForDisplayContext:(id)a3;
- (void)cancel;
@end

@implementation _PBFPosterSnapshotDefinitionCollection

- (_PBFPosterSnapshotDefinitionCollection)init
{
  v12.receiver = self;
  v12.super_class = (Class)_PBFPosterSnapshotDefinitionCollection;
  v2 = [(_PBFPosterSnapshotDefinitionCollection *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    previewImageRequestForDisplayContext = v2->_previewImageRequestForDisplayContext;
    v2->_previewImageRequestForDisplayContext = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    receivedPreviewImageForDisplayContext = v2->_receivedPreviewImageForDisplayContext;
    v2->_receivedPreviewImageForDisplayContext = (NSMapTable *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    failedPreviewImageForDisplayContext = v2->_failedPreviewImageForDisplayContext;
    v2->_failedPreviewImageForDisplayContext = (NSMapTable *)v7;

    uint64_t v9 = objc_opt_new();
    displayContextRequestFailures = v2->_displayContextRequestFailures;
    v2->_displayContextRequestFailures = (NSCountedSet *)v9;
  }
  return v2;
}

- (int64_t)requestStatusForDisplayContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(_PBFPosterSnapshotDefinitionCollection *)self previewImageRequestForDisplayContext];
    v6 = [v5 objectForKey:v4];

    if (v6)
    {
      int64_t v7 = 1;
    }
    else
    {
      v8 = [(_PBFPosterSnapshotDefinitionCollection *)self receivedPreviewImageForDisplayContext];
      uint64_t v9 = [v8 objectForKey:v4];

      if (v9)
      {
        int64_t v7 = 3;
      }
      else
      {
        v10 = [(_PBFPosterSnapshotDefinitionCollection *)self displayContextRequestFailures];
        unint64_t v11 = [v10 countForObject:v4];

        if (v11 <= 2)
        {
          objc_super v12 = [(_PBFPosterSnapshotDefinitionCollection *)self failedPreviewImageForDisplayContext];
          v13 = [v12 objectForKey:v4];
          BOOL v14 = v13 != 0;

          int64_t v7 = 2 * v14;
        }
        else
        {
          int64_t v7 = 2;
        }
      }
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)cancel
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(_PBFPosterSnapshotDefinitionCollection *)self previewImageRequestForDisplayContext];
  id v4 = [v3 objectEnumerator];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) invalidate];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(NSMapTable *)self->_previewImageRequestForDisplayContext removeAllObjects];
  [(NSMapTable *)self->_receivedPreviewImageForDisplayContext removeAllObjects];
  [(NSMapTable *)self->_failedPreviewImageForDisplayContext removeAllObjects];
  [(NSCountedSet *)self->_displayContextRequestFailures removeAllObjects];
}

- (NSMapTable)previewImageRequestForDisplayContext
{
  return self->_previewImageRequestForDisplayContext;
}

- (NSMapTable)receivedPreviewImageForDisplayContext
{
  return self->_receivedPreviewImageForDisplayContext;
}

- (NSMapTable)failedPreviewImageForDisplayContext
{
  return self->_failedPreviewImageForDisplayContext;
}

- (NSCountedSet)displayContextRequestFailures
{
  return self->_displayContextRequestFailures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayContextRequestFailures, 0);
  objc_storeStrong((id *)&self->_failedPreviewImageForDisplayContext, 0);
  objc_storeStrong((id *)&self->_receivedPreviewImageForDisplayContext, 0);
  objc_storeStrong((id *)&self->_previewImageRequestForDisplayContext, 0);
}

@end