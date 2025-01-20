@interface _PXBrowserDataSourceVisibleContentSnapshot
- (NSArray)indexPaths;
- (PXDisplayAssetDataSource)dataSource;
- (_PXBrowserDataSourceVisibleContentSnapshot)initWithDateIntervalGranularity:(unint64_t)a3;
- (_PXBrowserDataSourceVisibleContentSnapshot)initWithIndexPaths:(id)a3 dataSource:(id)a4 dateIntervalGranularity:(unint64_t)a5 dateType:(unint64_t)a6;
- (id)dateInterval;
- (unint64_t)dateType;
@end

@implementation _PXBrowserDataSourceVisibleContentSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_indexPaths, 0);
}

- (unint64_t)dateType
{
  return self->_dateType;
}

- (PXDisplayAssetDataSource)dataSource
{
  return self->_dataSource;
}

- (NSArray)indexPaths
{
  return self->_indexPaths;
}

- (id)dateInterval
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v19 = [(_PXBrowserDataSourceVisibleContentSnapshot *)self dataSource];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v3 = [(_PXBrowserDataSourceVisibleContentSnapshot *)self indexPaths];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v4)
  {

    v16 = 0;
    id v6 = 0;
    id v7 = 0;
    v8 = 0;
    goto LABEL_17;
  }
  uint64_t v5 = v4;
  id v6 = 0;
  id v7 = 0;
  v8 = 0;
  uint64_t v9 = *(void *)v23;
  id obj = v3;
  do
  {
    uint64_t v10 = 0;
    v11 = v6;
    v12 = v7;
    do
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(obj);
      }
      v13 = objc_msgSend(v19, "displayAssetAtIndexPath:", *(void *)(*((void *)&v22 + 1) + 8 * v10), obj);
      if ([(_PXBrowserDataSourceVisibleContentSnapshot *)self dateType])
      {
        if ([(_PXBrowserDataSourceVisibleContentSnapshot *)self dateType] != 1) {
          goto LABEL_11;
        }
        uint64_t v14 = [v13 importDate];
      }
      else
      {
        uint64_t v14 = [v13 creationDate];
      }
      v15 = (void *)v14;

      v8 = v15;
LABEL_11:
      id v20 = v11;
      id v21 = v12;
      objc_msgSend(MEMORY[0x1E4F1C9C8], "px_unionStartDate:endDate:withDate:", &v21, &v20, v8);
      id v7 = v21;

      id v6 = v20;
      ++v10;
      v11 = v6;
      v12 = v7;
    }
    while (v5 != v10);
    uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v5);

  v16 = 0;
  if (v7 && v6) {
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 endDate:v6];
  }
LABEL_17:

  return v16;
}

- (_PXBrowserDataSourceVisibleContentSnapshot)initWithDateIntervalGranularity:(unint64_t)a3
{
  return [(_PXBrowserDataSourceVisibleContentSnapshot *)self initWithIndexPaths:0 dataSource:0 dateIntervalGranularity:a3 dateType:0];
}

- (_PXBrowserDataSourceVisibleContentSnapshot)initWithIndexPaths:(id)a3 dataSource:(id)a4 dateIntervalGranularity:(unint64_t)a5 dateType:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_PXBrowserDataSourceVisibleContentSnapshot;
  v12 = [(PXBrowserVisibleContentSnapshot *)&v16 initWithDateIntervalGranularity:a5];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    indexPaths = v12->_indexPaths;
    v12->_indexPaths = (NSArray *)v13;

    objc_storeStrong((id *)&v12->_dataSource, a4);
    v12->_dateType = a6;
  }

  return v12;
}

@end