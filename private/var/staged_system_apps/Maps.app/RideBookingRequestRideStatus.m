@interface RideBookingRequestRideStatus
+ (RideBookingRequestRideStatus)statusWithApplication:(id)a3 error:(unint64_t)a4;
+ (RideBookingRequestRideStatus)statusWithApplication:(id)a3 rideOption:(id)a4 startingWaypointCoordinate:(CLLocationCoordinate2D)a5 origin:(id)a6 destination:(id)a7 loadingRequestRideStatus:(BOOL)a8 etaMinutesAtStartWaypoint:(id)a9;
- (BOOL)loadingRequest;
- (BOOL)requestExpired;
- (BOOL)requiresPassengerSelection;
- (CLLocationCoordinate2D)startWaypointCoordinate;
- (CLPlacemark)destination;
- (CLPlacemark)origin;
- (NSArray)cardFareLineItems;
- (NSNumber)etaMinutesAtStartWaypoint;
- (NSString)appleDisclaimer;
- (NSString)cardFormattedPriceRange;
- (NSString)cardSubtitle;
- (NSString)cardTitle;
- (NSString)disclaimerMessage;
- (NSString)expirationAlertMessage;
- (NSString)expirationAlertTitle;
- (NSString)openInAppCommandTitle;
- (NSString)paymentSelectionTitle;
- (NSString)requestCommandTitle;
- (NSUserActivity)userActivity;
- (RideBookingApplication)application;
- (RideBookingPaymentMethod)paymentMethod;
- (RideBookingRideOption)rideOption;
- (RidesharingSpecialPricingBadge)cardFormattedPriceRangeBadge;
- (UIImage)cardIcon;
- (id)description;
- (unint64_t)requestRideStatusError;
- (void)setApplication:(id)a3;
- (void)setDestination:(id)a3;
- (void)setEtaMinutesAtStartWaypoint:(id)a3;
- (void)setLoadingRequest:(BOOL)a3;
- (void)setOrigin:(id)a3;
- (void)setPaymentMethod:(id)a3;
- (void)setRequestExpired:(BOOL)a3;
- (void)setRequestRideStatusError:(unint64_t)a3;
- (void)setRequiresPassengerSelection:(BOOL)a3;
- (void)setRideOption:(id)a3;
- (void)setStartWaypointCoordinate:(CLLocationCoordinate2D)a3;
- (void)setUserActivity:(id)a3;
@end

@implementation RideBookingRequestRideStatus

- (UIImage)cardIcon
{
  v2 = [(RideBookingRequestRideStatus *)self rideOption];
  v3 = [v2 iconImage];

  return (UIImage *)v3;
}

- (NSString)cardTitle
{
  v2 = [(RideBookingRequestRideStatus *)self rideOption];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (NSString)cardSubtitle
{
  if ([(RideBookingRequestRideStatus *)self loadingRequest])
  {
    v3 = [(RideBookingRequestRideStatus *)self rideOption];
    v4 = [v3 detailedDescription];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = [(RideBookingRequestRideStatus *)self rideOption];
    v6 = [v5 passengerChoices];

    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      id v8 = v7;
      v9 = 0;
      uint64_t v10 = *(void *)v19;
      do
      {
        v11 = 0;
        v12 = v9;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v6);
          }
          v13 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v11);
          id v14 = [v12 unsignedIntegerValue];
          if (v14 <= [v13 numberOfPassengers]) {
            id v15 = [v13 numberOfPassengers];
          }
          else {
            id v15 = [v12 unsignedIntegerValue];
          }
          v9 = +[NSNumber numberWithUnsignedInteger:v15];

          v11 = (char *)v11 + 1;
          v12 = v9;
        }
        while (v8 != v11);
        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v16 = [(RideBookingRequestRideStatus *)self etaMinutesAtStartWaypoint];
    v4 = +[NSString _maps_ridesharingETA:v16 partySize:v9];
  }

  return (NSString *)v4;
}

- (NSString)cardFormattedPriceRange
{
  v2 = [(RideBookingRequestRideStatus *)self rideOption];
  v3 = [v2 priceRange];

  return (NSString *)v3;
}

- (RidesharingSpecialPricingBadge)cardFormattedPriceRangeBadge
{
  v2 = [(RideBookingRequestRideStatus *)self rideOption];
  v3 = [v2 specialPricingBadge];

  return (RidesharingSpecialPricingBadge *)v3;
}

- (NSString)openInAppCommandTitle
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"Open in %@ [Ridesharing]" value:@"localized string not found" table:0];
  v5 = [(RideBookingRequestRideStatus *)self application];
  v6 = [v5 name];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6);

  return (NSString *)v7;
}

- (NSArray)cardFareLineItems
{
  v2 = [(RideBookingRequestRideStatus *)self rideOption];
  v3 = [v2 intentsRideOption];
  v4 = +[RidesharingFareLineItem _fareItemsFromRideOption:v3];

  return (NSArray *)v4;
}

- (NSString)disclaimerMessage
{
  v2 = [(RideBookingRequestRideStatus *)self rideOption];
  v3 = [v2 intentsRideOption];
  v4 = [v3 disclaimerMessage];

  return (NSString *)v4;
}

- (NSString)appleDisclaimer
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Route, fares, and waits are estimates and may vary due to traffic, weather, or other factors.", @"localized string not found", 0 value table];

  return (NSString *)v3;
}

- (NSString)requestCommandTitle
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"Request %@ [Ridesharing]" value:@"localized string not found" table:0];
  v5 = [(RideBookingRequestRideStatus *)self rideOption];
  v6 = [v5 name];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6);

  return (NSString *)v7;
}

- (NSString)expirationAlertTitle
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"[ridesharing] expiration alert title" value:@"localized string not found" table:0];
  v5 = [(RideBookingRequestRideStatus *)self rideOption];
  v6 = [v5 name];
  id v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, v6);

  return (NSString *)v7;
}

- (NSString)expirationAlertMessage
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"[ridesharing] expiration alert message" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (NSString)paymentSelectionTitle
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"SavedPaymentMethod" value:@"localized string not found" table:0];

  id v5 = objc_alloc((Class)NSString);
  v6 = [(RideBookingRequestRideStatus *)self application];
  id v7 = [v6 name];
  id v8 = [v5 initWithFormat:v4, v7];

  return (NSString *)v8;
}

+ (RideBookingRequestRideStatus)statusWithApplication:(id)a3 error:(unint64_t)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  [v6 setApplication:v5];

  [v6 setRequestRideStatusError:a4];

  return (RideBookingRequestRideStatus *)v6;
}

+ (RideBookingRequestRideStatus)statusWithApplication:(id)a3 rideOption:(id)a4 startingWaypointCoordinate:(CLLocationCoordinate2D)a5 origin:(id)a6 destination:(id)a7 loadingRequestRideStatus:(BOOL)a8 etaMinutesAtStartWaypoint:(id)a9
{
  BOOL v9 = a8;
  double longitude = a5.longitude;
  double latitude = a5.latitude;
  id v16 = a9;
  id v17 = a7;
  id v18 = a6;
  id v19 = a4;
  id v20 = a3;
  long long v21 = objc_opt_new();
  [v21 setApplication:v20];

  [v21 setStartWaypointCoordinate:latitude, longitude];
  [v21 setOrigin:v18];

  [v21 setDestination:v17];
  [v21 setRideOption:v19];
  v22 = [v19 passengerChoices];

  [v21 setRequiresPassengerSelection:([v22 count] > 1)];
  v23 = [v21 rideOption];
  v24 = [v23 paymentMethods];
  id v25 = [v24 count];

  if (v25)
  {
    v26 = [v21 rideOption];
    v27 = [v26 paymentMethods];
    v28 = [v27 firstObject];
    [v21 setPaymentMethod:v28];
  }
  [v21 setLoadingRequest:v9];
  id v29 = [v16 copy];

  [v21 setEtaMinutesAtStartWaypoint:v29];

  return (RideBookingRequestRideStatus *)v21;
}

- (id)description
{
  return +[NSString stringWithFormat:@"RideOption: %@\nOrigin: %@\nDestination: %@\nError: %lu", self->_rideOption, self->_origin, self->_destination, self->_requestRideStatusError];
}

- (CLLocationCoordinate2D)startWaypointCoordinate
{
  double latitude = self->_startWaypointCoordinate.latitude;
  double longitude = self->_startWaypointCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setStartWaypointCoordinate:(CLLocationCoordinate2D)a3
{
  self->_startWaypointCoordinate = a3;
}

- (CLPlacemark)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
}

- (CLPlacemark)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (RideBookingApplication)application
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_application);

  return (RideBookingApplication *)WeakRetained;
}

- (void)setApplication:(id)a3
{
}

- (RideBookingRideOption)rideOption
{
  return self->_rideOption;
}

- (void)setRideOption:(id)a3
{
}

- (RideBookingPaymentMethod)paymentMethod
{
  return self->_paymentMethod;
}

- (void)setPaymentMethod:(id)a3
{
}

- (unint64_t)requestRideStatusError
{
  return self->_requestRideStatusError;
}

- (void)setRequestRideStatusError:(unint64_t)a3
{
  self->_requestRideStatusError = a3;
}

- (BOOL)loadingRequest
{
  return self->_loadingRequest;
}

- (void)setLoadingRequest:(BOOL)a3
{
  self->_loadingRequest = a3;
}

- (BOOL)requiresPassengerSelection
{
  return self->_requiresPassengerSelection;
}

- (void)setRequiresPassengerSelection:(BOOL)a3
{
  self->_requiresPassengerSelection = a3;
}

- (BOOL)requestExpired
{
  return self->_requestExpired;
}

- (void)setRequestExpired:(BOOL)a3
{
  self->_requestExpired = a3;
}

- (NSNumber)etaMinutesAtStartWaypoint
{
  return self->_etaMinutesAtStartWaypoint;
}

- (void)setEtaMinutesAtStartWaypoint:(id)a3
{
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_etaMinutesAtStartWaypoint, 0);
  objc_storeStrong((id *)&self->_paymentMethod, 0);
  objc_storeStrong((id *)&self->_rideOption, 0);
  objc_destroyWeak((id *)&self->_application);
  objc_storeStrong((id *)&self->_destination, 0);

  objc_storeStrong((id *)&self->_origin, 0);
}

@end