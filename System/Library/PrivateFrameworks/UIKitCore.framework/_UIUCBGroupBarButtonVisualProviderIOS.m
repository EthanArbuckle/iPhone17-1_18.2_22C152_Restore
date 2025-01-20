@interface _UIUCBGroupBarButtonVisualProviderIOS
+ (id)darkKeyboardProvider;
+ (id)lightKeyboardProvider;
- (BOOL)isEqual:(id)a3;
- (BOOL)lightKeyboard;
- (BOOL)shouldLift;
- (CGPoint)menuAnchorPoint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)imageSymbolConfiguration;
- (id)tintColor;
- (int64_t)_securePasteButtonSite;
- (void)configureButton:(id)a3 withAppearanceDelegate:(id)a4 fromBarItem:(id)a5;
- (void)setLightKeyboard:(BOOL)a3;
- (void)setTintColor:(id)a3;
- (void)updateButton:(id)a3 forSelectedState:(BOOL)a4;
- (void)updateButton:(id)a3 toUseButtonShapes:(BOOL)a4;
@end

@implementation _UIUCBGroupBarButtonVisualProviderIOS

+ (id)lightKeyboardProvider
{
  v2 = objc_alloc_init((Class)a1);
  v2[80] = 1;
  return v2;
}

+ (id)darkKeyboardProvider
{
  v2 = objc_alloc_init((Class)a1);
  v2[80] = 0;
  return v2;
}

- (int64_t)_securePasteButtonSite
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIUCBGroupBarButtonVisualProviderIOS;
  if ([(_UIButtonBarButtonVisualProvider *)&v12 isEqual:v4])
  {
    v5 = (UIColor **)v4;
    v6 = v5;
    if (*((unsigned __int8 *)v5 + 80) != self->_lightKeyboard) {
      goto LABEL_9;
    }
    v7 = v5[11];
    tintColor = self->_tintColor;
    if (v7 == tintColor)
    {
      char v10 = 1;
      goto LABEL_12;
    }
    if (!v7 || tintColor == 0) {
LABEL_9:
    }
      char v10 = 0;
    else {
      char v10 = -[UIColor isEqual:](v7, "isEqual:");
    }
LABEL_12:

    goto LABEL_13;
  }
  char v10 = 0;
LABEL_13:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIUCBGroupBarButtonVisualProviderIOS;
  id v4 = [(_UIButtonBarButtonVisualProvider *)&v6 copyWithZone:a3];
  *((unsigned char *)v4 + 80) = self->_lightKeyboard;
  objc_storeStrong((id *)v4 + 11, self->_tintColor);
  return v4;
}

- (void)updateButton:(id)a3 forSelectedState:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  if (v4)
  {
    objc_super v6 = +[UIColor systemBlueColor];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._barButtonItem);
    char v8 = [WeakRetained isKeyboardItem];

    if ((v8 & 1) != 0 || (id v9 = objc_loadWeakRetained((id *)&self->_appearanceDelegate), v9, !v9))
    {
      objc_super v6 = 0;
    }
    else
    {
      id v10 = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
      objc_super v6 = [v10 tintColor];
    }
  }
  [(UIButton *)self->super._contentButton setTintColor:v6];
}

- (id)imageSymbolConfiguration
{
  p_appearanceDelegate = &self->_appearanceDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  if (WeakRetained
    && (BOOL v4 = WeakRetained,
        id v5 = objc_loadWeakRetained((id *)p_appearanceDelegate),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    id v7 = objc_loadWeakRetained((id *)p_appearanceDelegate);
    char v8 = [v7 imageSymbolConfiguration];
  }
  else
  {
    char v8 = 0;
  }
  return v8;
}

- (void)updateButton:(id)a3 toUseButtonShapes:(BOOL)a4
{
}

- (void)configureButton:(id)a3 withAppearanceDelegate:(id)a4 fromBarItem:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  objc_storeWeak((id *)&self->_appearanceDelegate, v10);
  v28.receiver = self;
  v28.super_class = (Class)_UIUCBGroupBarButtonVisualProviderIOS;
  [(_UIUCBBarButtonVisualProviderIOS *)&v28 configureButton:v8 withAppearanceDelegate:v10 fromBarItem:v9];

  if (!self->_selectionBackgroundView)
  {
    id v11 = objc_alloc_init(_UIUCBKBSelectionBackground);
    selectionBackgroundView = self->_selectionBackgroundView;
    self->_selectionBackgroundView = v11;

    [(UIView *)self->_selectionBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_selectionBackgroundView setUserInteractionEnabled:0];
    [(_UIUCBKBSelectionBackground *)self->_selectionBackgroundView setShowButtonShape:0];
    v13 = self->_selectionBackgroundView;
    if (self->super._contentButton) {
      objc_msgSend(v8, "insertSubview:below:", v13);
    }
    else {
      [v8 addSubview:v13];
    }
    v14 = [(UIView *)self->_selectionBackgroundView leadingAnchor];
    v15 = [v8 leadingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    [v16 setActive:1];

    v17 = [(UIView *)self->_selectionBackgroundView trailingAnchor];
    v18 = [v8 trailingAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    [v19 setActive:1];

    v20 = [(UIView *)self->_selectionBackgroundView topAnchor];
    v21 = [v8 topAnchor];
    v22 = [v20 constraintEqualToAnchor:v21 constant:6.0];

    LODWORD(v23) = 1144750080;
    [v22 setPriority:v23];
    [v22 setActive:1];
    v24 = [(UIView *)self->_selectionBackgroundView bottomAnchor];
    v25 = [v8 bottomAnchor];
    v26 = [v24 constraintEqualToAnchor:v25 constant:-6.0];

    LODWORD(v27) = 1144750080;
    [v26 setPriority:v27];
    [v26 setActive:1];
  }
}

- (BOOL)shouldLift
{
  selectionBackgroundView = self->_selectionBackgroundView;
  if (selectionBackgroundView) {
    LOBYTE(selectionBackgroundView) = [(_UIUCBKBSelectionBackground *)selectionBackgroundView showButtonShape];
  }
  return (char)selectionBackgroundView;
}

- (CGPoint)menuAnchorPoint
{
  v22.receiver = self;
  v22.super_class = (Class)_UIUCBGroupBarButtonVisualProviderIOS;
  [(_UIUCBBarButtonVisualProviderIOS *)&v22 menuAnchorPoint];
  double v4 = v3;
  double v6 = v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._barButtonItem);
  uint64_t v8 = [WeakRetained tag];

  if (v8 == 1735287116)
  {
    id v9 = [(UIView *)self->super.super._button superview];
    [(UIView *)self->super.super._button center];
    double v11 = v10;
    double v13 = v12;
    v14 = [(UIView *)self->super.super._button window];
    objc_msgSend(v9, "convertPoint:toView:", v14, v11, v13);
    double v16 = v15;

    v17 = [(UIView *)self->super.super._button window];
    [v17 bounds];
    double MidX = CGRectGetMidX(v24);

    double v4 = 0.0;
    if (v16 <= MidX)
    {
      [(UIView *)self->super.super._button bounds];
      double v4 = v19;
    }
  }
  double v20 = v4;
  double v21 = v6;
  result.y = v21;
  result.x = v20;
  return result;
}

- (id)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (BOOL)lightKeyboard
{
  return self->_lightKeyboard;
}

- (void)setLightKeyboard:(BOOL)a3
{
  self->_lightKeyboard = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_destroyWeak((id *)&self->_appearanceDelegate);
  objc_storeStrong((id *)&self->_selectionBackgroundView, 0);
}

@end