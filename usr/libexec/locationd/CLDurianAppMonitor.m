@interface CLDurianAppMonitor
- (CLDurianAppMonitor)initWithQueue:(id)a3;
- (id)findMyAppDidBackgroundOrExitHandler;
- (void)dealloc;
- (void)processMonitor:(id)a3 didProvideUpdate:(id)a4 forProcessHandle:(id)a5;
- (void)setFindMyAppDidBackgroundOrExitHandler:(id)a3;
@end

@implementation CLDurianAppMonitor

- (CLDurianAppMonitor)initWithQueue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLDurianAppMonitor;
  v4 = [(CLDurianAppMonitor *)&v7 init];
  if (v4)
  {
    v4->_queue = (OS_dispatch_queue *)a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1015DADD8;
    v6[3] = &unk_102331D28;
    v6[4] = v4;
    v4->_processMonitor = +[RBSProcessMonitor monitorWithConfiguration:v6];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianAppMonitor;
  [(CLDurianAppMonitor *)&v3 dealloc];
}

- (void)processMonitor:(id)a3 didProvideUpdate:(id)a4 forProcessHandle:(id)a5
{
  unsigned int v6 = [a4 state:a3].taskState;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331D48);
  }
  objc_super v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289282;
    v8[1] = 0;
    __int16 v9 = 2082;
    v10 = "";
    __int16 v11 = 2082;
    id v12 = [(id)NSStringFromRBSTaskState() UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #monitor app\", \"update\":%{public, location:escape_only}s}", (uint8_t *)v8, 0x1Cu);
  }
  if ((v6 & 0xFFFFFFFD) == 1)
  {
    if ([(CLDurianAppMonitor *)self findMyAppDidBackgroundOrExitHandler]) {
      (*((void (**)(void))[(CLDurianAppMonitor *)self findMyAppDidBackgroundOrExitHandler]+ 2))();
    }
  }
}

- (id)findMyAppDidBackgroundOrExitHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setFindMyAppDidBackgroundOrExitHandler:(id)a3
{
}

@end