@interface NMBUINotificationObserver
- (NMBUINotificationObserver)initWithNotificationName:(id)a3 queue:(id)a4 block:(id)a5;
- (void)dealloc;
@end

@implementation NMBUINotificationObserver

- (NMBUINotificationObserver)initWithNotificationName:(id)a3 queue:(id)a4 block:(id)a5
{
  id v8 = a3;
  v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NMBUINotificationObserver;
  v11 = [(NMBUINotificationObserver *)&v19 init];
  v12 = (int *)v11;
  if (!v11) {
    goto LABEL_4;
  }
  v11->_notificationToken = -1;
  v13 = (const char *)[v8 UTF8String];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __66__NMBUINotificationObserver_initWithNotificationName_queue_block___block_invoke;
  handler[3] = &unk_264DA3B98;
  id v18 = v10;
  uint32_t v14 = notify_register_dispatch(v13, v12 + 2, v9, handler);

  if (v14) {
    v15 = 0;
  }
  else {
LABEL_4:
  }
    v15 = v12;

  return v15;
}

uint64_t __66__NMBUINotificationObserver_initWithNotificationName_queue_block___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)dealloc
{
  notify_cancel(self->_notificationToken);
  v3.receiver = self;
  v3.super_class = (Class)NMBUINotificationObserver;
  [(NMBUINotificationObserver *)&v3 dealloc];
}

@end