@interface _HKSPUnfairLock
- (_HKSPUnfairLock)init;
- (void)performBlock:(id)a3;
- (void)performBlockAssertingLocked:(id)a3;
@end

@implementation _HKSPUnfairLock

- (void)performBlock:(id)a3
{
  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (_HKSPUnfairLock)init
{
  v6.receiver = self;
  v6.super_class = (Class)_HKSPUnfairLock;
  v2 = [(_HKSPUnfairLock *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)performBlockAssertingLocked:(id)a3
{
  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_assert_owner(p_lock);
  v4[2]();
}

@end