@interface FindMyAction
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)isCompatibleWithNavigation;
- (BOOL)isCompatibleWithRestorationTask;
- (FindMyAction)initWithFindMyHandleIdentifier:(id)a3 coordinate:(id)a4;
- (NSString)findMyHandleIdentifier;
- (int)analyticsLaunchActionType;
@end

@implementation FindMyAction

- (FindMyAction)initWithFindMyHandleIdentifier:(id)a3 coordinate:(id)a4
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FindMyAction;
  v8 = [(FindMyAction *)&v12 init];
  if (v8)
  {
    v9 = (NSString *)[v7 copy];
    findMyHandleIdentifier = v8->_findMyHandleIdentifier;
    v8->_findMyHandleIdentifier = v9;

    v8->_coordinate.latitude = var0;
    v8->_coordinate.longitude = var1;
  }

  return v8;
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

- (NSString)findMyHandleIdentifier
{
  return self->_findMyHandleIdentifier;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double var1 = longitude;
  result.double var0 = latitude;
  return result;
}

- (void).cxx_destruct
{
}

@end