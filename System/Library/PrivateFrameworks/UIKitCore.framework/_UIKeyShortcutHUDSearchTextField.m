@interface _UIKeyShortcutHUDSearchTextField
- (BOOL)_suppressSoftwareKeyboard;
- (CGRect)clearButtonRectForBounds:(CGRect)a3;
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)rightViewRectForBounds:(CGRect)a3;
- (_UIKeyShortcutHUDSearchButton)searchButton;
- (_UIKeyShortcutHUDShortcutInputView)shortcutInputView;
- (id)preferredFocusEnvironments;
- (void)buildMenuWithBuilder:(id)a3;
- (void)setSearchButton:(id)a3;
- (void)setShortcutInputView:(id)a3;
@end

@implementation _UIKeyShortcutHUDSearchTextField

- (void)setShortcutInputView:(id)a3
{
  v5 = (_UIKeyShortcutHUDShortcutInputView *)a3;
  if (self->_shortcutInputView != v5)
  {
    objc_storeStrong((id *)&self->_shortcutInputView, a3);
    [(UITextField *)self setRightView:v5];
    [(UITextField *)self setRightViewMode:2];
  }
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[UIView systemLayoutSizeFittingSize:](self->_shortcutInputView, "systemLayoutSizeFittingSize:", a3.size.width, a3.size.height);
  double v8 = v7;
  double v10 = v9;
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGFloat v11 = CGRectGetWidth(v16) - v8 + -10.0;
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double v12 = (CGRectGetHeight(v17) - v10) * 0.5;
  double v13 = v11;
  double v14 = v8;
  double v15 = v10;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)_UIKeyShortcutHUDSearchTextField;
  -[UISearchTextField clearButtonRectForBounds:](&v21, sel_clearButtonRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIOffset:", -4.0, 0.0);
  UIUserInterfaceLayoutDirection v13 = [(UIView *)self effectiveUserInterfaceLayoutDirection];
  if (v12)
  {
    UIUserInterfaceLayoutDirection v14 = v13;
    [v12 UIOffsetValue];
    if (v14 == UIUserInterfaceLayoutDirectionRightToLeft) {
      double v15 = -v15;
    }
    double v5 = v5 + v15;
    double v7 = v7 + v16;
  }

  double v17 = v5;
  double v18 = v7;
  double v19 = v9;
  double v20 = v11;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  UIUserInterfaceLayoutDirection v8 = [(UIView *)self effectiveUserInterfaceLayoutDirection];
  double v9 = +[UIKeyShortcutHUDMetrics currentMetrics];
  [v9 searchButtonWidth];
  double v11 = v10 + -23.0;

  if (v8 == UIUserInterfaceLayoutDirectionRightToLeft) {
    double v12 = 8.0;
  }
  else {
    double v12 = v11;
  }
  if (v8 != UIUserInterfaceLayoutDirectionRightToLeft) {
    double v11 = 8.0;
  }
  v20.receiver = self;
  v20.super_class = (Class)_UIKeyShortcutHUDSearchTextField;
  -[UISearchTextField editingRectForBounds:](&v20, sel_editingRectForBounds_, x, y, width, height);
  double v15 = v12 + v14;
  double v17 = v16 - (v11 + v12);
  double v19 = v18 + 0.0;
  result.size.double height = v13;
  result.size.double width = v17;
  result.origin.double y = v19;
  result.origin.double x = v15;
  return result;
}

- (id)preferredFocusEnvironments
{
  self;
  id WeakRetained = objc_loadWeakRetained(&_currentHUDCollectionViewManager);
  if ([WeakRetained nextFocusUpdatePrefersTopSearchResult])
  {
    uint64_t v4 = [WeakRetained preferredFocusEnvironments];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIKeyShortcutHUDSearchTextField;
    uint64_t v4 = [(UIView *)&v7 preferredFocusEnvironments];
  }
  double v5 = (void *)v4;

  return v5;
}

- (BOOL)_suppressSoftwareKeyboard
{
  return 1;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIKeyShortcutHUDSearchTextField;
  [(UIResponder *)&v7 buildMenuWithBuilder:v4];
  double v5 = [v4 system];
  double v6 = +[UIMenuSystem contextSystem];

  if (v5 == v6)
  {
    [v4 removeMenuForIdentifier:@"com.apple.menu.share"];
    [v4 removeMenuForIdentifier:@"com.apple.menu.lookup"];
    [v4 removeMenuForIdentifier:@"com.apple.menu.autofill"];
  }
}

- (_UIKeyShortcutHUDSearchButton)searchButton
{
  return self->_searchButton;
}

- (void)setSearchButton:(id)a3
{
}

- (_UIKeyShortcutHUDShortcutInputView)shortcutInputView
{
  return self->_shortcutInputView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutInputView, 0);
  objc_storeStrong((id *)&self->_searchButton, 0);
}

@end