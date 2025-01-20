@interface TVLabel
@end

@implementation TVLabel

void __30___TVLabel_setAttributedText___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    BOOL v5 = [*(id *)(a1 + 32) effectiveUserInterfaceLayoutDirection] == 1;
    v6 = [v4 tintColor];
    objc_msgSend(v4, "tv_setCurrentTintColor:", v6);

    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __30___TVLabel_setAttributedText___block_invoke_2;
    v7[3] = &unk_264BA6A38;
    objc_copyWeak(&v8, (id *)(a1 + 40));
    objc_msgSend(v4, "tv_resolveWithTextLayoutDirection:layoutObserver:", v5, v7);
    objc_destroyWeak(&v8);
  }
}

void __30___TVLabel_setAttributedText___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsDisplay];
}

void __30___TVLabel_setAttributedText___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v11 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v11;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = [WeakRetained _accessibilityHigherContrastTintColorForColor:v7];

    uint64_t v10 = *MEMORY[0x263F1C240];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x263F1C240], a3, a4);
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v10, v9, a3, a4);
  }
}

void __27___TVLabel_setHighlighted___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    BOOL v5 = [*(id *)(a1 + 32) effectiveUserInterfaceLayoutDirection] == 1;
    if (*(unsigned char *)(a1 + 48)) {
      objc_msgSend(v4, "tv_highlightColor");
    }
    else {
    v6 = [v4 tintColor];
    }
    objc_msgSend(v4, "tv_setCurrentTintColor:", v6);

    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __27___TVLabel_setHighlighted___block_invoke_2;
    v7[3] = &unk_264BA6A38;
    objc_copyWeak(&v8, (id *)(a1 + 40));
    objc_msgSend(v4, "tv_resolveWithTextLayoutDirection:layoutObserver:", v5, v7);
    objc_destroyWeak(&v8);
  }
}

void __27___TVLabel_setHighlighted___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsDisplay];
}

@end