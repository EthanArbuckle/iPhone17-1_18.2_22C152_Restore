@interface TCCDAlertManager
- (NSMutableArray)alerts;
- (OS_dispatch_queue)displayQueue;
- (TCCDAlertManager)initWithAlerts:(id)a3;
- (void)displayAlertForCondition:(int64_t)a3 withCustomUserInfo:(id)a4;
- (void)setDisplayQueue:(id)a3;
@end

@implementation TCCDAlertManager

- (TCCDAlertManager)initWithAlerts:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TCCDAlertManager;
  v5 = [(TCCDAlertManager *)&v11 init];
  if (v5)
  {
    v6 = (NSMutableArray *)[v4 copy];
    alerts = v5->_alerts;
    v5->_alerts = v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.tccd.AlertManager", 0);
    displayQueue = v5->_displayQueue;
    v5->_displayQueue = (OS_dispatch_queue *)v8;
  }
  return v5;
}

- (void)displayAlertForCondition:(int64_t)a3 withCustomUserInfo:(id)a4
{
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v7 = [(TCCDAlertManager *)self alerts];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v12 isDisplayableForCondition:a3])
        {
          v13 = [(TCCDAlertManager *)self displayQueue];
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_10005752C;
          v14[3] = &unk_100094FE0;
          v14[4] = v12;
          id v15 = v6;
          dispatch_sync(v13, v14);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (NSMutableArray)alerts
{
  return self->_alerts;
}

- (OS_dispatch_queue)displayQueue
{
  return self->_displayQueue;
}

- (void)setDisplayQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayQueue, 0);
  objc_storeStrong((id *)&self->_alerts, 0);
}

@end