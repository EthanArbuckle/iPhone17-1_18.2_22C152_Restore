@interface UITextDataDetectedLinkInteractionHandler
@end

@implementation UITextDataDetectedLinkInteractionHandler

uint64_t __79___UITextDataDetectedLinkInteractionHandler__defaultDataDetectorsPrimaryAction__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setFallbackDriverStyle:1];
  v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  return objc_msgSend(v2, "_presentMenuAtLocation:", v3, v4);
}

void __79___UITextDataDetectedLinkInteractionHandler__defaultDataDetectorsPrimaryAction__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 48) sharedController];
  [v2 performAction:*(void *)(a1 + 32) inView:*(void *)(a1 + 40) interactionDelegate:0];
}

@end