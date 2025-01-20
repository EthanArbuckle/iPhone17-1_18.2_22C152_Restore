@interface ICScrollViewDelegateViewController
- (ICScrollViewKeyboardResizer)scrollViewResizer;
- (NotesBackgroundView)backgroundView;
- (UIScrollView)keyboardResizerScrollView;
- (UIScrollView)scrollView;
- (double)consumedBottomAreaForResizer:(id)a3;
- (double)topInsetForResizer:(id)a3;
- (void)setScrollViewResizer:(id)a3;
- (void)setupScrollViewKeyboardResizer;
- (void)viewDidLayoutSubviews;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ICScrollViewDelegateViewController

- (void)setupScrollViewKeyboardResizer
{
  v3 = [(ICScrollViewDelegateViewController *)self scrollViewResizer];

  if (!v3)
  {
    id v4 = (id)[objc_alloc(MEMORY[0x263F5B440]) initWithDelegate:self];
    [(ICScrollViewDelegateViewController *)self setScrollViewResizer:v4];
  }
}

- (void)viewDidLayoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)ICScrollViewDelegateViewController;
  [(ICScrollViewDelegateViewController *)&v24 viewDidLayoutSubviews];
  v3 = [(ICScrollViewDelegateViewController *)self scrollView];
  if (v3)
  {
    uint64_t v4 = [(ICScrollViewDelegateViewController *)self scrollViewResizer];
    if (v4)
    {
      v5 = (void *)v4;
      v6 = [(ICScrollViewDelegateViewController *)self scrollViewResizer];
      if ([v6 isAutoResizing])
      {

LABEL_9:
        goto LABEL_10;
      }
      if ([(ICScrollViewDelegateViewController *)self _appearState] == 2)
      {

LABEL_8:
        v5 = [(ICScrollViewDelegateViewController *)self scrollViewResizer];
        [v5 startAutoResizing];
        goto LABEL_9;
      }
      int v7 = [(ICScrollViewDelegateViewController *)self _appearState];

      if (v7 == 1) {
        goto LABEL_8;
      }
    }
  }
LABEL_10:
  if ([v3 contentInsetAdjustmentBehavior] == 2)
  {
    v8 = [(ICScrollViewDelegateViewController *)self scrollViewResizer];
    [(ICScrollViewDelegateViewController *)self topInsetForResizer:v8];
    double v10 = v9;

    [v3 contentInset];
    if (vabdd_f64(v10, v11) >= 0.00999999978)
    {
      [v3 contentInset];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      [v3 verticalScrollIndicatorInsets];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      objc_msgSend(v3, "setContentInset:", v10, v13, v15, v17);
      objc_msgSend(v3, "setVerticalScrollIndicatorInsets:", v10, v19, v21, v23);
    }
  }
}

- (ICScrollViewKeyboardResizer)scrollViewResizer
{
  return self->_scrollViewResizer;
}

- (void)setScrollViewResizer:(id)a3
{
}

- (UIScrollView)keyboardResizerScrollView
{
  objc_opt_class();
  v3 = [(ICScrollViewDelegateViewController *)self scrollView];
  uint64_t v4 = ICCheckedDynamicCast();

  return (UIScrollView *)v4;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(ICScrollViewDelegateViewController *)self scrollViewResizer];
  [v5 stopAutoResizing];

  v6.receiver = self;
  v6.super_class = (Class)ICScrollViewDelegateViewController;
  [(ICScrollViewDelegateViewController *)&v6 viewWillDisappear:v3];
}

- (NotesBackgroundView)backgroundView
{
  objc_opt_class();
  BOOL v3 = [(ICScrollViewDelegateViewController *)self view];
  uint64_t v4 = ICCheckedDynamicCast();

  return (NotesBackgroundView *)v4;
}

- (UIScrollView)scrollView
{
  char IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  objc_opt_class();
  uint64_t v4 = [(ICScrollViewDelegateViewController *)self backgroundView];
  v5 = [v4 contentView];
  objc_super v6 = v5;
  if (IsTextKit2Enabled)
  {
    int v7 = [v5 subviews];
    v8 = [v7 firstObject];
    double v9 = ICDynamicCast();
  }
  else
  {
    double v9 = ICDynamicCast();
  }

  return (UIScrollView *)v9;
}

- (double)consumedBottomAreaForResizer:(id)a3
{
  uint64_t v4 = [(ICScrollViewDelegateViewController *)self scrollView];
  double v5 = 0.0;
  if ([v4 contentInsetAdjustmentBehavior] == 2)
  {
    [(ICScrollViewDelegateViewController *)self ic_safeAreaDistanceFromBottom];
    double v5 = v6;
  }

  return v5;
}

- (double)topInsetForResizer:(id)a3
{
  uint64_t v4 = [(ICScrollViewDelegateViewController *)self scrollView];
  double v5 = 0.0;
  if ([v4 contentInsetAdjustmentBehavior] == 2)
  {
    [(ICScrollViewDelegateViewController *)self ic_safeAreaDistanceFromTop];
    double v5 = v6;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end