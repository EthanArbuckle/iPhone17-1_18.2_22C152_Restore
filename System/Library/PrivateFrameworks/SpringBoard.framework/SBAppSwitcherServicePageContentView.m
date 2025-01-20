@interface SBAppSwitcherServicePageContentView
- (BOOL)contentRequiresGroupOpacity;
- (BOOL)isActive;
- (BOOL)isVisible;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SBAppSwitcherServicePageContentView)initWithFrame:(CGRect)a3;
- (double)cornerRadius;
- (int64_t)orientation;
- (unint64_t)maskedCorners;
- (void)setActive:(BOOL)a3;
- (void)setMaskedCorners:(unint64_t)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation SBAppSwitcherServicePageContentView

- (SBAppSwitcherServicePageContentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBAppSwitcherServicePageContentView;
  v3 = -[SBAppSwitcherServicePageContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SBAppSwitcherServicePageContentView *)v3 setClipsToBounds:1];
  }
  return v4;
}

- (double)cornerRadius
{
  v2 = [(SBAppSwitcherServicePageContentView *)self layer];
  [v2 cornerRadius];
  double v4 = v3;

  return v4;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  id v4 = [(SBAppSwitcherServicePageContentView *)self layer];
  [v4 setMaskedCorners:a3];
}

- (unint64_t)maskedCorners
{
  v2 = [(SBAppSwitcherServicePageContentView *)self layer];
  unint64_t v3 = [v2 maskedCorners];

  return v3;
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    [(SBAppSwitcherServicePageContentView *)self setNeedsLayout];
  }
}

- (BOOL)contentRequiresGroupOpacity
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen", a3.width, a3.height);
  [v4 _referenceBounds];
  double v6 = v5;
  double v8 = v7;

  int64_t v9 = [(SBAppSwitcherServicePageContentView *)self orientation];
  if ((unint64_t)(v9 - 3) >= 2) {
    double v10 = v6;
  }
  else {
    double v10 = v8;
  }
  if ((unint64_t)(v9 - 3) >= 2) {
    double v11 = v8;
  }
  else {
    double v11 = v6;
  }
  result.height = v11;
  result.width = v10;
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

@end