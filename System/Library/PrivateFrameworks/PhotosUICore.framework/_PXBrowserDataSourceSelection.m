@interface _PXBrowserDataSourceSelection
- (NSArray)assets;
- (NSArray)indexPaths;
- (PXDisplayAssetDataSource)dataSource;
- (_PXBrowserDataSourceSelection)initWithIndexPaths:(id)a3 dataSource:(id)a4;
- (id)assetReferenceAtIndex:(int64_t)a3;
- (id)displayAssetAtIndex:(int64_t)a3;
- (int64_t)assetCount;
- (int64_t)estimatedAssetCount;
- (int64_t)indexOfAssetReference:(id)a3;
- (int64_t)mediaType;
@end

@implementation _PXBrowserDataSourceSelection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_indexPaths, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

- (PXDisplayAssetDataSource)dataSource
{
  return self->_dataSource;
}

- (NSArray)indexPaths
{
  return self->_indexPaths;
}

- (int64_t)indexOfAssetReference:(id)a3
{
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"asset"];
  v7 = [v5 objectForKeyedSubscript:@"indexPath"];
  v8 = [v5 objectForKeyedSubscript:@"selectionPointer"];
  v9 = [v5 objectForKeyedSubscript:@"dataSourceVersion"];
  v10 = [(_PXBrowserDataSourceSelection *)self indexPaths];
  uint64_t v11 = [v10 indexOfObject:v7];

  v12 = [(_PXBrowserDataSourceSelection *)self dataSource];
  if ((_PXBrowserDataSourceSelection *)[v8 pointerValue] != self
    || (uint64_t v13 = [v12 versionIdentifier], v13 != objc_msgSend(v9, "longValue")))
  {
    v17 = [v12 indexPathForDisplayAsset:v6 hintIndexPath:v7];
    if (v17)
    {
      v18 = [(_PXBrowserDataSourceSelection *)self indexPaths];
      uint64_t v11 = [v18 indexOfObject:v17];
    }
    else
    {
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    goto LABEL_9;
  }
  int64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    SEL v20 = a2;
    v15 = [v12 displayAssetAtIndexPath:v7];
    v16 = [v5 objectForKeyedSubscript:@"asset"];
    char v21 = [v15 isEqual:v16];

    if (v21)
    {
LABEL_10:
      int64_t v14 = v11;
      goto LABEL_11;
    }
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:v20 object:self file:@"PXBrowserSnapshot.m" lineNumber:228 description:@"version mismatch"];
LABEL_9:

    goto LABEL_10;
  }
LABEL_11:

  return v14;
}

- (id)assetReferenceAtIndex:(int64_t)a3
{
  id v5 = [(_PXBrowserDataSourceSelection *)self assets];
  v6 = [v5 objectAtIndexedSubscript:a3];

  v7 = [(_PXBrowserDataSourceSelection *)self indexPaths];
  v8 = [v7 objectAtIndexedSubscript:a3];

  v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  [v9 setObject:v6 forKeyedSubscript:@"asset"];
  [v9 setObject:v8 forKeyedSubscript:@"indexPath"];
  v10 = [MEMORY[0x1E4F29238] valueWithPointer:self];
  [v9 setObject:v10 forKeyedSubscript:@"selectionPointer"];

  uint64_t v11 = NSNumber;
  v12 = [(_PXBrowserDataSourceSelection *)self dataSource];
  uint64_t v13 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "versionIdentifier"));
  [v9 setObject:v13 forKeyedSubscript:@"dataSourceVersion"];

  return v9;
}

- (id)displayAssetAtIndex:(int64_t)a3
{
  v4 = [(_PXBrowserDataSourceSelection *)self assets];
  id v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (int64_t)mediaType
{
}

- (int64_t)assetCount
{
  v2 = [(_PXBrowserDataSourceSelection *)self indexPaths];
  int64_t v3 = [v2 count];

  return v3;
}

- (int64_t)estimatedAssetCount
{
  v2 = [(_PXBrowserDataSourceSelection *)self indexPaths];
  int64_t v3 = [v2 count];

  return v3;
}

- (NSArray)assets
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  assets = self->_assets;
  if (!assets)
  {
    v4 = [(_PXBrowserDataSourceSelection *)self indexPaths];
    id v5 = [(_PXBrowserDataSourceSelection *)self dataSource];
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v7 = self->_assets;
    self->_assets = v6;

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = self->_assets;
          int64_t v14 = objc_msgSend(v5, "displayAssetAtIndexPath:", *(void *)(*((void *)&v16 + 1) + 8 * v12), (void)v16);
          [(NSMutableArray *)v13 addObject:v14];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    assets = self->_assets;
  }
  return (NSArray *)assets;
}

- (_PXBrowserDataSourceSelection)initWithIndexPaths:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PXBrowserDataSourceSelection;
  id v8 = [(_PXBrowserDataSourceSelection *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    indexPaths = v8->_indexPaths;
    v8->_indexPaths = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_dataSource, a4);
  }

  return v8;
}

@end