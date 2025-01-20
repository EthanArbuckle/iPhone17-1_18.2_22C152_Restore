@interface TUIFeedSuspendLayoutLayerUpdateCondition
- (BOOL)evaluateWithRenderModel:(id)a3;
- (TUIFeedSuspendLayoutLayerUpdateCondition)initWithSectionCount:(int64_t)a3 completion:(id)a4;
- (int64_t)totalSectionCount;
@end

@implementation TUIFeedSuspendLayoutLayerUpdateCondition

- (TUIFeedSuspendLayoutLayerUpdateCondition)initWithSectionCount:(int64_t)a3 completion:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TUIFeedSuspendLayoutLayerUpdateCondition;
  result = [(TUIFeedBaseLayoutCondition *)&v6 initWithCompletion:a4];
  if (result) {
    result->_totalSectionCount = a3;
  }
  return result;
}

- (BOOL)evaluateWithRenderModel:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  char state = (char)self->super._state;
  os_unfair_lock_unlock(&self->super._lock);
  if (state)
  {
    char v10 = 1;
  }
  else
  {
    uint64_t v6 = objc_opt_class();
    v7 = TUIDynamicCast(v6, v4);
    v8 = v7;
    if (v7)
    {
      v9 = [v7 submodels];
      char v10 = [v9 count] == self->_totalSectionCount;
    }
    else
    {
      char v10 = 0;
    }
  }
  return v10;
}

- (int64_t)totalSectionCount
{
  return self->_totalSectionCount;
}

@end