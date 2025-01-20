@interface UIApplication
@end

@implementation UIApplication

void __104__UIApplication_UIAccessibilityElementTraversal___accessibilityAddKeyboardWindowToArray_forModalWindow___block_invoke(uint64_t a1, void *a2)
{
  id v18 = a2;
  if (!v18) {
    goto LABEL_18;
  }
  if (([*(id *)(a1 + 32) _accessibilityIsModalWithKeyboard] & 1) == 0)
  {
    [v18 windowLevel];
    double v4 = v3;
    [*(id *)(a1 + 32) windowLevel];
    if (vabdd_f64(v4, v5) >= 3.0)
    {
      [v18 windowLevel];
      if (v6 != *MEMORY[0x1E4F43C70]) {
        goto LABEL_18;
      }
    }
  }
  [*(id *)(a1 + 32) windowLevel];
  double v8 = v7;
  [v18 windowLevel];
  double v10 = v9;
  v11 = [MEMORY[0x1E4F42C68] sharedInstance];
  if ([v11 isOnScreen])
  {
    v12 = [MEMORY[0x1E4F42C68] sharedInstance];
    v13 = [v12 _currentInputView];

    if (!v13)
    {
      LOBYTE(v14) = 0;
      goto LABEL_10;
    }
  }
  else
  {
  }
  int v14 = [(id)*MEMORY[0x1E4F43630] _accessibilitySoftwareKeyboardActive] ^ 1;
LABEL_10:
  if (([v18 isHidden] & 1) == 0)
  {
    id v15 = *(id *)(a1 + 32);
    if (v15 != v18)
    {
      int v16 = [v15 _accessibilityIsModalWithKeyboard];
      char v17 = v8 > v10 ? 1 : v14;
      if (v16 || (v17 & 1) == 0) {
        [*(id *)(a1 + 40) axSafelyAddObject:v18];
      }
    }
  }
LABEL_18:
}

uint64_t __106__UIApplication_UIAccessibilityElementTraversal___accessibilityElementWindowsWithOptions_referenceWindow___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [(id)*MEMORY[0x1E4F43630] _accessibilityAllWindowsOnlyVisibleWindows:1];

  return MEMORY[0x1F41817F8]();
}

void __117__UIApplication_UIAccessibilityElementTraversal___accessibilityElementWindowsWithOptions_referenceWindow_allWindows___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [v3 screen];
  v13 = [v12 coordinateSpace];
  objc_msgSend(v3, "convertRect:toCoordinateSpace:", v13, v5, v7, v9, v11);
  uint64_t v15 = v14;
  uint64_t v17 = v16;

  id v18 = *(void **)(a1 + 32);
  v26[0] = v15;
  v26[1] = v17;
  v19 = [MEMORY[0x1E4F29238] valueWithBytes:v26 objCType:"{CGPoint=dd}"];
  v20 = [v18 objectForKeyedSubscript:v19];

  if (!v20)
  {
    v20 = [MEMORY[0x1E4F1CA48] array];
  }
  v21 = [v3 windowScene];
  uint64_t v22 = [v21 activationState];

  if (!v22) {
    [v20 addObject:v3];
  }
  v23 = *(void **)(a1 + 32);
  v25[0] = v15;
  v25[1] = v17;
  v24 = [MEMORY[0x1E4F29238] valueWithBytes:v25 objCType:"{CGPoint=dd}"];
  [v23 setObject:v20 forKeyedSubscript:v24];
}

BOOL __117__UIApplication_UIAccessibilityElementTraversal___accessibilityElementWindowsWithOptions_referenceWindow_allWindows___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [v3 screen];
  v13 = [v12 coordinateSpace];
  objc_msgSend(v3, "convertRect:toCoordinateSpace:", v13, v5, v7, v9, v11);
  double v15 = v14;
  double v17 = v16;

  [*(id *)(a1 + 32) CGPointValue];
  return v17 == v19 && v15 == v18;
}

uint64_t __79__UIApplication_UIAccessibilityInitialization___accessibilityIsSystemAppServer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityUpdateIsSystemAppServer];
}

uint64_t __68__UIApplication_UIAccessibility___accessibilityIsAppReadyToBeProbed__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) safeBoolForKey:@"_isActivating"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result ^ 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

@end