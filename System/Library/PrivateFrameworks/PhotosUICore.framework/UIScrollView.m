@interface UIScrollView
@end

@implementation UIScrollView

uint64_t __76__UIScrollView_PhotosUICore__px_adjustInsetsForKeyboardInfo_safeAreaInsets___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentInset:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

@end