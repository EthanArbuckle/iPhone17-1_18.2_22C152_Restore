@interface UIFindNavigatorResponder
@end

@implementation UIFindNavigatorResponder

void __66___UIFindNavigatorResponder_becomeFirstResponderAndFocusFindField__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) findNavigatorViewController];
  v3 = [v2 findNavigatorView];
  [v3 becomeFirstResponder];

  *(unsigned char *)(*(void *)(a1 + 32) + 25) = 1;
}

@end