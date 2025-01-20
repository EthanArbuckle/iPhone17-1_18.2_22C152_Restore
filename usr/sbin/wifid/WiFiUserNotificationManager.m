@interface WiFiUserNotificationManager
+ (BOOL)canRepromptForNotificationType:(int)a3 blacklistType:(int)a4 atDate:(id)a5 count:(unint64_t)a6;
+ (unint64_t)defaultThrottlingPeriodForBlacklistingType:(int)a3 count:(unint64_t)a4;
- (BOOL)enableTestMode;
- (BOOL)shouldTimeOutRecommendation;
- (BOOL)supportsWAPI;
- (CLLocation)lastRecommendationLocation;
- (NSMutableDictionary)notificationMapping;
- (NSMutableDictionary)recentNotifications;
- (NSString)visibleRequest;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timeoutTimer;
- (UNUserNotificationCenter)userNotificationCenterWiFi;
- (WiFiUserNotificationHistory)notificationHistory;
- (WiFiUserNotificationManager)initWithQueue:(id)a3 supportsWAPI:(BOOL)a4;
- (id)callback;
- (int)deviceClass;
- (int)dispatchNotificationWithAskToJoinHotspotRecommendation:(id)a3;
- (int)dispatchNotificationWithRecommendation:(id)a3 currentLocation:(id)a4 force:(BOOL)a5;
- (unint64_t)timeoutPeriod;
- (void)_startTimerForNotificationWithUserInfo:(id)a3;
- (void)_submitAnalyticsEventForJoinAlertReason:(int)a3 action:(unint64_t)a4 visibleDuration:(double)a5;
- (void)_submitAnalyticsEventForRecommendation:(id)a3 action:(unint64_t)a4 visibleDuration:(double)a5 location:(id)a6;
- (void)_timeoutTimerDidFire:(id)a3;
- (void)callbackContext;
- (void)dealloc;
- (void)dismissJoinAlerts;
- (void)dispatchAccessoryJoinAlertForNetwork:(id)a3 unsecured:(BOOL)a4;
- (void)dispatchJoinAlertForNetwork:(id)a3 withProviderName:(id)a4 andReason:(int)a5;
- (void)dispatchLowDataModeAlertForNetwork:(id)a3 withReason:(int)a4;
- (void)dispatchNotificationWithColocatedScanResult:(id)a3 fromScanResult:(id)a4;
- (void)dispatchNotificationWithRandomMAC:(id)a3;
- (void)enableTestMode:(BOOL)a3;
- (void)registerCallback:(id)a3 withContext:(void *)a4;
- (void)reset;
- (void)setCallback:(id)a3;
- (void)setCallbackContext:(void *)a3;
- (void)setDeviceClass:(int)a3;
- (void)setEnableTestMode:(BOOL)a3;
- (void)setLastRecommendationLocation:(id)a3;
- (void)setNotificationHistory:(id)a3;
- (void)setNotificationMapping:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecentNotifications:(id)a3;
- (void)setShouldTimeOutRecommendation:(BOOL)a3;
- (void)setSupportsWAPI:(BOOL)a3;
- (void)setTimeoutPeriod:(unint64_t)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setUserNotificationCenterWiFi:(id)a3;
- (void)setVisibleRequest:(id)a3;
- (void)startListening;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation WiFiUserNotificationManager

- (WiFiUserNotificationManager)initWithQueue:(id)a3 supportsWAPI:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)WiFiUserNotificationManager;
  v6 = [(WiFiUserNotificationManager *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_queue = (OS_dispatch_queue *)a3;
    v6->_supportsWAPI = a4;
    v8 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.wifid.usernotification"];
    v7->_userNotificationCenterWiFi = v8;
    [(UNUserNotificationCenter *)v8 setDelegate:v7];
    [(UNUserNotificationCenter *)v7->_userNotificationCenterWiFi requestAuthorizationWithOptions:3 completionHandler:&stru_100242F60];
    [(UNUserNotificationCenter *)v7->_userNotificationCenterWiFi removeAllDeliveredNotifications];
    v7->_notificationMapping = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v7->_recentNotifications = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v7->_timeoutPeriod = 30;
    v7->_shouldTimeOutRecommendation = 1;
    v7->_deviceClass = MGGetSInt32Answer();
    v7->_notificationHistory = objc_alloc_init(WiFiUserNotificationHistory);
  }
  return v7;
}

- (void)dealloc
{
  id callback = self->_callback;
  if (callback) {
    _Block_release(callback);
  }

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer) {
    dispatch_source_cancel(timeoutTimer);
  }

  self->_queue = 0;
  v5.receiver = self;
  v5.super_class = (Class)WiFiUserNotificationManager;
  [(WiFiUserNotificationManager *)&v5 dealloc];
}

- (void)startListening
{
  [(UNUserNotificationCenter *)self->_userNotificationCenterWiFi setWantsNotificationResponsesDelivered];
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: listening for user notifications", "-[WiFiUserNotificationManager startListening]")];
  }
}

+ (BOOL)canRepromptForNotificationType:(int)a3 blacklistType:(int)a4 atDate:(id)a5 count:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a4;
  [a5 timeIntervalSinceNow:a3];
  return -v8 > (double)+[WiFiUserNotificationManager defaultThrottlingPeriodForBlacklistingType:v7 count:a6];
}

+ (unint64_t)defaultThrottlingPeriodForBlacklistingType:(int)a3 count:(unint64_t)a4
{
  unint64_t v4 = 86400;
  uint64_t v5 = 604800;
  if (a4 != 2) {
    uint64_t v5 = 2592000;
  }
  if (a4 >= 2) {
    unint64_t v4 = v5;
  }
  if (a3 == 1) {
    return 2592000;
  }
  else {
    return v4;
  }
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  if (self->_timeoutTimer)
  {
    if (qword_10027DD68) {
      [qword_10027DD68 WFLog:message:3, "%s: canceling timer", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]"];
    }
    dispatch_source_cancel((dispatch_source_t)self->_timeoutTimer);
  }
  id v45 = [[[a4 notification:a3] request] identifier];
  id v9 = [(NSMutableDictionary *)[(WiFiUserNotificationManager *)self notificationMapping] objectForKey:v45];
  id v10 = [v9 objectForKey:@"SSID"];
  [[-[NSMutableDictionary objectForKey:](-[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"), "objectForKey:", v10) timeIntervalSinceNow];
  double v12 = v11;
  id v13 = [a4 actionIdentifier];
  id v14 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a4, "notification"), "request"), "content") categoryIdentifier];
  id v48 = v10;
  if (!v10)
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:4, "%s: ssid not found for notification (%@)", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", v45 message];
    }
    uint64_t v26 = 0;
    uint64_t v25 = 0;
    id v22 = 0;
    goto LABEL_25;
  }
  double v16 = -v12;
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s: Handle action %@ for notification %@ (SSID: %@, category: %@) visibleDuration %f", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", v13, v45, v10, v14, *(void *)&v16 message];
  }
  unsigned int v17 = [v14 isEqualToString:@"joinalert"];
  id v47 = a5;
  if (v17)
  {
    int v18 = 0;
    int v19 = 0;
    uint64_t v20 = 2;
LABEL_16:
    uint64_t v46 = v20;
    goto LABEL_17;
  }
  if ([v14 isEqualToString:@"recommendation"])
  {
    int v19 = 0;
    int v18 = 1;
    uint64_t v20 = 1;
    goto LABEL_16;
  }
  if ([v14 isEqualToString:@"lowdatamodealert"])
  {
    int v18 = 0;
    int v19 = 0;
    uint64_t v20 = 3;
    goto LABEL_16;
  }
  if ([v14 isEqualToString:@"randommac"])
  {
    int v18 = 0;
    int v19 = 0;
    uint64_t v20 = 4;
    goto LABEL_16;
  }
  if ([v14 isEqualToString:@"colocatedssid"])
  {
    int v18 = 0;
    uint64_t v46 = 5;
    int v19 = 1;
  }
  else
  {
    if ([v14 isEqualToString:@"asktojoinpersonalhotspot"])
    {
      uint64_t v25 = 1;
      uint64_t v46 = 6;
      if ([v13 isEqualToString:@"join"])
      {
        id v27 = v10;
        id v22 = v10;
        uint64_t v26 = 6;
        goto LABEL_37;
      }
      int v19 = 0;
      int v18 = 0;
      goto LABEL_27;
    }
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:4, "%s: unknown notificationType for category %@", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", v14 message];
    }
    int v18 = 0;
    int v19 = 0;
    uint64_t v46 = 0;
  }
LABEL_17:
  if ([v13 isEqualToString:@"join"])
  {
    id v21 = [v9 objectForKey:@"Recommendation"];
    if (v21)
    {
      id v22 = v21;
      id v23 = [v9 objectForKey:@"Location"];
      a5 = v47;
      if (!v23)
      {
        if (qword_10027DD68) {
          [((id)qword_10027DD68) WFLog:3, @"%s: location is not present", @"-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]"];
        }
      }
      uint64_t v25 = 1;
      [(WiFiUserNotificationManager *)self _submitAnalyticsEventForRecommendation:v22 action:1 visibleDuration:v23 location:v16];
      goto LABEL_24;
    }
    a5 = v47;
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:4, "%s: recommendation not found for notification (%@)", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", v45 message];
    }
    goto LABEL_91;
  }
  LODWORD(v25) = 0;
LABEL_27:
  if ([v13 isEqualToString:@"settings"])
  {
    id v28 = [v9 objectForKey:@"Reason"];
    if (!v28)
    {
      a5 = v47;
      if (qword_10027DD68) {
        [[(id)qword_10027DD68 WFLog:@"%s: notifyReason is nil" message:4];
      }
      uint64_t v25 = 3;
      id v27 = v48;
      id v22 = v48;
      goto LABEL_36;
    }
    -[WiFiUserNotificationManager _submitAnalyticsEventForJoinAlertReason:action:visibleDuration:](self, "_submitAnalyticsEventForJoinAlertReason:action:visibleDuration:", [v28 integerValue], 5, v16);
    uint64_t v25 = 3;
    goto LABEL_34;
  }
  if ([v13 isEqualToString:@"disconnect"])
  {
    id v29 = [v9 objectForKey:@"Reason"];
    if (v29)
    {
      -[WiFiUserNotificationManager _submitAnalyticsEventForJoinAlertReason:action:visibleDuration:](self, "_submitAnalyticsEventForJoinAlertReason:action:visibleDuration:", [v29 integerValue], 4, v16);
    }
    else
    {
      if (qword_10027DD68) {
        [[(id)qword_10027DD68 WFLog:message:4, "%s: notifyReason is nil", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]"];
      }
    }
    uint64_t v25 = 2;
LABEL_34:
    id v27 = v48;
    id v22 = v48;
LABEL_35:
    a5 = v47;
LABEL_36:
    uint64_t v26 = v46;
    goto LABEL_37;
  }
  if ([v13 isEqualToString:@"joincolocated"])
  {
    if (![v9 objectForKey:@"ToScanResult"])
    {
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:4, "%s: to scan result not found for notification (%@)", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", v45 message];
      }
      uint64_t v25 = 0;
      id v22 = 0;
      a5 = v47;
      goto LABEL_24;
    }
    a5 = v47;
    if ([v9 objectForKey:@"FromScanResult"])
    {
      uint64_t v25 = 1;
      id v22 = v9;
LABEL_24:
      uint64_t v26 = v46;
LABEL_25:
      id v27 = v48;
      goto LABEL_37;
    }
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:4, "%s: from scan result not found for notification (%@)", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", v45 message];
    }
LABEL_91:
    uint64_t v25 = 0;
    id v22 = 0;
    goto LABEL_24;
  }
  if (([v13 isEqualToString:@"com.apple.UNNotificationSilenceActionIdentifier"] & 1) == 0
    && ![v13 isEqualToString:UNNotificationDismissActionIdentifier])
  {
    unsigned int v35 = [[objc_msgSend(a4, "actionIdentifier") isEqualToString:@"disablelowdata"];
    if (v35) {
      uint64_t v25 = 4;
    }
    else {
      uint64_t v25 = 0;
    }
    id v27 = v10;
    if (v35) {
      id v22 = v10;
    }
    else {
      id v22 = 0;
    }
    goto LABEL_35;
  }
  if (v18)
  {
    id v31 = [v9 objectForKey:@"Recommendation"];
    if (v31)
    {
      id v22 = v31;
      id v32 = [v9 objectForKey:@"Location"];
      a5 = v47;
      if (!v32)
      {
        if (qword_10027DD68) {
          [((id)qword_10027DD68) WFLog:3, @"%s: location is not present", @"-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]"];
        }
      }
      [(WiFiUserNotificationManager *)self _submitAnalyticsEventForRecommendation:v22 action:2 visibleDuration:v32 location:v16];
      uint64_t v25 = 0;
      uint64_t v26 = 1;
      goto LABEL_25;
    }
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:4, "%s: recommendation not found for notification (%@)", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", v45 message];
    }
    uint64_t v25 = 0;
    id v22 = 0;
    uint64_t v26 = 1;
LABEL_106:
    a5 = v47;
    id v27 = v10;
    goto LABEL_37;
  }
  if (v17)
  {
    id v34 = [v9 objectForKey:@"Reason"];
    a5 = v47;
    if (v34)
    {
      uint64_t v26 = 2;
      -[WiFiUserNotificationManager _submitAnalyticsEventForJoinAlertReason:action:visibleDuration:](self, "_submitAnalyticsEventForJoinAlertReason:action:visibleDuration:", [v34 integerValue], 2, v16);
      uint64_t v25 = 0;
    }
    else
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:4, "%s: notifyReason is nil", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]"];
      }
      uint64_t v25 = 0;
      uint64_t v26 = 2;
    }
    id v27 = v10;
    id v22 = v10;
  }
  else
  {
    if (v19)
    {
      if ([v9 objectForKey:@"ToScanResult"])
      {
        a5 = v47;
        if ([v9 objectForKey:@"FromScanResult"])
        {
          uint64_t v25 = 0;
          uint64_t v26 = 5;
          id v22 = v9;
        }
        else
        {
          if (qword_10027DD68) {
            [(id)qword_10027DD68 WFLog:4, "%s: from scan result not found for notification (%@)", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", v45 message];
          }
          uint64_t v25 = 0;
          id v22 = 0;
          uint64_t v26 = 5;
        }
        goto LABEL_25;
      }
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:4, "%s: to scan result not found for notification (%@)", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", v45 message];
      }
      uint64_t v25 = 0;
      id v22 = 0;
      uint64_t v26 = 5;
      goto LABEL_106;
    }
    a5 = v47;
    if (v25) {
      uint64_t v26 = 6;
    }
    else {
      uint64_t v26 = v46;
    }
    id v27 = v10;
    if (v25) {
      id v22 = v10;
    }
    else {
      id v22 = 0;
    }
    uint64_t v25 = 0;
  }
LABEL_37:
  [(WiFiUserNotificationHistory *)[(WiFiUserNotificationManager *)self notificationHistory] handleNotificationResponseForSSID:v27 type:v26 response:v25];
  if (self->_queue && [(WiFiUserNotificationManager *)self callback])
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10016DFD4;
    block[3] = &unk_1002409B8;
    block[4] = self;
    block[5] = v22;
    int v50 = v26;
    int v51 = v25;
    dispatch_sync(queue, block);
  }
  if (a5) {
    (*((void (**)(id))a5 + 2))(a5);
  }
  [(WiFiUserNotificationManager *)self setVisibleRequest:0];
}

- (int)dispatchNotificationWithRecommendation:(id)a3 currentLocation:(id)a4 force:(BOOL)a5
{
  if (a3)
  {
    BOOL v5 = a5;
    unsigned int v9 = -[WiFiUserNotificationHistory canPresentRecommendationForSSID:currentLocation:](-[WiFiUserNotificationManager notificationHistory](self, "notificationHistory"), "canPresentRecommendationForSSID:currentLocation:", [a3 SSID], a4);
    int v10 = v9;
    if (!v5 && v9)
    {
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: unable to dispatch recommendation for %@, reason: %@", "-[WiFiUserNotificationManager dispatchNotificationWithRecommendation:currentLocation:force:]", [a3 SSID], sub_1000BDEA0(v10) message];
      }
      if (v10 == 2) {
        -[WiFiUserNotificationHistory resetAttemptsForSSID:](-[WiFiUserNotificationManager notificationHistory](self, "notificationHistory"), "resetAttemptsForSSID:", [a3 SSID]);
      }
      return v10;
    }
    if (v5)
    {
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: forcing notification for %@", "-[WiFiUserNotificationManager dispatchNotificationWithRecommendation:currentLocation:force:]", a3 message];
      }
      int v10 = 0;
    }
    if ([(WiFiUserNotificationManager *)self visibleRequest])
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10016E56C;
      v31[3] = &unk_100242FB0;
      v31[4] = self;
      v31[5] = a3;
      v31[6] = a4;
      BOOL v32 = v5;
      [(UNUserNotificationCenter *)[(WiFiUserNotificationManager *)self userNotificationCenterWiFi] getDeliveredNotificationsWithCompletionHandler:v31];
      return v10;
    }
    if (objc_msgSend(objc_msgSend(a3, "network"), "source") == (id)2) {
      unsigned __int8 v14 = [(WiFiUserNotificationManager *)self shouldTimeOutRecommendation];
    }
    else {
      unsigned __int8 v14 = 0;
    }
    v15 = [+[NSUUID UUID] UUIDString];
    id v16 = objc_alloc_init((Class)UNMutableNotificationContent);
    if (self->_supportsWAPI) {
      CFStringRef v17 = @"WIFI_RECOMMENDATION_TITLE_CH";
    }
    else {
      CFStringRef v17 = @"WIFI_RECOMMENDATION_TITLE";
    }
    [v16 setTitle:sub_100167C48((uint64_t)v17)];
    if (objc_msgSend(objc_msgSend(a3, "network"), "source") == (id)1) {
      CFStringRef v18 = @"WIFI_RECOMMENDATION_BODY_WALLET";
    }
    else {
      CFStringRef v18 = @"WIFI_RECOMMENDATION_BODY";
    }
    int v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", sub_100167C48((uint64_t)v18), [objc_msgSend(objc_msgSend(a3, "network"), "SSID")]);
    if (!self->_enableTestMode) {
      goto LABEL_32;
    }
    id v20 = [objc_msgSend(a3, "network") source];
    id v21 = [a3 network];
    if (v20 == (id)2)
    {
      id v22 = [[v19 stringByAppendingFormat:@"\nSource: 3Bars\nScore: %lu\nAccessPoints: %lu\nBSSID: %@"], objc_msgSend(objc_msgSend(v21, "popularityScore"), "score"), objc_msgSend(objc_msgSend(objc_msgSend(a3, "network"), "accessPoints"), "count"), objc_msgSend(objc_msgSend(a3, "scannedNetwork"), "BSSID")];
    }
    else
    {
      if ([v21 source] != (id)1)
      {
LABEL_32:
        [v16 setBody:v19];
        [v16 setCategoryIdentifier:@"recommendation"];
        [v16 setShouldSuppressDefaultAction:1];
        v30[0] = 0;
        v30[1] = v30;
        v30[2] = 0x3052000000;
        v30[3] = sub_100022D58;
        v30[4] = sub_100022C40;
        v30[5] = self;
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10016E714;
        v28[3] = &unk_100242FD8;
        unsigned __int8 v29 = v14;
        v28[4] = v15;
        v28[5] = a3;
        v28[6] = a4;
        v28[7] = v30;
        [(UNUserNotificationCenter *)[(WiFiUserNotificationManager *)self userNotificationCenterWiFi] addNotificationRequest:+[UNNotificationRequest requestWithIdentifier:v15 content:v16 trigger:0 destinations:5] withCompletionHandler:v28];
        id v23 = +[NSMutableDictionary dictionary];
        v24 = v23;
        if (a4) {
          [v23 setObject:a4 forKey:@"Location"];
        }
        [v24 setObject:a3 forKey:@"Recommendation"];
        [v24 setObject:[a3 SSID] forKey:@"SSID"];
        [(NSMutableDictionary *)[(WiFiUserNotificationManager *)self notificationMapping] setObject:v24 forKey:v15];
        -[WiFiUserNotificationHistory presentedNotificationForSSID:type:currentLocation:](-[WiFiUserNotificationManager notificationHistory](self, "notificationHistory"), "presentedNotificationForSSID:type:currentLocation:", [a3 SSID], 1, a4);
        [(WiFiUserNotificationManager *)self setLastRecommendationLocation:a4];
        if (v16) {
          CFRelease(v16);
        }
        _Block_object_dispose(v30, 8);
        return v10;
      }
      id v22 = [[v19 stringByAppendingFormat:@"\nSource: Wallet\nIdentifier: %@", [objc_msgSend(objc_msgSend(a3, "network"), "uniqueIdentifier")], v26, v27];
    }
    int v19 = v22;
    goto LABEL_32;
  }
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s: nil recommendation", "-[WiFiUserNotificationManager dispatchNotificationWithRecommendation:currentLocation:force:]");
  }
  return 1;
}

- (void)dispatchNotificationWithRandomMAC:(id)a3
{
  if (a3)
  {
    if ([(WiFiUserNotificationManager *)self visibleRequest])
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10016EC00;
      v14[3] = &unk_100243000;
      v14[4] = self;
      v14[5] = a3;
      [(UNUserNotificationCenter *)[(WiFiUserNotificationManager *)self userNotificationCenterWiFi] getDeliveredNotificationsWithCompletionHandler:v14];
    }
    else
    {
      v6 = [+[NSUUID UUID] UUIDString];
      id v7 = objc_alloc_init((Class)UNMutableNotificationContent);
      if (self->_supportsWAPI) {
        CFStringRef v8 = @"WIFI_RANDOM_MAC_TITLE_CH";
      }
      else {
        CFStringRef v8 = @"WIFI_RANDOM_MAC_TITLE";
      }
      unsigned int v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", sub_100167C48((uint64_t)v8), a3);
      id v10 = sub_100167C48(@"WIFI_RANDOM_MAC_BODY");
      [v7 setTitle:v9];
      [v7 setBody:v10];
      [v7 setCategoryIdentifier:@"randommac"];
      [v7 setShouldSuppressDefaultAction:1];
      v13[0] = 0;
      v13[1] = v13;
      v13[2] = 0x3052000000;
      v13[3] = sub_100022D58;
      v13[4] = sub_100022C40;
      v13[5] = self;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10016ED14;
      v12[3] = &unk_100243028;
      v12[4] = v6;
      v12[5] = v13;
      [(UNUserNotificationCenter *)[(WiFiUserNotificationManager *)self userNotificationCenterWiFi] addNotificationRequest:+[UNNotificationRequest requestWithIdentifier:v6 content:v7 trigger:0 destinations:1] withCompletionHandler:v12];
      double v11 = [(WiFiUserNotificationManager *)self notificationMapping];
      CFStringRef v15 = @"SSID";
      id v16 = a3;
      [(NSMutableDictionary *)v11 setObject:+[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1] forKey:v6];
      [(NSMutableDictionary *)[(WiFiUserNotificationManager *)self recentNotifications] setObject:+[NSDate date] forKey:a3];
      if (v7) {
        CFRelease(v7);
      }
      _Block_object_dispose(v13, 8);
    }
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, @"%s: nil ssid", @"-[WiFiUserNotificationManager dispatchNotificationWithRandomMAC:]"];
    }
  }
}

- (void)dispatchAccessoryJoinAlertForNetwork:(id)a3 unsecured:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 7;
  }
  else {
    uint64_t v4 = 6;
  }
  [(WiFiUserNotificationManager *)self dispatchJoinAlertForNetwork:a3 withProviderName:0 andReason:v4];
}

- (void)dispatchJoinAlertForNetwork:(id)a3 withProviderName:(id)a4 andReason:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  if (a3)
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: ssid='%@' provider='%@'", "-[WiFiUserNotificationManager dispatchJoinAlertForNetwork:withProviderName:andReason:]", a3, a4 message];
    }
    if ([(WiFiUserNotificationManager *)self visibleRequest])
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10016F284;
      v21[3] = &unk_100243078;
      v21[4] = self;
      v21[5] = a3;
      v21[6] = a4;
      int v22 = v5;
      [(UNUserNotificationCenter *)[(WiFiUserNotificationManager *)self userNotificationCenterWiFi] getDeliveredNotificationsWithCompletionHandler:v21];
    }
    else
    {
      id v10 = [+[NSUUID UUID] UUIDString];
      id v11 = objc_alloc_init((Class)UNMutableNotificationContent);
      if ((v5 & 0xFFFFFFFE) == 6)
      {
        if (v5 == 7) {
          CFStringRef v12 = @"WIFI_ACCESSORY_JOIN_ALERT_JOINED_WIFI_NETWORK_TITLE_UNSECURED";
        }
        else {
          CFStringRef v12 = @"WIFI_ACCESSORY_JOIN_ALERT_JOINED_WIFI_NETWORK_TITLE";
        }
        id v13 = (NSString *)sub_100167C48((uint64_t)v12);
        unsigned __int8 v14 = +[NSString stringWithFormat:sub_100167C48(@"WIFI_ACCESSORY_JOIN_ALERT_JOINED_NETWORK_BODY"), a3];
      }
      else
      {
        if (self->_supportsWAPI) {
          CFStringRef v15 = @"WIFI_JOIN_ALERT_JOINED_WIFI_NETWORK_TITLE_CH";
        }
        else {
          CFStringRef v15 = @"WIFI_JOIN_ALERT_JOINED_WIFI_NETWORK_TITLE";
        }
        id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", sub_100167C48((uint64_t)v15), a3);
        if (a4)
        {
          if (self->_supportsWAPI) {
            CFStringRef v16 = @"WIFI_JOIN_ALERT_JOINED_PROVIDED_NETWORK_BODY_CH";
          }
          else {
            CFStringRef v16 = @"WIFI_JOIN_ALERT_JOINED_PROVIDED_NETWORK_BODY";
          }
          unsigned __int8 v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", sub_100167C48((uint64_t)v16), a4);
        }
        else
        {
          unsigned __int8 v14 = (NSString *)sub_100167C48(@"WIFI_JOIN_ALERT_JOINED_NETWORK_BODY");
        }
      }
      CFStringRef v17 = v14;
      if (v5 == 6) {
        [v11 setShouldIgnoreDoNotDisturb:1];
      }
      [v11 setTitle:v13];
      [v11 setBody:v17];
      [v11 setShouldSuppressDefaultAction:1];
      [v11 setCategoryIdentifier:@"joinalert"];
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x3052000000;
      v20[3] = sub_100022D58;
      v20[4] = sub_100022C40;
      v20[5] = self;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10016F3B0;
      v19[3] = &unk_100243028;
      v19[4] = v10;
      v19[5] = v20;
      [(UNUserNotificationCenter *)[(WiFiUserNotificationManager *)self userNotificationCenterWiFi] addNotificationRequest:+[UNNotificationRequest requestWithIdentifier:v10 content:v11 trigger:0 destinations:1] withCompletionHandler:v19];
      CFStringRef v18 = [(WiFiUserNotificationManager *)self notificationMapping];
      v23[0] = @"SSID";
      v23[1] = @"Reason";
      v24[0] = a3;
      v24[1] = +[NSNumber numberWithUnsignedInt:v5];
      [(NSMutableDictionary *)v18 setObject:+[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2] forKey:v10];
      [(NSMutableDictionary *)[(WiFiUserNotificationManager *)self recentNotifications] setObject:+[NSDate date] forKey:a3];
      if (v11) {
        CFRelease(v11);
      }
      _Block_object_dispose(v20, 8);
    }
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, "%s: nil ssid", "-[WiFiUserNotificationManager dispatchJoinAlertForNetwork:withProviderName:andReason:]"];
    }
  }
}

- (void)dispatchLowDataModeAlertForNetwork:(id)a3 withReason:(int)a4
{
  if (a3)
  {
    uint64_t v4 = *(void *)&a4;
    if ([(WiFiUserNotificationManager *)self visibleRequest])
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10016F8C4;
      v17[3] = &unk_1002430A0;
      v17[4] = self;
      v17[5] = a3;
      int v18 = v4;
      [(UNUserNotificationCenter *)[(WiFiUserNotificationManager *)self userNotificationCenterWiFi] getDeliveredNotificationsWithCompletionHandler:v17];
    }
    else
    {
      if ([(NSMutableDictionary *)[(WiFiUserNotificationManager *)self recentNotifications] objectForKey:a3])
      {
        if (qword_10027DD68) {
          [(id)qword_10027DD68 WFLog:3, "%s: showing the notification again for %@", "-[WiFiUserNotificationManager dispatchLowDataModeAlertForNetwork:withReason:]", a3 message];
        }
        [(NSMutableDictionary *)[(WiFiUserNotificationManager *)self recentNotifications] removeObjectForKey:a3];
      }
      unsigned int v9 = [+[NSUUID UUID] UUIDString];
      id v10 = objc_alloc_init((Class)UNMutableNotificationContent);
      id v11 = sub_100167C48(@"WIFI_LOW_DATA_MODE_ALERT_JOINED_NETWORK_TITLE");
      if ([(WiFiUserNotificationManager *)self deviceClass] == 1)
      {
        CFStringRef v12 = @"WIFI_LOW_DATA_MODE_ALERT_JOINED_NETWORK_BODY_IPHONE";
      }
      else if ([(WiFiUserNotificationManager *)self deviceClass] == 3)
      {
        CFStringRef v12 = @"WIFI_LOW_DATA_MODE_ALERT_JOINED_NETWORK_BODY_IPAD";
      }
      else if ([(WiFiUserNotificationManager *)self deviceClass] == 2)
      {
        CFStringRef v12 = @"WIFI_LOW_DATA_MODE_ALERT_JOINED_NETWORK_BODY_IPOD";
      }
      else
      {
        CFStringRef v12 = @"WIFI_LOW_DATA_MODE_ALERT_JOINED_NETWORK_BODY";
      }
      id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", sub_100167C48((uint64_t)v12), a3);
      [v10 setTitle:v11];
      [v10 setBody:v13];
      [v10 setShouldSuppressDefaultAction:1];
      [v10 setCategoryIdentifier:@"lowdatamodealert"];
      v16[0] = 0;
      v16[1] = v16;
      v16[2] = 0x3052000000;
      v16[3] = sub_100022D58;
      v16[4] = sub_100022C40;
      v16[5] = self;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10016F9E4;
      v15[3] = &unk_100243028;
      v15[4] = v9;
      v15[5] = v16;
      [(UNUserNotificationCenter *)[(WiFiUserNotificationManager *)self userNotificationCenterWiFi] addNotificationRequest:+[UNNotificationRequest requestWithIdentifier:v9 content:v10 trigger:0 destinations:1] withCompletionHandler:v15];
      unsigned __int8 v14 = [(WiFiUserNotificationManager *)self notificationMapping];
      v19[0] = @"SSID";
      v19[1] = @"Reason";
      v20[0] = a3;
      v20[1] = +[NSNumber numberWithUnsignedInt:v4];
      [(NSMutableDictionary *)v14 setObject:+[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2] forKey:v9];
      [(NSMutableDictionary *)[(WiFiUserNotificationManager *)self recentNotifications] setObject:+[NSDate date] forKey:a3];
      if (v10) {
        CFRelease(v10);
      }
      _Block_object_dispose(v16, 8);
    }
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, @"%s: nil ssid", @"-[WiFiUserNotificationManager dispatchLowDataModeAlertForNetwork:withReason:]"];
    }
  }
}

- (void)dispatchNotificationWithColocatedScanResult:(id)a3 fromScanResult:(id)a4
{
  if ([a3 networkName])
  {
    if ([a4 networkName])
    {
      if ([(WiFiUserNotificationManager *)self visibleRequest])
      {
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        void v23[2] = sub_100170080;
        v23[3] = &unk_1002430C8;
        v23[4] = self;
        v23[5] = a3;
        v23[6] = a4;
        [(UNUserNotificationCenter *)[(WiFiUserNotificationManager *)self userNotificationCenterWiFi] getDeliveredNotificationsWithCompletionHandler:v23];
        return;
      }
      CFStringRef v8 = [+[NSUUID UUID] UUIDString];
      id v9 = objc_alloc_init((Class)UNMutableNotificationContent);
      if (self->_supportsWAPI) {
        CFStringRef v10 = @"WIFI_COLOCATED_SSID_TITLE_CH";
      }
      else {
        CFStringRef v10 = @"WIFI_COLOCATED_SSID_TITLE";
      }
      if (self->_supportsWAPI) {
        CFStringRef v11 = @"WIFI_COLOCATED_SSID_BODY_CH";
      }
      else {
        CFStringRef v11 = @"WIFI_COLOCATED_SSID_BODY";
      }
      CFStringRef v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", sub_100167C48((uint64_t)v10), [a3 networkName]);
      id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", sub_100167C48((uint64_t)v11), [a3 networkName]);
      if (os_variant_has_internal_content())
      {
        unsigned __int8 v14 = [+[NSUserDefaults standardUserDefaults] objectForKey:@"ColocatedSSIDNotificationTitleOverride"];
        if (v14) {
          CFStringRef v12 = v14;
        }
        CFStringRef v15 = [+[NSUserDefaults standardUserDefaults] objectForKey:@"ColocatedSSIDNotificationBodyOverride"];
        if (v15) {
          id v13 = v15;
        }
      }
      [v9 setTitle:v12];
      [v9 setBody:v13];
      [v9 setShouldSuppressDefaultAction:1];
      [v9 setCategoryIdentifier:@"colocatedssid"];
      CFStringRef v16 = +[UNNotificationRequest requestWithIdentifier:v8 content:v9 trigger:0 destinations:1];
      CFStringRef v17 = [(WiFiUserNotificationManager *)self notificationMapping];
      v24[0] = @"SSID";
      v25[0] = [a3 networkName];
      v24[1] = @"ToScanResult";
      v25[1] = [a3 scanRecord];
      void v24[2] = @"FromScanResult";
      v25[2] = [a4 scanRecord];
      [(NSMutableDictionary *)v17 setObject:+[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3] forKey:v8];
      -[NSMutableDictionary setObject:forKey:](-[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"), "setObject:forKey:", +[NSDate date](NSDate, "date"), [a3 networkName]);
      if (os_variant_has_internal_content()
        && (id v18 = [+[NSUserDefaults standardUserDefaults] objectForKey:@"ColocatedSSIDNotificationTestAction"]) != 0)
      {
        if (qword_10027DD68) {
          [(id)qword_10027DD68 WFLog:3, "%s: Will invoke -[UNUserNotificationCenter didReceiveNotificationResponse:withCompletionHandler:] with test action %@", "-[WiFiUserNotificationManager dispatchNotificationWithColocatedScanResult:fromScanResult:]", v18 message];
        }
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1001701A0;
        v22[3] = &unk_10023EFA8;
        v22[4] = v18;
        [(WiFiUserNotificationManager *)self userNotificationCenter:[(WiFiUserNotificationManager *)self userNotificationCenterWiFi] didReceiveNotificationResponse:+[UNNotificationResponse responseWithNotification:actionIdentifier:](UNNotificationResponse, "responseWithNotification:actionIdentifier:", +[UNNotification notificationWithRequest:date:sourceIdentifier:intentIdentifiers:](UNNotification, "notificationWithRequest:date:sourceIdentifier:intentIdentifiers:", v16, +[NSDate date], &stru_100248240, &__NSArray0__struct), v18) withCompletionHandler:v22];
        if (!v9) {
          return;
        }
      }
      else
      {
        v21[0] = 0;
        v21[1] = v21;
        v21[2] = 0x3052000000;
        v21[3] = sub_100022D58;
        v21[4] = sub_100022C40;
        v21[5] = self;
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        void v20[2] = sub_100170214;
        v20[3] = &unk_100243028;
        v20[4] = v8;
        v20[5] = v21;
        [(UNUserNotificationCenter *)[(WiFiUserNotificationManager *)self userNotificationCenterWiFi] addNotificationRequest:v16 withCompletionHandler:v20];
        _Block_object_dispose(v21, 8);
        if (!v9) {
          return;
        }
      }
      CFRelease(v9);
      return;
    }
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, @"%s: nil fromScanResult.networkName", @"-[WiFiUserNotificationManager dispatchNotificationWithColocatedScanResult:fromScanResult:]"];
    }
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:@"%s: nil toScanResult.networkName" message:4 -[WiFiUserNotificationManager dispatchNotificationWithColocatedScanResult:fromScanResult:];
    }
  }
}

- (int)dispatchNotificationWithAskToJoinHotspotRecommendation:(id)a3
{
  if (a3)
  {
    if ([(WiFiUserNotificationManager *)self visibleRequest])
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100170628;
      v14[3] = &unk_1002430F0;
      v14[4] = self;
      [(UNUserNotificationCenter *)[(WiFiUserNotificationManager *)self userNotificationCenterWiFi] getDeliveredNotificationsWithCompletionHandler:v14];
      return 5;
    }
    else
    {
      unsigned __int8 v7 = [(WiFiUserNotificationManager *)self shouldTimeOutRecommendation];
      CFStringRef v8 = [+[NSUUID UUID] UUIDString];
      id v9 = objc_alloc_init((Class)UNMutableNotificationContent);
      [v9 setTitle:sub_100167C48(@"PERSONAL_HOTSPOT_NEARBY_BANNER_TITLE")];
      [v9 setBody:+[NSString stringWithFormat:](NSString, "stringWithFormat:", sub_100167C48(@"PERSONAL_HOTSPOT_NEARBY_BANNER_BODY"), a3)];
      [v9 setCategoryIdentifier:@"asktojoinpersonalhotspot"];
      [v9 setShouldSuppressDefaultAction:1];
      [v9 setIcon:+[UNNotificationIcon iconNamed:](UNNotificationIcon, "iconNamed:", @"personal-hotspot")];
      v13[0] = 0;
      v13[1] = v13;
      v13[2] = 0x3052000000;
      v13[3] = sub_100022D58;
      v13[4] = sub_100022C40;
      v13[5] = self;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100170730;
      v11[3] = &unk_100243118;
      v11[5] = a3;
      v11[6] = v13;
      unsigned __int8 v12 = v7;
      v11[4] = v8;
      [(UNUserNotificationCenter *)[(WiFiUserNotificationManager *)self userNotificationCenterWiFi] addNotificationRequest:+[UNNotificationRequest requestWithIdentifier:v8 content:v9 trigger:0 destinations:1] withCompletionHandler:v11];
      id v10 = +[NSMutableDictionary dictionary];
      [v10 setObject:a3 forKey:@"SSID"];
      [v10 setObject:&off_100263B50 forKey:@"type"];
      [(NSMutableDictionary *)[(WiFiUserNotificationManager *)self notificationMapping] setObject:v10 forKey:v8];
      [(NSMutableDictionary *)[(WiFiUserNotificationManager *)self recentNotifications] setObject:+[NSDate date] forKey:a3];
      if (v9) {
        CFRelease(v9);
      }
      _Block_object_dispose(v13, 8);
      return 0;
    }
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s: nil SSID", "-[WiFiUserNotificationManager dispatchNotificationWithAskToJoinHotspotRecommendation:]")
    }
    return 1;
  }
}

- (void)registerCallback:(id)a3 withContext:(void *)a4
{
  [(WiFiUserNotificationManager *)self setCallback:_Block_copy(a3)];

  [(WiFiUserNotificationManager *)self setCallbackContext:a4];
}

- (void)dismissJoinAlerts
{
  if ([(WiFiUserNotificationManager *)self visibleRequest])
  {
    [(UNUserNotificationCenter *)[(WiFiUserNotificationManager *)self userNotificationCenterWiFi] removeAllDeliveredNotifications];
    id v3 = [(NSMutableDictionary *)[(WiFiUserNotificationManager *)self notificationMapping] objectForKey:[(WiFiUserNotificationManager *)self visibleRequest]];
    if (v3)
    {
      uint64_t v4 = v3;
      id v5 = [v3 objectForKey:@"type"];
      if (v5)
      {
        unsigned int v6 = [v5 integerValue];
        id v7 = [v4 objectForKey:@"SSID"];
        if (v6 == 6)
        {
          id v8 = v7;
          if (v7)
          {
            if (qword_10027DD68) {
              [(id)qword_10027DD68 WFLog:3, "%s: Dismissing join alert for %@", "-[WiFiUserNotificationManager dismissJoinAlerts]", -[WiFiUserNotificationManager visibleRequest](self, "visibleRequest") message];
            }
            id v10 = [(WiFiUserNotificationManager *)self callback];
            ((void (**)(id, uint64_t, id, uint64_t, void *))v10)[2](v10, 6, v8, 5, [(WiFiUserNotificationManager *)self callbackContext]);
            timeoutTimer = self->_timeoutTimer;
            if (timeoutTimer) {
              dispatch_source_cancel(timeoutTimer);
            }
            [(WiFiUserNotificationManager *)self setVisibleRequest:0];
            unsigned __int8 v12 = [(WiFiUserNotificationManager *)self notificationMapping];
            [(NSMutableDictionary *)v12 removeAllObjects];
          }
        }
      }
    }
  }
}

- (void)enableTestMode:(BOOL)a3
{
  if (self->_enableTestMode != a3)
  {
    BOOL v3 = a3;
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: test mode %d", "-[WiFiUserNotificationManager enableTestMode:]", v3);
    }
    self->_enableTestMode = v3;
  }
}

- (void)_startTimerForNotificationWithUserInfo:(id)a3
{
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: previous timer already in progress, bailing for new userInfo %@", "-[WiFiUserNotificationManager _startTimerForNotificationWithUserInfo:]", a3 message];
    }
  }
  else
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: starting timer for userInfo %@", "-[WiFiUserNotificationManager _startTimerForNotificationWithUserInfo:]", a3 message];
    }
    id v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    self->_timeoutTimer = v7;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100170CA0;
    handler[3] = &unk_10023EC30;
    handler[4] = self;
    handler[5] = a3;
    dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
    id v8 = self->_timeoutTimer;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100170CAC;
    v11[3] = &unk_10023EFA8;
    v11[4] = self;
    dispatch_source_set_cancel_handler(v8, v11);
    id v9 = self->_timeoutTimer;
    dispatch_time_t v10 = dispatch_time(0, 1000000000 * self->_timeoutPeriod);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_activate((dispatch_object_t)self->_timeoutTimer);
  }
}

- (void)_timeoutTimerDidFire:(id)a3
{
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer) {
    dispatch_source_cancel(timeoutTimer);
  }
  id v6 = [a3 objectForKeyedSubscript:@"identifier"];
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s: timeout timer fired for identifier %@ (self.visibleRequest %@)", "-[WiFiUserNotificationManager _timeoutTimerDidFire:]", v6, -[WiFiUserNotificationManager visibleRequest](self, "visibleRequest") message];
  }
  if ([(NSString *)[(WiFiUserNotificationManager *)self visibleRequest] isEqualToString:v6])
  {
    id v8 = [a3 objectForKeyedSubscript:@"ssid"];
    id v9 = [[objc_msgSend(a3, "objectForKeyedSubscript:", @"type") integerValue];
    id v16 = v6;
    [(UNUserNotificationCenter *)[(WiFiUserNotificationManager *)self userNotificationCenterWiFi] removeDeliveredNotificationsWithIdentifiers:+[NSArray arrayWithObjects:&v16 count:1]];
    dispatch_time_t v10 = [(WiFiUserNotificationManager *)self callback];
    v10[2](v10, v9, v8, 5, [(WiFiUserNotificationManager *)self callbackContext]);
    id v11 = [(NSMutableDictionary *)[(WiFiUserNotificationManager *)self notificationMapping] objectForKey:v6];
    [[-[NSMutableDictionary objectForKey:](-[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"), "objectForKey:", v8) timeIntervalSinceNow];
    double v13 = -v12;
    if (v9 == 1)
    {
      id v14 = [a3 objectForKeyedSubscript:@"location"];
      if (!v14)
      {
        if (qword_10027DD68) {
          [((id)qword_10027DD68) WFLog:3 message:@"%s: location is not present" args:("-[WiFiUserNotificationManager _timeoutTimerDidFire:]")];
        }
      }
      -[WiFiUserNotificationManager _submitAnalyticsEventForRecommendation:action:visibleDuration:location:](self, "_submitAnalyticsEventForRecommendation:action:visibleDuration:location:", [v11 objectForKey:@"Recommendation"], 3, v14, v13);
    }
    else if (v9 == 2)
    {
      -[WiFiUserNotificationManager _submitAnalyticsEventForJoinAlertReason:action:visibleDuration:](self, "_submitAnalyticsEventForJoinAlertReason:action:visibleDuration:", [objc_msgSend(objc_msgSend(v11, "objectForKey:", @"Reason"), "integerValue") integerValue], 3, v13);
    }
    [(WiFiUserNotificationHistory *)[(WiFiUserNotificationManager *)self notificationHistory] handleNotificationResponseForSSID:v8 type:v9 response:5];
    [(WiFiUserNotificationManager *)self setVisibleRequest:0];
    [(NSMutableDictionary *)[(WiFiUserNotificationManager *)self notificationMapping] removeAllObjects];
  }
}

- (void)_submitAnalyticsEventForRecommendation:(id)a3 action:(unint64_t)a4 visibleDuration:(double)a5 location:(id)a6
{
  id v10 = [objc_msgSend(a3, "scannedNetwork") BSSID];
  if (objc_msgSend(objc_msgSend(a3, "network"), "popularityScore")) {
    id v11 = [NSNumber numberWithUnsignedInteger:][objc_msgSend(objc_msgSend(objc_msgSend(a3, "network"), "popularityScore"), "score")];
  }
  else {
    id v11 = 0;
  }
  id v12 = [[objc_msgSend(a3, "network") source];
  if (a6)
  {
    [a6 coordinate];
    double v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [a6 coordinate];
    a6 = +[NSNumber numberWithDouble:v14];
  }
  else
  {
    double v13 = 0;
  }
  if (v12 == (id)2) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = 2 * (v12 == (id)1);
  }
  id v16 = +[TBJoinAnalyticsEvent joinRecommendationEventWithSource:action:BSSID:latitude:longitude:score:visibleDuration:](TBJoinAnalyticsEvent, "joinRecommendationEventWithSource:action:BSSID:latitude:longitude:score:visibleDuration:", v15, a4, v10, v13, a6, v11, +[NSNumber numberWithInteger:llround(a5)]);

  +[TBAnalytics captureEvent:v16];
}

- (void)_submitAnalyticsEventForJoinAlertReason:(int)a3 action:(unint64_t)a4 visibleDuration:(double)a5
{
  uint64_t v5 = (a3 - 1);
  if (v5 >= 3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v5 + 3;
  }
  id v7 = +[TBJoinAnalyticsEvent joinAlertEventWithSource:action:visibleDuration:](TBJoinAnalyticsEvent, "joinAlertEventWithSource:action:visibleDuration:", v6, a4, +[NSNumber numberWithInteger:llround(a5)]);

  +[TBAnalytics captureEvent:v7];
}

- (void)reset
{
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: resetting states", "-[WiFiUserNotificationManager reset]");
  }
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s: last recommendation location %@", "-[WiFiUserNotificationManager reset]", -[WiFiUserNotificationManager lastRecommendationLocation](self, "lastRecommendationLocation") message];
  }
  [(WiFiUserNotificationManager *)self setLastRecommendationLocation:0];
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s: recentNotifications %@", "-[WiFiUserNotificationManager reset]", -[WiFiUserNotificationManager recentNotifications](self, "recentNotifications") message];
  }
  [(NSMutableDictionary *)[(WiFiUserNotificationManager *)self recentNotifications] removeAllObjects];
  uint64_t v6 = [(WiFiUserNotificationManager *)self notificationHistory];

  [(WiFiUserNotificationHistory *)v6 reset];
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  self->_id callback = a3;
}

- (void)callbackContext
{
  return self->_callbackContext;
}

- (void)setCallbackContext:(void *)a3
{
  self->_callbackContext = a3;
}

- (NSMutableDictionary)notificationMapping
{
  return self->_notificationMapping;
}

- (void)setNotificationMapping:(id)a3
{
}

- (UNUserNotificationCenter)userNotificationCenterWiFi
{
  return self->_userNotificationCenterWiFi;
}

- (void)setUserNotificationCenterWiFi:(id)a3
{
}

- (NSString)visibleRequest
{
  return self->_visibleRequest;
}

- (void)setVisibleRequest:(id)a3
{
}

- (NSMutableDictionary)recentNotifications
{
  return self->_recentNotifications;
}

- (void)setRecentNotifications:(id)a3
{
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (unint64_t)timeoutPeriod
{
  return self->_timeoutPeriod;
}

- (void)setTimeoutPeriod:(unint64_t)a3
{
  self->_timeoutPeriod = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (BOOL)supportsWAPI
{
  return self->_supportsWAPI;
}

- (void)setSupportsWAPI:(BOOL)a3
{
  self->_supportsWAPI = a3;
}

- (BOOL)shouldTimeOutRecommendation
{
  return self->_shouldTimeOutRecommendation;
}

- (void)setShouldTimeOutRecommendation:(BOOL)a3
{
  self->_shouldTimeOutRecommendation = a3;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(int)a3
{
  self->_deviceClass = a3;
}

- (CLLocation)lastRecommendationLocation
{
  return self->_lastRecommendationLocation;
}

- (void)setLastRecommendationLocation:(id)a3
{
}

- (WiFiUserNotificationHistory)notificationHistory
{
  return self->_notificationHistory;
}

- (void)setNotificationHistory:(id)a3
{
}

- (BOOL)enableTestMode
{
  return self->_enableTestMode;
}

- (void)setEnableTestMode:(BOOL)a3
{
  self->_enableTestMode = a3;
}

@end