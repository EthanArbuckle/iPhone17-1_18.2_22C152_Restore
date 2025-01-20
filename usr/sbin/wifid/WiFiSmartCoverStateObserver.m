@interface WiFiSmartCoverStateObserver
- (WiFiSmartCoverStateObserver)init;
- (void)registerSmartCoverStateCallback;
- (void)smartCoverStateDidChange:(int64_t)a3;
@end

@implementation WiFiSmartCoverStateObserver

- (void)smartCoverStateDidChange:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    CFStringRef v3 = @"Unknown";
  }
  else {
    CFStringRef v3 = off_1002427F0[a3 - 1];
  }
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "smartCoverStateDidChange %@", v3 message];
  }
  id v5 = +[WiFiUsageMonitor sharedInstance];
  [v5 setSmartCoverState:v3];
}

- (WiFiSmartCoverStateObserver)init
{
  v5[0] = 0;
  if (!qword_10027DC10)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = (void *)3221225472;
    v5[3] = sub_10016091C;
    v5[4] = &unk_10023EAF8;
    v5[5] = v5;
    long long v6 = off_1002427D8;
    uint64_t v7 = 0;
    qword_10027DC10 = _sl_dlopen();
  }
  if (!qword_10027DC10) {
    sub_100196E60(v5);
  }
  if (v5[0]) {
    free(v5[0]);
  }
  v4.receiver = self;
  v4.super_class = (Class)WiFiSmartCoverStateObserver;
  return [(WiFiSmartCoverStateObserver *)&v4 init];
}

- (void)registerSmartCoverStateCallback
{
  CFStringRef v3 = +[SBSSmartCoverService sharedInstance];
  objc_super v4 = [v3 registerSmartCoverStateObserver:self];
  observability = self->observability;
  self->observability = v4;

  if (!self->observability)
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3 message:"registerSmartCoverStateObserver failed - Observability is nil"];
    }
  }
}

- (void).cxx_destruct
{
}

@end