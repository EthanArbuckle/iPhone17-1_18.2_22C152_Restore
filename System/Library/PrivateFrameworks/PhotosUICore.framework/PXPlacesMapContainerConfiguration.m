@interface PXPlacesMapContainerConfiguration
+ (id)new;
- ($B7681AED98C8A3AAF93603046C9C96EE)initialCoordinateRegion;
- (BOOL)enableNearbyAssetsAffordance;
- (BOOL)gridViewEnabled;
- (NSString)localizedNavigationItemTitle;
- (PXPlacesMapContainerConfiguration)init;
- (PXPlacesMapContainerConfiguration)initWithConfiguration:(id)a3;
- (void)setEnableNearbyAssetsAffordance:(BOOL)a3;
- (void)setGridViewEnabled:(BOOL)a3;
- (void)setInitialCoordinateRegion:(id *)a3;
- (void)setLocalizedNavigationItemTitle:(id)a3;
@end

@implementation PXPlacesMapContainerConfiguration

- (void).cxx_destruct
{
}

- (void)setEnableNearbyAssetsAffordance:(BOOL)a3
{
  self->enableNearbyAssetsAffordance = a3;
}

- (BOOL)enableNearbyAssetsAffordance
{
  return self->enableNearbyAssetsAffordance;
}

- (void)setLocalizedNavigationItemTitle:(id)a3
{
}

- (NSString)localizedNavigationItemTitle
{
  return self->localizedNavigationItemTitle;
}

- (void)setInitialCoordinateRegion:(id *)a3
{
  self->_initialCoordinateRegion.center.latitude = v3;
  self->_initialCoordinateRegion.center.longitude = v4;
  self->_initialCoordinateRegion.span.latitudeDelta = v5;
  self->_initialCoordinateRegion.span.longitudeDelta = v6;
}

- ($B7681AED98C8A3AAF93603046C9C96EE)initialCoordinateRegion
{
  return self;
}

- (void)setGridViewEnabled:(BOOL)a3
{
  self->gridViewEnabled = a3;
}

- (BOOL)gridViewEnabled
{
  return self->gridViewEnabled;
}

- (PXPlacesMapContainerConfiguration)init
{
  CLLocationDegrees v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesMapContainerConfiguration.m", 43, @"%s is not available as initializer", "-[PXPlacesMapContainerConfiguration init]");

  abort();
}

- (PXPlacesMapContainerConfiguration)initWithConfiguration:(id)a3
{
  CLLocationDegrees v4 = (void (**)(id, id))a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPlacesMapContainerConfiguration;
  double v5 = [(PXPlacesMapContainerConfiguration *)&v9 init];
  double v6 = (PXPlacesMapContainerConfiguration *)v5;
  if (v5)
  {
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F30D30] + 16);
    *(_OWORD *)(v5 + 24) = *MEMORY[0x1E4F30D30];
    *(_OWORD *)(v5 + 40) = v7;
    v4[2](v4, v5);
  }

  return v6;
}

+ (id)new
{
  CLLocationDegrees v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXPlacesMapContainerConfiguration.m", 39, @"%s is not available as initializer", "+[PXPlacesMapContainerConfiguration new]");

  abort();
}

@end