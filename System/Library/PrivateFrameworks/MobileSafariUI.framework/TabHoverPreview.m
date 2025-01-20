@interface TabHoverPreview
- (BOOL)insetsPreviewFromTabBarEdge;
- (NSString)secondaryTitleText;
- (NSString)titleText;
- (TabHoverPreview)initWithTabBar:(id)a3;
- (UIView)tabBar;
- (double)topInset;
- (void)_setPositionalConstraintsActive:(BOOL)a3;
- (void)_updateConstraintsWithItemView:(id)a3;
- (void)dismissPreview;
- (void)setInsetsPreviewFromTabBarEdge:(BOOL)a3;
- (void)setSecondaryTitleText:(id)a3;
- (void)setSnapshotImage:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setTopInset:(double)a3;
- (void)showPreviewForItemView:(id)a3;
@end

@implementation TabHoverPreview

- (void)setInsetsPreviewFromTabBarEdge:(BOOL)a3
{
  self->_insetsPreviewFromTabBarEdge = a3;
}

- (TabHoverPreview)initWithTabBar:(id)a3
{
  v104[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v90.receiver = self;
  v90.super_class = (Class)TabHoverPreview;
  v5 = -[TabHoverPreview initWithFrame:](&v90, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_tabBar, v4);
    [(TabHoverPreview *)v6 setUserInteractionEnabled:0];
    [(TabHoverPreview *)v6 setAlpha:0.0];
    v7 = [(TabHoverPreview *)v6 layer];
    [v7 setShadowRadius:8.0];
    v88 = v7;
    [v7 setShadowPathIsBounds:1];
    id v8 = [MEMORY[0x1E4FB1618] blackColor];
    objc_msgSend(v7, "setShadowColor:", objc_msgSend(v8, "CGColor"));

    objc_msgSend(v7, "setShadowOffset:", 0.0, 4.0);
    LODWORD(v9) = 1039516303;
    [v7 setShadowOpacity:v9];
    id v10 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [v10 layer];
    [v11 setCornerRadius:10.0];

    uint64_t v12 = *MEMORY[0x1E4F39EA8];
    [v10 layer];
    v13 = id v89 = v4;
    [v13 setCornerCurve:v12];

    v14 = [v10 layer];
    [v14 setMasksToBounds:1];

    [(TabHoverPreview *)v6 addSubview:v10];
    v87 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v87];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = v15;
    [v10 addSubview:v15];
    v17 = objc_alloc_init(TabSnapshotImageView);
    snapshotView = v6->_snapshotView;
    v6->_snapshotView = v17;

    [(TabSnapshotImageView *)v6->_snapshotView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TabSnapshotImageView *)v6->_snapshotView setClipsToBounds:1];
    [v10 addSubview:v6->_snapshotView];
    v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = v19;

    v21 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:14.0];
    [(UILabel *)v6->_titleLabel setFont:v21];

    v22 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v6->_titleLabel setTextColor:v22];

    [(UILabel *)v6->_titleLabel setNumberOfLines:5];
    [(UILabel *)v6->_titleLabel sizeToFit];
    v23 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    secondaryTitleLabel = v6->_secondaryTitleLabel;
    v6->_secondaryTitleLabel = v23;

    v25 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:12.0];
    [(UILabel *)v6->_secondaryTitleLabel setFont:v25];

    v26 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v6->_secondaryTitleLabel setTextColor:v26];

    [(UILabel *)v6->_secondaryTitleLabel setNumberOfLines:2];
    [(UILabel *)v6->_secondaryTitleLabel sizeToFit];
    id v27 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v104[0] = v6->_titleLabel;
    v104[1] = v6->_secondaryTitleLabel;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:2];
    v29 = (void *)[v27 initWithArrangedSubviews:v28];

    [v29 setAxis:1];
    [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v29 setLayoutMarginsRelativeArrangement:1];
    objc_msgSend(v29, "setDirectionalLayoutMargins:", 12.0, 16.0, 12.0, 16.0);
    LODWORD(v30) = 1144750080;
    [v29 setContentCompressionResistancePriority:1 forAxis:v30];
    v31 = v29;
    [v10 addSubview:v29];
    v70 = (void *)MEMORY[0x1E4F28DC8];
    v86 = [(TabHoverPreview *)v6 widthAnchor];
    v85 = [v86 constraintEqualToConstant:240.0];
    v91[0] = v85;
    v84 = [v10 leadingAnchor];
    v83 = [(TabHoverPreview *)v6 leadingAnchor];
    v82 = [v84 constraintEqualToAnchor:v83];
    v91[1] = v82;
    v81 = [v10 topAnchor];
    v80 = [(TabHoverPreview *)v6 topAnchor];
    v79 = [v81 constraintEqualToAnchor:v80];
    v91[2] = v79;
    v78 = [v10 widthAnchor];
    v77 = [(TabHoverPreview *)v6 widthAnchor];
    v76 = [v78 constraintEqualToAnchor:v77];
    v91[3] = v76;
    v32 = [v10 heightAnchor];
    v33 = [(TabHoverPreview *)v6 heightAnchor];
    uint64_t v34 = [v32 constraintEqualToAnchor:v33];
    heightConstraint = v6->_heightConstraint;
    v6->_heightConstraint = (NSLayoutConstraint *)v34;

    v92 = v6->_heightConstraint;
    v74 = v92;
    v73 = [v16 leadingAnchor];
    v72 = [v10 leadingAnchor];
    v71 = [v73 constraintEqualToAnchor:v72];
    v93 = v71;
    v69 = [v16 topAnchor];
    v68 = [v10 topAnchor];
    v67 = [v69 constraintEqualToAnchor:v68];
    v94 = v67;
    v75 = v16;
    v66 = [v16 widthAnchor];
    v65 = [v10 widthAnchor];
    v64 = [v66 constraintEqualToAnchor:v65];
    v95 = v64;
    v63 = [v16 heightAnchor];
    v62 = [v10 heightAnchor];
    v61 = [v63 constraintEqualToAnchor:v62];
    v96 = v61;
    v59 = [(TabSnapshotImageView *)v6->_snapshotView leadingAnchor];
    v58 = [v10 leadingAnchor];
    v57 = [v59 constraintEqualToAnchor:v58];
    v97 = v57;
    v56 = [(TabSnapshotImageView *)v6->_snapshotView topAnchor];
    v55 = [v10 topAnchor];
    v54 = [v56 constraintEqualToAnchor:v55];
    v98 = v54;
    v53 = [(TabSnapshotImageView *)v6->_snapshotView widthAnchor];
    v52 = [v10 widthAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v99 = v51;
    v50 = [v31 leadingAnchor];
    v49 = [v10 leadingAnchor];
    v48 = [v50 constraintEqualToAnchor:v49];
    v100 = v48;
    v47 = [v31 topAnchor];
    v46 = [(TabSnapshotImageView *)v6->_snapshotView bottomAnchor];
    v36 = [v47 constraintEqualToAnchor:v46];
    v101 = v36;
    v60 = v31;
    v37 = [v31 widthAnchor];
    v38 = [v10 widthAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    v102 = v39;
    v40 = [v31 bottomAnchor];
    v41 = [v10 bottomAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    v103 = v42;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:16];
    [v70 activateConstraints:v43];

    id v4 = v89;
    v44 = v6;
  }
  return v6;
}

- (void)setSnapshotImage:(id)a3
{
  id v16 = a3;
  id v4 = [(TabSnapshotImageView *)self->_snapshotView image];

  v5 = v16;
  if (v4 != v16)
  {
    [(TabSnapshotImageView *)self->_snapshotView setImage:v16];
    v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;

    if (v16) {
      double v11 = fmin((v10 + -100.0) / v8, 1.0);
    }
    else {
      double v11 = 0.0;
    }
    [(NSLayoutConstraint *)self->_snapshotHeightWidthRatioConstraint setActive:0];
    uint64_t v12 = [(TabSnapshotImageView *)self->_snapshotView heightAnchor];
    v13 = [(TabSnapshotImageView *)self->_snapshotView widthAnchor];
    v14 = [v12 constraintEqualToAnchor:v13 multiplier:v11];
    snapshotHeightWidthRatioConstraint = self->_snapshotHeightWidthRatioConstraint;
    self->_snapshotHeightWidthRatioConstraint = v14;

    [(NSLayoutConstraint *)self->_snapshotHeightWidthRatioConstraint setActive:1];
    [(TabHoverPreview *)self setNeedsLayout];
    v5 = v16;
  }
}

- (NSString)titleText
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitleText:(id)a3
{
  id v6 = a3;
  id v4 = [(UILabel *)self->_titleLabel text];
  char v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_titleLabel setText:v6];
    [(TabHoverPreview *)self setNeedsLayout];
  }
}

- (NSString)secondaryTitleText
{
  return [(UILabel *)self->_secondaryTitleLabel text];
}

- (void)setSecondaryTitleText:(id)a3
{
  id v6 = a3;
  id v4 = [(UILabel *)self->_secondaryTitleLabel text];
  char v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_secondaryTitleLabel setText:v6];
    [(TabHoverPreview *)self setNeedsLayout];
  }
}

- (void)showPreviewForItemView:(id)a3
{
  id v4 = a3;
  [(TabHoverPreview *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  [(TabHoverPreview *)self _updateConstraintsWithItemView:v4];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__TabHoverPreview_showPreviewForItemView___block_invoke;
  v5[3] = &unk_1E6D77E20;
  v5[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:0.25];
}

uint64_t __42__TabHoverPreview_showPreviewForItemView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)_updateConstraintsWithItemView:(id)a3
{
  leadingConstraint = self->_leadingConstraint;
  id v5 = a3;
  [(NSLayoutConstraint *)leadingConstraint setActive:0];
  id v6 = [(TabHoverPreview *)self leadingAnchor];
  double v7 = [v5 leadingAnchor];
  double v8 = [v6 constraintGreaterThanOrEqualToAnchor:v7];
  double v9 = self->_leadingConstraint;
  self->_leadingConstraint = v8;

  LODWORD(v10) = 1144750080;
  [(NSLayoutConstraint *)self->_leadingConstraint setPriority:v10];
  [(NSLayoutConstraint *)self->_centerXConstraint setActive:0];
  double v11 = [(TabHoverPreview *)self centerXAnchor];
  uint64_t v12 = [v5 centerXAnchor];

  v13 = [v11 constraintEqualToAnchor:v12];
  centerXConstraint = self->_centerXConstraint;
  self->_centerXConstraint = v13;

  LODWORD(v15) = 1140457472;
  [(NSLayoutConstraint *)self->_centerXConstraint setPriority:v15];
  if (!self->_leadingEdgeConstraint)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
    if (self->_insetsPreviewFromTabBarEdge) {
      double v17 = 5.0;
    }
    else {
      double v17 = 0.0;
    }
    v18 = [(TabHoverPreview *)self leadingAnchor];
    v19 = [WeakRetained leadingAnchor];
    v20 = [v18 constraintGreaterThanOrEqualToAnchor:v19 constant:v17];
    leadingEdgeConstraint = self->_leadingEdgeConstraint;
    self->_leadingEdgeConstraint = v20;

    v22 = [(TabHoverPreview *)self trailingAnchor];
    v23 = [WeakRetained trailingAnchor];
    v24 = [v22 constraintLessThanOrEqualToAnchor:v23 constant:-v17];
    trailingEdgeConstraint = self->_trailingEdgeConstraint;
    self->_trailingEdgeConstraint = v24;

    v26 = [(TabHoverPreview *)self topAnchor];
    id v27 = [WeakRetained bottomAnchor];
    v28 = [v26 constraintEqualToAnchor:v27 constant:self->_topInset];
    [v28 setActive:1];
  }
  [(TabHoverPreview *)self _setPositionalConstraintsActive:1];
}

- (void)_setPositionalConstraintsActive:(BOOL)a3
{
  BOOL v3 = a3;
  v7[5] = *MEMORY[0x1E4F143B8];
  centerXConstraint = self->_centerXConstraint;
  v7[0] = self->_leadingConstraint;
  v7[1] = centerXConstraint;
  leadingEdgeConstraint = self->_leadingEdgeConstraint;
  v7[2] = self->_heightConstraint;
  v7[3] = leadingEdgeConstraint;
  v7[4] = self->_trailingEdgeConstraint;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
  if (v3) {
    [MEMORY[0x1E4F28DC8] activateConstraints:v6];
  }
  else {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:v6];
  }
}

- (void)dismissPreview
{
  if (self->_leadingConstraint)
  {
    [(TabHoverPreview *)self setTranslatesAutoresizingMaskIntoConstraints:1];
    [(TabHoverPreview *)self _setPositionalConstraintsActive:0];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __33__TabHoverPreview_dismissPreview__block_invoke;
    v3[3] = &unk_1E6D77E20;
    v3[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:0.25];
  }
}

uint64_t __33__TabHoverPreview_dismissPreview__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (UIView)tabBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  return (UIView *)WeakRetained;
}

- (BOOL)insetsPreviewFromTabBarEdge
{
  return self->_insetsPreviewFromTabBarEdge;
}

- (double)topInset
{
  return self->_topInset;
}

- (void)setTopInset:(double)a3
{
  self->_topInset = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabBar);
  objc_storeStrong((id *)&self->_snapshotHeightWidthRatioConstraint, 0);
  objc_storeStrong((id *)&self->_trailingEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_leadingEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_centerXConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
}

@end