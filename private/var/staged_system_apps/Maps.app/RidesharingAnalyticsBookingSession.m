@interface RidesharingAnalyticsBookingSession
- (BOOL)comparedRideOptions;
- (BOOL)exploredOtherOptions;
- (BOOL)installedApp;
- (BOOL)movedPickupLocation;
- (BOOL)paymentIsApplePay;
- (BOOL)sessionEnded;
- (BOOL)showedSurgePricingAlert;
- (CLLocation)destination;
- (CLLocation)origin;
- (NSDate)bookingDate;
- (NSString)sessionId;
- (RidesharingAnalyticsBookingSession)init;
- (double)distanceToPickup;
- (unint64_t)numberOfEnabledExtensions;
- (unint64_t)numberOfInstalledExtensions;
- (void)captureBookedApp:(id)a3 version:(id)a4;
- (void)captureBookedRideOptionName:(id)a3;
- (void)captureErrorMessage:(id)a3;
- (void)captureIntent:(int)a3 withFailure:(int)a4;
- (void)captureRideOptionCount:(unint64_t)a3;
- (void)captureStatusIssue:(int64_t)a3;
- (void)captureView:(int64_t)a3;
- (void)endSessionOnView:(int64_t)a3 state:(int64_t)a4;
- (void)mapsBackgrounded;
- (void)mapsForegrounded;
- (void)setBookingDate:(id)a3;
- (void)setComparedRideOptions:(BOOL)a3;
- (void)setDestination:(id)a3;
- (void)setDistanceToPickup:(double)a3;
- (void)setExploredOtherOptions:(BOOL)a3;
- (void)setInstalledApp:(BOOL)a3;
- (void)setMovedPickupLocation:(BOOL)a3;
- (void)setNumberOfEnabledExtensions:(unint64_t)a3;
- (void)setNumberOfInstalledExtensions:(unint64_t)a3;
- (void)setOrigin:(id)a3;
- (void)setPaymentIsApplePay:(BOOL)a3;
- (void)setSessionEnded:(BOOL)a3;
- (void)setSessionId:(id)a3;
- (void)setShowedSurgePricingAlert:(BOOL)a3;
@end

@implementation RidesharingAnalyticsBookingSession

- (RidesharingAnalyticsBookingSession)init
{
  v18.receiver = self;
  v18.super_class = (Class)RidesharingAnalyticsBookingSession;
  v2 = [(RidesharingAnalyticsBookingSession *)&v18 init];
  if (v2)
  {
    v3 = +[NSUUID UUID];
    uint64_t v4 = [v3 UUIDString];
    sessionId = v2->_sessionId;
    v2->_sessionId = (NSString *)v4;

    v6 = +[RidesharingAppPreferenceManager mostRecentSelectedAppIdentifers];
    uint64_t v7 = [v6 firstObject];
    initiallySelectedApp = v2->_initiallySelectedApp;
    v2->_initiallySelectedApp = (NSString *)v7;

    uint64_t v9 = +[NSDate date];
    sessionStartDate = v2->_sessionStartDate;
    v2->_sessionStartDate = (NSDate *)v9;

    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    errorMessages = v2->_errorMessages;
    v2->_errorMessages = v11;

    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    intentResponseFailures = v2->_intentResponseFailures;
    v2->_intentResponseFailures = v13;

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v2 selector:"mapsBackgrounded" name:UIApplicationDidEnterBackgroundNotification object:0];

    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v2 selector:"mapsForegrounded" name:UIApplicationWillEnterForegroundNotification object:0];
  }
  return v2;
}

- (unint64_t)numberOfInstalledExtensions
{
  return self->_numberOfInstalledExtensions;
}

- (void)setNumberOfInstalledExtensions:(unint64_t)a3
{
  self->_numberOfInstalledExtensions = a3;
}

- (unint64_t)numberOfEnabledExtensions
{
  return self->_numberOfEnabledExtensions;
}

- (void)setNumberOfEnabledExtensions:(unint64_t)a3
{
  self->_numberOfEnabledExtensions = a3;
}

- (void)mapsBackgrounded
{
}

- (void)mapsForegrounded
{
  self->_sessionEnded = 0;
}

- (void)captureRideOptionCount:(unint64_t)a3
{
  unint64_t maximumCountOfRideOptionsReturned = self->_maximumCountOfRideOptionsReturned;
  if (maximumCountOfRideOptionsReturned <= a3) {
    unint64_t maximumCountOfRideOptionsReturned = a3;
  }
  self->_unint64_t maximumCountOfRideOptionsReturned = maximumCountOfRideOptionsReturned;
}

- (void)captureBookedApp:(id)a3 version:(id)a4
{
  id v8 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_appIdentifier, a3);
  objc_storeStrong((id *)&self->_appVersion, a4);
  if (!self->_initiallySelectedApp || (objc_msgSend(v8, "isEqualToString:") & 1) == 0) {
    self->_switchedApp = 1;
  }
}

- (void)captureErrorMessage:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_errorMessages addObject:v5];
  objc_sync_exit(v4);
}

- (void)captureIntent:(int)a3 withFailure:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v8 = objc_alloc_init((Class)GEORideBookingIntentResponseFailure);
  [v8 setIntent:v5];
  [v8 setFailure:v4];
  id v7 = self;
  objc_sync_enter(v7);
  [(NSMutableArray *)v7->_intentResponseFailures addObject:v8];
  objc_sync_exit(v7);
}

- (void)captureBookedRideOptionName:(id)a3
{
}

- (void)captureView:(int64_t)a3
{
  self->_endView = a3;
}

- (void)captureStatusIssue:(int64_t)a3
{
  self->_statusIssue = a3;
}

- (void)endSessionOnView:(int64_t)a3 state:(int64_t)a4
{
  if (!self->_sessionEnded)
  {
    self->_sessionEnded = 1;
    self->_unsigned int endState = a4;
    self->_unsigned int endView = a3;
    if (!self->_maximumCountOfRideOptionsReturned) {
      self->_noRidesAvailable = 1;
    }
    if (a4 == 1)
    {
      uint64_t v5 = +[NSDate date];
      bookingDate = self->_bookingDate;
      self->_bookingDate = v5;
    }
    [(NSDate *)self->_sessionStartDate timeIntervalSinceNow];
    double v8 = v7;
    [(CLLocation *)self->_origin coordinate];
    double v10 = v9;
    [(CLLocation *)self->_origin coordinate];
    double v12 = v11;
    [(CLLocation *)self->_destination coordinate];
    double v14 = v13;
    [(CLLocation *)self->_destination coordinate];
    double v16 = v15;
    v17 = self;
    objc_sync_enter(v17);
    id v49 = [(NSMutableArray *)v17->_errorMessages copy];
    uint64_t v18 = (uint64_t)(v12 * 100.0);
    double v19 = (float)((float)(uint64_t)(v14 * 100.0) / 100.0);
    double v20 = (float)((float)v18 / 100.0);
    objc_sync_exit(v17);

    id v21 = objc_alloc_init((Class)GEOLatLng);
    [v21 setLat:(float)((float)(uint64_t)(v10 * 100.0) / 100.0)];
    [v21 setLng:v20];
    id v22 = objc_alloc_init((Class)GEOLatLng);
    [v22 setLat:v19];
    [v22 setLng:(float)((float)(uint64_t)(v16 * 100.0) / 100.0)];
    [(NSDate *)v17->_bookingDate timeIntervalSince1970];
    double v24 = v23;
    v25 = +[NSProcessInfo processInfo];
    v26 = [v25 processName];
    unsigned int v27 = [v26 isEqualToString:@"destinationd"];

    if (v27)
    {
      v28 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/Shared/Rides/Internal/RidesharingAnalyticsBookingSession.m");
        id v30 = [objc_alloc((Class)NSString) initWithFormat:@"endSessionOnView: was called from destinationd, not capturing ride booking analytics"];
        *(_DWORD *)buf = 136315394;
        v51 = v29;
        __int16 v52 = 2112;
        id v53 = v30;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
      }
    }
    else
    {
      unsigned int endState = self->_endState;
      unsigned int statusIssue = v17->_statusIssue;
      unsigned int endView = self->_endView;
      sessionId = v17->_sessionId;
      appVersion = v17->_appVersion;
      appIdentifier = v17->_appIdentifier;
      v45 = +[NSNumber numberWithBool:v17->_exploredOtherOptions];
      v38 = +[NSNumber numberWithDouble:v17->_distanceToPickup];
      v48 = +[NSNumber numberWithBool:v17->_paymentIsApplePay];
      v47 = +[NSNumber numberWithUnsignedInteger:v17->_numberOfInstalledExtensions];
      v46 = +[NSNumber numberWithBool:v17->_switchedApp];
      v31 = +[NSNumber numberWithBool:v17->_comparedRideOptions];
      v37 = +[NSNumber numberWithBool:v17->_showedSurgePricingAlert];
      v32 = +[NSNumber numberWithDouble:-v8];
      v33 = +[NSNumber numberWithBool:v17->_installedApp];
      v34 = +[NSNumber numberWithDouble:(float)((float)(uint64_t)(v24 * 3600.0) / 3600.0)];
      v35 = +[NSNumber numberWithBool:v17->_noRidesAvailable];
      v36 = +[NSNumber numberWithBool:v17->_movedPickupLocation];
      +[GEOAPPortal captureRideBookingWithRideBookingSessionId:statusIssue:endState:endView:rideAppId:rideAppVersion:originBlurred:destinationBlurred:exploredOtherOptions:distanceToPickupInMeters:paymentIsApplePay:numberOfAvailableExtensions:switchedApp:comparedRideOptions:showedSurgePricingAlert:durationOfSessionInSeconds:installedApp:timestamp:unavailable:movedPickupLocation:errorMessages:intentResponseFailures:](GEOAPPortal, "captureRideBookingWithRideBookingSessionId:statusIssue:endState:endView:rideAppId:rideAppVersion:originBlurred:destinationBlurred:exploredOtherOptions:distanceToPickupInMeters:paymentIsApplePay:numberOfAvailableExtensions:switchedApp:comparedRideOptions:showedSurgePricingAlert:durationOfSessionInSeconds:installedApp:timestamp:unavailable:movedPickupLocation:errorMessages:intentResponseFailures:", sessionId, statusIssue, endState, endView, appIdentifier, appVersion, v21, v22, v45, v38, v48, v47, v46, v31,
        v37,
        v32,
        v33,
        v34,
        v35,
        v36,
        v49,
        v17->_intentResponseFailures);
    }
  }
}

- (BOOL)sessionEnded
{
  return self->_sessionEnded;
}

- (void)setSessionEnded:(BOOL)a3
{
  self->_sessionEnded = a3;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (CLLocation)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
}

- (CLLocation)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (BOOL)showedSurgePricingAlert
{
  return self->_showedSurgePricingAlert;
}

- (void)setShowedSurgePricingAlert:(BOOL)a3
{
  self->_showedSurgePricingAlert = a3;
}

- (BOOL)installedApp
{
  return self->_installedApp;
}

- (void)setInstalledApp:(BOOL)a3
{
  self->_installedApp = a3;
}

- (BOOL)exploredOtherOptions
{
  return self->_exploredOtherOptions;
}

- (void)setExploredOtherOptions:(BOOL)a3
{
  self->_exploredOtherOptions = a3;
}

- (BOOL)paymentIsApplePay
{
  return self->_paymentIsApplePay;
}

- (void)setPaymentIsApplePay:(BOOL)a3
{
  self->_paymentIsApplePay = a3;
}

- (double)distanceToPickup
{
  return self->_distanceToPickup;
}

- (void)setDistanceToPickup:(double)a3
{
  self->_distanceToPickup = a3;
}

- (NSDate)bookingDate
{
  return self->_bookingDate;
}

- (void)setBookingDate:(id)a3
{
}

- (BOOL)movedPickupLocation
{
  return self->_movedPickupLocation;
}

- (void)setMovedPickupLocation:(BOOL)a3
{
  self->_movedPickupLocation = a3;
}

- (BOOL)comparedRideOptions
{
  return self->_comparedRideOptions;
}

- (void)setComparedRideOptions:(BOOL)a3
{
  self->_comparedRideOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookingDate, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_intentResponseFailures, 0);
  objc_storeStrong((id *)&self->_rideType, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_errorMessages, 0);
  objc_storeStrong((id *)&self->_initiallySelectedApp, 0);

  objc_storeStrong((id *)&self->_sessionStartDate, 0);
}

@end