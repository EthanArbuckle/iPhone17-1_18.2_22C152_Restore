@interface SBFTouchPassThroughClippingView
- (BOOL)hitTestsSubviewsOutsideBounds;
- (BOOL)isContentClippingEnabled;
- (CGRect)contentClippingFrame;
- (SBFTouchPassThroughClippingView)initWithFrame:(CGRect)a3;
- (_SBFActualClippingView)contentClippingView;
- (double)contentCornerRadius;
- (void)_layoutContentClippingView;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)addSubview:(id)a3;
- (void)bringSubviewToFront:(id)a3;
- (void)insertSubview:(id)a3 aboveSubview:(id)a4;
- (void)insertSubview:(id)a3 atIndex:(int64_t)a4;
- (void)insertSubview:(id)a3 belowSubview:(id)a4;
- (void)layoutSubviews;
- (void)sendSubviewToBack:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setContentClippingEnabled:(BOOL)a3;
- (void)setContentClippingFrame:(CGRect)a3;
- (void)setContentClippingFrame:(CGRect)a3 cornerRadii:(UIRectCornerRadii)a4;
- (void)setContentClippingView:(id)a3;
- (void)setContentCornerRadius:(double)a3;
- (void)setHitTestsSubviewsOutsideBounds:(BOOL)a3;
- (void)setOpaque:(BOOL)a3;
@end

@implementation SBFTouchPassThroughClippingView

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBFTouchPassThroughClippingView;
  [(SBFTouchPassThroughClippingView *)&v3 layoutSubviews];
  [(SBFTouchPassThroughClippingView *)self _layoutContentClippingView];
}

- (void)_layoutContentClippingView
{
  if (self->_contentClippingEnabled
    && (p_contentClippingFrame = &self->_contentClippingFrame, !CGRectIsNull(self->_contentClippingFrame)))
  {
    double x = p_contentClippingFrame->origin.x;
    double y = self->_contentClippingFrame.origin.y;
    uint64_t v12 = 1;
    double width = self->_contentClippingFrame.size.width;
    double height = self->_contentClippingFrame.size.height;
  }
  else
  {
    [(SBFTouchPassThroughClippingView *)self bounds];
    double x = v4;
    double y = v6;
    double width = v8;
    double height = v10;
    uint64_t v12 = 0;
  }
  BSRectGetCenter();
  double v14 = v13;
  double v16 = v15;
  -[_SBFActualClippingView setBounds:](self->_contentClippingView, "setBounds:", x, y, width, height);
  -[_SBFActualClippingView setCenter:](self->_contentClippingView, "setCenter:", v14, v16);
  [(_SBFActualClippingView *)self->_contentClippingView _setContinuousCornerRadius:self->_contentCornerRadius];
  contentClippingView = self->_contentClippingView;
  [(_SBFActualClippingView *)contentClippingView setClipsToBounds:v12];
}

- (void)setContentClippingEnabled:(BOOL)a3
{
  if (self->_contentClippingEnabled != a3)
  {
    self->_contentClippingEnabled = a3;
    [(SBFTouchPassThroughClippingView *)self setNeedsLayout];
  }
}

- (BOOL)isContentClippingEnabled
{
  return self->_contentClippingEnabled;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBFTouchPassThroughClippingView;
  -[SBFTouchPassThroughClippingView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_contentCornerRadius = a3;
    [(SBFTouchPassThroughClippingView *)self setNeedsLayout];
  }
}

- (void)setContentClippingFrame:(CGRect)a3 cornerRadii:(UIRectCornerRadii)a4
{
  double var0 = a4.var0;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double var3 = a4.var3;
  double var1 = a4.var1;
  double var2 = a4.var2;
  for (uint64_t i = 8; i != 32; i += 8)
  {
    if (var0 < *(double *)&v12[i]) {
      double var0 = *(double *)&v12[i];
    }
  }
  p_contentClippingFrame = &self->_contentClippingFrame;
  if (!CGRectEqualToRect(self->_contentClippingFrame, a3) || (BSFloatEqualToFloat() & 1) == 0)
  {
    self->_contentCornerRadius = var0;
    p_contentClippingFrame->origin.CGFloat x = x;
    self->_contentClippingFrame.origin.CGFloat y = y;
    self->_contentClippingFrame.size.CGFloat width = width;
    self->_contentClippingFrame.size.CGFloat height = height;
    [(SBFTouchPassThroughClippingView *)self setNeedsLayout];
  }
}

- (BOOL)hitTestsSubviewsOutsideBounds
{
  return self->_hitTestsSubviewsOutsideBounds;
}

- (void)bringSubviewToFront:(id)a3
{
  if (self->_contentClippingView == a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)SBFTouchPassThroughClippingView;
    -[SBFTouchPassThroughClippingView bringSubviewToFront:](&v4, sel_bringSubviewToFront_);
  }
  else
  {
    contentClippingView = self->_contentClippingView;
    -[_SBFActualClippingView bringSubviewToFront:](contentClippingView, "bringSubviewToFront:");
  }
}

- (void)setHitTestsSubviewsOutsideBounds:(BOOL)a3
{
  self->_hitTestsSubviewsOutsideBounds = a3;
  -[_SBFActualClippingView setHitTestsSubviewsOutsideBounds:](self->_contentClippingView, "setHitTestsSubviewsOutsideBounds:");
}

- (SBFTouchPassThroughClippingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)SBFTouchPassThroughClippingView;
  v7 = -[SBFTouchPassThroughClippingView initWithFrame:](&v13, sel_initWithFrame_);
  double v8 = v7;
  if (v7)
  {
    CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v7->_contentClippingFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v7->_contentClippingFrame.size = v9;
    double v10 = -[_SBFActualClippingView initWithFrame:]([_SBFActualClippingView alloc], "initWithFrame:", x, y, width, height);
    contentClippingView = v8->_contentClippingView;
    v8->_contentClippingView = v10;

    [(SBFTouchPassThroughClippingView *)v8 addSubview:v8->_contentClippingView];
    [(SBFTouchPassThroughClippingView *)v8 setContentClippingEnabled:1];
  }
  return v8;
}

- (CGRect)contentClippingFrame
{
  double x = self->_contentClippingFrame.origin.x;
  double y = self->_contentClippingFrame.origin.y;
  double width = self->_contentClippingFrame.size.width;
  double height = self->_contentClippingFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBFTouchPassThroughClippingView;
  id v4 = a3;
  [(SBFTouchPassThroughClippingView *)&v5 setBackgroundColor:v4];
  -[_SBFActualClippingView setBackgroundColor:](self->_contentClippingView, "setBackgroundColor:", v4, v5.receiver, v5.super_class);
}

- (void)setOpaque:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBFTouchPassThroughClippingView;
  -[SBFTouchPassThroughClippingView setOpaque:](&v5, sel_setOpaque_);
  [(_SBFActualClippingView *)self->_contentClippingView setOpaque:v3];
}

- (void)addSubview:(id)a3
{
  if (self->_contentClippingView == a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)SBFTouchPassThroughClippingView;
    -[SBFTouchPassThroughClippingView addSubview:](&v4, sel_addSubview_);
  }
  else
  {
    contentClippingView = self->_contentClippingView;
    -[_SBFActualClippingView addSubview:](contentClippingView, "addSubview:");
  }
}

- (void)insertSubview:(id)a3 atIndex:(int64_t)a4
{
  if (self->_contentClippingView == a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBFTouchPassThroughClippingView;
    -[SBFTouchPassThroughClippingView insertSubview:atIndex:](&v5, sel_insertSubview_atIndex_);
  }
  else
  {
    contentClippingView = self->_contentClippingView;
    -[_SBFActualClippingView insertSubview:atIndex:](contentClippingView, "insertSubview:atIndex:");
  }
}

- (void)insertSubview:(id)a3 belowSubview:(id)a4
{
  contentClippingView = self->_contentClippingView;
  if (contentClippingView == a3 || contentClippingView == a4)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFTouchPassThroughClippingView;
    -[SBFTouchPassThroughClippingView insertSubview:belowSubview:](&v7, sel_insertSubview_belowSubview_);
  }
  else
  {
    double v6 = self->_contentClippingView;
    -[_SBFActualClippingView insertSubview:belowSubview:](v6, "insertSubview:belowSubview:");
  }
}

- (void)insertSubview:(id)a3 aboveSubview:(id)a4
{
  contentClippingView = self->_contentClippingView;
  if (contentClippingView == a3 || contentClippingView == a4)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFTouchPassThroughClippingView;
    -[SBFTouchPassThroughClippingView insertSubview:aboveSubview:](&v7, sel_insertSubview_aboveSubview_);
  }
  else
  {
    double v6 = self->_contentClippingView;
    -[_SBFActualClippingView insertSubview:aboveSubview:](v6, "insertSubview:aboveSubview:");
  }
}

- (void)sendSubviewToBack:(id)a3
{
  if (self->_contentClippingView == a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)SBFTouchPassThroughClippingView;
    -[SBFTouchPassThroughClippingView sendSubviewToBack:](&v4, sel_sendSubviewToBack_);
  }
  else
  {
    contentClippingView = self->_contentClippingView;
    -[_SBFActualClippingView sendSubviewToBack:](contentClippingView, "sendSubviewToBack:");
  }
}

- (void)setContentClippingFrame:(CGRect)a3
{
  self->_contentClippingFrame = a3;
}

- (double)contentCornerRadius
{
  return self->_contentCornerRadius;
}

- (void)setContentCornerRadius:(double)a3
{
  self->_contentCornerRadius = a3;
}

- (_SBFActualClippingView)contentClippingView
{
  return self->_contentClippingView;
}

- (void)setContentClippingView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end