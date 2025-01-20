@interface CMActivityAlarmLocal
+ (BOOL)activityAlarmAvailable;
+ (id)activityAlarmInfo;
- (BOOL)isValid;
- (CMActivityAlarmLocal)initWithTrigger:(unsigned int)a3 duration:(double)a4 onQueue:(id)a5 forClient:(const void *)a6 withHandler:(id)a7;
- (CMActivityAlarmLocal)initWithTrigger:(unsigned int)a3 duration:(double)a4 onQueue:(id)a5 withHandler:(id)a6;
- (CMActivityAlarmLocal)initWithTrigger:(unsigned int)a3 duration:(double)a4 onRunLoop:(__CFRunLoop *)a5 withHandler:(id)a6;
- (NSString)bundleId;
- (NSString)executable;
- (void)dealloc;
- (void)fire;
- (void)invalidate;
- (void)setBundleId:(id)a3;
- (void)setExecutable:(id)a3;
@end

@implementation CMActivityAlarmLocal

+ (BOOL)activityAlarmAvailable
{
  return sub_10137AE78() != 0;
}

+ (id)activityAlarmInfo
{
  id result = (id)sub_10137AE78();
  if (result)
  {
    id v3 = sub_10137BB88((uint64_t)result);
    return v3;
  }
  return result;
}

- (CMActivityAlarmLocal)initWithTrigger:(unsigned int)a3 duration:(double)a4 onQueue:(id)a5 withHandler:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  v16.receiver = self;
  v16.super_class = (Class)CMActivityAlarmLocal;
  v10 = [(CMActivityAlarmLocal *)&v16 init];
  v11 = v10;
  if (v9 < 0x1C)
  {
    uint64_t v12 = sub_10137AE78();
    v11->fConcentrator = (void *)v12;
    if (!v12) {
      sub_101AB10E4(qword_102419020 == -1);
    }
    if (qword_102419020 != -1) {
      dispatch_once(&qword_102419020, &stru_102321FB0);
    }
    v13 = qword_102419028;
    if (os_log_type_enabled((os_log_t)qword_102419028, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      int v22 = v9;
      __int16 v23 = 2048;
      double v24 = a4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "trigger,%d,duration,%f", buf, 0x12u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419020 != -1) {
        dispatch_once(&qword_102419020, &stru_102321FB0);
      }
      int v17 = 67109376;
      int v18 = v9;
      __int16 v19 = 2048;
      double v20 = a4;
      v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMActivityAlarmLocal initWithTrigger:duration:onQueue:withHandler:]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
    v11->fIsValid = 1;
    v11->fRunLoop = 0;
    dispatch_retain((dispatch_object_t)a5);
    v11->fQueue = (OS_dispatch_queue *)a5;
    v11->fHandler = _Block_copy(a6);
    [(CMActivityAlarmLocal *)v11 setDuration:a4];
    [(CMActivityAlarmLocal *)v11 setTrigger:v9];
    v11->_bundleId = (NSString *)@"<locationd internal>";
    v11->_executable = (NSString *)@"<locationd internal>";
    sub_10137B35C((char *)v11->fConcentrator, v11);
  }
  else
  {

    return 0;
  }
  return v11;
}

- (CMActivityAlarmLocal)initWithTrigger:(unsigned int)a3 duration:(double)a4 onQueue:(id)a5 forClient:(const void *)a6 withHandler:(id)a7
{
  uint64_t v11 = *(void *)&a3;
  v23.receiver = self;
  v23.super_class = (Class)CMActivityAlarmLocal;
  uint64_t v12 = [(CMActivityAlarmLocal *)&v23 init];
  v13 = v12;
  if (v11 < 0x1C)
  {
    uint64_t v14 = sub_10137AE78();
    v13->fConcentrator = (void *)v14;
    if (!v14) {
      sub_101AB1270();
    }
    v13->fIsValid = 1;
    v13->fRunLoop = 0;
    dispatch_retain((dispatch_object_t)a5);
    v13->fQueue = (OS_dispatch_queue *)a5;
    v13->fHandler = _Block_copy(a7);
    [(CMActivityAlarmLocal *)v13 setDuration:a4];
    [(CMActivityAlarmLocal *)v13 setTrigger:v11];
    id v15 = objc_alloc((Class)NSString);
    sub_1000A84C8((uint64_t)a6);
    if (*((char *)a6 + 127) >= 0) {
      objc_super v16 = (char *)a6 + 104;
    }
    else {
      objc_super v16 = (char *)*((void *)a6 + 13);
    }
    v13->_bundleId = (NSString *)[v15 initWithUTF8String:v16];
    id v17 = objc_alloc((Class)NSString);
    double v20 = (char *)*((void *)a6 + 3);
    __int16 v19 = (char *)a6 + 24;
    int v18 = v20;
    if (v19[23] >= 0) {
      v21 = v19;
    }
    else {
      v21 = v18;
    }
    v13->_executable = (NSString *)[v17 initWithUTF8String:v21];
    sub_10137B35C((char *)v13->fConcentrator, v13);
  }
  else
  {

    return 0;
  }
  return v13;
}

- (CMActivityAlarmLocal)initWithTrigger:(unsigned int)a3 duration:(double)a4 onRunLoop:(__CFRunLoop *)a5 withHandler:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)CMActivityAlarmLocal;
  id v10 = [(CMActivityAlarmLocal *)&v13 init];
  uint64_t v11 = sub_10137AE78();
  *((void *)v10 + 1) = v11;
  if (!v11) {
    sub_101AB13F4();
  }
  *((unsigned char *)v10 + 16) = 1;
  *((void *)v10 + 3) = a5;
  *((void *)v10 + 4) = 0;
  *((void *)v10 + 5) = _Block_copy(a6);
  [v10 setDuration:a4];
  [v10 setTrigger:v9];
  *((void *)v10 + 6) = @"<locationd internal>";
  *((void *)v10 + 7) = @"<locationd internal>";
  sub_10137B35C(*((char **)v10 + 1), v10);
  return (CMActivityAlarmLocal *)v10;
}

- (void)dealloc
{
  [(CMActivityAlarmLocal *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CMActivityAlarmLocal;
  [(CMActivityAlarmLocal *)&v3 dealloc];
}

- (void)invalidate
{
  objc_sync_enter(self);
  if (self->fIsValid)
  {
    self->fIsValid = 0;
    _Block_release(self->fHandler);
    self->fHandler = 0;
    fQueue = self->fQueue;
    if (fQueue)
    {
      self->fQueue = 0;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1013810E8;
      block[3] = &unk_10229FED8;
      block[4] = fQueue;
      dispatch_async(fQueue, block);
    }
    self->fRunLoop = 0;
    objc_sync_exit(self);
    sub_10137B768((uint64_t)self->fConcentrator, self);
  }
  else
  {
    objc_sync_exit(self);
  }
}

- (BOOL)isValid
{
  objc_sync_enter(self);
  BOOL fIsValid = self->fIsValid;
  objc_sync_exit(self);
  return fIsValid;
}

- (void)fire
{
  objc_sync_enter(self);
  if (self->fIsValid)
  {
    self->BOOL fIsValid = 0;
    if (self->fRunLoop)
    {
      objc_super v3 = _Block_copy(self->fHandler);
      fRunLoop = self->fRunLoop;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1013812AC;
      block[3] = &unk_1022B30F8;
      block[4] = self;
      void block[5] = v3;
      CFRunLoopPerformBlock(fRunLoop, kCFRunLoopDefaultMode, block);
      CFRunLoopWakeUp(self->fRunLoop);
      self->fRunLoop = 0;
    }
    if (self->fQueue)
    {
      v5 = _Block_copy(self->fHandler);
      fQueue = self->fQueue;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1013812F8;
      v7[3] = &unk_1022B30F8;
      v7[4] = self;
      v7[5] = v5;
      dispatch_async(fQueue, v7);
      dispatch_release((dispatch_object_t)self->fQueue);
      self->fQueue = 0;
    }
    _Block_release(self->fHandler);
    self->fHandler = 0;
  }
  objc_sync_exit(self);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)executable
{
  return self->_executable;
}

- (void)setExecutable:(id)a3
{
}

@end