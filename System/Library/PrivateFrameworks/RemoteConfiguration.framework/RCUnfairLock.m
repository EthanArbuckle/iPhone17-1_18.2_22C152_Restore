@interface RCUnfairLock
- (RCUnfairLock)init;
- (RCUnfairLock)initWithOptions:(int64_t)a3;
- (os_unfair_lock_s)unfairLock;
- (unsigned)unfairLockOptions;
- (void)lock;
- (void)performWithLockSync:(id)a3;
- (void)setUnfairLock:(os_unfair_lock_s)a3;
- (void)setUnfairLockOptions:(unsigned int)a3;
- (void)unlock;
@end

@implementation RCUnfairLock

- (RCUnfairLock)init
{
  return [(RCUnfairLock *)self initWithOptions:0];
}

- (RCUnfairLock)initWithOptions:(int64_t)a3
{
  char v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)RCUnfairLock;
  result = [(RCUnfairLock *)&v5 init];
  if (result)
  {
    result->_unfairLock._os_unfair_lock_opaque = 0;
    if (v3) {
      result->_unfairLockOptions |= 0x10000u;
    }
  }
  return result;
}

- (void)performWithLockSync:(id)a3
{
  v4 = (void (**)(void))a3;
  [(RCUnfairLock *)self lock];
  v4[2](v4);

  [(RCUnfairLock *)self unlock];
}

- (void)lock
{
}

- (void)unlock
{
}

- (os_unfair_lock_s)unfairLock
{
  return self->_unfairLock;
}

- (void)setUnfairLock:(os_unfair_lock_s)a3
{
  self->_unfairLock = a3;
}

- (unsigned)unfairLockOptions
{
  return self->_unfairLockOptions;
}

- (void)setUnfairLockOptions:(unsigned int)a3
{
  self->_unfairLockOptions = a3;
}

@end