@interface SBIconLegibilityLabelAccessoryView
- (BOOL)hasBaseline;
- (SBIconLegibilityLabelAccessoryView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)alignmentRectInsets;
- (UIImageView)iconImageView;
- (double)baselineOffsetFromBottom;
- (id)firstBaselineAnchor;
- (id)lastBaselineAnchor;
- (void)updateWithBaseImage:(id)a3 legibilitySettings:(id)a4;
- (void)updateWithLegibilitySettings:(id)a3 labelFont:(id)a4;
@end

@implementation SBIconLegibilityLabelAccessoryView

- (SBIconLegibilityLabelAccessoryView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBIconLegibilityLabelAccessoryView;
  v3 = -[SBIconLegibilityLabelAccessoryView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = v4;

    [(SBIconLegibilityLabelAccessoryView *)v3 addSubview:v3->_iconImageView];
  }
  return v3;
}

- (void)updateWithLegibilitySettings:(id)a3 labelFont:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 primaryColor];
  [(SBIconLegibilityLabelAccessoryView *)self setTintColor:v8];

  v9.receiver = self;
  v9.super_class = (Class)SBIconLegibilityLabelAccessoryView;
  [(SBIconLabelAccessoryView *)&v9 updateWithLegibilitySettings:v7 labelFont:v6];
}

- (void)updateWithBaseImage:(id)a3 legibilitySettings:(id)a4
{
  id v5 = a3;
  id v6 = [(SBIconLegibilityLabelAccessoryView *)self iconImageView];
  [v6 setImage:v5];

  [v6 sizeToFit];
}

- (BOOL)hasBaseline
{
  v2 = [(SBIconLegibilityLabelAccessoryView *)self iconImageView];
  v3 = [v2 image];
  char v4 = [v3 hasBaseline];

  return v4;
}

- (double)baselineOffsetFromBottom
{
  v2 = [(SBIconLegibilityLabelAccessoryView *)self iconImageView];
  v3 = [v2 image];
  [v3 baselineOffsetFromBottom];
  double v5 = v4;

  return v5;
}

- (UIEdgeInsets)alignmentRectInsets
{
  v2 = [(SBIconLegibilityLabelAccessoryView *)self iconImageView];
  v3 = [v2 image];
  [v3 alignmentRectInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (id)firstBaselineAnchor
{
  v2 = [(SBIconLegibilityLabelAccessoryView *)self iconImageView];
  v3 = [v2 firstBaselineAnchor];

  return v3;
}

- (id)lastBaselineAnchor
{
  v2 = [(SBIconLegibilityLabelAccessoryView *)self iconImageView];
  v3 = [v2 lastBaselineAnchor];

  return v3;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void).cxx_destruct
{
}

@end