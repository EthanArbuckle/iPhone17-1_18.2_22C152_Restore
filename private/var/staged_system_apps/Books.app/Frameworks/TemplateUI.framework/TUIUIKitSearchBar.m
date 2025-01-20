@interface TUIUIKitSearchBar
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)shouldShowCancelButton;
- (TUIUIKitSearchBar)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setCancelText:(id)a3;
- (void)setFont:(id)a3;
- (void)setShouldShowCancelButton:(BOOL)a3;
- (void)setTextColor:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation TUIUIKitSearchBar

- (TUIUIKitSearchBar)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUIUIKitSearchBar;
  v3 = -[TUIUIKitSearchBar initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(TUIUIKitSearchBar *)v3 setSearchBarStyle:2];
    -[TUIUIKitSearchBar setContentInset:](v4, "setContentInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  }
  return v4;
}

- (BOOL)isEnabled
{
  return 1;
}

- (BOOL)isHighlighted
{
  return 0;
}

- (void)layoutSubviews
{
  v38.receiver = self;
  v38.super_class = (Class)TUIUIKitSearchBar;
  [(TUIUIKitSearchBar *)&v38 layoutSubviews];
  [(TUIUIKitSearchBar *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v11 = [(TUIUIKitSearchBar *)self searchField];
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = +[UIImage tui_imageNamed:@"search_glyph" inBundle:v12];
  v14 = [v13 imageWithRenderingMode:2];

  v15 = [v11 leftView];
  [v15 setImage:v14];
  [v15 frame];
  double v17 = v16;
  [v15 frame];
  double v19 = v18;
  [v14 size];
  double v21 = v20;
  [v14 size];
  [v15 setFrame:v17, v19, v21, v22];
  v23 = [(TUIUIKitSearchBar *)self tintColor];
  [v15 setTintColor:v23];

  [v11 frame];
  double x = v39.origin.x;
  double Width = CGRectGetWidth(v39);
  v40.origin.double x = v4;
  v40.origin.y = v6;
  v40.size.width = v8;
  v40.size.height = v10;
  [v11 setFrame:CGRectMake(x, 0.0, Width, CGRectGetHeight(v40))];
  v26 = [(TUIUIKitSearchBar *)self cancelButton];
  [v26 frame];
  CGFloat v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  v41.origin.double x = v4;
  v41.origin.y = v6;
  v41.size.width = v8;
  v41.size.height = v10;
  double v35 = CGRectGetWidth(v41);
  v42.origin.double x = v28;
  v42.origin.y = v30;
  v42.size.width = v32;
  v42.size.height = v34;
  double v36 = v35 - CGRectGetWidth(v42);
  v37 = [(TUIUIKitSearchBar *)self cancelButton];
  [v37 setFrame:v36, v30, v32, v34];
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIUIKitSearchBar *)self searchField];
  [v5 setFont:v4];
}

- (void)setTextColor:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIUIKitSearchBar *)self searchField];
  [v5 setTextColor:v4];
}

- (void)setTintColor:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TUIUIKitSearchBar;
  id v4 = a3;
  [(TUIUIKitSearchBar *)&v11 setTintColor:v4];
  -[TUIUIKitSearchBar setBarTintColor:](self, "setBarTintColor:", v4, v11.receiver, v11.super_class);
  id v5 = [(TUIUIKitSearchBar *)self searchField];
  CGFloat v6 = [v5 _clearButton];
  [v6 setTintColor:v4];

  double v7 = [(TUIUIKitSearchBar *)self searchField];
  CGFloat v8 = [v7 _clearButton];
  double v9 = [v8 imageForState:0];

  CGFloat v10 = [v9 imageWithRenderingMode:2];

  [(TUIUIKitSearchBar *)self setImage:v10 forSearchBarIcon:1 state:0];
}

- (void)setCancelText:(id)a3
{
  id v4 = a3;
  [(TUIUIKitSearchBar *)self _setCancelButtonText:v4];
  id v5 = [(TUIUIKitSearchBar *)self cancelButton];
  [v5 setTitle:v4 forState:0];

  CGFloat v6 = [(TUIUIKitSearchBar *)self cancelButton];
  [v6 sizeToFit];

  double v7 = [(TUIUIKitSearchBar *)self text];
  id v8 = [v7 length];

  if (v8)
  {
    id v9 = [(TUIUIKitSearchBar *)self cancelButton];
    [v9 setEnabled:1];
  }
}

- (BOOL)shouldShowCancelButton
{
  return self->_shouldShowCancelButton;
}

- (void)setShouldShowCancelButton:(BOOL)a3
{
  self->_shouldShowCancelButton = a3;
}

@end