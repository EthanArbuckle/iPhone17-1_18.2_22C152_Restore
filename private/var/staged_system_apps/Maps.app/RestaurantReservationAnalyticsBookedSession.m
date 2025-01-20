@interface RestaurantReservationAnalyticsBookedSession
+ (id)currentAnalyticsBookedSessionForMuid:(unint64_t)a3 createIfNotPresent:(BOOL)a4;
+ (void)removeAnalyticsBookedSession:(id)a3;
+ (void)removeAnalyticsBookedSessionsFromProactiveTrayIfNotInListOfMuids:(id)a3;
- (BOOL)bookedUsingMaps;
- (BOOL)hasAppsEnabled;
- (BOOL)hasAppsInstalled;
- (BOOL)sessionEnded;
- (BOOL)tappedChangeReservation;
- (BOOL)tappedProactiveTrayItem;
- (BOOL)viewedDetailsFromPlacecard;
- (BOOL)viewedInPlacecard;
- (BOOL)viewedInProactiveTray;
- (NSString)appID;
- (NSString)sessionID;
- (RestaurantReservationAnalyticsBookedSession)init;
- (id)description;
- (unint64_t)muid;
- (void)_captureSession;
- (void)_mapsForegrounded;
- (void)_restartSession;
- (void)endSession;
- (void)setAppID:(id)a3;
- (void)setBookedUsingMaps:(BOOL)a3;
- (void)setHasAppsEnabled:(BOOL)a3;
- (void)setHasAppsInstalled:(BOOL)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setSessionEnded:(BOOL)a3;
- (void)setTappedChangeReservation:(BOOL)a3;
- (void)setTappedProactiveTrayItem:(BOOL)a3;
- (void)setViewedDetailsFromPlacecard:(BOOL)a3;
- (void)setViewedInPlacecard:(BOOL)a3;
- (void)setViewedInProactiveTray:(BOOL)a3;
@end

@implementation RestaurantReservationAnalyticsBookedSession

- (RestaurantReservationAnalyticsBookedSession)init
{
  v9.receiver = self;
  v9.super_class = (Class)RestaurantReservationAnalyticsBookedSession;
  v2 = [(RestaurantReservationAnalyticsBookedSession *)&v9 init];
  if (v2)
  {
    v3 = +[NSUUID UUID];
    uint64_t v4 = [v3 UUIDString];
    sessionID = v2->_sessionID;
    v2->_sessionID = (NSString *)v4;

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"_mapsBackgrounded" name:UIApplicationDidEnterBackgroundNotification object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_mapsForegrounded" name:UIApplicationWillEnterForegroundNotification object:0];
  }
  return v2;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v10.receiver = self;
  v10.super_class = (Class)RestaurantReservationAnalyticsBookedSession;
  uint64_t v4 = [(RestaurantReservationAnalyticsBookedSession *)&v10 description];
  id v5 = [v3 initWithFormat:@"%@\n", v4];

  v6 = [(RestaurantReservationAnalyticsBookedSession *)self sessionID];
  [v5 appendFormat:@" sessionID: %@\n", v6];

  v7 = [(RestaurantReservationAnalyticsBookedSession *)self appID];
  [v5 appendFormat:@" appID: %@\n", v7];

  [v5 appendFormat:@" muid: %llu\n" , [self muid]];
  [v5 appendFormat:@" tappedChangeReservation: %d\n", [self tappedChangeReservation]];
  [v5 appendFormat:@" bookedUsingMaps: %d\n" , [self bookedUsingMaps]];
  [v5 appendFormat:@" viewedInProactiveTray: %d\n", [self viewedInProactiveTray]];
  [v5 appendFormat:@" tappedProactiveTrayItem: %d\n", [self tappedProactiveTrayItem]];
  [v5 appendFormat:@" viewedInPlacecard: %d\n" , [self viewedInPlacecard]];
  [v5 appendFormat:@" viewedDetailsFromPlacecard: %d\n", [self viewedDetailsFromPlacecard]];
  [v5 appendFormat:@" hasAppsInstalled: %d\n" [self hasAppsInstalled]];
  [v5 appendFormat:@" hasAppsEnabled: %d\n" , [self hasAppsEnabled]];
  id v8 = [v5 copy];

  return v8;
}

+ (id)currentAnalyticsBookedSessionForMuid:(unint64_t)a3 createIfNotPresent:(BOOL)a4
{
  BOOL v4 = a4;
  if (qword_101610BE0 != -1) {
    dispatch_once(&qword_101610BE0, &stru_10131C550);
  }
  [(id)qword_101610BE8 lock];
  if (qword_101610BF0)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = (id)qword_101610BF0;
    v7 = (RestaurantReservationAnalyticsBookedSession *)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v7; i = (RestaurantReservationAnalyticsBookedSession *)((char *)i + 1))
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          objc_super v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v10, "muid", (void)v15) == (id)a3)
          {
            v7 = v10;
            goto LABEL_14;
          }
        }
        v7 = (RestaurantReservationAnalyticsBookedSession *)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    id v11 = objc_alloc_init((Class)NSMutableArray);
    v12 = (void *)qword_101610BF0;
    qword_101610BF0 = (uint64_t)v11;

    v7 = 0;
  }
  if (v7) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = !v4;
  }
  if (!v13)
  {
    v7 = objc_alloc_init(RestaurantReservationAnalyticsBookedSession);
    [(RestaurantReservationAnalyticsBookedSession *)v7 setMuid:a3];
    [(id)qword_101610BF0 addObject:v7];
  }
  [qword_101610BE8 unlock:v15];

  return v7;
}

+ (void)removeAnalyticsBookedSession:(id)a3
{
  uint64_t v3 = qword_101610BF8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_101610BF8, &stru_10131C570);
  }
  [(id)qword_101610BE8 lock];
  [(id)qword_101610BF0 removeObject:v4];

  id v5 = (void *)qword_101610BE8;

  [v5 unlock];
}

+ (void)removeAnalyticsBookedSessionsFromProactiveTrayIfNotInListOfMuids:(id)a3
{
  id v24 = a3;
  v23 = +[NSMutableArray array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = (id)qword_101610BF0;
  id v3 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v35;
    uint64_t v21 = *(void *)v35;
    do
    {
      id v6 = 0;
      id v22 = v4;
      do
      {
        if (*(void *)v35 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v6);
        if ([v7 viewedInProactiveTray])
        {
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v8 = v24;
          id v9 = [v8 countByEnumeratingWithState:&v30 objects:v39 count:16];
          if (!v9)
          {

LABEL_19:
            [v23 addObject:v7];
            goto LABEL_20;
          }
          id v10 = v9;
          uint64_t v11 = *(void *)v31;
          char v12 = 1;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v31 != v11) {
                objc_enumerationMutation(v8);
              }
              v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              long long v15 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v7 muid]);
              LODWORD(v14) = [v14 isEqualToNumber:v15];

              if (v14) {
                char v12 = 0;
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v30 objects:v39 count:16];
          }
          while (v10);

          uint64_t v5 = v21;
          id v4 = v22;
          if (v12) {
            goto LABEL_19;
          }
        }
LABEL_20:
        id v6 = (char *)v6 + 1;
      }
      while (v6 != v4);
      id v4 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v4);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = v23;
  id v17 = [v16 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v27;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * (void)j) endSession];
      }
      id v18 = [v16 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v18);
  }
}

- (void)_mapsForegrounded
{
  *(_WORD *)&self->_viewedInPlacecard = 0;
  *(_DWORD *)&self->_tappedChangeReservation = 0;
}

- (void)_restartSession
{
  self->_sessionEnded = 0;
}

- (void)_captureSession
{
  id v12 = [(RestaurantReservationAnalyticsBookedSession *)self sessionID];
  BOOL v3 = [(RestaurantReservationAnalyticsBookedSession *)self bookedUsingMaps];
  BOOL v4 = [(RestaurantReservationAnalyticsBookedSession *)self viewedInProactiveTray];
  BOOL v5 = [(RestaurantReservationAnalyticsBookedSession *)self tappedProactiveTrayItem];
  BOOL v6 = [(RestaurantReservationAnalyticsBookedSession *)self viewedInPlacecard];
  unsigned __int8 v7 = [(RestaurantReservationAnalyticsBookedSession *)self viewedDetailsFromPlacecard];
  id v8 = [(RestaurantReservationAnalyticsBookedSession *)self appID];
  unint64_t v9 = [(RestaurantReservationAnalyticsBookedSession *)self muid];
  BYTE3(v11) = 0;
  BYTE2(v11) = [(RestaurantReservationAnalyticsBookedSession *)self tappedChangeReservation];
  LOWORD(v11) = 0;
  LOWORD(v10) = v7;
  +[GEOAPPortal captureTableBookedEventWithSessionId:bookedUsingMaps:cancelled:viewedInProactiveTray:tappedProactiveTrayItem:viewedInPlacecard:viewedDetailsInPlacecard:isAsync:bookedAppId:muid:called:routed:tappedChangeReservation:tappedCancelReservation:](GEOAPPortal, "captureTableBookedEventWithSessionId:bookedUsingMaps:cancelled:viewedInProactiveTray:tappedProactiveTrayItem:viewedInPlacecard:viewedDetailsInPlacecard:isAsync:bookedAppId:muid:called:routed:tappedChangeReservation:tappedCancelReservation:", v12, v3, 0, v4, v5, v6, v10, v8, v9, v11);
}

- (void)setHasAppsInstalled:(BOOL)a3
{
  self->_hasAppsInstalled = a3;
}

- (void)setHasAppsEnabled:(BOOL)a3
{
  self->_hasAppsEnabled = a3;
}

- (void)setAppID:(id)a3
{
  BOOL v4 = (NSString *)a3;
  if (v4) {
    [(RestaurantReservationAnalyticsBookedSession *)self _restartSession];
  }
  appID = self->_appID;
  self->_appID = v4;
}

- (void)setMuid:(unint64_t)a3
{
  if (a3) {
    [(RestaurantReservationAnalyticsBookedSession *)self _restartSession];
  }
  self->_muid = a3;
}

- (void)setBookedUsingMaps:(BOOL)a3
{
  if (a3) {
    [(RestaurantReservationAnalyticsBookedSession *)self _restartSession];
  }
  self->_bookedUsingMaps = a3;
}

- (void)setViewedInPlacecard:(BOOL)a3
{
  if (a3) {
    [(RestaurantReservationAnalyticsBookedSession *)self _restartSession];
  }
  self->_viewedInPlacecard = a3;
}

- (void)setViewedInProactiveTray:(BOOL)a3
{
  if (a3) {
    [(RestaurantReservationAnalyticsBookedSession *)self _restartSession];
  }
  self->_viewedInProactiveTray = a3;
}

- (void)setTappedProactiveTrayItem:(BOOL)a3
{
  if (a3) {
    [(RestaurantReservationAnalyticsBookedSession *)self _restartSession];
  }
  self->_tappedProactiveTrayItem = a3;
}

- (void)setTappedChangeReservation:(BOOL)a3
{
  if (a3) {
    [(RestaurantReservationAnalyticsBookedSession *)self _restartSession];
  }
  self->_tappedChangeReservation = a3;
}

- (void)setViewedDetailsFromPlacecard:(BOOL)a3
{
  if (a3) {
    [(RestaurantReservationAnalyticsBookedSession *)self _restartSession];
  }
  self->_viewedDetailsFromPlacecard = a3;
}

- (void)endSession
{
  if (![(RestaurantReservationAnalyticsBookedSession *)self sessionEnded])
  {
    [(RestaurantReservationAnalyticsBookedSession *)self setSessionEnded:1];
    [(RestaurantReservationAnalyticsBookedSession *)self _captureSession];
    +[RestaurantReservationAnalyticsBookedSession removeAnalyticsBookedSession:self];
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

- (unint64_t)muid
{
  return self->_muid;
}

- (BOOL)tappedChangeReservation
{
  return self->_tappedChangeReservation;
}

- (BOOL)bookedUsingMaps
{
  return self->_bookedUsingMaps;
}

- (BOOL)viewedInProactiveTray
{
  return self->_viewedInProactiveTray;
}

- (BOOL)tappedProactiveTrayItem
{
  return self->_tappedProactiveTrayItem;
}

- (BOOL)viewedInPlacecard
{
  return self->_viewedInPlacecard;
}

- (BOOL)viewedDetailsFromPlacecard
{
  return self->_viewedDetailsFromPlacecard;
}

- (BOOL)hasAppsInstalled
{
  return self->_hasAppsInstalled;
}

- (BOOL)hasAppsEnabled
{
  return self->_hasAppsEnabled;
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
  objc_storeStrong((id *)&self->_appID, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end