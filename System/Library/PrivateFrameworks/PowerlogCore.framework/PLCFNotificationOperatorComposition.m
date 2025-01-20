@interface PLCFNotificationOperatorComposition
- (BOOL)isStateRequired;
- (BOOL)listenForNotifications:(BOOL)a3;
- (BOOL)listeningForNotifications;
- (NSString)notificationName;
- (OS_dispatch_queue)workQueue;
- (PLCFNotificationOperatorComposition)initWithOperator:(id)a3 forNotification:(id)a4 requireState:(BOOL)a5 withBlock:(id)a6;
- (PLCFNotificationOperatorComposition)initWithWorkQueue:(id)a3 forNotification:(id)a4 requireState:(BOOL)a5 withBlock:(id)a6;
- (PLOperator)operator;
- (id)operatorBlock;
- (int)stateToken;
- (void)dealloc;
- (void)setIsStateRequired:(BOOL)a3;
- (void)setListeningForNotifications:(BOOL)a3;
- (void)setNotificationName:(id)a3;
- (void)setOperator:(id)a3;
- (void)setOperatorBlock:(id)a3;
- (void)setStateToken:(int)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation PLCFNotificationOperatorComposition

- (id)operatorBlock
{
  return self->_operatorBlock;
}

- (int)stateToken
{
  return self->_stateToken;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isStateRequired
{
  return self->_isStateRequired;
}

- (NSString)notificationName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (PLCFNotificationOperatorComposition)initWithWorkQueue:(id)a3 forNotification:(id)a4 requireState:(BOOL)a5 withBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PLCFNotificationOperatorComposition;
  v14 = [(PLCFNotificationOperatorComposition *)&v20 init];
  v15 = v14;
  if (!v14) {
    goto LABEL_3;
  }
  objc_storeStrong((id *)&v14->_workQueue, a3);
  uint64_t v16 = MEMORY[0x1C1869370](v13);
  id operatorBlock = v15->_operatorBlock;
  v15->_id operatorBlock = (id)v16;

  objc_storeStrong((id *)&v15->_notificationName, a4);
  v15->_isStateRequired = a5;
  v15->_stateToken = 0;
  if (![(PLCFNotificationOperatorComposition *)v15 listenForNotifications:1])
  {
    [(PLCFNotificationOperatorComposition *)v15 listenForNotifications:0];
    v18 = 0;
  }
  else
  {
LABEL_3:
    v18 = v15;
  }

  return v18;
}

- (PLCFNotificationOperatorComposition)initWithOperator:(id)a3 forNotification:(id)a4 requireState:(BOOL)a5 withBlock:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  id v13 = [v10 workQueue];
  v14 = [(PLCFNotificationOperatorComposition *)self initWithWorkQueue:v13 forNotification:v12 requireState:v7 withBlock:v11];

  if (v14) {
    objc_storeWeak((id *)&v14->_operator, v10);
  }

  return v14;
}

- (BOOL)listenForNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PLCFNotificationOperatorComposition *)self listeningForNotifications] != a3)
  {
    [(PLCFNotificationOperatorComposition *)self setListeningForNotifications:v3];
    if (v3)
    {
      if ([(PLCFNotificationOperatorComposition *)self isStateRequired])
      {
        id v5 = [(PLCFNotificationOperatorComposition *)self notificationName];
        v6 = (const char *)[v5 UTF8String];

        if (notify_register_check(v6, &self->_stateToken))
        {
          [(PLCFNotificationOperatorComposition *)self setListeningForNotifications:0];
          return 0;
        }
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)notificationCallback, (CFStringRef)[(PLCFNotificationOperatorComposition *)self notificationName], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    else
    {
      v8 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveObserver(v8, self, (CFNotificationName)[(PLCFNotificationOperatorComposition *)self notificationName], 0);
    }
  }
  return 1;
}

- (void)dealloc
{
  [(PLCFNotificationOperatorComposition *)self listenForNotifications:0];
  v3.receiver = self;
  v3.super_class = (Class)PLCFNotificationOperatorComposition;
  [(PLCFNotificationOperatorComposition *)&v3 dealloc];
}

- (void)setNotificationName:(id)a3
{
}

- (void)setOperatorBlock:(id)a3
{
}

- (BOOL)listeningForNotifications
{
  return self->_listeningForNotifications;
}

- (void)setListeningForNotifications:(BOOL)a3
{
  self->_listeningForNotifications = a3;
}

- (void)setStateToken:(int)a3
{
  self->_stateToken = a3;
}

- (PLOperator)operator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operator);
  return (PLOperator *)WeakRetained;
}

- (void)setOperator:(id)a3
{
}

- (void)setWorkQueue:(id)a3
{
}

- (void)setIsStateRequired:(BOOL)a3
{
  self->_isStateRequired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_operator);
  objc_storeStrong(&self->_operatorBlock, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end