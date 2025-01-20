@interface _UIUCBPopoverBarButtonVisualProviderIOS
- (BOOL)isEqual:(id)a3;
- (UIColor)selectionBackgroundTintColor;
- (UIColor)selectionTintColor;
- (_UIUCBPopoverBarButtonVisualProviderIOS)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_securePasteButtonSite;
- (unint64_t)hash;
- (void)configureButton:(id)a3 withAppearanceDelegate:(id)a4 fromBarItem:(id)a5;
- (void)setSelectionBackgroundTintColor:(id)a3;
- (void)setSelectionTintColor:(id)a3;
- (void)updateButton:(id)a3 forSelectedState:(BOOL)a4;
@end

@implementation _UIUCBPopoverBarButtonVisualProviderIOS

- (_UIUCBPopoverBarButtonVisualProviderIOS)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIUCBPopoverBarButtonVisualProviderIOS;
  v2 = [(_UIUCBPopoverBarButtonVisualProviderIOS *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[UIColor whiteColor];
    selectionTintColor = v2->_selectionTintColor;
    v2->_selectionTintColor = (UIColor *)v3;

    uint64_t v5 = +[UIColor colorWithRed:0.0901960784 green:0.494117647 blue:0.984313725 alpha:1.0];
    selectionBackgroundTintColor = v2->_selectionBackgroundTintColor;
    v2->_selectionBackgroundTintColor = (UIColor *)v5;
  }
  return v2;
}

- (int64_t)_securePasteButtonSite
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIUCBPopoverBarButtonVisualProviderIOS;
  id v4 = [(_UIButtonBarButtonVisualProvider *)&v6 copyWithZone:a3];
  [v4 setSelectionBackgroundTintColor:self->_selectionBackgroundTintColor];
  [v4 setSelectionTintColor:self->_selectionTintColor];
  return v4;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)_UIUCBPopoverBarButtonVisualProviderIOS;
  unint64_t v3 = [(_UIButtonBarButtonVisualProvider *)&v6 hash];
  unint64_t v4 = [(UIColor *)self->_selectionBackgroundTintColor hash] ^ v3;
  return v4 ^ [(UIColor *)self->_selectionTintColor hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIUCBPopoverBarButtonVisualProviderIOS;
  if ([(_UIButtonBarButtonVisualProvider *)&v12 isEqual:v4])
  {
    uint64_t v5 = v4;
    selectionTintColor = self->_selectionTintColor;
    if (selectionTintColor == (UIColor *)v5[10]) {
      char v7 = 1;
    }
    else {
      char v7 = -[UIColor isEqual:](selectionTintColor, "isEqual:");
    }
    selectionBackgroundTintColor = self->_selectionBackgroundTintColor;
    if (selectionBackgroundTintColor == (UIColor *)v5[9]) {
      char v10 = 1;
    }
    else {
      char v10 = -[UIColor isEqual:](selectionBackgroundTintColor, "isEqual:");
    }
    char v8 = v7 & v10;
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)configureButton:(id)a3 withAppearanceDelegate:(id)a4 fromBarItem:(id)a5
{
  id v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_UIUCBPopoverBarButtonVisualProviderIOS;
  [(_UIUCBBarButtonVisualProviderIOS *)&v25 configureButton:v8 withAppearanceDelegate:a4 fromBarItem:a5];
  if (!self->_selectionBackgroundView)
  {
    v9 = objc_alloc_init(UIView);
    selectionBackgroundView = self->_selectionBackgroundView;
    self->_selectionBackgroundView = v9;

    [(UIView *)self->_selectionBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_selectionBackgroundView setUserInteractionEnabled:0];
    [(UIView *)self->_selectionBackgroundView setBackgroundColor:self->_selectionBackgroundTintColor];
    [(UIView *)self->_selectionBackgroundView _setContinuousCornerRadius:2.0];
    int v11 = [v8 isSelected];
    double v12 = 0.0;
    if (v11) {
      double v12 = 1.0;
    }
    [(UIView *)self->_selectionBackgroundView setAlpha:v12];
    [v8 insertSubview:self->_selectionBackgroundView below:self->super._contentButton];
    v13 = [(UIView *)self->_selectionBackgroundView leadingAnchor];
    v14 = [v8 leadingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    [v15 setActive:1];

    v16 = [(UIView *)self->_selectionBackgroundView trailingAnchor];
    v17 = [v8 trailingAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    [v18 setActive:1];

    v19 = [(UIView *)self->_selectionBackgroundView topAnchor];
    v20 = [v8 topAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    [v21 setActive:1];

    v22 = [(UIView *)self->_selectionBackgroundView bottomAnchor];
    v23 = [v8 bottomAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    [v24 setActive:1];
  }
}

- (void)updateButton:(id)a3 forSelectedState:(BOOL)a4
{
  if (a4) {
    selectionTintColor = self->_selectionTintColor;
  }
  else {
    selectionTintColor = 0;
  }
  contentButton = self->super._contentButton;
  id v7 = a3;
  [(UIButton *)contentButton setTintColor:selectionTintColor];
  int v8 = [v7 isSelected];

  double v9 = 0.0;
  if (v8) {
    double v9 = 1.0;
  }
  selectionBackgroundView = self->_selectionBackgroundView;
  [(UIView *)selectionBackgroundView setAlpha:v9];
}

- (UIColor)selectionBackgroundTintColor
{
  return self->_selectionBackgroundTintColor;
}

- (void)setSelectionBackgroundTintColor:(id)a3
{
}

- (UIColor)selectionTintColor
{
  return self->_selectionTintColor;
}

- (void)setSelectionTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionTintColor, 0);
  objc_storeStrong((id *)&self->_selectionBackgroundTintColor, 0);
  objc_storeStrong((id *)&self->_selectionBackgroundView, 0);
}

@end