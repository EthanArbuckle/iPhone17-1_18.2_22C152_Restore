@interface MapsAppTestViewingPlacecard
- (BOOL)runTest;
- (void)placecardDidPresent;
@end

@implementation MapsAppTestViewingPlacecard

- (BOOL)runTest
{
  [(MapsAppTestPlacecardChrome *)self setPlacecardChromeDelegate:self];
  v4.receiver = self;
  v4.super_class = (Class)MapsAppTestViewingPlacecard;
  return [(MapsAppTestPlacecardChrome *)&v4 runTest];
}

- (void)placecardDidPresent
{
  v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptTestMaximizePlaceCardAnimated:1];

  objc_super v4 = [(MapsAppTest *)self options];
  v5 = [v4 objectForKeyedSubscript:@"duration"];
  [v5 doubleValue];
  double v7 = v6;

  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007BBF38;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
}

@end