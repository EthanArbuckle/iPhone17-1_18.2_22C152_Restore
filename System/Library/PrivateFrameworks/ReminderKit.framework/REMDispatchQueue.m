@interface REMDispatchQueue
+ (id)storeQueue;
@end

@implementation REMDispatchQueue

void __30__REMDispatchQueue_storeQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_initially_inactive(v0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.reminderkit.store", attr);
  v2 = (void *)storeQueue___sQueue;
  storeQueue___sQueue = (uint64_t)v1;

  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)storeQueue___sQueue);
}

+ (id)storeQueue
{
  if (storeQueue_onceToken != -1) {
    dispatch_once(&storeQueue_onceToken, &__block_literal_global_37);
  }
  v2 = (void *)storeQueue___sQueue;

  return v2;
}

@end