@interface UICompatibilityPredictiveViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)hidesExpandableButton;
- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4;
- (BOOL)requiresKeyboard;
- (NSArray)displayedCandidates;
- (UIView)customView;
- (double)preferredHeightForTraitCollection:(id)a3;
- (void)setCustomView:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation UICompatibilityPredictiveViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  return self->_customView != 0;
}

- (BOOL)hidesExpandableButton
{
  return 0;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:a3];
  return result;
}

- (NSArray)displayedCandidates
{
  return 0;
}

- (BOOL)requiresKeyboard
{
  return 1;
}

- (void)setCustomView:(id)a3
{
  v5 = (UIView *)a3;
  customView = self->_customView;
  if (customView != v5)
  {
    v8 = v5;
    [(UIView *)customView removeFromSuperview];
    objc_storeStrong((id *)&self->_customView, a3);
    v5 = v8;
    if (v8)
    {
      v7 = [(UIViewController *)self view];
      [v7 addSubview:v8];

      v5 = v8;
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)UICompatibilityPredictiveViewController;
  [(UIViewController *)&v23 viewDidLayoutSubviews];
  v3 = [(UICompatibilityPredictiveViewController *)self customView];

  if (v3)
  {
    v4 = [(UIViewController *)self view];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;

    double v11 = *MEMORY[0x1E4F1DAD8];
    double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    v13 = [(UICompatibilityPredictiveViewController *)self customView];
    objc_msgSend(v13, "setFrame:", v11, v12, v8, 36.0);

    v14 = [(UICompatibilityPredictiveViewController *)self customView];
    [v14 frame];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v21 = round(v6 + (v10 - v19) * 0.5);
    v22 = [(UICompatibilityPredictiveViewController *)self customView];
    objc_msgSend(v22, "setFrame:", v16, v21, v18, v20);
  }
}

- (UIView)customView
{
  return self->_customView;
}

- (void).cxx_destruct
{
}

@end