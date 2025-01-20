@interface FMCoreRoutineController
- (FMCoreRoutineController)initWithFMModel:(id)a3;
- (FMModel)fmModel;
- (RTRoutineManager)routineManager;
- (dispatch_queue_s)queue;
- (int)notificationToken;
- (void)dealloc;
- (void)setFmModel:(id)a3;
- (void)setNotificationToken:(int)a3;
- (void)setQueue:(dispatch_queue_s *)a3;
- (void)setRoutineManager:(id)a3;
@end

@implementation FMCoreRoutineController

- (FMCoreRoutineController)initWithFMModel:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FMCoreRoutineController;
  v5 = [(FMCoreRoutineController *)&v15 init];
  v6 = v5;
  if (!v5)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
      sub_10014869C();
    }
    goto LABEL_9;
  }
  [(FMCoreRoutineController *)v5 setFmModel:v4];
  [(FMCoreRoutineController *)v6 setQueue:dispatch_queue_create("com.apple.wirelessinsightsd.FederatedMobility.CoreRoutineController", 0)];
  if (![(FMCoreRoutineController *)v6 queue])
  {
LABEL_9:
    v9 = 0;
    goto LABEL_14;
  }
  id v7 = objc_alloc_init((Class)RTRoutineManager);
  [(FMCoreRoutineController *)v6 setRoutineManager:v7];

  int out_token = -1;
  objc_initWeak(&location, v6);
  v8 = [(FMCoreRoutineController *)v6 queue];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000B10EC;
  handler[3] = &unk_1001B5D80;
  objc_copyWeak(&v12, &location);
  notify_register_dispatch("RTLocationsOfInterestDidClearNotification", &out_token, v8, handler);
  [(FMCoreRoutineController *)v6 setNotificationToken:out_token];
  if ([(FMCoreRoutineController *)v6 notificationToken] == -1)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
      sub_1001486DC();
    }
    v9 = 0;
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_10014871C();
    }
    v9 = v6;
  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
LABEL_14:

  return v9;
}

- (void)dealloc
{
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_100148784();
  }
  if ([(FMCoreRoutineController *)self notificationToken] != -1)
  {
    notify_cancel([(FMCoreRoutineController *)self notificationToken]);
    [(FMCoreRoutineController *)self setNotificationToken:0xFFFFFFFFLL];
  }
  if ([(FMCoreRoutineController *)self queue]) {
    dispatch_release((dispatch_object_t)[(FMCoreRoutineController *)self queue]);
  }
  v3.receiver = self;
  v3.super_class = (Class)FMCoreRoutineController;
  [(FMCoreRoutineController *)&v3 dealloc];
}

- (RTRoutineManager)routineManager
{
  return (RTRoutineManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRoutineManager:(id)a3
{
}

- (FMModel)fmModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fmModel);

  return (FMModel *)WeakRetained;
}

- (void)setFmModel:(id)a3
{
}

- (int)notificationToken
{
  return self->_notificationToken;
}

- (void)setNotificationToken:(int)a3
{
  self->_notificationToken = a3;
}

- (dispatch_queue_s)queue
{
  return self->_queue;
}

- (void)setQueue:(dispatch_queue_s *)a3
{
  self->_queue = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fmModel);

  objc_storeStrong((id *)&self->_routineManager, 0);
}

@end