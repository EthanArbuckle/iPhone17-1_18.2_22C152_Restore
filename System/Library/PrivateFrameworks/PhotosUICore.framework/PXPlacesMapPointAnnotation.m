@interface PXPlacesMapPointAnnotation
- (CLLocationCoordinate2D)coordinate;
- (NSOrderedSet)geotaggables;
- (NSString)description;
- (PXPlacesMapRenderer)renderer;
- (PXPlacesMapSelectionHandler)selectionHandler;
- (int64_t)index;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setGeotaggables:(id)a3;
- (void)setIndex:(int64_t)a3;
- (void)setRenderer:(id)a3;
- (void)setSelectionHandler:(id)a3;
@end

@implementation PXPlacesMapPointAnnotation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->geotaggables, 0);
  objc_destroyWeak((id *)&self->selectionHandler);
  objc_destroyWeak((id *)&self->renderer);
}

- (void)setIndex:(int64_t)a3
{
  self->index = a3;
}

- (int64_t)index
{
  return self->index;
}

- (void)setGeotaggables:(id)a3
{
}

- (NSOrderedSet)geotaggables
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSelectionHandler:(id)a3
{
}

- (PXPlacesMapSelectionHandler)selectionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->selectionHandler);
  return (PXPlacesMapSelectionHandler *)WeakRetained;
}

- (void)setRenderer:(id)a3
{
}

- (PXPlacesMapRenderer)renderer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->renderer);
  return (PXPlacesMapRenderer *)WeakRetained;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->coordinate = a3;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->coordinate.latitude;
  double longitude = self->coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; %lu geotaggables>",
                       objc_opt_class(),
                       self,
                       [(NSOrderedSet *)self->geotaggables count]);
}

@end