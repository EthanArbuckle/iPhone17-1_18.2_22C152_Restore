@interface PXCollectionsBrowserSelectionSnapshot
- (NSArray)modelObjects;
- (PXCollectionsBrowserSelectionSnapshot)initWithIndexPaths:(id)a3 dataSource:(id)a4;
- (id)assetReferenceAtIndex:(int64_t)a3;
- (id)displayAssetAtIndex:(int64_t)a3;
- (int64_t)assetCount;
- (int64_t)estimatedAssetCount;
- (int64_t)estimatedModelObjectsCount;
- (int64_t)indexOfAssetReference:(id)a3;
- (int64_t)mediaType;
@end

@implementation PXCollectionsBrowserSelectionSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelObjects, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_indexPaths, 0);
}

- (int64_t)indexOfAssetReference:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)displayAssetAtIndex:(int64_t)a3
{
}

- (id)assetReferenceAtIndex:(int64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PXBrowserSnapshot.m" lineNumber:293 description:@"Accessing asset references from a collections selection snapshot is unsupported"];

  abort();
}

- (NSArray)modelObjects
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  modelObjects = self->_modelObjects;
  if (!modelObjects)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_indexPaths, "count"));
    memset(v9, 0, sizeof(v9));
    v5 = self->_indexPaths;
    if ([(NSArray *)v5 countByEnumeratingWithState:v9 objects:v10 count:16])
    {
      [(PXSectionedDataSource *)self->_dataSource identifier];
      PXSimpleIndexPathFromIndexPath();
    }

    v6 = (NSArray *)[v4 copy];
    v7 = self->_modelObjects;
    self->_modelObjects = v6;

    modelObjects = self->_modelObjects;
  }
  return modelObjects;
}

- (int64_t)estimatedModelObjectsCount
{
  return [(NSArray *)self->_indexPaths count];
}

- (int64_t)mediaType
{
  return 0;
}

- (int64_t)assetCount
{
  return 0;
}

- (int64_t)estimatedAssetCount
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (PXCollectionsBrowserSelectionSnapshot)initWithIndexPaths:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXCollectionsBrowserSelectionSnapshot;
  v8 = [(PXCollectionsBrowserSelectionSnapshot *)&v12 init];
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