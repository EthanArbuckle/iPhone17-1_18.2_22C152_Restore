@interface RidesharingAnalyticsBookedSession
- (BOOL)bookedUsingMaps;
- (BOOL)cancelled;
- (BOOL)contactedDriver;
- (BOOL)invalidVehicleLocation;
- (BOOL)missingVehicleLocation;
- (BOOL)sessionEnded;
- (BOOL)tappedProactiveTrayItem;
- (BOOL)viewedDetails;
- (BOOL)viewedInProactiveTray;
- (NSString)appIdentifier;
- (NSString)appVersion;
- (NSString)sessionId;
- (RidesharingAnalyticsBookedSession)init;
- (unint64_t)numberOfEnabledExtensions;
- (unint64_t)numberOfInstalledExtensions;
- (void)captureIntent:(int)a3 withFailure:(int)a4;
- (void)captureStatusIssue:(int64_t)a3;
- (void)endSession;
- (void)mapsForegrounded;
- (void)setAppIdentifier:(id)a3;
- (void)setAppVersion:(id)a3;
- (void)setBookedUsingMaps:(BOOL)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setContactedDriver:(BOOL)a3;
- (void)setInvalidVehicleLocation:(BOOL)a3;
- (void)setMissingVehicleLocation:(BOOL)a3;
- (void)setNumberOfEnabledExtensions:(unint64_t)a3;
- (void)setNumberOfInstalledExtensions:(unint64_t)a3;
- (void)setSessionEnded:(BOOL)a3;
- (void)setSessionId:(id)a3;
- (void)setTappedProactiveTrayItem:(BOOL)a3;
- (void)setViewedDetails:(BOOL)a3;
- (void)setViewedInProactiveTray:(BOOL)a3;
@end

@implementation RidesharingAnalyticsBookedSession

- (RidesharingAnalyticsBookedSession)init
{
  v8.receiver = self;
  v8.super_class = (Class)RidesharingAnalyticsBookedSession;
  v2 = [(RidesharingAnalyticsBookedSession *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    intentResponseFailures = v2->_intentResponseFailures;
    v2->_intentResponseFailures = v3;

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"mapsBackgrounded" name:UIApplicationDidEnterBackgroundNotification object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"mapsForegrounded" name:UIApplicationWillEnterForegroundNotification object:0];
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

- (void)captureStatusIssue:(int64_t)a3
{
  self->_statusIssue = a3;
}

- (void)captureIntent:(int)a3 withFailure:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v8 = objc_alloc_init((Class)GEORideBookingIntentResponseFailure);
  [v8 setIntent:v5];
  [v8 setFailure:v4];
  v7 = self;
  objc_sync_enter(v7);
  [(NSMutableArray *)v7->_intentResponseFailures addObject:v8];
  objc_sync_exit(v7);
}

- (void)endSession
{
  if (!self->_sessionEnded)
  {
    self->_sessionEnded = 1;
    v3 = +[NSProcessInfo processInfo];
    uint64_t v4 = [v3 processName];
    unsigned int v5 = [v4 isEqualToString:@"destinationd"];

    if (v5)
    {
      v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/Shared/Rides/Internal/RidesharingAnalyticsBookedSession.m");
        id v8 = [objc_alloc((Class)NSString) initWithFormat:@"endSession was called from destinationd, not capturing ride booking analytics"];
        *(_DWORD *)buf = 136315394;
        v19 = v7;
        __int16 v20 = 2112;
        id v21 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
      }
    }
    else
    {
      sessionId = self->_sessionId;
      id v17 = +[NSNumber numberWithBool:self->_bookedUsingMaps];
      v10 = +[NSNumber numberWithBool:self->_cancelled];
      v11 = +[NSNumber numberWithBool:self->_contactedDriver];
      v12 = +[NSNumber numberWithBool:self->_viewedInProactiveTray];
      v13 = +[NSNumber numberWithBool:self->_tappedProactiveTrayItem];
      v14 = +[NSNumber numberWithBool:self->_viewedDetails];
      v15 = +[NSNumber numberWithBool:self->_invalidVehicleLocation];
      v16 = +[NSNumber numberWithBool:self->_missingVehicleLocation];
      +[GEOAPPortal captureRideBookedWithRideBookedSessionId:sessionId bookedUsingMaps:v17 cancelled:v10 contactedDriver:v11 viewedInProactiveTray:v12 tappedProactiveTrayItem:v13 viewedDetails:v14 invalidVehicleLocation:v15 missingVehicleLocation:v16 rideAppId:self->_appIdentifier rideAppVersion:self->_appVersion intentResponseFailures:self->_intentResponseFailures];
    }
  }
}

- (void)mapsForegrounded
{
  self->_sessionEnded = 0;
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

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
}

- (BOOL)bookedUsingMaps
{
  return self->_bookedUsingMaps;
}

- (void)setBookedUsingMaps:(BOOL)a3
{
  self->_bookedUsingMaps = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)contactedDriver
{
  return self->_contactedDriver;
}

- (void)setContactedDriver:(BOOL)a3
{
  self->_contactedDriver = a3;
}

- (BOOL)viewedInProactiveTray
{
  return self->_viewedInProactiveTray;
}

- (void)setViewedInProactiveTray:(BOOL)a3
{
  self->_viewedInProactiveTray = a3;
}

- (BOOL)tappedProactiveTrayItem
{
  return self->_tappedProactiveTrayItem;
}

- (void)setTappedProactiveTrayItem:(BOOL)a3
{
  self->_tappedProactiveTrayItem = a3;
}

- (BOOL)viewedDetails
{
  return self->_viewedDetails;
}

- (void)setViewedDetails:(BOOL)a3
{
  self->_viewedDetails = a3;
}

- (BOOL)invalidVehicleLocation
{
  return self->_invalidVehicleLocation;
}

- (void)setInvalidVehicleLocation:(BOOL)a3
{
  self->_invalidVehicleLocation = a3;
}

- (BOOL)missingVehicleLocation
{
  return self->_missingVehicleLocation;
}

- (void)setMissingVehicleLocation:(BOOL)a3
{
  self->_missingVehicleLocation = a3;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);

  objc_storeStrong((id *)&self->_intentResponseFailures, 0);
}

@end