@interface TUIFeedSuspendLayoutUpdateCondition
- (BOOL)evaluateWithRenderModel:(id)a3;
@end

@implementation TUIFeedSuspendLayoutUpdateCondition

- (BOOL)evaluateWithRenderModel:(id)a3
{
  v3 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v3) = *(unsigned char *)&v3->super._state & 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v3;
}

@end