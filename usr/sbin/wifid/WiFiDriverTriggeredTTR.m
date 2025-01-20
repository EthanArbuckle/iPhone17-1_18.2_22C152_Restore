@interface WiFiDriverTriggeredTTR
+ (id)sharedWiFiDriverTriggeredTTRManagerwithStringRef:(__CFString *)a3 withInterval:(double)a4;
- (BOOL)WiFiDriverTriggeredTTRForReason:(id)a3;
- (BOOL)WiFiDriverTriggeredTTRHandler:(id)a3;
- (NSMutableDictionary)_lastTriggeredTTR;
- (WiFiDriverTriggeredTTR)initWithWiFiManagerwithStringRef:(__CFString *)a3 withInterval:(double)a4;
- (WiFiSoftError)_softError;
- (id)WiFiDriverTriggeredTTRSoftErrorCreatewithStringRef:(__CFString *)a3 withInterval:(double)a4;
- (void)set_lastTriggeredTTR:(id)a3;
- (void)set_softError:(id)a3;
@end

@implementation WiFiDriverTriggeredTTR

+ (id)sharedWiFiDriverTriggeredTTRManagerwithStringRef:(__CFString *)a3 withInterval:(double)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10015F2B0;
  v5[3] = &unk_10023F048;
  v5[4] = a3;
  *(double *)&v5[5] = a4;
  if (qword_10027DBF8 != -1) {
    dispatch_once(&qword_10027DBF8, v5);
  }
  return (id)qword_10027DBF0;
}

- (WiFiDriverTriggeredTTR)initWithWiFiManagerwithStringRef:(__CFString *)a3 withInterval:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WiFiDriverTriggeredTTR;
  v6 = [(WiFiDriverTriggeredTTR *)&v9 init];
  if (v6)
  {
    [(WiFiDriverTriggeredTTR *)v6 set_lastTriggeredTTR:+[NSMutableDictionary dictionary]];
    if ([(WiFiDriverTriggeredTTR *)v6 _lastTriggeredTTR])
    {
      [(WiFiDriverTriggeredTTR *)v6 set_softError:[(WiFiDriverTriggeredTTR *)v6 WiFiDriverTriggeredTTRSoftErrorCreatewithStringRef:a3 withInterval:a4]];
      if ([(WiFiDriverTriggeredTTR *)v6 _softError]) {
        return v6;
      }
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:3, "%s: Unable to create softError object\n", "-[WiFiDriverTriggeredTTR initWithWiFiManagerwithStringRef:withInterval:]"];
      }
    }
    else
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:3, @"%s: null self._lastTriggeredTTR", @"-[WiFiDriverTriggeredTTR initWithWiFiManagerwithStringRef:withInterval:]"];
      }
    }
    return 0;
  }
  return v6;
}

- (id)WiFiDriverTriggeredTTRSoftErrorCreatewithStringRef:(__CFString *)a3 withInterval:(double)a4
{
  if (!MGGetBoolAnswer()) {
    return 0;
  }
  if (a4 < 0.0) {
    a4 = 86400.0;
  }
  v7[0] = @"maxUIActions";
  v8[0] = +[NSNumber numberWithInteger:5];
  v7[1] = @"intervalForMaxUIActions";
  v8[1] = +[NSNumber numberWithDouble:a4];
  v7[2] = @"maxOccurrences";
  v8[2] = +[NSNumber numberWithInteger:100];
  return [objc_alloc((Class)WiFiSoftError) initWithName:a3 andParams:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 3)];
}

- (BOOL)WiFiDriverTriggeredTTRHandler:(id)a3
{
  id v5 = [a3 objectForKey:@"DRIVER_TTR_Reason"];
  if (!v5
    || (unsigned int v6 = [v5 intValue],
        id v7 = [a3 objectForKey:@"DRIVER_TTR_Reason_String"],
        v6 == -1))
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:3, "%s: Unknown TTR request\n", "-[WiFiDriverTriggeredTTR WiFiDriverTriggeredTTRHandler:]"];
    }
    return 0;
  }
  id v8 = v7;
  if ([(NSMutableDictionary *)[(WiFiDriverTriggeredTTR *)self _lastTriggeredTTR] objectForKey:v7])
  {
    [[-[NSMutableDictionary objectForKey:](-[WiFiDriverTriggeredTTR _lastTriggeredTTR](self, "_lastTriggeredTTR") objectForKey:v8) timeIntervalSinceNow];
    if (v9 >= -86400.0) {
      return 0;
    }
  }

  return [(WiFiDriverTriggeredTTR *)self WiFiDriverTriggeredTTRForReason:v8];
}

- (BOOL)WiFiDriverTriggeredTTRForReason:(id)a3
{
  v3 = &v12;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  if (a3)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10015F854;
    v11[3] = &unk_100242758;
    v11[4] = &v12;
    if ([(WiFiSoftError *)[(WiFiDriverTriggeredTTR *)self _softError] askToLaunchTapToRadarWithMessage:a3 completionHandler:v11])
    {
      [(NSMutableDictionary *)[(WiFiDriverTriggeredTTR *)self _lastTriggeredTTR] setObject:+[NSDate date] forKey:a3];
      id v6 = [a3 stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10015F908;
      v10[3] = &unk_100242758;
      v10[4] = &v12;
      [(WiFiSoftError *)[(WiFiDriverTriggeredTTR *)self _softError] tapToRadarWithURL:+[NSURL URLWithString:](NSURL, "URLWithString:", +[NSString stringWithFormat:@"%@%@%@%@%@%@%@", @"tap-to-radar://new?Title=", v6, @"&AutoDiagnostics=phone&Description=", v6, @"%20Attaching%20coredumps&ComponentID=", @"ComponentID=621547&ComponentName=WiFi%20Connectivity&ComponentVersion=iOS", @"&Classification=Crash/Hang/Data%20Loss&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi"]) completionHandler:v10];
    }
    else
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:3, "%s _WiFiDriverTriggeredTTRHandler User Dismissed TTR", "-[WiFiDriverTriggeredTTR WiFiDriverTriggeredTTRForReason:]"];
      }
    }
    v3 = v13;
  }
  char v8 = *((unsigned char *)v3 + 24);
  _Block_object_dispose(&v12, 8);
  return v8;
}

- (WiFiSoftError)_softError
{
  return (WiFiSoftError *)objc_getProperty(self, a2, 8, 1);
}

- (void)set_softError:(id)a3
{
}

- (NSMutableDictionary)_lastTriggeredTTR
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)set_lastTriggeredTTR:(id)a3
{
}

@end