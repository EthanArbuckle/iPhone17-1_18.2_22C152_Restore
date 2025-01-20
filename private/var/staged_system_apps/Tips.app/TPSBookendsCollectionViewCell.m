@interface TPSBookendsCollectionViewCell
- (BOOL)bookendAssetUnderTitle;
- (BOOL)setTip:(id)a3 withCellAppearance:(id)a4;
- (NSLayoutConstraint)titleLabelCenterXConstraint;
- (TPSBookendsCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)titleFont;
- (void)setBookendAssetUnderTitle:(BOOL)a3;
- (void)setTitleLabelCenterXConstraint:(id)a3;
- (void)updateConstraints;
@end

@implementation TPSBookendsCollectionViewCell

- (TPSBookendsCollectionViewCell)initWithFrame:(CGRect)a3
{
  v34.receiver = self;
  v34.super_class = (Class)TPSBookendsCollectionViewCell;
  v3 = -[TPSBaseTipCollectionViewCell initWithFrame:](&v34, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[TPSAppearance defaultBackgroundColor];
    [(TPSBaseTipCollectionViewCell *)v3 setNoImageBackgroundColorOverride:v4];

    v5 = [(TPSBaseTipCollectionViewCell *)v3 heroAssetView];
    v6 = [(TPSBaseTipCollectionViewCell *)v3 titleLabel];
    v7 = [(TPSBaseTipCollectionViewCell *)v3 contentScrollView];
    v8 = [v5 topAnchor];
    v9 = [v7 topAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    [v10 setActive:1];

    v11 = [v5 widthAnchor];
    uint64_t v12 = [v11 constraintEqualToConstant:0.0];
    heroAssetViewWidthConstraint = v3->_heroAssetViewWidthConstraint;
    v3->_heroAssetViewWidthConstraint = (NSLayoutConstraint *)v12;

    [(NSLayoutConstraint *)v3->_heroAssetViewWidthConstraint setActive:1];
    v14 = [v5 heightAnchor];
    v15 = [v14 constraintEqualToConstant:0.0];
    [(TPSBaseTipCollectionViewCell *)v3 setAssetViewHeightConstraint:v15];

    v16 = [(TPSBaseTipCollectionViewCell *)v3 assetViewHeightConstraint];
    [v16 setActive:1];

    v17 = [v5 centerXAnchor];
    v18 = [v7 centerXAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];

    [v19 setActive:1];
    [(TPSBaseTipCollectionViewCell *)v3 setAssetViewLayoutGuideCenterXConstraint:v19];
    v20 = +[UIColor clearColor];
    [v6 setBackgroundColor:v20];

    v21 = [v7 frameLayoutGuide];
    v22 = [v6 centerXAnchor];
    v23 = [v21 centerXAnchor];
    uint64_t v24 = [v22 constraintEqualToAnchor:v23];
    titleLabelCenterXConstraint = v3->_titleLabelCenterXConstraint;
    v3->_titleLabelCenterXConstraint = (NSLayoutConstraint *)v24;

    [(NSLayoutConstraint *)v3->_titleLabelCenterXConstraint setActive:1];
    v26 = [v6 widthAnchor];
    v27 = [v21 widthAnchor];
    uint64_t v28 = [v26 constraintEqualToAnchor:v27];
    titleLabelWidthConstraint = v3->_titleLabelWidthConstraint;
    v3->_titleLabelWidthConstraint = (NSLayoutConstraint *)v28;

    [(NSLayoutConstraint *)v3->_titleLabelWidthConstraint setActive:1];
    v30 = [v6 topAnchor];
    v31 = [v7 topAnchor];
    v32 = [v30 constraintEqualToAnchor:v31 constant:40.0];
    [v32 setActive:1];

    [(TPSBaseTipCollectionViewCell *)v3 updateFonts];
  }
  return v3;
}

- (BOOL)setTip:(id)a3 withCellAppearance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 size];
  double v9 = v8;
  double v11 = v10;
  [(TPSBaseTipCollectionViewCell *)self cacheCellSize];
  BOOL v14 = v11 == v13 && v9 == v12;
  v29.receiver = self;
  v29.super_class = (Class)TPSBookendsCollectionViewCell;
  BOOL v15 = [(TPSBaseTipCollectionViewCell *)&v29 setTip:v6 withCellAppearance:v7];
  unsigned int v16 = [v6 isOutro];
  double v17 = 1.0;
  if (v16)
  {
    [v7 outroWidthMultiplier:1.0];
    double v17 = -v18;
  }
  [(TPSBaseTipCollectionViewCell *)self setImageParallaxMultiplier:v17];
  v19 = [(TPSBaseTipCollectionViewCell *)self titleLabel];
  [v19 setAccessibilityIgnoresInvertColors:0];

  v20 = [(TPSBaseTipCollectionViewCell *)self contentLabel];
  [v20 setAccessibilityIgnoresInvertColors:0];

  v21 = [v6 fullContent];
  id v22 = [v21 labelStyle];

  if (v22) {
    +[UIColor whiteColor];
  }
  else {
  v23 = +[TPSAppearance defaultLabelColor];
  }
  uint64_t v24 = [(TPSBaseTipCollectionViewCell *)self titleLabel];
  [v24 setTextColor:v23];

  v25 = [(TPSBaseTipCollectionViewCell *)self titleLabel];
  v26 = [v25 textColor];
  v27 = [(TPSBaseTipCollectionViewCell *)self contentLabel];
  [v27 setTextColor:v26];

  if (!v14) {
    [(TPSBookendsCollectionViewCell *)self setNeedsUpdateConstraints];
  }

  return v15;
}

- (id)titleFont
{
  return +[TPSAppearance systemFontOfSize:40.0 weight:UIFontWeightBold];
}

- (void)updateConstraints
{
  v16.receiver = self;
  v16.super_class = (Class)TPSBookendsCollectionViewCell;
  [(TPSBaseTipCollectionViewCell *)&v16 updateConstraints];
  v3 = [(TPSBaseTipCollectionViewCell *)self cellAppearance];
  [v3 size];
  double v5 = v4;
  [v3 bookendsHeightMultiplier];
  double v7 = v6;
  [v3 size];
  double v9 = v8;
  double v10 = [(TPSBaseTipCollectionViewCell *)self tip];
  if ([v10 isOutro])
  {
    [v3 outroWidthMultiplier];
    double v12 = v11;

    if (v12 != 0.0)
    {
      [v3 outroWidthMultiplier];
      double v9 = v9 * v13;
    }
  }
  else
  {
  }
  BOOL v14 = [(TPSBaseTipCollectionViewCell *)self heroAssetView];
  [v14 setAspectFillAsset:1];

  [(NSLayoutConstraint *)self->_heroAssetViewWidthConstraint setConstant:v9];
  [(NSLayoutConstraint *)self->_heroAssetViewHeightConstraint setConstant:ceil(v5 * v7)];
  [v3 bookendsContentSidePadding];
  [(NSLayoutConstraint *)self->_titleLabelWidthConstraint setConstant:v15 * -2.0];
}

- (BOOL)bookendAssetUnderTitle
{
  return self->_bookendAssetUnderTitle;
}

- (void)setBookendAssetUnderTitle:(BOOL)a3
{
  self->_bookendAssetUnderTitle = a3;
}

- (NSLayoutConstraint)titleLabelCenterXConstraint
{
  return self->_titleLabelCenterXConstraint;
}

- (void)setTitleLabelCenterXConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabelCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_heroAssetViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_heroAssetViewWidthConstraint, 0);

  objc_storeStrong((id *)&self->_titleLabelWidthConstraint, 0);
}

@end