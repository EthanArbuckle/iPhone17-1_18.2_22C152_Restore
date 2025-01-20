@interface FMRegulatoryDomainController
- (FMModel)fmModel;
- (FMRegulatoryDomainController)initWithFMModel:(id)a3;
- (dispatch_queue_s)queue;
- (id)getCurrentEstimates;
- (int)notificationToken;
- (void)dealloc;
- (void)notifyClient;
- (void)setFmModel:(id)a3;
- (void)setNotificationToken:(int)a3;
- (void)setQueue:(dispatch_queue_s *)a3;
@end

@implementation FMRegulatoryDomainController

- (FMRegulatoryDomainController)initWithFMModel:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FMRegulatoryDomainController;
  v5 = [(FMRegulatoryDomainController *)&v15 init];
  v6 = v5;
  if (!v5)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
      sub_100140AFC();
    }
    goto LABEL_9;
  }
  [(FMRegulatoryDomainController *)v5 setFmModel:v4];
  [(FMRegulatoryDomainController *)v6 setQueue:dispatch_queue_create("com.apple.wirelessinsightsd.FederatedMobility.RegulatoryDomainController", 0)];
  if (![(FMRegulatoryDomainController *)v6 queue])
  {
LABEL_9:
    v9 = 0;
    goto LABEL_14;
  }
  int out_token = -1;
  objc_initWeak(&location, v6);
  v7 = (const char *)[kRegulatoryDomainUpdateNotification UTF8String];
  v8 = [(FMRegulatoryDomainController *)v6 queue];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100022098;
  handler[3] = &unk_1001B5D80;
  objc_copyWeak(&v12, &location);
  if (notify_register_dispatch(v7, &out_token, v8, handler))
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
      sub_100140B70();
    }
    v9 = 0;
  }
  else
  {
    [(FMRegulatoryDomainController *)v6 setNotificationToken:out_token];
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_100140B3C();
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
    sub_100140BE4();
  }
  if ([(FMRegulatoryDomainController *)self notificationToken] != -1) {
    notify_cancel([(FMRegulatoryDomainController *)self notificationToken]);
  }
  if ([(FMRegulatoryDomainController *)self queue]) {
    dispatch_release((dispatch_object_t)[(FMRegulatoryDomainController *)self queue]);
  }
  v3.receiver = self;
  v3.super_class = (Class)FMRegulatoryDomainController;
  [(FMRegulatoryDomainController *)&v3 dealloc];
}

- (void)notifyClient
{
  id v4 = [(FMRegulatoryDomainController *)self fmModel];
  objc_super v3 = [(FMRegulatoryDomainController *)self getCurrentEstimates];
  [v4 handleRegulatoryDomainEstimateUpdate:v3];
}

- (id)getCurrentEstimates
{
  v2 = +[RDEstimate currentEstimates];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableArray);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v2;
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v13;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v4);
          }
          v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "countryCode", (void)v12);
          [v3 addObject:v8];
        }
        id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }

    v9 = *(NSObject **)(qword_1001D8080 + 136);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100140C18((uint64_t)v3, v9);
    }
    id v10 = objc_msgSend(v3, "copy", (void)v12);
  }
  else
  {
    id v10 = &__NSArray0__struct;
  }

  return v10;
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
}

@end