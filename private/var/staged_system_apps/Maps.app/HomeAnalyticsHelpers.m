@interface HomeAnalyticsHelpers
+ (void)captureDisplayActionForSuggestionsEntry:(id)a3;
@end

@implementation HomeAnalyticsHelpers

+ (void)captureDisplayActionForSuggestionsEntry:(id)a3
{
  id v9 = a3;
  if ([v9 type] == (id)9)
  {
    v3 = [v9 stringForKey:@"MapsSuggestionsOriginBundleIDKey"];
    v4 = [v9 stringForKey:@"MapsSuggestionsRideBookingRideIDKey"];
    v5 = +[RideBookingAccessProxy rideBookingCurrentBookedSessionForAppIdentifier:v3 rideIdentifier:v4];
    [v5 setViewedInProactiveTray:1];
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  if ([v9 type] == (id)8)
  {
    v6 = [v9 MKMapItem];
    v3 = +[RestaurantReservationAnalyticsBookedSession currentAnalyticsBookedSessionForMuid:createIfNotPresent:](RestaurantReservationAnalyticsBookedSession, "currentAnalyticsBookedSessionForMuid:createIfNotPresent:", [v6 _muid], 1);

    [v3 setViewedInProactiveTray:1];
    v7 = [v9 MKMapItem];
    [v3 setMuid:[v7 _muid]];

    v4 = [v9 MKMapItem];
    v5 = [v4 _restaurantLink_firstProviderIdentifier];
    [v3 setAppID:v5];
    goto LABEL_5;
  }
  if ([v9 type] == (id)20)
  {
    v3 = +[MKMapService sharedService];
    [v3 captureUserAction:2108 onTarget:8 eventValue:0];
    goto LABEL_6;
  }
  if ([v9 type] == (id)21)
  {
    +[GEOAPPortal captureUserAction:2138 target:8 value:0];
    +[GEOAPPortal captureUserAction:339 target:8 value:0];
  }
  else if ([v9 type] == (id)11)
  {
    v3 = +[SearchFieldItem searchFieldItemsForRouteInSuggestionsEntry:v9];
    if ((unint64_t)[v3 count] <= 1) {
      uint64_t v8 = 70;
    }
    else {
      uint64_t v8 = 71;
    }
    +[GEOAPPortal captureUserAction:9002 target:v8 value:0];
    goto LABEL_6;
  }
LABEL_7:
}

@end