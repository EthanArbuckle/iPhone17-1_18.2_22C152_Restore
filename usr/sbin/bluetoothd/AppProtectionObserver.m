@interface AppProtectionObserver
- (APSubjectMonitorSubscription)subscription;
- (AppProtectionObserver)init;
- (BOOL)messagesAppLockState;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)dealloc;
- (void)setMessagesAppLockState:(BOOL)a3;
- (void)setSubscription:(id)a3;
@end

@implementation AppProtectionObserver

- (AppProtectionObserver)init
{
  v8.receiver = self;
  v8.super_class = (Class)AppProtectionObserver;
  v2 = [(AppProtectionObserver *)&v8 init];
  if (v2 && sub_100540448())
  {
    v3 = +[APSubject subjectMonitorRegistry];
    uint64_t v4 = [v3 addMonitor:v2 subjectMask:1];
    subscription = v2->_subscription;
    v2->_subscription = (APSubjectMonitorSubscription *)v4;

    v6 = +[APApplication applicationWithBundleIdentifier:@"com.apple.MobileSMS"];
    -[AppProtectionObserver setMessagesAppLockState:](v2, "setMessagesAppLockState:", [v6 isLocked]);
  }
  return v2;
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v5 = +[APApplication applicationWithBundleIdentifier:@"com.apple.MobileSMS", a4];
  -[AppProtectionObserver setMessagesAppLockState:](self, "setMessagesAppLockState:", [v5 isLocked]);
}

- (void)dealloc
{
  [(APSubjectMonitorSubscription *)self->_subscription invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AppProtectionObserver;
  [(AppProtectionObserver *)&v3 dealloc];
}

- (APSubjectMonitorSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
}

- (BOOL)messagesAppLockState
{
  return self->_messagesAppLockState;
}

- (void)setMessagesAppLockState:(BOOL)a3
{
  self->_messagesAppLockState = a3;
}

- (void).cxx_destruct
{
}

@end