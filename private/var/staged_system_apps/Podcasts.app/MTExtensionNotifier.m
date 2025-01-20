@interface MTExtensionNotifier
- (BOOL)isObserving;
- (MTExtensionNotifier)init;
- (OS_dispatch_queue)workQueue;
- (void)libraryDidChange:(id)a3;
- (void)setObserving:(BOOL)a3;
- (void)setWorkQueue:(id)a3;
- (void)setup;
@end

@implementation MTExtensionNotifier

- (void)setup
{
  v3 = [(MTExtensionNotifier *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100059428;
  block[3] = &unk_10054D570;
  block[4] = self;
  dispatch_async(v3, block);
}

- (MTExtensionNotifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTExtensionNotifier;
  v2 = [(MTExtensionNotifier *)&v6 init];
  if (v2)
  {
    uint64_t v3 = dispatch_get_global_queue(0, 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)libraryDidChange:(id)a3
{
  id v12 = a3;
  if (![v12 hasChanges]) {
    goto LABEL_13;
  }
  uint64_t v3 = kMTPodcastEntityName;
  v4 = [v12 changesForEntityName:kMTPodcastEntityName];
  if (([v4 hasInserts] & 1) == 0)
  {
    v5 = [v12 changesForEntityName:v3];
    if (([v5 hasDeletes] & 1) == 0)
    {
      uint64_t v6 = kMTPlaylistEntityName;
      v7 = [v12 changesForEntityName:kMTPlaylistEntityName];
      if (![v7 hasInserts])
      {
        v10 = [v12 changesForEntityName:v6];
        unsigned __int8 v11 = [v10 hasDeletes];

        if ((v11 & 1) == 0) {
          goto LABEL_13;
        }
        goto LABEL_8;
      }
    }
  }

LABEL_8:
  if ((+[PFClientUtil isRunningOnHomepod] & 1) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, MTExtensionPodcastsDidUpdateNotification, 0, 0, 1u);
  }
  if (!os_feature_enabled_homepod_siri_donation_from_apns()
    || (+[PFClientUtil isRunningOnHomepod] & 1) == 0)
  {
    v9 = +[NSNotificationCenter defaultCenter];
    [v9 postNotificationName:MTExtensionPodcastsDidUpdateNotification object:0];
  }
LABEL_13:
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end