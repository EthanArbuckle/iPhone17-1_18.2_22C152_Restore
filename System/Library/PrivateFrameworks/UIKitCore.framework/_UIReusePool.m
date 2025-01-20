@interface _UIReusePool
+ (void)__applicationDidEnterBackground:(id)a3;
+ (void)__applicationWillEnterForeground:(id)a3;
+ (void)initialize;
- (_UIReusePool)init;
- (_UIReusePool)initWithPolicy:(unint64_t)a3;
- (id)reusableObject;
- (unint64_t)purgePolicy;
- (void)addObject:(id)a3;
- (void)drainPool;
@end

@implementation _UIReusePool

- (_UIReusePool)initWithPolicy:(unint64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)_UIReusePool;
  v4 = [(_UIReusePool *)&v14 init];
  if (v4)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    reuseSet = v4->_reuseSet;
    v4->_reuseSet = v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.UIKit._UIReusePool.reuseSetAccess", v7);
    reuseSetAccessQueue = v4->_reuseSetAccessQueue;
    v4->_reuseSetAccessQueue = (OS_dispatch_queue *)v8;

    v4->_purgePolicy = a3;
    v10 = v4;
    if (qword_1EB25CEB8 != -1) {
      dispatch_once(&qword_1EB25CEB8, &__block_literal_global_34_1);
    }
    v11 = qword_1EB25CEB0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ____registerReusePool_block_invoke;
    block[3] = &unk_1E52D9F70;
    v16 = v10;
    v12 = v10;
    dispatch_sync(v11, block);
  }
  return v4;
}

- (id)reusableObject
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__109;
  v10 = __Block_byref_object_dispose__109;
  id v11 = 0;
  reuseSetAccessQueue = self->_reuseSetAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30___UIReusePool_reusableObject__block_invoke;
  v5[3] = &unk_1E52E3210;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(reuseSetAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  v5 = v4;
  unint64_t purgePolicy = self->_purgePolicy;
  if (purgePolicy)
  {
    unsigned __int8 v7 = atomic_load(byte_1EB256DF9);
    if ((purgePolicy & 2) == 0 || (v7 & 1) == 0)
    {
      if ((v7 & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((purgePolicy & 2) == 0)
  {
    goto LABEL_7;
  }
  unsigned __int8 v8 = atomic_load((unsigned __int8 *)&_MergedGlobals_898);
  if (v8)
  {
LABEL_7:
    reuseSetAccessQueue = self->_reuseSetAccessQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __26___UIReusePool_addObject___block_invoke;
    v10[3] = &unk_1E52D9F98;
    v10[4] = self;
    id v11 = v4;
    dispatch_sync(reuseSetAccessQueue, v10);
  }
LABEL_8:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseSetAccessQueue, 0);
  objc_storeStrong((id *)&self->_reuseSet, 0);
}

+ (void)__applicationWillEnterForeground:(id)a3
{
}

+ (void)initialize
{
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS____UIReusePool;
  objc_msgSendSuper2(&v11, sel_initialize);
  if ((id)objc_opt_class() == a1)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.UIKit._UIReusePool.memoryPressureResponse", 0);
    id v4 = (void *)qword_1EB25CEA8;
    qword_1EB25CEA8 = (uint64_t)v3;

    v5 = (const dispatch_source_type_s *)MEMORY[0x1E4F14468];
    dispatch_source_t v6 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 6uLL, (dispatch_queue_t)qword_1EB25CEA8);
    unsigned __int8 v7 = (void *)_MergedGlobals_3_16;
    _MergedGlobals_3_16 = (uint64_t)v6;

    dispatch_source_set_event_handler((dispatch_source_t)_MergedGlobals_3_16, &__block_literal_global_282);
    dispatch_resume((dispatch_object_t)_MergedGlobals_3_16);
    dispatch_source_t v8 = dispatch_source_create(v5, 0, 1uLL, (dispatch_queue_t)qword_1EB25CEA8);
    v9 = (void *)qword_1EB25CEA0;
    qword_1EB25CEA0 = (uint64_t)v8;

    dispatch_source_set_event_handler((dispatch_source_t)qword_1EB25CEA0, &__block_literal_global_3_0);
    dispatch_resume((dispatch_object_t)qword_1EB25CEA0);
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:a1 selector:sel___applicationDidEnterBackground_ name:@"UIApplicationDidEnterBackgroundNotification" object:UIApp];
    [v10 addObserver:a1 selector:sel___applicationWillEnterForeground_ name:@"UIApplicationWillEnterForegroundNotification" object:UIApp];
    if ([(id)UIApp applicationState] == 2) {
      objc_msgSend(a1, "__applicationDidEnterBackground:", 0);
    }
  }
}

+ (void)__applicationDidEnterBackground:(id)a3
{
}

- (_UIReusePool)init
{
  return [(_UIReusePool *)self initWithPolicy:3];
}

- (unint64_t)purgePolicy
{
  return self->_purgePolicy;
}

- (void)drainPool
{
  reuseSetAccessQueue = self->_reuseSetAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25___UIReusePool_drainPool__block_invoke;
  block[3] = &unk_1E52D9F70;
  void block[4] = self;
  dispatch_sync(reuseSetAccessQueue, block);
}

@end