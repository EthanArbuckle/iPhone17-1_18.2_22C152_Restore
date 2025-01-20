@interface RestaurantReservationRouter
- (BOOL)activeEventDiscoveryCompleted;
- (BOOL)hasActiveRestaurantUserBooking;
- (INRestaurantReservationUserBooking)activeRestaurantUserBooking;
- (NSUserActivity)activeRestaurantUserBookingActivity;
- (RestaurantReservationAnalyticsBookingSession)activeBookingSession;
- (RestaurantReservationRequester)restaurantReservationRequester;
- (RestaurantReservationRouter)initWithExtension:(id)a3 appStoreApp:(id)a4 mapItem:(id)a5 presenter:(id)a6;
- (_MXExtension)extension;
- (id)alertControllerForExtensionPermission;
- (id)alertControllerForLockedExtension;
- (id)reservationExtensionFlowViewController;
- (void)didChangeProtectionStatusForBundleId:(id)a3;
- (void)discoverActiveReservationEvents;
- (void)discoverAvailableBookings;
- (void)discoverDefaults;
- (void)discoverGuest;
- (void)requester:(id)a3 userCurrentBookingRequestDidFailWithError:(id)a4;
- (void)requesterReservationDefaultsRequestDidComplete:(id)a3;
- (void)requesterUserCurrentBookingRequestDidComplete:(id)a3;
- (void)resolve;
- (void)setActiveBookingSession:(id)a3;
- (void)setActiveEventDiscoveryCompleted:(BOOL)a3;
- (void)setActiveRestaurantUserBooking:(id)a3;
- (void)setActiveRestaurantUserBookingActivity:(id)a3;
- (void)setHasActiveRestaurantUserBooking:(BOOL)a3;
@end

@implementation RestaurantReservationRouter

- (RestaurantReservationRouter)initWithExtension:(id)a3 appStoreApp:(id)a4 mapItem:(id)a5 presenter:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)RestaurantReservationRouter;
  v15 = [(RestaurantReservationRouter *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_presenter, v14);
    objc_storeStrong((id *)&v16->_extension, a3);
    v17 = [[RestaurantReservationRequester alloc] initWithExtension:v11 mapItem:v13 delegate:v16];
    restaurantReservationRequester = v16->_restaurantReservationRequester;
    v16->_restaurantReservationRequester = v17;

    v19 = objc_alloc_init(RestaurantReservationAnalyticsBookingSession);
    activeBookingSession = v16->_activeBookingSession;
    v16->_activeBookingSession = v19;

    objc_storeStrong((id *)&v16->_appStoreApp, a4);
  }

  return v16;
}

- (void)resolve
{
  extension = self->_extension;
  if (!extension
    || ([(_MXExtension *)extension _containingAppIdentifer],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = isExtensionHidden(),
        v4,
        v5))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    [WeakRetained presentAppStoreApp:self->_appStoreApp];
LABEL_4:

    return;
  }
  if (([(_MXExtension *)self->_extension isEnabled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    id v11 = [(RestaurantReservationRouter *)self alertControllerForExtensionPermission];
    [WeakRetained presentPermissionsController:v11];

    goto LABEL_4;
  }
  v6 = [(_MXExtension *)self->_extension _containingAppIdentifer];
  int v7 = isExtensionLocked();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_presenter);
    v9 = [(RestaurantReservationRouter *)self alertControllerForLockedExtension];
    [v8 presentPermissionsController:v9];

    sub_100018584();
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue();
    v10 = [WeakRetained oneAppGuardian];
    [v10 registerAppTracker:self];

    goto LABEL_4;
  }

  [(RestaurantReservationRouter *)self discoverActiveReservationEvents];
}

- (void)discoverDefaults
{
  id v2 = [(RestaurantReservationRouter *)self restaurantReservationRequester];
  [v2 requestReservationDefaults];
}

- (void)requesterReservationDefaultsRequestDidComplete:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 reservationDefaultsResponse];
  if (v4)
  {
    int v5 = (void *)v4;
    v6 = [v8 reservationDefaultsResponse];
    id v7 = [v6 code];

    if (!v7)
    {
      [(RestaurantReservationRouter *)self discoverAvailableBookings];
      [(RestaurantReservationRouter *)self discoverGuest];
    }
  }
}

- (void)discoverAvailableBookings
{
  id v15 = +[NSDate date];
  v3 = [(RestaurantReservationRouter *)self restaurantReservationRequester];
  uint64_t v4 = [v3 reservationDefaultsResponse];
  if (v4)
  {
    int v5 = (void *)v4;
    v6 = [(RestaurantReservationRouter *)self restaurantReservationRequester];
    id v7 = [v6 reservationDefaultsResponse];
    id v8 = [v7 code];

    if (v8)
    {
      uint64_t v9 = 2;
      goto LABEL_7;
    }
    v10 = [(RestaurantReservationRouter *)self restaurantReservationRequester];
    id v11 = [v10 reservationDefaultsResponse];
    uint64_t v9 = (uint64_t)[v11 defaultPartySize];

    v3 = [(RestaurantReservationRouter *)self restaurantReservationRequester];
    id v12 = [v3 reservationDefaultsResponse];
    uint64_t v13 = [v12 defaultBookingDate];

    id v15 = (id)v13;
  }
  else
  {
    uint64_t v9 = 2;
  }

LABEL_7:
  id v14 = [(RestaurantReservationRouter *)self restaurantReservationRequester];
  [v14 requestAvailableBookingsForPreferredTime:v15 partySize:v9];
}

- (void)discoverGuest
{
  id v2 = [(RestaurantReservationRouter *)self restaurantReservationRequester];
  [v2 requestGuest];
}

- (void)discoverActiveReservationEvents
{
  v3 = [(RestaurantReservationRouter *)self extension];

  if (v3)
  {
    id v4 = [(RestaurantReservationRouter *)self restaurantReservationRequester];
    [v4 requestUserCurrentBookingWithRelevanceWindow:1800.0];
  }
}

- (void)requesterUserCurrentBookingRequestDidComplete:(id)a3
{
  id v4 = a3;
  int v5 = +[NSOperationQueue mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100D25D44;
  v7[3] = &unk_1012E5D58;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (void)requester:(id)a3 userCurrentBookingRequestDidFailWithError:(id)a4
{
  int v5 = +[NSOperationQueue mainQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100D25F28;
  v6[3] = &unk_1012E5D08;
  v6[4] = self;
  [v5 addOperationWithBlock:v6];
}

- (id)alertControllerForLockedExtension
{
  v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"reservation_book_with_app_title" value:@"localized string not found" table:0];

  id v5 = objc_alloc((Class)NSString);
  id v6 = [(RestaurantReservationRouter *)self extension];
  id v7 = [v6 displayName];
  id v8 = [v5 initWithFormat:v4, v7];

  uint64_t v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"reservations_extension_locked_alert_key" value:@"localized string not found" table:0];

  id v11 = objc_alloc((Class)NSString);
  id v12 = [(RestaurantReservationRouter *)self extension];
  uint64_t v13 = [v12 displayName];
  id v14 = [v11 initWithFormat:v10, v13];

  id v15 = +[ReservationErrorAlertController alertControllerWithTitle:v8 message:v14 preferredStyle:1];
  v16 = [(RestaurantReservationRouter *)self activeBookingSession];
  [(RestaurantReservationRouter *)self updateSessionAsInstallCompletedIfNeeded:v16];

  v17 = [(RestaurantReservationRouter *)self activeBookingSession];
  [v15 setBookingSession:v17];

  [v15 setDisplayView:2];
  v18 = +[NSBundle mainBundle];
  v19 = [v18 localizedStringForKey:@"OK [Alert dismissal]" value:@"localized string not found" table:0];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100D2622C;
  v22[3] = &unk_1012E6DE0;
  v22[4] = self;
  v20 = +[UIAlertAction actionWithTitle:v19 style:1 handler:v22];
  [v15 addAction:v20];

  return v15;
}

- (id)alertControllerForExtensionPermission
{
  v3 = +[NSBundle mainBundle];
  v24 = [v3 localizedStringForKey:@"reservation_book_with_app_title" value:@"localized string not found" table:0];

  id v4 = objc_alloc((Class)NSString);
  id v5 = [(RestaurantReservationRouter *)self extension];
  id v6 = [v5 displayName];
  id v23 = [v4 initWithFormat:v24, v6];

  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"reservations_agree_to_terms_alert_key" value:@"localized string not found" table:0];

  id v9 = objc_alloc((Class)NSString);
  v10 = [(RestaurantReservationRouter *)self extension];
  id v11 = [v10 displayName];
  id v12 = [v9 initWithFormat:v8, v11];

  uint64_t v13 = +[NSBundle mainBundle];
  id v14 = [v13 localizedStringForKey:@"reservation_enable_extension_button_title_key" value:@"localized string not found" table:0];

  id v15 = +[ReservationErrorAlertController alertControllerWithTitle:v23 message:v12 preferredStyle:1];
  v16 = [(RestaurantReservationRouter *)self activeBookingSession];
  [(RestaurantReservationRouter *)self updateSessionAsInstallCompletedIfNeeded:v16];

  v17 = [(RestaurantReservationRouter *)self activeBookingSession];
  [v15 setBookingSession:v17];

  [v15 setDisplayView:2];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100D265E0;
  v26[3] = &unk_1012E6DE0;
  v26[4] = self;
  v18 = +[UIAlertAction actionWithTitle:v14 style:0 handler:v26];
  v19 = +[NSBundle mainBundle];
  v20 = [v19 localizedStringForKey:@"Cancel" value:@"localized string not found" table:0];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100D2666C;
  v25[3] = &unk_1012E6DE0;
  v25[4] = self;
  v21 = +[UIAlertAction actionWithTitle:v20 style:1 handler:v25];

  [v15 addAction:v18];
  [v15 addAction:v21];

  return v15;
}

- (id)reservationExtensionFlowViewController
{
  v3 = [RestaurantReservationExtensionFlowViewController alloc];
  id v4 = [(RestaurantReservationRouter *)self restaurantReservationRequester];
  id v5 = [(RestaurantReservationExtensionFlowViewController *)v3 initWithRestaurantReservationRequester:v4];

  if (![(RestaurantReservationRouter *)self hasActiveRestaurantUserBooking])
  {
    id v6 = [(RestaurantReservationRouter *)self activeBookingSession];
    [(RestaurantReservationRouter *)self updateSessionAsInstallCompletedIfNeeded:v6];

    id v7 = [(RestaurantReservationRouter *)self activeBookingSession];
    [(RestaurantReservationExtensionFlowViewController *)v5 setBookingSession:v7];
  }

  return v5;
}

- (void)didChangeProtectionStatusForBundleId:(id)a3
{
  extension = self->_extension;
  id v5 = a3;
  id v6 = [(_MXExtension *)extension identifier];
  unsigned int v7 = [v6 containsString:v5];

  if (v7)
  {
    id v8 = [(RestaurantReservationRouter *)self activeBookingSession];
    [v8 endSessionWithState:2];

    sub_100018584();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = [v10 oneAppGuardian];
    [v9 unregisterAppTracker:self];
  }
}

- (RestaurantReservationRequester)restaurantReservationRequester
{
  return self->_restaurantReservationRequester;
}

- (_MXExtension)extension
{
  return self->_extension;
}

- (RestaurantReservationAnalyticsBookingSession)activeBookingSession
{
  return self->_activeBookingSession;
}

- (void)setActiveBookingSession:(id)a3
{
}

- (BOOL)hasActiveRestaurantUserBooking
{
  return self->_hasActiveRestaurantUserBooking;
}

- (void)setHasActiveRestaurantUserBooking:(BOOL)a3
{
  self->_hasActiveRestaurantUserBooking = a3;
}

- (BOOL)activeEventDiscoveryCompleted
{
  return self->_activeEventDiscoveryCompleted;
}

- (void)setActiveEventDiscoveryCompleted:(BOOL)a3
{
  self->_activeEventDiscoveryCompleted = a3;
}

- (INRestaurantReservationUserBooking)activeRestaurantUserBooking
{
  return self->_activeRestaurantUserBooking;
}

- (void)setActiveRestaurantUserBooking:(id)a3
{
}

- (NSUserActivity)activeRestaurantUserBookingActivity
{
  return self->_activeRestaurantUserBookingActivity;
}

- (void)setActiveRestaurantUserBookingActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeRestaurantUserBookingActivity, 0);
  objc_storeStrong((id *)&self->_activeRestaurantUserBooking, 0);
  objc_storeStrong((id *)&self->_activeBookingSession, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_restaurantReservationRequester, 0);
  objc_storeStrong((id *)&self->_appStoreApp, 0);

  objc_destroyWeak((id *)&self->_presenter);
}

@end