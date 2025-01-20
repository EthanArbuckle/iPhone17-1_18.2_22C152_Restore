@interface MapSelectionManagerState
- (MKMapCamera)camera;
- (NSArray)selectedAnnotations;
- (NSSet)customPOIKeys;
- (VKLabelMarker)labelMarker;
- (void)setCamera:(id)a3;
- (void)setCustomPOIKeys:(id)a3;
- (void)setLabelMarker:(id)a3;
- (void)setSelectedAnnotations:(id)a3;
@end

@implementation MapSelectionManagerState

- (VKLabelMarker)labelMarker
{
  return self->_labelMarker;
}

- (void)setLabelMarker:(id)a3
{
}

- (NSSet)customPOIKeys
{
  return self->_customPOIKeys;
}

- (void)setCustomPOIKeys:(id)a3
{
}

- (NSArray)selectedAnnotations
{
  return self->_selectedAnnotations;
}

- (void)setSelectedAnnotations:(id)a3
{
}

- (MKMapCamera)camera
{
  return self->_camera;
}

- (void)setCamera:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_selectedAnnotations, 0);
  objc_storeStrong((id *)&self->_customPOIKeys, 0);

  objc_storeStrong((id *)&self->_labelMarker, 0);
}

@end