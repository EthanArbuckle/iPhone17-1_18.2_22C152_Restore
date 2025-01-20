@interface TransitSteppingAnalyticsDelegate
- (void)recordDetailsTapOnTray;
- (void)recordEndSteppingTapOnTray;
- (void)recordEnterGuidanceWithRouteDetails:(id)a3;
- (void)recordOpenRouteClusterActionSheet;
- (void)recordOverviewTapOnTray;
- (void)recordResumeFromOverviewTapOnTray;
- (void)recordSignAutoAdvanceWithRouteDetails:(id)a3;
- (void)recordSwipeToNextSignWithRouteDetails:(id)a3;
- (void)recordSwipeToPreviousSignWithRouteDetails:(id)a3;
- (void)recordTapOnTransitStationPOI;
- (void)recordTapToNextSignWithRouteDetails:(id)a3;
- (void)recordTapToPreviousSignWithRouteDetails:(id)a3;
@end

@implementation TransitSteppingAnalyticsDelegate

- (void)recordSwipeToNextSignWithRouteDetails:(id)a3
{
  id v3 = a3;
  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:6 onTarget:618 eventValue:0 routeDetails:v3];
}

- (void)recordSwipeToPreviousSignWithRouteDetails:(id)a3
{
  id v3 = a3;
  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:5 onTarget:618 eventValue:0 routeDetails:v3];
}

- (void)recordTapToNextSignWithRouteDetails:(id)a3
{
  id v3 = a3;
  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:16 onTarget:618 eventValue:0 routeDetails:v3];
}

- (void)recordTapToPreviousSignWithRouteDetails:(id)a3
{
  id v3 = a3;
  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:15 onTarget:618 eventValue:0 routeDetails:v3];
}

- (void)recordTapOnTransitStationPOI
{
  id v2 = +[MKMapService sharedService];
  [v2 captureUserAction:1011 onTarget:505 eventValue:0];
}

- (void)recordEnterGuidanceWithRouteDetails:(id)a3
{
  id v3 = a3;
  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:3065 onTarget:618 eventValue:0 routeDetails:v3];
}

- (void)recordSignAutoAdvanceWithRouteDetails:(id)a3
{
  id v3 = a3;
  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:3066 onTarget:618 eventValue:0 routeDetails:v3];
}

- (void)recordOpenRouteClusterActionSheet
{
  id v2 = +[MKMapService sharedService];
  [v2 captureUserAction:3037 onTarget:618 eventValue:0];
}

- (void)recordOverviewTapOnTray
{
  id v2 = +[MKMapService sharedService];
  [v2 captureUserAction:3050 onTarget:403 eventValue:0];
}

- (void)recordResumeFromOverviewTapOnTray
{
  id v2 = +[MKMapService sharedService];
  [v2 captureUserAction:3051 onTarget:403 eventValue:0];
}

- (void)recordDetailsTapOnTray
{
  id v2 = +[MKMapService sharedService];
  [v2 captureUserAction:3004 onTarget:403 eventValue:0];
}

- (void)recordEndSteppingTapOnTray
{
  id v2 = +[MKMapService sharedService];
  [v2 captureUserAction:3002 onTarget:403 eventValue:0];
}

@end