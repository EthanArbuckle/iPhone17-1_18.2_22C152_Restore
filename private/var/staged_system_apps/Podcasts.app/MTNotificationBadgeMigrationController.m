@interface MTNotificationBadgeMigrationController
+ (BOOL)hasPerformedLegacyBadgeMigration;
+ (id)hasPerformedLegacyBadgeMigrationKey;
+ (id)sharedInstance;
+ (void)commitHasPerformedLegacyBadgeMigration;
- (OS_dispatch_queue)queue;
- (id)_initShared;
- (id)appActivateObserver;
- (int64_t)state;
- (void)dealloc;
- (void)performMigration;
- (void)performMigrationIfNecessary;
- (void)setAppActivateObserver:(id)a3;
- (void)setQueue:(id)a3;
- (void)setState:(int64_t)a3;
- (void)stopObservingApplicationState;
@end

@implementation MTNotificationBadgeMigrationController

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F83BC;
  block[3] = &unk_10054D910;
  block[4] = a1;
  if (qword_10060A840 != -1) {
    dispatch_once(&qword_10060A840, block);
  }
  v2 = (void *)qword_10060A848;

  return v2;
}

- (id)_initShared
{
  v16.receiver = self;
  v16.super_class = (Class)MTNotificationBadgeMigrationController;
  v2 = [(MTNotificationBadgeMigrationController *)&v16 init];
  if (!v2) {
    goto LABEL_6;
  }
  dispatch_queue_t v3 = dispatch_queue_create(0, 0);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v3;

  objc_initWeak(&location, v2);
  unsigned int v5 = [(id)objc_opt_class() hasPerformedLegacyBadgeMigration];
  uint64_t v6 = 2;
  if (!v5) {
    uint64_t v6 = 0;
  }
  v2->_int64_t state = v6;
  v7 = +[NSNotificationCenter defaultCenter];
  v8 = +[NSOperationQueue mainQueue];
  uint64_t v9 = MTApplicationDidBecomeActiveNotification;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000F85C0;
  v13[3] = &unk_10054E628;
  objc_copyWeak(&v14, &location);
  v2->_appActivateObserver = [v7 addObserverForName:v9 object:0 queue:v8 usingBlock:v13];

  int64_t state = v2->_state;
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  if (state == 2) {
    v11 = 0;
  }
  else {
LABEL_6:
  }
    v11 = v2;

  return v11;
}

- (void)dealloc
{
  [(MTNotificationBadgeMigrationController *)self stopObservingApplicationState];
  v3.receiver = self;
  v3.super_class = (Class)MTNotificationBadgeMigrationController;
  [(MTNotificationBadgeMigrationController *)&v3 dealloc];
}

+ (id)hasPerformedLegacyBadgeMigrationKey
{
  return @"com.apple.podcasts.notifications.badgeSettingCleared";
}

+ (BOOL)hasPerformedLegacyBadgeMigration
{
  objc_super v3 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  v4 = [a1 hasPerformedLegacyBadgeMigrationKey];
  unsigned __int8 v5 = [v3 BOOLForKey:v4];

  return v5;
}

+ (void)commitHasPerformedLegacyBadgeMigration
{
  id v4 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  objc_super v3 = [a1 hasPerformedLegacyBadgeMigrationKey];
  [v4 setBool:1 forKey:v3];
}

- (void)performMigrationIfNecessary
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F87FC;
  v4[3] = &unk_10054E2A8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(queue, v4);
  if (*((unsigned char *)v6 + 24)) {
    [(MTNotificationBadgeMigrationController *)self performMigration];
  }
  _Block_object_dispose(&v5, 8);
}

- (void)performMigration
{
  objc_super v3 = +[UNUserNotificationCenter currentNotificationCenter];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F8914;
  v4[3] = &unk_100550320;
  v4[4] = self;
  [v3 getDeliveredNotificationsWithCompletionHandler:v4];
}

- (void)stopObservingApplicationState
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F8B34;
  block[3] = &unk_10054D570;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (id)appActivateObserver
{
  return self->_appActivateObserver;
}

- (void)setAppActivateObserver:(id)a3
{
  self->_appActivateObserver = a3;
}

- (void).cxx_destruct
{
}

@end