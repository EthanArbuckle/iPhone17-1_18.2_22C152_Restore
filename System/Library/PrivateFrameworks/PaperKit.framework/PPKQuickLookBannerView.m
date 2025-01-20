@interface PPKQuickLookBannerView
- (BOOL)_isUsingAccessibilityContentSizeCategory;
- (BOOL)_useCompactLayout;
- (PPKQuickLookBannerView)initWithFrame:(CGRect)a3;
- (UIButton)actionButton;
- (UIButton)closeButton;
- (UIImageView)imageView;
- (UILabel)subtitle;
- (UILabel)title;
- (id)_compactSizeConstraints;
- (id)_extraCompactSizeConstraints;
- (id)_regularSizeConstraints;
- (int64_t)_numberOfSubtitleLines;
- (int64_t)_numberOfTitleLines;
- (void)_setUseExtraCompactLayout:(BOOL)a3;
- (void)_updateImageViewWithConfiguration:(id)a3;
- (void)_updateUI;
- (void)clearExistingActions:(id)a3;
- (void)layoutSubviews;
- (void)populateWithConfiguration:(id)a3;
- (void)setActionButton:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setImageView:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)showWithAnimations:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PPKQuickLookBannerView

- (PPKQuickLookBannerView)initWithFrame:(CGRect)a3
{
  v60[2] = *MEMORY[0x263EF8340];
  v59.receiver = self;
  v59.super_class = (Class)PPKQuickLookBannerView;
  v3 = -[PPKQuickLookBannerView initWithFrame:](&v59, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PPKQuickLookBannerView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F82908]);
    contentLayoutGuide = v4->_contentLayoutGuide;
    v4->_contentLayoutGuide = v5;

    [(PPKQuickLookBannerView *)v4 addLayoutGuide:v4->_contentLayoutGuide];
    v7 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = v7;

    [(UIView *)v4->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    imageView = v4->_imageView;
    v4->_imageView = v9;

    v11 = (void *)MEMORY[0x263F82818];
    uint64_t v12 = *MEMORY[0x263F835F0];
    double v13 = *MEMORY[0x263F81840];
    v14 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F835F0] weight:*MEMORY[0x263F81840]];
    v15 = [v11 configurationWithFont:v14 scale:2];
    [(UIImageView *)v4->_imageView setPreferredSymbolConfiguration:v15];

    [(UIImageView *)v4->_imageView setContentMode:1];
    v16 = v4->_imageView;
    v17 = [MEMORY[0x263F825C8] labelColor];
    [(UIImageView *)v16 setTintColor:v17];

    [(UIImageView *)v4->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v18) = 1148846080;
    [(UIImageView *)v4->_imageView setContentCompressionResistancePriority:0 forAxis:v18];
    LODWORD(v19) = 1148846080;
    [(UIImageView *)v4->_imageView setContentHuggingPriority:0 forAxis:v19];
    uint64_t v20 = objc_opt_new();
    title = v4->_title;
    v4->_title = (UILabel *)v20;

    [(UILabel *)v4->_title setText:@"Title here"];
    v22 = [MEMORY[0x263F81708] _preferredFontForTextStyle:v12 weight:v13];
    [(UILabel *)v4->_title setFont:v22];

    [(UILabel *)v4->_title setLineBreakMode:0];
    [(UILabel *)v4->_title setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v23 = objc_opt_new();
    subtitle = v4->_subtitle;
    v4->_subtitle = (UILabel *)v23;

    [(UILabel *)v4->_subtitle setText:@"Secondary title here"];
    v25 = [MEMORY[0x263F81708] preferredFontForTextStyle:v12];
    [(UILabel *)v4->_subtitle setFont:v25];

    v26 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)v4->_subtitle setTextColor:v26];

    [(UILabel *)v4->_subtitle setLineBreakMode:0];
    [(UILabel *)v4->_subtitle setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v27 = [MEMORY[0x263F824E8] buttonWithType:0];
    actionButton = v4->_actionButton;
    v4->_actionButton = (UIButton *)v27;

    v29 = [MEMORY[0x263F824F0] filledButtonConfiguration];
    [v29 setCornerStyle:4];
    v58 = v29;
    [v29 setTitleLineBreakMode:0];
    v30 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"Button"];
    [v29 setAttributedTitle:v30];

    [v29 setTitleTextAttributesTransformer:&__block_literal_global_4];
    [(UIButton *)v4->_actionButton setConfiguration:v29];
    [(UIButton *)v4->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v31) = 1148846080;
    [(UIButton *)v4->_actionButton setContentCompressionResistancePriority:0 forAxis:v31];
    LODWORD(v32) = 1148846080;
    [(UIButton *)v4->_actionButton setContentHuggingPriority:0 forAxis:v32];
    uint64_t v33 = [MEMORY[0x263F824E8] buttonWithType:1];
    closeButton = v4->_closeButton;
    v4->_closeButton = (UIButton *)v33;

    v35 = (void *)MEMORY[0x263F82818];
    v36 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F835B8] weight:v13];
    v37 = [v35 configurationWithFont:v36 scale:3];

    v38 = [MEMORY[0x263F827E8] systemImageNamed:@"xmark" withConfiguration:v37];
    [(UIButton *)v4->_closeButton setImage:v38 forState:0];
    v39 = [MEMORY[0x263F825C8] tertiaryLabelColor];
    [(UIButton *)v4->_closeButton setTintColor:v39];

    [(UIButton *)v4->_closeButton setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v40) = 1148846080;
    [(UIButton *)v4->_closeButton setContentCompressionResistancePriority:0 forAxis:v40];
    LODWORD(v41) = 1148846080;
    [(UIButton *)v4->_closeButton setContentHuggingPriority:0 forAxis:v41];
    id v42 = objc_alloc(MEMORY[0x263F82BF8]);
    v60[0] = v4->_title;
    v60[1] = v4->_subtitle;
    v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:2];
    uint64_t v44 = [v42 initWithArrangedSubviews:v43];
    titleStackView = v4->_titleStackView;
    v4->_titleStackView = (UIStackView *)v44;

    [(UIStackView *)v4->_titleStackView setSpacing:4.0];
    [(UIStackView *)v4->_titleStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PPKQuickLookBannerView *)v4 addSubview:v4->_backgroundView];
    [(PPKQuickLookBannerView *)v4 addSubview:v4->_imageView];
    [(PPKQuickLookBannerView *)v4 addSubview:v4->_titleStackView];
    [(PPKQuickLookBannerView *)v4 addSubview:v4->_actionButton];
    [(PPKQuickLookBannerView *)v4 addSubview:v4->_closeButton];
    uint64_t v46 = *MEMORY[0x263F15A20];
    v47 = [(UIView *)v4->_backgroundView layer];
    [v47 setCornerCurve:v46];

    id v48 = [MEMORY[0x263F825C8] blackColor];
    uint64_t v49 = [v48 CGColor];
    v50 = [(UIView *)v4->_backgroundView layer];
    [v50 setShadowColor:v49];

    v51 = [(UIView *)v4->_backgroundView layer];
    LODWORD(v52) = 0.25;
    [v51 setShadowOpacity:v52];

    double v53 = *MEMORY[0x263F001B0];
    double v54 = *(double *)(MEMORY[0x263F001B0] + 8);
    v55 = [(UIView *)v4->_backgroundView layer];
    objc_msgSend(v55, "setShadowOffset:", v53, v54);

    v56 = [(UIView *)v4->_backgroundView layer];
    [v56 setShadowRadius:5.0];

    [(PPKQuickLookBannerView *)v4 _updateUI];
  }
  return v4;
}

id __40__PPKQuickLookBannerView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 mutableCopy];
  v3 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F835B8] weight:*MEMORY[0x263F81840]];
  [v2 setValue:v3 forKey:*MEMORY[0x263F814F0]];

  v4 = (void *)[v2 copy];
  return v4;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PPKQuickLookBannerView;
  [(PPKQuickLookBannerView *)&v5 layoutSubviews];
  [(PPKQuickLookBannerView *)self bounds];
  BOOL v4 = v3 <= 375.0
    || [(PPKQuickLookBannerView *)self _isUsingAccessibilityContentSizeCategory];
  [(PPKQuickLookBannerView *)self _setUseExtraCompactLayout:v4];
}

- (void)_setUseExtraCompactLayout:(BOOL)a3
{
  if (self->_useExtraCompactLayout != a3)
  {
    self->_useExtraCompactLayout = a3;
    [(PPKQuickLookBannerView *)self _updateUI];
  }
}

- (void)_updateUI
{
  id v3 = (id)0x263F82000;
  if ([(PPKQuickLookBannerView *)self _useCompactLayout]) {
    [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  }
  else {
  BOOL v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  }
  [(UIView *)self->_backgroundView setBackgroundColor:v4];

  if ([(PPKQuickLookBannerView *)self _useCompactLayout]) {
    double v5 = 0.0;
  }
  else {
    double v5 = 8.0;
  }
  v6 = [(UIView *)self->_backgroundView layer];
  [v6 setCornerRadius:v5];

  BOOL v7 = [(PPKQuickLookBannerView *)self _useCompactLayout];
  if (v7)
  {
    uint64_t v8 = 0;
  }
  else
  {
    id v3 = [MEMORY[0x263F825C8] quaternaryLabelColor];
    uint64_t v8 = [v3 CGColor];
  }
  v9 = [(UIView *)self->_backgroundView layer];
  [v9 setBorderColor:v8];

  if (!v7) {
  if ([(PPKQuickLookBannerView *)self _useCompactLayout])
  }
    double v10 = 0.0;
  else {
    double v10 = 0.5;
  }
  v11 = [(UIView *)self->_backgroundView layer];
  [v11 setBorderWidth:v10];

  int64_t v12 = [(PPKQuickLookBannerView *)self _numberOfTitleLines];
  double v13 = [(PPKQuickLookBannerView *)self title];
  [v13 setNumberOfLines:v12];

  int64_t v14 = [(PPKQuickLookBannerView *)self _numberOfSubtitleLines];
  v15 = [(PPKQuickLookBannerView *)self subtitle];
  [v15 setNumberOfLines:v14];

  [(UIStackView *)self->_titleStackView setAxis:[(PPKQuickLookBannerView *)self _useCompactLayout]];
  if (self->_extraCompactSizeConstraints)
  {
    objc_msgSend(MEMORY[0x263F08938], "deactivateConstraints:");
    extraCompactSizeConstraints = self->_extraCompactSizeConstraints;
    self->_extraCompactSizeConstraints = 0;
  }
  if (self->_compactSizeConstraints)
  {
    objc_msgSend(MEMORY[0x263F08938], "deactivateConstraints:");
    compactSizeConstraints = self->_compactSizeConstraints;
    self->_compactSizeConstraints = 0;
  }
  if (self->_regularSizeConstraints)
  {
    objc_msgSend(MEMORY[0x263F08938], "deactivateConstraints:");
    regularSizeConstraints = self->_regularSizeConstraints;
    self->_regularSizeConstraints = 0;
  }
  imageViewCollapsingConstraint = self->_imageViewCollapsingConstraint;
  if (imageViewCollapsingConstraint)
  {
    [(NSLayoutConstraint *)imageViewCollapsingConstraint setActive:0];
    uint64_t v20 = self->_imageViewCollapsingConstraint;
    self->_imageViewCollapsingConstraint = 0;
  }
  titleStackLeadingConstraint = self->_titleStackLeadingConstraint;
  self->_titleStackLeadingConstraint = 0;

  if ([(PPKQuickLookBannerView *)self _isUsingAccessibilityContentSizeCategory])
  {
    v22 = (void *)MEMORY[0x263F08938];
    uint64_t v23 = [(PPKQuickLookBannerView *)self _extraCompactSizeConstraints];
  }
  else
  {
    if ([(PPKQuickLookBannerView *)self _useCompactLayout])
    {
      if (self->_useExtraCompactLayout) {
        [(PPKQuickLookBannerView *)self _extraCompactSizeConstraints];
      }
      else {
      v24 = [(PPKQuickLookBannerView *)self _compactSizeConstraints];
      }
      v25 = (void *)MEMORY[0x263F08938];
      goto LABEL_32;
    }
    v22 = (void *)MEMORY[0x263F08938];
    uint64_t v23 = [(PPKQuickLookBannerView *)self _regularSizeConstraints];
  }
  v24 = (void *)v23;
  v25 = v22;
LABEL_32:
  [v25 activateConstraints:v24];

  id v29 = [(PPKQuickLookBannerView *)self imageView];
  v26 = [v29 widthAnchor];
  uint64_t v27 = [v26 constraintEqualToConstant:0.0];
  v28 = self->_imageViewCollapsingConstraint;
  self->_imageViewCollapsingConstraint = v27;
}

- (id)_compactSizeConstraints
{
  v75[19] = *MEMORY[0x263EF8340];
  compactSizeConstraints = self->_compactSizeConstraints;
  if (!compactSizeConstraints)
  {
    BOOL v4 = [(UIStackView *)self->_titleStackView leadingAnchor];
    double v5 = [(PPKQuickLookBannerView *)self imageView];
    v6 = [v5 trailingAnchor];
    BOOL v7 = [v4 constraintEqualToAnchor:v6 constant:4.0];
    titleStackLeadingConstraint = self->_titleStackLeadingConstraint;
    self->_titleStackLeadingConstraint = v7;

    v74 = [(UIView *)self->_backgroundView topAnchor];
    v73 = [(PPKQuickLookBannerView *)self topAnchor];
    v72 = [v74 constraintEqualToAnchor:v73];
    v75[0] = v72;
    v71 = [(UIView *)self->_backgroundView leadingAnchor];
    v70 = [(PPKQuickLookBannerView *)self leadingAnchor];
    v69 = [v71 constraintEqualToAnchor:v70];
    v75[1] = v69;
    v68 = [(UIView *)self->_backgroundView trailingAnchor];
    v67 = [(PPKQuickLookBannerView *)self trailingAnchor];
    v66 = [v68 constraintEqualToAnchor:v67];
    v75[2] = v66;
    v65 = [(UIView *)self->_backgroundView bottomAnchor];
    v64 = [(PPKQuickLookBannerView *)self bottomAnchor];
    v63 = [v65 constraintEqualToAnchor:v64];
    v75[3] = v63;
    v62 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
    v61 = [(PPKQuickLookBannerView *)self topAnchor];
    v60 = [v62 constraintEqualToAnchor:v61 constant:16.0];
    v75[4] = v60;
    objc_super v59 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
    v58 = [(PPKQuickLookBannerView *)self leadingAnchor];
    v57 = [v59 constraintEqualToAnchor:v58 constant:12.0];
    v75[5] = v57;
    v56 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
    v55 = [(PPKQuickLookBannerView *)self trailingAnchor];
    double v54 = [v56 constraintEqualToAnchor:v55 constant:-20.0];
    v75[6] = v54;
    double v53 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
    double v52 = [(PPKQuickLookBannerView *)self bottomAnchor];
    v51 = [v53 constraintEqualToAnchor:v52 constant:-16.0];
    v75[7] = v51;
    v50 = [(PPKQuickLookBannerView *)self imageView];
    uint64_t v49 = [v50 centerYAnchor];
    id v48 = [(UILayoutGuide *)self->_contentLayoutGuide centerYAnchor];
    v47 = [v49 constraintEqualToAnchor:v48];
    v75[8] = v47;
    uint64_t v46 = [(PPKQuickLookBannerView *)self imageView];
    v45 = [v46 leadingAnchor];
    uint64_t v44 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
    v43 = [v45 constraintEqualToAnchor:v44];
    v75[9] = v43;
    id v42 = [(UIStackView *)self->_titleStackView topAnchor];
    double v41 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
    double v40 = [v42 constraintGreaterThanOrEqualToAnchor:v41];
    v75[10] = v40;
    v39 = [(UIStackView *)self->_titleStackView bottomAnchor];
    v38 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
    v37 = [v39 constraintLessThanOrEqualToAnchor:v38];
    v75[11] = v37;
    v36 = [(UIStackView *)self->_titleStackView centerYAnchor];
    v35 = [(UILayoutGuide *)self->_contentLayoutGuide centerYAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v75[12] = v34;
    double v32 = [(UIStackView *)self->_titleStackView trailingAnchor];
    uint64_t v33 = [(PPKQuickLookBannerView *)self actionButton];
    double v31 = [v33 leadingAnchor];
    v30 = [v32 constraintLessThanOrEqualToAnchor:v31 constant:-4.0];
    v9 = self->_titleStackLeadingConstraint;
    v75[13] = v30;
    v75[14] = v9;
    id v29 = [(PPKQuickLookBannerView *)self actionButton];
    uint64_t v27 = [v29 trailingAnchor];
    v28 = [(PPKQuickLookBannerView *)self closeButton];
    v26 = [v28 leadingAnchor];
    v25 = [v27 constraintEqualToAnchor:v26 constant:-16.0];
    v75[15] = v25;
    v24 = [(PPKQuickLookBannerView *)self actionButton];
    uint64_t v23 = [v24 centerYAnchor];
    v22 = [(UILayoutGuide *)self->_contentLayoutGuide centerYAnchor];
    double v10 = [v23 constraintEqualToAnchor:v22];
    v75[16] = v10;
    v11 = [(PPKQuickLookBannerView *)self closeButton];
    int64_t v12 = [v11 centerYAnchor];
    double v13 = [(UILayoutGuide *)self->_contentLayoutGuide centerYAnchor];
    int64_t v14 = [v12 constraintEqualToAnchor:v13];
    v75[17] = v14;
    v15 = [(PPKQuickLookBannerView *)self closeButton];
    v16 = [v15 trailingAnchor];
    v17 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
    double v18 = [v16 constraintEqualToAnchor:v17];
    v75[18] = v18;
    double v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v75 count:19];
    uint64_t v20 = self->_compactSizeConstraints;
    self->_compactSizeConstraints = v19;

    compactSizeConstraints = self->_compactSizeConstraints;
  }
  return compactSizeConstraints;
}

- (id)_extraCompactSizeConstraints
{
  v76[19] = *MEMORY[0x263EF8340];
  extraCompactSizeConstraints = self->_extraCompactSizeConstraints;
  if (!extraCompactSizeConstraints)
  {
    BOOL v4 = [(UIStackView *)self->_titleStackView leadingAnchor];
    double v5 = [(PPKQuickLookBannerView *)self imageView];
    v6 = [v5 trailingAnchor];
    BOOL v7 = [v4 constraintEqualToAnchor:v6 constant:4.0];
    titleStackLeadingConstraint = self->_titleStackLeadingConstraint;
    self->_titleStackLeadingConstraint = v7;

    v75 = [(UIView *)self->_backgroundView topAnchor];
    v74 = [(PPKQuickLookBannerView *)self topAnchor];
    v73 = [v75 constraintEqualToAnchor:v74];
    v76[0] = v73;
    v72 = [(UIView *)self->_backgroundView leadingAnchor];
    v71 = [(PPKQuickLookBannerView *)self leadingAnchor];
    v70 = [v72 constraintEqualToAnchor:v71];
    v76[1] = v70;
    v69 = [(UIView *)self->_backgroundView trailingAnchor];
    v68 = [(PPKQuickLookBannerView *)self trailingAnchor];
    v67 = [v69 constraintEqualToAnchor:v68];
    v76[2] = v67;
    v66 = [(UIView *)self->_backgroundView bottomAnchor];
    v65 = [(PPKQuickLookBannerView *)self bottomAnchor];
    v64 = [v66 constraintEqualToAnchor:v65];
    v76[3] = v64;
    v63 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
    v62 = [(PPKQuickLookBannerView *)self topAnchor];
    v61 = [v63 constraintEqualToAnchor:v62 constant:16.0];
    v76[4] = v61;
    v60 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
    objc_super v59 = [(PPKQuickLookBannerView *)self leadingAnchor];
    v58 = [v60 constraintEqualToAnchor:v59 constant:12.0];
    v76[5] = v58;
    v57 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
    v56 = [(PPKQuickLookBannerView *)self trailingAnchor];
    v55 = [v57 constraintEqualToAnchor:v56 constant:-20.0];
    v76[6] = v55;
    double v54 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
    double v53 = [(PPKQuickLookBannerView *)self bottomAnchor];
    double v52 = [v54 constraintEqualToAnchor:v53 constant:-16.0];
    v76[7] = v52;
    v51 = [(PPKQuickLookBannerView *)self imageView];
    v50 = [v51 topAnchor];
    uint64_t v49 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
    id v48 = [v50 constraintEqualToAnchor:v49];
    v76[8] = v48;
    v47 = [(PPKQuickLookBannerView *)self imageView];
    uint64_t v46 = [v47 leadingAnchor];
    v45 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
    uint64_t v44 = [v46 constraintEqualToAnchor:v45];
    v76[9] = v44;
    v43 = [(UIStackView *)self->_titleStackView topAnchor];
    id v42 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
    double v41 = [v43 constraintEqualToAnchor:v42];
    v76[10] = v41;
    v39 = [(UIStackView *)self->_titleStackView trailingAnchor];
    double v40 = [(PPKQuickLookBannerView *)self closeButton];
    v38 = [v40 leadingAnchor];
    v37 = [v39 constraintLessThanOrEqualToAnchor:v38 constant:-4.0];
    v9 = self->_titleStackLeadingConstraint;
    v76[11] = v37;
    v76[12] = v9;
    v36 = [(PPKQuickLookBannerView *)self closeButton];
    v35 = [v36 topAnchor];
    v34 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
    uint64_t v33 = [v35 constraintEqualToAnchor:v34];
    v76[13] = v33;
    double v32 = [(PPKQuickLookBannerView *)self closeButton];
    double v31 = [v32 trailingAnchor];
    v30 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
    id v29 = [v31 constraintEqualToAnchor:v30];
    v76[14] = v29;
    v28 = [(PPKQuickLookBannerView *)self actionButton];
    uint64_t v27 = [v28 topAnchor];
    v26 = [(UIStackView *)self->_titleStackView bottomAnchor];
    v25 = [v27 constraintEqualToAnchor:v26 constant:10.0];
    v76[15] = v25;
    v24 = [(PPKQuickLookBannerView *)self actionButton];
    uint64_t v23 = [v24 leadingAnchor];
    v22 = [(UIStackView *)self->_titleStackView leadingAnchor];
    double v10 = [v23 constraintEqualToAnchor:v22];
    v76[16] = v10;
    v11 = [(PPKQuickLookBannerView *)self actionButton];
    int64_t v12 = [v11 trailingAnchor];
    double v13 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
    int64_t v14 = [v12 constraintLessThanOrEqualToAnchor:v13];
    v76[17] = v14;
    v15 = [(PPKQuickLookBannerView *)self actionButton];
    v16 = [v15 bottomAnchor];
    v17 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
    double v18 = [v16 constraintEqualToAnchor:v17];
    v76[18] = v18;
    double v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:19];
    uint64_t v20 = self->_extraCompactSizeConstraints;
    self->_extraCompactSizeConstraints = v19;

    extraCompactSizeConstraints = self->_extraCompactSizeConstraints;
  }
  return extraCompactSizeConstraints;
}

- (id)_regularSizeConstraints
{
  v99[25] = *MEMORY[0x263EF8340];
  regularSizeConstraints = self->_regularSizeConstraints;
  if (!regularSizeConstraints)
  {
    BOOL v4 = [(UIStackView *)self->_titleStackView leadingAnchor];
    double v5 = [(PPKQuickLookBannerView *)self imageView];
    v6 = [v5 trailingAnchor];
    BOOL v7 = [v4 constraintEqualToAnchor:v6 constant:4.0];
    titleStackLeadingConstraint = self->_titleStackLeadingConstraint;
    self->_titleStackLeadingConstraint = v7;

    v98 = [(UIView *)self->_backgroundView topAnchor];
    v97 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
    v96 = [v98 constraintEqualToAnchor:v97];
    v99[0] = v96;
    v95 = [(UIView *)self->_backgroundView leadingAnchor];
    v94 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
    v93 = [v95 constraintEqualToAnchor:v94];
    v99[1] = v93;
    v92 = [(UIView *)self->_backgroundView trailingAnchor];
    v91 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
    v90 = [v92 constraintEqualToAnchor:v91];
    v99[2] = v90;
    v89 = [(UIView *)self->_backgroundView bottomAnchor];
    v88 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
    v87 = [v89 constraintEqualToAnchor:v88];
    v99[3] = v87;
    v86 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
    v85 = [(PPKQuickLookBannerView *)self topAnchor];
    v84 = [v86 constraintEqualToAnchor:v85 constant:16.0];
    v99[4] = v84;
    v83 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
    v82 = [(PPKQuickLookBannerView *)self leadingAnchor];
    v81 = [v83 constraintEqualToAnchor:v82 constant:16.0];
    v99[5] = v81;
    v80 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
    v79 = [(PPKQuickLookBannerView *)self trailingAnchor];
    v78 = [v80 constraintEqualToAnchor:v79 constant:-16.0];
    v99[6] = v78;
    v77 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
    v76 = [(PPKQuickLookBannerView *)self bottomAnchor];
    v75 = [v77 constraintEqualToAnchor:v76 constant:-16.0];
    v99[7] = v75;
    v74 = [(PPKQuickLookBannerView *)self imageView];
    v73 = [v74 leadingAnchor];
    v72 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
    v71 = [v73 constraintEqualToAnchor:v72 constant:14.0];
    v99[8] = v71;
    v70 = [(PPKQuickLookBannerView *)self imageView];
    v69 = [v70 centerYAnchor];
    v68 = [(UILayoutGuide *)self->_contentLayoutGuide centerYAnchor];
    v67 = [v69 constraintEqualToAnchor:v68];
    v99[9] = v67;
    v66 = [(PPKQuickLookBannerView *)self imageView];
    v65 = [v66 topAnchor];
    v64 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
    v63 = [v65 constraintGreaterThanOrEqualToAnchor:v64];
    v99[10] = v63;
    v62 = [(PPKQuickLookBannerView *)self imageView];
    v61 = [v62 bottomAnchor];
    v60 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
    objc_super v59 = [v61 constraintLessThanOrEqualToAnchor:v60];
    v99[11] = v59;
    v58 = [(UIStackView *)self->_titleStackView centerYAnchor];
    v57 = [(UILayoutGuide *)self->_contentLayoutGuide centerYAnchor];
    v56 = [v58 constraintEqualToAnchor:v57];
    v99[12] = v56;
    double v54 = [(UIStackView *)self->_titleStackView trailingAnchor];
    v55 = [(PPKQuickLookBannerView *)self actionButton];
    double v53 = [v55 leadingAnchor];
    double v52 = [v54 constraintLessThanOrEqualToAnchor:v53 constant:-8.0];
    v99[13] = v52;
    v51 = [(UIStackView *)self->_titleStackView topAnchor];
    v50 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
    uint64_t v49 = [v51 constraintGreaterThanOrEqualToAnchor:v50 constant:8.0];
    v99[14] = v49;
    id v48 = [(UIStackView *)self->_titleStackView bottomAnchor];
    v47 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
    uint64_t v46 = [v48 constraintLessThanOrEqualToAnchor:v47 constant:-8.0];
    v9 = self->_titleStackLeadingConstraint;
    v99[15] = v46;
    v99[16] = v9;
    v45 = [(PPKQuickLookBannerView *)self actionButton];
    uint64_t v44 = [v45 topAnchor];
    v43 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
    id v42 = [v44 constraintGreaterThanOrEqualToAnchor:v43 constant:8.0];
    v99[17] = v42;
    double v41 = [(PPKQuickLookBannerView *)self actionButton];
    double v40 = [v41 bottomAnchor];
    v39 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
    v38 = [v40 constraintLessThanOrEqualToAnchor:v39 constant:-8.0];
    v99[18] = v38;
    v37 = [(PPKQuickLookBannerView *)self actionButton];
    v35 = [v37 trailingAnchor];
    v36 = [(PPKQuickLookBannerView *)self closeButton];
    v34 = [v36 leadingAnchor];
    uint64_t v33 = [v35 constraintEqualToAnchor:v34 constant:-14.0];
    v99[19] = v33;
    double v32 = [(PPKQuickLookBannerView *)self actionButton];
    double v31 = [v32 centerYAnchor];
    v30 = [(UILayoutGuide *)self->_contentLayoutGuide centerYAnchor];
    id v29 = [v31 constraintEqualToAnchor:v30];
    v99[20] = v29;
    v28 = [(PPKQuickLookBannerView *)self closeButton];
    uint64_t v27 = [v28 trailingAnchor];
    v26 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
    v25 = [v27 constraintEqualToAnchor:v26 constant:-14.0];
    v99[21] = v25;
    v24 = [(PPKQuickLookBannerView *)self closeButton];
    uint64_t v23 = [v24 centerYAnchor];
    v22 = [(UILayoutGuide *)self->_contentLayoutGuide centerYAnchor];
    double v10 = [v23 constraintEqualToAnchor:v22];
    v99[22] = v10;
    v11 = [(PPKQuickLookBannerView *)self closeButton];
    int64_t v12 = [v11 topAnchor];
    double v13 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
    int64_t v14 = [v12 constraintGreaterThanOrEqualToAnchor:v13];
    v99[23] = v14;
    v15 = [(PPKQuickLookBannerView *)self closeButton];
    v16 = [v15 bottomAnchor];
    v17 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
    double v18 = [v16 constraintLessThanOrEqualToAnchor:v17];
    v99[24] = v18;
    double v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v99 count:25];
    uint64_t v20 = self->_regularSizeConstraints;
    self->_regularSizeConstraints = v19;

    regularSizeConstraints = self->_regularSizeConstraints;
  }
  return regularSizeConstraints;
}

- (void)populateWithConfiguration:(id)a3
{
  id v25 = a3;
  [(PPKQuickLookBannerView *)self _updateImageViewWithConfiguration:v25];
  BOOL v4 = [v25 title];
  double v5 = [(PPKQuickLookBannerView *)self title];
  [v5 setText:v4];

  v6 = [v25 subtitle];
  BOOL v7 = [(PPKQuickLookBannerView *)self subtitle];
  [v7 setText:v6];

  uint64_t v8 = [v25 subtitle];
  BOOL v9 = [v8 length] == 0;
  double v10 = [(PPKQuickLookBannerView *)self subtitle];
  [v10 setHidden:v9];

  v11 = [(PPKQuickLookBannerView *)self actionButton];
  [(PPKQuickLookBannerView *)self clearExistingActions:v11];

  int64_t v12 = [(PPKQuickLookBannerView *)self closeButton];
  [(PPKQuickLookBannerView *)self clearExistingActions:v12];

  double v13 = [v25 primaryAction];

  if (v13)
  {
    int64_t v14 = [(PPKQuickLookBannerView *)self actionButton];
    v15 = [v25 primaryAction];
    [v14 addAction:v15 forControlEvents:64];

    v16 = [(PPKQuickLookBannerView *)self actionButton];
    v17 = [v16 configuration];
    double v18 = (void *)[v17 copy];

    double v19 = [v25 primaryAction];
    uint64_t v20 = [v19 title];
    [v18 setTitle:v20];

    v21 = [(PPKQuickLookBannerView *)self actionButton];
    [v21 setConfiguration:v18];
  }
  v22 = [v25 dismissAction];

  if (v22)
  {
    uint64_t v23 = [(PPKQuickLookBannerView *)self closeButton];
    v24 = [v25 dismissAction];
    [v23 addAction:v24 forControlEvents:64];
  }
}

- (void)_updateImageViewWithConfiguration:(id)a3
{
  id v6 = [a3 image];
  BOOL v4 = [(PPKQuickLookBannerView *)self imageView];
  [v4 setImage:v6];
  if (v6) {
    double v5 = 4.0;
  }
  else {
    double v5 = 0.0;
  }
  [(NSLayoutConstraint *)self->_imageViewCollapsingConstraint setActive:v6 == 0];
  [(NSLayoutConstraint *)self->_titleStackLeadingConstraint setConstant:v5];
  [v4 setHidden:v6 == 0];
}

- (void)clearExistingActions:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__PPKQuickLookBannerView_clearExistingActions___block_invoke;
  v5[3] = &unk_2640D3F60;
  id v6 = v3;
  id v4 = v3;
  [v4 enumerateEventHandlers:v5];
}

uint64_t __47__PPKQuickLookBannerView_clearExistingActions___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2) {
    return [*(id *)(result + 32) removeAction:a2 forControlEvents:a5];
  }
  return result;
}

- (BOOL)_useCompactLayout
{
  v2 = [(PPKQuickLookBannerView *)self traitCollection];
  if ([v2 horizontalSizeClass] == 1)
  {
    BOOL v3 = 1;
  }
  else
  {
    id v4 = [MEMORY[0x263F82670] currentDevice];
    BOOL v3 = [v4 userInterfaceIdiom] == 0;
  }
  return v3;
}

- (BOOL)_isUsingAccessibilityContentSizeCategory
{
  v2 = [(PPKQuickLookBannerView *)self traitCollection];
  BOOL v3 = [v2 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (int64_t)_numberOfTitleLines
{
  if ([(PPKQuickLookBannerView *)self _isUsingAccessibilityContentSizeCategory])
  {
    return 0;
  }
  if ([(PPKQuickLookBannerView *)self _useCompactLayout]) {
    return 6;
  }
  return 0;
}

- (int64_t)_numberOfSubtitleLines
{
  if ([(PPKQuickLookBannerView *)self _isUsingAccessibilityContentSizeCategory])
  {
    return 0;
  }
  if ([(PPKQuickLookBannerView *)self _useCompactLayout]) {
    return 4;
  }
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PPKQuickLookBannerView;
  [(PPKQuickLookBannerView *)&v10 traitCollectionDidChange:v4];
  double v5 = [(PPKQuickLookBannerView *)self traitCollection];
  uint64_t v6 = [v5 horizontalSizeClass];
  if (v6 == [v4 horizontalSizeClass])
  {
    BOOL v7 = [(PPKQuickLookBannerView *)self traitCollection];
    uint64_t v8 = [v7 userInterfaceStyle];
    uint64_t v9 = [v4 userInterfaceStyle];

    if (v8 == v9) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(PPKQuickLookBannerView *)self _updateUI];
LABEL_6:
}

- (void)showWithAnimations:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UILabel)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleStackLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewCollapsingConstraint, 0);
  objc_storeStrong((id *)&self->_extraCompactSizeConstraints, 0);
  objc_storeStrong((id *)&self->_compactSizeConstraints, 0);
  objc_storeStrong((id *)&self->_regularSizeConstraints, 0);
  objc_storeStrong((id *)&self->_titleStackView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
}

@end