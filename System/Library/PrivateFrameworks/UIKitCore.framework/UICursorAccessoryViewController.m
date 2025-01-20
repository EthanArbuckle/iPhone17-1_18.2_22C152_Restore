@interface UICursorAccessoryViewController
@end

@implementation UICursorAccessoryViewController

uint64_t __82___UICursorAccessoryViewController__setSelectionRect_preferredPlacement_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1016) layoutIfNeeded];
}

uint64_t __60___UICursorAccessoryViewController_setAccessories_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1016) layoutSubviews];
}

uint64_t __73___UICursorAccessoryViewController_setVisible_animationStyle_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __73___UICursorAccessoryViewController_setVisible_animationStyle_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73___UICursorAccessoryViewController_setVisible_animationStyle_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1016) setCollapsed:0];
}

uint64_t __73___UICursorAccessoryViewController_setVisible_animationStyle_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1016) setCollapsed:1];
}

uint64_t __73___UICursorAccessoryViewController_setVisible_animationStyle_completion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1016) setAlpha:1.0];
}

uint64_t __73___UICursorAccessoryViewController_setVisible_animationStyle_completion___block_invoke_6(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1016) setAlpha:0.0];
}

@end