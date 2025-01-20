@interface UIFieldEditorSystemInputHost
@end

@implementation UIFieldEditorSystemInputHost

uint64_t __53___UIFieldEditorSystemInputHost_addPlaceholderLabel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __86___UIFieldEditorSystemInputHost__updateFieldEditorBackgroundViewLayoutForcingDefault___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "setContentOffset:animated:", 0, *(double *)(a1 + 72), *(double *)(a1 + 80));
  v2 = *(void **)(a1 + 32);
  return [v2 setNeedsLayout];
}

@end