@interface UIStatusBarBluetoothItem
@end

@implementation UIStatusBarBluetoothItem

uint64_t __67___UIStatusBarBluetoothItem_alwaysShowRegulatoryBluetoothIndicator__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _MergedGlobals_1219 = result;
  return result;
}

void __55___UIStatusBarBluetoothItem_applyUpdate_toDisplayItem___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v6 = a2;
  objc_msgSend(v3, "drawAtPoint:", v4, v5);
  v7 = [v6 format];

  [v7 bounds];
  CGFloat v9 = v8 + 1.0;
  CGFloat v11 = v10 + -2.0;
  CGFloat v13 = v12 + 2.0;
  CGFloat v15 = v14 + -3.0;

  v35.origin.x = v9;
  v35.origin.y = v13;
  v35.size.width = v11;
  v35.size.height = v15;
  double Height = CGRectGetHeight(v35);
  double v17 = Height * (double)[*(id *)(a1 + 40) capacity] / 100.0;
  v36.origin.x = v9;
  v36.origin.y = v13;
  v36.size.width = v11;
  v36.size.height = v15;
  double v18 = v13 + CGRectGetHeight(v36) - v17;
  v19 = [*(id *)(a1 + 48) styleAttributes];
  v20 = [v19 traitCollection];
  [v20 displayScale];
  double v22 = UIRectIntegralWithScale(v9, v18, v11, v17, v21);
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;

  v29 = *(void **)(a1 + 56);
  uint64_t v30 = *(void *)(a1 + 40);
  v31 = [*(id *)(a1 + 48) styleAttributes];
  v32 = [v31 imageTintColor];
  id v33 = [v29 _batteryFillColorForEntry:v30 usingTintColor:v32];

  [v33 setFill];
  UIRectFillUsingOperation(1, v22, v24, v26, v28);
}

@end