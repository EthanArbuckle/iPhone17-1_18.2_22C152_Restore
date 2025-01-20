@interface _CategoryURLHandlingTask
- (void)performTask;
@end

@implementation _CategoryURLHandlingTask

- (void)performTask
{
  [(RichMapsActivityCreatingTaskImpl *)self taskStarted];
  v3 = [(URLHandlingTask *)self url];
  id v10 = +[GEOSearchCategory categoryForURL:v3];

  v4 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v4 setSearchCategory:v10];
  v5 = [[SearchAction alloc] initWithSearchItem:v4 alongRoute:0];
  [(MapsAction *)v5 setUserLocationAccuracy:kCLLocationAccuracyKilometer];
  v6 = objc_alloc_init(MapsActivity);
  id v7 = objc_alloc_init((Class)GEOURLOptions);
  [(MapsActivity *)v6 setDisplayOptions:v7];

  v8 = [(MapsActivity *)v6 displayOptions];
  [v8 setUserTrackingMode:1];

  v9 = [[RichMapsActivity alloc] initWithMapsActivity:v6 mapsAction:v5];
  [(URLHandlingTask *)self taskFinished:v9];
}

@end