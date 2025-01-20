@interface RMSynchronous
- (RMSynchronous)init;
- (void)complete;
- (void)waitForCompletion;
@end

@implementation RMSynchronous

- (RMSynchronous)init
{
  v6.receiver = self;
  v6.super_class = (Class)RMSynchronous;
  v2 = [(RMSynchronous *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08748]) initWithCondition:1];
    lock = v2->_lock;
    v2->_lock = (NSConditionLock *)v3;
  }
  return v2;
}

- (void)complete
{
  [(NSConditionLock *)self->_lock lock];
  lock = self->_lock;

  [(NSConditionLock *)lock unlockWithCondition:0];
}

- (void)waitForCompletion
{
  [(NSConditionLock *)self->_lock lockWhenCondition:0];
  lock = self->_lock;

  [(NSConditionLock *)lock unlock];
}

- (void).cxx_destruct
{
}

@end