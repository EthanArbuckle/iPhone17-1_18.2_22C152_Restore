@interface NFUnfairLock
- (NFUnfairLock)init;
- (NFUnfairLock)initWithOptions:(int64_t)a3;
- (void)assertLocked;
- (void)assertNotLocked;
- (void)lock;
- (void)performWithLockSync:(id)a3;
- (void)unlock;
@end

@implementation NFUnfairLock

- (void)assertLocked
{
}

- (NFUnfairLock)init
{
  return [(NFUnfairLock *)self initWithOptions:0];
}

- (NFUnfairLock)initWithOptions:(int64_t)a3
{
  char v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NFUnfairLock;
  result = [(NFUnfairLock *)&v5 init];
  if (result)
  {
    result->_unfairLock._os_unfair_lock_opaque = 0;
    if (v3) {
      result->_unfairLockOptions |= 0x10000u;
    }
  }
  return result;
}

- (void)unlock
{
}

- (void)performWithLockSync:(id)a3
{
  v4 = (void (**)(void))a3;
  [(NFUnfairLock *)self lock];
  v4[2](v4);

  [(NFUnfairLock *)self unlock];
}

- (void)lock
{
}

- (void)assertNotLocked
{
}

@end