@interface AddAStopAction
- (AddAStopAction)initWithMapItem:(id)a3;
- (BOOL)isCompatibleWithNavigation;
- (BOOL)isCompatibleWithRestorationTask;
- (MKMapItem)mapItem;
- (int)analyticsLaunchActionType;
- (void)setMapItem:(id)a3;
@end

@implementation AddAStopAction

- (AddAStopAction)initWithMapItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AddAStopAction;
  v6 = [(AddAStopAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mapItem, a3);
  }

  return v7;
}

- (BOOL)isCompatibleWithNavigation
{
  if (MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) != 0 || (MapsFeature_IsEnabled_Maps420()) {
    return 1;
  }

  return MapsFeature_IsEnabled_Maps182();
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 0;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end