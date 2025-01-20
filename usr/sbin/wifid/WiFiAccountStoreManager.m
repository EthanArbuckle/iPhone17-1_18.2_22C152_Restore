@interface WiFiAccountStoreManager
+ (id)sharedWiFiAccountStoreManager;
- (ACAccountStore)accountStore;
- (BOOL)isManagedAppleID;
- (OS_dispatch_queue)dispatchQueue;
- (WiFiAccountStoreManager)init;
- (void)_accountStoreDidChange:(id)a3;
- (void)_updateIsManagedAppleIDAndNotify:(BOOL)a3;
- (void)callback;
- (void)context;
- (void)dealloc;
- (void)registerCallback:(void *)a3 withContext:(void *)a4;
- (void)setCallback:(void *)a3;
- (void)setContext:(void *)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setIsManagedAppleID:(BOOL)a3;
@end

@implementation WiFiAccountStoreManager

+ (id)sharedWiFiAccountStoreManager
{
  if (qword_10027D690 != -1) {
    dispatch_once(&qword_10027D690, &stru_10023F978);
  }
  return (id)qword_10027D688;
}

- (WiFiAccountStoreManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)WiFiAccountStoreManager;
  v2 = [(WiFiAccountStoreManager *)&v8 init];
  if (!v2)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3 message:@"%s: Failed in super-init" :@"-[WiFiAccountStoreManager init]"];
    }
    goto LABEL_12;
  }
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.wifid.accountstore", v3);
  v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  if (!v4)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: null dispatchQueue", "-[WiFiAccountStoreManager init]")];
    }
    goto LABEL_12;
  }
  v5 = (ACAccountStore *)objc_alloc_init((Class)ACAccountStore);
  v2->_accountStore = v5;
  if (!v5)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: Null _accountStore", @"-[WiFiAccountStoreManager init]"];
    }
LABEL_12:

    return 0;
  }
  [(WiFiAccountStoreManager *)v2 _updateIsManagedAppleIDAndNotify:0];
  [+[NSNotificationCenter defaultCenter] addObserver:v2 selector:"_accountStoreDidChange:" name:ACAccountStoreDidChangeNotification object:0];
  return v2;
}

- (void)dealloc
{
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:ACAccountStoreDidChangeNotification object:0];
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  callback = self->_callback;
  if (callback)
  {
    _Block_release(callback);
    self->_callback = 0;
  }
  if (self->_context) {
    self->_context = 0;
  }
  accountStore = self->_accountStore;
  if (accountStore) {

  }
  v6.receiver = self;
  v6.super_class = (Class)WiFiAccountStoreManager;
  [(WiFiAccountStoreManager *)&v6 dealloc];
}

- (void)registerCallback:(void *)a3 withContext:(void *)a4
{
  [(WiFiAccountStoreManager *)self setCallback:a3];

  [(WiFiAccountStoreManager *)self setContext:a4];
}

- (BOOL)isManagedAppleID
{
  uint64_t v5 = 0;
  objc_super v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007C1A4;
  v4[3] = &unk_10023ECC0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WiFiAccountStoreManager *)self dispatchQueue], v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_updateIsManagedAppleIDAndNotify:(BOOL)a3
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  unsigned __int8 v8 = -86;
  unsigned __int8 v8 = [[-[ACAccountStore aa_primaryAppleAccount](-[WiFiAccountStoreManager accountStore](self, "accountStore")) aa_isManagedAppleID];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007C298;
  block[3] = &unk_10023F9A0;
  block[4] = self;
  block[5] = v7;
  BOOL v6 = a3;
  dispatch_sync((dispatch_queue_t)[(WiFiAccountStoreManager *)self dispatchQueue], block);
  _Block_object_dispose(v7, 8);
}

- (void)_accountStoreDidChange:(id)a3
{
}

- (void)setIsManagedAppleID:(BOOL)a3
{
  self->_isManagedAppleID = a3;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)callback
{
  return self->_callback;
}

- (void)setCallback:(void *)a3
{
  self->_callback = a3;
}

- (void)context
{
  return self->_context;
}

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

@end