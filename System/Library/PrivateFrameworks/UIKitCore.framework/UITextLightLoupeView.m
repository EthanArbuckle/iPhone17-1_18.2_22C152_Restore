@interface UITextLightLoupeView
@end

@implementation UITextLightLoupeView

void __52___UITextLightLoupeView__backgroundColorIfNecessary__block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = v5;
  if (*(void *)(*(void *)(a1[5] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL && (id)a1[4] == v5)
  {
    id v10 = v5;
    char isKindOfClass = objc_opt_isKindOfClass();
    v6 = v10;
    if (isKindOfClass)
    {
      uint64_t v8 = a1[5];
LABEL_8:
      *(void *)(*(void *)(v8 + 8) + 24) = a3;
      goto LABEL_9;
    }
  }
  if (*(void *)(*(void *)(a1[6] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v6;
    char v9 = objc_opt_isKindOfClass();
    v6 = v11;
    if (v9)
    {
      uint64_t v8 = a1[6];
      goto LABEL_8;
    }
  }
LABEL_9:
}

uint64_t __56___UITextLightLoupeView_setVisible_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 480) && *(unsigned char *)(a1 + 48)) {
    [*(id *)(v2 + 464) setPaused:1];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __56___UITextLightLoupeView_setVisible_animated_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
  CGAffineTransformMakeTranslation(&v5, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
  uint64_t v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

@end