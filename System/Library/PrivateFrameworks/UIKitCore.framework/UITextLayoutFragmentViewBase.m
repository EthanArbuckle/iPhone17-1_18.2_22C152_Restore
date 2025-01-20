@interface UITextLayoutFragmentViewBase
@end

@implementation UITextLayoutFragmentViewBase

uint64_t __48___UITextLayoutFragmentViewBase__updateGeometry__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  if (!CGRectEqualToRect(v9, *(CGRect *)(a1 + 40))) {
    objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  [*(id *)(a1 + 32) bounds];
  uint64_t result = CGRectEqualToRect(v10, *(CGRect *)(a1 + 72));
  if ((result & 1) == 0)
  {
    double v3 = *(double *)(a1 + 72);
    double v4 = *(double *)(a1 + 80);
    double v5 = *(double *)(a1 + 88);
    double v6 = *(double *)(a1 + 96);
    v7 = *(void **)(a1 + 32);
    return objc_msgSend(v7, "setBounds:", v3, v4, v5, v6);
  }
  return result;
}

void __72___UITextLayoutFragmentViewBase_enumerateTextAttachmentViewsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  double v3 = [v14 view];
  if (v3)
  {
    double v4 = *(void **)(*(void *)(a1 + 32) + 416);
    double v5 = [v14 location];
    [v4 frameForTextAttachmentAtLocation:v5];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(v7, v9, v11, v13);
  }
}

void __62___UITextLayoutFragmentViewBase__updateTextAttachmentGeometry__block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v13 = a2;
  objc_msgSend(v13, "setFrame:", a3, a4, a5, a6);
  double v11 = [v13 superview];
  double v12 = *(void **)(a1 + 32);

  if (v11 != v12) {
    [*(id *)(a1 + 32) addSubview:v13];
  }
}

@end