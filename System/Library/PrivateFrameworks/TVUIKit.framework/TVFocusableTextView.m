@interface TVFocusableTextView
@end

@implementation TVFocusableTextView

id __38___TVFocusableTextView_initWithFrame___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263F1CAC8]);
  v1 = objc_msgSend(v0, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v1 setBackgroundColor:0];
  objc_msgSend(v1, "setTextContainerInset:", 0.0, -5.0, 0.0, -5.0);
  [v1 setScrollEnabled:0];
  [v1 setEditable:0];
  [v1 setUserInteractionEnabled:0];
  [v1 setAdjustsFontForContentSizeCategory:1];
  [v1 setSelectable:0];
  v2 = [v1 layer];
  [v2 setCornerRadius:0.0];

  v3 = [v1 textContainer];
  [v3 setMaximumNumberOfLines:0];

  v4 = [v1 textContainer];
  [v4 setLineBreakMode:4];

  return v1;
}

uint64_t __70___TVFocusableTextView_setSelected_animated_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSelected:*(unsigned __int8 *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 41)];
}

uint64_t __43___TVFocusableTextView_setDescriptionText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v17 = a2;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v8 = v17;
  if (isKindOfClass)
  {
    v9 = (void *)[v17 mutableCopy];
    v10 = v9;
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = objc_alloc_init(MEMORY[0x263F81650]);
    }
    v12 = v11;

    [v12 setLineBreakMode:0];
    [v12 setAlignment:4];
    uint64_t v13 = *MEMORY[0x263F81540];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x263F81540], a3, a4);
    v14 = *(void **)(a1 + 32);
    v15 = (void *)[v12 copy];
    objc_msgSend(v14, "addAttribute:value:range:", v13, v15, a3, a4);

    id v8 = v17;
  }
  return MEMORY[0x270F9A758](isKindOfClass, v8);
}

void __43___TVFocusableTextView_setDescriptionText___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v11 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v11;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = [WeakRetained _accessibilityHigherContrastTintColorForColor:v7];

    uint64_t v10 = *MEMORY[0x263F81500];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x263F81500], a3, a4);
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v10, v9, a3, a4);
  }
}

@end