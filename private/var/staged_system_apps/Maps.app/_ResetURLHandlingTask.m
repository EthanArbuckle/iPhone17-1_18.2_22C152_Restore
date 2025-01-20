@interface _ResetURLHandlingTask
- (void)performTask;
@end

@implementation _ResetURLHandlingTask

- (void)performTask
{
  [(RichMapsActivityCreatingTaskImpl *)self taskStarted];
  v3 = objc_alloc_init(MapsActivity);
  id v4 = objc_alloc_init((Class)GEOURLOptions);
  [(MapsActivity *)v3 setDisplayOptions:v4];

  v5 = [(MapsActivity *)v3 displayOptions];
  [v5 setMapType:0];

  v6 = [RichMapsActivity alloc];
  v7 = objc_alloc_init(ResetAction);
  v8 = [(RichMapsActivity *)v6 initWithMapsActivity:v3 mapsAction:v7];

  v9.receiver = self;
  v9.super_class = (Class)_ResetURLHandlingTask;
  [(URLHandlingTask *)&v9 taskFinished:v8];
}

@end