@interface SBPrototypeAdvancedActivityElementViewProvider
- (BOOL)_canShowWhileLocked;
- (BOOL)handleElementViewEvent:(int64_t)a3;
- (BOOL)hasActivityBehavior;
- (CGSize)sizeThatFitsSize:(CGSize)a3 forProvidedView:(id)a4 inLayoutMode:(int64_t)a5;
- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)result maximumOutsets:(NSDirectionalEdgeInsets)a5;
- (NSString)elementIdentifier;
- (SAElementHosting)elementHost;
- (SAUILayoutHosting)layoutHost;
- (SBPrototypeAdvancedActivityElementViewProvider)init;
- (UIColor)keyColor;
- (UIView)leadingView;
- (UIView)trailingView;
- (id)_currentTrailingTitle;
- (id)_newTrailingLabel;
- (int64_t)layoutMode;
- (int64_t)maximumSupportedLayoutMode;
- (int64_t)minimumSupportedLayoutMode;
- (int64_t)preferredLayoutMode;
- (void)_decrementLayoutMode;
- (void)_incrementLayoutMode;
- (void)_requestSignificantTransition;
- (void)_updateLabel;
- (void)_updateLabel:(id)a3 forLayoutMode:(int64_t)a4;
- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5;
- (void)layoutHostContainerViewWillLayoutSubviews:(id)a3;
- (void)setElementHost:(id)a3;
- (void)setLayoutHost:(id)a3;
- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4;
@end

@implementation SBPrototypeAdvancedActivityElementViewProvider

- (SBPrototypeAdvancedActivityElementViewProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBPrototypeAdvancedActivityElementViewProvider;
  result = [(SBPrototypeAdvancedActivityElementViewProvider *)&v3 init];
  if (result) {
    result->_preferredLayoutMode = 2;
  }
  return result;
}

- (NSString)elementIdentifier
{
  return (NSString *)@"prototype advanced star activity";
}

- (BOOL)hasActivityBehavior
{
  return 1;
}

- (BOOL)handleElementViewEvent:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      [(SBPrototypeAdvancedActivityElementViewProvider *)self _requestSignificantTransition];
      return 1;
    case 2:
      [(SBPrototypeAdvancedActivityElementViewProvider *)self _decrementLayoutMode];
      return 1;
    case 1:
      [(SBPrototypeAdvancedActivityElementViewProvider *)self _incrementLayoutMode];
      return 1;
  }
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIView)leadingView
{
  leadingView = self->_leadingView;
  if (!leadingView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v5 = (void *)MEMORY[0x1E4F42A80];
    v6 = (void *)MEMORY[0x1E4F42A98];
    v7 = [MEMORY[0x1E4F428B8] systemGreenColor];
    v8 = [v6 configurationWithHierarchicalColor:v7];
    v9 = [v5 systemImageNamed:@"star.circle" withConfiguration:v8];
    v10 = (UIView *)[v4 initWithImage:v9];
    v11 = self->_leadingView;
    self->_leadingView = v10;

    leadingView = self->_leadingView;
  }
  return leadingView;
}

- (UIView)trailingView
{
  trailingView = self->_trailingView;
  if (!trailingView)
  {
    id v4 = [(SBPrototypeAdvancedActivityElementViewProvider *)self _newTrailingLabel];
    v5 = self->_trailingView;
    self->_trailingView = v4;

    [(SBPrototypeAdvancedActivityElementViewProvider *)self _updateLabel];
    trailingView = self->_trailingView;
  }
  return trailingView;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  self->_layoutMode = a3;
}

- (int64_t)minimumSupportedLayoutMode
{
  return 1;
}

- (int64_t)maximumSupportedLayoutMode
{
  return 3;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)result maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  CGFloat top = result.top;
  if (a3 == 3)
  {
    CGFloat trailing = a5.trailing;
    CGFloat leading = a5.leading;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    objc_msgSend(WeakRetained, "edgeOutsetsForSize:", 1.79769313e308, 112.0);
    CGFloat bottom = v9;

    result.CGFloat leading = leading;
    result.CGFloat trailing = trailing;
  }
  else
  {
    CGFloat bottom = result.bottom;
  }
  double v11 = top;
  double v12 = bottom;
  result.CGFloat bottom = v12;
  result.CGFloat top = v11;
  return result;
}

- (CGSize)sizeThatFitsSize:(CGSize)a3 forProvidedView:(id)a4 inLayoutMode:(int64_t)a5
{
  double height = a3.height;
  double width = a3.width;
  double v9 = (UIView *)a4;
  v10 = v9;
  double v11 = *MEMORY[0x1E4F1DB30];
  double v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v9 && self->_trailingView == v9)
  {
    id v13 = [(SBPrototypeAdvancedActivityElementViewProvider *)self _newTrailingLabel];
    [(SBPrototypeAdvancedActivityElementViewProvider *)self _updateLabel:v13 forLayoutMode:a5];
    objc_msgSend(v13, "sizeThatFits:", width, height);
    double v11 = v14;
    double v12 = v15;
  }
  double v16 = v11;
  double v17 = v12;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (void)layoutHostContainerViewWillLayoutSubviews:(id)a3
{
  [a3 bounds];
  if (self->_layoutMode == 3)
  {
    CGFloat v8 = v4;
    CGFloat v9 = v5;
    CGFloat v10 = v6;
    CGFloat v11 = v7;
    -[UIView setFrame:](self->_leadingView, "setFrame:", 12.0, 12.0, 88.0, 88.0);
    [(UIView *)self->_trailingView sizeToFit];
    [(UIView *)self->_trailingView bounds];
    double Width = CGRectGetWidth(v14);
    v15.origin.x = v8;
    v15.origin.y = v9;
    v15.size.double width = v10;
    v15.size.double height = v11;
    -[UIView setFrame:](self->_trailingView, "setFrame:", CGRectGetMaxX(v15) - Width + -12.0, 12.0, Width, 88.0);
  }
  [(SBPrototypeAdvancedActivityElementViewProvider *)self _updateLabel];
}

- (UIColor)keyColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] colorWithRed:0.192 green:0.82 blue:0.345 alpha:1.0];
}

- (id)_currentTrailingTitle
{
  if (self->_layoutCondensed) {
    return @"⭐️ 📽️";
  }
  else {
    return @"Star Demo";
  }
}

- (void)_requestSignificantTransition
{
  self->_layoutCondensed ^= 1u;
  id v3 = [(SBPrototypeAdvancedActivityElementViewProvider *)self elementHost];
  if ([(SBPrototypeAdvancedActivityElementViewProvider *)self layoutMode] == 3
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v3 elementRequestsSignificantUpdateTransition:self];
  }
}

- (void)_incrementLayoutMode
{
  int64_t preferredLayoutMode = self->_preferredLayoutMode;
  if (preferredLayoutMode < [(SBPrototypeAdvancedActivityElementViewProvider *)self maximumSupportedLayoutMode])++self->_preferredLayoutMode; {
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  }
  [WeakRetained preferredLayoutModeDidInvalidateForLayoutSpecifier:self];
}

- (void)_decrementLayoutMode
{
  int64_t preferredLayoutMode = self->_preferredLayoutMode;
  if (preferredLayoutMode > [(SBPrototypeAdvancedActivityElementViewProvider *)self minimumSupportedLayoutMode])--self->_preferredLayoutMode; {
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  }
  [WeakRetained preferredLayoutModeDidInvalidateForLayoutSpecifier:self];
}

- (id)_newTrailingLabel
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [v3 setTextAlignment:2];
  double v4 = [MEMORY[0x1E4F428B8] systemGreenColor];
  [v3 setTextColor:v4];

  double v5 = [(SBPrototypeAdvancedActivityElementViewProvider *)self _currentTrailingTitle];
  [v3 setText:v5];

  return v3;
}

- (void)_updateLabel:(id)a3 forLayoutMode:(int64_t)a4
{
  id v10 = a3;
  double v6 = [(SBPrototypeAdvancedActivityElementViewProvider *)self _currentTrailingTitle];
  [v10 setText:v6];

  double v7 = (void *)MEMORY[0x1E4F43890];
  if (a4 == 3) {
    double v7 = (void *)MEMORY[0x1E4F438E8];
  }
  CGFloat v8 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*v7];
  CGFloat v9 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v8 size:0.0];
  [v10 setFont:v9];
}

- (void)_updateLabel
{
  id v3 = [(SBPrototypeAdvancedActivityElementViewProvider *)self trailingView];
  double v4 = self;
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      double v6 = v5;
    }
    else {
      double v6 = 0;
    }
  }
  else
  {
    double v6 = 0;
  }
  id v7 = v6;

  [(SBPrototypeAdvancedActivityElementViewProvider *)self _updateLabel:v7 forLayoutMode:self->_layoutMode];
}

- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5
{
  id v7 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __124__SBPrototypeAdvancedActivityElementViewProvider_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke;
  v9[3] = &unk_1E6AF7D20;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  [a5 animateAlongsideTransition:v9 completion:0];
}

uint64_t __124__SBPrototypeAdvancedActivityElementViewProvider_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutHostContainerViewWillLayoutSubviews:*(void *)(a1 + 40)];
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (int64_t)preferredLayoutMode
{
  return self->_preferredLayoutMode;
}

- (SAUILayoutHosting)layoutHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  return (SAUILayoutHosting *)WeakRetained;
}

- (void)setLayoutHost:(id)a3
{
}

- (SAElementHosting)elementHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementHost);
  return (SAElementHosting *)WeakRetained;
}

- (void)setElementHost:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_elementHost);
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
}

@end