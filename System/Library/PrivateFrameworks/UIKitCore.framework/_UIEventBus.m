@interface _UIEventBus
+ (id)instance;
- (_UIEventBus)init;
- (uint64_t)addEvents:(uint64_t)result;
- (uint64_t)drainEvents:(uint64_t)result;
- (void)inputForEvent:(void *)a1;
@end

@implementation _UIEventBus

- (uint64_t)addEvents:(uint64_t)result
{
  if (result)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __25___UIEventBus_addEvents___block_invoke;
    v2[3] = &unk_1E52D9F98;
    v2[4] = a2;
    v2[5] = result;
    return _UIUpdateInputGroupBatchChanges((uint64_t)&mainGroup, (uint64_t)v2);
  }
  return result;
}

+ (id)instance
{
  self;
  if (qword_1EB262EF8 != -1) {
    dispatch_once(&qword_1EB262EF8, &__block_literal_global_488);
  }
  v0 = (void *)qword_1EB262F00;
  return v0;
}

- (uint64_t)drainEvents:(uint64_t)result
{
  if (result)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __27___UIEventBus_drainEvents___block_invoke;
    v2[3] = &unk_1E52D9F98;
    v2[4] = result;
    v2[5] = a2;
    return _UIUpdateInputGroupBatchChanges((uint64_t)&mainGroup, (uint64_t)v2);
  }
  return result;
}

- (void)inputForEvent:(void *)a1
{
  if (a1)
  {
    v4 = a1;
    if (IOHIDEventGetType() == 11)
    {
      v5 = _UIEventHIDGetChildStylusEvent(a2);
      uint64_t v6 = 1;
      if (v5) {
        uint64_t v6 = 2;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    v7 = (void *)v4[v6 + 2];
    if (!v7) {
      v7 = (void *)v4[2];
    }
    a1 = v7;
    uint64_t v2 = vars8;
  }
  return a1;
}

- (_UIEventBus)init
{
  v9.receiver = self;
  v9.super_class = (Class)_UIEventBus;
  v3 = [(_UIEventBus *)&v9 self];

  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    events = v3->_events;
    v3->_events = (NSMutableArray *)v4;

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __19___UIEventBus_init__block_invoke;
    v7[3] = &unk_1E52D9F70;
    v8 = v3;
    _UIUpdateInputGroupBatchChanges((uint64_t)&mainGroup, (uint64_t)v7);
  }
  return v3;
}

- (void).cxx_destruct
{
  for (uint64_t i = 32; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end