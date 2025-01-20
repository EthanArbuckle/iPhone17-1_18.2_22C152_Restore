@interface PXPlacesMapPipeline
- (PXPlacesGeotaggedItemDataSource)dataSource;
- (PXPlacesImageCache)imageCache;
- (PXPlacesMapLayout)layout;
- (PXPlacesMapPipeline)initWithLayout:(id)a3 updatePlan:(id)a4 renderer:(id)a5 selectionHandler:(id)a6;
- (PXPlacesMapRenderer)renderer;
- (PXPlacesMapSelectionHandler)selectionHandler;
- (PXPlacesMapUpdatePlan)updatePlan;
- (id)executeRemoval;
- (id)executeWithUpdatedViewPort:(id)a3 andDataSourceChange:(id)a4;
- (void)setImageCache:(id)a3;
@end

@implementation PXPlacesMapPipeline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_updatePlan, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

- (void)setImageCache:(id)a3
{
}

- (PXPlacesImageCache)imageCache
{
  return (PXPlacesImageCache *)objc_getProperty(self, a2, 40, 1);
}

- (PXPlacesMapSelectionHandler)selectionHandler
{
  return (PXPlacesMapSelectionHandler *)objc_getProperty(self, a2, 32, 1);
}

- (PXPlacesMapRenderer)renderer
{
  return (PXPlacesMapRenderer *)objc_getProperty(self, a2, 24, 1);
}

- (PXPlacesMapUpdatePlan)updatePlan
{
  return (PXPlacesMapUpdatePlan *)objc_getProperty(self, a2, 16, 1);
}

- (PXPlacesMapLayout)layout
{
  return (PXPlacesMapLayout *)objc_getProperty(self, a2, 8, 1);
}

- (id)executeRemoval
{
  v3 = [(PXPlacesMapPipeline *)self updatePlan];
  v4 = [v3 removalPlanResult];

  v5 = [(PXPlacesMapPipeline *)self updatePlan];
  [v5 reset];

  return v4;
}

- (id)executeWithUpdatedViewPort:(id)a3 andDataSourceChange:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PXPlacesMapPipeline *)self layout];
  v9 = [v8 layoutForViewPort:v7 andDataSourceChange:v6];

  v10 = [(PXPlacesMapPipeline *)self updatePlan];
  v11 = [v10 resultForNewLayoutResult:v9];

  return v11;
}

- (PXPlacesGeotaggedItemDataSource)dataSource
{
  return [(PXPlacesMapLayout *)self->_layout dataSource];
}

- (PXPlacesMapPipeline)initWithLayout:(id)a3 updatePlan:(id)a4 renderer:(id)a5 selectionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PXPlacesMapPipeline;
  v15 = [(PXPlacesMapPipeline *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_layout, a3);
    objc_storeStrong((id *)&v16->_updatePlan, a4);
    objc_storeStrong((id *)&v16->_renderer, a5);
    objc_storeStrong((id *)&v16->_selectionHandler, a6);
    [(PXPlacesMapLayout *)v16->_layout setPipelineComponentProvider:v16];
    [(PXPlacesMapUpdatePlan *)v16->_updatePlan setPipelineComponentProvider:v16];
    [(PXPlacesMapRenderer *)v16->_renderer setPipelineComponentProvider:v16];
    [(PXPlacesMapSelectionHandler *)v16->_selectionHandler setPipelineComponentProvider:v16];
  }

  return v16;
}

@end