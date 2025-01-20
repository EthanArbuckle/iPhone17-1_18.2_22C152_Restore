@interface TVMenuBarStackView
@end

@implementation TVMenuBarStackView

void __40___TVMenuBarStackView_setSelectedIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v7;
    if (v5)
    {
      v6 = v5;
      [v5 setSelected:*(void *)(*(void *)(a1 + 32) + 448) == a3];
    }
  }
}

void __49___TVMenuBarStackView__buttonEventTouchUpInside___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v8;
  }
  else {
    id v7 = 0;
  }
  if ([*(id *)(a1 + 32) isEqual:v7])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

@end