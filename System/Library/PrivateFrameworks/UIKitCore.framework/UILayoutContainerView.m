@interface UILayoutContainerView
- (BOOL)assertionActivationStateForType:(unint64_t)a3;
- (BOOL)backgroundColorIsDefault;
- (BOOL)usesInnerShadow;
- (BOOL)usesRoundedCorners;
- (UIColor)defaultBackgroundColor;
- (UILayoutContainerView)initWithCoder:(id)a3;
- (UILayoutContainerView)initWithFrame:(CGRect)a3;
- (UILayoutContainerViewDelegate)delegate;
- (id)_disableUserInteractionForReason:(id)a3;
- (id)_systemDefaultFocusGroupIdentifier;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_commonInit;
- (void)_installShadowViews;
- (void)_setFlagsFromDelegate:(id)a3;
- (void)_tearDownShadowViews;
- (void)_updateShadowViews;
- (void)addSubview:(id)a3;
- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setDefaultBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setUsesInnerShadow:(BOOL)a3;
- (void)setUsesRoundedCorners:(BOOL)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation UILayoutContainerView

- (void)addSubview:(id)a3
{
  shadowView = self->_shadowView;
  if (shadowView) {
    BOOL v4 = shadowView == a3;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)UILayoutContainerView;
    [(UIView *)&v5 addSubview:a3];
  }
  else
  {
    -[UIView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", a3);
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(UILayoutContainerView *)self _setFlagsFromDelegate:obj];
  }
}

- (void)_setFlagsFromDelegate:(id)a3
{
  id v4 = a3;
  *(unsigned char *)&self->_layoutContainerViewFlags = *(unsigned char *)&self->_layoutContainerViewFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    char v5 = 2;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)&self->_layoutContainerViewFlags = *(unsigned char *)&self->_layoutContainerViewFlags & 0xFD | v5;
  if (objc_opt_respondsToSelector()) {
    char v6 = 4;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_layoutContainerViewFlags = *(unsigned char *)&self->_layoutContainerViewFlags & 0xFB | v6;
  char v7 = objc_opt_respondsToSelector();

  if (v7) {
    char v8 = 8;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)&self->_layoutContainerViewFlags = *(unsigned char *)&self->_layoutContainerViewFlags & 0xF7 | v8;
}

- (UILayoutContainerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UILayoutContainerView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(UILayoutContainerView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v3 = [[_UIAssertionController alloc] initWithAssertionSubject:self];
  assertionController = self->_assertionController;
  self->_assertionController = v3;
}

- (void)willMoveToWindow:(id)a3
{
  if ((*(unsigned char *)&self->_layoutContainerViewFlags & 4) != 0)
  {
    p_delegate = &self->_delegate;
    id v4 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained _layoutContainerViewWillMoveToWindow:v4];
  }
}

- (void)dealloc
{
  [(UILayoutContainerView *)self _tearDownShadowViews];
  v3.receiver = self;
  v3.super_class = (Class)UILayoutContainerView;
  [(UIView *)&v3 dealloc];
}

- (void)_tearDownShadowViews
{
  [(UIView *)self->_shadowView removeFromSuperview];
  shadowView = self->_shadowView;
  self->_shadowView = 0;
}

- (void)setDefaultBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_defaultBackgroundColor, a3);
  id v5 = a3;
  [(UILayoutContainerView *)self setBackgroundColor:v5];

  *(unsigned char *)&self->_layoutContainerViewFlags |= 0x10u;
}

- (void)setBackgroundColor:(id)a3
{
  *(unsigned char *)&self->_layoutContainerViewFlags &= ~0x10u;
  v3.receiver = self;
  v3.super_class = (Class)UILayoutContainerView;
  [(UIView *)&v3 setBackgroundColor:a3];
}

- (void)setFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)UILayoutContainerView;
  -[UIView setFrame:](&v14, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self->_usesRoundedCorners)
  {
    [(UIView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    v12 = [(UIView *)self layer];
    v13 = [v12 mask];
    objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
  }
}

- (void)layoutSubviews
{
  if (self->_usesRoundedCorners)
  {
    [(UIView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v11 = [(UIView *)self layer];
    v12 = [v11 mask];
    objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);
  }
  if ((*(unsigned char *)&self->_layoutContainerViewFlags & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "__viewWillLayoutSubviews");
  }
  v14.receiver = self;
  v14.super_class = (Class)UILayoutContainerView;
  [(UIView *)&v14 layoutSubviews];
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UILayoutContainerView;
  [(UIView *)&v5 setSemanticContentAttribute:a3];
  if (*(unsigned char *)&self->_layoutContainerViewFlags)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained _layoutContainerViewSemanticContentAttributeChanged:self];
  }
}

- (UILayoutContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UILayoutContainerViewDelegate *)WeakRetained;
}

- (void)didMoveToWindow
{
  if ((*(unsigned char *)&self->_layoutContainerViewFlags & 8) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v3 = [(UIView *)self window];
    [WeakRetained _layoutContainerViewDidMoveToWindow:v3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)UILayoutContainerView;
  -[UIView setBounds:](&v10, sel_setBounds_);
  if (self->_usesRoundedCorners)
  {
    double v8 = [(UIView *)self layer];
    double v9 = [v8 mask];
    objc_msgSend(v9, "setFrame:", x, y, width, height);
  }
}

- (UILayoutContainerView)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UILayoutContainerView;
  objc_super v5 = [(UIView *)&v11 initWithCoder:v4];
  if (v5)
  {
    double v6 = [v4 decodeObjectForKey:@"UIDelegate"];
    objc_storeWeak((id *)&v5->_delegate, v6);
    [(UILayoutContainerView *)v5 _setFlagsFromDelegate:v6];
    if ([v4 decodeBoolForKey:@"backgroundColorIsDefault"]) {
      char v7 = 16;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&v5->_layoutContainerViewFlags = *(unsigned char *)&v5->_layoutContainerViewFlags & 0xEF | v7;
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultBackgroundColor"];
    defaultBackgroundColor = v5->_defaultBackgroundColor;
    v5->_defaultBackgroundColor = (UIColor *)v8;

    [(UILayoutContainerView *)v5 _commonInit];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UILayoutContainerView;
  [(UIView *)&v7 encodeWithCoder:v4];
  [v4 encodeBool:(*(unsigned char *)&self->_layoutContainerViewFlags >> 4) & 1 forKey:@"backgroundColorIsDefault"];
  defaultBackgroundColor = self->_defaultBackgroundColor;
  if (defaultBackgroundColor) {
    [v4 encodeObject:defaultBackgroundColor forKey:@"defaultBackgroundColor"];
  }
  double v6 = [(UILayoutContainerView *)self delegate];
  if (v6) {
    [v4 encodeConditionalObject:v6 forKey:@"UIDelegate"];
  }
}

- (BOOL)backgroundColorIsDefault
{
  return (*(unsigned char *)&self->_layoutContainerViewFlags >> 4) & 1;
}

- (void)setUsesRoundedCorners:(BOOL)a3
{
  if (self->_usesRoundedCorners != a3)
  {
    BOOL v3 = a3;
    self->_usesRoundedCorners = a3;
    objc_super v5 = [(UIView *)self layer];
    double v6 = v5;
    if (v3)
    {
      [v5 setCornerRadius:5.0];

      objc_super v7 = [(UIView *)self layer];
      [v7 setMasksToBounds:1];

      [(UIView *)self setOpaque:0];
    }
    else
    {
      [v5 setCornerRadius:0.0];

      uint64_t v8 = [(UIView *)self layer];
      [v8 setMasksToBounds:0];
    }
    [(UILayoutContainerView *)self _updateShadowViews];
  }
}

- (void)setUsesInnerShadow:(BOOL)a3
{
  if (self->_usesInnerShadow != a3)
  {
    self->_usesInnerShadow = a3;
    [(UILayoutContainerView *)self _updateShadowViews];
  }
}

- (void)_updateShadowViews
{
  if (self->_usesRoundedCorners && self->_usesInnerShadow) {
    [(UILayoutContainerView *)self _installShadowViews];
  }
  else {
    [(UILayoutContainerView *)self _tearDownShadowViews];
  }
}

- (void)_installShadowViews
{
  if (!self->_shadowView)
  {
    BOOL v3 = [UIImageView alloc];
    [(UIView *)self bounds];
    id v4 = -[UIImageView initWithFrame:](v3, "initWithFrame:");
    shadowView = self->_shadowView;
    self->_shadowView = v4;

    [(UIView *)self->_shadowView setAutoresizingMask:18];
    [(UIView *)self bounds];
    double v7 = v6;
    double v9 = v8;
    _UIImageWithName(@"UISheetViewButtonTableShadow.png");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_super v10 = _shadowImageInRectForSlice(v16, 0x24u, 0.0, 0.0, 5.0, 6.0, 0.0, 0.0, 5.0, 6.0);
    [(UIView *)self->_shadowView addSubview:v10];
    objc_super v11 = _shadowImageInRectForSlice(v16, 0x22u, 5.0, 0.0, v7 + -10.0, 4.0, 5.0, 0.0, 1.0, 4.0);

    [(UIView *)self->_shadowView addSubview:v11];
    v12 = _shadowImageInRectForSlice(v16, 0x21u, v7 + -5.0, 0.0, 5.0, 6.0, 6.0, 0.0, 5.0, 6.0);

    [(UIView *)self->_shadowView addSubview:v12];
    double v13 = v9 + -8.0;
    objc_super v14 = _shadowImageInRectForSlice(v16, 0x14u, 0.0, 6.0, 2.0, v13, 0.0, 6.0, 2.0, 1.0);

    [(UIView *)self->_shadowView addSubview:v14];
    v15 = _shadowImageInRectForSlice(v16, 0x11u, v7 + -2.0, 6.0, 2.0, v13, 9.0, 6.0, 2.0, 1.0);

    [(UIView *)self->_shadowView addSubview:v15];
    [(UILayoutContainerView *)self addSubview:self->_shadowView];
  }
}

- (id)_systemDefaultFocusGroupIdentifier
{
  BOOL v3 = [(UIView *)self _focusBehavior];
  char v4 = [v3 focusGroupContainmentBehavior];

  if (v4 < 0)
  {
    objc_super v5 = _UIFocusGroupIdentifierForInstance(self);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UILayoutContainerView;
    objc_super v5 = [(UIView *)&v7 _systemDefaultFocusGroupIdentifier];
  }
  return v5;
}

- (id)_disableUserInteractionForReason:(id)a3
{
  return [(_UIAssertionController *)self->_assertionController vendAssertionOfType:0 initialState:1 reason:a3];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  if ((*(unsigned char *)&self->_layoutContainerViewFlags & 0x20) != 0)
  {
    char v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UILayoutContainerView;
    char v4 = -[UIView hitTest:withEvent:](&v6, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  }
  return v4;
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  if (a3)
  {
    objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UILayoutContainerView.m", 364, @"Unknown _UIAssertionType %lu", a3);

    LOBYTE(v7) = 0;
  }
  else
  {
    return (*(unsigned char *)&self->_layoutContainerViewFlags >> 5) & 1;
  }
  return v7;
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  BOOL v5 = a3;
  if (pthread_main_np() == 1)
  {
    if (a4)
    {
LABEL_3:
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UILayoutContainerView.m", 379, @"Unknown _UIAssertionType %lu", a4);

      return;
    }
  }
  else
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UILayoutContainerView.m" lineNumber:371 description:@"Call must be made on main thread"];

    if (a4) {
      goto LABEL_3;
    }
  }
  if (v5) {
    char v9 = 32;
  }
  else {
    char v9 = 0;
  }
  *(unsigned char *)&self->_layoutContainerViewFlags = *(unsigned char *)&self->_layoutContainerViewFlags & 0xDF | v9;
}

- (BOOL)usesInnerShadow
{
  return self->_usesInnerShadow;
}

- (BOOL)usesRoundedCorners
{
  return self->_usesRoundedCorners;
}

- (UIColor)defaultBackgroundColor
{
  return self->_defaultBackgroundColor;
}

@end