@interface MSDAVFlashlight
+ (BOOL)hasFlashlight;
+ (id)sharedInstance;
- (AVFlashlight)flashlight;
- (BOOL)_setFlashlightLevel:(float)a3;
- (BOOL)_turnPowerOn;
- (BOOL)available;
- (BOOL)flash:(unsigned int)a3;
- (BOOL)flashDone;
- (MSDAVFlashlight)init;
- (OS_dispatch_queue)flashQueue;
- (void)_setFlashTimer:(unsigned int)a3;
- (void)_startFlash;
- (void)_stopFlash:(id)a3;
- (void)_turnPowerOff;
- (void)setFlashDone:(BOOL)a3;
- (void)setFlashQueue:(id)a3;
- (void)setFlashlight:(id)a3;
@end

@implementation MSDAVFlashlight

+ (id)sharedInstance
{
  if (qword_1001899E0 != -1) {
    dispatch_once(&qword_1001899E0, &stru_100152980);
  }
  v2 = (void *)qword_1001899E8;

  return v2;
}

- (MSDAVFlashlight)init
{
  v8.receiver = self;
  v8.super_class = (Class)MSDAVFlashlight;
  v2 = [(MSDAVFlashlight *)&v8 init];
  if (v2)
  {
    v3 = (AVFlashlight *)objc_alloc_init((Class)AVFlashlight);
    flashlight = v2->_flashlight;
    v2->_flashlight = v3;

    dispatch_queue_t v5 = dispatch_queue_create("MSD_DEVICE_FLASH_QUEUE", 0);
    flashQueue = v2->_flashQueue;
    v2->_flashQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (BOOL)hasFlashlight
{
  return +[AVFlashlight hasFlashlight];
}

- (BOOL)available
{
  return [(AVFlashlight *)self->_flashlight isAvailable];
}

- (BOOL)flash:(unsigned int)a3
{
  if (+[AVFlashlight hasFlashlight]
    && [(MSDAVFlashlight *)self available])
  {
    if (!a3) {
      a3 = 20;
    }
    dispatch_queue_t v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000CD2A8(a3, v5);
    }

    objc_initWeak(&location, self);
    flashQueue = self->_flashQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100043AC4;
    block[3] = &unk_1001529A8;
    objc_copyWeak(&v10, &location);
    unsigned int v11 = a3;
    dispatch_async(flashQueue, block);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    return 1;
  }
  else
  {
    objc_super v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000CD334(v8);
    }

    return 0;
  }
}

- (void)_setFlashTimer:(unsigned int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100043BAC;
  v3[3] = &unk_1001529D0;
  unsigned int v4 = a3;
  v3[4] = self;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)_startFlash
{
  v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000CD43C(v3);
  }

  self->_flashDone = 0;
  if ([(MSDAVFlashlight *)self _turnPowerOn])
  {
    while (!self->_flashDone)
    {
      LODWORD(v4) = 1.0;
      if (![(MSDAVFlashlight *)self _setFlashlightLevel:v4]
        || (sleep(1u), ![(MSDAVFlashlight *)self _setFlashlightLevel:0.0]))
      {
        [(MSDAVFlashlight *)self _stopFlash:0];
        return;
      }
      sleep(1u);
    }
    dispatch_queue_t v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000CD3B8(v5);
    }
  }
}

- (BOOL)_setFlashlightLevel:(float)a3
{
  flashlight = self->_flashlight;
  id v8 = 0;
  unsigned __int8 v4 = -[AVFlashlight setFlashlightLevel:withError:](flashlight, "setFlashlightLevel:withError:", &v8);
  id v5 = v8;
  if ((v4 & 1) == 0)
  {
    v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000CD4C0(v5);
    }
  }
  return v4;
}

- (BOOL)_turnPowerOn
{
  flashlight = self->_flashlight;
  id v7 = 0;
  unsigned __int8 v3 = [(AVFlashlight *)flashlight turnPowerOnWithError:&v7];
  id v4 = v7;
  if ((v3 & 1) == 0)
  {
    v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000CD560(v4);
    }
  }
  return v3;
}

- (void)_turnPowerOff
{
  [(MSDAVFlashlight *)self _setFlashlightLevel:0.0];
  flashlight = self->_flashlight;

  [(AVFlashlight *)flashlight turnPowerOff];
}

- (void)_stopFlash:(id)a3
{
  if (!self->_flashDone)
  {
    self->_flashDone = 1;
    [(MSDAVFlashlight *)self _turnPowerOff];
  }
}

- (BOOL)flashDone
{
  return self->_flashDone;
}

- (void)setFlashDone:(BOOL)a3
{
  self->_flashDone = a3;
}

- (OS_dispatch_queue)flashQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFlashQueue:(id)a3
{
}

- (AVFlashlight)flashlight
{
  return self->_flashlight;
}

- (void)setFlashlight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flashlight, 0);

  objc_storeStrong((id *)&self->_flashQueue, 0);
}

@end