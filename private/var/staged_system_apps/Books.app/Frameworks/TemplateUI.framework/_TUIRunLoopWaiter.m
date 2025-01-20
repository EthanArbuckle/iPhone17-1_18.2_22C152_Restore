@interface _TUIRunLoopWaiter
+ (id)sharedInstance;
- (_TUIRunLoopWaiter)init;
- (id)notReadyAssertionWithTimeout:(double)a3 queue:(id)a4;
- (void)_schedule;
- (void)addPreCommitBlock:(id)a3;
@end

@implementation _TUIRunLoopWaiter

+ (id)sharedInstance
{
  if (qword_2DF710 != -1) {
    dispatch_once(&qword_2DF710, &stru_255998);
  }
  v2 = (void *)qword_2DF708;

  return v2;
}

- (_TUIRunLoopWaiter)init
{
  v9.receiver = self;
  v9.super_class = (Class)_TUIRunLoopWaiter;
  v2 = [(_TUIRunLoopWaiter *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    dispatch_group_t v4 = dispatch_group_create();
    group = v3->_group;
    v3->_group = (OS_dispatch_group *)v4;

    uint64_t v6 = objc_opt_new();
    preCommitBlocks = v3->_preCommitBlocks;
    v3->_preCommitBlocks = (NSMutableArray *)v6;
  }
  return v3;
}

- (void)addPreCommitBlock:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  preCommitBlocks = self->_preCommitBlocks;
  id v7 = [v5 copy];

  id v8 = objc_retainBlock(v7);
  [(NSMutableArray *)preCommitBlocks addObject:v8];

  [(_TUIRunLoopWaiter *)self _schedule];

  os_unfair_lock_unlock(p_lock);
}

- (void)_schedule
{
  os_unfair_lock_assert_owner(&self->_lock);
  char v3 = *((unsigned char *)self + 8);
  if ((v3 & 1) == 0)
  {
    if (!self->_notReadyCount)
    {
      if (![(NSMutableArray *)self->_preCommitBlocks count]) {
        return;
      }
      char v3 = *((unsigned char *)self + 8);
    }
    *((unsigned char *)self + 8) = v3 | 1;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_117134;
    v4[3] = &unk_251990;
    v4[4] = self;
    +[CATransaction addCommitHandler:v4 forPhase:1];
  }
}

- (id)notReadyAssertionWithTimeout:(double)a3 queue:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  os_unfair_lock_lock(p_lock);
  ++self->_notReadyCount;
  [(_TUIRunLoopWaiter *)self _schedule];
  os_unfair_lock_unlock(p_lock);
  dispatch_group_enter((dispatch_group_t)self->_group);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1174AC;
  v14[3] = &unk_251990;
  v14[4] = self;
  id v8 = [[_TUIRunLoopAssertion alloc] initWithCompletion:v14];
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_11750C;
  v12[3] = &unk_251990;
  v10 = v8;
  v13 = v10;
  dispatch_after(v9, v7, v12);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preCommitBlocks, 0);

  objc_storeStrong((id *)&self->_group, 0);
}

@end