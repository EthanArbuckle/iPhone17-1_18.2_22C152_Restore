@interface PDApplicationMessageManager
- (PDApplicationMessageManager)init;
- (void)dealloc;
@end

@implementation PDApplicationMessageManager

- (PDApplicationMessageManager)init
{
  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PDApplicationMessageManager;
  [(PDApplicationMessageManager *)&v2 dealloc];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deferredBlocks, 0);
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_preConnectionQoS, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end