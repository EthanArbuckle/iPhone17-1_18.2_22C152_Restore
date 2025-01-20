@interface PFWorkloop
+ (OS_dispatch_workloop)sharedWorkloop;
+ (OS_dispatch_workloop)snapshotWorkloop;
+ (id)concurrentQueueTargetingWorkloop:(id)a3 label:(id)a4 withQoS:(unsigned int)a5;
+ (id)serialQueueTargetingSharedWorkloop:(id)a3;
+ (id)serialQueueTargetingSharedWorkloop:(id)a3 withQoS:(unsigned int)a4;
+ (id)serialQueueTargetingWorkloop:(id)a3 label:(id)a4 withQoS:(unsigned int)a5;
@end

@implementation PFWorkloop

+ (OS_dispatch_workloop)sharedWorkloop
{
  if (sharedWorkloop_onceToken != -1) {
    dispatch_once(&sharedWorkloop_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedWorkloop_workloop;
  return (OS_dispatch_workloop *)v2;
}

void __28__PFWorkloop_sharedWorkloop__block_invoke()
{
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive("com.apple.PosterUIFoundation.sharedWorkloop");
  v1 = (void *)sharedWorkloop_workloop;
  sharedWorkloop_workloop = (uint64_t)inactive;

  dispatch_workloop_set_autorelease_frequency((dispatch_workloop_t)sharedWorkloop_workloop, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_set_qos_class_fallback();
  v2 = sharedWorkloop_workloop;
  dispatch_activate(v2);
}

+ (OS_dispatch_workloop)snapshotWorkloop
{
  if (snapshotWorkloop_onceToken != -1) {
    dispatch_once(&snapshotWorkloop_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)snapshotWorkloop_workloop;
  return (OS_dispatch_workloop *)v2;
}

void __30__PFWorkloop_snapshotWorkloop__block_invoke()
{
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive("com.apple.PosterUIFoundation.snapshotWorkloop");
  v1 = (void *)snapshotWorkloop_workloop;
  snapshotWorkloop_workloop = (uint64_t)inactive;

  dispatch_workloop_set_autorelease_frequency((dispatch_workloop_t)snapshotWorkloop_workloop, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_set_qos_class_fallback();
  v2 = snapshotWorkloop_workloop;
  dispatch_activate(v2);
}

+ (id)serialQueueTargetingSharedWorkloop:(id)a3
{
  v3 = (const char *)[a3 UTF8String];
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = +[PFWorkloop sharedWorkloop];
  dispatch_queue_t v6 = dispatch_queue_create_with_target_V2(v3, v4, v5);

  return v6;
}

+ (id)serialQueueTargetingSharedWorkloop:(id)a3 withQoS:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = +[PFWorkloop sharedWorkloop];
  v8 = [a1 serialQueueTargetingWorkloop:v7 label:v6 withQoS:v4];

  return v8;
}

+ (id)serialQueueTargetingWorkloop:(id)a3 label:(id)a4 withQoS:(unsigned int)a5
{
  id v7 = a4;
  v8 = a3;
  v9 = (const char *)[v7 UTF8String];
  v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = dispatch_queue_attr_make_with_qos_class(v10, (dispatch_qos_class_t)a5, 0);
  dispatch_queue_t v12 = dispatch_queue_create_with_target_V2(v9, v11, v8);

  return v12;
}

+ (id)concurrentQueueTargetingWorkloop:(id)a3 label:(id)a4 withQoS:(unsigned int)a5
{
  id v7 = a4;
  v8 = a3;
  v9 = (const char *)[v7 UTF8String];
  v10 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = dispatch_queue_attr_make_with_qos_class(v10, (dispatch_qos_class_t)a5, 0);
  dispatch_queue_t v12 = dispatch_queue_create_with_target_V2(v9, v11, v8);

  return v12;
}

@end