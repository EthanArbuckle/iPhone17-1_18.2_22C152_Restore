@interface SBHLibraryPodCrossfadeView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SBHLibraryPodCrossfadeView)initWithBackgroundView:(id)a3 podIconView:(id)a4;
- (SBHLibraryPodCrossfadeView)initWithCoder:(id)a3;
- (SBHLibraryPodCrossfadeView)initWithForegroundView:(id)a3 podIconView:(id)a4;
- (SBHLibraryPodCrossfadeView)initWithFrame:(CGRect)a3;
- (SBIconImageInfo)iconImageInfo;
- (SBIconView)podIconView;
- (void)layoutSubviews;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setPodIconViewCrossfadeFraction:(double)a3;
- (void)setSourceViewCrossfadeFraction:(double)a3;
@end

@implementation SBHLibraryPodCrossfadeView

- (SBHLibraryPodCrossfadeView)initWithForegroundView:(id)a3 podIconView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [v8 bounds];
  v16.receiver = self;
  v16.super_class = (Class)SBHLibraryPodCrossfadeView;
  v9 = -[SBHLibraryPodCrossfadeView initWithFrame:](&v16, sel_initWithFrame_);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_podIconView, a4);
    objc_storeStrong((id *)&v10->_foregroundView, a3);
    [v8 iconImageInfo];
    v10->_iconImageInfo.size.width = v11;
    v10->_iconImageInfo.size.height = v12;
    v10->_iconImageInfo.scale = v13;
    v10->_iconImageInfo.continuousCornerRadius = v14;
  }

  return v10;
}

- (SBHLibraryPodCrossfadeView)initWithBackgroundView:(id)a3 podIconView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [v8 bounds];
  v16.receiver = self;
  v16.super_class = (Class)SBHLibraryPodCrossfadeView;
  v9 = -[SBHLibraryPodCrossfadeView initWithFrame:](&v16, sel_initWithFrame_);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_podIconView, a4);
    objc_storeStrong((id *)&v10->_backgroundView, a3);
    [v8 iconImageInfo];
    v10->_iconImageInfo.size.width = v11;
    v10->_iconImageInfo.size.height = v12;
    v10->_iconImageInfo.scale = v13;
    v10->_iconImageInfo.continuousCornerRadius = v14;
  }

  return v10;
}

- (SBHLibraryPodCrossfadeView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (SBHLibraryPodCrossfadeView)initWithCoder:(id)a3
{
  return 0;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius, v3, v4, v5, v6))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    [(SBHLibraryPodCrossfadeView *)self setNeedsLayout];
  }
}

- (void)setPodIconViewCrossfadeFraction:(double)a3
{
  podIconView = self->_podIconView;
  if (self->_foregroundView)
  {
    -[SBIconView setIconImageAlpha:](podIconView, "setIconImageAlpha:");
  }
  else
  {
    id v7 = [(SBIconView *)podIconView customIconImageViewController];
    double v6 = [v7 backgroundView];
    [v6 setAlpha:a3];
  }
}

- (void)setSourceViewCrossfadeFraction:(double)a3
{
  foregroundView = self->_foregroundView;
  if (!foregroundView) {
    foregroundView = (SBHLibraryCategoryStackView *)self->_backgroundView;
  }
  [(SBHLibraryCategoryStackView *)foregroundView setAlpha:1.0 - a3];
}

- (CGSize)intrinsicContentSize
{
  [(SBIconView *)self->_podIconView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[SBIconView sizeThatFits:](self->_podIconView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)SBHLibraryPodCrossfadeView;
  [(SBHLibraryPodCrossfadeView *)&v25 layoutSubviews];
  double v3 = self->_backgroundView;
  double v4 = v3;
  if (v3)
  {
    double v5 = [(UIView *)v3 superview];

    if (v5 != self) {
      [(SBHLibraryPodCrossfadeView *)self addSubview:v4];
    }
  }
  double v6 = self->_podIconView;
  id v7 = [(SBIconView *)v6 superview];

  if (v7 != self) {
    [(SBHLibraryPodCrossfadeView *)self addSubview:v6];
  }
  double v8 = self->_foregroundView;
  double v9 = v8;
  double v10 = (SBHLibraryCategoryStackView *)v4;
  if (v8)
  {
    CGFloat v11 = [(SBHLibraryCategoryStackView *)v8 superview];

    double v10 = v9;
    if (v11 != self)
    {
      [(SBHLibraryPodCrossfadeView *)self addSubview:v9];
      double v10 = v9;
    }
  }
  [(SBHLibraryPodCrossfadeView *)self bounds];
  UIRectGetCenter();
  double v13 = v12;
  double v15 = v14;
  -[SBIconView setCenter:](v6, "setCenter:");
  -[SBHLibraryCategoryStackView setCenter:](v9, "setCenter:", v13, v15);
  -[UIView setCenter:](v4, "setCenter:", v13, v15);
  objc_super v16 = v10;
  [(SBIconView *)v6 bounds];
  double v18 = v17;
  [(SBHLibraryCategoryStackView *)v16 bounds];
  CGFloat v20 = v18 / v19;
  CGAffineTransformMakeScale(&v24, v20, v20);
  [(SBHLibraryCategoryStackView *)v16 setTransform:&v24];
  double continuousCornerRadius = self->_iconImageInfo.continuousCornerRadius;
  -[SBIconView setIconImageInfo:](v6, "setIconImageInfo:", self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, continuousCornerRadius);
  double v22 = continuousCornerRadius / v20;
  if (v9)
  {
    v23 = v9;
    [(SBHLibraryCategoryStackView *)v23 iconImageInfo];
    -[SBHLibraryCategoryStackView setIconImageInfo:](v23, "setIconImageInfo:");
  }
  else
  {
    [(UIView *)v4 _setContinuousCornerRadius:v22];
  }
}

- (SBIconView)podIconView
{
  return self->_podIconView;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_podIconView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
}

@end