@interface APOdmlUnfairLock
- (APOdmlUnfairLock)initWithOptions:(int64_t)a3;
- (os_unfair_lock_s)unfairLock;
- (unsigned)unfairLockOptions;
- (void)lock;
- (void)setUnfairLock:(os_unfair_lock_s)a3;
- (void)setUnfairLockOptions:(unsigned int)a3;
- (void)unlock;
@end

@implementation APOdmlUnfairLock

- (APOdmlUnfairLock)initWithOptions:(int64_t)a3
{
  char v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)APOdmlUnfairLock;
  result = [(APOdmlUnfairLock *)&v5 init];
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

- (void)lock
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