@interface NCLayoutLoopDetector
- (BOOL)layoutInProgressContainsNotificationRequest:(id)a3;
- (NCLayoutLoopDetector)init;
- (NSMutableArray)notificationLayoutsInProgress;
- (OS_dispatch_queue)queue;
- (id)_savedNotificationLayoutsInProgress;
- (void)_saveNotificationLayoutsInProgress;
- (void)addNotificationRequestToLayoutsInProgress:(id)a3;
- (void)removeNotificationRequestFromLayoutsInProgress:(id)a3;
- (void)setNotificationLayoutsInProgress:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation NCLayoutLoopDetector

- (NCLayoutLoopDetector)init
{
  v12.receiver = self;
  v12.super_class = (Class)NCLayoutLoopDetector;
  v2 = [(NCLayoutLoopDetector *)&v12 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(NCLayoutLoopDetector *)v2 _savedNotificationLayoutsInProgress];
    if (v4) {
      v5 = (void *)v4;
    }
    else {
      v5 = (void *)MEMORY[0x263EFFA68];
    }
    uint64_t v6 = [v5 mutableCopy];
    notificationLayoutsInProgress = v3->_notificationLayoutsInProgress;
    v3->_notificationLayoutsInProgress = (NSMutableArray *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.UserNotificationsKit.NCLayoutLoopDetector", v8);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;
  }
  return v3;
}

- (BOOL)layoutInProgressContainsNotificationRequest:(id)a3
{
  notificationLayoutsInProgress = self->_notificationLayoutsInProgress;
  uint64_t v4 = [a3 notificationIdentifier];
  LOBYTE(notificationLayoutsInProgress) = [(NSMutableArray *)notificationLayoutsInProgress containsObject:v4];

  return (char)notificationLayoutsInProgress;
}

- (void)addNotificationRequestToLayoutsInProgress:(id)a3
{
  id v4 = a3;
  notificationLayoutsInProgress = self->_notificationLayoutsInProgress;
  id v9 = v4;
  uint64_t v6 = [v4 notificationIdentifier];
  LOBYTE(notificationLayoutsInProgress) = [(NSMutableArray *)notificationLayoutsInProgress containsObject:v6];

  if ((notificationLayoutsInProgress & 1) == 0)
  {
    v7 = self->_notificationLayoutsInProgress;
    v8 = [v9 notificationIdentifier];
    [(NSMutableArray *)v7 addObject:v8];

    [(NCLayoutLoopDetector *)self _saveNotificationLayoutsInProgress];
  }
}

- (void)removeNotificationRequestFromLayoutsInProgress:(id)a3
{
  id v4 = a3;
  notificationLayoutsInProgress = self->_notificationLayoutsInProgress;
  id v9 = v4;
  uint64_t v6 = [v4 notificationIdentifier];
  LODWORD(notificationLayoutsInProgress) = [(NSMutableArray *)notificationLayoutsInProgress containsObject:v6];

  if (notificationLayoutsInProgress)
  {
    v7 = self->_notificationLayoutsInProgress;
    v8 = [v9 notificationIdentifier];
    [(NSMutableArray *)v7 removeObject:v8];

    [(NCLayoutLoopDetector *)self _saveNotificationLayoutsInProgress];
  }
}

- (id)_savedNotificationLayoutsInProgress
{
  objc_opt_class();
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 objectForKey:@"NCNotificationLayoutsInProgress"];
  id v4 = UNSafeCast();

  return v4;
}

- (void)_saveNotificationLayoutsInProgress
{
  if ([(NSMutableArray *)self->_notificationLayoutsInProgress count])
  {
    v3 = (void *)[(NSMutableArray *)self->_notificationLayoutsInProgress copy];
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__NCLayoutLoopDetector__saveNotificationLayoutsInProgress__block_invoke;
    block[3] = &unk_264559E38;
    id v8 = v3;
    id v5 = v3;
    dispatch_async(queue, block);
  }
  else
  {
    uint64_t v6 = self->_queue;
    dispatch_async(v6, &__block_literal_global_1);
  }
}

void __58__NCLayoutLoopDetector__saveNotificationLayoutsInProgress__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 setObject:*(void *)(a1 + 32) forKey:@"NCNotificationLayoutsInProgress"];
}

void __58__NCLayoutLoopDetector__saveNotificationLayoutsInProgress__block_invoke_2()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v0 removeObjectForKey:@"NCNotificationLayoutsInProgress"];
}

- (NSMutableArray)notificationLayoutsInProgress
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNotificationLayoutsInProgress:(id)a3
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

  objc_storeStrong((id *)&self->_notificationLayoutsInProgress, 0);
}

@end