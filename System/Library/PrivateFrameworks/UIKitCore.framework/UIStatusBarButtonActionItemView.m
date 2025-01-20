@interface UIStatusBarButtonActionItemView
- (BOOL)allowsUserInteraction;
- (BOOL)canBecomeFocused;
- (BOOL)extendsHitTestingFrame;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)selected;
- (BOOL)showsTouchWhenHighlighted;
- (BOOL)usesAdvancedActions;
- (CALayer)ringLayer;
- (CGRect)_contentsImageFrame;
- (double)updateContentsAndWidth;
- (id)_createButton;
- (id)highlightImage;
- (int64_t)buttonType;
- (void)_doubleTapButton:(id)a3;
- (void)_pressAndHoldButton:(id)a3;
- (void)_pressButton:(id)a3;
- (void)_triggerButtonWithAction:(int64_t)a3;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setLayerHighlightImage:(id)a3;
- (void)setRingLayer:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation UIStatusBarButtonActionItemView

- (BOOL)extendsHitTestingFrame
{
  return 0;
}

- (id)_createButton
{
  v3 = +[UIButton buttonWithType:0];
  [v3 addTarget:self action:sel__pressButton_ forControlEvents:64];
  objc_msgSend(v3, "setShowsTouchWhenHighlighted:", -[UIStatusBarButtonActionItemView showsTouchWhenHighlighted](self, "showsTouchWhenHighlighted"));
  if ([(UIStatusBarButtonActionItemView *)self extendsHitTestingFrame])
  {
    LODWORD(v4) = -0.5;
    [v3 setCharge:v4];
  }
  v5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__pressButton_];
  [(UITapGestureRecognizer *)v5 setAllowedPressTypes:&unk_1ED3F0F10];
  [(UIView *)self addGestureRecognizer:v5];
  [(UIView *)self addSubview:v3];
  if ([(UIStatusBarButtonActionItemView *)self usesAdvancedActions])
  {
    v6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__doubleTapButton_];
    [(UITapGestureRecognizer *)v6 setNumberOfTapsRequired:2];
    [(UIGestureRecognizer *)v6 setAllowedTouchTypes:&unk_1ED3F0F28];
    [v3 addGestureRecognizer:v6];
    v7 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:sel__pressAndHoldButton_];
    [(UIGestureRecognizer *)v7 setAllowedTouchTypes:&unk_1ED3F0F40];
    [v3 addGestureRecognizer:v7];
    v8 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:sel__pressAndHoldButton_];
    [(UIGestureRecognizer *)v8 setAllowedPressTypes:&unk_1ED3F0F58];
    [(UIView *)self addGestureRecognizer:v8];
  }
  return v3;
}

- (id)highlightImage
{
  return 0;
}

- (BOOL)allowsUserInteraction
{
  return 1;
}

- (double)updateContentsAndWidth
{
  v20.receiver = self;
  v20.super_class = (Class)UIStatusBarButtonActionItemView;
  [(UIStatusBarItemView *)&v20 updateContentsAndWidth];
  double v4 = v3;
  if (!self->_button)
  {
    if ([(UIStatusBarButtonActionItemView *)self allowsUserInteraction])
    {
      v5 = [(UIStatusBarButtonActionItemView *)self _createButton];
      button = self->_button;
      self->_button = v5;

      if ([(UIStatusBarButtonActionItemView *)self extendsHitTestingFrame])
      {
        v7 = [(UIStatusBarButtonActionItemView *)self _createButton];
        externalButton = self->_externalButton;
        self->_externalButton = v7;

        v9 = [(UIView *)self->_externalButton layer];
        [v9 setHitTestsAsOpaque:1];
      }
    }
  }
  if ([(UIStatusBarButtonActionItemView *)self selected]
    && [(UIStatusBarButtonActionItemView *)self showsTouchWhenHighlighted])
  {
    v10 = [(UIView *)self layer];
    v11 = v10;
    LODWORD(v12) = 1058642330;
  }
  else
  {
    v10 = [(UIView *)self layer];
    v11 = v10;
    LODWORD(v12) = 1.0;
  }
  [v10 setOpacity:v12];

  v13 = [(UIView *)self traitCollection];
  uint64_t v14 = [v13 userInterfaceIdiom];

  if (v14 == 3)
  {
    if ([(UIView *)self isFocused])
    {
      v15 = [(UIStatusBarButtonActionItemView *)self highlightImage];
      v16 = v15;
      if (v15)
      {
        v17 = [v15 image];

        if (v17) {
          [(UIStatusBarButtonActionItemView *)self setLayerHighlightImage:v16];
        }
      }
    }
    else
    {
      v18 = [(UIStatusBarButtonActionItemView *)self ringLayer];
      [v18 removeFromSuperlayer];

      [(UIStatusBarButtonActionItemView *)self setRingLayer:0];
    }
  }
  return v4;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)UIStatusBarButtonActionItemView;
  [(UIView *)&v5 layoutSubviews];
  [(UIView *)self bounds];
  -[UIButton setFrame:](self->_button, "setFrame:");
  if ([(UIStatusBarButtonActionItemView *)self extendsHitTestingFrame])
  {
    [(UIView *)self _touchSloppinessFactor];
    double v4 = v3;
    [(UIView *)self bounds];
    CGRect v7 = CGRectInset(v6, v4 * -10.0, 0.0);
    -[UIButton setFrame:](self->_externalButton, "setFrame:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
  }
}

- (void)_triggerButtonWithAction:(int64_t)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v9[0] = 0x1ED0ECCE0;
  CGRect v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[UIStatusBarButtonActionItemView buttonType](self, "buttonType"));
  v9[1] = 0x1ED16A0E0;
  v10[0] = v6;
  CGRect v7 = [NSNumber numberWithInteger:a3];
  v10[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v5 postNotificationName:0x1ED16A0C0 object:self userInfo:v8];
}

- (void)_pressButton:(id)a3
{
}

- (void)_doubleTapButton:(id)a3
{
  if ([a3 state] == 3)
  {
    [(UIStatusBarButtonActionItemView *)self _triggerButtonWithAction:1];
  }
}

- (void)_pressAndHoldButton:(id)a3
{
  if ([a3 state] == 1)
  {
    [(UIStatusBarButtonActionItemView *)self _triggerButtonWithAction:2];
  }
}

- (int64_t)buttonType
{
  return 0;
}

- (BOOL)showsTouchWhenHighlighted
{
  return 1;
}

- (BOOL)usesAdvancedActions
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIStatusBarButtonActionItemView;
  if (-[UIView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y))
  {
    char v8 = 1;
  }
  else if ([(UIStatusBarButtonActionItemView *)self extendsHitTestingFrame])
  {
    externalButton = self->_externalButton;
    -[UIView convertPoint:fromView:](externalButton, "convertPoint:fromView:", self, x, y);
    char v8 = -[UIView pointInside:withEvent:](externalButton, "pointInside:withEvent:", v7);
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIStatusBarButtonActionItemView;
  id v6 = a3;
  [(UIResponder *)&v7 pressesBegan:v6 withEvent:a4];
  LODWORD(a4) = _UIPressesContainsPressType(v6, 4);

  if (a4)
  {
    -[UIStatusBarButtonActionItemView setSelected:](self, "setSelected:", 1, v7.receiver, v7.super_class);
    [(UIStatusBarButtonActionItemView *)self updateContentsAndWidth];
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIStatusBarButtonActionItemView;
  id v6 = a3;
  [(UIResponder *)&v7 pressesChanged:v6 withEvent:a4];
  LODWORD(a4) = _UIPressesContainsPressType(v6, 4);

  if (a4)
  {
    -[UIStatusBarButtonActionItemView setSelected:](self, "setSelected:", 0, v7.receiver, v7.super_class);
    [(UIStatusBarButtonActionItemView *)self updateContentsAndWidth];
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIStatusBarButtonActionItemView;
  id v6 = a3;
  [(UIResponder *)&v7 pressesEnded:v6 withEvent:a4];
  LODWORD(a4) = _UIPressesContainsPressType(v6, 4);

  if (a4)
  {
    -[UIStatusBarButtonActionItemView setSelected:](self, "setSelected:", 0, v7.receiver, v7.super_class);
    [(UIStatusBarButtonActionItemView *)self updateContentsAndWidth];
  }
}

- (CGRect)_contentsImageFrame
{
  double v3 = [(UIStatusBarItemView *)self contentsImage];
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v6 = [v3 image];
  [v6 size];
  double v8 = v7;
  double v10 = v9;

  [(UIView *)self bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [(UIStatusBarItemView *)self foregroundStyle];
  [v19 scale];
  UIRectCenteredXInRectScale(v4, v5, v8, v10, v12, v14, v16, v18, v20);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  double v29 = v22;
  double v30 = v24;
  double v31 = v26;
  double v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (void)setLayerHighlightImage:(id)a3
{
  id v40 = a3;
  if (![(UIStatusBarItemView *)self legibilityStyle])
  {
    double v4 = [(UIStatusBarButtonActionItemView *)self ringLayer];

    if (!v4)
    {
      double v5 = [MEMORY[0x1E4F39BE8] layer];
      [(UIStatusBarButtonActionItemView *)self setRingLayer:v5];

      double v6 = *MEMORY[0x1E4F1DAD8];
      double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      double v8 = [v40 image];
      [v8 size];
      double v10 = v9;
      double v12 = v11;

      [(UIStatusBarButtonActionItemView *)self _contentsImageFrame];
      double v15 = v14 + v13 * 0.5;
      double v18 = v17 + v16 * 0.5;
      v19 = [(UIStatusBarItemView *)self foregroundStyle];
      [v19 scale];
      UIRectCenteredAboutPointScale(v6, v7, v10, v12, v15, v18, v20);
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;

      double v29 = [(UIStatusBarButtonActionItemView *)self ringLayer];
      objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

      [(UIView *)self contentScaleFactor];
      double v31 = v30;
      double v32 = [(UIStatusBarButtonActionItemView *)self ringLayer];
      [v32 setContentsScale:v31];

      v33 = [(UIStatusBarButtonActionItemView *)self ringLayer];
      v34 = [v40 image];
      v35 = [v34 imageWithRenderingMode:2];
      v36 = +[UIColor externalSystemTealColor];
      id v37 = [v35 _flatImageWithColor:v36];
      objc_msgSend(v33, "setContents:", objc_msgSend(v37, "CGImage"));

      v38 = [(UIView *)self layer];
      v39 = [(UIStatusBarButtonActionItemView *)self ringLayer];
      [v38 addSublayer:v39];
    }
  }
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (CALayer)ringLayer
{
  return self->_ringLayer;
}

- (void)setRingLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringLayer, 0);
  objc_storeStrong((id *)&self->_externalButton, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end