@interface CarFocusableButton
+ (CarFocusableButton)buttonWithType:(int64_t)a3;
+ (id)button;
+ (id)closeButton;
- (BOOL)canBecomeFocused;
- (BOOL)modifiesBackgroundColor;
- (BOOL)showsEllipticalFocusIndicator;
- (CarFocusableButton)initWithFrame:(CGRect)a3;
- (UIColor)focusedBackgroundColor;
- (UIColor)focusedTintColor;
- (UIColor)nonFocusedBackgroundColor;
- (UIColor)nonFocusedTintColor;
- (id)_focusShapeLayer;
- (void)_commonInit;
- (void)_setNeedsUpdateAppearance;
- (void)_updateAppearance;
- (void)_updateColorSettings;
- (void)didMoveToWindow;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setAdjustsImageWhenDisabled:(BOOL)a3;
- (void)setAdjustsImageWhenHighlighted:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFocusedBackgroundColor:(id)a3;
- (void)setFocusedTintColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setModifiesBackgroundColor:(BOOL)a3;
- (void)setNonFocusedBackgroundColor:(id)a3;
- (void)setNonFocusedTintColor:(id)a3;
- (void)setShowsEllipticalFocusIndicator:(BOOL)a3;
- (void)setTitleColor:(id)a3 forState:(unint64_t)a4;
- (void)tappedButton:(id)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation CarFocusableButton

+ (id)button
{
  return [a1 buttonWithType:0];
}

+ (id)closeButton
{
  v2 = [a1 button];
  [v2 setAccessibilityIdentifier:@"CloseButton"];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = +[UIColor _carSystemFocusColor];
  [v2 setFocusedTintColor:v3];

  v4 = +[UIColor _carSystemTertiaryColor];
  [v2 setNonFocusedTintColor:v4];

  v5 = [v2 imageView];
  [v5 setContentMode:1];

  LODWORD(v6) = 1148846080;
  [v2 setContentHuggingPriority:0 forAxis:v6];
  LODWORD(v7) = 1148846080;
  [v2 setContentCompressionResistancePriority:0 forAxis:v7];
  LODWORD(v8) = 1148846080;
  [v2 setContentCompressionResistancePriority:1 forAxis:v8];
  v9 = +[UIImage _mapsCar_systemImageNamed:@"multiply.circle.fill" textStyle:UIFontTextStyleTitle3 weight:6];
  [v2 setImage:v9 forState:0];

  [v2 setTouchInsets:-10.0, -10.0, -10.0, -10.0];
  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"CarPlay_Close" value:@"localized string not found" table:0];
  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"CarPlay_Dismiss" value:@"localized string not found" table:0];
  v18[1] = v13;
  v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"CarPlay_X" value:@"localized string not found" table:0];
  v18[2] = v15;
  v16 = +[NSArray arrayWithObjects:v18 count:3];
  [v2 setAccessibilityUserInputLabels:v16];

  return v2;
}

+ (CarFocusableButton)buttonWithType:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CarFocusableButton;
  v3 = [super buttonWithType:a3];
  [v3 _commonInit];

  return (CarFocusableButton *)v3;
}

- (CarFocusableButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CarFocusableButton;
  v3 = -[CarFocusableButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CarFocusableButton *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v3 = (UILongPressGestureRecognizer *)[objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"tappedButton:"];
  recognizer = self->_recognizer;
  self->_recognizer = v3;

  [(UILongPressGestureRecognizer *)self->_recognizer setMinimumPressDuration:0.0];
  [(UILongPressGestureRecognizer *)self->_recognizer setAllowedPressTypes:&off_1013AE5E0];
  objc_super v5 = +[UIColor _carSystemFocusLabelColor];
  focusedTintColor = self->_focusedTintColor;
  self->_focusedTintColor = v5;

  double v7 = +[UIColor _carSystemFocusColor];
  nonFocusedTintColor = self->_nonFocusedTintColor;
  self->_nonFocusedTintColor = v7;

  v9 = +[UIColor _carSystemFocusColor];
  focusedBackgroundColor = self->_focusedBackgroundColor;
  self->_focusedBackgroundColor = v9;

  v11 = +[UIColor clearColor];
  nonFocusedBackgroundColor = self->_nonFocusedBackgroundColor;
  self->_nonFocusedBackgroundColor = v11;

  [(CarFocusableButton *)self setAdjustsImageWhenHighlighted:0];
  [(CarFocusableButton *)self setAdjustsImageWhenDisabled:0];
  [(CarFocusableButton *)self addGestureRecognizer:self->_recognizer];

  [(CarFocusableButton *)self _updateAppearance];
}

- (void)willMoveToSuperview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CarFocusableButton;
  [(CarFocusableButton *)&v5 willMoveToSuperview:a3];
  [(CAShapeLayer *)self->_focusShapeLayer removeFromSuperlayer];
  focusShapeLayer = self->_focusShapeLayer;
  self->_focusShapeLayer = 0;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)CarFocusableButton;
  [(CarFocusableButton *)&v4 didMoveToWindow];
  v3 = [(CarFocusableButton *)self window];

  if (v3) {
    [(CarFocusableButton *)self _setNeedsUpdateAppearance];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CarFocusableButton;
  id v4 = a3;
  [(CarFocusableButton *)&v8 traitCollectionDidChange:v4];
  id v5 = [v4 userInterfaceStyle];

  objc_super v6 = [(CarFocusableButton *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    [(CarFocusableButton *)self _setNeedsUpdateAppearance];
  }
}

- (void)setAdjustsImageWhenDisabled:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CarFocusableButton;
  [(CarFocusableButton *)&v3 setAdjustsImageWhenDisabled:0];
}

- (void)setAdjustsImageWhenHighlighted:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CarFocusableButton;
  [(CarFocusableButton *)&v3 setAdjustsImageWhenHighlighted:0];
}

- (void)setFocusedTintColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_focusedTintColor != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_focusedTintColor, a3);
    [(CarFocusableButton *)self _setNeedsUpdateAppearance];
    id v5 = v6;
  }
}

- (void)setNonFocusedTintColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_nonFocusedTintColor != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_nonFocusedTintColor, a3);
    [(CarFocusableButton *)self _setNeedsUpdateAppearance];
    id v5 = v6;
  }
}

- (void)setFocusedBackgroundColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_focusedBackgroundColor != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_focusedBackgroundColor, a3);
    [(CarFocusableButton *)self _setNeedsUpdateAppearance];
    id v5 = v6;
  }
}

- (void)setNonFocusedBackgroundColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_nonFocusedBackgroundColor != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_nonFocusedBackgroundColor, a3);
    [(CarFocusableButton *)self _setNeedsUpdateAppearance];
    id v5 = v6;
  }
}

- (void)setModifiesBackgroundColor:(BOOL)a3
{
  if (self->_modifiesBackgroundColor != a3)
  {
    self->_modifiesBackgroundColor = a3;
    [(CarFocusableButton *)self _setNeedsUpdateAppearance];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CarFocusableButton *)self isEnabled];
  v6.receiver = self;
  v6.super_class = (Class)CarFocusableButton;
  [(CarFocusableButton *)&v6 setEnabled:v3];
  if (v5 != [(CarFocusableButton *)self isEnabled])
  {
    [(CarFocusableButton *)self setNeedsFocusUpdate];
    [(CarFocusableButton *)self _updateColorSettings];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CarFocusableButton *)self isHighlighted];
  v6.receiver = self;
  v6.super_class = (Class)CarFocusableButton;
  [(CarFocusableButton *)&v6 setHighlighted:v3];
  if (v5 != [(CarFocusableButton *)self isHighlighted]) {
    [(CarFocusableButton *)self _updateColorSettings];
  }
}

- (BOOL)canBecomeFocused
{
  v5.receiver = self;
  v5.super_class = (Class)CarFocusableButton;
  unsigned int v3 = [(CarFocusableButton *)&v5 canBecomeFocused];
  if (v3)
  {
    unsigned int v3 = [(CarFocusableButton *)self isEnabled];
    if (v3) {
      LOBYTE(v3) = [(CarFocusableButton *)self isHidden] ^ 1;
    }
  }
  return v3;
}

- (id)_focusShapeLayer
{
  focusShapeLayer = self->_focusShapeLayer;
  if (!focusShapeLayer)
  {
    id v4 = +[CAShapeLayer layer];
    objc_super v5 = self->_focusShapeLayer;
    self->_focusShapeLayer = v4;

    [(CarFocusableButton *)self bounds];
    CGRect v12 = CGRectInset(v11, -0.75, -0.75);
    objc_super v6 = CGPathCreateWithEllipseInRect(v12, 0);
    [(CAShapeLayer *)self->_focusShapeLayer setPath:v6];
    CGPathRelease(v6);
    id v7 = [(CarFocusableButton *)self focusedBackgroundColor];
    -[CAShapeLayer setStrokeColor:](self->_focusShapeLayer, "setStrokeColor:", [v7 CGColor]);

    id v8 = +[UIColor clearColor];
    -[CAShapeLayer setFillColor:](self->_focusShapeLayer, "setFillColor:", [v8 CGColor]);

    [(CAShapeLayer *)self->_focusShapeLayer setLineWidth:1.5];
    focusShapeLayer = self->_focusShapeLayer;
  }

  return focusShapeLayer;
}

- (void)_setNeedsUpdateAppearance
{
  if (!self->_needsUpdateAppearance)
  {
    self->_needsUpdateAppearance = 1;
    objc_initWeak(&location, self);
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_100AC717C;
    v2[3] = &unk_1012E6708;
    objc_copyWeak(&v3, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
    objc_destroyWeak(&v3);
    objc_destroyWeak(&location);
  }
}

- (void)_updateAppearance
{
  if (!self->_showsEllipticalFocusIndicator)
  {
    if ([(CarFocusableButton *)self isFocused]) {
      [(CarFocusableButton *)self focusedTintColor];
    }
    else {
    id v14 = [(CarFocusableButton *)self nonFocusedTintColor];
    }
    [(CarFocusableButton *)self setTintColor:v14];
    goto LABEL_18;
  }
  p_lastKnownSize = &self->_lastKnownSize;
  [(CarFocusableButton *)self bounds];
  double height = self->_lastKnownSize.height;
  if (p_lastKnownSize->width != v6 || height != v4)
  {
    [(CarFocusableButton *)self bounds];
    p_lastKnownSize->width = v8;
    self->_lastKnownSize.double height = v9;
    [(CAShapeLayer *)self->_focusShapeLayer removeFromSuperlayer];
    focusShapeLayer = self->_focusShapeLayer;
    self->_focusShapeLayer = 0;
  }
  if ([(CarFocusableButton *)self isFocused])
  {
    uint64_t v11 = [(CarFocusableButton *)self focusedBackgroundColor];
  }
  else
  {
    if (![(CarFocusableButton *)self isSelected])
    {
LABEL_15:
      [(CAShapeLayer *)self->_focusShapeLayer removeFromSuperlayer];
      goto LABEL_19;
    }
    uint64_t v11 = +[UIColor labelColor];
  }
  CGRect v12 = (void *)v11;
  if (!v11) {
    goto LABEL_15;
  }
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  v13 = [(CarFocusableButton *)self _focusShapeLayer];
  id v14 = v12;
  [v13 setStrokeColor:[v14 CGColor]];

  +[CATransaction commit];
  v15 = [(CarFocusableButton *)self layer];
  v16 = [(CarFocusableButton *)self _focusShapeLayer];
  [v15 addSublayer:v16];

LABEL_18:
LABEL_19:
  if (self->_modifiesBackgroundColor)
  {
    if ([(CarFocusableButton *)self isFocused]) {
      [(CarFocusableButton *)self focusedBackgroundColor];
    }
    else {
    id v17 = [(CarFocusableButton *)self nonFocusedBackgroundColor];
    }
    [(CarFocusableButton *)self setBackgroundColor:v17];
  }
}

- (void)_updateColorSettings
{
  id v3 = [(CarFocusableButton *)self tintColor];
  v18.receiver = self;
  v18.super_class = (Class)CarFocusableButton;
  [(CarFocusableButton *)&v18 setTitleColor:v3 forState:0];

  double v16 = 0.0;
  double v17 = 0.0;
  double v4 = [(CarFocusableButton *)self tintColor];
  [v4 getWhite:&v17 alpha:&v16];

  objc_super v5 = [(CarFocusableButton *)self titleColorForState:2];
  if (!*(_WORD *)&self->_customDisabledColor)
  {
    self->_generatedDisabledColor = 1;
    uint64_t v6 = +[UIColor colorWithWhite:v17 alpha:v16 * 0.349999994];

    v15.receiver = self;
    v15.super_class = (Class)CarFocusableButton;
    [(CarFocusableButton *)&v15 setTitleColor:v6 forState:2];
    objc_super v5 = (void *)v6;
  }
  id v7 = [(CarFocusableButton *)self titleColorForState:1];
  if (!self->_customHighlightedColor && !self->_generatedHighlightedColor)
  {
    self->_generatedHighlightedColor = 1;
    CGFloat v8 = [(CarFocusableButton *)self tintColor];
    uint64_t v9 = [v8 colorWithAlphaComponent:0.200000003];

    v14.receiver = self;
    v14.super_class = (Class)CarFocusableButton;
    [(CarFocusableButton *)&v14 setTitleColor:v9 forState:1];
    id v7 = (void *)v9;
  }
  if ([(CarFocusableButton *)self isHighlighted])
  {
    v10 = [(CarFocusableButton *)self imageView];
    uint64_t v11 = v10;
    CGRect v12 = v7;
LABEL_11:
    [v10 setTintColor:v12];
    goto LABEL_12;
  }
  if (([(CarFocusableButton *)self isEnabled] & 1) == 0)
  {
    v10 = [(CarFocusableButton *)self imageView];
    uint64_t v11 = v10;
    CGRect v12 = v5;
    goto LABEL_11;
  }
  uint64_t v11 = [(CarFocusableButton *)self tintColor];
  v13 = [(CarFocusableButton *)self imageView];
  [v13 setTintColor:v11];

LABEL_12:
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CarFocusableButton;
  [(CarFocusableButton *)&v3 tintColorDidChange];
  self->_generatedHighlightedColor = 0;
  self->_generatedDisabledColor = 0;
  [(CarFocusableButton *)self _updateColorSettings];
}

- (void)setTitleColor:(id)a3 forState:(unint64_t)a4
{
  if (a4 == 1)
  {
    objc_super v5 = &OBJC_IVAR___CarFocusableButton__customHighlightedColor;
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    objc_super v5 = &OBJC_IVAR___CarFocusableButton__customDisabledColor;
LABEL_5:
    *((unsigned char *)&self->super.super.super.super.super.super.isa + *v5) = a3 != 0;
    *((unsigned char *)&self->super.super.super.super.super.super.isa + v5[1]) = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CarFocusableButton;
  -[CarFocusableButton setTitleColor:forState:](&v6, "setTitleColor:forState:");
  [(CarFocusableButton *)self _setNeedsUpdateAppearance];
}

- (void)tappedButton:(id)a3
{
  id v5 = a3;
  if ([(CarFocusableButton *)self isEnabled])
  {
    if ([v5 state] == (id)1)
    {
      [(CarFocusableButton *)self setHighlighted:1];
    }
    else
    {
      id v4 = [v5 state];
      [(CarFocusableButton *)self setHighlighted:0];
      if (v4 == (id)3) {
        [(CarFocusableButton *)self sendActionsForControlEvents:64];
      }
    }
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CarFocusableButton;
  [(CarFocusableButton *)&v11 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  id v7 = [v6 nextFocusedItem];
  if (v7 == self)
  {

LABEL_5:
    v10 = [v6 nextFocusedItem];
    [(CarFocusableButton *)self focusDidChange:v10 == self];

    goto LABEL_6;
  }
  CGFloat v8 = v7;
  uint64_t v9 = [v6 previouslyFocusedItem];

  if (v9 == self) {
    goto LABEL_5;
  }
LABEL_6:
}

- (UIColor)focusedTintColor
{
  return self->_focusedTintColor;
}

- (UIColor)nonFocusedTintColor
{
  return self->_nonFocusedTintColor;
}

- (UIColor)focusedBackgroundColor
{
  return self->_focusedBackgroundColor;
}

- (UIColor)nonFocusedBackgroundColor
{
  return self->_nonFocusedBackgroundColor;
}

- (BOOL)modifiesBackgroundColor
{
  return self->_modifiesBackgroundColor;
}

- (BOOL)showsEllipticalFocusIndicator
{
  return self->_showsEllipticalFocusIndicator;
}

- (void)setShowsEllipticalFocusIndicator:(BOOL)a3
{
  self->_showsEllipticalFocusIndicator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonFocusedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_focusedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_nonFocusedTintColor, 0);
  objc_storeStrong((id *)&self->_focusedTintColor, 0);
  objc_storeStrong((id *)&self->_focusShapeLayer, 0);

  objc_storeStrong((id *)&self->_recognizer, 0);
}

@end