@interface UITextContainerView
@end

@implementation UITextContainerView

id __33___UITextContainerView_setFrame___block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)_UITextContainerView;
  return objc_msgSendSuper2(&v2, sel_setFrame_, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __76___UITextContainerView__setFrameOrBounds_oldRect_isFrameRect_settingAction___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_super v2 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 48) == v2[63])
  {
    CGFloat v3 = *(double *)(a1 + 56);
    CGFloat v4 = *(double *)(a1 + 64);
    double v5 = *(double *)(a1 + 72);
    double v6 = *(double *)(a1 + 80);
    if (*(unsigned char *)(a1 + 120))
    {
      if ([v2 isHorizontallyResizable])
      {
        [*(id *)(a1 + 32) bounds];
        double v6 = v7;
      }
      int v8 = [*(id *)(a1 + 32) isVerticallyResizable];
      objc_super v2 = *(void **)(a1 + 32);
      if (v8)
      {
        [v2 bounds];
        double v5 = v9;
        objc_super v2 = *(void **)(a1 + 32);
      }
    }
    _UITextContainerViewResyncNSTextContainer(v2, v3, v4, v5, v6);
    if (*(double *)(a1 + 104) != v5 || *(double *)(a1 + 112) != v6)
    {
      [*(id *)(a1 + 32) invalidateTextContainerOrigin];
      [*(id *)(a1 + 32) setNeedsDisplay];
      id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v11 postNotificationName:@"_UITextContainerViewSizeDidChange" object:*(void *)(a1 + 32)];
    }
  }
}

void *__76___UITextContainerView__setFrameOrBounds_oldRect_isFrameRect_settingAction___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  uint64_t v3 = result[64];
  if (v3)
  {
    if (*(void *)(a1 + 40) == result[63])
    {
      result = (void *)[result setClipsToBounds:v3 == 1];
      *(void *)(*(void *)(a1 + 32) + 512) = 0;
    }
  }
  return result;
}

uint64_t __76___UITextContainerView__setFrameOrBounds_oldRect_isFrameRect_settingAction___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = 32;
  if (!*(unsigned char *)(a1 + 48)) {
    uint64_t v1 = 40;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + v1) + 16))();
}

id __34___UITextContainerView_setBounds___block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)_UITextContainerView;
  return objc_msgSendSuper2(&v2, sel_setBounds_, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

@end