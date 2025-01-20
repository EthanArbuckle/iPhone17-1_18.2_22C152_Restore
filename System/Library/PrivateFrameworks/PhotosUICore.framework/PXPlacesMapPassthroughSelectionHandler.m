@interface PXPlacesMapPassthroughSelectionHandler
- (PXPlacesMapPipelineComponentProvider)pipelineComponentProvider;
- (id)selectedGeotaggablesForRenderable:(id)a3 mapView:(id)a4;
- (void)setPipelineComponentProvider:(id)a3;
@end

@implementation PXPlacesMapPassthroughSelectionHandler

- (void).cxx_destruct
{
}

- (void)setPipelineComponentProvider:(id)a3
{
}

- (PXPlacesMapPipelineComponentProvider)pipelineComponentProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->pipelineComponentProvider);
  return (PXPlacesMapPipelineComponentProvider *)WeakRetained;
}

- (id)selectedGeotaggablesForRenderable:(id)a3 mapView:(id)a4
{
  return (id)[a3 geotaggables];
}

@end