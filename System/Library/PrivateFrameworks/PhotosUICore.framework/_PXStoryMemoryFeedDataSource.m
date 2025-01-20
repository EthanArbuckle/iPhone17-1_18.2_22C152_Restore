@interface _PXStoryMemoryFeedDataSource
- (_PXStoryMemoryFeedDataSource)initWithDataSource:(id)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)objectIDAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectReferenceNearestToObjectReference:(id)a3;
@end

@implementation _PXStoryMemoryFeedDataSource

- (void).cxx_destruct
{
}

- (id)objectReferenceNearestToObjectReference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXSectionedDataSource *)self->_dataSource objectReferenceNearestToObjectReference:v4];
  v6 = (void *)v5;
  if (v4 && !v5)
  {
    v7 = [v4 leafObject];
    v8 = [v7 assetCollection];
    v9 = [v8 creationDate];

    v6 = 0;
    if ([(PXSectionedDataSource *)self->_dataSource numberOfSections] == 1 && v9)
    {
      v25 = v7;
      uint64_t v10 = *(void *)off_1E5DAB028;
      uint64_t v26 = *((void *)off_1E5DAB028 + 2);
      uint64_t v27 = *((void *)off_1E5DAB028 + 3);
      uint64_t v28 = *((void *)off_1E5DAB028 + 1);
      uint64_t v11 = [(PXSectionedDataSource *)self->_dataSource numberOfItemsInSection:0];
      uint64_t v12 = [(PXSectionedDataSource *)self->_dataSource identifier];
      if (v11 >= 1)
      {
        uint64_t v13 = v12;
        uint64_t v14 = 0;
        double v15 = 1.79769313e308;
        do
        {
          dataSource = self->_dataSource;
          uint64_t v29 = v13;
          uint64_t v30 = 0;
          uint64_t v31 = v14;
          uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
          v17 = [(PXSectionedDataSource *)dataSource objectAtIndexPath:&v29];
          v18 = [v17 assetCollection];
          v19 = [v18 creationDate];
          [v19 timeIntervalSinceDate:v9];
          double v21 = v20;

          double v22 = -v21;
          if (v21 >= 0.0) {
            double v22 = v21;
          }
          if (v22 < v15)
          {
            uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
            uint64_t v28 = 0;
            uint64_t v26 = v14;
            uint64_t v10 = v13;
            double v15 = v22;
          }

          ++v14;
        }
        while (v11 != v14);
      }
      if (v10 == *(void *)off_1E5DAAED8)
      {
        v6 = 0;
      }
      else
      {
        v23 = self->_dataSource;
        uint64_t v29 = v10;
        uint64_t v30 = v28;
        uint64_t v31 = v26;
        uint64_t v32 = v27;
        v6 = [(PXSectionedDataSource *)v23 objectReferenceAtIndexPath:&v29];
      }
      v7 = v25;
    }
  }
  return v6;
}

- (id)objectIDAtIndexPath:(PXSimpleIndexPath *)a3
{
  dataSource = self->_dataSource;
  long long v4 = *(_OWORD *)&a3->item;
  v10[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v10[1] = v4;
  uint64_t v5 = [(PXSectionedDataSource *)dataSource objectReferenceAtIndexPath:v10];
  v6 = [v5 leafObject];
  v7 = [v6 assetCollection];
  v8 = [v7 localIdentifier];

  return v8;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_dataSource;
}

- (_PXStoryMemoryFeedDataSource)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXStoryMemoryFeedDataSource;
  v6 = [(_PXStoryMemoryFeedDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

@end