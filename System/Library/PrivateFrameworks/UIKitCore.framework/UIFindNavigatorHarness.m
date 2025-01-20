@interface UIFindNavigatorHarness
@end

@implementation UIFindNavigatorHarness

uint64_t __54___UIFindNavigatorHarness_beginHoistingFindNavigator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _findNavigatorView];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];

  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) _adjustHostViewScrollOffsetToTopIfSupported];
  }
  return [*(id *)(a1 + 32) _sendPlacementUpdate];
}

void __72___UIFindNavigatorHarness_endHoistingFindNavigator_endingActiveSession___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _findNavigatorView];
  id v3 = [v2 superview];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));

  if (v3 == WeakRetained)
  {
    v5 = [*(id *)(a1 + 32) _findNavigatorView];
    [v5 removeFromSuperview];
  }
  id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [v6 _setSystemInsetAdjustment:@"findadj" forAdjustmentTypeIdentifier:0.0];
}

uint64_t __72___UIFindNavigatorHarness_endHoistingFindNavigator_endingActiveSession___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _findNavigatorView];
  [v2 frame];
  double v4 = v3;

  CGAffineTransformMakeTranslation(&v15, 0.0, -v4);
  v5 = [*(id *)(a1 + 32) _findNavigatorView];
  CGAffineTransform v14 = v15;
  [v5 setTransform:&v14];

  if (*(unsigned char *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [WeakRetained contentOffset];
    double v8 = v7;
    id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [v9 contentOffset];
    double v11 = v4 + v10;
    id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    objc_msgSend(v12, "setContentOffset:", v8, v11);
  }
  return [*(id *)(a1 + 32) _sendPlacementUpdate];
}

uint64_t __72___UIFindNavigatorHarness_endHoistingFindNavigator_endingActiveSession___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _findNavigatorView];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end