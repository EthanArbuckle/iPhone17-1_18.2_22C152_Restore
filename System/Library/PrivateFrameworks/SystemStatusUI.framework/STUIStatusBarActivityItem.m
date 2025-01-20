@interface STUIStatusBarActivityItem
- (BOOL)_enableForType:(int64_t)a3;
- (STUIStatusBarActivityIndicator)activityIndicator;
- (UIEdgeInsets)activityIndicatorAlignmentRectInsets;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)dependentEntryKeys;
- (void)_create_activityIndicator;
- (void)setActivityIndicator:(id)a3;
@end

@implementation STUIStatusBarActivityItem

- (id)dependentEntryKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4FA96F0]];
}

- (void).cxx_destruct
{
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 dataChanged] & 1) != 0 || objc_msgSend(v6, "styleAttributesChanged"))
  {
    v8 = [v6 data];
    v9 = [v8 activityEntry];
    uint64_t v10 = [v9 type];

    LODWORD(v9) = [(STUIStatusBarActivityItem *)self _enableForType:v10];
    v11 = [(STUIStatusBarActivityItem *)self activityIndicator];
    v12 = v11;
    if (v9)
    {
      BOOL v13 = (v10 & 2) == 0;
      v14 = [v6 styleAttributes];
      [v14 iconScale];
      double v16 = v15;

      uint64_t v17 = 7;
      if (v16 > 1.0) {
        uint64_t v17 = 12;
      }
      uint64_t v18 = 6;
      if (v16 > 1.0) {
        uint64_t v18 = 11;
      }
      BOOL v19 = (v10 & 1) == 0;
      if (v10) {
        uint64_t v20 = v17;
      }
      else {
        uint64_t v20 = v18;
      }
      if (v19) {
        v21 = (double *)((char *)&unk_1D7ED6770 + 8 * v13);
      }
      else {
        v21 = &dbl_1D7ED6760[v13];
      }
      double v22 = *v21;
      if (v20 == [v12 activityIndicatorViewStyle])
      {
        [v12 setActivityIndicatorViewStyle:v20];
        [v12 setAnimationDuration:v22];
      }
      else
      {
        char v23 = [v6 styleAttributesChanged];
        [v12 setActivityIndicatorViewStyle:v20];
        [v12 setAnimationDuration:v22];
        if ((v23 & 1) == 0)
        {
          v24 = [(STUIStatusBarItem *)self statusBar];
          v25 = [v24 styleAttributes];
          [v12 applyStyleAttributes:v25];
        }
      }
      [v12 startAnimating];
    }
    else
    {
      [v11 stopAnimating];
      [v7 setEnabled:0];
    }
  }
  v28.receiver = self;
  v28.super_class = (Class)STUIStatusBarActivityItem;
  v26 = [(STUIStatusBarItem *)&v28 applyUpdate:v6 toDisplayItem:v7];

  return v26;
}

- (STUIStatusBarActivityIndicator)activityIndicator
{
  activityIndicator = self->_activityIndicator;
  if (!activityIndicator)
  {
    [(STUIStatusBarActivityItem *)self _create_activityIndicator];
    activityIndicator = self->_activityIndicator;
  }
  return activityIndicator;
}

- (void)_create_activityIndicator
{
  v3 = [STUIStatusBarActivityIndicator alloc];
  v4 = -[STUIStatusBarActivityIndicator initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v4;

  [(STUIStatusBarActivityIndicator *)self->_activityIndicator setActivityIndicatorViewStyle:6];
  [(STUIStatusBarActivityItem *)self activityIndicatorAlignmentRectInsets];
  id v6 = self->_activityIndicator;
  -[STUIStatusBarActivityIndicator setAlignmentRectInsets:](v6, "setAlignmentRectInsets:");
}

- (UIEdgeInsets)activityIndicatorAlignmentRectInsets
{
  double v2 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)_enableForType:(int64_t)a3
{
  return 1;
}

- (void)setActivityIndicator:(id)a3
{
}

void __81__STUIStatusBarActivityItem_Split_additionAnimationForDisplayItemWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  double v4 = *(void **)(a1 + 32);
  id v6 = a4;
  double v5 = [v4 activityView];
  [v5 startAnimating];

  v6[2](v6, 1);
}

void __80__STUIStatusBarActivityItem_Split_removalAnimationForDisplayItemWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  double v4 = *(void **)(a1 + 32);
  id v5 = a4;
  id v6 = [v4 activityView];
  [v6 stopAnimatingWithCompletionHandler:v5];
}

@end