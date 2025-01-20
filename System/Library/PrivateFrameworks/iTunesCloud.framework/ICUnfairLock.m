@interface ICUnfairLock
- (ICUnfairLock)init;
- (ICUnfairLock)lockWithBlock:(id)a3;
- (void)lock;
- (void)unlock;
@end

@implementation ICUnfairLock

- (ICUnfairLock)lockWithBlock:(id)a3
{
  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
  return result;
}

- (void)unlock
{
}

- (void)lock
{
}

- (ICUnfairLock)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICUnfairLock;
  result = [(ICUnfairLock *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

@end