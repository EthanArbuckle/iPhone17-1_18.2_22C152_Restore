@interface PXPlacesMapPinRenderer
- (BOOL)supportsMoveAnimations;
- (PXPlacesMapPipelineComponentProvider)pipelineComponentProvider;
- (UIEdgeInsets)minimumEdgeInsets;
- (id)annotationForGeotaggables:(id)a3 initialCoordinate:(CLLocationCoordinate2D)a4;
- (id)viewForAnnotation:(id)a3 andMapView:(id)a4;
- (int64_t)annotationType;
- (void)setPipelineComponentProvider:(id)a3;
@end

@implementation PXPlacesMapPinRenderer

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

- (id)viewForAnnotation:(id)a3 andMapView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = [v6 dequeueReusableAnnotationViewWithIdentifier:v8];

  if (v9) {
    [v9 setAnnotation:v5];
  }
  else {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F30F80]) initWithAnnotation:v5 reuseIdentifier:v8];
  }

  return v9;
}

- (id)annotationForGeotaggables:(id)a3 initialCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v7 = a3;
  v8 = objc_alloc_init(PXPlacesMapPointAnnotation);
  -[PXPlacesMapPointAnnotation setCoordinate:](v8, "setCoordinate:", latitude, longitude);
  v9 = [(PXPlacesMapPinRenderer *)self pipelineComponentProvider];
  v10 = [v9 renderer];
  [(PXPlacesMapPointAnnotation *)v8 setRenderer:v10];

  v11 = [(PXPlacesMapPinRenderer *)self pipelineComponentProvider];
  v12 = [v11 selectionHandler];
  [(PXPlacesMapPointAnnotation *)v8 setSelectionHandler:v12];

  [(PXPlacesMapPointAnnotation *)v8 setGeotaggables:v7];
  return v8;
}

- (BOOL)supportsMoveAnimations
{
  return 1;
}

- (UIEdgeInsets)minimumEdgeInsets
{
  double v2 = 20.0;
  double v3 = 10.0;
  double v4 = 5.0;
  double v5 = 10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (int64_t)annotationType
{
  return 0;
}

@end