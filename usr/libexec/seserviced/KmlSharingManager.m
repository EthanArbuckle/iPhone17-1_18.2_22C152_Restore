@interface KmlSharingManager
- (BOOL)sharingBlockedByApplet;
- (KmlSharingManager)init;
- (void)onAlarm:(id)a3;
- (void)setAppletLockState:(BOOL)a3;
@end

@implementation KmlSharingManager

- (KmlSharingManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)KmlSharingManager;
  v2 = [(KmlSharingManager *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    validShareInitiatorEndpoints = v2->_validShareInitiatorEndpoints;
    v2->_validShareInitiatorEndpoints = (NSMutableArray *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.sesd.kml.sharingManager", v5);
    ksmQueue = v2->_ksmQueue;
    v2->_ksmQueue = (OS_dispatch_queue *)v6;

    *(_WORD *)&v2->_alarmCheckedOnFirstunlock = 0;
  }
  return v2;
}

- (void)setAppletLockState:(BOOL)a3
{
  ksmQueue = self->_ksmQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100329158;
  v4[3] = &unk_10040DCC8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(ksmQueue, v4);
}

- (void)onAlarm:(id)a3
{
  ksmQueue = self->_ksmQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032929C;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(ksmQueue, block);
}

- (BOOL)sharingBlockedByApplet
{
  return self->_sharingBlockedByApplet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ksmQueue, 0);
  objc_storeStrong((id *)&self->_friendRecordsUpdater, 0);

  objc_storeStrong((id *)&self->_validShareInitiatorEndpoints, 0);
}

@end