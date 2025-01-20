@interface _SearchNearbyShortcutHandlingTask
- (int)analyticsActionType;
- (void)performTask;
@end

@implementation _SearchNearbyShortcutHandlingTask

- (int)analyticsActionType
{
  return 17082;
}

- (void)performTask
{
  [(RichMapsActivityCreatingTaskImpl *)self taskStarted];
  v6 = objc_alloc_init(PresentNearbySearchAction);
  [(MapsAction *)v6 setUserLocationAccuracy:kCLLocationAccuracyKilometer];
  v3 = [RichMapsActivity alloc];
  v4 = objc_alloc_init(MapsActivity);
  v5 = [(RichMapsActivity *)v3 initWithMapsActivity:v4 mapsAction:v6];

  [(ShortcutHandlingTask *)self taskFinished:v5];
}

@end