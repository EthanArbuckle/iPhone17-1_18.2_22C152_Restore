@interface TUIFeedSuspendLayoutCondition
- (BOOL)evaluateWithEntry:(id)a3 index:(unint64_t)a4;
@end

@implementation TUIFeedSuspendLayoutCondition

- (BOOL)evaluateWithEntry:(id)a3 index:(unint64_t)a4
{
  v4 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v4) = *(unsigned char *)&v4->super._state & 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v4;
}

@end