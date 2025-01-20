@interface PXMediaProvider
@end

@implementation PXMediaProvider

void __43__PXMediaProvider_Preheating__preheatQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  attr = dispatch_queue_attr_make_initially_inactive(v1);

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.photos.mediaProvider.shared-preheat-queue", attr);
  v3 = (void *)preheatQueue_sharedPreheatQueue;
  preheatQueue_sharedPreheatQueue = (uint64_t)v2;

  v4 = +[PXPreloadScheduler sharedScheduler];
  [v4 scheduleMainQueueTask:&__block_literal_global_3_188481];
}

void __43__PXMediaProvider_Preheating__preheatQueue__block_invoke_2()
{
}

@end