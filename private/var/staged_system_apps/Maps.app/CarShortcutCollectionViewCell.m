@interface CarShortcutCollectionViewCell
+ (double)bottomMargin;
+ (double)focusRingTopOverhang;
+ (double)imageSize;
+ (double)imageTopMargin;
+ (double)textHorizontalMargin;
+ (double)titleTopMargin;
+ (id)maximumContentSizeCategory;
+ (id)subtitleFontWithTraitCollection:(id)a3;
+ (id)titleFontWithTraitCollection:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)focusOverridden;
- (CarShortcutCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIColor)focusColor;
- (id)accessibilityIdentifier;
- (void)_createFocusRingLayer;
- (void)_updateFocus;
- (void)didMoveToWindow;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setFocusOverridden:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateFocusRingColor;
@end

@implementation CarShortcutCollectionViewCell

+ (id)maximumContentSizeCategory
{
  return UIContentSizeCategoryLarge;
}

+ (double)imageTopMargin
{
  return 0.0;
}

+ (double)imageSize
{
  return 30.0;
}

+ (id)titleFontWithTraitCollection:(id)a3
{
  return +[UIFont system12MediumCompatibleWithTraitCollection:a3];
}

+ (id)subtitleFontWithTraitCollection:(id)a3
{
  return +[UIFont system12CompatibleWithTraitCollection:a3];
}

+ (double)titleTopMargin
{
  return 3.0;
}

+ (double)textHorizontalMargin
{
  return 0.0;
}

+ (double)bottomMargin
{
  return 6.0;
}

+ (double)focusRingTopOverhang
{
  return 4.0;
}

- (CarShortcutCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CarShortcutCollectionViewCell;
  v3 = -[ShortcutsRowCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CarShortcutCollectionViewCell *)v3 _createFocusRingLayer];
  }
  return v4;
}

- (id)accessibilityIdentifier
{
  return @"CarShortcutCollectionViewCell";
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)CarShortcutCollectionViewCell;
  [(ShortcutsRowCollectionViewCell *)&v10 layoutSubviews];
  v3 = [(CarShortcutCollectionViewCell *)self contentView];
  [v3 bounds];
  CGRectGetWidth(v11);
  v4 = [(CarShortcutCollectionViewCell *)self contentView];
  UIRoundToViewScale();
  double v6 = v5;
  [(id)objc_opt_class() imageSize];
  double v8 = v7 * 0.5;
  [(id)objc_opt_class() imageTopMargin];
  -[CAShapeLayer setPosition:](self->_focusRingLayer, "setPosition:", v6, v8 + v9);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CarShortcutCollectionViewCell;
  [(CarShortcutCollectionViewCell *)&v3 prepareForReuse];
  [(CarShortcutCollectionViewCell *)self setFocusOverridden:0];
}

- (void)_updateFocus
{
  if ([(CarShortcutCollectionViewCell *)self isFocused]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [(CarShortcutCollectionViewCell *)self focusOverridden] ^ 1;
  }
  if (v3 != [(CAShapeLayer *)self->_focusRingLayer isHidden])
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [(CAShapeLayer *)self->_focusRingLayer setHidden:v3];
    +[CATransaction commit];
  }
}

- (void)_createFocusRingLayer
{
  if (!self->_focusRingLayer)
  {
    uint64_t v3 = +[CAShapeLayer layer];
    focusRingLayer = self->_focusRingLayer;
    self->_focusRingLayer = v3;

    [(CAShapeLayer *)self->_focusRingLayer setHidden:1];
    id v5 = +[UIColor clearColor];
    -[CAShapeLayer setFillColor:](self->_focusRingLayer, "setFillColor:", [v5 CGColor]);

    [(CAShapeLayer *)self->_focusRingLayer setLineWidth:2.0];
    -[CAShapeLayer setAnchorPoint:](self->_focusRingLayer, "setAnchorPoint:", 0.5, 0.5);
    [(id)objc_opt_class() imageSize];
    -[CAShapeLayer setBounds:](self->_focusRingLayer, "setBounds:", 0.0, 0.0, v6 + 4.0 + 2.0, v6 + 4.0 + 2.0);
    [(CAShapeLayer *)self->_focusRingLayer bounds];
    double v7 = CGPathCreateWithEllipseInRect(v11, 0);
    [(CAShapeLayer *)self->_focusRingLayer setPath:v7];
    CGPathRelease(v7);
    [(CarShortcutCollectionViewCell *)self updateFocusRingColor];
    double v8 = [(CarShortcutCollectionViewCell *)self contentView];
    double v9 = [v8 layer];
    [v9 addSublayer:self->_focusRingLayer];

    [(CarShortcutCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)updateFocusRingColor
{
  id v5 = +[UITraitCollection _currentTraitCollection];
  uint64_t v3 = [(CarShortcutCollectionViewCell *)self traitCollection];
  +[UITraitCollection _setCurrentTraitCollection:v3];

  id v4 = [(CarShortcutCollectionViewCell *)self focusColor];
  -[CAShapeLayer setStrokeColor:](self->_focusRingLayer, "setStrokeColor:", [v4 CGColor]);

  +[UITraitCollection _setCurrentTraitCollection:v5];
}

- (UIColor)focusColor
{
  return (UIColor *)+[UIColor _carSystemFocusColor];
}

- (void)setFocusOverridden:(BOOL)a3
{
  if (self->_focusOverridden != a3)
  {
    self->_focusOverridden = a3;
    [(CarShortcutCollectionViewCell *)self _updateFocus];
  }
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)CarShortcutCollectionViewCell;
  [(CarShortcutCollectionViewCell *)&v4 didMoveToWindow];
  uint64_t v3 = [(CarShortcutCollectionViewCell *)self window];

  if (v3) {
    [(CarShortcutCollectionViewCell *)self updateFocusRingColor];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CarShortcutCollectionViewCell;
  id v4 = a3;
  [(ShortcutsRowCollectionViewCell *)&v8 traitCollectionDidChange:v4];
  id v5 = [(CarShortcutCollectionViewCell *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(CarShortcutCollectionViewCell *)self updateFocusRingColor];
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CarShortcutCollectionViewCell;
  [(CarShortcutCollectionViewCell *)&v10 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  id v7 = [v6 nextFocusedItem];
  if (v7 == self)
  {

LABEL_5:
    [(CarShortcutCollectionViewCell *)self _updateFocus];
    goto LABEL_6;
  }
  objc_super v8 = v7;
  double v9 = [v6 previouslyFocusedItem];

  if (v9 == self) {
    goto LABEL_5;
  }
LABEL_6:
}

- (BOOL)focusOverridden
{
  return self->_focusOverridden;
}

- (void).cxx_destruct
{
}

@end