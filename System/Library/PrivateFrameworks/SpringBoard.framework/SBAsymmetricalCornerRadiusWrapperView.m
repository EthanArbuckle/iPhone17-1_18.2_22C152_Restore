@interface SBAsymmetricalCornerRadiusWrapperView
- (BSCornerRadiusConfiguration)cornerRadiusConfiguration;
- (NSArray)contentViews;
- (SBAsymmetricalCornerRadiusWrapperView)initWithFrame:(CGRect)a3;
- (uint64_t)trailingCornersMaskingView;
- (unint64_t)maskedCorners;
- (void)_updateCornerRadius;
- (void)_updateMaskedCorners;
- (void)addContentView:(id)a3;
- (void)bringContentViewToFront:(id)a3;
- (void)sendContentViewToBack:(id)a3;
- (void)setClipsToBounds:(BOOL)a3;
- (void)setCornerRadiusConfiguration:(id)a3;
- (void)setMaskedCorners:(unint64_t)a3;
- (void)setTrailingCornersMaskingView:(uint64_t)a1;
@end

@implementation SBAsymmetricalCornerRadiusWrapperView

- (SBAsymmetricalCornerRadiusWrapperView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBAsymmetricalCornerRadiusWrapperView;
  v3 = -[SBHitTestExtendedView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SBAsymmetricalCornerRadiusWrapperView *)v3 layer];
    uint64_t v6 = *MEMORY[0x1E4F39EA8];
    [v5 setCornerCurve:*MEMORY[0x1E4F39EA8]];

    v7 = [SBHitTestExtendedView alloc];
    [(SBAsymmetricalCornerRadiusWrapperView *)v4 bounds];
    uint64_t v8 = -[SBHitTestExtendedView initWithFrame:](v7, "initWithFrame:");
    trailingCornersMaskingView = v4->_trailingCornersMaskingView;
    v4->_trailingCornersMaskingView = (SBHitTestExtendedView *)v8;

    [(SBHitTestExtendedView *)v4->_trailingCornersMaskingView setAutoresizingMask:18];
    v10 = [(SBHitTestExtendedView *)v4->_trailingCornersMaskingView layer];
    [v10 setCornerCurve:v6];

    [(SBAsymmetricalCornerRadiusWrapperView *)v4 addSubview:v4->_trailingCornersMaskingView];
    [(SBAsymmetricalCornerRadiusWrapperView *)v4 setMaskedCorners:15];
  }
  return v4;
}

- (void)setCornerRadiusConfiguration:(id)a3
{
  id v6 = a3;
  if ((-[BSCornerRadiusConfiguration isEqual:](self->_cornerRadiusConfiguration, "isEqual:") & 1) == 0)
  {
    v4 = (BSCornerRadiusConfiguration *)[v6 copy];
    cornerRadiusConfiguration = self->_cornerRadiusConfiguration;
    self->_cornerRadiusConfiguration = v4;

    [(SBAsymmetricalCornerRadiusWrapperView *)self _updateCornerRadius];
  }
}

- (void)setClipsToBounds:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBAsymmetricalCornerRadiusWrapperView;
  -[SBAsymmetricalCornerRadiusWrapperView setClipsToBounds:](&v5, sel_setClipsToBounds_);
  [(SBHitTestExtendedView *)self->_trailingCornersMaskingView setClipsToBounds:v3];
}

- (void)setMaskedCorners:(unint64_t)a3
{
  if (self->_maskedCorners != a3)
  {
    self->_maskedCorners = a3;
    [(SBAsymmetricalCornerRadiusWrapperView *)self _updateMaskedCorners];
  }
}

- (NSArray)contentViews
{
  return (NSArray *)[(SBHitTestExtendedView *)self->_trailingCornersMaskingView subviews];
}

- (void)addContentView:(id)a3
{
}

- (void)bringContentViewToFront:(id)a3
{
}

- (void)sendContentViewToBack:(id)a3
{
}

- (void)_updateCornerRadius
{
  id v5 = [(SBAsymmetricalCornerRadiusWrapperView *)self cornerRadiusConfiguration];
  BOOL v3 = [(SBAsymmetricalCornerRadiusWrapperView *)self layer];
  [v5 topLeft];
  objc_msgSend(v3, "setCornerRadius:");

  v4 = [(SBHitTestExtendedView *)self->_trailingCornersMaskingView layer];
  [v5 topRight];
  objc_msgSend(v4, "setCornerRadius:");
}

- (void)_updateMaskedCorners
{
  unint64_t v3 = [(SBAsymmetricalCornerRadiusWrapperView *)self maskedCorners];
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFFFF5;
  unint64_t v5 = v3 & 0xFFFFFFFFFFFFFFFALL;
  id v6 = [(SBAsymmetricalCornerRadiusWrapperView *)self layer];
  [v6 setMaskedCorners:v4];

  id v7 = [(SBHitTestExtendedView *)self->_trailingCornersMaskingView layer];
  [v7 setMaskedCorners:v5];
}

- (BSCornerRadiusConfiguration)cornerRadiusConfiguration
{
  return self->_cornerRadiusConfiguration;
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (uint64_t)trailingCornersMaskingView
{
  if (result) {
    return *(void *)(result + 432);
  }
  return result;
}

- (void)setTrailingCornersMaskingView:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 432), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingCornersMaskingView, 0);
  objc_storeStrong((id *)&self->_cornerRadiusConfiguration, 0);
}

@end