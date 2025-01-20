@interface SESDebugServer
- (SESDebugServer)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)onEvent:(id)a3 eventPayload:(id)a4;
@end

@implementation SESDebugServer

- (SESDebugServer)init
{
  v11.receiver = self;
  v11.super_class = (Class)SESDebugServer;
  v2 = [(SESDebugServer *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_started = 0;
    v2->_isLPEMEnabled = 4279897;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.seserviced.sesdebugserver", v5);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    v8 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.seserviced"];
    userDefaults = v3->_userDefaults;
    v3->_userDefaults = v8;

    v3->_haveAppletInstalled = [(NSUserDefaults *)v3->_userDefaults BOOLForKey:@"debug.have.logging.applet"];
    v3->_haveProfileInstalled = [(NSUserDefaults *)v3->_userDefaults BOOLForKey:@"debug.have.logging.profile"];
  }
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063D88;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)onEvent:(id)a3 eventPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064998;
  block[3] = &unk_10040D2C0;
  id v12 = v6;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end