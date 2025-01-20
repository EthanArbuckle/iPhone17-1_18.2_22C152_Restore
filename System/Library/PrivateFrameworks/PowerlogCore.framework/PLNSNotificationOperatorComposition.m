@interface PLNSNotificationOperatorComposition
- (NSArray)notificationNames;
- (NSString)notificationName;
- (OS_dispatch_queue)workQueue;
- (PLNSNotificationOperatorComposition)initWithOperator:(id)a3 forNotification:(id)a4 withBlock:(id)a5;
- (PLNSNotificationOperatorComposition)initWithOperator:(id)a3 forNotifications:(id)a4 withBlock:(id)a5;
- (PLNSNotificationOperatorComposition)initWithWorkQueue:(id)a3 forNotification:(id)a4 withBlock:(id)a5;
- (PLNSNotificationOperatorComposition)initWithWorkQueue:(id)a3 forNotifications:(id)a4 withBlock:(id)a5;
- (PLOperator)operator;
- (id)operatorBlock;
- (void)dealloc;
- (void)listenForNotifications:(BOOL)a3;
- (void)notification:(id)a3;
- (void)setOperator:(id)a3;
- (void)setOperatorBlock:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation PLNSNotificationOperatorComposition

void __52__PLNSNotificationOperatorComposition_notification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) operatorBlock];
  (*((void (**)(id, void, void, void))v2 + 2))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (id)operatorBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)notification:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = (void *)[v5 copy];

  v7 = [v4 name];
  v8 = (void *)[v7 copy];

  v9 = [v4 object];

  workQueue = self->_workQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__PLNSNotificationOperatorComposition_notification___block_invoke;
  v14[3] = &unk_1E6255D30;
  v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v6;
  dispatch_async(workQueue, v14);
}

- (PLNSNotificationOperatorComposition)initWithOperator:(id)a3 forNotification:(id)a4 withBlock:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 arrayWithObjects:&v15 count:1];

  id v13 = -[PLNSNotificationOperatorComposition initWithOperator:forNotifications:withBlock:](self, "initWithOperator:forNotifications:withBlock:", v11, v12, v9, v15, v16);
  return v13;
}

- (PLNSNotificationOperatorComposition)initWithOperator:(id)a3 forNotifications:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 workQueue];
  id v12 = [(PLNSNotificationOperatorComposition *)self initWithWorkQueue:v11 forNotifications:v10 withBlock:v9];

  if (v12) {
    objc_storeWeak((id *)&v12->_operator, v8);
  }

  return v12;
}

- (PLNSNotificationOperatorComposition)initWithWorkQueue:(id)a3 forNotification:(id)a4 withBlock:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)PLNSNotificationOperatorComposition;
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PLNSNotificationOperatorComposition *)&v14 init];
  v15[0] = v8;
  id v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 1, v14.receiver, v14.super_class);

  id v12 = [(PLNSNotificationOperatorComposition *)v10 initWithWorkQueue:v9 forNotifications:v11 withBlock:v7];
  return v12;
}

- (PLNSNotificationOperatorComposition)initWithWorkQueue:(id)a3 forNotifications:(id)a4 withBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  if (self)
  {
    self->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&self->_workQueue, a3);
    id v11 = a5;
    id v12 = (void *)MEMORY[0x1C1869370]();

    id operatorBlock = self->_operatorBlock;
    self->_id operatorBlock = v12;

    objc_storeStrong((id *)&self->_notificationNames, a4);
    objc_super v14 = [MEMORY[0x1E4F1CA48] array];
    notificationObservers = self->_notificationObservers;
    self->_notificationObservers = v14;

    [(PLNSNotificationOperatorComposition *)self listenForNotifications:1];
  }

  return self;
}

- (NSString)notificationName
{
  v3 = [(PLNSNotificationOperatorComposition *)self notificationNames];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(PLNSNotificationOperatorComposition *)self notificationNames];
    v6 = [v5 objectAtIndexedSubscript:0];
  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)listenForNotifications:(BOOL)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v4 = [(PLNSNotificationOperatorComposition *)self notificationNames];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v27 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
          uint64_t v11 = [v10 _addObserver:self selector:sel_notification_ name:v9 object:0 options:1024];

          os_unfair_lock_lock(&self->_lock);
          notificationObservers = self->_notificationObservers;
          id v13 = [NSNumber numberWithUnsignedLongLong:v11];
          [(NSMutableArray *)notificationObservers addObject:v13];

          os_unfair_lock_unlock(&self->_lock);
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v6);
    }
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v15 = (void *)[(NSMutableArray *)self->_notificationObservers copy];
    os_unfair_lock_unlock(p_lock);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = v15;
    uint64_t v16 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v4);
          }
          uint64_t v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "unsignedLongLongValue", (void)v22);
          v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v21 _removeObserver:v20];
        }
        uint64_t v17 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v17);
    }
  }
}

- (void)dealloc
{
  [(PLNSNotificationOperatorComposition *)self listenForNotifications:0];
  v3.receiver = self;
  v3.super_class = (Class)PLNSNotificationOperatorComposition;
  [(PLNSNotificationOperatorComposition *)&v3 dealloc];
}

- (NSArray)notificationNames
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOperatorBlock:(id)a3
{
}

- (PLOperator)operator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operator);
  return (PLOperator *)WeakRetained;
}

- (void)setOperator:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_operator);
  objc_storeStrong(&self->_operatorBlock, 0);
  objc_storeStrong((id *)&self->_notificationNames, 0);
  objc_storeStrong((id *)&self->_notificationObservers, 0);
}

@end