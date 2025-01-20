@interface _MarkUserLocationShortcutHandlingTask
- (int)analyticsActionType;
- (void)performTask;
@end

@implementation _MarkUserLocationShortcutHandlingTask

- (int)analyticsActionType
{
  return 17081;
}

- (void)performTask
{
  [(RichMapsActivityCreatingTaskImpl *)self taskStarted];
  v4 = objc_alloc_init(MarkUserLocationAction);
  [(MapsAction *)v4 setUserLocationAccuracy:kCLLocationAccuracyBest];
  v3 = [[RichMapsActivity alloc] initWithMapsAction:v4];
  [(ShortcutHandlingTask *)self taskFinished:v3];
}

@end