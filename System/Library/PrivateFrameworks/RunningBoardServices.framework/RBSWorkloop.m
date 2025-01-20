@interface RBSWorkloop
+ (dispatch_queue_t)createCalloutQueue:(uint64_t)a1;
+ (id)createBackgroundQueue:(id)a3;
+ (id)createSyncingQueue:(id)a3;
+ (id)sharedBackgroundWorkloop;
+ (id)sharedCalloutWorkloop;
+ (id)sharedInstance;
+ (id)sharedSyncingWorkloop;
+ (void)performBackgroundWork:(id)a3;
+ (void)performBackgroundWorkWithServiceClass:(unsigned int)a3 block:(id)a4;
+ (void)performCallout:(uint64_t)a1;
+ (void)performCalloutWithServiceClass:(void *)a3 block:;
- (dispatch_workloop_t)_init;
@end

@implementation RBSWorkloop

+ (id)sharedBackgroundWorkloop
{
  v2 = (id *)+[RBSWorkloop sharedInstance]();
  id v3 = v2[2];

  return v3;
}

+ (id)sharedInstance
{
  self;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)sharedInstance___sharedInstance;
  return v0;
}

+ (void)performBackgroundWorkWithServiceClass:(unsigned int)a3 block:(id)a4
{
  dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, a4);
  [a1 performBackgroundWork:v5];
}

+ (void)performBackgroundWork:(id)a3
{
  id v4 = a3;
  dispatch_block_t v5 = [a1 sharedBackgroundWorkloop];
  dispatch_async(v5, v4);
}

+ (dispatch_queue_t)createCalloutQueue:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = v2;
  id v4 = (const char *)[v3 UTF8String];

  dispatch_block_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = +[RBSWorkloop sharedCalloutWorkloop]();
  dispatch_queue_t v7 = dispatch_queue_create_with_target_V2(v4, v5, v6);

  return v7;
}

+ (id)sharedCalloutWorkloop
{
  self;
  v0 = (id *)+[RBSWorkloop sharedInstance]();
  id v1 = v0[1];

  return v1;
}

+ (id)createBackgroundQueue:(id)a3
{
  id v4 = (const char *)[a3 UTF8String];
  dispatch_block_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = [a1 sharedBackgroundWorkloop];
  dispatch_queue_t v7 = dispatch_queue_create_with_target_V2(v4, v5, v6);

  return v7;
}

uint64_t __29__RBSWorkloop_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance = (uint64_t)-[RBSWorkloop _init]([RBSWorkloop alloc]);
  return MEMORY[0x1F41817F8]();
}

- (dispatch_workloop_t)_init
{
  if (!a1) {
    return 0;
  }
  v9.receiver = a1;
  v9.super_class = (Class)RBSWorkloop;
  id v1 = (dispatch_workloop_t *)objc_msgSendSuper2(&v9, sel_init);
  if (v1)
  {
    dispatch_workloop_t inactive = dispatch_workloop_create_inactive("com.apple.runningboardservices.callout-workloop");
    dispatch_workloop_t v3 = v1[1];
    v1[1] = inactive;

    dispatch_workloop_set_autorelease_frequency(v1[1], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_set_qos_class_fallback();
    dispatch_workloop_t v4 = dispatch_workloop_create_inactive("com.apple.runningboardservices.background-workloop");
    dispatch_workloop_t v5 = v1[2];
    v1[2] = v4;

    dispatch_workloop_set_autorelease_frequency(v1[2], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_set_qos_class_fallback();
    dispatch_workloop_t v6 = dispatch_workloop_create_inactive("com.apple.runningboardservices.syncing-workloop");
    dispatch_workloop_t v7 = v1[3];
    v1[3] = v6;

    dispatch_workloop_set_autorelease_frequency(v1[3], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_set_qos_class_fallback();
    dispatch_activate(v1[1]);
    dispatch_activate(v1[2]);
    dispatch_activate(v1[3]);
  }
  return v1;
}

+ (id)sharedSyncingWorkloop
{
  id v2 = (id *)+[RBSWorkloop sharedInstance]();
  id v3 = v2[3];

  return v3;
}

+ (void)performCallout:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = +[RBSWorkloop sharedCalloutWorkloop]();
  dispatch_async(v3, v2);
}

+ (void)performCalloutWithServiceClass:(void *)a3 block:
{
  id v4 = a3;
  self;
  id v5 = +[RBSWorkloop sharedCalloutWorkloop]();
  RBSDispatchAsyncWithQoS(v5, a2, v4);
}

+ (id)createSyncingQueue:(id)a3
{
  id v3 = a3;
  id v4 = (id *)+[RBSWorkloop sharedInstance]();
  id v5 = v4[3];

  id v6 = v3;
  dispatch_workloop_t v7 = (const char *)[v6 UTF8String];

  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create_with_target_V2(v7, v8, v5);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncingWorkloop, 0);
  objc_storeStrong((id *)&self->_backgroundWorkloop, 0);
  objc_storeStrong((id *)&self->_calloutWorkloop, 0);
}

@end