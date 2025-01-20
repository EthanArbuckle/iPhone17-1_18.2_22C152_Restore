@interface RideBookingRideStatus
+ (RideBookingRideStatus)statusWithApplication:(id)a3 error:(unint64_t)a4;
- (BOOL)_feedbackRequired;
- (BOOL)_shouldShowPayment;
- (BOOL)_showFeedbackType:(unint64_t)a3;
- (BOOL)isActiveRide;
- (BOOL)isCanceledByUser;
- (BOOL)isScheduledRide;
- (BOOL)isValidRide;
- (BOOL)rideStatusIsCanceled;
- (BOOL)rideStatusIsCanceledByService;
- (BOOL)shouldShowFeedbackControls;
- (BOOL)shouldShowRatingOptions;
- (BOOL)shouldShowTippingOptions;
- (CLLocation)vehicleLocation;
- (CLPlacemark)dropoffLocation;
- (CLPlacemark)pickupLocation;
- (INGetRideStatusIntentResponse)getRideStatusIntentResponse;
- (INRequestRideIntentResponse)requestRideIntentResponse;
- (INRideStatus)intentsRideStatus;
- (NSArray)cardActions;
- (NSArray)cardFareLineItems;
- (NSArray)intentResponseFailures;
- (NSArray)tippingOptions;
- (NSDate)estimatedDropOffDate;
- (NSDateComponents)scheduledPickupWindowStartDateComponents;
- (NSNumber)pickupETAMinutes;
- (NSString)bannerAttributionTitle;
- (NSString)cancelCommandTitle;
- (NSString)cardDisclaimer;
- (NSString)cardRideCompletedActionButtonTitle;
- (NSString)cardSubtitle;
- (NSString)cardTertiaryTitle;
- (NSString)cardTitle;
- (NSString)contactCommandTitle;
- (NSString)driverPhoneNumber;
- (NSString)identifier;
- (NSString)openInAppCommandTitle;
- (NSString)templatedViewSubtitle;
- (NSString)templatedViewTitle;
- (NSString)traySubtitle;
- (NSString)trayTitle;
- (NSUserActivity)userActivity;
- (NSUserActivity)userActivityForCanceling;
- (NSUserActivity)userActivityForCompletedRide;
- (RideBookingApplication)application;
- (RideBookingRideOption)rideOption;
- (RideBookingRideStatus)initWithApplication:(id)a3 rideOption:(id)a4 canceled:(BOOL)a5 canceledByService:(BOOL)a6 userActivityForCanceling:(id)a7 identifier:(id)a8 phase:(unint64_t)a9 error:(unint64_t)a10;
- (RidesharingSpecialPricingBadge)cardFormattedPriceRangeBadge;
- (UIImage)cardIcon;
- (UIImage)driverImage;
- (UIImage)templatedViewAppIcon;
- (UIImage)vehicleImage;
- (id)_approachingPickupTemplatedViewTitle;
- (id)_approachingPickupTrayTitle;
- (id)_completedCardSubtitle;
- (id)_completedCardTertiaryTitle;
- (id)_completedTemplatedViewSubtitle;
- (id)_completedTemplatedViewTitle;
- (id)_completedTraySubtitle;
- (id)_completedTrayTitle;
- (id)_confirmedTemplatedViewSubtitle;
- (id)_confirmedTemplatedViewTitle;
- (id)_confirmedTrayTitle;
- (id)_destinationAddress;
- (id)_driverName;
- (id)_minuteStringForSeconds:(double)a3;
- (id)_ongoingCardSubtitle;
- (id)_ongoingTemplatedViewSubtitle;
- (id)_ongoingTemplatedViewTitle;
- (id)_ongoingTrayTitle;
- (id)_pickupAddress;
- (id)_pickupTemplatedViewTitle;
- (id)_pickupTrayTitle;
- (id)_receivedCardSubtitle;
- (id)_receivedTemplatedViewSubtitle;
- (id)_receivedTemplatedViewTitle;
- (id)_receivedTrayTitle;
- (id)_scheduledCardSubtitle;
- (id)_scheduledTraySubtitle;
- (id)_scheduledTrayTitle;
- (id)description;
- (id)timeFormatter;
- (unint64_t)phase;
- (unint64_t)rideStatusError;
- (void)setApplication:(id)a3;
- (void)setGetRideStatusIntentResponse:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIntentsRideStatus:(id)a3;
- (void)setPhase:(unint64_t)a3;
- (void)setRequestRideIntentResponse:(id)a3;
- (void)setRideStatusError:(unint64_t)a3;
- (void)setRideStatusIsCanceled:(BOOL)a3;
- (void)setRideStatusIsCanceledByService:(BOOL)a3;
- (void)setUserActivity:(id)a3;
@end

@implementation RideBookingRideStatus

- (INRideStatus)intentsRideStatus
{
  return (INRideStatus *)objc_getAssociatedObject(self, &unk_100F6F510);
}

- (void)setIntentsRideStatus:(id)a3
{
  id value = a3;
  v4 = [(RideBookingRideStatus *)self intentsRideStatus];
  if (([v4 isEqual:value] & 1) == 0) {
    objc_setAssociatedObject(self, &unk_100F6F510, value, (void *)3);
  }
}

- (INGetRideStatusIntentResponse)getRideStatusIntentResponse
{
  return (INGetRideStatusIntentResponse *)objc_getAssociatedObject(self, &unk_100F6F511);
}

- (void)setGetRideStatusIntentResponse:(id)a3
{
  id value = a3;
  v4 = [(RideBookingRideStatus *)self getRideStatusIntentResponse];
  if (([v4 isEqual:value] & 1) == 0) {
    objc_setAssociatedObject(self, &unk_100F6F511, value, (void *)3);
  }
}

- (INRequestRideIntentResponse)requestRideIntentResponse
{
  return (INRequestRideIntentResponse *)objc_getAssociatedObject(self, &unk_100F6F512);
}

- (void)setRequestRideIntentResponse:(id)a3
{
  id value = a3;
  v4 = [(RideBookingRideStatus *)self requestRideIntentResponse];
  if (([v4 isEqual:value] & 1) == 0) {
    objc_setAssociatedObject(self, &unk_100F6F512, value, (void *)3);
  }
}

- (RideBookingRideStatus)initWithApplication:(id)a3 rideOption:(id)a4 canceled:(BOOL)a5 canceledByService:(BOOL)a6 userActivityForCanceling:(id)a7 identifier:(id)a8 phase:(unint64_t)a9 error:(unint64_t)a10
{
  id obj = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)RideBookingRideStatus;
  v19 = [(RideBookingRideStatus *)&v25 init];
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_application, obj);
    objc_storeStrong((id *)&v20->_rideOption, a4);
    v20->_rideStatusIsCanceled = a5;
    v20->_rideStatusIsCanceledByService = a6;
    v20->_phase = a9;
    v20->_rideStatusError = a10;
    v21 = (NSString *)[v18 copy];
    identifier = v20->_identifier;
    v20->_identifier = v21;

    objc_storeStrong((id *)&v20->_userActivityForCanceling, a7);
  }

  return v20;
}

+ (RideBookingRideStatus)statusWithApplication:(id)a3 error:(unint64_t)a4
{
  id v5 = a3;
  v6 = [[RideBookingRideStatus alloc] initWithApplication:v5 rideOption:0 canceled:0 canceledByService:0 userActivityForCanceling:0 identifier:0 phase:0 error:a4];

  return v6;
}

- (BOOL)isCanceledByUser
{
  return self->_rideStatusIsCanceled && !self->_rideStatusIsCanceledByService;
}

- (BOOL)isValidRide
{
  v3 = [(RideBookingRideStatus *)self identifier];
  BOOL v4 = v3
    && ![(RideBookingRideStatus *)self isCanceledByUser]
    && [(RideBookingRideStatus *)self phase] != 0;

  return v4;
}

- (BOOL)isActiveRide
{
  BOOL v3 = [(RideBookingRideStatus *)self isValidRide];
  if (v3) {
    LOBYTE(v3) = (id)[(RideBookingRideStatus *)self phase] != (id)4;
  }
  return v3;
}

- (id)description
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_application);
  BOOL v4 = +[NSString stringWithFormat:@"RBRideStatus: %@\nIdentifier: %@", WeakRetained, self->_identifier];

  return v4;
}

- (RideBookingApplication)application
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_application);

  return (RideBookingApplication *)WeakRetained;
}

- (void)setApplication:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(unint64_t)a3
{
  self->_phase = a3;
}

- (unint64_t)rideStatusError
{
  return self->_rideStatusError;
}

- (void)setRideStatusError:(unint64_t)a3
{
  self->_rideStatusError = a3;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(id)a3
{
}

- (NSUserActivity)userActivityForCanceling
{
  return self->_userActivityForCanceling;
}

- (NSUserActivity)userActivityForCompletedRide
{
  return self->_userActivityForCompletedRide;
}

- (BOOL)rideStatusIsCanceled
{
  return self->_rideStatusIsCanceled;
}

- (void)setRideStatusIsCanceled:(BOOL)a3
{
  self->_rideStatusIsCanceled = a3;
}

- (BOOL)rideStatusIsCanceledByService
{
  return self->_rideStatusIsCanceledByService;
}

- (void)setRideStatusIsCanceledByService:(BOOL)a3
{
  self->_rideStatusIsCanceledByService = a3;
}

- (RideBookingRideOption)rideOption
{
  return self->_rideOption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rideOption, 0);
  objc_storeStrong((id *)&self->_userActivityForCompletedRide, 0);
  objc_storeStrong((id *)&self->_userActivityForCanceling, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_application);
}

- (BOOL)shouldShowFeedbackControls
{
  BOOL v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  BOOL v4 = [v3 completionStatus];
  if ([v4 isCompleted])
  {
    if ([(RideBookingRideStatus *)self shouldShowTippingOptions])
    {

      return 1;
    }
    unsigned __int8 v5 = [(RideBookingRideStatus *)self shouldShowRatingOptions];

    if (v5) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (BOOL)shouldShowTippingOptions
{
  return [(RideBookingRideStatus *)self _showFeedbackType:2];
}

- (BOOL)shouldShowRatingOptions
{
  return [(RideBookingRideStatus *)self _showFeedbackType:1];
}

- (BOOL)_showFeedbackType:(unint64_t)a3
{
  BOOL v4 = [(RideBookingRideStatus *)self intentsRideStatus];
  unsigned __int8 v5 = [v4 completionStatus];

  BOOL v6 = [v5 isCompleted] && ((unint64_t)[v5 feedbackType] & a3) != 0;
  return v6;
}

- (BOOL)_feedbackRequired
{
  BOOL v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  BOOL v4 = [v3 completionStatus];
  if (([v4 feedbackType] & 2) != 0)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    unsigned __int8 v5 = [(RideBookingRideStatus *)self intentsRideStatus];
    BOOL v6 = [v5 completionStatus];
    unint64_t v7 = (unint64_t)[v6 feedbackType] & 1;
  }
  return v7;
}

- (BOOL)isScheduledRide
{
  if ((id)[(RideBookingRideStatus *)self phase] != (id)2) {
    return 0;
  }
  BOOL v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  BOOL v4 = [v3 scheduledPickupTime];
  BOOL v5 = v4 != 0;

  return v5;
}

- (UIImage)templatedViewAppIcon
{
  v2 = [(RideBookingRideStatus *)self application];
  BOOL v3 = [v2 iconWithFormat:2];

  return (UIImage *)v3;
}

- (NSString)templatedViewTitle
{
  BOOL v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  id v4 = [v3 phase];

  switch((unint64_t)v4)
  {
    case 1uLL:
      BOOL v5 = [(RideBookingRideStatus *)self _receivedTemplatedViewTitle];
      break;
    case 2uLL:
      BOOL v5 = [(RideBookingRideStatus *)self _confirmedTemplatedViewTitle];
      break;
    case 3uLL:
      BOOL v5 = [(RideBookingRideStatus *)self _ongoingTemplatedViewTitle];
      break;
    case 4uLL:
      BOOL v5 = [(RideBookingRideStatus *)self _completedTemplatedViewTitle];
      break;
    case 5uLL:
      BOOL v5 = [(RideBookingRideStatus *)self _approachingPickupTemplatedViewTitle];
      break;
    case 6uLL:
      BOOL v5 = [(RideBookingRideStatus *)self _pickupTemplatedViewTitle];
      break;
    default:
      BOOL v5 = &stru_101324E70;
      break;
  }

  return (NSString *)v5;
}

- (NSString)templatedViewSubtitle
{
  BOOL v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  id v4 = [v3 phase];

  switch((unint64_t)v4)
  {
    case 1uLL:
      BOOL v5 = [(RideBookingRideStatus *)self _receivedTemplatedViewSubtitle];
      break;
    case 2uLL:
      BOOL v5 = [(RideBookingRideStatus *)self _confirmedTemplatedViewSubtitle];
      break;
    case 3uLL:
      BOOL v5 = [(RideBookingRideStatus *)self _ongoingTemplatedViewSubtitle];
      break;
    case 4uLL:
      BOOL v5 = [(RideBookingRideStatus *)self _completedTemplatedViewSubtitle];
      break;
    case 5uLL:
      BOOL v5 = [(RideBookingRideStatus *)self _approachingPickupTemplatedViewSubtitle];
      break;
    case 6uLL:
      BOOL v5 = [(RideBookingRideStatus *)self _pickupTemplatedViewSubtitle];
      break;
    default:
      BOOL v5 = &stru_101324E70;
      break;
  }

  return (NSString *)v5;
}

- (id)timeFormatter
{
  if (qword_101610430 != -1) {
    dispatch_once(&qword_101610430, &stru_1013140A8);
  }
  v2 = (void *)qword_101610428;

  return v2;
}

- (id)_minuteStringForSeconds:(double)a3
{
  if (a3 >= 60.0) {
    double v3 = a3;
  }
  else {
    double v3 = 60.0;
  }
  id v4 = [(RideBookingRideStatus *)self timeFormatter];
  BOOL v5 = [v4 stringFromTimeInterval:v3];

  return v5;
}

- (id)_receivedTemplatedViewTitle
{
  double v3 = [(RideBookingRideStatus *)self rideOption];
  id v4 = [v3 name];

  BOOL v5 = +[NSBundle mainBundle];
  if (v4)
  {
    BOOL v6 = [v5 localizedStringForKey:@"Requesting your %@ [Ridesharing]" value:@"localized string not found" table:0];
    unint64_t v7 = [(RideBookingRideStatus *)self rideOption];
    v8 = [v7 name];
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8);
  }
  else
  {
    v9 = [v5 localizedStringForKey:@"Requesting ride proactive [Ridesharing-Default]" value:@"localized string not found" table:0];
  }

  return v9;
}

- (id)_confirmedTemplatedViewTitle
{
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  id v4 = [v3 estimatedPickupDate];

  if (v4)
  {
    [v4 timeIntervalSinceNow];
    BOOL v5 = -[RideBookingRideStatus _minuteStringForSeconds:](self, "_minuteStringForSeconds:");
    BOOL v6 = [(RideBookingRideStatus *)self rideOption];
    unint64_t v7 = [v6 name];

    v8 = +[NSBundle mainBundle];
    v9 = v8;
    if (v7)
    {
      v10 = [v8 localizedStringForKey:@"Your %@ arrives in %@ [Ridesharing]" value:@"localized string not found" table:0];
      v11 = [(RideBookingRideStatus *)self rideOption];
      v12 = [v11 name];
      v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v12, v5);
    }
    else
    {
      v10 = [v8 localizedStringForKey:@"Your ride arrives in %@ [Ridesharing]" value:@"localized string not found" table:0];
      v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v5);
    }
  }
  else
  {
    v14 = [(RideBookingRideStatus *)self rideOption];
    v15 = [v14 name];

    BOOL v5 = +[NSBundle mainBundle];
    if (v15)
    {
      id v16 = [v5 localizedStringForKey:@"Your %@ arrives soon [Ridesharing]" value:@"localized string not found" table:0];
      id v17 = [(RideBookingRideStatus *)self rideOption];
      id v18 = [v17 name];
      v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, v18);
    }
    else
    {
      v13 = [v5 localizedStringForKey:@"Your ride arrives soon [Ridesharing]" value:@"localized string not found" table:0];
    }
  }

  return v13;
}

- (id)_approachingPickupTemplatedViewTitle
{
  double v3 = [(RideBookingRideStatus *)self rideOption];
  id v4 = [v3 name];

  BOOL v5 = +[NSBundle mainBundle];
  if (v4)
  {
    BOOL v6 = [v5 localizedStringForKey:@"Your %@ is arriving now [Ridesharing]" value:@"localized string not found" table:0];
    unint64_t v7 = [(RideBookingRideStatus *)self rideOption];
    v8 = [v7 name];
    v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v8);
  }
  else
  {
    v9 = [v5 localizedStringForKey:@"Your ride is arriving now [Ridesharing]" value:@"localized string not found" table:0];
  }

  return v9;
}

- (id)_pickupTemplatedViewTitle
{
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  id v4 = [v3 estimatedPickupEndDate];

  if (v4)
  {
    [v4 timeIntervalSinceNow];
    BOOL v5 = -[RideBookingRideStatus _minuteStringForSeconds:](self, "_minuteStringForSeconds:");
    BOOL v6 = [(RideBookingRideStatus *)self rideOption];
    unint64_t v7 = [v6 name];

    v8 = +[NSBundle mainBundle];
    v9 = v8;
    if (v7)
    {
      v10 = [v8 localizedStringForKey:@"Your %@ departs in %@ [Ridesharing]" value:@"localized string not found" table:0];
      v11 = [(RideBookingRideStatus *)self rideOption];
      v12 = [v11 name];
      v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v12, v5);
    }
    else
    {
      v10 = [v8 localizedStringForKey:@"Your ride departs in %@ [Ridesharing]" value:@"localized string not found" table:0];
      v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v5);
    }
  }
  else
  {
    v14 = [(RideBookingRideStatus *)self rideOption];
    v15 = [v14 name];

    BOOL v5 = +[NSBundle mainBundle];
    if (v15)
    {
      id v16 = [v5 localizedStringForKey:@"Your %@ has arrived [Ridesharing]" value:@"localized string not found" table:0];
      id v17 = [(RideBookingRideStatus *)self rideOption];
      id v18 = [v17 name];
      v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, v18);
    }
    else
    {
      v13 = [v5 localizedStringForKey:@"Your ride has arrived [Ridesharing]" value:@"localized string not found" table:0];
    }
  }

  return v13;
}

- (id)_ongoingTemplatedViewTitle
{
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  id v4 = [v3 estimatedDropOffDate];

  if (v4)
  {
    [v4 timeIntervalSinceNow];
    BOOL v5 = -[RideBookingRideStatus _minuteStringForSeconds:](self, "_minuteStringForSeconds:");
    BOOL v6 = +[NSBundle mainBundle];
    unint64_t v7 = [v6 localizedStringForKey:@"[Ridesharing] You’ll arrive in %@" value:@"localized string not found" table:0];
    v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v5);
  }
  else
  {
    BOOL v5 = +[NSBundle mainBundle];
    v8 = [v5 localizedStringForKey:@"[Ridesharing] You’ll arrive soon" value:@"localized string not found" table:0];
  }

  return v8;
}

- (id)_completedTemplatedViewTitle
{
  if ([(RideBookingRideStatus *)self _feedbackRequired])
  {
    double v3 = [(RideBookingRideStatus *)self _driverName];
    id v4 = [v3 length];

    BOOL v5 = +[NSBundle mainBundle];
    BOOL v6 = v5;
    if (v4)
    {
      unint64_t v7 = [v5 localizedStringForKey:@"ridesharing.tray.subtitle.completed.feedbackRequired.driverName" value:@"localized string not found" table:0];
      v8 = [(RideBookingRideStatus *)self _driverName];
      v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v8);
    }
    else
    {
      unint64_t v7 = [v5 localizedStringForKey:@"ridesharing.templated.title.completed.feedbackRequired.rideName" value:@"localized string not found" table:0];
      v8 = [(RideBookingRideStatus *)self rideOption];
      v10 = [v8 name];
      v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v10);
    }
  }
  else
  {
    v9 = [(RideBookingRideStatus *)self _completedTrayTitle];
  }

  return v9;
}

- (id)_receivedTemplatedViewSubtitle
{
  v2 = +[NSBundle mainBundle];
  double v3 = [v2 localizedStringForKey:@"[Ridesharing] contacting nearby drivers..." value:@"localized string not found" table:0];

  return v3;
}

- (id)_confirmedTemplatedViewSubtitle
{
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  id v4 = [v3 vehicle];
  BOOL v5 = [v4 registrationPlate];

  BOOL v6 = [(RideBookingRideStatus *)self intentsRideStatus];
  unint64_t v7 = [v6 vehicle];
  v8 = [v7 manufacturer];

  v9 = [(RideBookingRideStatus *)self intentsRideStatus];
  v10 = [v9 vehicle];
  v11 = [v10 model];

  if (v8) {
    v12 = v8;
  }
  else {
    v12 = v11;
  }
  v13 = v12;
  if (v8 && v11)
  {
    v14 = +[NSBundle mainBundle];
    v15 = [v14 localizedStringForKey:@"[Ridesharing] templated view vehicle make" value:@"localized string not found" table:0];
    uint64_t v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v8, v11);

    v13 = (__CFString *)v16;
  }
  if (v13 && v5)
  {
    id v17 = +[NSBundle mainBundle];
    id v18 = [v17 localizedStringForKey:@"[Ridesharing] templated view vehicle details" value:@"localized string not found" table:0];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v13, v5);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = &stru_101324E70;
    if (v5) {
      v20 = v5;
    }
    if (v13) {
      v20 = v13;
    }
    v19 = v20;
  }

  return v19;
}

- (id)_ongoingTemplatedViewSubtitle
{
  v2 = [(RideBookingRideStatus *)self intentsRideStatus];
  double v3 = [v2 dropOffLocation];
  id v4 = [v3 _geoMapItem];
  BOOL v5 = [v4 name];

  if ([v5 length])
  {
    BOOL v6 = +[NSBundle mainBundle];
    unint64_t v7 = [v6 localizedStringForKey:@"[Ridesharing] templated view ongoing subtitle" value:@"localized string not found" table:0];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v5);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_101324E70;
  }

  return v8;
}

- (id)_completedTemplatedViewSubtitle
{
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  id v4 = [v3 estimatedPickupDate];

  if ([(RideBookingRideStatus *)self _feedbackRequired])
  {
    if (v4)
    {
      if (qword_101610440 != -1) {
        dispatch_once(&qword_101610440, &stru_1013140C8);
      }
      BOOL v5 = [(id)qword_101610438 stringFromDate:v4];
      uint64_t v22 = 0;
      BOOL v6 = +[NSCalendar autoupdatingCurrentCalendar];
      unint64_t v7 = +[NSCalendar autoupdatingCurrentCalendar];
      v8 = [v7 timeZone];
      v9 = [v6 _navigation_transitRelativeDateStringForDate:v4 context:5 inTimeZone:v8 outUsedFormat:&v22];

      MapsSuggestionsTimeZone();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = v4;
      v12 = v10;
      if (!v10)
      {
        v12 = MapsSuggestionsTimeZone();
      }
      v13 = +[NSCalendar autoupdatingCurrentCalendar];
      v14 = [v13 componentsInTimeZone:v12 fromDate:v11];

      id v15 = [v14 hour];
      if (v15 == (id)13 || v15 == (id)1)
      {
        uint64_t v16 = +[NSBundle mainBundle];
        id v17 = v16;
        CFStringRef v18 = @"Pickup date and time [Ridesharing] at 1";
      }
      else
      {
        uint64_t v16 = +[NSBundle mainBundle];
        id v17 = v16;
        CFStringRef v18 = @"Pickup date and time [Ridesharing] not at 1";
      }
      v20 = [v16 localizedStringForKey:v18 value:@"localized string not found" table:0];

      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v9, v5);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = &stru_101324E70;
    }
  }
  else
  {
    v19 = [(RideBookingRideStatus *)self _completedTraySubtitle];
  }

  return v19;
}

- (NSString)trayTitle
{
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  id v4 = [v3 phase];

  switch((unint64_t)v4)
  {
    case 1uLL:
      BOOL v5 = [(RideBookingRideStatus *)self _receivedTrayTitle];
      break;
    case 2uLL:
      if ([(RideBookingRideStatus *)self isScheduledRide]) {
        [(RideBookingRideStatus *)self _scheduledTrayTitle];
      }
      else {
      BOOL v5 = [(RideBookingRideStatus *)self _confirmedTrayTitle];
      }
      break;
    case 3uLL:
      BOOL v5 = [(RideBookingRideStatus *)self _ongoingTrayTitle];
      break;
    case 4uLL:
      BOOL v5 = [(RideBookingRideStatus *)self _completedTrayTitle];
      break;
    case 5uLL:
      BOOL v5 = [(RideBookingRideStatus *)self _approachingPickupTrayTitle];
      break;
    case 6uLL:
      BOOL v5 = [(RideBookingRideStatus *)self _pickupTrayTitle];
      break;
    default:
      BOOL v5 = &stru_101324E70;
      break;
  }

  return (NSString *)v5;
}

- (id)_pickupAddress
{
  v2 = [(RideBookingRideStatus *)self pickupLocation];
  double v3 = [v2 _geoMapItem];
  id v4 = [v3 name];

  return v4;
}

- (id)_destinationAddress
{
  v2 = [(RideBookingRideStatus *)self dropoffLocation];
  double v3 = [v2 _geoMapItem];
  id v4 = [v3 name];

  return v4;
}

- (NSString)traySubtitle
{
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  id v4 = [v3 phase];

  switch((unint64_t)v4)
  {
    case 1uLL:
    case 2uLL:
      if (![(RideBookingRideStatus *)self isScheduledRide]) {
        goto LABEL_4;
      }
      uint64_t v5 = [(RideBookingRideStatus *)self _scheduledTraySubtitle];
      goto LABEL_13;
    case 3uLL:
      id v11 = [(RideBookingRideStatus *)self intentsRideStatus];
      v12 = [v11 estimatedDropOffDate];

      if (!v12) {
        goto LABEL_11;
      }
      v13 = [(RideBookingRideStatus *)self intentsRideStatus];
      v14 = [v13 estimatedDropOffDate];
      [v14 timeIntervalSinceNow];
      BOOL v6 = -[RideBookingRideStatus _minuteStringForSeconds:](self, "_minuteStringForSeconds:");

      unint64_t v7 = +[NSBundle mainBundle];
      v8 = v7;
      CFStringRef v9 = @"You’ll arrive in %@ [Ridesharing]";
      goto LABEL_9;
    case 4uLL:
      uint64_t v5 = [(RideBookingRideStatus *)self _completedTraySubtitle];
LABEL_13:
      id v10 = (__CFString *)v5;
      goto LABEL_14;
    case 5uLL:
    case 6uLL:
LABEL_4:
      BOOL v6 = [(RideBookingRideStatus *)self _pickupAddress];
      if ([v6 length])
      {
        unint64_t v7 = +[NSBundle mainBundle];
        v8 = v7;
        CFStringRef v9 = @"Pickup at %@ [Ridesharing]";
LABEL_9:
        id v15 = [v7 localizedStringForKey:v9 value:@"localized string not found" table:0];
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v6);
        id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v10 = &stru_101324E70;
      }

LABEL_14:
      return (NSString *)v10;
    default:
LABEL_11:
      id v10 = &stru_101324E70;
      goto LABEL_14;
  }
}

- (id)_scheduledTrayTitle
{
  double v3 = [(RideBookingRideStatus *)self _destinationAddress];
  id v4 = [(RideBookingRideStatus *)self _pickupAddress];
  uint64_t v5 = [(RideBookingRideStatus *)self rideOption];
  BOOL v6 = [v5 name];

  id v7 = [v3 length];
  if (v6)
  {
    if (v7)
    {
      v8 = +[NSBundle mainBundle];
      CFStringRef v9 = [v8 localizedStringForKey:@"%@ to %@ [Ridesharing]" value:@"localized string not found" table:0];
      id v10 = [(RideBookingRideStatus *)self rideOption];
      id v11 = [v10 name];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v11, v3);
    }
    else
    {
      id v13 = [v4 length];
      v14 = +[NSBundle mainBundle];
      v8 = v14;
      if (v13)
      {
        CFStringRef v9 = [v14 localizedStringForKey:@"%@ from %@ [Ridesharing]" value:@"localized string not found" table:0];
        id v10 = [(RideBookingRideStatus *)self rideOption];
        id v11 = [v10 name];
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v11, v4);
      }
      else
      {
        CFStringRef v9 = [v14 localizedStringForKey:@"%@ [Ridesharing]" value:@"localized string not found" table:0];
        id v10 = [(RideBookingRideStatus *)self rideOption];
        id v11 = [v10 name];
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v11, v17);
      }
    id v15 = };

    goto LABEL_13;
  }
  if (v7)
  {
    v8 = +[NSBundle mainBundle];
    v12 = [v8 localizedStringForKey:@"Ride to %@ [Ridesharing]" value:@"localized string not found" table:0];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v3);
    id v15 = LABEL_10:;

    goto LABEL_13;
  }
  if ([v4 length])
  {
    v8 = +[NSBundle mainBundle];
    v12 = [v8 localizedStringForKey:@"Ride from %@ [Ridesharing]" value:@"localized string not found" table:0];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v4);
    goto LABEL_10;
  }
  v8 = +[NSBundle mainBundle];
  id v15 = [v8 localizedStringForKey:@"Ride" value:@"localized string not found" table:0];
LABEL_13:

  return v15;
}

- (id)_receivedTrayTitle
{
  double v3 = [(RideBookingRideStatus *)self rideOption];
  id v4 = [v3 name];

  uint64_t v5 = +[NSBundle mainBundle];
  if (v4)
  {
    BOOL v6 = [v5 localizedStringForKey:@"Requesting %@ [Ridesharing]" value:@"localized string not found" table:0];
    id v7 = [(RideBookingRideStatus *)self rideOption];
    v8 = [v7 name];
    CFStringRef v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8);
  }
  else
  {
    CFStringRef v9 = [v5 localizedStringForKey:@"Requesting ride [Ridesharing-Default]" value:@"localized string not found" table:0];
  }

  return v9;
}

- (id)_confirmedTrayTitle
{
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  id v4 = [v3 estimatedPickupDate];

  if (v4)
  {
    [v4 timeIntervalSinceNow];
    uint64_t v5 = -[RideBookingRideStatus _minuteStringForSeconds:](self, "_minuteStringForSeconds:");
    BOOL v6 = [(RideBookingRideStatus *)self rideOption];
    id v7 = [v6 name];

    v8 = +[NSBundle mainBundle];
    CFStringRef v9 = v8;
    if (v7)
    {
      id v10 = [v8 localizedStringForKey:@"%@ arrives in %@ [Ridesharing]" value:@"localized string not found" table:0];
      id v11 = [(RideBookingRideStatus *)self rideOption];
      v12 = [v11 name];
      id v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v12, v5);
    }
    else
    {
      id v10 = [v8 localizedStringForKey:@"Ride arrives in %@ [Ridesharing]" value:@"localized string not found" table:0];
      id v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v5);
    }
  }
  else
  {
    v14 = [(RideBookingRideStatus *)self rideOption];
    id v15 = [v14 name];

    uint64_t v5 = +[NSBundle mainBundle];
    if (v15)
    {
      uint64_t v16 = [v5 localizedStringForKey:@"%@ arrives soon [Ridesharing]" value:@"localized string not found" table:0];
      uint64_t v17 = [(RideBookingRideStatus *)self rideOption];
      CFStringRef v18 = [v17 name];
      id v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, v18);
    }
    else
    {
      id v13 = [v5 localizedStringForKey:@"Ride arrives soon [Ridesharing]" value:@"localized string not found" table:0];
    }
  }

  return v13;
}

- (id)_approachingPickupTrayTitle
{
  double v3 = [(RideBookingRideStatus *)self rideOption];
  id v4 = [v3 name];

  uint64_t v5 = +[NSBundle mainBundle];
  if (v4)
  {
    BOOL v6 = [v5 localizedStringForKey:@"%@ is arriving [Ridesharing]" value:@"localized string not found" table:0];
    id v7 = [(RideBookingRideStatus *)self rideOption];
    v8 = [v7 name];
    CFStringRef v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v8);
  }
  else
  {
    CFStringRef v9 = [v5 localizedStringForKey:@"Ride is arriving [Ridesharing]" value:@"localized string not found" table:0];
  }

  return v9;
}

- (id)_pickupTrayTitle
{
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  id v4 = [v3 estimatedPickupEndDate];

  if (v4)
  {
    [v4 timeIntervalSinceNow];
    uint64_t v5 = -[RideBookingRideStatus _minuteStringForSeconds:](self, "_minuteStringForSeconds:");
    BOOL v6 = [(RideBookingRideStatus *)self rideOption];
    id v7 = [v6 name];

    v8 = +[NSBundle mainBundle];
    CFStringRef v9 = v8;
    if (v7)
    {
      id v10 = [v8 localizedStringForKey:@"%@ departs in %@ [Ridesharing]" value:@"localized string not found" table:0];
      id v11 = [(RideBookingRideStatus *)self rideOption];
      v12 = [v11 name];
      id v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v12, v5);
    }
    else
    {
      id v10 = [v8 localizedStringForKey:@"Ride departs in %@ [Ridesharing]" value:@"localized string not found" table:0];
      id v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v5);
    }
  }
  else
  {
    v14 = [(RideBookingRideStatus *)self rideOption];
    id v15 = [v14 name];

    uint64_t v5 = +[NSBundle mainBundle];
    if (v15)
    {
      uint64_t v16 = [v5 localizedStringForKey:@"%@ has arrived [Ridesharing]" value:@"localized string not found" table:0];
      uint64_t v17 = [(RideBookingRideStatus *)self rideOption];
      CFStringRef v18 = [v17 name];
      id v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, v18);
    }
    else
    {
      id v13 = [v5 localizedStringForKey:@"Ride has arrived [Ridesharing]" value:@"localized string not found" table:0];
    }
  }

  return v13;
}

- (id)_ongoingTrayTitle
{
  double v3 = [(RideBookingRideStatus *)self _destinationAddress];
  id v4 = [(RideBookingRideStatus *)self rideOption];
  uint64_t v5 = [v4 name];
  if (v5)
  {
    BOOL v6 = (void *)v5;
    id v7 = [v3 length];

    if (v7)
    {
      v8 = +[NSBundle mainBundle];
      CFStringRef v9 = [v8 localizedStringForKey:@"%@ to %@ [Ridesharing]" value:@"localized string not found" table:0];
      id v10 = [(RideBookingRideStatus *)self rideOption];
      id v11 = [v10 name];
      v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v11, v3);

      goto LABEL_10;
    }
  }
  else
  {
  }
  if ([v3 length])
  {
    v8 = +[NSBundle mainBundle];
    CFStringRef v9 = [v8 localizedStringForKey:@"Ride to %@ [Ridesharing]" value:@"localized string not found" table:0];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v3);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v12 = v13;
    goto LABEL_10;
  }
  v8 = [(RideBookingRideStatus *)self rideOption];
  v14 = [v8 name];
  if (v14)
  {
    id v13 = v14;
    CFStringRef v9 = v13;
    goto LABEL_9;
  }
  uint64_t v16 = +[NSBundle mainBundle];
  v12 = [v16 localizedStringForKey:@"Current ride [Ridesharing]" value:@"localized string not found" table:0];

  CFStringRef v9 = 0;
LABEL_10:

  return v12;
}

- (id)_completedTrayTitle
{
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  id v4 = [v3 completionStatus];
  unsigned int v5 = [v4 isCanceled];

  if (v5)
  {
    BOOL v6 = [(RideBookingRideStatus *)self rideOption];
    id v7 = [v6 name];

    if (v7)
    {
      v8 = +[NSBundle mainBundle];
      CFStringRef v9 = v8;
      CFStringRef v10 = @"%@ was canceled [Ridesharing]";
LABEL_8:
      id v13 = [v8 localizedStringForKey:v10 value:@"localized string not found" table:0];
      v14 = [(RideBookingRideStatus *)self rideOption];
      id v15 = [v14 name];
      uint64_t v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v15);

      goto LABEL_12;
    }
    uint64_t v17 = +[NSBundle mainBundle];
    CFStringRef v9 = v17;
    CFStringRef v18 = @"The current ride was canceled [Ridesharing]";
  }
  else
  {
    if ([(RideBookingRideStatus *)self _feedbackRequired])
    {
      v8 = +[NSBundle mainBundle];
      CFStringRef v9 = v8;
      CFStringRef v10 = @"ridesharing.tray.title.completed.feedbackRequired";
      goto LABEL_8;
    }
    id v11 = [(RideBookingRideStatus *)self rideOption];
    v12 = [v11 name];

    if (v12)
    {
      v8 = +[NSBundle mainBundle];
      CFStringRef v9 = v8;
      CFStringRef v10 = @"%@ is complete [Ridesharing]";
      goto LABEL_8;
    }
    uint64_t v17 = +[NSBundle mainBundle];
    CFStringRef v9 = v17;
    CFStringRef v18 = @"The current ride is complete [Ridesharing]";
  }
  uint64_t v16 = [v17 localizedStringForKey:v18 value:@"localized string not found" table:0];
LABEL_12:

  return v16;
}

- (id)_scheduledTraySubtitle
{
  if (qword_101610450 != -1) {
    dispatch_once(&qword_101610450, &stru_1013140E8);
  }
  [(id)qword_101610448 setTimeStyle:1];
  double v3 = +[NSLocale autoupdatingCurrentLocale];
  [(id)qword_101610448 setLocale:v3];

  id v4 = [(RideBookingRideStatus *)self scheduledPickupWindowStartDateComponents];
  unsigned int v5 = [v4 timeZone];
  [(id)qword_101610448 setTimeZone:v5];

  BOOL v6 = +[NSCalendar autoupdatingCurrentCalendar];
  id v7 = [(RideBookingRideStatus *)self scheduledPickupWindowStartDateComponents];
  v8 = [v6 dateFromComponents:v7];

  CFStringRef v9 = [(id)qword_101610448 stringFromDate:v8];
  CFStringRef v10 = [(RideBookingRideStatus *)self scheduledPickupWindowStartDateComponents];
  id v11 = [v10 timeZone];
  v12 = [v11 abbreviation];

  id v13 = +[NSCalendar autoupdatingCurrentCalendar];
  v14 = [v13 timeZone];
  id v15 = [(RideBookingRideStatus *)self scheduledPickupWindowStartDateComponents];
  uint64_t v16 = [v15 timeZone];
  unsigned int v17 = [v14 isEqualToTimeZone:v16];

  if (v17)
  {

    v12 = 0;
  }
  uint64_t v45 = 0;
  CFStringRef v18 = +[NSCalendar autoupdatingCurrentCalendar];
  v19 = [(RideBookingRideStatus *)self scheduledPickupWindowStartDateComponents];
  v20 = [v19 timeZone];
  v21 = [v18 _navigation_transitRelativeDateStringForDate:v8 context:5 inTimeZone:v20 outUsedFormat:&v45];

  if (v12)
  {
    uint64_t v22 = [(RideBookingRideStatus *)self scheduledPickupWindowStartDateComponents];
    id v23 = [v22 timeZone];
    id v24 = v8;
    objc_super v25 = v23;
    if (!v23)
    {
      objc_super v25 = MapsSuggestionsTimeZone();
    }
    v26 = +[NSCalendar autoupdatingCurrentCalendar];
    v27 = [v26 componentsInTimeZone:v25 fromDate:v24];

    id v28 = [v27 hour];
    if (v28 == (id)13 || v28 == (id)1)
    {
      v29 = +[NSBundle mainBundle];
      v30 = v29;
      CFStringRef v31 = @"Pickup %@ at %@ %@ [Ridesharing] at 1 O'clock";
    }
    else
    {
      v29 = +[NSBundle mainBundle];
      v30 = v29;
      CFStringRef v31 = @"Pickup %@ at %@ %@ [Ridesharing]";
    }
    v41 = [v29 localizedStringForKey:v31 value:@"localized string not found" table:0];

    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v41, v21, v9, v12);
  }
  else
  {
    MapsSuggestionsTimeZone();
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    id v33 = v8;
    v34 = v32;
    if (!v32)
    {
      v34 = MapsSuggestionsTimeZone();
    }
    v35 = +[NSCalendar autoupdatingCurrentCalendar];
    v36 = [v35 componentsInTimeZone:v34 fromDate:v33];

    id v37 = [v36 hour];
    if (v37 == (id)13 || v37 == (id)1)
    {
      v38 = +[NSBundle mainBundle];
      v39 = v38;
      CFStringRef v40 = @"Pickup date and time [Ridesharing] at 1 O'clock";
    }
    else
    {
      v38 = +[NSBundle mainBundle];
      v39 = v38;
      CFStringRef v40 = @"Pickup date and time [Ridesharing] not at 1";
    }
    v41 = [v38 localizedStringForKey:v40 value:@"localized string not found" table:0];

    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v41, v21, v9, v44);
  v42 = };

  return v42;
}

- (id)_completedTraySubtitle
{
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  id v4 = [v3 completionStatus];
  unsigned int v5 = [v4 isMissedPickup];

  if (v5)
  {
    BOOL v6 = +[NSBundle mainBundle];
    id v7 = v6;
    CFStringRef v8 = @"Driver has departed proactive [Ridesharing]";
LABEL_5:
    v12 = [v6 localizedStringForKey:v8 value:@"localized string not found" table:0];
LABEL_6:

    goto LABEL_7;
  }
  CFStringRef v9 = [(RideBookingRideStatus *)self intentsRideStatus];
  CFStringRef v10 = [v9 completionStatus];
  unsigned int v11 = [v10 isCanceled];

  if (v11)
  {
    BOOL v6 = +[NSBundle mainBundle];
    id v7 = v6;
    CFStringRef v8 = @"Trip was canceled proactive [Ridesharing]";
    goto LABEL_5;
  }
  if (![(RideBookingRideStatus *)self _feedbackRequired])
  {
    if (![(RideBookingRideStatus *)self _shouldShowPayment])
    {
      BOOL v6 = +[NSBundle mainBundle];
      id v7 = v6;
      CFStringRef v8 = @"Arrived proactive [Ridesharing]";
      goto LABEL_5;
    }
    v19 = [(RideBookingRideStatus *)self intentsRideStatus];
    v20 = [v19 completionStatus];
    id v7 = [v20 paymentAmount];

    v21 = +[NSBundle mainBundle];
    uint64_t v22 = [v21 localizedStringForKey:@"Total fare is %@ proactive [Ridesharing]" value:@"localized string not found" table:0];
    id v23 = [v7 amount];
    id v24 = [v7 currencyCode];
    objc_super v25 = +[NSString _navigation_formattedStringForPriceValueWithAmount:v23 currencyCode:v24];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v22, v25);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_15:
    goto LABEL_6;
  }
  v14 = [(RideBookingRideStatus *)self _driverName];
  id v15 = [v14 length];

  if (!v15)
  {
    v26 = [(RideBookingRideStatus *)self intentsRideStatus];
    id v7 = [v26 estimatedPickupDate];

    if (!v7)
    {
      v12 = &stru_101324E70;
      goto LABEL_6;
    }
    if (qword_101610460 != -1) {
      dispatch_once(&qword_101610460, &stru_101314108);
    }
    v27 = +[NSCalendar autoupdatingCurrentCalendar];
    unsigned int v28 = [v27 isDateInToday:v7];

    if (!v28)
    {
      uint64_t v44 = 0;
      v38 = +[NSCalendar autoupdatingCurrentCalendar];
      v39 = +[NSCalendar autoupdatingCurrentCalendar];
      CFStringRef v40 = [v39 timeZone];
      v41 = [v38 _navigation_transitRelativeDateStringForDate:v7 context:5 inTimeZone:v40 outUsedFormat:&v44];

      v42 = +[NSBundle mainBundle];
      v43 = [v42 localizedStringForKey:@"ridesharing.completed.feedbackRequired.rideDay" value:@"localized string not found" table:0];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v43, v41);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    v21 = [(id)qword_101610458 stringFromDate:v7];
    MapsSuggestionsTimeZone();
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    id v30 = v7;
    CFStringRef v31 = v29;
    if (!v29)
    {
      CFStringRef v31 = MapsSuggestionsTimeZone();
    }
    id v32 = +[NSCalendar autoupdatingCurrentCalendar];
    id v33 = [v32 componentsInTimeZone:v31 fromDate:v30];

    id v34 = [v33 hour];
    if (v34 == (id)13 || v34 == (id)1)
    {
      v35 = +[NSBundle mainBundle];
      v36 = v35;
      CFStringRef v37 = @"ridesharing.completed.feedbackRequired.rideTime at 1 O'clock";
    }
    else
    {
      v35 = +[NSBundle mainBundle];
      v36 = v35;
      CFStringRef v37 = @"ridesharing.completed.feedbackRequired.rideTime";
    }
    uint64_t v22 = [v35 localizedStringForKey:v37 value:@"localized string not found" table:0];

    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v22, v21);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  uint64_t v16 = +[NSBundle mainBundle];
  unsigned int v17 = [v16 localizedStringForKey:@"ridesharing.tray.subtitle.completed.feedbackRequired.driverName" value:@"localized string not found" table:0];
  CFStringRef v18 = [(RideBookingRideStatus *)self _driverName];
  +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v18);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_7:

  return v12;
}

- (NSString)bannerAttributionTitle
{
  double v3 = [(RideBookingRideStatus *)self application];
  id v4 = [v3 name];

  unsigned int v5 = +[NSBundle mainBundle];
  if (v4)
  {
    BOOL v6 = [v5 localizedStringForKey:@"[ridesharing] banner view attribution" value:@"localized string not found" table:0];
    id v7 = [(RideBookingRideStatus *)self application];
    CFStringRef v8 = [v7 name];
    CFStringRef v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v8);
  }
  else
  {
    CFStringRef v9 = [v5 localizedStringForKey:@"[ridesharing] banner view attribution no app name" value:@"localized string not found" table:0];
  }

  return (NSString *)v9;
}

- (UIImage)cardIcon
{
  v2 = [(RideBookingRideStatus *)self application];
  double v3 = [v2 iconWithFormat:0];

  return (UIImage *)v3;
}

- (NSString)cardTitle
{
  v2 = [(RideBookingRideStatus *)self rideOption];
  double v3 = [v2 name];

  return (NSString *)v3;
}

- (NSString)cardSubtitle
{
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  id v4 = [v3 phase];

  switch((unint64_t)v4)
  {
    case 1uLL:
      unsigned int v5 = [(RideBookingRideStatus *)self _receivedCardSubtitle];
      break;
    case 2uLL:
      if ([(RideBookingRideStatus *)self isScheduledRide]) {
        [(RideBookingRideStatus *)self _scheduledCardSubtitle];
      }
      else {
      unsigned int v5 = [(RideBookingRideStatus *)self _confirmedCardSubtitle];
      }
      break;
    case 3uLL:
      unsigned int v5 = [(RideBookingRideStatus *)self _ongoingCardSubtitle];
      break;
    case 4uLL:
      unsigned int v5 = [(RideBookingRideStatus *)self _completedCardSubtitle];
      break;
    case 5uLL:
      unsigned int v5 = [(RideBookingRideStatus *)self _approachingPickupCardSubtitle];
      break;
    case 6uLL:
      unsigned int v5 = [(RideBookingRideStatus *)self _pickupCardSubtitle];
      break;
    default:
      unsigned int v5 = &stru_101324E70;
      break;
  }

  return (NSString *)v5;
}

- (NSString)cardTertiaryTitle
{
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  unint64_t v4 = (unint64_t)[v3 phase];

  unsigned int v5 = &stru_101324E70;
  if (v4 <= 6)
  {
    if (((1 << v4) & 0x6E) != 0)
    {
      BOOL v6 = [(RideBookingRideStatus *)self rideOption];
      unsigned int v5 = [v6 priceRange];
    }
    else if (v4 == 4)
    {
      unsigned int v5 = [(RideBookingRideStatus *)self _completedCardTertiaryTitle];
    }
  }

  return (NSString *)v5;
}

- (RidesharingSpecialPricingBadge)cardFormattedPriceRangeBadge
{
  v2 = [(RideBookingRideStatus *)self rideOption];
  double v3 = [v2 specialPricingBadge];

  return (RidesharingSpecialPricingBadge *)v3;
}

- (NSString)cardDisclaimer
{
  v2 = +[NSBundle mainBundle];
  double v3 = [v2 localizedStringForKey:@"Route, fares, and waits are estimates and may vary due to traffic, weather, or other factors.", @"localized string not found", 0 value table];

  return (NSString *)v3;
}

- (NSArray)cardFareLineItems
{
  v2 = [(RideBookingRideStatus *)self rideOption];
  double v3 = [v2 intentsRideOption];
  unint64_t v4 = +[RidesharingFareLineItem _fareItemsFromRideOption:v3];

  return (NSArray *)v4;
}

- (id)_receivedCardSubtitle
{
  unsigned int v5 = [(RideBookingRideStatus *)self intentsRideStatus];
  BOOL v6 = [v5 estimatedPickupDate];
  if (v6)
  {
    id v7 = [(RideBookingRideStatus *)self intentsRideStatus];
    CFStringRef v8 = [v7 estimatedPickupDate];
    [v8 timeIntervalSinceNow];
    double v10 = round(v9 / 60.0);
    double v11 = 1.0;
    if (v10 >= 1.0)
    {
      v2 = [(RideBookingRideStatus *)self intentsRideStatus];
      double v3 = [v2 estimatedPickupDate];
      [v3 timeIntervalSinceNow];
      double v11 = round(v12 / 60.0);
    }
    id v13 = +[NSNumber numberWithDouble:v11];
    v14 = +[NSString _maps_ridesharingETA:v13 partySize:0];

    if (v10 >= 1.0)
    {
    }
  }
  else
  {
    v14 = +[NSString _maps_ridesharingETA:0 partySize:0];
  }

  return v14;
}

- (id)_scheduledCardSubtitle
{
  v2 = [(RideBookingRideStatus *)self intentsRideStatus];
  double v3 = [v2 scheduledPickupTime];
  unint64_t v4 = [v3 startDateComponents];
  unsigned int v5 = +[NSString _maps_ridesharingScheduledPickupWindowStart:v4 partySize:0];

  return v5;
}

- (id)_ongoingCardSubtitle
{
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  unint64_t v4 = [v3 estimatedDropOffDate];

  if (v4)
  {
    unsigned int v5 = [(RideBookingRideStatus *)self intentsRideStatus];
    BOOL v6 = [v5 estimatedDropOffDate];
    [v6 timeIntervalSinceNow];
    id v7 = -[RideBookingRideStatus _minuteStringForSeconds:](self, "_minuteStringForSeconds:");

    CFStringRef v8 = +[NSBundle mainBundle];
    double v9 = [v8 localizedStringForKey:@"Arriving in %@ card subtitle [Ridesharing]" value:@"localized string not found" table:0];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v7);
    double v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v10 = &stru_101324E70;
  }

  return v10;
}

- (id)_completedCardSubtitle
{
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  unint64_t v4 = [v3 completionStatus];
  unsigned int v5 = [v4 isMissedPickup];

  if (v5)
  {
    BOOL v6 = +[NSBundle mainBundle];
    id v7 = v6;
    CFStringRef v8 = @"Driver has departed card [Ridesharing]";
  }
  else
  {
    double v9 = [(RideBookingRideStatus *)self intentsRideStatus];
    double v10 = [v9 completionStatus];
    unsigned int v11 = [v10 isCanceled];

    BOOL v6 = +[NSBundle mainBundle];
    id v7 = v6;
    if (v11) {
      CFStringRef v8 = @"Trip was canceled card [Ridesharing]";
    }
    else {
      CFStringRef v8 = @"Trip is complete card [Ridesharing]";
    }
  }
  double v12 = [v6 localizedStringForKey:v8 value:@"localized string not found" table:0];

  return v12;
}

- (id)_completedCardTertiaryTitle
{
  if ([(RideBookingRideStatus *)self _shouldShowPayment])
  {
    double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
    unint64_t v4 = [v3 completionStatus];
    unsigned int v5 = [v4 paymentAmount];

    BOOL v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"Total fare is card %@ [Ridesharing]" value:@"localized string not found" table:0];
    CFStringRef v8 = [v5 amount];
    double v9 = [v5 currencyCode];
    double v10 = +[NSString _navigation_formattedStringForPriceValueWithAmount:v8 currencyCode:v9];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v10);
    unsigned int v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned int v11 = &stru_101324E70;
  }

  return v11;
}

- (NSArray)cardActions
{
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  unint64_t v4 = [v3 additionalActionActivities];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100A0588C;
  v7[3] = &unk_101314130;
  v7[4] = self;
  unsigned int v5 = sub_100099700(v4, v7);

  return (NSArray *)v5;
}

- (NSString)cardRideCompletedActionButtonTitle
{
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  unint64_t v4 = [v3 completionStatus];

  if ([v4 isCompleted]
    && [v4 isOutstanding]
    && [(RideBookingRideStatus *)self _shouldShowPayment])
  {
    unsigned int v5 = +[NSBundle mainBundle];
    BOOL v6 = [v5 localizedStringForKey:@"[ridesharing] pay %@ now" value:@"localized string not found" table:0];
    id v7 = [v4 paymentAmount];
    CFStringRef v8 = [v7 amount];
    double v9 = [v4 paymentAmount];
    double v10 = [v9 currencyCode];
    unsigned int v11 = +[NSString _navigation_formattedStringForPriceValueWithAmount:v8 currencyCode:v10 showsCurrencySymbol:1];
    double v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v11);
  }
  else
  {
    id v13 = [(RideBookingRideStatus *)self application];
    v14 = [v13 name];

    unsigned int v5 = +[NSBundle mainBundle];
    if (v14)
    {
      id v15 = [v5 localizedStringForKey:@"[ridesharing] view in %@" value:@"localized string not found" table:0];
      uint64_t v16 = [(RideBookingRideStatus *)self application];
      unsigned int v17 = [v16 name];
      double v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v17);
    }
    else
    {
      double v12 = [v5 localizedStringForKey:@"[ridesharing] view in app" value:@"localized string not found" table:0];
    }
  }

  return (NSString *)v12;
}

- (BOOL)_shouldShowPayment
{
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  unint64_t v4 = [v3 completionStatus];
  unsigned int v5 = [v4 paymentAmount];
  BOOL v6 = [v5 amount];

  id v7 = [(RideBookingRideStatus *)self intentsRideStatus];
  CFStringRef v8 = [v7 completionStatus];
  double v9 = [v8 paymentAmount];
  double v10 = [v9 currencyCode];

  if (v6) {
    BOOL v11 = [v6 compare:&off_1013A9F88] == (id)1;
  }
  else {
    BOOL v11 = 0;
  }
  if (v6) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  BOOL v13 = !v12 && v11;

  return v13;
}

- (NSString)openInAppCommandTitle
{
  double v3 = [(RideBookingRideStatus *)self application];
  unint64_t v4 = [v3 name];

  unsigned int v5 = +[NSBundle mainBundle];
  if (v4)
  {
    BOOL v6 = [v5 localizedStringForKey:@"Open in %@ [Ridesharing]" value:@"localized string not found" table:0];
    id v7 = [(RideBookingRideStatus *)self application];
    CFStringRef v8 = [v7 name];
    double v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8);
  }
  else
  {
    double v9 = [v5 localizedStringForKey:@"Open in app [Ridesharing]" value:@"localized string not found" table:0];
  }

  return (NSString *)v9;
}

- (NSString)cancelCommandTitle
{
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  id v4 = [v3 phase];

  switch((unint64_t)v4)
  {
    case 0uLL:
    case 4uLL:
      unsigned int v5 = +[NSBundle mainBundle];
      BOOL v6 = v5;
      CFStringRef v7 = @"[Ridesharing] cancel button";
      goto LABEL_7;
    case 1uLL:
      unsigned int v5 = +[NSBundle mainBundle];
      BOOL v6 = v5;
      CFStringRef v7 = @"Cancel Request";
      goto LABEL_7;
    case 2uLL:
      if (![(RideBookingRideStatus *)self isScheduledRide]) {
        goto LABEL_2;
      }
      unsigned int v5 = +[NSBundle mainBundle];
      BOOL v6 = v5;
      CFStringRef v7 = @"Cancel Scheduled Ride";
      goto LABEL_7;
    case 3uLL:
    case 5uLL:
    case 6uLL:
LABEL_2:
      unsigned int v5 = +[NSBundle mainBundle];
      BOOL v6 = v5;
      CFStringRef v7 = @"Cancel Ride";
LABEL_7:
      id v4 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];

      break;
    default:
      break;
  }

  return (NSString *)v4;
}

- (NSString)contactCommandTitle
{
  v2 = +[NSBundle mainBundle];
  double v3 = [v2 localizedStringForKey:@"Contact Driver" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (NSString)driverPhoneNumber
{
  v2 = [(RideBookingRideStatus *)self intentsRideStatus];
  double v3 = [v2 driver];
  id v4 = [v3 phoneNumber];

  return (NSString *)v4;
}

- (UIImage)driverImage
{
  double v3 = +[RideBookingAccessProxy imageCache];
  id v4 = [(RideBookingRideStatus *)self intentsRideStatus];
  unsigned int v5 = [v4 driver];
  BOOL v6 = [v5 image];
  CFStringRef v7 = [v6 _identifier];
  CFStringRef v8 = [v3 imageForKey:v7];

  return (UIImage *)v8;
}

- (id)_driverName
{
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  id v4 = [v3 driver];
  unsigned int v5 = [v4 nameComponents];

  if (v5)
  {
    BOOL v6 = [(RideBookingRideStatus *)self intentsRideStatus];
    CFStringRef v7 = [v6 driver];
    CFStringRef v8 = [v7 nameComponents];
    double v9 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:v8 style:0 options:0];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (CLLocation)vehicleLocation
{
  v2 = [(RideBookingRideStatus *)self intentsRideStatus];
  double v3 = [v2 vehicle];
  id v4 = [v3 location];

  return (CLLocation *)v4;
}

- (UIImage)vehicleImage
{
  double v3 = +[RideBookingAccessProxy imageCache];
  id v4 = [(RideBookingRideStatus *)self intentsRideStatus];
  unsigned int v5 = [v4 vehicle];
  BOOL v6 = [v5 mapAnnotationImage];
  CFStringRef v7 = [v6 _identifier];
  CFStringRef v8 = [v3 imageForKey:v7];

  return (UIImage *)v8;
}

- (CLPlacemark)pickupLocation
{
  v2 = [(RideBookingRideStatus *)self intentsRideStatus];
  double v3 = [v2 pickupLocation];

  return (CLPlacemark *)v3;
}

- (CLPlacemark)dropoffLocation
{
  v2 = [(RideBookingRideStatus *)self intentsRideStatus];
  double v3 = [v2 dropOffLocation];

  return (CLPlacemark *)v3;
}

- (NSDateComponents)scheduledPickupWindowStartDateComponents
{
  v2 = [(RideBookingRideStatus *)self intentsRideStatus];
  double v3 = [v2 scheduledPickupTime];
  id v4 = [v3 startDateComponents];

  return (NSDateComponents *)v4;
}

- (NSNumber)pickupETAMinutes
{
  uint64_t v2 = (uint64_t)self;
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  id v4 = [v3 estimatedPickupDate];

  if (v4)
  {
    unsigned int v5 = [(id)v2 intentsRideStatus];
    BOOL v6 = [v5 estimatedPickupDate];
    [v6 timeIntervalSinceNow];
    if (round(v7 / 60.0) < 1.0)
    {
      uint64_t v2 = 1;
    }
    else
    {
      CFStringRef v8 = [(id)v2 intentsRideStatus];
      double v9 = [v8 estimatedPickupDate];
      [v9 timeIntervalSinceNow];
      LODWORD(v2) = vcvtad_u64_f64(v10 / 60.0);
    }
    BOOL v11 = +[NSNumber numberWithUnsignedInt:v2];
  }
  else
  {
    BOOL v11 = 0;
  }

  return (NSNumber *)v11;
}

- (NSDate)estimatedDropOffDate
{
  uint64_t v2 = [(RideBookingRideStatus *)self intentsRideStatus];
  double v3 = [v2 estimatedDropOffDate];

  return (NSDate *)v3;
}

- (NSArray)tippingOptions
{
  double v3 = [(RideBookingRideStatus *)self intentsRideStatus];
  id v4 = [v3 completionStatus];
  unsigned int v5 = [v4 defaultTippingOptions];
  BOOL v6 = [v5 allObjects];
  double v7 = sub_100099700(v6, &stru_101314170);

  CFStringRef v8 = [(RideBookingRideStatus *)self intentsRideStatus];
  double v9 = [v8 completionStatus];
  if ([v9 isCompleted]
    && [(RideBookingRideStatus *)self shouldShowTippingOptions])
  {
    id v10 = [v7 count];

    if (v10) {
      id v10 = v7;
    }
  }
  else
  {

    id v10 = 0;
  }

  return (NSArray *)v10;
}

- (NSArray)intentResponseFailures
{
  double v3 = objc_opt_new();
  id v4 = objc_opt_new();
  [v4 setIntent:4];
  [v4 setFailure:0];
  unint64_t v5 = [(RideBookingRideStatus *)self rideStatusError];
  if (v5 <= 8 && ((0x1FDu >> v5) & 1) != 0) {
    [v4 setFailure:dword_100F72FD8[v5]];
  }
  if ([v4 failure])
  {
    id v6 = [v4 copy];
    [v3 addObject:v6];
  }
  double v7 = [(RideBookingRideStatus *)self intentsRideStatus];
  CFStringRef v8 = [v7 rideIdentifier];

  if (!v8)
  {
    [v4 setFailure:13];
    id v9 = [v4 copy];
    [v3 addObject:v9];
  }
  id v10 = [(RideBookingRideStatus *)self intentsRideStatus];
  BOOL v11 = [v10 rideOption];
  BOOL v12 = [v11 name];
  id v13 = [v12 length];

  if (!v13)
  {
    [v4 setFailure:11];
    id v14 = [v4 copy];
    [v3 addObject:v14];
  }
  id v15 = [(RideBookingRideStatus *)self intentsRideStatus];
  uint64_t v16 = [v15 estimatedPickupDate];

  if (!v16)
  {
    [v4 setFailure:12];
    id v17 = [v4 copy];
    [v3 addObject:v17];
  }
  CFStringRef v18 = [(RideBookingRideStatus *)self intentsRideStatus];
  v19 = [v18 vehicle];
  id v20 = [v19 location];
  v21 = v20;
  if (!v20) {
    goto LABEL_21;
  }
  [v20 coordinate];
  double latitude = v34.latitude;
  double longitude = v34.longitude;
  if (!CLLocationCoordinate2DIsValid(v34)) {
    goto LABEL_21;
  }
  double v24 = -latitude;
  if (latitude >= 0.0) {
    double v24 = latitude;
  }
  if (v24 <= 2.22044605e-16)
  {
LABEL_21:

LABEL_22:
    [v4 setFailure:17];
    id v25 = [v4 copy];
    [v3 addObject:v25];

    goto LABEL_23;
  }
  if (longitude < 0.0) {
    double longitude = -longitude;
  }

  if (longitude <= 2.22044605e-16) {
    goto LABEL_22;
  }
LABEL_23:
  uint64_t v26 = [(RideBookingRideStatus *)self intentsRideStatus];
  if (v26)
  {
    v27 = (void *)v26;
    unsigned int v28 = [(RideBookingRideStatus *)self intentsRideStatus];
    id v29 = [v28 phase];

    if (!v29)
    {
      [v4 setFailure:14];
      id v30 = [v4 copy];
      [v3 addObject:v30];
    }
  }
  id v31 = [v3 copy];

  return (NSArray *)v31;
}

@end