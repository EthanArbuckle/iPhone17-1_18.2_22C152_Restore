@interface BlankConversationController
+ (OS_os_log)log;
- (BlankConversationController)init;
- (EMCoreAnalyticsCollector)analyticsCollector;
- (int64_t)numberOfBackgroundWebViewCrashes;
- (int64_t)numberOfFailedAttempts;
- (int64_t)numberOfForegroundWebViewCrashes;
- (int64_t)numberOfLoadAttempts;
- (int64_t)numberOfWebViewLoads;
- (void)conversationViewDidLoadMessageSuccessfully;
- (void)conversationViewIsBlankWithReason:(int64_t)a3;
- (void)conversationViewWebViewCrashedWithReason:(int64_t)a3 isBackgrounded:(BOOL)a4;
- (void)conversationViewWebViewDidLoadMessage;
- (void)reportMetrics;
- (void)setNumberOfBackgroundWebViewCrashes:(int64_t)a3;
- (void)setNumberOfFailedAttempts:(int64_t)a3;
- (void)setNumberOfForegroundWebViewCrashes:(int64_t)a3;
- (void)setNumberOfLoadAttempts:(int64_t)a3;
- (void)setNumberOfWebViewLoads:(int64_t)a3;
@end

@implementation BlankConversationController

- (BlankConversationController)init
{
  v10.receiver = self;
  v10.super_class = (Class)BlankConversationController;
  v2 = [(BlankConversationController *)&v10 init];
  if (v2)
  {
    v3 = (EMCoreAnalyticsCollector *)objc_alloc_init((Class)EMCoreAnalyticsCollector);
    analyticsCollector = v2->_analyticsCollector;
    v2->_analyticsCollector = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    blankConversationViewReasons = v2->_blankConversationViewReasons;
    v2->_blankConversationViewReasons = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    webViewCrashReasons = v2->_webViewCrashReasons;
    v2->_webViewCrashReasons = v7;
  }
  return v2;
}

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005E1F0;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_1006993A8 != -1) {
    dispatch_once(&qword_1006993A8, block);
  }
  v2 = (void *)qword_1006993A0;

  return (OS_os_log *)v2;
}

- (void)conversationViewDidLoadMessageSuccessfully
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(BlankConversationController *)self setNumberOfLoadAttempts:(char *)[(BlankConversationController *)self numberOfLoadAttempts] + 1];

  os_unfair_lock_unlock(p_lock);
}

- (void)conversationViewIsBlankWithReason:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(BlankConversationController *)self setNumberOfLoadAttempts:(char *)[(BlankConversationController *)self numberOfLoadAttempts] + 1];
  [(BlankConversationController *)self setNumberOfFailedAttempts:(char *)[(BlankConversationController *)self numberOfFailedAttempts] + 1];
  if (self) {
    blankConversationViewReasons = self->_blankConversationViewReasons;
  }
  else {
    blankConversationViewReasons = 0;
  }
  v7 = blankConversationViewReasons;
  v8 = +[NSString stringWithFormat:@"Reason_%ld", a3];
  uint64_t v9 = [(NSMutableDictionary *)v7 objectForKeyedSubscript:v8];
  objc_super v10 = (void *)v9;
  v11 = &off_10062A4A0;
  if (v9) {
    v11 = (_UNKNOWN **)v9;
  }
  v12 = v11;

  v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v12 integerValue] + 1);
  [(NSMutableDictionary *)v7 setObject:v13 forKeyedSubscript:v8];

  os_unfair_lock_unlock(p_lock);
}

- (void)conversationViewWebViewDidLoadMessage
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(BlankConversationController *)self setNumberOfWebViewLoads:(char *)[(BlankConversationController *)self numberOfWebViewLoads] + 1];

  os_unfair_lock_unlock(p_lock);
}

- (void)conversationViewWebViewCrashedWithReason:(int64_t)a3 isBackgrounded:(BOOL)a4
{
  BOOL v4 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(BlankConversationController *)self setNumberOfWebViewLoads:(char *)[(BlankConversationController *)self numberOfWebViewLoads] + 1];
  if (v4) {
    [(BlankConversationController *)self setNumberOfBackgroundWebViewCrashes:(char *)[(BlankConversationController *)self numberOfBackgroundWebViewCrashes]+ 1];
  }
  else {
    [(BlankConversationController *)self setNumberOfForegroundWebViewCrashes:(char *)[(BlankConversationController *)self numberOfForegroundWebViewCrashes]+ 1];
  }
  v8 = +[NSString stringWithFormat:@"Reason_%ld", a3];
  if (self) {
    webViewCrashReasons = self->_webViewCrashReasons;
  }
  else {
    webViewCrashReasons = 0;
  }
  objc_super v10 = webViewCrashReasons;
  uint64_t v11 = [(NSMutableDictionary *)v10 objectForKeyedSubscript:v8];
  v12 = (void *)v11;
  v13 = &off_10062A4A0;
  if (v11) {
    v13 = (_UNKNOWN **)v11;
  }
  v14 = v13;

  v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v14 integerValue] + 1);
  [(NSMutableDictionary *)v10 setObject:v15 forKeyedSubscript:v8];

  os_unfair_lock_unlock(p_lock);
}

- (void)reportMetrics
{
  sub_10005E684((os_unfair_lock_s *)self);

  sub_10005E700((os_unfair_lock_s *)self);
}

- (EMCoreAnalyticsCollector)analyticsCollector
{
  return self->_analyticsCollector;
}

- (int64_t)numberOfLoadAttempts
{
  return self->_numberOfLoadAttempts;
}

- (void)setNumberOfLoadAttempts:(int64_t)a3
{
  self->_numberOfLoadAttempts = a3;
}

- (int64_t)numberOfFailedAttempts
{
  return self->_numberOfFailedAttempts;
}

- (void)setNumberOfFailedAttempts:(int64_t)a3
{
  self->_numberOfFailedAttempts = a3;
}

- (int64_t)numberOfWebViewLoads
{
  return self->_numberOfWebViewLoads;
}

- (void)setNumberOfWebViewLoads:(int64_t)a3
{
  self->_numberOfWebViewLoads = a3;
}

- (int64_t)numberOfForegroundWebViewCrashes
{
  return self->_numberOfForegroundWebViewCrashes;
}

- (void)setNumberOfForegroundWebViewCrashes:(int64_t)a3
{
  self->_numberOfForegroundWebViewCrashes = a3;
}

- (int64_t)numberOfBackgroundWebViewCrashes
{
  return self->_numberOfBackgroundWebViewCrashes;
}

- (void)setNumberOfBackgroundWebViewCrashes:(int64_t)a3
{
  self->_numberOfBackgroundWebViewCrashes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webViewCrashReasons, 0);
  objc_storeStrong((id *)&self->_blankConversationViewReasons, 0);

  objc_storeStrong((id *)&self->_analyticsCollector, 0);
}

@end