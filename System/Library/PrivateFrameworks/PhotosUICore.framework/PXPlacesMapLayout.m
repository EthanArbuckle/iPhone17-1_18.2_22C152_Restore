@interface PXPlacesMapLayout
- (PXPlacesGeotaggedItemDataSource)dataSource;
- (PXPlacesMapLayout)initWithDataSource:(id)a3;
- (PXPlacesMapPipelineComponentProvider)pipelineComponentProvider;
- (id)layoutForViewPort:(id)a3 andDataSourceChange:(id)a4;
- (id)layoutItemForGeotaggable:(id)a3;
- (void)setPipelineComponentProvider:(id)a3;
@end

@implementation PXPlacesMapLayout

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->pipelineComponentProvider);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)setPipelineComponentProvider:(id)a3
{
}

- (PXPlacesMapPipelineComponentProvider)pipelineComponentProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->pipelineComponentProvider);
  return (PXPlacesMapPipelineComponentProvider *)WeakRetained;
}

- (PXPlacesGeotaggedItemDataSource)dataSource
{
  return (PXPlacesGeotaggedItemDataSource *)objc_getProperty(self, a2, 8, 1);
}

- (id)layoutItemForGeotaggable:(id)a3
{
  return 0;
}

- (id)layoutForViewPort:(id)a3 andDataSourceChange:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"PXPlacesMapLayout.m" lineNumber:36 description:@"-[PXPlacesMapSimpleLayout layout] viewPort cannot be nil"];
  }
  v9 = [(PXPlacesMapLayout *)self dataSource];

  if (!v9)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"PXPlacesMapLayout.m" lineNumber:37 description:@"-[PXPlacesMapSimpleLayout layout] dataSource cannot be nil"];
  }
  v10 = objc_alloc_init(PXPlacesMapLayoutResultImpl);
  [v7 mapRect];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [(PXPlacesMapLayout *)self dataSource];
  v20 = objc_msgSend(v19, "findItemsInMapRect:", v12, v14, v16, v18);

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v21 = v20;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v27 = [PXPlacesMapLayoutItemImpl alloc];
        objc_msgSend(v26, "coordinate", (void)v32);
        v28 = -[PXPlacesMapLayoutItemImpl initWithCoordinate:](v27, "initWithCoordinate:");
        [(PXPlacesMapLayoutItemImpl *)v28 addGeotaggable:v26];
        [(PXPlacesMapLayoutResultImpl *)v10 addItem:v28];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v23);
  }

  return v10;
}

- (PXPlacesMapLayout)initWithDataSource:(id)a3
{
  id v5 = a3;
  v6 = [(PXPlacesMapLayout *)self init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

@end