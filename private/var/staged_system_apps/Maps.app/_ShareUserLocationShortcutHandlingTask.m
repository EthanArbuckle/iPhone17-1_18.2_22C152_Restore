@interface _ShareUserLocationShortcutHandlingTask
- (int)analyticsActionType;
- (void)performTask;
@end

@implementation _ShareUserLocationShortcutHandlingTask

- (int)analyticsActionType
{
  return 17083;
}

- (void)performTask
{
  [(RichMapsActivityCreatingTaskImpl *)self taskStarted];
  v4 = objc_alloc_init(ShareUserLocationAction);
  [(MapsAction *)v4 setUserLocationAccuracy:kCLLocationAccuracyBest];
  v3 = [[RichMapsActivity alloc] initWithMapsAction:v4];
  [(ShortcutHandlingTask *)self taskFinished:v3];
}

@end