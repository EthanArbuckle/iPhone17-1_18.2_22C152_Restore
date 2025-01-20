@interface UISystemBackgroundView
@end

@implementation UISystemBackgroundView

void __136___UISystemBackgroundView__transitionFromVisualEffect_toVisualEffect_oldGroupName_newGroupName_oldblurClippingMode_newblurClippingMode___block_invoke(uint64_t a1)
{
  v2 = [[UIVisualEffectView alloc] initWithEffect:0];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 416);
  *(void *)(v3 + 416) = v2;

  v5 = +[UIColor clearColor];
  v6 = [*(id *)(*(void *)(a1 + 32) + 416) contentView];
  [v6 setBackgroundColor:v5];

  -[_UISystemBackgroundView _addInternalSubview:ofType:](*(unsigned char **)(a1 + 32), *(void **)(*(void *)(a1 + 32) + 416), (unsigned __int8 *)2);
  -[_UISystemBackgroundView _layoutVisualEffectView](*(unsigned __int8 **)(a1 + 32));
  uint64_t v7 = *(void *)(a1 + 32);
  -[_UISystemBackgroundView _updateCornerMaskingForType:](v7, 2);
}

void __44___UISystemBackgroundView_setConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 472), *(id *)(a1 + 40));
  }
}

void __66___UISystemBackgroundView__transitionFromCustomView_toCustomView___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v4 = (void *)a1[6];
    if (v4)
    {
      v5 = (unsigned char *)a1[5];
      -[_UISystemBackgroundView _removeInternalSubview:ofType:](v5, v4, 4);
    }
  }
  else
  {
    v6 = (void *)a1[4];
    if (v6)
    {
      -[_UISystemBackgroundView _removeInternalSubview:ofType:]((unsigned char *)a1[5], v6, 4);
      uint64_t v7 = (void *)a1[4];
      [v7 setAlpha:1.0];
    }
  }
}

void __70___UISystemBackgroundView__transitionFromHadColorView_toHasColorView___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 408), *(id *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 48);
    v5 = *(void **)(*(void *)(a1 + 32) + 408);
    [v5 setBackgroundColor:v4];
  }
  else
  {
    v6 = *(unsigned char **)(a1 + 32);
    uint64_t v7 = *(void **)(a1 + 40);
    -[_UISystemBackgroundView _removeInternalSubview:ofType:](v6, v7, 1);
  }
}

uint64_t __66___UISystemBackgroundView__transitionFromCustomView_toCustomView___block_invoke(uint64_t a1)
{
  -[_UISystemBackgroundView _addInternalSubview:ofType:](*(unsigned char **)(a1 + 32), *(void **)(a1 + 40), (unsigned __int8 *)4);
  -[_UISystemBackgroundView _layoutCustomView](*(unsigned __int8 **)(a1 + 32));
  -[_UISystemBackgroundView _updateCornerMaskingForType:](*(void *)(a1 + 32), 4);
  v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

void __70___UISystemBackgroundView__transitionFromHadColorView_toHasColorView___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(UIView);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 408);
  *(void *)(v3 + 408) = v2;

  v5 = +[UIColor clearColor];
  [*(id *)(*(void *)(a1 + 32) + 408) setBackgroundColor:v5];

  -[_UISystemBackgroundView _addInternalSubview:ofType:](*(unsigned char **)(a1 + 32), *(void **)(*(void *)(a1 + 32) + 408), (unsigned __int8 *)1);
  -[_UISystemBackgroundView _layoutColorView](*(unsigned __int8 **)(a1 + 32));
  uint64_t v6 = *(void *)(a1 + 32);
  -[_UISystemBackgroundView _updateCornerMaskingForType:](v6, 1);
}

void __136___UISystemBackgroundView__transitionFromVisualEffect_toVisualEffect_oldGroupName_newGroupName_oldblurClippingMode_newblurClippingMode___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 416), *(id *)(a1 + 40));
    [*(id *)(*(void *)(a1 + 32) + 416) setEffect:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 416) _setGroupName:*(void *)(a1 + 56)];
    uint64_t v4 = *(void *)(a1 + 64);
    id v7 = [*(id *)(*(void *)(a1 + 32) + 416) contentView];
    [v7 setBackgroundColor:v4];
  }
  else
  {
    v5 = *(unsigned char **)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 40);
    -[_UISystemBackgroundView _removeInternalSubview:ofType:](v5, v6, 2);
  }
}

uint64_t __56___UISystemBackgroundView__transitionFromImage_toImage___block_invoke(uint64_t a1)
{
  v2 = [[UIImageView alloc] initWithImage:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 424);
  *(void *)(v3 + 424) = v2;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "setContentMode:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 472), "imageContentMode"));
  [*(id *)(*(void *)(a1 + 32) + 424) _setAnimatesContents:1];
  -[_UISystemBackgroundView _addInternalSubview:ofType:](*(unsigned char **)(a1 + 32), *(void **)(*(void *)(a1 + 32) + 424), (unsigned __int8 *)3);
  -[_UISystemBackgroundView _layoutImageView](*(unsigned __int8 **)(a1 + 32));
  -[_UISystemBackgroundView _updateCornerMaskingForType:](*(void *)(a1 + 32), 3);
  v5 = *(void **)(*(void *)(a1 + 32) + 424);
  return [v5 setAlpha:0.0];
}

void __56___UISystemBackgroundView__transitionFromImage_toImage___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 424), *(id *)(a1 + 40));
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 424);
    [v4 setAlpha:1.0];
  }
  else
  {
    v5 = *(unsigned char **)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 40);
    -[_UISystemBackgroundView _removeInternalSubview:ofType:](v5, v6, 3);
  }
}

uint64_t __93___UISystemBackgroundView__transitionViewBasedShadowFromShadowProperties_toShadowProperties___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(UIView);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 440);
  *(void *)(v3 + 440) = v2;

  -[_UISystemBackgroundView _addInternalSubview:ofType:](*(unsigned char **)(a1 + 32), *(void **)(*(void *)(a1 + 32) + 440), 0);
  -[_UISystemBackgroundView _layoutShadowView](*(unsigned __int8 **)(a1 + 32));
  -[_UISystemBackgroundView _updateCornerMaskingForType:](*(void *)(a1 + 32), 0);
  v5 = *(void **)(*(void *)(a1 + 32) + 440);
  return [v5 setAlpha:0.0];
}

void __93___UISystemBackgroundView__transitionViewBasedShadowFromShadowProperties_toShadowProperties___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 440), *(id *)(a1 + 40));
    uint64_t v4 = *(void **)(a1 + 40);
    [v4 setAlpha:1.0];
  }
  else
  {
    v5 = *(unsigned char **)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 40);
    -[_UISystemBackgroundView _removeInternalSubview:ofType:](v5, v6, 0);
  }
}

void __64___UISystemBackgroundView__transitionFromHadStroke_toHasStroke___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(_UISystemBackgroundStrokeView);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 432);
  *(void *)(v3 + 432) = v2;

  -[_UISystemBackgroundView _addInternalSubview:ofType:](*(unsigned char **)(a1 + 32), *(void **)(*(void *)(a1 + 32) + 432), (unsigned __int8 *)5);
  -[_UISystemBackgroundView _layoutStrokeView](*(id **)(a1 + 32));
  uint64_t v5 = *(void *)(a1 + 32);
  -[_UISystemBackgroundView _updateCornerMaskingForType:](v5, 5);
}

void __64___UISystemBackgroundView__transitionFromHadStroke_toHasStroke___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 432), *(id *)(a1 + 40));
  }
  else {
    -[_UISystemBackgroundView _removeInternalSubview:ofType:](*(unsigned char **)(a1 + 32), *(void **)(a1 + 40), 5);
  }
}

@end