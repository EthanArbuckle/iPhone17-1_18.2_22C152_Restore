@interface RUIHeaderView
- (BOOL)_hasIcon;
- (BOOL)_isLeftToRight;
- (BOOL)_shouldHideLeadingSpacerForLabel:(id)a3;
- (BOOL)_shouldHideTrailingSpacerForLabel:(id)a3;
- (RUIHeaderView)initWithAttributes:(id)a3;
- (UIColor)headerLabelColor;
- (UIEdgeInsets)margins;
- (double)_headerOffsetInView:(id)a3;
- (double)headerHeightForWidth:(double)a3 inView:(id)a4;
- (double)imageLabelPadding;
- (double)subHeaderTopMarginValue;
- (id)_makeSpacer;
- (id)_paddedStackViewWithArrangedSubviews:(id)a3;
- (id)detailHeaderLabel;
- (id)headerLabel;
- (id)iconImage;
- (id)navSubHeaderLabel;
- (id)navTitleLabel;
- (id)subHeaderLabel;
- (void)_arrangeItems;
- (void)layoutSubviews;
- (void)setDetailHeaderColor:(id)a3;
- (void)setDetailText:(id)a3 attributes:(id)a4;
- (void)setHeaderAlignment:(int64_t)a3;
- (void)setHeaderColor:(id)a3;
- (void)setHeaderLabelColor:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setImageAlignment:(int)a3;
- (void)setImageLabelPadding:(double)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setMargins:(UIEdgeInsets)a3;
- (void)setNavSubHeaderTitle:(id)a3;
- (void)setNavTitle:(id)a3;
- (void)setSectionIsFirst:(BOOL)a3;
- (void)setSubHeaderAlignment:(int64_t)a3;
- (void)setSubHeaderColor:(id)a3;
- (void)setSubHeaderText:(id)a3 attributes:(id)a4;
- (void)setSubHeaderTopMarginValue:(double)a3;
- (void)setText:(id)a3 attributes:(id)a4;
@end

@implementation RUIHeaderView

- (double)_headerOffsetInView:(id)a3
{
  v4 = [a3 traitCollection];
  uint64_t v5 = [v4 horizontalSizeClass];

  double result = 36.0;
  if (v5 == 1) {
    double result = 26.0;
  }
  if (!self->_isFirstSection) {
    return 16.0;
  }
  return result;
}

- (id)_makeSpacer
{
  id v2 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v2 setUserInteractionEnabled:0];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = [v2 heightAnchor];
  v4 = [v3 constraintEqualToConstant:1.0];

  LODWORD(v5) = 1132068864;
  [v4 setPriority:v5];
  [v4 setActive:1];
  LODWORD(v6) = 1112014848;
  [v2 setContentHuggingPriority:0 forAxis:v6];
  LODWORD(v7) = 1112014848;
  [v2 setContentCompressionResistancePriority:0 forAxis:v7];

  return v2;
}

- (RUIHeaderView)initWithAttributes:(id)a3
{
  v103[3] = *MEMORY[0x263EF8340];
  v95.receiver = self;
  v95.super_class = (Class)RUIHeaderView;
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v7 = -[RUIHeaderView initWithFrame:](&v95, sel_initWithFrame_, a3, *MEMORY[0x263F001A8], v4, v5, v6);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v3, v4, v5, v6);
    headerLabel = v7->_headerLabel;
    v7->_headerLabel = (UILabel *)v8;

    v10 = RemoteUIHeaderFont();
    [(UILabel *)v7->_headerLabel setFont:v10];

    v11 = RemoteUIHeaderTextColor();
    [(UILabel *)v7->_headerLabel setTextColor:v11];

    v12 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v7->_headerLabel setBackgroundColor:v12];

    [(UILabel *)v7->_headerLabel setNumberOfLines:0];
    [(UILabel *)v7->_headerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v13) = 1148846080;
    [(UILabel *)v7->_headerLabel setContentCompressionResistancePriority:0 forAxis:v13];
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", v3, v4, v5, v6);
    iconView = v7->_iconView;
    v7->_iconView = (UIImageView *)v14;

    uint64_t v16 = [(RUIHeaderView *)v7 _makeSpacer];
    iconLeadingSpacer = v7->_iconLeadingSpacer;
    v7->_iconLeadingSpacer = (UIView *)v16;

    uint64_t v18 = [(RUIHeaderView *)v7 _makeSpacer];
    iconTrailingSpacer = v7->_iconTrailingSpacer;
    v7->_iconTrailingSpacer = (UIView *)v18;

    v103[0] = v7->_iconLeadingSpacer;
    v103[1] = v7->_iconView;
    v103[2] = v7->_iconTrailingSpacer;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v103 count:3];
    uint64_t v21 = [(RUIHeaderView *)v7 _paddedStackViewWithArrangedSubviews:v20];
    iconStackView = v7->_iconStackView;
    v7->_iconStackView = (UIStackView *)v21;

    LODWORD(v23) = 1148846080;
    [(UIStackView *)v7->_iconStackView setContentHuggingPriority:0 forAxis:v23];
    uint64_t v24 = [(RUIHeaderView *)v7 _makeSpacer];
    headerLeadingSpacer = v7->_headerLeadingSpacer;
    v7->_headerLeadingSpacer = (UIView *)v24;

    uint64_t v26 = [(RUIHeaderView *)v7 _makeSpacer];
    headerTrailingSpacer = v7->_headerTrailingSpacer;
    v7->_headerTrailingSpacer = (UIView *)v26;

    v102[0] = v7->_headerLeadingSpacer;
    v102[1] = v7->_headerLabel;
    v102[2] = v7->_headerTrailingSpacer;
    v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v102 count:3];
    uint64_t v29 = [(RUIHeaderView *)v7 _paddedStackViewWithArrangedSubviews:v28];
    headerStackView = v7->_headerStackView;
    v7->_headerStackView = (UIStackView *)v29;

    uint64_t v31 = [(RUIHeaderView *)v7 _makeSpacer];
    subHeaderLeadingSpacer = v7->_subHeaderLeadingSpacer;
    v7->_subHeaderLeadingSpacer = (UIView *)v31;

    uint64_t v33 = [(RUIHeaderView *)v7 _makeSpacer];
    subHeaderTrailingSpacer = v7->_subHeaderTrailingSpacer;
    v7->_subHeaderTrailingSpacer = (UIView *)v33;

    v101[0] = v7->_subHeaderLeadingSpacer;
    v35 = [(RUIHeaderView *)v7 subHeaderLabel];
    v101[1] = v35;
    v101[2] = v7->_subHeaderTrailingSpacer;
    v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v101 count:3];
    uint64_t v37 = [(RUIHeaderView *)v7 _paddedStackViewWithArrangedSubviews:v36];
    subHeaderStackView = v7->_subHeaderStackView;
    v7->_subHeaderStackView = (UIStackView *)v37;

    uint64_t v39 = [(RUIHeaderView *)v7 _makeSpacer];
    navTitleLeadingSpacer = v7->_navTitleLeadingSpacer;
    v7->_navTitleLeadingSpacer = (UIView *)v39;

    uint64_t v41 = [(RUIHeaderView *)v7 _makeSpacer];
    navTitleTrailingSpacer = v7->_navTitleTrailingSpacer;
    v7->_navTitleTrailingSpacer = (UIView *)v41;

    v100[0] = v7->_navTitleLeadingSpacer;
    v43 = [(RUIHeaderView *)v7 navTitleLabel];
    v100[1] = v43;
    v100[2] = v7->_navTitleTrailingSpacer;
    v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v100 count:3];
    uint64_t v45 = [(RUIHeaderView *)v7 _paddedStackViewWithArrangedSubviews:v44];
    navTitleStackView = v7->_navTitleStackView;
    v7->_navTitleStackView = (UIStackView *)v45;

    [(UIStackView *)v7->_navTitleStackView setHidden:1];
    uint64_t v47 = [(RUIHeaderView *)v7 _makeSpacer];
    navSubtitleLeadingSpacer = v7->_navSubtitleLeadingSpacer;
    v7->_navSubtitleLeadingSpacer = (UIView *)v47;

    uint64_t v49 = [(RUIHeaderView *)v7 _makeSpacer];
    navSubtitleTrailingSpacer = v7->_navSubtitleTrailingSpacer;
    v7->_navSubtitleTrailingSpacer = (UIView *)v49;

    v99[0] = v7->_navSubtitleLeadingSpacer;
    v51 = [(RUIHeaderView *)v7 navSubHeaderLabel];
    v99[1] = v51;
    v99[2] = v7->_navSubtitleTrailingSpacer;
    v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v99 count:3];
    uint64_t v53 = [(RUIHeaderView *)v7 _paddedStackViewWithArrangedSubviews:v52];
    navSubtitleStackView = v7->_navSubtitleStackView;
    v7->_navSubtitleStackView = (UIStackView *)v53;

    [(UIStackView *)v7->_navSubtitleStackView setHidden:1];
    id v55 = objc_alloc(MEMORY[0x263F82BF8]);
    v56 = [(RUIHeaderView *)v7 _makeSpacer];
    v98[0] = v56;
    v98[1] = v7->_navTitleStackView;
    v98[2] = v7->_navSubtitleStackView;
    v98[3] = v7->_headerStackView;
    v98[4] = v7->_subHeaderStackView;
    v57 = [(RUIHeaderView *)v7 _makeSpacer];
    v98[5] = v57;
    v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:v98 count:6];
    uint64_t v59 = [v55 initWithArrangedSubviews:v58];
    labelsStackView = v7->_labelsStackView;
    v7->_labelsStackView = (UIStackView *)v59;

    [(UIStackView *)v7->_labelsStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v7->_labelsStackView setAxis:1];
    [(UIStackView *)v7->_labelsStackView setAlignment:0];
    [(UIStackView *)v7->_labelsStackView setDistribution:3];
    LODWORD(v61) = 1132068864;
    [(UIStackView *)v7->_labelsStackView setContentHuggingPriority:0 forAxis:v61];
    v62 = -[RUILinkLabel initWithFrame:]([RUILinkLabel alloc], "initWithFrame:", v3, v4, v5, v6);
    detailHeaderLabel = v7->_detailHeaderLabel;
    v7->_detailHeaderLabel = v62;

    v64 = RemoteUIHeaderFont();
    v65 = [(RUILinkLabel *)v7->_detailHeaderLabel textLabel];
    [v65 setFont:v64];

    v66 = [MEMORY[0x263F825C8] clearColor];
    v67 = [(RUILinkLabel *)v7->_detailHeaderLabel textLabel];
    [v67 setBackgroundColor:v66];

    [(RUILinkLabel *)v7->_detailHeaderLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(RUILinkLabel *)v7->_detailHeaderLabel setNumberOfLines:1];
    [(RUILinkLabel *)v7->_detailHeaderLabel setLineBreakMode:5];
    v68 = [(RUILinkLabel *)v7->_detailHeaderLabel textLabel];
    LODWORD(v69) = 1148846080;
    [v68 setContentCompressionResistancePriority:0 forAxis:v69];

    v70 = [(RUILinkLabel *)v7->_detailHeaderLabel textLabel];
    LODWORD(v71) = 1132068864;
    [v70 setContentHuggingPriority:0 forAxis:v71];

    [(RUILinkLabel *)v7->_detailHeaderLabel setHidden:1];
    id v72 = objc_alloc(MEMORY[0x263F82BF8]);
    v97[0] = v7->_iconStackView;
    v97[1] = v7->_labelsStackView;
    v97[2] = v7->_detailHeaderLabel;
    v73 = [MEMORY[0x263EFF8C0] arrayWithObjects:v97 count:3];
    uint64_t v74 = [v72 initWithArrangedSubviews:v73];
    mainStackView = v7->_mainStackView;
    v7->_mainStackView = (UIStackView *)v74;

    [(UIStackView *)v7->_mainStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v7->_mainStackView setAlignment:0];
    [(UIStackView *)v7->_mainStackView setDistribution:0];
    [(UIImageView *)v7->_iconView setContentMode:1];
    [(UIImageView *)v7->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    -[RUIHeaderView setLayoutMargins:](v7, "setLayoutMargins:", 0.0, 0.0, 8.0, 0.0);
    [(RUIHeaderView *)v7 setLayoutMarginsFollowReadableWidth:0];
    [(RUIHeaderView *)v7 setPreservesSuperviewLayoutMargins:0];
    [(UIStackView *)v7->_iconStackView setHidden:1];
    v7->_imageLabelPadding = 12.0;
    [(RUIHeaderView *)v7 addSubview:v7->_mainStackView];
    v87 = (void *)MEMORY[0x263F08938];
    v93 = [(UIStackView *)v7->_mainStackView leadingAnchor];
    v94 = [(RUIHeaderView *)v7 layoutMarginsGuide];
    v92 = [v94 leadingAnchor];
    v91 = [v93 constraintEqualToAnchor:v92];
    v96[0] = v91;
    v89 = [(UIStackView *)v7->_mainStackView topAnchor];
    v90 = [(RUIHeaderView *)v7 layoutMarginsGuide];
    v88 = [v90 topAnchor];
    v86 = [v89 constraintEqualToAnchor:v88];
    v96[1] = v86;
    v76 = [(UIStackView *)v7->_mainStackView bottomAnchor];
    v77 = [(RUIHeaderView *)v7 layoutMarginsGuide];
    v78 = [v77 bottomAnchor];
    v79 = [v76 constraintEqualToAnchor:v78];
    v96[2] = v79;
    v80 = [(UIStackView *)v7->_mainStackView trailingAnchor];
    v81 = [(RUIHeaderView *)v7 layoutMarginsGuide];
    v82 = [v81 trailingAnchor];
    v83 = [v80 constraintEqualToAnchor:v82];
    v96[3] = v83;
    v84 = [MEMORY[0x263EFF8C0] arrayWithObjects:v96 count:4];
    [v87 activateConstraints:v84];

    [(RUIHeaderView *)v7 _arrangeItems];
  }
  return v7;
}

- (id)_paddedStackViewWithArrangedSubviews:(id)a3
{
  double v3 = (objc_class *)MEMORY[0x263F82BF8];
  id v4 = a3;
  double v5 = (void *)[[v3 alloc] initWithArrangedSubviews:v4];

  [v5 setAxis:0];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setAlignment:3];
  [v5 setDistribution:3];
  return v5;
}

- (id)headerLabel
{
  return self->_headerLabel;
}

- (void)setText:(id)a3 attributes:(id)a4
{
  headerLabel = self->_headerLabel;
  id v7 = a4;
  [(UILabel *)headerLabel setText:a3];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"largeFont"];

  LODWORD(headerLabel) = [v8 isEqualToString:@"true"];
  if (headerLabel)
  {
    self->_hasLargeIcon = 1;
    v9 = [MEMORY[0x263F81708] systemFontOfSize:24.0 weight:*MEMORY[0x263F81840]];
    v10 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83618]];
    v11 = self->_headerLabel;
    v12 = [v10 scaledFontForFont:v9];
    [(UILabel *)v11 setFont:v12];

    [(UILabel *)self->_headerLabel setNumberOfLines:5];
    [(UILabel *)self->_headerLabel setMinimumScaleFactor:0.5];
    [(UILabel *)self->_headerLabel setAdjustsFontSizeToFitWidth:1];
  }
  [(RUIHeaderView *)self setNeedsLayout];
}

- (void)setHeaderAlignment:(int64_t)a3
{
  [(UILabel *)self->_headerLabel setTextAlignment:a3];
  [(RUIHeaderView *)self _arrangeItems];
}

- (void)setHeaderColor:(id)a3
{
  if (a3) {
    -[UILabel setTextColor:](self->_headerLabel, "setTextColor:");
  }
}

- (id)subHeaderLabel
{
  subHeaderLabel = self->_subHeaderLabel;
  if (!subHeaderLabel)
  {
    id v4 = objc_alloc(MEMORY[0x263F828E0]);
    double v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    double v6 = self->_subHeaderLabel;
    self->_subHeaderLabel = v5;

    id v7 = RemoteUISubheaderFont();
    [(UILabel *)self->_subHeaderLabel setFont:v7];

    uint64_t v8 = RemoteUISubheaderTextColor();
    [(UILabel *)self->_subHeaderLabel setTextColor:v8];

    v9 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)self->_subHeaderLabel setBackgroundColor:v9];

    [(UILabel *)self->_subHeaderLabel setLineBreakMode:0];
    [(UILabel *)self->_subHeaderLabel setNumberOfLines:0];
    [(UILabel *)self->_subHeaderLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    subHeaderLabel = self->_subHeaderLabel;
  }
  return subHeaderLabel;
}

- (void)setSubHeaderText:(id)a3 attributes:(id)a4
{
  id v5 = a3;
  double v6 = [(RUIHeaderView *)self subHeaderLabel];
  [v6 setText:v5];

  [(RUIHeaderView *)self setNeedsLayout];
}

- (void)setSubHeaderAlignment:(int64_t)a3
{
  id v5 = [(RUIHeaderView *)self subHeaderLabel];
  [v5 setTextAlignment:a3];

  [(RUIHeaderView *)self _arrangeItems];
}

- (void)setSubHeaderColor:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(RUIHeaderView *)self subHeaderLabel];
    [v5 setTextColor:v4];
  }
}

- (void)setImageLabelPadding:(double)a3
{
  self->_imageLabelPadding = a3;
  [(RUIHeaderView *)self setNeedsLayout];
}

- (id)detailHeaderLabel
{
  return self->_detailHeaderLabel;
}

- (void)setDetailText:(id)a3 attributes:(id)a4
{
  -[RUILinkLabel setText:](self->_detailHeaderLabel, "setText:", a3, a4);
  [(RUILinkLabel *)self->_detailHeaderLabel setHidden:0];
  [(RUIHeaderView *)self _arrangeItems];
}

- (void)setDetailHeaderColor:(id)a3
{
  if (a3)
  {
    detailHeaderLabel = self->_detailHeaderLabel;
    id v4 = a3;
    id v5 = [(RUILinkLabel *)detailHeaderLabel textLabel];
    [v5 setTextColor:v4];
  }
}

- (id)iconImage
{
  return [(UIImageView *)self->_iconView image];
}

- (void)setIconImage:(id)a3
{
  [(UIImageView *)self->_iconView setImage:a3];
  [(UIStackView *)self->_iconStackView setHidden:0];
  [(RUIHeaderView *)self _arrangeItems];
}

- (void)setImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v12[2] = *MEMORY[0x263EF8340];
  [(UIImageView *)self->_iconView frame];
  -[UIImageView setFrame:](self->_iconView, "setFrame:");
  self->_customIconSize = 1;
  [(UIStackView *)self->_iconStackView setHidden:0];
  double v6 = (void *)MEMORY[0x263F08938];
  id v7 = [(UIImageView *)self->_iconView widthAnchor];
  uint64_t v8 = [v7 constraintEqualToConstant:width];
  v12[0] = v8;
  v9 = [(UIImageView *)self->_iconView heightAnchor];
  v10 = [v9 constraintEqualToConstant:height];
  v12[1] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  [v6 activateConstraints:v11];

  [(RUIHeaderView *)self setNeedsLayout];
}

- (void)_arrangeItems
{
  p_iconStackView = &self->_iconStackView;
  [(UIStackView *)self->_iconStackView removeFromSuperview];
  [(UIStackView *)self->_labelsStackView removeFromSuperview];
  p_detailHeaderLabel = &self->_detailHeaderLabel;
  [(RUILinkLabel *)self->_detailHeaderLabel removeFromSuperview];
  uint64_t imageAlignment = self->_imageAlignment;
  if (imageAlignment == 3)
  {
    uint64_t v6 = 0;
    uint64_t imageAlignment = 1;
    id v7 = &self->_detailHeaderLabel;
    p_detailHeaderLabel = (RUILinkLabel **)p_iconStackView;
  }
  else
  {
    if (imageAlignment == 1)
    {
      uint64_t v6 = 0;
    }
    else if (imageAlignment || ([(UIStackView *)*p_iconStackView isHidden] & 1) == 0)
    {
      uint64_t imageAlignment = 0;
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t imageAlignment = 1;
    }
    id v7 = (RUILinkLabel **)p_iconStackView;
  }
  [(UIStackView *)*p_iconStackView setAxis:imageAlignment];
  [(UIStackView *)self->_mainStackView setAxis:v6];
  [(UIStackView *)self->_mainStackView addArrangedSubview:*v7];
  [(UIStackView *)self->_mainStackView addArrangedSubview:self->_labelsStackView];
  [(UIStackView *)self->_mainStackView addArrangedSubview:*p_detailHeaderLabel];
  [(RUIHeaderView *)self setNeedsLayout];
}

- (BOOL)_isLeftToRight
{
  return objc_msgSend(MEMORY[0x263F82E00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[RUIHeaderView semanticContentAttribute](self, "semanticContentAttribute")) == 0;
}

- (BOOL)_shouldHideLeadingSpacerForLabel:(id)a3
{
  uint64_t v4 = [a3 textAlignment];
  if ((unint64_t)(v4 - 3) < 2) {
    return 1;
  }
  if (v4 == 2) {
    return ![(RUIHeaderView *)self _isLeftToRight];
  }
  if (v4) {
    return 0;
  }
  return [(RUIHeaderView *)self _isLeftToRight];
}

- (BOOL)_shouldHideTrailingSpacerForLabel:(id)a3
{
  uint64_t v4 = [a3 textAlignment];
  if (v4 == 2)
  {
    return [(RUIHeaderView *)self _isLeftToRight];
  }
  else if (v4)
  {
    return 0;
  }
  else
  {
    return ![(RUIHeaderView *)self _isLeftToRight];
  }
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)RUIHeaderView;
  [(RUIHeaderView *)&v13 layoutSubviews];
  [(UIStackView *)self->_mainStackView setSpacing:self->_imageLabelPadding];
  [(UIView *)self->_headerLeadingSpacer setHidden:[(RUIHeaderView *)self _shouldHideLeadingSpacerForLabel:self->_headerLabel]];
  [(UIView *)self->_headerTrailingSpacer setHidden:[(RUIHeaderView *)self _shouldHideTrailingSpacerForLabel:self->_headerLabel]];
  double v3 = [(RUIHeaderView *)self subHeaderLabel];
  [(UIView *)self->_subHeaderLeadingSpacer setHidden:[(RUIHeaderView *)self _shouldHideLeadingSpacerForLabel:v3]];

  uint64_t v4 = [(RUIHeaderView *)self subHeaderLabel];
  [(UIView *)self->_subHeaderTrailingSpacer setHidden:[(RUIHeaderView *)self _shouldHideTrailingSpacerForLabel:v4]];

  id v5 = [(RUIHeaderView *)self navTitleLabel];
  [(UIView *)self->_navTitleLeadingSpacer setHidden:[(RUIHeaderView *)self _shouldHideLeadingSpacerForLabel:v5]];

  uint64_t v6 = [(RUIHeaderView *)self navTitleLabel];
  [(UIView *)self->_navTitleTrailingSpacer setHidden:[(RUIHeaderView *)self _shouldHideTrailingSpacerForLabel:v6]];

  id v7 = [(RUIHeaderView *)self navSubHeaderLabel];
  [(UIView *)self->_navSubtitleLeadingSpacer setHidden:[(RUIHeaderView *)self _shouldHideLeadingSpacerForLabel:v7]];

  uint64_t v8 = [(RUIHeaderView *)self navSubHeaderLabel];
  [(UIView *)self->_navSubtitleTrailingSpacer setHidden:[(RUIHeaderView *)self _shouldHideTrailingSpacerForLabel:v8]];

  v9 = [(RUIHeaderView *)self navTitleLabel];
  v10 = [v9 text];
  -[UIStackView setHidden:](self->_navTitleStackView, "setHidden:", [v10 length] != 0);

  v11 = [(RUIHeaderView *)self navSubHeaderLabel];
  v12 = [v11 text];
  -[UIStackView setHidden:](self->_navSubtitleStackView, "setHidden:", [v12 length] != 0);
}

- (void)setImageAlignment:(int)a3
{
  self->_uint64_t imageAlignment = a3;
  [(RUIHeaderView *)self _arrangeItems];
}

- (void)setSectionIsFirst:(BOOL)a3
{
  if (self->_isFirstSection != a3)
  {
    self->_isFirstSection = a3;
    [(RUIHeaderView *)self setNeedsLayout];
  }
}

- (BOOL)_hasIcon
{
  return [(UIStackView *)self->_iconStackView isHidden] ^ 1;
}

- (double)headerHeightForWidth:(double)a3 inView:(id)a4
{
  -[RUIHeaderView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", a4, a3, *(double *)(MEMORY[0x263F83810] + 8));
  return v4;
}

- (void)setNavTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(RUIHeaderView *)self navTitleLabel];
  [v5 setText:v4];

  [(RUIHeaderView *)self _arrangeItems];
}

- (id)navTitleLabel
{
  navTitleLabel = self->_navTitleLabel;
  if (!navTitleLabel)
  {
    id v4 = objc_alloc(MEMORY[0x263F828E0]);
    id v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    uint64_t v6 = self->_navTitleLabel;
    self->_navTitleLabel = v5;

    id v7 = RemoteUINavHeaderFont([(UILabel *)self->_navTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0]);
    [(UILabel *)self->_navTitleLabel setFont:v7];

    uint64_t v8 = RemoteUINavHeaderTextColor();
    [(UILabel *)self->_navTitleLabel setTextColor:v8];

    v9 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)self->_navTitleLabel setBackgroundColor:v9];

    [(UILabel *)self->_navTitleLabel setLineBreakMode:0];
    [(UILabel *)self->_navTitleLabel setTextAlignment:1];
    [(UILabel *)self->_navTitleLabel setNumberOfLines:0];
    navTitleLabel = self->_navTitleLabel;
  }
  return navTitleLabel;
}

- (void)setNavSubHeaderTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(RUIHeaderView *)self navSubHeaderLabel];
  [v5 setText:v4];

  [(RUIHeaderView *)self _arrangeItems];
}

- (id)navSubHeaderLabel
{
  navSubHeaderLabel = self->_navSubHeaderLabel;
  if (!navSubHeaderLabel)
  {
    id v4 = objc_alloc(MEMORY[0x263F828E0]);
    id v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    uint64_t v6 = self->_navSubHeaderLabel;
    self->_navSubHeaderLabel = v5;

    id v7 = RemoteUINavHeaderFont([(UILabel *)self->_navSubHeaderLabel setTranslatesAutoresizingMaskIntoConstraints:0]);
    [(UILabel *)self->_navSubHeaderLabel setFont:v7];

    uint64_t v8 = RemoteUINavSubHeaderTextColor();
    [(UILabel *)self->_navSubHeaderLabel setTextColor:v8];

    v9 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)self->_navSubHeaderLabel setBackgroundColor:v9];

    [(UILabel *)self->_navSubHeaderLabel setLineBreakMode:0];
    [(UILabel *)self->_navSubHeaderLabel setTextAlignment:1];
    [(UILabel *)self->_navSubHeaderLabel setNumberOfLines:0];
    navSubHeaderLabel = self->_navSubHeaderLabel;
  }
  return navSubHeaderLabel;
}

- (UIEdgeInsets)margins
{
  double top = self->_margins.top;
  double left = self->_margins.left;
  double bottom = self->_margins.bottom;
  double right = self->_margins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

- (double)subHeaderTopMarginValue
{
  return self->_subHeaderTopMarginValue;
}

- (void)setSubHeaderTopMarginValue:(double)a3
{
  self->_subHeaderTopMarginValue = a3;
}

- (double)imageLabelPadding
{
  return self->_imageLabelPadding;
}

- (UIColor)headerLabelColor
{
  return self->_headerLabelColor;
}

- (void)setHeaderLabelColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerLabelColor, 0);
  objc_storeStrong((id *)&self->_subHeaderTrailingSpacer, 0);
  objc_storeStrong((id *)&self->_subHeaderLeadingSpacer, 0);
  objc_storeStrong((id *)&self->_subHeaderStackView, 0);
  objc_storeStrong((id *)&self->_navSubtitleTrailingSpacer, 0);
  objc_storeStrong((id *)&self->_navSubtitleLeadingSpacer, 0);
  objc_storeStrong((id *)&self->_navSubtitleStackView, 0);
  objc_storeStrong((id *)&self->_navTitleTrailingSpacer, 0);
  objc_storeStrong((id *)&self->_navTitleLeadingSpacer, 0);
  objc_storeStrong((id *)&self->_navTitleStackView, 0);
  objc_storeStrong((id *)&self->_headerTrailingSpacer, 0);
  objc_storeStrong((id *)&self->_headerLeadingSpacer, 0);
  objc_storeStrong((id *)&self->_headerStackView, 0);
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_iconTrailingSpacer, 0);
  objc_storeStrong((id *)&self->_iconLeadingSpacer, 0);
  objc_storeStrong((id *)&self->_iconStackView, 0);
  objc_storeStrong((id *)&self->_mainStackView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_subHeaderLabel, 0);
  objc_storeStrong((id *)&self->_detailHeaderLabel, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_navSubHeaderLabel, 0);
  objc_storeStrong((id *)&self->_navTitleLabel, 0);
}

@end