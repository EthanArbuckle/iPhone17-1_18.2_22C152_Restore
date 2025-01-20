@interface _TVSearchBar
+ (id)_listItemSelectedOverlayFillColor;
+ (id)_listItemTextColor;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBecomeFocused;
- (BOOL)hasText;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (UIActivityIndicatorView)activityIndicatorView;
- (UITextField)textField;
- (_TVSearchBar)initWithFrame:(CGRect)a3;
- (_TVSearchBarDelegate)delegate;
- (id)keyCommands;
- (void)_insertSpace:(id)a3;
- (void)_submit:(id)a3;
- (void)deleteBackward;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)insertText:(id)a3;
- (void)layoutSubviews;
- (void)setActivityIndicatorView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setText:(id)a3;
@end

@implementation _TVSearchBar

+ (id)_listItemTextColor
{
  if (_listItemTextColor___once != -1) {
    dispatch_once(&_listItemTextColor___once, &__block_literal_global_7);
  }
  v2 = [MEMORY[0x263F1C920] mainScreen];
  v3 = [v2 traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  v5 = &_listItemTextColor___lightThemeColor;
  if (v4 == 2) {
    v5 = &_listItemTextColor___darkThemeColor;
  }
  id v6 = (id)*v5;
  return v6;
}

+ (id)_listItemSelectedOverlayFillColor
{
  if (_listItemSelectedOverlayFillColor___once != -1) {
    dispatch_once(&_listItemSelectedOverlayFillColor___once, &__block_literal_global_3);
  }
  v2 = [MEMORY[0x263F1C920] mainScreen];
  v3 = [v2 traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  v5 = &_listItemSelectedOverlayFillColor___lightThemeColor;
  if (v4 == 2) {
    v5 = &_listItemSelectedOverlayFillColor___darkThemeColor;
  }
  id v6 = (id)*v5;
  return v6;
}

- (_TVSearchBar)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)_TVSearchBar;
  v3 = -[_TVSearchBar initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CA98]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    textField = v3->_textField;
    v3->_textField = (UITextField *)v5;

    [(UITextField *)v3->_textField setAdjustsFontForContentSizeCategory:1];
    [(UITextField *)v3->_textField setBorderStyle:3];
    v7 = v3->_textField;
    v8 = [(id)objc_opt_class() _listItemSelectedOverlayFillColor];
    [(UITextField *)v7 setBackgroundColor:v8];

    [(_TVSearchBar *)v3 addSubview:v3->_textField];
    v9 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x263F1C3D8]);
    activityIndicatorView = v3->_activityIndicatorView;
    v3->_activityIndicatorView = v9;

    v11 = v3->_activityIndicatorView;
    v12 = [(id)objc_opt_class() _listItemTextColor];
    [(UIActivityIndicatorView *)v11 setColor:v12];

    [(UIActivityIndicatorView *)v3->_activityIndicatorView setHidesWhenStopped:1];
    [(UIActivityIndicatorView *)v3->_activityIndicatorView stopAnimating];
    [(_TVSearchBar *)v3 addSubview:v3->_activityIndicatorView];
  }
  return v3;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  id v5 = [(_TVSearchBar *)self textField];
  [v5 setText:v4];
}

- (NSString)text
{
  v2 = [(_TVSearchBar *)self textField];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)_TVSearchBar;
  id v6 = a3;
  [(_TVSearchBar *)&v12 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  v7 = objc_msgSend(v6, "nextFocusedView", v12.receiver, v12.super_class);

  int v8 = [v7 isDescendantOfView:self];
  v9 = [(_TVSearchBar *)self textField];
  v10 = v9;
  if (v8)
  {
    [v9 setBackgroundColor:0];

    [(_TVSearchBar *)self becomeFirstResponder];
  }
  else
  {
    v11 = [(id)objc_opt_class() _listItemSelectedOverlayFillColor];
    [v10 setBackgroundColor:v11];

    [(_TVSearchBar *)self resignFirstResponder];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(UIView *)self tv_padding];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(UIView *)self tv_itemWidth];
  double v14 = fmax(v13, width - (v8 + v12));
  if (v13 == 0.0) {
    double v15 = v14;
  }
  else {
    double v15 = v13;
  }
  v16 = [(_TVSearchBar *)self textField];
  objc_msgSend(v16, "sizeThatFits:", v15, 0.0);
  double v18 = v17;

  double v19 = v12 + v8 + v15 + 8.0;
  double v20 = v10 + v6 + v18 + 24.0;
  result.height = v20;
  result.double width = v19;
  return result;
}

- (void)layoutSubviews
{
  [(_TVSearchBar *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(UIView *)self tv_padding];
  double v8 = v7;
  double v10 = v9;
  [(UIView *)self tv_itemWidth];
  double v12 = fmax(v11, v4 - (v8 + v10));
  if (v11 == 0.0) {
    double v13 = v12;
  }
  else {
    double v13 = v11;
  }
  double v14 = [(_TVSearchBar *)self textField];
  objc_msgSend(v14, "sizeThatFits:", v13, 0.0);
  double v16 = v15;

  CGFloat v17 = v13 + 8.0;
  CGFloat v18 = v16 + 24.0;
  float v19 = (v4 - v17) * 0.5;
  CGFloat v20 = floorf(v19);
  float v21 = (v6 - v18) * 0.5;
  CGFloat v22 = floorf(v21);
  v23 = [(_TVSearchBar *)self textField];
  objc_msgSend(v23, "setFrame:", v20, v22, v17, v18);

  v29.origin.x = v20;
  v29.origin.y = v22;
  v29.size.double width = v17;
  v29.size.height = v18;
  double MaxX = CGRectGetMaxX(v29);
  v30.origin.x = v20;
  v30.origin.y = v22;
  v30.size.double width = v17;
  v30.size.height = v18;
  double Height = CGRectGetHeight(v30);
  v31.origin.x = v20;
  v31.origin.y = v22;
  v31.size.double width = v17;
  v31.size.height = v18;
  double v26 = CGRectGetHeight(v31);
  id v27 = [(_TVSearchBar *)self activityIndicatorView];
  objc_msgSend(v27, "setFrame:", MaxX, 0.0, Height, v26);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)keyCommands
{
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  v9.receiver = self;
  v9.super_class = (Class)_TVSearchBar;
  double v4 = [(_TVSearchBar *)&v9 keyCommands];
  double v5 = (void *)[v3 initWithArray:v4];

  double v6 = [MEMORY[0x263F1C708] keyCommandWithInput:@"\r" modifierFlags:0 action:sel__submit_];
  [v5 addObject:v6];

  double v7 = [MEMORY[0x263F1C708] keyCommandWithInput:@" " modifierFlags:0 action:sel__insertSpace_];
  [v5 addObject:v7];

  return v5;
}

- (BOOL)hasText
{
  v2 = [(_TVSearchBar *)self text];
  uint64_t v3 = [v2 length];

  return v3 != 0;
}

- (void)insertText:(id)a3
{
  id v9 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
  double v5 = [(_TVSearchBar *)self text];
  if ([v5 length]) {
    [v4 appendString:v5];
  }
  [v4 appendString:v9];
  [(_TVSearchBar *)self setText:v4];
  double v6 = [(_TVSearchBar *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(_TVSearchBar *)self delegate];
    [v8 searchBarDidChangeText:self];
  }
}

- (void)deleteBackward
{
  if ([(_TVSearchBar *)self hasText])
  {
    uint64_t v3 = [(_TVSearchBar *)self text];
    objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - 1);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    [(_TVSearchBar *)self setText:v7];
    id v4 = [(_TVSearchBar *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      double v6 = [(_TVSearchBar *)self delegate];
      [v6 searchBarDidChangeText:self];
    }
  }
}

- (void)_submit:(id)a3
{
  id v4 = [(_TVSearchBar *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(_TVSearchBar *)self delegate];
    [v6 searchBarDidSubmit:self];
  }
}

- (void)_insertSpace:(id)a3
{
}

- (UITextField)textField
{
  return self->_textField;
}

- (_TVSearchBarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_TVSearchBarDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textField, 0);
}

@end