@interface UIProtocolCreationQueue
@end

@implementation UIProtocolCreationQueue

void ___UIProtocolCreationQueue_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.uikit.protocol-creation-queue", 0);
  v1 = (void *)_MergedGlobals_1306;
  _MergedGlobals_1306 = (uint64_t)v0;
}

@end