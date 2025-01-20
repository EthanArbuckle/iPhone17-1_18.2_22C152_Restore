@interface TPSOutroTipCollectionViewCell
- (BOOL)setTip:(id)a3 withCellAppearance:(id)a4;
- (TPSOutroTipCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)setParallaxOffset:(CGPoint)a3;
- (void)updateConstraints;
@end

@implementation TPSOutroTipCollectionViewCell

- (TPSOutroTipCollectionViewCell)initWithFrame:(CGRect)a3
{
  v64.receiver = self;
  v64.super_class = (Class)TPSOutroTipCollectionViewCell;
  v3 = -[TPSBookendsCollectionViewCell initWithFrame:](&v64, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v61 = [(TPSOutroTipCollectionViewCell *)v3 contentView];
    v5 = [(TPSBaseTipCollectionViewCell *)v4 contentScrollView];
    v6 = (UIView *)objc_alloc_init((Class)UIView);
    standardAssetLayoutGuide = v4->_standardAssetLayoutGuide;
    v4->_standardAssetLayoutGuide = v6;

    [(UIView *)v4->_standardAssetLayoutGuide setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 addSubview:v4->_standardAssetLayoutGuide];
    v8 = [(UIView *)v4->_standardAssetLayoutGuide heightAnchor];
    uint64_t v9 = [v8 constraintEqualToConstant:0.0];
    standardAssetLayoutGuideHeightConstraint = v4->_standardAssetLayoutGuideHeightConstraint;
    v4->_standardAssetLayoutGuideHeightConstraint = (NSLayoutConstraint *)v9;

    [(NSLayoutConstraint *)v4->_standardAssetLayoutGuideHeightConstraint setActive:1];
    v11 = [(UIView *)v4->_standardAssetLayoutGuide topAnchor];
    v63 = v5;
    v12 = [v5 topAnchor];
    uint64_t v13 = [v11 constraintEqualToAnchor:v12];
    standardAssetLayoutGuideTopConstraint = v4->_standardAssetLayoutGuideTopConstraint;
    v4->_standardAssetLayoutGuideTopConstraint = (NSLayoutConstraint *)v13;

    [(NSLayoutConstraint *)v4->_standardAssetLayoutGuideTopConstraint setActive:1];
    v15 = [(UIView *)v4->_standardAssetLayoutGuide topAnchor];
    v16 = [(TPSBaseTipCollectionViewCell *)v4 titleLabel];
    v17 = [v16 bottomAnchor];
    uint64_t v18 = [v15 constraintEqualToAnchor:v17];
    standardAssetLayoutGuideToTitleTopConstraint = v4->_standardAssetLayoutGuideToTitleTopConstraint;
    v4->_standardAssetLayoutGuideToTitleTopConstraint = (NSLayoutConstraint *)v18;

    v20 = [(UIView *)v4->_standardAssetLayoutGuide widthAnchor];
    v21 = [v61 widthAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    [v22 setActive:1];

    v62 = [(TPSBaseTipCollectionViewCell *)v4 titleLabel];
    v23 = [(TPSBaseTipCollectionViewCell *)v4 contentLabel];
    v24 = [v23 centerXAnchor];
    v25 = [v5 frameLayoutGuide];
    v26 = [v25 centerXAnchor];
    v60 = [v24 constraintEqualToAnchor:v26];

    v27 = [v23 widthAnchor];
    v28 = [v62 widthAnchor];
    v59 = [v27 constraintEqualToAnchor:v28];

    v29 = [v23 topAnchor];
    v30 = [(UIView *)v4->_standardAssetLayoutGuide bottomAnchor];
    uint64_t v31 = [v29 constraintEqualToAnchor:v30];
    contentLabelTopConstraint = v4->_contentLabelTopConstraint;
    v4->_contentLabelTopConstraint = (NSLayoutConstraint *)v31;

    v33 = [v23 bottomAnchor];
    v34 = [(TPSBaseTipCollectionViewCell *)v4 contentScrollView];
    v35 = [v34 bottomAnchor];
    uint64_t v36 = [v33 constraintEqualToAnchor:v35];
    contentLabelBottomConstraint = v4->_contentLabelBottomConstraint;
    v4->_contentLabelBottomConstraint = (NSLayoutConstraint *)v36;

    LODWORD(v38) = 1147224064;
    [(NSLayoutConstraint *)v4->_contentLabelBottomConstraint setPriority:v38];
    v66[0] = v4->_contentLabelTopConstraint;
    v66[1] = v60;
    v66[2] = v59;
    v66[3] = v4->_contentLabelBottomConstraint;
    v39 = +[NSArray arrayWithObjects:v66 count:4];
    [(TPSBaseTipCollectionViewCell *)v4 setContentLabelConstraints:v39];

    [(TPSBaseTipCollectionViewCell *)v4 setNeedsTextView:0];
    v40 = [(TPSBaseTipCollectionViewCell *)v4 contentTextView];
    v41 = [v40 centerXAnchor];
    v42 = [v63 frameLayoutGuide];
    v43 = [v42 centerXAnchor];
    v44 = [v41 constraintEqualToAnchor:v43];

    v45 = [v40 widthAnchor];
    v46 = [v62 widthAnchor];
    v47 = [v45 constraintEqualToAnchor:v46];

    v48 = [v40 topAnchor];
    v49 = [(UIView *)v4->_standardAssetLayoutGuide bottomAnchor];
    uint64_t v50 = [v48 constraintEqualToAnchor:v49];
    textViewTopConstraint = v4->_textViewTopConstraint;
    v4->_textViewTopConstraint = (NSLayoutConstraint *)v50;

    v52 = [v40 bottomAnchor];
    v53 = [(TPSBaseTipCollectionViewCell *)v4 contentScrollView];
    v54 = [v53 bottomAnchor];
    uint64_t v55 = [v52 constraintEqualToAnchor:v54];
    textViewBottomConstraint = v4->_textViewBottomConstraint;
    v4->_textViewBottomConstraint = (NSLayoutConstraint *)v55;

    v65[0] = v4->_textViewTopConstraint;
    v65[1] = v44;
    v65[2] = v47;
    v65[3] = v4->_textViewBottomConstraint;
    v57 = +[NSArray arrayWithObjects:v65 count:4];
    [(TPSBaseTipCollectionViewCell *)v4 setContentTextViewConstraints:v57];

    [(TPSBaseTipCollectionViewCell *)v4 updateFonts];
  }
  return v4;
}

- (void)setParallaxOffset:(CGPoint)a3
{
  double x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)TPSOutroTipCollectionViewCell;
  -[TPSBaseTipCollectionViewCell setParallaxOffset:](&v6, "setParallaxOffset:", a3.x, a3.y);
  v5 = [(TPSBookendsCollectionViewCell *)self titleLabelCenterXConstraint];
  [v5 setConstant:x * -4.0];
}

- (BOOL)setTip:(id)a3 withCellAppearance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 size];
  double v9 = v8;
  double v11 = v10;
  [(TPSBaseTipCollectionViewCell *)self cacheCellSize];
  BOOL v14 = v11 != v13 || v9 != v12;
  id v15 = [(TPSBaseTipCollectionViewCell *)self tip];

  v19.receiver = self;
  v19.super_class = (Class)TPSOutroTipCollectionViewCell;
  [(TPSBookendsCollectionViewCell *)&v19 setTip:v6 withCellAppearance:v7];

  if (v15 != v6 || v14)
  {
    v16 = +[TPSImageAssetView defaultBackgroundColor];
    v17 = [(TPSBaseTipCollectionViewCell *)self contentScrollView];
    [v17 setBackgroundColor:v16];

    -[TPSBaseTipCollectionViewCell setNeedsTextView:](self, "setNeedsTextView:", [v6 containsLinks]);
    if (v14) {
      [(TPSOutroTipCollectionViewCell *)self setNeedsUpdateConstraints];
    }
  }

  return v15 != v6;
}

- (void)updateConstraints
{
  [(TPSBaseTipCollectionViewCell *)self bottomPadding];
  double v4 = v3;
  -[NSLayoutConstraint setConstant:](self->_contentLabelBottomConstraint, "setConstant:");
  [(NSLayoutConstraint *)self->_textViewBottomConstraint setConstant:v4];
  v5 = [(TPSBaseTipCollectionViewCell *)self cellAppearance];
  [v5 outroTextLabelTopPadding];
  double v7 = v6;

  [(NSLayoutConstraint *)self->_contentLabelTopConstraint setConstant:v7];
  [(NSLayoutConstraint *)self->_textViewTopConstraint setConstant:v7];
  double v8 = [(TPSBaseTipCollectionViewCell *)self cellAppearance];
  [v8 assetHeight];
  -[NSLayoutConstraint setConstant:](self->_standardAssetLayoutGuideHeightConstraint, "setConstant:");

  v9.receiver = self;
  v9.super_class = (Class)TPSOutroTipCollectionViewCell;
  [(TPSBookendsCollectionViewCell *)&v9 updateConstraints];
  [(NSLayoutConstraint *)self->_standardAssetLayoutGuideTopConstraint setActive:[(TPSBookendsCollectionViewCell *)self bookendAssetUnderTitle] ^ 1];
  [(NSLayoutConstraint *)self->_standardAssetLayoutGuideToTitleTopConstraint setActive:[(TPSBookendsCollectionViewCell *)self bookendAssetUnderTitle]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_standardAssetLayoutGuideToTitleTopConstraint, 0);
  objc_storeStrong((id *)&self->_standardAssetLayoutGuideTopConstraint, 0);
  objc_storeStrong((id *)&self->_standardAssetLayoutGuideHeightConstraint, 0);

  objc_storeStrong((id *)&self->_standardAssetLayoutGuide, 0);
}

@end