@interface RestaurantReservationRequestController
- (BOOL)contentLikelyChanged;
- (ExtensionFlowViewController)flowViewController;
- (INGetRestaurantGuestIntentResponse)guestResponse;
- (INRestaurantReservationBooking)selectedBooking;
- (INRestaurantReservationUserBooking)activeReservation;
- (MKMapItem)mapItem;
- (ReservationAnalyticsCaptor)analyticsCaptor;
- (ReservationRequestRefinementViewController)reservationRequestRefinementViewController;
- (RestaurantReservationAnalyticsBookingSession)analyticsBookingSession;
- (RestaurantReservationConfirmationViewController)reservationSuccessViewController;
- (RestaurantReservationErrorController)errorController;
- (RestaurantReservationRequestController)initWithFlowController:(id)a3 reservationRequester:(id)a4;
- (RestaurantReservationRequestControllerDelegate)delegate;
- (RestaurantReservationRequester)reservationRequester;
- (RestaurantReservationTableViewController)reservationTableViewController;
- (id)appIcon;
- (id)appName;
- (id)defaultDate;
- (id)defaultGuestDisplayPreferences;
- (id)setupAnalyticsBookedSession;
- (unint64_t)defaultPartySize;
- (void)bookingSelectionViewController:(id)a3 didSelectBooking:(id)a4 offer:(id)a5;
- (void)bookingSelectionViewControllerDidSelectDateRefinement:(id)a3;
- (void)bookingSelectionViewControllerDidSelectOpenInApp:(id)a3;
- (void)bookingSelectionViewControllerDidUpdatePartySize:(id)a3;
- (void)configureHeaderForBranding:(BOOL)a3;
- (void)confirmBooking:(id)a3 guest:(id)a4 selectedOffer:(id)a5 specialRequest:(id)a6;
- (void)didChangeProtectionStatusForBundleId:(id)a3;
- (void)extensionFlowHeaderViewDidTapDismiss:(id)a3;
- (void)extensionTextInputViewControllerDidComplete:(id)a3;
- (void)handleRequestedTimeCompletion;
- (void)headerCellSelected;
- (void)kickoffRequests;
- (void)openAppWithActivity:(id)a3;
- (void)present;
- (void)pushReservationRefinementController;
- (void)pushRestaurantReservationController;
- (void)pushSuccessScreen;
- (void)requestAvailableBookingsWithDate:(id)a3 partySize:(unint64_t)a4;
- (void)requester:(id)a3 availableBookingsRequestDidFailWithError:(id)a4;
- (void)requester:(id)a3 bookRestaurantReservationRequestDidFailWithError:(id)a4;
- (void)requester:(id)a3 guestRequestDidFailWithError:(id)a4;
- (void)requester:(id)a3 reservationDefaultsRequestDidFailWithError:(id)a4;
- (void)requesterAvailableBookingsRequestDidComplete:(id)a3;
- (void)requesterBookRestaurantReservationRequestDidComplete:(id)a3;
- (void)requesterGuestRequestDidComplete:(id)a3;
- (void)requesterReservationDefaultsRequestDidComplete:(id)a3;
- (void)requesterUserCurrentBookingRequestDidComplete:(id)a3;
- (void)reservationContactInfoViewControllerDidSelectDone:(id)a3;
- (void)reservationRequestRefinementViewControllerDidRefine:(id)a3;
- (void)restaurantReservationConfirmationViewControllerDidSelectEditReservation:(id)a3;
- (void)restaurantReservationConfirmationViewControllerRequestStatusUpdateForUserBooking:(id)a3;
- (void)setAnalyticsBookingSession:(id)a3;
- (void)setAnalyticsCaptor:(id)a3;
- (void)setContentLikelyChanged:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorController:(id)a3;
- (void)setFlowViewController:(id)a3;
- (void)setGuestResponse:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setReservationRequestRefinementViewController:(id)a3;
- (void)setReservationRequester:(id)a3;
- (void)setReservationSuccessViewController:(id)a3;
- (void)setReservationTableViewController:(id)a3;
- (void)setSelectedBooking:(id)a3;
- (void)setupAnalyticsBookingSession;
- (void)specialRequestCellSelected;
- (void)updateReservationTableViewController;
- (void)userInfoCellSelected;
- (void)willResignCurrent:(BOOL)a3;
@end

@implementation RestaurantReservationRequestController

- (RestaurantReservationRequestController)initWithFlowController:(id)a3 reservationRequester:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)RestaurantReservationRequestController;
  v8 = [(RestaurantReservationRequestController *)&v20 init];
  v9 = v8;
  if (v8)
  {
    [(RestaurantReservationRequestController *)v8 setFlowViewController:v6];
    [(RestaurantReservationRequestController *)v9 setReservationRequester:v7];
    [v7 setDelegate:v9];
    v10 = [v7 mapItem];
    [(RestaurantReservationRequestController *)v9 setMapItem:v10];

    [(RestaurantReservationRequestController *)v9 configureHeaderForBranding:0];
    v11 = [(RestaurantReservationRequestController *)v9 flowViewController];
    v12 = [v11 headerView];
    [v12 setDelegate:v9];

    v13 = objc_opt_new();
    [(RestaurantReservationRequestController *)v9 setAnalyticsCaptor:v13];

    v14 = [(RestaurantReservationRequestController *)v9 mapItem];
    v15 = [(RestaurantReservationRequestController *)v9 analyticsCaptor];
    [v15 setMapItem:v14];

    v16 = sub_100018584();
    uint64_t v17 = [v16 oneAppGuardian];
    appGuardian = v9->_appGuardian;
    v9->_appGuardian = (MapsSuggestionsAppGuardian *)v17;

    [(MapsSuggestionsAppGuardian *)v9->_appGuardian registerAppTracker:v9];
  }

  return v9;
}

- (void)present
{
  v3 = [(RestaurantReservationRequestController *)self activeReservation];

  if (v3)
  {
    v4 = [(RestaurantReservationRequestController *)self reservationRequester];
    v5 = [v4 mapItem];
    id v6 = +[RestaurantReservationAnalyticsBookedSession currentAnalyticsBookedSessionForMuid:createIfNotPresent:](RestaurantReservationAnalyticsBookedSession, "currentAnalyticsBookedSessionForMuid:createIfNotPresent:", [v5 _muid], 1);
    [v6 setViewedDetailsFromPlacecard:1];

    [(RestaurantReservationRequestController *)self pushSuccessScreen];
  }
  else
  {
    [(RestaurantReservationRequestController *)self kickoffRequests];
    [(RestaurantReservationRequestController *)self pushRestaurantReservationController];
  }
}

- (void)willResignCurrent:(BOOL)a3
{
  v4 = [(RestaurantReservationRequestController *)self analyticsBookingSession];
  [v4 endSession];

  id v6 = [(RestaurantReservationRequestController *)self mapItem];
  v5 = +[RestaurantReservationAnalyticsBookedSession currentAnalyticsBookedSessionForMuid:createIfNotPresent:](RestaurantReservationAnalyticsBookedSession, "currentAnalyticsBookedSessionForMuid:createIfNotPresent:", [v6 _muid], 0);
  [v5 endSession];
}

- (void)setupAnalyticsBookingSession
{
  id v2 = [(RestaurantReservationRequestController *)self analyticsBookingSession];
  [v2 setCurrentState:2];
}

- (id)setupAnalyticsBookedSession
{
  v3 = [(RestaurantReservationRequestController *)self reservationRequester];
  v4 = [v3 mapItem];
  v5 = +[RestaurantReservationAnalyticsBookedSession currentAnalyticsBookedSessionForMuid:createIfNotPresent:](RestaurantReservationAnalyticsBookedSession, "currentAnalyticsBookedSessionForMuid:createIfNotPresent:", [v4 _muid], 1);

  id v6 = [(RestaurantReservationRequestController *)self reservationRequester];
  id v7 = [v6 extension];
  v8 = [v7 identifier];
  [v5 setAppID:v8];

  v9 = [(RestaurantReservationRequestController *)self reservationRequester];
  v10 = [v9 mapItem];
  objc_msgSend(v5, "setMuid:", objc_msgSend(v10, "_muid"));

  v11 = [(RestaurantReservationRequestController *)self reservationRequester];
  v12 = [v11 extension];
  [v5 setHasAppsInstalled:v12 != 0];

  v13 = [(RestaurantReservationRequestController *)self reservationRequester];
  v14 = [v13 extension];
  [v5 setHasAppsEnabled:[v14 isEnabled]];

  return v5;
}

- (void)pushRestaurantReservationController
{
  [(RestaurantReservationRequestController *)self setupAnalyticsBookingSession];
  v3 = [(RestaurantReservationRequestController *)self reservationTableViewController];

  if (!v3)
  {
    v4 = [RestaurantReservationTableViewController alloc];
    v5 = [(RestaurantReservationRequestController *)self analyticsCaptor];
    id v6 = [(RestaurantReservationRequestController *)self analyticsBookingSession];
    id v7 = [(RestaurantReservationTableViewController *)v4 initWithAnalyticsCaptor:v5 analyticsBookingSession:v6];
    [(RestaurantReservationRequestController *)self setReservationTableViewController:v7];
  }
  [(RestaurantReservationRequestController *)self updateReservationTableViewController];
  [(RestaurantReservationRequestController *)self configureHeaderForBranding:1];
  v8 = [(RestaurantReservationRequestController *)self analyticsBookingSession];
  [v8 setCurrentView:5];

  id v10 = [(RestaurantReservationRequestController *)self flowViewController];
  v9 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  [v10 pushViewController:v9];
}

- (id)defaultDate
{
  v3 = [(RestaurantReservationRequestController *)self reservationRequester];
  v4 = [v3 availableBookingsRequest];
  v5 = [(RestaurantReservationRequestController *)self mapItem];
  id v6 = [v5 timeZone];
  id v7 = [v4 _maps_preferredBookingDateWithTimeZone:v6];

  if (v7)
  {
    id v8 = v7;
    goto LABEL_9;
  }
  v9 = [(RestaurantReservationRequestController *)self reservationRequester];
  if ([v9 reservationDefaultsRequestPending])
  {

LABEL_7:
    v12 = +[NSCalendar currentCalendar];
    v15 = +[NSDate date];
    v13 = [v12 components:124 fromDate:v15];

    [v13 setHour:[v13 hour] + 1];
    [v13 setMinute:0];
    uint64_t v14 = [v12 dateFromComponents:v13];
    goto LABEL_8;
  }
  id v10 = [(RestaurantReservationRequestController *)self reservationRequester];
  v11 = [v10 reservationDefaultsResponse];

  if (!v11) {
    goto LABEL_7;
  }
  v12 = [(RestaurantReservationRequestController *)self reservationRequester];
  v13 = [v12 reservationDefaultsResponse];
  uint64_t v14 = [v13 defaultBookingDate];
LABEL_8:
  id v8 = (id)v14;

LABEL_9:

  return v8;
}

- (unint64_t)defaultPartySize
{
  v3 = [(RestaurantReservationRequestController *)self reservationRequester];
  uint64_t v4 = [v3 availableBookingsRequest];
  if (v4)
  {
    v5 = (void *)v4;
    id v6 = [(RestaurantReservationRequestController *)self reservationRequester];
    id v7 = [v6 availableBookingsRequest];
    id v8 = [v7 partySize];

    if (v8)
    {
      v9 = [(RestaurantReservationRequestController *)self reservationRequester];
      id v10 = [v9 availableBookingsRequest];
      id v11 = [v10 partySize];
      goto LABEL_10;
    }
  }
  else
  {
  }
  v9 = [(RestaurantReservationRequestController *)self reservationRequester];
  if (([v9 reservationDefaultsRequestPending] & 1) == 0)
  {
    id v10 = [(RestaurantReservationRequestController *)self reservationRequester];
    uint64_t v13 = [v10 reservationDefaultsResponse];
    if (!v13)
    {
      unint64_t v12 = 2;
      goto LABEL_11;
    }
    uint64_t v14 = (void *)v13;
    v15 = [(RestaurantReservationRequestController *)self reservationRequester];
    v16 = [v15 reservationDefaultsResponse];
    id v17 = [v16 defaultPartySize];

    if (!v17) {
      return 2;
    }
    v9 = [(RestaurantReservationRequestController *)self reservationRequester];
    id v10 = [v9 reservationDefaultsResponse];
    id v11 = [v10 defaultPartySize];
LABEL_10:
    unint64_t v12 = (unint64_t)v11;
LABEL_11:

    goto LABEL_12;
  }
  unint64_t v12 = 2;
LABEL_12:

  return v12;
}

- (INRestaurantReservationUserBooking)activeReservation
{
  v3 = [(RestaurantReservationRequestController *)self reservationRequester];
  uint64_t v4 = [v3 bookReservationResponse];

  v5 = [(RestaurantReservationRequestController *)self reservationRequester];
  id v6 = v5;
  if (v4)
  {
    id v7 = [v5 bookReservationResponse];
    id v8 = [v7 userBooking];
  }
  else
  {
    v9 = [v5 userCurrentBookingResponse];
    id v10 = [v9 userCurrentBookings];
    id v11 = [v10 firstObject];

    if (objc_msgSend(v11, "_maps_shouldBeDisplayed"))
    {
      id v6 = v11;
      id v8 = v6;
    }
    else
    {
      id v8 = 0;
      id v6 = v11;
    }
  }

  return (INRestaurantReservationUserBooking *)v8;
}

- (id)appName
{
  id v2 = [(RestaurantReservationRequestController *)self reservationRequester];
  v3 = [v2 extension];
  uint64_t v4 = [v3 displayName];

  return v4;
}

- (id)appIcon
{
  id v2 = [(RestaurantReservationRequestController *)self reservationRequester];
  v3 = [v2 extension];
  uint64_t v4 = [v3 _iconWithFormat:1];

  return v4;
}

- (id)defaultGuestDisplayPreferences
{
  id v2 = objc_alloc_init((Class)INRestaurantGuestDisplayPreferences);
  [v2 setPhoneNumberFieldShouldBeDisplayed:1];
  [v2 setNameFieldShouldBeDisplayed:1];
  [v2 setEmailAddressFieldShouldBeDisplayed:1];

  return v2;
}

- (void)pushReservationRefinementController
{
  v3 = [(RestaurantReservationRequestController *)self reservationRequester];
  uint64_t v4 = [v3 reservationDefaultsResponse];
  v5 = [v4 minimumPartySize];
  if (v5)
  {
    id v6 = [(RestaurantReservationRequestController *)self reservationRequester];
    id v7 = [v6 reservationDefaultsResponse];
    id v8 = [v7 minimumPartySize];
    uint64_t v9 = (uint64_t)[v8 unsignedIntegerValue];
  }
  else
  {
    uint64_t v9 = 1;
  }

  id v10 = [(RestaurantReservationRequestController *)self reservationRequester];
  id v11 = [v10 reservationDefaultsResponse];
  unint64_t v12 = [v11 maximumPartySize];
  if (v12)
  {
    uint64_t v13 = [(RestaurantReservationRequestController *)self reservationRequester];
    uint64_t v14 = [v13 reservationDefaultsResponse];
    v15 = [v14 maximumPartySize];
    uint64_t v16 = (uint64_t)[v15 unsignedIntegerValue];
  }
  else
  {
    uint64_t v16 = 6;
  }

  id v17 = [ReservationRequestRefinementViewController alloc];
  v18 = [(RestaurantReservationRequestController *)self defaultDate];
  unint64_t v19 = [(RestaurantReservationRequestController *)self defaultPartySize];
  objc_super v20 = [(RestaurantReservationRequestController *)self analyticsCaptor];
  v21 = [(RestaurantReservationRequestController *)self mapItem];
  v22 = [v21 timeZone];
  v23 = [(RestaurantReservationRequestController *)self analyticsBookingSession];
  v24 = [(ReservationRequestRefinementViewController *)v17 initWithDate:v18 partySize:v19 minimumPartySize:v9 maximumPartySize:v16 analyticsCaptor:v20 timeZone:v22 analyticsBookingSession:v23];
  [(RestaurantReservationRequestController *)self setReservationRequestRefinementViewController:v24];

  v25 = [(RestaurantReservationRequestController *)self reservationRequestRefinementViewController];
  [v25 setRefinementDelegate:self];

  v26 = [(RestaurantReservationRequestController *)self analyticsBookingSession];
  [v26 setCurrentView:3];

  id v28 = [(RestaurantReservationRequestController *)self flowViewController];
  v27 = [(RestaurantReservationRequestController *)self reservationRequestRefinementViewController];
  [v28 pushViewController:v27];
}

- (void)pushSuccessScreen
{
  id v3 = [(RestaurantReservationRequestController *)self setupAnalyticsBookedSession];
  uint64_t v4 = [RestaurantReservationConfirmationViewController alloc];
  v5 = [(RestaurantReservationRequestController *)self activeReservation];
  id v6 = [(RestaurantReservationRequestController *)self mapItem];
  id v7 = [(RestaurantReservationRequestController *)self appName];
  id v8 = [(RestaurantReservationRequestController *)self analyticsCaptor];
  uint64_t v9 = [(RestaurantReservationConfirmationViewController *)v4 initWithUserBooking:v5 mapItem:v6 appName:v7 analyticsCaptor:v8];
  [(RestaurantReservationRequestController *)self setReservationSuccessViewController:v9];

  id v10 = [(RestaurantReservationRequestController *)self reservationSuccessViewController];
  [v10 setReservationDelegate:self];

  id v11 = [(RestaurantReservationRequestController *)self flowViewController];
  unint64_t v12 = [v11 headerView];
  [v12 setDismissButtonType:0];

  uint64_t v13 = [(RestaurantReservationRequestController *)self analyticsBookingSession];
  [v13 setCurrentView:7];

  uint64_t v14 = [(RestaurantReservationRequestController *)self analyticsBookingSession];
  [v14 setCurrentState:1];

  v15 = [(RestaurantReservationRequestController *)self flowViewController];
  uint64_t v16 = [(RestaurantReservationRequestController *)self reservationSuccessViewController];
  [v15 pushViewController:v16];

  [(RestaurantReservationRequestController *)self configureHeaderForBranding:1];
}

- (void)configureHeaderForBranding:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(RestaurantReservationRequestController *)self reservationRequester];
  id v6 = [v5 extension];
  id v7 = [v6 _iconWithFormat:1];
  id v8 = [(RestaurantReservationRequestController *)self flowViewController];
  uint64_t v9 = [v8 headerView];
  [v9 setIconImage:v7];

  if (v3)
  {
    id v10 = [(RestaurantReservationRequestController *)self reservationRequester];
    id v11 = [v10 extension];
    unint64_t v12 = [v11 displayName];
    uint64_t v13 = [(RestaurantReservationRequestController *)self flowViewController];
    uint64_t v14 = [v13 headerView];
    [v14 setTitleText:v12];

    v15 = [(RestaurantReservationRequestController *)self flowViewController];
    uint64_t v16 = [v15 headerView];
    [v16 setDetailText:0];

    id v17 = [(RestaurantReservationRequestController *)self flowViewController];
    v18 = [v17 headerView];
    [v18 setDismissButtonType:1];

    unint64_t v19 = [(RestaurantReservationRequestController *)self reservationRequester];
    objc_super v20 = [v19 reservationDefaultsResponse];
    v21 = [v20 providerImage];
    v22 = [v21 _identifier];

    if (v22)
    {
      v23 = [(RestaurantReservationRequestController *)self reservationRequester];
      v24 = [v23 extension];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1009C44EC;
      v37[3] = &unk_1012F3FB8;
      v37[4] = self;
      +[_MXExtensionManager imageForKey:v22 extension:v24 completion:v37];
    }
  }
  else
  {
    v25 = +[NSBundle mainBundle];
    v26 = [v25 localizedStringForKey:@"Book a Table" value:@"localized string not found" table:0];
    v27 = [(RestaurantReservationRequestController *)self flowViewController];
    id v28 = [v27 headerView];
    [v28 setTitleText:v26];

    v29 = +[NSBundle mainBundle];
    id v36 = [v29 localizedStringForKey:@"reservation_at_restaurant_key" value:@"localized string not found" table:0];

    id v30 = objc_alloc((Class)NSString);
    v31 = [(RestaurantReservationRequestController *)self mapItem];
    v32 = [v31 name];
    id v33 = [v30 initWithFormat:v36, v32];
    v34 = [(RestaurantReservationRequestController *)self flowViewController];
    v35 = [v34 headerView];
    [v35 setDetailText:v33];
  }
}

- (void)extensionTextInputViewControllerDidComplete:(id)a3
{
  id v5 = [a3 text];
  uint64_t v4 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  [v4 setSpecialRequestText:v5];
}

- (void)userInfoCellSelected
{
  unint64_t v19 = [ReservationContactInfoViewController alloc];
  uint64_t v16 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  v15 = [v16 guest];
  v18 = [v15 nameComponents];
  uint64_t v14 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  uint64_t v13 = [v14 guest];
  id v17 = [v13 emailAddress];
  BOOL v3 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  uint64_t v4 = [v3 guest];
  id v5 = [v4 phoneNumber];
  id v6 = [(RestaurantReservationRequestController *)self reservationRequester];
  id v7 = [v6 guestResponse];
  id v8 = [v7 guestDisplayPreferences];
  uint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v9 = [(RestaurantReservationRequestController *)self defaultGuestDisplayPreferences];
  }
  id v10 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  id v11 = [v10 inferredContactRequirements];
  objc_super v20 = [(ReservationContactInfoViewController *)v19 initWithNameComponents:v18 emailAddress:v17 phoneNumber:v5 guestDisplayPreferences:v9 requirements:v11];

  if (!v8) {
  [(ReservationContactInfoViewController *)v20 setContactDelegate:self];
  }
  unint64_t v12 = [(RestaurantReservationRequestController *)self flowViewController];
  [v12 pushViewController:v20];
}

- (void)specialRequestCellSelected
{
  BOOL v3 = +[NSBundle mainBundle];
  id v11 = [v3 localizedStringForKey:@"reservation_special_request_key" value:@"localized string not found" table:0];

  uint64_t v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"reservation_special_request_placeholder_key" value:@"localized string not found" table:0];

  id v6 = [ExtensionTextInputViewController alloc];
  id v7 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  id v8 = [v7 specialRequestText];
  uint64_t v9 = [(ExtensionTextInputViewController *)v6 initWithTitle:v11 placeholderText:v5 text:v8];

  [(ExtensionTextInputViewController *)v9 setInputDelegate:self];
  id v10 = [(RestaurantReservationRequestController *)self flowViewController];
  [v10 pushViewController:v9];
}

- (void)headerCellSelected
{
  BOOL v3 = [ExtensionLabelViewController alloc];
  uint64_t v4 = [(RestaurantReservationRequestController *)self mapItem];
  id v5 = [v4 name];
  id v6 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  id v7 = [v6 restaurantDescriptionText];
  uint64_t v9 = [(ExtensionLabelViewController *)v3 initWithTitle:v5 advertisementText:v7];

  id v8 = [(RestaurantReservationRequestController *)self flowViewController];
  [v8 pushViewController:v9];
}

- (void)reservationContactInfoViewControllerDidSelectDone:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)INRestaurantGuest);
  id v6 = [v4 nameComponents];
  id v7 = [v4 phoneNumber];
  id v8 = [v4 emailAddress];

  id v10 = [v5 initWithNameComponents:v6 phoneNumber:v7 emailAddress:v8];
  uint64_t v9 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  [v9 setGuest:v10];

  [(MapsSuggestionsAppGuardian *)self->_appGuardian unregisterAppTracker:self];
}

- (void)reservationRequestRefinementViewControllerDidRefine:(id)a3
{
  id v9 = a3;
  if ([v9 partySize])
  {
    id v4 = [v9 date];
    id v5 = [(RestaurantReservationRequestController *)self reservationTableViewController];
    [v5 setDate:v4];

    id v6 = [v9 partySize];
    id v7 = [(RestaurantReservationRequestController *)self reservationTableViewController];
    [v7 setPartySize:v6];

    id v8 = [v9 date];
    -[RestaurantReservationRequestController requestAvailableBookingsWithDate:partySize:](self, "requestAvailableBookingsWithDate:partySize:", v8, [v9 partySize]);
  }
}

- (void)bookingSelectionViewController:(id)a3 didSelectBooking:(id)a4 offer:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = [(RestaurantReservationRequestController *)self setupAnalyticsBookedSession];
  [v14 setBookedUsingMaps:1];
  [(RestaurantReservationRequestController *)self setSelectedBooking:v9];

  [(RestaurantReservationRequestController *)self setContentLikelyChanged:1];
  id v11 = [(RestaurantReservationRequestController *)self selectedBooking];
  unint64_t v12 = [v10 guest];
  uint64_t v13 = [v10 specialRequestText];

  [(RestaurantReservationRequestController *)self confirmBooking:v11 guest:v12 selectedOffer:v8 specialRequest:v13];
}

- (void)bookingSelectionViewControllerDidUpdatePartySize:(id)a3
{
  id v7 = a3;
  id v4 = [(RestaurantReservationRequestController *)self reservationRequestRefinementViewController];
  id v5 = [v4 date];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [(RestaurantReservationRequestController *)self defaultDate];
  }
  -[RestaurantReservationRequestController requestAvailableBookingsWithDate:partySize:](self, "requestAvailableBookingsWithDate:partySize:", v6, [v7 partySize]);
  if (!v5) {
}
  }

- (void)bookingSelectionViewControllerDidSelectDateRefinement:(id)a3
{
}

- (void)bookingSelectionViewControllerDidSelectOpenInApp:(id)a3
{
  id v5 = [(RestaurantReservationRequestController *)self reservationRequester];
  id v4 = [v5 availableBookingsUserActivity];
  [(RestaurantReservationRequestController *)self openAppWithActivity:v4];
}

- (void)restaurantReservationConfirmationViewControllerRequestStatusUpdateForUserBooking:(id)a3
{
  id v4 = a3;
  id v7 = [(RestaurantReservationRequestController *)self reservationRequester];
  id v5 = [v4 userBooking];

  id v6 = [v5 bookingIdentifier];
  [v7 requestUserCurrentBookingWithReservationIdentifier:v6];
}

- (void)restaurantReservationConfirmationViewControllerDidSelectEditReservation:(id)a3
{
  id v4 = [(RestaurantReservationRequestController *)self mapItem];
  id v5 = +[RestaurantReservationAnalyticsBookedSession currentAnalyticsBookedSessionForMuid:createIfNotPresent:](RestaurantReservationAnalyticsBookedSession, "currentAnalyticsBookedSessionForMuid:createIfNotPresent:", [v4 _muid], 1);
  [v5 setTappedChangeReservation:1];

  id v6 = [(RestaurantReservationRequestController *)self reservationRequester];
  id v7 = [v6 bookReservationUserActivity];

  id v8 = [(RestaurantReservationRequestController *)self reservationRequester];
  id v9 = v8;
  if (v7) {
    [v8 bookReservationUserActivity];
  }
  else {
  id v10 = [v8 userCurrentBookingUserActivity];
  }

  [(RestaurantReservationRequestController *)self openAppWithActivity:v10];
}

- (void)openAppWithActivity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc((Class)LSApplicationRecord);
    id v6 = [(RestaurantReservationRequestController *)self reservationRequester];
    id v7 = [v6 extension];
    id v8 = [v7 _containingAppIdentifer];
    id v9 = [v5 initWithBundleIdentifier:v8 allowPlaceholder:0 error:0];

    id v10 = [(RestaurantReservationRequestController *)self analyticsBookingSession];
    id v11 = v10;
    if (v9)
    {
      [v10 endSessionWithState:4];

      unint64_t v12 = +[MKSystemController sharedInstance];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1009C5218;
      v25[3] = &unk_1012E6438;
      v25[4] = self;
      [v12 openUserActivity:v4 withApplicationRecord:v9 requireOptionKeyPromptUnlockDevice:0 completionHandler:v25];
    }
    else
    {
      v18 = [(RestaurantReservationRequestController *)self reservationRequester];
      unint64_t v19 = [v18 extension];
      objc_super v20 = [v19 _containingAppIdentifer];
      v21 = +[NSString stringWithFormat:@"Could not find the LaunchServices app information for application '%@'", v20];
      [v11 addErrorMessage:v21];

      v22 = [(RestaurantReservationRequestController *)self reservationRequester];
      v23 = [v22 extension];
      v24 = [v23 _containingAppIdentifer];
      NSLog(@"Could not find the LaunchServices app information for application '%@'", v24);
    }
  }
  else
  {
    uint64_t v13 = [(RestaurantReservationRequestController *)self analyticsBookingSession];
    [v13 endSessionWithState:4];

    id v14 = +[LSApplicationWorkspace defaultWorkspace];
    v15 = [(RestaurantReservationRequestController *)self reservationRequester];
    uint64_t v16 = [v15 extension];
    id v17 = [v16 _containingAppIdentifer];
    [v14 openApplicationWithBundleID:v17];

    [(MapsSuggestionsAppGuardian *)self->_appGuardian registerAppTracker:self];
  }
}

- (void)kickoffRequests
{
  BOOL v3 = [(RestaurantReservationRequestController *)self reservationRequester];
  if ([v3 reservationDefaultsRequestPending])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(RestaurantReservationRequestController *)self reservationRequester];
    id v6 = [v5 reservationDefaultsResponse];
    BOOL v4 = v6 == 0;
  }
  id v7 = [(RestaurantReservationRequestController *)self reservationRequester];
  if ([v7 availableBookingsRequestPending])
  {
    BOOL v8 = 0;
  }
  else
  {
    id v9 = [(RestaurantReservationRequestController *)self reservationRequester];
    id v10 = [v9 reservationDefaultsResponse];
    BOOL v8 = v10 != 0;
  }
  id v11 = [(RestaurantReservationRequestController *)self reservationRequester];
  if ([v11 availableBookingsRequestPending])
  {
    BOOL v12 = 0;
  }
  else
  {
    uint64_t v13 = [(RestaurantReservationRequestController *)self reservationRequester];
    id v14 = [v13 availableBookingsResponse];
    BOOL v12 = v14 != 0;
  }
  v15 = [(RestaurantReservationRequestController *)self reservationRequester];
  if ([v15 guestRequestPending])
  {
LABEL_15:

    if (v4) {
      goto LABEL_13;
    }
    goto LABEL_16;
  }
  uint64_t v16 = [(RestaurantReservationRequestController *)self reservationRequester];
  id v17 = [v16 guestResponse];

  if (!v17)
  {
    v15 = [(RestaurantReservationRequestController *)self reservationRequester];
    [v15 requestGuest];
    goto LABEL_15;
  }
  if (v4)
  {
LABEL_13:
    id v18 = [(RestaurantReservationRequestController *)self reservationRequester];
    [v18 requestReservationDefaults];
LABEL_23:

    return;
  }
LABEL_16:
  if (!v8) {
    return;
  }
  if (!v12)
  {
    id v18 = [(RestaurantReservationRequestController *)self defaultDate];
    [(RestaurantReservationRequestController *)self requestAvailableBookingsWithDate:v18 partySize:[(RestaurantReservationRequestController *)self defaultPartySize]];
    goto LABEL_23;
  }

  [(RestaurantReservationRequestController *)self handleRequestedTimeCompletion];
}

- (void)requesterReservationDefaultsRequestDidComplete:(id)a3
{
  BOOL v4 = +[NSOperationQueue mainQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1009C55B0;
  v5[3] = &unk_1012E5D08;
  v5[4] = self;
  [v4 addOperationWithBlock:v5];
}

- (void)requester:(id)a3 reservationDefaultsRequestDidFailWithError:(id)a4
{
  id v5 = +[NSOperationQueue mainQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009C56B0;
  v6[3] = &unk_1012E5D08;
  v6[4] = self;
  [v5 addOperationWithBlock:v6];
}

- (void)requesterGuestRequestDidComplete:(id)a3
{
  BOOL v4 = +[NSOperationQueue mainQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1009C5748;
  v5[3] = &unk_1012E5D08;
  v5[4] = self;
  [v4 addOperationWithBlock:v5];
}

- (void)requester:(id)a3 guestRequestDidFailWithError:(id)a4
{
  id v5 = +[NSOperationQueue mainQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009C57E0;
  v6[3] = &unk_1012E5D08;
  v6[4] = self;
  [v5 addOperationWithBlock:v6];
}

- (void)requestAvailableBookingsWithDate:(id)a3 partySize:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(RestaurantReservationRequestController *)self reservationRequester];
  [v7 requestAvailableBookingsForPreferredTime:v6 partySize:a4];

  [(RestaurantReservationRequestController *)self updateReservationTableViewController];
}

- (void)requesterAvailableBookingsRequestDidComplete:(id)a3
{
  BOOL v4 = +[NSOperationQueue mainQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1009C58E4;
  v5[3] = &unk_1012E5D08;
  v5[4] = self;
  [v4 addOperationWithBlock:v5];
}

- (void)handleRequestedTimeCompletion
{
  BOOL v3 = [(RestaurantReservationRequestController *)self reservationRequester];
  BOOL v4 = [v3 availableBookingsResponse];
  unsigned int v5 = +[RestaurantReservationErrorController shouldDisplayAlertForResponseWithAvailableBookingsIntentCode:](RestaurantReservationErrorController, "shouldDisplayAlertForResponseWithAvailableBookingsIntentCode:", [v4 code]);

  [(RestaurantReservationRequestController *)self updateReservationTableViewController];
  if (v5)
  {
    id v6 = [(RestaurantReservationRequestController *)self errorController];
    id v7 = [(RestaurantReservationRequestController *)self reservationRequester];
    BOOL v8 = [v7 availableBookingsResponse];
    id v13 = [v6 alertControllerForAvailableBookingsResponse:v8 error:0];

    id v9 = [(RestaurantReservationRequestController *)self analyticsBookingSession];
    id v10 = [v13 message];
    [v9 addErrorMessage:v10];

    id v11 = [(RestaurantReservationRequestController *)self analyticsBookingSession];
    [v11 setCurrentState:5];

    BOOL v12 = [(RestaurantReservationRequestController *)self flowViewController];
    [v12 presentViewController:v13 animated:1 completion:0];
  }
}

- (void)requester:(id)a3 availableBookingsRequestDidFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[NSOperationQueue mainQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1009C5B2C;
  v11[3] = &unk_1012E66E0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 addOperationWithBlock:v11];
}

- (void)requesterBookRestaurantReservationRequestDidComplete:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[NSOperationQueue mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1009C5CDC;
  v7[3] = &unk_1012E5D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (void)requester:(id)a3 bookRestaurantReservationRequestDidFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSOperationQueue mainQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1009C61D4;
  v11[3] = &unk_1012E66E0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 addOperationWithBlock:v11];
}

- (void)confirmBooking:(id)a3 guest:(id)a4 selectedOffer:(id)a5 specialRequest:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(RestaurantReservationRequestController *)self analyticsBookingSession];
  [v14 setCurrentView:6];

  v15 = [(RestaurantReservationRequestController *)self reservationRequester];
  [v15 bookRestaurantReservation:v13 guest:v12 selectedOffer:v11 specialRequest:v10];

  [(RestaurantReservationRequestController *)self updateReservationTableViewController];
}

- (void)updateReservationTableViewController
{
  BOOL v3 = [(RestaurantReservationRequestController *)self mapItem];
  id v4 = [v3 name];
  unsigned int v5 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  [v5 setRestaurantName:v4];

  id v6 = [(RestaurantReservationRequestController *)self mapItem];
  id v7 = [v6 timeZone];
  id v8 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  [v8 setRestaurantTimeZone:v7];

  id v9 = [(RestaurantReservationRequestController *)self appName];
  id v10 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  [v10 setAppName:v9];

  id v11 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  [v11 setDelegate:self];

  id v12 = [(RestaurantReservationRequestController *)self reservationRequestRefinementViewController];
  id v13 = [v12 partySize];

  if (!v13) {
    id v13 = [(RestaurantReservationRequestController *)self defaultPartySize];
  }
  id v14 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  [v14 setPartySize:v13];

  v15 = [(RestaurantReservationRequestController *)self reservationRequestRefinementViewController];
  uint64_t v16 = [v15 date];
  id v17 = v16;
  if (!v16)
  {
    id v17 = [(RestaurantReservationRequestController *)self defaultDate];
  }
  id v18 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  [v18 setDate:v17];

  if (!v16) {
  unint64_t v19 = [(RestaurantReservationRequestController *)self reservationRequester];
  }
  objc_super v20 = [v19 availableBookingsResponse];
  v21 = [v20 localizedBookingAdvisementText];
  v22 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  [v22 setRestaurantAdvisementText:v21];

  v23 = [(RestaurantReservationRequestController *)self reservationRequester];
  v24 = [v23 availableBookingsResponse];
  v25 = [v24 localizedRestaurantDescriptionText];
  if ([v25 length])
  {

LABEL_10:
    id v28 = [(RestaurantReservationRequestController *)self reservationTableViewController];
    [v28 setUseTruncatedAdvisement:1];

    v29 = [(RestaurantReservationRequestController *)self reservationTableViewController];
    id v30 = [(RestaurantReservationRequestController *)self reservationRequester];
    v31 = [v30 availableBookingsResponse];
    v32 = [v31 localizedRestaurantDescriptionText];
    [v29 setRestaurantDescriptionText:v32 keepExisting:1];

    goto LABEL_12;
  }
  v26 = [(RestaurantReservationRequestController *)self reservationRequester];
  unsigned __int8 v27 = [v26 availableBookingsRequestPending];

  if (v27) {
    goto LABEL_10;
  }
  id v33 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  [v33 setUseTruncatedAdvisement:0];

  v29 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  id v30 = [(RestaurantReservationRequestController *)self mapItem];
  v31 = [v30 _addressFormattedAsMultilineAddress];
  [v29 setRestaurantDescriptionText:v31 keepExisting:1];
LABEL_12:

  v34 = [(RestaurantReservationRequestController *)self reservationRequester];
  v35 = [v34 availableBookingsResponse];
  id v36 = [v35 availableBookings];
  v37 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  [v37 setAvailableBookings:v36];

  v38 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  v39 = [v38 guest];
  v40 = v39;
  if (!v39)
  {
    id v36 = [(RestaurantReservationRequestController *)self reservationRequester];
    v37 = [v36 guestResponse];
    v40 = [v37 guest];
  }
  v41 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  [v41 setGuest:v40];

  if (!v39)
  {
  }
  v42 = [(RestaurantReservationRequestController *)self reservationRequester];
  v43 = [v42 guestResponse];
  v44 = [v43 guestDisplayPreferences];
  v45 = v44;
  if (!v44)
  {
    v45 = [(RestaurantReservationRequestController *)self defaultGuestDisplayPreferences];
  }
  v46 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  [v46 setGuestDisplayPreferences:v45];

  if (!v44) {
  v47 = [(RestaurantReservationRequestController *)self reservationRequester];
  }
  v48 = [v47 availableBookingsResponse];
  v49 = [v48 termsAndConditions];
  v50 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  [v50 setTermsAndConditions:v49];

  v51 = [(RestaurantReservationRequestController *)self reservationRequester];
  id v52 = [v51 bookReservationRequestPending];
  v53 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  [v53 setBookingPending:v52];

  v54 = [(RestaurantReservationRequestController *)self reservationRequester];
  uint64_t v55 = (uint64_t)[v54 availableBookingsRequestPending];
  if (v55)
  {
    uint64_t v56 = 1;
  }
  else
  {
    v53 = [(RestaurantReservationRequestController *)self reservationRequester];
    uint64_t v56 = (uint64_t)[v53 reservationDefaultsRequestPending];
  }
  v57 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  [v57 setBookingsLoading:v56];

  if ((v55 & 1) == 0) {
  id v61 = [(RestaurantReservationRequestController *)self reservationRequester];
  }
  unsigned __int8 v58 = [v61 guestRequestPending];
  if (v58)
  {
    BOOL v59 = 1;
  }
  else
  {
    uint64_t v55 = [(RestaurantReservationRequestController *)self reservationRequester];
    v53 = [(id)v55 guestResponse];
    BOOL v59 = v53 == 0;
  }
  v60 = [(RestaurantReservationRequestController *)self reservationTableViewController];
  [v60 setGuestLoading:v59];

  if ((v58 & 1) == 0)
  {
  }
}

- (void)extensionFlowHeaderViewDidTapDismiss:(id)a3
{
  id v4 = [(RestaurantReservationRequestController *)self flowViewController];
  unsigned int v5 = [v4 topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(RestaurantReservationRequestController *)self analyticsCaptor];
    [v7 captureBookedCancel];
  }
  else
  {
    id v8 = [(RestaurantReservationRequestController *)self flowViewController];
    id v9 = [v8 topViewController];
    objc_opt_class();
    char v10 = objc_opt_isKindOfClass();

    if ((v10 & 1) == 0) {
      goto LABEL_6;
    }
    id v7 = [(RestaurantReservationRequestController *)self analyticsCaptor];
    [v7 captureSelectTimeCancel];
  }

LABEL_6:
  id v11 = [(RestaurantReservationRequestController *)self delegate];
  [v11 restaurantReservationRequestControllerDidComplete:self contentRefresh:[self contentLikelyChanged]];

  appGuardian = self->_appGuardian;

  [(MapsSuggestionsAppGuardian *)appGuardian unregisterAppTracker:self];
}

- (RestaurantReservationErrorController)errorController
{
  errorController = self->_errorController;
  if (!errorController)
  {
    objc_initWeak(&location, self);
    id v4 = [RestaurantReservationErrorController alloc];
    unsigned int v5 = [(RestaurantReservationRequestController *)self reservationRequester];
    id v6 = [v5 extension];
    id v7 = [v6 displayName];
    id v8 = [(RestaurantReservationRequestController *)self mapItem];
    id v9 = [v8 name];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1009C6C88;
    v15[3] = &unk_1012E6708;
    objc_copyWeak(&v16, &location);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1009C6CF4;
    v13[3] = &unk_101313328;
    objc_copyWeak(&v14, &location);
    char v10 = [(RestaurantReservationErrorController *)v4 initWithAppName:v7 restaurantName:v9 cancelAction:v15 activityAction:v13];
    id v11 = self->_errorController;
    self->_errorController = v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    errorController = self->_errorController;
  }

  return errorController;
}

- (void)requesterUserCurrentBookingRequestDidComplete:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[NSOperationQueue mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1009C6E48;
  v7[3] = &unk_1012E5D58;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (void)didChangeProtectionStatusForBundleId:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(RestaurantReservationRequester *)self->_reservationRequester extension];
  id v6 = [v5 identifier];
  unsigned int v7 = [v6 containsString:v4];

  if (v7
    && +[MapsSuggestionsAppGuardian protectionStatusForBundleID:v4] == (id)3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1009C7030;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (ExtensionFlowViewController)flowViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowViewController);

  return (ExtensionFlowViewController *)WeakRetained;
}

- (void)setFlowViewController:(id)a3
{
}

- (INGetRestaurantGuestIntentResponse)guestResponse
{
  return self->_guestResponse;
}

- (void)setGuestResponse:(id)a3
{
}

- (RestaurantReservationRequestControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RestaurantReservationRequestControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RestaurantReservationAnalyticsBookingSession)analyticsBookingSession
{
  return self->_analyticsBookingSession;
}

- (void)setAnalyticsBookingSession:(id)a3
{
}

- (RestaurantReservationTableViewController)reservationTableViewController
{
  return self->_reservationTableViewController;
}

- (void)setReservationTableViewController:(id)a3
{
}

- (ReservationRequestRefinementViewController)reservationRequestRefinementViewController
{
  return self->_reservationRequestRefinementViewController;
}

- (void)setReservationRequestRefinementViewController:(id)a3
{
}

- (RestaurantReservationConfirmationViewController)reservationSuccessViewController
{
  return self->_reservationSuccessViewController;
}

- (void)setReservationSuccessViewController:(id)a3
{
}

- (RestaurantReservationRequester)reservationRequester
{
  return self->_reservationRequester;
}

- (void)setReservationRequester:(id)a3
{
}

- (INRestaurantReservationBooking)selectedBooking
{
  return self->_selectedBooking;
}

- (void)setSelectedBooking:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (void)setErrorController:(id)a3
{
}

- (ReservationAnalyticsCaptor)analyticsCaptor
{
  return self->_analyticsCaptor;
}

- (void)setAnalyticsCaptor:(id)a3
{
}

- (BOOL)contentLikelyChanged
{
  return self->_contentLikelyChanged;
}

- (void)setContentLikelyChanged:(BOOL)a3
{
  self->_contentLikelyChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsCaptor, 0);
  objc_storeStrong((id *)&self->_errorController, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_selectedBooking, 0);
  objc_storeStrong((id *)&self->_reservationRequester, 0);
  objc_storeStrong((id *)&self->_reservationSuccessViewController, 0);
  objc_storeStrong((id *)&self->_reservationRequestRefinementViewController, 0);
  objc_storeStrong((id *)&self->_reservationTableViewController, 0);
  objc_storeStrong((id *)&self->_analyticsBookingSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_guestResponse, 0);
  objc_destroyWeak((id *)&self->_flowViewController);

  objc_storeStrong((id *)&self->_appGuardian, 0);
}

@end