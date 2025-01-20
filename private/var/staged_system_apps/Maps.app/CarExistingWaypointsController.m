@interface CarExistingWaypointsController
- (BOOL)shouldStartLoadWhenBecomingCurrent;
- (CarExistingWaypointsController)initWithRoutePlanningSession:(id)a3;
- (RoutePlanningSession)routePlanningSession;
- (id)destinationSearchResultIfAvailable;
- (id)originSearchResult;
- (id)subtitleForCurrentDestination;
- (id)titleForCurrentDestination;
@end

@implementation CarExistingWaypointsController

- (CarExistingWaypointsController)initWithRoutePlanningSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarExistingWaypointsController;
  v6 = [(CarExistingWaypointsController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_routePlanningSession, a3);
  }

  return v7;
}

- (id)originSearchResult
{
  v2 = [(CarExistingWaypointsController *)self routePlanningSession];
  v3 = [v2 originDisplayableMarker];

  return v3;
}

- (id)destinationSearchResultIfAvailable
{
  v2 = [(CarExistingWaypointsController *)self routePlanningSession];
  v3 = [v2 destinationDisplayableMarker];

  return v3;
}

- (id)titleForCurrentDestination
{
  v2 = [(CarExistingWaypointsController *)self routePlanningSession];
  v3 = [v2 destinationName];

  return v3;
}

- (id)subtitleForCurrentDestination
{
  v2 = [(CarExistingWaypointsController *)self destinationSearchResultIfAvailable];
  v3 = [v2 mapItem];
  v4 = [v3 _addressFormattedAsShortenedAddress];

  return v4;
}

- (BOOL)shouldStartLoadWhenBecomingCurrent
{
  return 0;
}

- (RoutePlanningSession)routePlanningSession
{
  return self->_routePlanningSession;
}

- (void).cxx_destruct
{
}

@end