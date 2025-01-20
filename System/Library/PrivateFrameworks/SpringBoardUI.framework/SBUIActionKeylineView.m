@interface SBUIActionKeylineView
- (CGSize)intrinsicContentSize;
- (SBUIActionKeylineView)init;
- (double)height;
- (double)heightInPixels;
- (void)_invalidateVisualStyling;
- (void)_updateCornerMask;
- (void)_updateVisualStylingIfNecessary;
- (void)layoutSubviews;
- (void)setHeight:(double)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation SBUIActionKeylineView

- (SBUIActionKeylineView)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBUIActionKeylineView;
  result = [(SBUIActionKeylineView *)&v3 init];
  if (result) {
    result->_height = 1.0;
  }
  return result;
}

- (void)setHeight:(double)a3
{
  if (vabdd_f64(a3, self->_height) > 2.22044605e-16)
  {
    self->_height = a3;
    [(SBUIActionKeylineView *)self _updateCornerMask];
    [(SBUIActionKeylineView *)self invalidateIntrinsicContentSize];
  }
}

- (double)heightInPixels
{
  [(SBUIActionKeylineView *)self height];
  double v4 = v3;
  v5 = [(SBUIActionKeylineView *)self traitCollection];
  [v5 displayScale];
  double v7 = v4 * (1.0 / v6);

  return v7;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBUIActionKeylineView;
  [(SBUIActionKeylineView *)&v3 layoutSubviews];
  [(SBUIActionKeylineView *)self _updateVisualStylingIfNecessary];
}

- (void)willMoveToSuperview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBUIActionKeylineView;
  [(SBUIActionKeylineView *)&v4 willMoveToSuperview:a3];
  [(SBUIActionKeylineView *)self _invalidateVisualStyling];
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F1D7C8];
  [(SBUIActionKeylineView *)self heightInPixels];
  double v4 = v3;
  double v5 = v2;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)_invalidateVisualStyling
{
  [(MTVisualStylingProvider *)self->_visualStylingProvider stopAutomaticallyUpdatingView:self];
  visualStylingProvider = self->_visualStylingProvider;
  self->_visualStylingProvider = 0;

  [(SBUIActionKeylineView *)self setNeedsLayout];
}

- (void)_updateVisualStylingIfNecessary
{
  if (!self->_visualStylingProvider)
  {
    double v3 = [(SBUIActionKeylineView *)self visualStylingProviderForCategory:2];
    visualStylingProvider = self->_visualStylingProvider;
    self->_visualStylingProvider = v3;

    double v5 = self->_visualStylingProvider;
    [(MTVisualStylingProvider *)v5 automaticallyUpdateView:self withStyle:5];
  }
}

- (void)_updateCornerMask
{
  id v7 = [(SBUIActionKeylineView *)self layer];
  [v7 setMaskedCorners:5];
  [(SBUIActionKeylineView *)self heightInPixels];
  double v4 = v3 * 0.5;
  BOOL v5 = v3 < 1.0;
  double v6 = 0.0;
  if (!v5) {
    double v6 = v4;
  }
  [(SBUIActionKeylineView *)self _setCornerRadius:v6];
}

- (double)height
{
  return self->_height;
}

- (void).cxx_destruct
{
}

@end