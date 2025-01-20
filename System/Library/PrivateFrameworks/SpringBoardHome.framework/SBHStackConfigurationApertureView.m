@interface SBHStackConfigurationApertureView
- (BOOL)usesConcentricCorners;
- (NSSet)backgroundViews;
- (SBHStackConfigurationApertureView)initWithFrame:(CGRect)a3 iconViewBackgroundType:(int64_t)a4;
- (SBIconImageInfo)iconImageInfo;
- (SBIconListView)iconListView;
- (UIScrollView)contentScrollView;
- (UIView)widgetStackMatchingBackgroundView;
- (void)_updateBackgroundFilterView;
- (void)layoutSubviews;
- (void)setContentScrollView:(id)a3;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setIconListView:(id)a3;
- (void)setUsesConcentricCorners:(BOOL)a3;
@end

@implementation SBHStackConfigurationApertureView

- (SBHStackConfigurationApertureView)initWithFrame:(CGRect)a3 iconViewBackgroundType:(int64_t)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)SBHStackConfigurationApertureView;
  v5 = -[SBHStackConfigurationApertureView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F743C8];
    v7 = SBHBundle();
    v8 = [v6 materialViewWithRecipeNamed:@"stackConfigurationForeground" inBundle:v7 options:0 initialWeighting:0 scaleAdjustment:1.0];

    [v8 setAutoresizingMask:18];
    [v8 setGroupNameBase:@"Widget-Stack-Configuration-FG"];
    [(SBHStackConfigurationApertureView *)v5 addSubview:v8];
    objc_storeStrong((id *)&v5->_backgroundMaterialView, v8);
    id v9 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v10 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v10 setAutoresizingMask:18];
    [(SBHStackConfigurationApertureView *)v5 addSubview:v10];
    objc_storeStrong((id *)&v5->_backgroundFilterView, v10);
    [(SBHStackConfigurationApertureView *)v5 _updateBackgroundFilterView];
    v11 = self;
    v19[0] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    id v13 = (id)[(SBHStackConfigurationApertureView *)v5 registerForTraitChanges:v12 withAction:sel__updateBackgroundFilterView];

    v14 = [(SBHStackConfigurationApertureView *)v5 traitCollection];
    v15 = +[SBIconView componentBackgroundViewOfType:a4 compatibleWithTraitCollection:v14 initialWeighting:1.0];

    if (v15)
    {
      [v15 setAutoresizingMask:18];
      [(SBHStackConfigurationApertureView *)v5 addSubview:v15];
      objc_storeStrong((id *)&v5->_backgroundStackMatchingView, v15);
    }
    v16 = [(SBHStackConfigurationApertureView *)v5 layer];
    [v16 setCornerCurve:*MEMORY[0x1E4F39EA8]];

    v5->_usesConcentricCorners = 0;
  }
  return v5;
}

- (void)setUsesConcentricCorners:(BOOL)a3
{
  if (self->_usesConcentricCorners != a3)
  {
    self->_usesConcentricCorners = a3;
    [(SBHStackConfigurationApertureView *)self setNeedsLayout];
  }
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
    [(SBHStackConfigurationApertureView *)self setNeedsLayout];
  }
}

- (NSSet)backgroundViews
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", self->_backgroundFilterView, self->_backgroundMaterialView, 0);
}

- (UIView)widgetStackMatchingBackgroundView
{
  return self->_backgroundStackMatchingView;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)SBHStackConfigurationApertureView;
  [(SBHStackConfigurationApertureView *)&v18 layoutSubviews];
  [(SBHStackConfigurationApertureView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double width = self->_iconImageInfo.size.width;
  double height = self->_iconImageInfo.size.height;
  double continuousCornerRadius = self->_iconImageInfo.continuousCornerRadius;
  [(SBIconListView *)self->_iconListView iconContentScale];
  double v11 = v10;
  if ([(SBHStackConfigurationApertureView *)self usesConcentricCorners])
  {
    v12 = [(SBHStackConfigurationApertureView *)self layer];
    id v13 = v12;
    double v14 = continuousCornerRadius + (v4 - width * v11) * 0.5;
  }
  else
  {
    if (width <= height) {
      double v15 = width;
    }
    else {
      double v15 = height;
    }
    if (v15 == 0.0) {
      double v16 = 0.0;
    }
    else {
      double v16 = continuousCornerRadius / v15;
    }
    v12 = [(SBHStackConfigurationApertureView *)self layer];
    id v13 = v12;
    if (v4 <= v6) {
      double v17 = v4;
    }
    else {
      double v17 = v6;
    }
    double v14 = v16 * v17;
  }
  [v12 setCornerRadius:v14];

  UIEdgeInsetsMakeWithEdges();
  [(SBIconListView *)self->_iconListView setAdditionalLayoutInsets:"setAdditionalLayoutInsets:"];
}

- (void)_updateBackgroundFilterView
{
  double v3 = [(SBHStackConfigurationApertureView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  double v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  double v6 = v5;
  double v7 = dbl_1D81E7230[v4 == 2];
  if (v4 == 2) {
    double v8 = (void *)MEMORY[0x1E4F3A2E0];
  }
  else {
    double v8 = (void *)MEMORY[0x1E4F3A2E8];
  }
  id v11 = [v5 colorWithAlphaComponent:v7];

  [(UIView *)self->_backgroundFilterView setBackgroundColor:v11];
  double v9 = [MEMORY[0x1E4F39BC0] filterWithType:*v8];
  double v10 = [(UIView *)self->_backgroundFilterView layer];
  [v10 setCompositingFilter:v9];
}

- (BOOL)usesConcentricCorners
{
  return self->_usesConcentricCorners;
}

- (SBIconListView)iconListView
{
  return self->_iconListView;
}

- (void)setIconListView:(id)a3
{
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (UIScrollView)contentScrollView
{
  return self->_contentScrollView;
}

- (void)setContentScrollView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentScrollView, 0);
  objc_storeStrong((id *)&self->_iconListView, 0);
  objc_storeStrong((id *)&self->_backgroundFilterView, 0);
  objc_storeStrong((id *)&self->_backgroundStackMatchingView, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
}

@end