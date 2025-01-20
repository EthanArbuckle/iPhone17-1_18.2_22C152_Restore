@interface _DASCPMModeMonitor
+ (id)sharedMonitor;
- (ContextualPowerModesClient)cpmClient;
- (NSString)currentMode;
- (OS_dispatch_queue)queue;
- (_DASCPMModeMonitor)init;
- (void)queue_handleMode:(id)a3 updatedToState:(BOOL)a4;
- (void)registerForModeChanges;
- (void)setCpmClient:(id)a3;
- (void)setCurrentMode:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation _DASCPMModeMonitor

- (_DASCPMModeMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)_DASCPMModeMonitor;
  v2 = [(_DASCPMModeMonitor *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.dasd.cpmModesMonitorQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    [(_DASCPMModeMonitor *)v2 registerForModeChanges];
  }
  return v2;
}

+ (id)sharedMonitor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012408;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3A60 != -1) {
    dispatch_once(&qword_1001C3A60, block);
  }
  v2 = (void *)qword_1001C3A68;

  return v2;
}

- (void)registerForModeChanges
{
  v3 = (ContextualPowerModesClient *)objc_alloc_init((Class)ContextualPowerModesClient);
  cpmClient = self->_cpmClient;
  self->_cpmClient = v3;

  v5 = self->_cpmClient;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000124E0;
  v7[3] = &unk_100175408;
  v7[4] = self;
  [(ContextualPowerModesClient *)v5 registerWithIdentifier:@"com.apple.dasd" queue:queue callback:v7];
}

- (void)queue_handleMode:(id)a3 updatedToState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = +[_DASDaemonLogger logForCategory:@"cpmModes"];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000F28A4((uint64_t)v6, v4, v7);
  }

  if (v6)
  {
    v8 = [(_DASCPMModeMonitor *)self currentMode];
    v9 = v8;
    if (v4)
    {
      if (v8)
      {
        v10 = [(_DASCPMModeMonitor *)self currentMode];
        unsigned int v11 = [v10 isEqualToString:v6] ^ 1;
      }
      else
      {
        unsigned int v11 = 1;
      }
    }
    else
    {
      unsigned int v11 = [v8 isEqualToString:v6];
    }

    v12 = [(_DASCPMModeMonitor *)self currentMode];
    unsigned int v13 = [v12 isEqual:v6];

    if (!v13 || v4)
    {
      if (!v4) {
        goto LABEL_15;
      }
      v14 = self;
      id v15 = v6;
    }
    else
    {
      v14 = self;
      id v15 = 0;
    }
    [(_DASCPMModeMonitor *)v14 setCurrentMode:v15];
LABEL_15:
    if (v11)
    {
      v16 = +[_DASDaemon sharedInstance];
      CFStringRef v18 = @"com.apple.das.cpm.modeChanged";
      v17 = +[NSArray arrayWithObjects:&v18 count:1];
      [v16 handleTriggersBatched:v17];
    }
  }
}

- (NSString)currentMode
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCurrentMode:(id)a3
{
}

- (ContextualPowerModesClient)cpmClient
{
  return self->_cpmClient;
}

- (void)setCpmClient:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cpmClient, 0);

  objc_storeStrong((id *)&self->_currentMode, 0);
}

@end