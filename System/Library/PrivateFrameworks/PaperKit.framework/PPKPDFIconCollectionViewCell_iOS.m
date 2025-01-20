@interface PPKPDFIconCollectionViewCell_iOS
- (BOOL)hasLargeThumbnail;
- (PDFPage)page;
- (PPKPDFIconCollectionViewCell_iOS)initWithCoder:(id)a3;
- (PPKPDFIconCollectionViewCell_iOS)initWithFrame:(CGRect)a3;
- (UIButton)actionsButton;
- (UIImageView)imageView;
- (void)_commonInit;
- (void)_updateMetricsIfNeeded;
- (void)prepareForReuse;
- (void)setActionsButton:(id)a3;
- (void)setHasLargeThumbnail:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setPage:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setThumbnailHeight:(double)a3;
- (void)setThumbnailWidth:(double)a3;
- (void)setupSubviews;
- (void)updateAspectConstraintWithSize:(CGSize)a3;
- (void)updateOverlay;
@end

@implementation PPKPDFIconCollectionViewCell_iOS

- (PPKPDFIconCollectionViewCell_iOS)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PPKPDFIconCollectionViewCell_iOS;
  v3 = -[PPKPDFIconCollectionViewCell_iOS initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PPKPDFIconCollectionViewCell_iOS *)v3 _commonInit];
  }
  return v4;
}

- (PPKPDFIconCollectionViewCell_iOS)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PPKPDFIconCollectionViewCell_iOS;
  v3 = [(PPKPDFIconCollectionViewCell_iOS *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(PPKPDFIconCollectionViewCell_iOS *)v3 _commonInit];
  }
  return v4;
}

- (void)setHasLargeThumbnail:(BOOL)a3
{
  if (self->_hasLargeThumbnail != a3)
  {
    self->_hasLargeThumbnail = a3;
    [(PPKPDFIconCollectionViewCell_iOS *)self _updateMetricsIfNeeded];
  }
}

- (void)_updateMetricsIfNeeded
{
  double v3 = 0.0;
  double v4 = 3.0;
  if (self->_hasLargeThumbnail) {
    double v5 = 0.0;
  }
  else {
    double v5 = 3.0;
  }
  double v6 = 8.0;
  double v7 = 2.0;
  if (self->_hasLargeThumbnail)
  {
    double v7 = 8.0;
    double v4 = 8.0;
  }
  else
  {
    double v6 = 0.0;
  }
  double v8 = 10.0;
  if (!self->_hasLargeThumbnail) {
    double v8 = 0.0;
  }
  double v9 = 4.0;
  if (self->_hasLargeThumbnail) {
    double v3 = 0.25;
  }
  else {
    double v9 = 0.0;
  }
  self->_ImageEdgesInset = v5;
  self->_double ImageCornerRadius = v7;
  self->_double CellCornerRadius = v4;
  self->_double SelectionOverlayCornerRadius = v7;
  self->_CellVerticalEdgesInset = v6;
  self->_CellHorizontalEdgesInset = v8;
  self->_double CellShadowRadius = v9;
  self->_CellShadowOpacity = v3;
  double ImageCornerRadius = self->_ImageCornerRadius;
  v11 = [(PPKPDFIconCollectionViewCell_iOS *)self imageView];
  v12 = [v11 layer];
  [v12 setCornerRadius:ImageCornerRadius];

  double SelectionOverlayCornerRadius = self->_SelectionOverlayCornerRadius;
  v14 = [(UIView *)self->_overlayView layer];
  [v14 setCornerRadius:SelectionOverlayCornerRadius];

  [(NSLayoutConstraint *)self->_imageViewBottomConstraint setConstant:-self->_ImageEdgesInset - self->_CellVerticalEdgesInset];
  [(NSLayoutConstraint *)self->_imageViewTopConstraint setConstant:self->_ImageEdgesInset + self->_CellVerticalEdgesInset];
  [(NSLayoutConstraint *)self->_imageViewLeadingConstraint setConstant:self->_ImageEdgesInset + self->_CellHorizontalEdgesInset];
  [(NSLayoutConstraint *)self->_imageViewTrailingConstraint setConstant:-self->_ImageEdgesInset - self->_CellHorizontalEdgesInset];
  [(NSLayoutConstraint *)self->_overlayViewBottomConstraint setConstant:-self->_CellVerticalEdgesInset];
  [(NSLayoutConstraint *)self->_overlayViewTopConstraint setConstant:self->_CellVerticalEdgesInset];
  [(NSLayoutConstraint *)self->_overlayViewLeadingConstraint setConstant:self->_CellHorizontalEdgesInset];
  [(NSLayoutConstraint *)self->_overlayViewTrailingConstraint setConstant:-self->_CellHorizontalEdgesInset];
  double v15 = *MEMORY[0x263F001B0];
  double v16 = *(double *)(MEMORY[0x263F001B0] + 8);
  v17 = [(PPKPDFIconCollectionViewCell_iOS *)self layer];
  objc_msgSend(v17, "setShadowOffset:", v15, v16);

  double CellShadowRadius = self->_CellShadowRadius;
  v19 = [(PPKPDFIconCollectionViewCell_iOS *)self layer];
  [v19 setShadowRadius:CellShadowRadius];

  *(float *)&double CellShadowRadius = self->_CellShadowOpacity;
  v20 = [(PPKPDFIconCollectionViewCell_iOS *)self layer];
  LODWORD(v21) = LODWORD(CellShadowRadius);
  [v20 setShadowOpacity:v21];

  id v22 = [MEMORY[0x263F825C8] blackColor];
  uint64_t v23 = [v22 CGColor];
  v24 = [(PPKPDFIconCollectionViewCell_iOS *)self layer];
  [v24 setShadowColor:v23];

  BOOL v25 = !self->_hasLargeThumbnail;
  v26 = [(PPKPDFIconCollectionViewCell_iOS *)self layer];
  [v26 setMasksToBounds:v25];

  uint64_t v27 = *MEMORY[0x263F15A20];
  v28 = [(PPKPDFIconCollectionViewCell_iOS *)self layer];
  [v28 setCornerCurve:v27];

  double CellCornerRadius = self->_CellCornerRadius;
  id v30 = [(PPKPDFIconCollectionViewCell_iOS *)self layer];
  [v30 setCornerRadius:CellCornerRadius];
}

- (void)_commonInit
{
  [(PPKPDFIconCollectionViewCell_iOS *)self setupSubviews];
  [(PPKPDFIconCollectionViewCell_iOS *)self updateOverlay];
  [(PPKPDFIconCollectionViewCell_iOS *)self _updateMetricsIfNeeded];
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)PPKPDFIconCollectionViewCell_iOS;
  [(PPKPDFIconCollectionViewCell_iOS *)&v5 prepareForReuse];
  if (self->_ratioConstraint)
  {
    double v3 = [(PPKPDFIconCollectionViewCell_iOS *)self imageView];
    [v3 removeConstraint:self->_ratioConstraint];
  }
  double v4 = [(PPKPDFIconCollectionViewCell_iOS *)self imageView];
  [v4 setImage:0];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PPKPDFIconCollectionViewCell_iOS;
  [(PPKPDFIconCollectionViewCell_iOS *)&v4 setSelected:a3];
  [(PPKPDFIconCollectionViewCell_iOS *)self updateOverlay];
}

- (void)updateOverlay
{
  uint64_t v3 = [(PPKPDFIconCollectionViewCell_iOS *)self isSelected] ^ 1;
  overlayView = self->_overlayView;
  [(UIView *)overlayView setHidden:v3];
}

- (void)setupSubviews
{
  v96[8] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F82828]);
  [(PPKPDFIconCollectionViewCell_iOS *)self bounds];
  objc_super v4 = objc_msgSend(v3, "initWithFrame:");
  [(PPKPDFIconCollectionViewCell_iOS *)self setImageView:v4];

  objc_super v5 = [(PPKPDFIconCollectionViewCell_iOS *)self imageView];
  [v5 setContentMode:0];

  uint64_t v6 = *MEMORY[0x263F15A20];
  double v7 = [(PPKPDFIconCollectionViewCell_iOS *)self imageView];
  double v8 = [v7 layer];
  [v8 setCornerCurve:v6];

  double v9 = [(PPKPDFIconCollectionViewCell_iOS *)self imageView];
  v10 = [v9 layer];
  [v10 setMasksToBounds:1];

  uint64_t v11 = *MEMORY[0x263F15DA8];
  v12 = [(PPKPDFIconCollectionViewCell_iOS *)self imageView];
  v13 = [v12 layer];
  [v13 setMinificationFilter:v11];

  v14 = [MEMORY[0x263F825C8] whiteColor];
  double v15 = [(PPKPDFIconCollectionViewCell_iOS *)self imageView];
  [v15 setBackgroundColor:v14];

  double v16 = [(PPKPDFIconCollectionViewCell_iOS *)self contentView];
  v17 = [(PPKPDFIconCollectionViewCell_iOS *)self imageView];
  [v16 addSubview:v17];

  v18 = (UIView *)objc_opt_new();
  overlayView = self->_overlayView;
  self->_overlayView = v18;

  v20 = [MEMORY[0x263F825C8] blackColor];
  double v21 = [v20 colorWithAlphaComponent:0.3];
  [(UIView *)self->_overlayView setBackgroundColor:v21];

  id v22 = [(UIView *)self->_overlayView layer];
  [v22 setCornerCurve:v6];

  [(UIView *)self->_overlayView setHidden:1];
  uint64_t v23 = [(PPKPDFIconCollectionViewCell_iOS *)self contentView];
  [v23 addSubview:self->_overlayView];

  v24 = [(PPKPDFIconCollectionViewCell_iOS *)self imageView];
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(UIView *)self->_overlayView setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v25 = [(PPKPDFIconCollectionViewCell_iOS *)self imageView];
  v26 = [v25 bottomAnchor];
  uint64_t v27 = [(PPKPDFIconCollectionViewCell_iOS *)self contentView];
  v28 = [v27 bottomAnchor];
  v29 = [v26 constraintEqualToAnchor:v28 constant:0.0];
  imageViewBottomConstraint = self->_imageViewBottomConstraint;
  self->_imageViewBottomConstraint = v29;

  v31 = [(PPKPDFIconCollectionViewCell_iOS *)self imageView];
  v32 = [v31 topAnchor];
  v33 = [(PPKPDFIconCollectionViewCell_iOS *)self contentView];
  v34 = [v33 topAnchor];
  v35 = [v32 constraintEqualToAnchor:v34 constant:0.0];
  imageViewTopConstraint = self->_imageViewTopConstraint;
  self->_imageViewTopConstraint = v35;

  v37 = [(PPKPDFIconCollectionViewCell_iOS *)self imageView];
  v38 = [v37 leadingAnchor];
  v39 = [(PPKPDFIconCollectionViewCell_iOS *)self contentView];
  v40 = [v39 leadingAnchor];
  v41 = [v38 constraintEqualToAnchor:v40 constant:0.0];
  imageViewLeadingConstraint = self->_imageViewLeadingConstraint;
  self->_imageViewLeadingConstraint = v41;

  v43 = [(PPKPDFIconCollectionViewCell_iOS *)self imageView];
  v44 = [v43 trailingAnchor];
  v45 = [(PPKPDFIconCollectionViewCell_iOS *)self contentView];
  v46 = [v45 trailingAnchor];
  v47 = [v44 constraintEqualToAnchor:v46 constant:0.0];
  imageViewTrailingConstraint = self->_imageViewTrailingConstraint;
  self->_imageViewTrailingConstraint = v47;

  v49 = [(UIView *)self->_overlayView bottomAnchor];
  v50 = [(PPKPDFIconCollectionViewCell_iOS *)self contentView];
  v51 = [v50 bottomAnchor];
  v52 = [v49 constraintEqualToAnchor:v51 constant:0.0];
  overlayViewBottomConstraint = self->_overlayViewBottomConstraint;
  self->_overlayViewBottomConstraint = v52;

  v54 = [(UIView *)self->_overlayView topAnchor];
  v55 = [(PPKPDFIconCollectionViewCell_iOS *)self contentView];
  v56 = [v55 topAnchor];
  v57 = [v54 constraintEqualToAnchor:v56 constant:0.0];
  overlayViewTopConstraint = self->_overlayViewTopConstraint;
  self->_overlayViewTopConstraint = v57;

  v59 = [(UIView *)self->_overlayView leadingAnchor];
  v60 = [(PPKPDFIconCollectionViewCell_iOS *)self contentView];
  v61 = [v60 leadingAnchor];
  v62 = [v59 constraintEqualToAnchor:v61 constant:0.0];
  overlayViewLeadingConstraint = self->_overlayViewLeadingConstraint;
  self->_overlayViewLeadingConstraint = v62;

  v64 = [(UIView *)self->_overlayView trailingAnchor];
  v65 = [(PPKPDFIconCollectionViewCell_iOS *)self contentView];
  v66 = [v65 trailingAnchor];
  v67 = [v64 constraintEqualToAnchor:v66 constant:0.0];
  overlayViewTrailingConstraint = self->_overlayViewTrailingConstraint;
  self->_overlayViewTrailingConstraint = v67;

  v69 = (void *)MEMORY[0x263F08938];
  v70 = self->_imageViewBottomConstraint;
  v96[0] = self->_imageViewTopConstraint;
  v96[1] = v70;
  v71 = self->_imageViewTrailingConstraint;
  v96[2] = self->_imageViewLeadingConstraint;
  v96[3] = v71;
  v72 = self->_overlayViewTopConstraint;
  v96[4] = self->_overlayViewBottomConstraint;
  v96[5] = v72;
  v73 = self->_overlayViewTrailingConstraint;
  v96[6] = self->_overlayViewLeadingConstraint;
  v96[7] = v73;
  v74 = [MEMORY[0x263EFF8C0] arrayWithObjects:v96 count:8];
  [v69 activateConstraints:v74];

  id v75 = objc_alloc(MEMORY[0x263F824E8]);
  v76 = (UIButton *)objc_msgSend(v75, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  actionsButton = self->_actionsButton;
  self->_actionsButton = v76;

  v94 = [MEMORY[0x263F827E8] systemImageNamed:@"ellipsis.circle.fill"];
  v93 = [MEMORY[0x263F824F0] plainButtonConfiguration];
  [v93 setImage:v94];
  [(UIButton *)self->_actionsButton setConfiguration:v93];
  v78 = [MEMORY[0x263F825C8] whiteColor];
  [(UIButton *)self->_actionsButton setTintColor:v78];

  [(UIView *)self->_overlayView addSubview:self->_actionsButton];
  [(UIButton *)self->_actionsButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v89 = (void *)MEMORY[0x263F08938];
  v92 = [(UIButton *)self->_actionsButton widthAnchor];
  v91 = [(UIView *)self->_overlayView widthAnchor];
  v90 = [v92 constraintEqualToAnchor:v91];
  v95[0] = v90;
  v79 = [(UIButton *)self->_actionsButton heightAnchor];
  v80 = [(UIView *)self->_overlayView heightAnchor];
  v81 = [v79 constraintEqualToAnchor:v80];
  v95[1] = v81;
  v82 = [(UIButton *)self->_actionsButton centerXAnchor];
  v83 = [(UIView *)self->_overlayView centerXAnchor];
  v84 = [v82 constraintEqualToAnchor:v83];
  v95[2] = v84;
  v85 = [(UIButton *)self->_actionsButton centerYAnchor];
  v86 = [(UIView *)self->_overlayView centerYAnchor];
  v87 = [v85 constraintEqualToAnchor:v86];
  v95[3] = v87;
  v88 = [MEMORY[0x263EFF8C0] arrayWithObjects:v95 count:4];
  [v89 activateConstraints:v88];
}

- (void)updateAspectConstraintWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v18[1] = *MEMORY[0x263EF8340];
  if (self->_ratioConstraint)
  {
    uint64_t v6 = [(PPKPDFIconCollectionViewCell_iOS *)self imageView];
    [v6 removeConstraint:self->_ratioConstraint];
  }
  double v7 = height / width;
  if (fabs(height / width) == INFINITY) {
    double v7 = 1.0;
  }
  if (v7 < 0.5) {
    double v7 = 0.5;
  }
  double v8 = fmin(v7, 2.0);
  double v9 = [(PPKPDFIconCollectionViewCell_iOS *)self imageView];
  v10 = [v9 heightAnchor];
  uint64_t v11 = [(PPKPDFIconCollectionViewCell_iOS *)self imageView];
  v12 = [v11 widthAnchor];
  v13 = [v10 constraintEqualToAnchor:v12 multiplier:v8 constant:0.0];
  ratioConstraint = self->_ratioConstraint;
  self->_ratioConstraint = v13;

  LODWORD(v15) = 1148829696;
  [(NSLayoutConstraint *)self->_ratioConstraint setPriority:v15];
  double v16 = (void *)MEMORY[0x263F08938];
  v18[0] = self->_ratioConstraint;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  [v16 activateConstraints:v17];
}

- (void)setThumbnailWidth:(double)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  [(NSLayoutConstraint *)self->_imageViewWidthConstraint constant];
  if (v5 != a3)
  {
    imageViewWidthConstraint = self->_imageViewWidthConstraint;
    if (imageViewWidthConstraint)
    {
      [(NSLayoutConstraint *)imageViewWidthConstraint setConstant:a3];
    }
    else
    {
      double v7 = [(PPKPDFIconCollectionViewCell_iOS *)self contentView];
      double v8 = [v7 widthAnchor];
      double v9 = [v8 constraintEqualToConstant:a3];
      v10 = self->_imageViewWidthConstraint;
      self->_imageViewWidthConstraint = v9;

      uint64_t v11 = (void *)MEMORY[0x263F08938];
      v14[0] = self->_imageViewWidthConstraint;
      v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
      [v11 activateConstraints:v12];

      LODWORD(v13) = 1148829696;
      [(NSLayoutConstraint *)self->_imageViewWidthConstraint setPriority:v13];
    }
  }
}

- (void)setThumbnailHeight:(double)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  [(NSLayoutConstraint *)self->_imageViewHeightConstraint constant];
  if (v5 != a3)
  {
    imageViewHeightConstraint = self->_imageViewHeightConstraint;
    if (imageViewHeightConstraint)
    {
      [(NSLayoutConstraint *)imageViewHeightConstraint setConstant:a3];
    }
    else
    {
      double v7 = [(PPKPDFIconCollectionViewCell_iOS *)self contentView];
      double v8 = [v7 heightAnchor];
      double v9 = [v8 constraintEqualToConstant:a3];
      v10 = self->_imageViewHeightConstraint;
      self->_imageViewHeightConstraint = v9;

      uint64_t v11 = (void *)MEMORY[0x263F08938];
      v14[0] = self->_imageViewHeightConstraint;
      v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
      [v11 activateConstraints:v12];

      LODWORD(v13) = 1148829696;
      [(NSLayoutConstraint *)self->_imageViewHeightConstraint setPriority:v13];
    }
  }
}

- (UIButton)actionsButton
{
  return self->_actionsButton;
}

- (void)setActionsButton:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (PDFPage)page
{
  return self->_page;
}

- (void)setPage:(id)a3
{
}

- (BOOL)hasLargeThumbnail
{
  return self->_hasLargeThumbnail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_page, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_actionsButton, 0);
  objc_storeStrong((id *)&self->_overlayViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_overlayViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_overlayViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_overlayViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_ratioConstraint, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
}

@end