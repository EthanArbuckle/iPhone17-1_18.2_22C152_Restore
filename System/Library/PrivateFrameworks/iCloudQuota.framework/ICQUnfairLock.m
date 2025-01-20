@interface ICQUnfairLock
- (ICQUnfairLock)init;
- (void)synchronized:(id)a3;
@end

@implementation ICQUnfairLock

- (ICQUnfairLock)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICQUnfairLock;
  result = [(ICQUnfairLock *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)synchronized:(id)a3
{
  v5 = (void (**)(void))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(p_lock);
  if (v5) {
    v5[2]();
  }
  os_unfair_lock_unlock(p_lock);
}

@end