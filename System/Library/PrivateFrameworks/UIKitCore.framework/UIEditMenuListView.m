@interface UIEditMenuListView
@end

@implementation UIEditMenuListView

id __40___UIEditMenuListView__createDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  WeakRetained = (double *)objc_loadWeakRetained(v6);
  v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"_UIEditMenuListViewCell" forIndexPath:v8];

  uint64_t v12 = [WeakRetained axis];
  double v13 = 0.0;
  if (!v12) {
    double v13 = WeakRetained[52];
  }
  [v11 setMaximumContentWidth:v13];
  [v11 setItem:v7];

  return v11;
}

id __40___UIEditMenuListView__createDataSource__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  if ([v7 isEqualToString:@"_UIEditMenuListViewSeparator"])
  {
    id v9 = [v6 dequeueReusableSupplementaryViewOfKind:v7 withReuseIdentifier:@"_UIEditMenuListViewSeparator" forIndexPath:v8];
    if ([v8 section]) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = [v8 item] == 0;
    }
    [v9 setHidden:v10];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

id __43___UIEditMenuListView__reloadMenuAnimated___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [MEMORY[0x1E4F39B48] animationWithKeyPath:a1];
  [v3 setFromValue:a2];
  [v3 setDuration:0.25];
  v4 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v3 setTimingFunction:v4];

  [v3 setRemovedOnCompletion:1];
  return v3;
}

uint64_t __43___UIEditMenuListView__reloadMenuAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

@end