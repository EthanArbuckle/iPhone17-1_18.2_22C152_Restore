@interface AppIntentsQueue
@end

@implementation AppIntentsQueue

void ___AppIntentsQueue_block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("PXPhotosContentController", attr);
  v2 = (void *)_AppIntentsQueue_serialQueue;
  _AppIntentsQueue_serialQueue = (uint64_t)v1;
}

void ___AppIntentsQueue_block_invoke_79633()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("PXCuratedLibraryUIViewController", attr);
  v2 = (void *)_AppIntentsQueue_serialQueue_79631;
  _AppIntentsQueue_serialQueue_79631 = (uint64_t)v1;
}

@end