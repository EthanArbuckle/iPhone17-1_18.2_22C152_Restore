@interface ToolbarController
- (BOOL)areAddSubmenusEnabled;
- (BOOL)isLocationButtonActive;
- (BOOL)isLocationButtonEnabled;
- (BOOL)isLocationServicesEnabled;
- (BOOL)isLookAroundActive;
- (BOOL)isLookAroundEnabled;
- (BOOL)isMapModeButtonEnabled;
- (BOOL)isRoutePlanningButtonActive;
- (BOOL)isRoutePlanningButtonEnabled;
- (BOOL)isShareButtonEnabled;
- (BOOL)isThirdDimensionButtonActive;
- (BOOL)isThirdDimensionButtonEnabled;
- (BOOL)isToggleSidebarButtonEnabled;
- (ToolbarController)initWithSettingsController:(id)a3;
- (void)setAddSubmenusEnabled:(BOOL)a3;
- (void)setLocationButtonActive:(BOOL)a3;
- (void)setLocationButtonEnabled:(BOOL)a3;
- (void)setLocationServicesEnabled:(BOOL)a3;
- (void)setLookAroundActive:(BOOL)a3;
- (void)setLookAroundEnabled:(BOOL)a3;
- (void)setMapModeButtonEnabled:(BOOL)a3;
- (void)setRoutePlanningButtonActive:(BOOL)a3;
- (void)setRoutePlanningButtonEnabled:(BOOL)a3;
- (void)setShareButtonEnabled:(BOOL)a3;
- (void)setThirdDimensionButtonActive:(BOOL)a3;
- (void)setThirdDimensionButtonEnabled:(BOOL)a3;
- (void)setToggleSidebarButtonEnabled:(BOOL)a3;
@end

@implementation ToolbarController

- (ToolbarController)initWithSettingsController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ToolbarController;
  return [(ToolbarController *)&v4 init];
}

- (BOOL)isToggleSidebarButtonEnabled
{
  return self->_toggleSidebarButtonEnabled;
}

- (void)setToggleSidebarButtonEnabled:(BOOL)a3
{
  self->_toggleSidebarButtonEnabled = a3;
}

- (BOOL)isLocationButtonEnabled
{
  return self->_locationButtonEnabled;
}

- (void)setLocationButtonEnabled:(BOOL)a3
{
  self->_locationButtonEnabled = a3;
}

- (BOOL)isLocationButtonActive
{
  return self->_locationButtonActive;
}

- (void)setLocationButtonActive:(BOOL)a3
{
  self->_locationButtonActive = a3;
}

- (BOOL)isLocationServicesEnabled
{
  return self->_locationServicesEnabled;
}

- (void)setLocationServicesEnabled:(BOOL)a3
{
  self->_locationServicesEnabled = a3;
}

- (BOOL)isMapModeButtonEnabled
{
  return self->_mapModeButtonEnabled;
}

- (void)setMapModeButtonEnabled:(BOOL)a3
{
  self->_mapModeButtonEnabled = a3;
}

- (BOOL)isRoutePlanningButtonActive
{
  return self->_routePlanningButtonActive;
}

- (void)setRoutePlanningButtonActive:(BOOL)a3
{
  self->_routePlanningButtonActive = a3;
}

- (BOOL)isRoutePlanningButtonEnabled
{
  return self->_routePlanningButtonEnabled;
}

- (void)setRoutePlanningButtonEnabled:(BOOL)a3
{
  self->_routePlanningButtonEnabled = a3;
}

- (BOOL)isThirdDimensionButtonEnabled
{
  return self->_thirdDimensionButtonEnabled;
}

- (void)setThirdDimensionButtonEnabled:(BOOL)a3
{
  self->_thirdDimensionButtonEnabled = a3;
}

- (BOOL)isThirdDimensionButtonActive
{
  return self->_thirdDimensionButtonActive;
}

- (void)setThirdDimensionButtonActive:(BOOL)a3
{
  self->_thirdDimensionButtonActive = a3;
}

- (BOOL)isLookAroundEnabled
{
  return self->_lookAroundEnabled;
}

- (void)setLookAroundEnabled:(BOOL)a3
{
  self->_lookAroundEnabled = a3;
}

- (BOOL)isLookAroundActive
{
  return self->_lookAroundActive;
}

- (void)setLookAroundActive:(BOOL)a3
{
  self->_lookAroundActive = a3;
}

- (BOOL)areAddSubmenusEnabled
{
  return self->_addSubmenusEnabled;
}

- (void)setAddSubmenusEnabled:(BOOL)a3
{
  self->_addSubmenusEnabled = a3;
}

- (BOOL)isShareButtonEnabled
{
  return self->_shareButtonEnabled;
}

- (void)setShareButtonEnabled:(BOOL)a3
{
  self->_shareButtonEnabled = a3;
}

@end