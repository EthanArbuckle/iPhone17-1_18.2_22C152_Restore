@interface SKUIOffscreenRenderOperationGetRendererStackAccessQueue
@end

@implementation SKUIOffscreenRenderOperationGetRendererStackAccessQueue

uint64_t ___SKUIOffscreenRenderOperationGetRendererStackAccessQueue_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.StoreKitUI.SKUIOffscreenRenderOperation.RendererStackAccessQueue", MEMORY[0x1E4F14430]);
  uint64_t v1 = _SKUIOffscreenRenderOperationGetRendererStackAccessQueue_sRendererStacAccessQueue;
  _SKUIOffscreenRenderOperationGetRendererStackAccessQueue_sRendererStacAccessQueue = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end