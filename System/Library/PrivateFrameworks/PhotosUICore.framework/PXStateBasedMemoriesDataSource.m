@interface PXStateBasedMemoriesDataSource
- (PXMemoriesDataSourceState)_state;
- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3;
- (PXStateBasedMemoriesDataSource)initWithState:(id)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)sectionedObjectReferenceForMemoryUUID:(id)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
@end

@implementation PXStateBasedMemoriesDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__state, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (PXMemoriesDataSourceState)_state
{
  return self->__state;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  v15.receiver = self;
  v15.super_class = (Class)PXStateBasedMemoriesDataSource;
  [(PXSimpleIndexPath *)&v15 indexPathForObjectReference:v6];
  if ((void)v16 == *(void *)off_1E5DAAED8)
  {
    v7 = [v6 itemObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v7 assetCollection];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = 0;
LABEL_10:

        goto LABEL_11;
      }
      id v8 = v7;
    }
    v9 = v8;
    if (v8)
    {
      v10 = [(PXStateBasedMemoriesDataSource *)self _state];
      v11 = [v10 memories];
      uint64_t v12 = [v11 indexOfObject:v9];

      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        long long v16 = (unint64_t)[(PXStateBasedMemoriesDataSource *)self identifier];
        *(void *)&long long v17 = v12;
        *((void *)&v17 + 1) = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    goto LABEL_10;
  }
LABEL_11:
  long long v13 = v17;
  *(_OWORD *)&retstr->dataSourceIdentifier = v16;
  *(_OWORD *)&retstr->item = v13;

  return result;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  v4 = [(PXStateBasedMemoriesDataSource *)self _state];
  v5 = v4;
  if (a3->dataSourceIdentifier != *(void *)off_1E5DAAED8
    && a3->item != 0x7FFFFFFFFFFFFFFFLL
    && a3->subitem == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = [v4 memories];
    v10 = [v9 objectAtIndexedSubscript:a3->item];

    v11 = [v5 infosByMemory];
    id v8 = [v11 objectForKeyedSubscript:v10];

    if (!v8)
    {
      id v8 = +[PXMemoryInfo fastMemoryInfoWithMemory:v10];
    }
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
  }

  return v8;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  v3 = [(PXStateBasedMemoriesDataSource *)self _state];
  v4 = [v3 memories];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (id)sectionedObjectReferenceForMemoryUUID:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  int64_t v5 = [(PXStateBasedMemoriesDataSource *)self _state];
  id v6 = [v5 memories];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__PXStateBasedMemoriesDataSource_sectionedObjectReferenceForMemoryUUID___block_invoke;
  v13[3] = &unk_1E5DB8F28;
  id v7 = v4;
  id v14 = v7;
  objc_super v15 = &v16;
  [v6 enumerateObjectsUsingBlock:v13];

  if (v17[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = [(PXStateBasedMemoriesDataSource *)self identifier];
    uint64_t v10 = v17[3];
    v12[0] = v9;
    v12[1] = 0;
    v12[2] = v10;
    v12[3] = 0x7FFFFFFFFFFFFFFFLL;
    id v8 = [(PXStateBasedMemoriesDataSource *)self objectReferenceAtIndexPath:v12];
  }

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __72__PXStateBasedMemoriesDataSource_sectionedObjectReferenceForMemoryUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = (void *)MEMORY[0x1E4F391D0];
  id v8 = [a2 localIdentifier];
  id v9 = [v7 uuidFromLocalIdentifier:v8];

  if ([v9 isEqualToString:*(void *)(a1 + 32)])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (PXStateBasedMemoriesDataSource)initWithState:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStateBasedMemoriesDataSource;
  id v6 = [(PXStateBasedMemoriesDataSource *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->__state, a3);
  }

  return v7;
}

@end