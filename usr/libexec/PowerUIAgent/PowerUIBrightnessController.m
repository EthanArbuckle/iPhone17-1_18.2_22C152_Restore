@interface PowerUIBrightnessController
+ (id)sharedInstance;
- (BOOL)mitigationEngaged;
- (BrightnessSystemClient)bClient;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (PowerUIBrightnessController)init;
- (void)engageMitigation;
- (void)resetMitigation;
- (void)setBClient:(id)a3;
- (void)setLog:(id)a3;
- (void)setMitigationEngaged:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)start;
@end

@implementation PowerUIBrightnessController

+ (id)sharedInstance
{
  if (qword_1000082B8 != -1) {
    dispatch_once(&qword_1000082B8, &stru_100004220);
  }
  v2 = (void *)qword_1000082B0;

  return v2;
}

- (PowerUIBrightnessController)init
{
  v9.receiver = self;
  v9.super_class = (Class)PowerUIBrightnessController;
  v2 = [(PowerUIBrightnessController *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.powerui.brightnessController", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    os_log_t v6 = os_log_create("com.apple.powerui", "brightnessController");
    log = v2->_log;
    v2->_log = (OS_os_log *)v6;
  }
  return v2;
}

- (void)start
{
  self->_bClient = (BrightnessSystemClient *)objc_opt_new();

  _objc_release_x1();
}

- (void)resetMitigation
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000022AC;
  block[3] = &unk_100004248;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)engageMitigation
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002388;
  block[3] = &unk_100004248;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (BrightnessSystemClient)bClient
{
  return self->_bClient;
}

- (void)setBClient:(id)a3
{
}

- (BOOL)mitigationEngaged
{
  return self->_mitigationEngaged;
}

- (void)setMitigationEngaged:(BOOL)a3
{
  self->_mitigationEngaged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bClient, 0);
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end