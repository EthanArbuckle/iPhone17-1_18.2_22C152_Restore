@interface TVCollectionViewLockupCell
@end

@implementation TVCollectionViewLockupCell

void __80___TVCollectionViewLockupCell_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && [WeakRetained isFocused])
  {
    v3 = [v2 _selectingView];
    [v2 _focusableContentMargins];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    [v2 frame];
    double v11 = v10;
    if (v3)
    {
      [v3 cellMetrics];
      double v12 = *((double *)&v13 + 1);
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      double v12 = 0.0;
      long long v13 = 0u;
    }
    objc_msgSend(v2, "_setFocusableContentMargins:", v5, v7, v11 - v12, v9, v13, v14, v15, v16, v17, v18, v19, v20, v21);
  }
}

@end