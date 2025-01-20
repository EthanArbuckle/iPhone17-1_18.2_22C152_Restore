@interface RestaurantReservationAnalyticsBookingSession
- (BOOL)addedSpecialRequest;
- (BOOL)hasAppsEnabled;
- (BOOL)hasAppsInstalled;
- (BOOL)installCompleted;
- (BOOL)installNeeded;
- (BOOL)sessionEnded;
- (BOOL)swipedAvailableTimes;
- (BOOL)tappedDatePicker;
- (NSDate)startDate;
- (NSMutableArray)errorMessages;
- (NSString)appID;
- (NSString)installNeededTappedAppId;
- (NSString)sessionID;
- (RestaurantReservationAnalyticsBookingSession)init;
- (id)description;
- (int64_t)blurredBookingTimestamp;
- (int64_t)blurredReservationTimestamp;
- (int64_t)currentState;
- (int64_t)currentView;
- (unint64_t)muid;
- (unint64_t)tableSize;
- (void)_mapsBackgrounded;
- (void)_mapsForegrounded;
- (void)_restartSession;
- (void)addErrorMessage:(id)a3;
- (void)beginSessionIfNeeded;
- (void)endSession;
- (void)endSessionWithState:(int64_t)a3;
- (void)setAddedSpecialRequest:(BOOL)a3;
- (void)setAppID:(id)a3;
- (void)setBlurredBookingTimestamp:(int64_t)a3;
- (void)setBlurredReservationTimestamp:(int64_t)a3;
- (void)setCurrentState:(int64_t)a3;
- (void)setCurrentView:(int64_t)a3;
- (void)setHasAppsEnabled:(BOOL)a3;
- (void)setHasAppsInstalled:(BOOL)a3;
- (void)setInstallCompleted:(BOOL)a3;
- (void)setInstallNeeded:(BOOL)a3;
- (void)setInstallNeededTappedAppId:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setSessionEnded:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setSwipedAvailableTimes:(BOOL)a3;
- (void)setTableSize:(unint64_t)a3;
- (void)setTappedDatePicker:(BOOL)a3;
@end

@implementation RestaurantReservationAnalyticsBookingSession

- (RestaurantReservationAnalyticsBookingSession)init
{
  v11.receiver = self;
  v11.super_class = (Class)RestaurantReservationAnalyticsBookingSession;
  v2 = [(RestaurantReservationAnalyticsBookingSession *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    errorMessages = v2->_errorMessages;
    v2->_errorMessages = (NSMutableArray *)v3;

    v5 = +[NSUUID UUID];
    uint64_t v6 = [v5 UUIDString];
    sessionID = v2->_sessionID;
    v2->_sessionID = (NSString *)v6;

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"_mapsBackgrounded" name:UIApplicationDidEnterBackgroundNotification object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"_mapsForegrounded" name:UIApplicationWillEnterForegroundNotification object:0];
  }
  return v2;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v15.receiver = self;
  v15.super_class = (Class)RestaurantReservationAnalyticsBookingSession;
  v4 = [(RestaurantReservationAnalyticsBookingSession *)&v15 description];
  id v5 = [v3 initWithFormat:@"%@\n", v4];

  uint64_t v6 = [(RestaurantReservationAnalyticsBookingSession *)self sessionID];
  [v5 appendFormat:@" sessionID: %@\n", v6];

  v7 = [(RestaurantReservationAnalyticsBookingSession *)self appID];
  [v5 appendFormat:@" appID: %@\n", v7];

  [v5 appendFormat:@" muid: %llu\n" [self muid]];
  [v5 appendFormat:@" blurredReservationTimestamp: %lld\n" [self blurredBookingTimestamp]];
  [v5 appendFormat:@" blurredBookingTimestamp: %lld\n" , [self blurredReservationTimestamp]];
  [v5 appendFormat:@" installNeeded: %d\n", -[self installNeeded]];
  v8 = [(RestaurantReservationAnalyticsBookingSession *)self installNeededTappedAppId];
  [v5 appendFormat:@" installNeededTappedAppId: %@\n", v8];

  [v5 appendFormat:@" installCompleted: %d\n" , [self installCompleted]];
  [v5 appendFormat:@" tableSize: %lu\n" [self tableSize]];
  [v5 appendFormat:@" addedSpecialRequest: %d\n", [self addedSpecialRequest]];
  [v5 appendFormat:@" swipedAvailableTimes: %d\n", [self swipedAvailableTimes]];
  [v5 appendFormat:@" tappedDatePicker: %d\n" , [self tappedDatePicker]];
  [v5 appendFormat:@" hasAppsInstalled: %d\n", [self hasAppsInstalled]];
  [v5 appendFormat:@" hasAppsEnabled: %d\n" [self hasAppsEnabled]];
  unint64_t v9 = [(RestaurantReservationAnalyticsBookingSession *)self currentView];
  if (v9 > 7) {
    CFStringRef v10 = @"UNKNOWN";
  }
  else {
    CFStringRef v10 = *(&off_101313228 + v9);
  }
  [v5 appendFormat:@" currentView: %@\n", v10];
  unint64_t v11 = [(RestaurantReservationAnalyticsBookingSession *)self currentState];
  if (v11 > 5) {
    CFStringRef v12 = @"UNKNOWN";
  }
  else {
    CFStringRef v12 = *(&off_101313268 + v11);
  }
  [v5 appendFormat:@" currentState: %@\n", v12];
  id v13 = [v5 copy];

  return v13;
}

- (void)_mapsBackgrounded
{
}

- (void)_mapsForegrounded
{
  uint64_t v3 = [(RestaurantReservationAnalyticsBookingSession *)self startDate];
  if (v3)
  {
    v4 = (void *)v3;
    unsigned int v5 = [(RestaurantReservationAnalyticsBookingSession *)self sessionEnded];

    if (v5)
    {
      [(RestaurantReservationAnalyticsBookingSession *)self _restartSession];
    }
  }
}

- (void)_restartSession
{
  uint64_t v3 = [(RestaurantReservationAnalyticsBookingSession *)self errorMessages];
  objc_sync_enter(v3);
  v4 = [(RestaurantReservationAnalyticsBookingSession *)self errorMessages];
  [v4 removeAllObjects];

  objc_sync_exit(v3);
  unsigned int v5 = +[NSDate date];
  [(RestaurantReservationAnalyticsBookingSession *)self setStartDate:v5];

  [(RestaurantReservationAnalyticsBookingSession *)self setSessionEnded:0];
}

- (void)addErrorMessage:(id)a3
{
  id v6 = a3;
  v4 = [(RestaurantReservationAnalyticsBookingSession *)self errorMessages];
  objc_sync_enter(v4);
  unsigned int v5 = [(RestaurantReservationAnalyticsBookingSession *)self errorMessages];
  [v5 addObject:v6];

  objc_sync_exit(v4);
}

- (void)beginSessionIfNeeded
{
  uint64_t v3 = [(RestaurantReservationAnalyticsBookingSession *)self startDate];

  if (!v3)
  {
    [(RestaurantReservationAnalyticsBookingSession *)self _restartSession];
  }
}

- (void)endSession
{
  int64_t v3 = [(RestaurantReservationAnalyticsBookingSession *)self currentState];

  [(RestaurantReservationAnalyticsBookingSession *)self endSessionWithState:v3];
}

- (void)endSessionWithState:(int64_t)a3
{
  unsigned int v3 = a3;
  if (![(RestaurantReservationAnalyticsBookingSession *)self sessionEnded])
  {
    unsigned int v5 = [(RestaurantReservationAnalyticsBookingSession *)self startDate];

    if (v5)
    {
      [(RestaurantReservationAnalyticsBookingSession *)self setSessionEnded:1];
      id v6 = [(RestaurantReservationAnalyticsBookingSession *)self errorMessages];
      objc_sync_enter(v6);
      v7 = [(RestaurantReservationAnalyticsBookingSession *)self errorMessages];
      id v31 = [v7 copy];

      objc_sync_exit(v6);
      unsigned int v8 = [(RestaurantReservationAnalyticsBookingSession *)self currentState];
      if ((id)[(RestaurantReservationAnalyticsBookingSession *)self currentState] != (id)1) {
        unsigned int v8 = v3;
      }
      int64_t v9 = [(RestaurantReservationAnalyticsBookingSession *)self currentView];
      CFStringRef v10 = [(RestaurantReservationAnalyticsBookingSession *)self startDate];
      [v10 timeIntervalSinceNow];
      double v12 = -v11;

      v25 = [(RestaurantReservationAnalyticsBookingSession *)self sessionID];
      v30 = [(RestaurantReservationAnalyticsBookingSession *)self appID];
      unint64_t v24 = [(RestaurantReservationAnalyticsBookingSession *)self muid];
      unsigned int v23 = v8;
      int64_t v22 = v9;
      if (v24)
      {
        v26 = +[NSNumber numberWithUnsignedLongLong:[(RestaurantReservationAnalyticsBookingSession *)self muid]];
      }
      else
      {
        v26 = 0;
      }
      v29 = +[NSNumber numberWithLongLong:[(RestaurantReservationAnalyticsBookingSession *)self blurredReservationTimestamp]];
      v28 = +[NSNumber numberWithLongLong:[(RestaurantReservationAnalyticsBookingSession *)self blurredBookingTimestamp]];
      v27 = +[NSNumber numberWithDouble:v12];
      id v13 = +[NSNumber numberWithBool:[(RestaurantReservationAnalyticsBookingSession *)self installNeeded]];
      unsigned int v14 = [(RestaurantReservationAnalyticsBookingSession *)self installNeeded];
      if (v14)
      {
        objc_super v15 = [(RestaurantReservationAnalyticsBookingSession *)self installNeededTappedAppId];
      }
      else
      {
        objc_super v15 = 0;
      }
      unsigned int v16 = [(RestaurantReservationAnalyticsBookingSession *)self installNeeded];
      if (v16)
      {
        v17 = +[NSNumber numberWithBool:[(RestaurantReservationAnalyticsBookingSession *)self installCompleted]];
      }
      else
      {
        v17 = 0;
      }
      v18 = +[NSNumber numberWithUnsignedInteger:[(RestaurantReservationAnalyticsBookingSession *)self tableSize]];
      v19 = +[NSNumber numberWithBool:[(RestaurantReservationAnalyticsBookingSession *)self addedSpecialRequest]];
      v20 = +[NSNumber numberWithBool:[(RestaurantReservationAnalyticsBookingSession *)self swipedAvailableTimes]];
      v21 = +[NSNumber numberWithBool:[(RestaurantReservationAnalyticsBookingSession *)self tappedDatePicker]];
      +[GEOAPPortal captureTableBookingWithBookTableSessionId:endState:endView:bookTableAppId:muid:blurredReservationTimestamp:blurredBookingTimestamp:durationOfSessionInSeconds:installNeeded:installNeededTappedAppId:installCompleted:tableSize:addedSpecialRequest:swipedAvailableTimes:tappedDatePicker:errorMessages:](GEOAPPortal, "captureTableBookingWithBookTableSessionId:endState:endView:bookTableAppId:muid:blurredReservationTimestamp:blurredBookingTimestamp:durationOfSessionInSeconds:installNeeded:installNeededTappedAppId:installCompleted:tableSize:addedSpecialRequest:swipedAvailableTimes:tappedDatePicker:errorMessages:", v25, v23, v22, v30, v26, v29, v28, v27, v13, v15, v17, v18, v19, v20, v21,
        v31);

      if (v16) {
      if (v14)
      }

      if (v24) {
    }
      }
  }
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  self->_muid = a3;
}

- (int64_t)blurredReservationTimestamp
{
  return self->_blurredReservationTimestamp;
}

- (void)setBlurredReservationTimestamp:(int64_t)a3
{
  self->_blurredReservationTimestamp = a3;
}

- (int64_t)blurredBookingTimestamp
{
  return self->_blurredBookingTimestamp;
}

- (void)setBlurredBookingTimestamp:(int64_t)a3
{
  self->_blurredBookingTimestamp = a3;
}

- (BOOL)installNeeded
{
  return self->_installNeeded;
}

- (void)setInstallNeeded:(BOOL)a3
{
  self->_installNeeded = a3;
}

- (NSString)installNeededTappedAppId
{
  return self->_installNeededTappedAppId;
}

- (void)setInstallNeededTappedAppId:(id)a3
{
}

- (BOOL)installCompleted
{
  return self->_installCompleted;
}

- (void)setInstallCompleted:(BOOL)a3
{
  self->_installCompleted = a3;
}

- (unint64_t)tableSize
{
  return self->_tableSize;
}

- (void)setTableSize:(unint64_t)a3
{
  self->_tableSize = a3;
}

- (BOOL)addedSpecialRequest
{
  return self->_addedSpecialRequest;
}

- (void)setAddedSpecialRequest:(BOOL)a3
{
  self->_addedSpecialRequest = a3;
}

- (BOOL)swipedAvailableTimes
{
  return self->_swipedAvailableTimes;
}

- (void)setSwipedAvailableTimes:(BOOL)a3
{
  self->_swipedAvailableTimes = a3;
}

- (BOOL)tappedDatePicker
{
  return self->_tappedDatePicker;
}

- (void)setTappedDatePicker:(BOOL)a3
{
  self->_tappedDatePicker = a3;
}

- (BOOL)hasAppsInstalled
{
  return self->_hasAppsInstalled;
}

- (void)setHasAppsInstalled:(BOOL)a3
{
  self->_hasAppsInstalled = a3;
}

- (BOOL)hasAppsEnabled
{
  return self->_hasAppsEnabled;
}

- (void)setHasAppsEnabled:(BOOL)a3
{
  self->_hasAppsEnabled = a3;
}

- (int64_t)currentView
{
  return self->_currentView;
}

- (void)setCurrentView:(int64_t)a3
{
  self->_currentView = a3;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (NSMutableArray)errorMessages
{
  return self->_errorMessages;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (BOOL)sessionEnded
{
  return self->_sessionEnded;
}

- (void)setSessionEnded:(BOOL)a3
{
  self->_sessionEnded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_errorMessages, 0);
  objc_storeStrong((id *)&self->_installNeededTappedAppId, 0);
  objc_storeStrong((id *)&self->_appID, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end