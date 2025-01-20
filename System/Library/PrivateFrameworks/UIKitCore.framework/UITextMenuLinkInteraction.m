@interface UITextMenuLinkInteraction
@end

@implementation UITextMenuLinkInteraction

void __111___UITextMenuLinkInteraction_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  v1 = (void *)UIApp;
  id v2 = [*(id *)(a1 + 32) interactionURL];
  [v1 openURL:v2 withCompletionHandler:0];
}

uint64_t __111___UITextMenuLinkInteraction_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:0 completion:0];
}

@end