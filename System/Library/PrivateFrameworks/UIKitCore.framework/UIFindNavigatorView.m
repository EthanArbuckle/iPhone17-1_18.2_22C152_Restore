@interface UIFindNavigatorView
@end

@implementation UIFindNavigatorView

void __38___UIFindNavigatorView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 setAutocorrectionType:1];
  [v5 setAutocapitalizationType:0];
  [v5 setSmartInsertDeleteType:1];
  [v5 setSmartDashesType:1];
  [v5 setSmartQuotesType:1];
  [v5 setAcceptsInitialEmojiKeyboard:1];
  [*(id *)(a1 + 32) applyStyleToFieldIfNeeded:v5];
  v3 = [v5 traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (!v4) {
    [v5 setDisablePrediction:1];
  }
}

void __38___UIFindNavigatorView_initWithFrame___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained findNavigatorDelegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 findNavigator:v3 didInvokeReplaceReplacingAll:0];
}

void __38___UIFindNavigatorView_initWithFrame___block_invoke_3(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained findNavigatorDelegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 findNavigator:v3 didInvokeReplaceReplacingAll:1];
}

void __38___UIFindNavigatorView_initWithFrame___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained findNavigatorDelegate];
  [v2 findNavigator:*(void *)(a1 + 32) didInvokeNextResultInDirection:1];
}

void __38___UIFindNavigatorView_initWithFrame___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained findNavigatorDelegate];
  [v2 findNavigator:*(void *)(a1 + 32) didInvokeNextResultInDirection:0];
}

void __46___UIFindNavigatorView_suggestedFindMenuItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleSearchMenuItem:v3];
}

void __38___UIFindNavigatorView_layoutSubviews__block_invoke(uint64_t a1, void *a2, double a3)
{
  double v4 = *(double *)(a1 + 32);
  double v5 = *(double *)(a1 + 40);
  id v6 = a2;
  objc_msgSend(v6, "setFrame:", a3, 0.0, v4, v5);
  [v6 frame];
  CGRect v9 = CGRectInset(v8, 0.0, 4.0);
  objc_msgSend(v6, "setFrame:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
}

@end