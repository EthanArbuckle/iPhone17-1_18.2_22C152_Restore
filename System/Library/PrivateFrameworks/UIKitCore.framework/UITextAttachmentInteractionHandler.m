@interface UITextAttachmentInteractionHandler
@end

@implementation UITextAttachmentInteractionHandler

void __70___UITextAttachmentInteractionHandler__defaultMenuForInteractableItem__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[UIPasteboard generalPasteboard];
  [v2 setImage:v1];
}

void __70___UITextAttachmentInteractionHandler__defaultMenuForInteractableItem__block_invoke_2(uint64_t a1)
{
}

@end