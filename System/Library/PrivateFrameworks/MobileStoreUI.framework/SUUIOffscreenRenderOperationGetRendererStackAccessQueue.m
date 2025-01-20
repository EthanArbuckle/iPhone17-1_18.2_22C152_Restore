@interface SUUIOffscreenRenderOperationGetRendererStackAccessQueue
@end

@implementation SUUIOffscreenRenderOperationGetRendererStackAccessQueue

uint64_t ___SUUIOffscreenRenderOperationGetRendererStackAccessQueue_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIOffscreenRenderOperation.RendererStackAccessQueue", MEMORY[0x263EF83A8]);
  uint64_t v1 = _SUUIOffscreenRenderOperationGetRendererStackAccessQueue_sRendererStacAccessQueue;
  _SUUIOffscreenRenderOperationGetRendererStackAccessQueue_sRendererStacAccessQueue = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end