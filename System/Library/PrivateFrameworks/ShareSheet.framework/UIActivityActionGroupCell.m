@interface UIActivityActionGroupCell
- (NSString)subtitle;
- (NSString)title;
- (NSUUID)identifier;
- (UIActivityActionGroupCell)initWithFrame:(CGRect)a3;
- (UIColor)contentTintColor;
- (UIColor)statusImageTintColor;
- (UIImage)image;
- (UIImage)statusImage;
- (UIImageView)activityImageView;
- (UIImageView)statusImageViewIfLoaded;
- (UIStackView)imageStackView;
- (UIStackView)titleStackView;
- (UIView)activitySlotView;
- (UIView)platterView;
- (UIView)titleSlotView;
- (_UIActivityActionCellBadgeView)badgeViewIfLoaded;
- (_UIActivityActionCellTitleLabel)subtitleLabelIfLoaded;
- (_UIActivityActionCellTitleLabel)titleLabel;
- (_UIHostActivityProxy)activityProxy;
- (double)_legacyIconSizeForContentSizeCategory:(id)a3;
- (double)platterTextHeight;
- (id)badgeView;
- (id)statusImageView;
- (id)subtitleLabel;
- (unsigned)imageSlotID;
- (unsigned)titleSlotID;
- (void)_updateBadgeWithText:(id)a3 textColor:(id)a4 backgroundColor:(id)a5;
- (void)_updateContentTintColor;
- (void)_updateImageView;
- (void)_updateStatusImageView;
- (void)_updateSubtitleLabel;
- (void)_updateTitleHeight;
- (void)_updateTitleView;
- (void)prepareForReuse;
- (void)setActivityImageView:(id)a3;
- (void)setActivityProxy:(id)a3;
- (void)setActivitySlotView:(id)a3;
- (void)setBadgeViewIfLoaded:(id)a3;
- (void)setContentTintColor:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageSlotID:(unsigned int)a3;
- (void)setImageStackView:(id)a3;
- (void)setPlatterTextHeight:(double)a3;
- (void)setPlatterView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setStatusImage:(id)a3;
- (void)setStatusImageTintColor:(id)a3;
- (void)setStatusImageViewIfLoaded:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabelIfLoaded:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleSlotID:(unsigned int)a3;
- (void)setTitleSlotView:(id)a3;
- (void)setTitleStackView:(id)a3;
@end

@implementation UIActivityActionGroupCell

- (UIActivityActionGroupCell)initWithFrame:(CGRect)a3
{
  v132.receiver = self;
  v132.super_class = (Class)UIActivityActionGroupCell;
  v3 = -[UIActivityActionCell initWithFrame:](&v132, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(_UIActivityActionCellTitleLabel);
    v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(_UIActivityActionCellTitleLabel *)v4 setBackgroundColor:v5];

    [(_UIActivityActionCellTitleLabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_UIActivityActionCellTitleLabel *)v4 setLineBreakMode:4];
    [(_UIActivityActionCellTitleLabel *)v4 setAlpha:0.0];
    [(UIActivityActionGroupCell *)v3 setTitleLabel:v4];
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    [v6 setContentMode:4];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    v131 = v6;
    [(UIActivityActionGroupCell *)v3 setActivityImageView:v6];
    id v7 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    v130 = v7;
    [(UIActivityActionGroupCell *)v3 setActivitySlotView:v7];
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v129 = v8;
    [(UIActivityActionGroupCell *)v3 setTitleSlotView:v8];
    id v9 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
    [v9 setAxis:1];
    [v9 setSpacing:-2.0];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    v128 = v9;
    [(UIActivityActionGroupCell *)v3 setTitleStackView:v9];
    id v10 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
    [v10 setAlignment:3];
    [v10 setSpacing:8.0];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    v126 = v10;
    [(UIActivityActionGroupCell *)v3 setImageStackView:v10];
    v11 = [(UIActivityActionGroupCell *)v3 contentView];
    v12 = (void *)MEMORY[0x1E4FB1798];
    uint64_t v13 = *MEMORY[0x1E4FB28C8];
    v14 = [MEMORY[0x1E4FB17A0] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:0x8000 options:0];
    v15 = [v12 fontWithDescriptor:v14 size:0.0];

    v16 = [(UIActivityActionGroupCell *)v3 traitCollection];
    v17 = [v16 preferredContentSizeCategory];

    [(UIActivityActionGroupCell *)v3 _legacyIconSizeForContentSizeCategory:v17];
    double v19 = v18;
    v127 = v17;
    if (UIContentSizeCategoryIsAccessibilityCategory(v17))
    {
      v20 = (void *)MEMORY[0x1E4FB17A0];
      v21 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB2798]];
      v22 = [v20 preferredFontDescriptorWithTextStyle:v13 compatibleWithTraitCollection:v21];

      v23 = [v22 fontDescriptorWithSymbolicTraits:0x8000];

      v24 = [MEMORY[0x1E4FB1798] fontWithDescriptor:v23 size:0.0];
    }
    else
    {
      v24 = v15;
    }
    v25 = [(UIActivityActionGroupCell *)v3 titleStackView];
    v26 = [(UIActivityActionGroupCell *)v3 titleLabel];
    [v25 addArrangedSubview:v26];

    v27 = [(UIActivityActionGroupCell *)v3 imageStackView];
    v28 = [(UIActivityActionGroupCell *)v3 activityImageView];
    [v27 addArrangedSubview:v28];

    v29 = [(UIActivityActionGroupCell *)v3 titleStackView];
    [v11 addSubview:v29];

    v30 = [(UIActivityActionGroupCell *)v3 imageStackView];
    [v11 addSubview:v30];

    v31 = [(UIActivityActionGroupCell *)v3 activitySlotView];
    [v11 addSubview:v31];

    v32 = [(UIActivityActionGroupCell *)v3 titleSlotView];
    [v11 addSubview:v32];

    v33 = [MEMORY[0x1E4F1CA48] array];
    v34 = [(UIActivityActionGroupCell *)v3 titleStackView];
    v35 = [v34 leadingAnchor];
    v36 = [v11 layoutMarginsGuide];
    v37 = [v36 leadingAnchor];
    v38 = [v35 constraintEqualToAnchor:v37];
    [v33 addObject:v38];

    v39 = [(UIActivityActionGroupCell *)v3 titleStackView];
    v40 = [v39 topAnchor];
    v41 = [v11 topAnchor];
    v42 = [v40 constraintGreaterThanOrEqualToAnchor:v41 constant:4.0];
    [v33 addObject:v42];

    v43 = [v11 bottomAnchor];
    v44 = [(UIActivityActionGroupCell *)v3 titleStackView];
    v45 = [v44 bottomAnchor];
    v46 = [v43 constraintGreaterThanOrEqualToAnchor:v45 constant:4.0];
    [v33 addObject:v46];

    v47 = [v11 heightAnchor];
    v48 = [(UIActivityActionGroupCell *)v3 titleLabel];
    v49 = [v48 heightAnchor];
    v50 = [v47 constraintGreaterThanOrEqualToAnchor:v49 constant:30.0];
    [v33 addObject:v50];

    v51 = [(UIActivityActionGroupCell *)v3 titleStackView];
    v52 = [v51 centerYAnchor];
    v53 = [v11 centerYAnchor];
    v54 = [v52 constraintEqualToAnchor:v53];
    [v33 addObject:v54];

    v55 = [(UIActivityActionGroupCell *)v3 imageStackView];
    v56 = [v55 leadingAnchor];
    v57 = [(UIActivityActionGroupCell *)v3 titleStackView];
    v58 = [v57 trailingAnchor];
    v59 = [v56 constraintEqualToAnchor:v58 constant:16.0];
    [v33 addObject:v59];

    v60 = [v11 trailingAnchor];
    v61 = [(UIActivityActionGroupCell *)v3 imageStackView];
    v62 = [v61 trailingAnchor];
    [v24 lineHeight];
    v64 = [v60 constraintEqualToAnchor:v62 constant:v63 + 6.0 + v19 * -0.5];
    [v33 addObject:v64];

    v65 = [(UIActivityActionGroupCell *)v3 imageStackView];
    v66 = [v65 centerYAnchor];
    v67 = [v11 centerYAnchor];
    v68 = [v66 constraintEqualToAnchor:v67];
    [v33 addObject:v68];

    v69 = [(UIActivityActionGroupCell *)v3 imageStackView];
    v70 = [v69 heightAnchor];
    v71 = [v70 constraintEqualToConstant:v19];
    [v33 addObject:v71];

    v72 = [(UIActivityActionGroupCell *)v3 activityImageView];
    v73 = [v72 widthAnchor];
    v74 = [v73 constraintEqualToConstant:v19];
    [v33 addObject:v74];

    v75 = [(UIActivityActionGroupCell *)v3 activityImageView];
    v76 = [v75 heightAnchor];
    v77 = [v76 constraintEqualToConstant:v19];
    [v33 addObject:v77];

    v78 = [(UIActivityActionGroupCell *)v3 activitySlotView];
    v79 = [v78 centerXAnchor];
    v80 = [(UIActivityActionGroupCell *)v3 activityImageView];
    v81 = [v80 centerXAnchor];
    v82 = [v79 constraintEqualToAnchor:v81];
    [v33 addObject:v82];

    v83 = [v11 trailingAnchor];
    v84 = [(UIActivityActionGroupCell *)v3 activitySlotView];
    v85 = [v84 centerXAnchor];
    [v24 lineHeight];
    v87 = [v83 constraintEqualToAnchor:v85 constant:v86 + 6.0];
    [v33 addObject:v87];

    v88 = [(UIActivityActionGroupCell *)v3 activitySlotView];
    v89 = [v88 centerYAnchor];
    v90 = [v11 centerYAnchor];
    v91 = [v89 constraintEqualToAnchor:v90];
    [v33 addObject:v91];

    v92 = [(UIActivityActionGroupCell *)v3 activitySlotView];
    v93 = [v92 widthAnchor];
    v94 = [v93 constraintEqualToConstant:v19];
    [v33 addObject:v94];

    v95 = [(UIActivityActionGroupCell *)v3 activitySlotView];
    v96 = [v95 heightAnchor];
    v97 = [v96 constraintEqualToConstant:v19];
    [v33 addObject:v97];

    v98 = [(UIActivityActionGroupCell *)v3 titleSlotView];
    v99 = [v98 widthAnchor];
    v100 = [(UIActivityActionGroupCell *)v3 titleLabel];
    v101 = [v100 widthAnchor];
    v102 = [v99 constraintEqualToAnchor:v101];
    [v33 addObject:v102];

    v103 = [(UIActivityActionGroupCell *)v3 titleSlotView];
    v104 = [v103 heightAnchor];
    v105 = [(UIActivityActionGroupCell *)v3 titleLabel];
    v106 = [v105 heightAnchor];
    v107 = [v104 constraintEqualToAnchor:v106];
    [v33 addObject:v107];

    v108 = [(UIActivityActionGroupCell *)v3 titleSlotView];
    v109 = [v108 centerYAnchor];
    v110 = [(UIActivityActionGroupCell *)v3 titleLabel];
    v111 = [v110 centerYAnchor];
    v112 = [v109 constraintEqualToAnchor:v111];
    [v33 addObject:v112];

    v113 = [(UIActivityActionGroupCell *)v3 titleSlotView];
    v114 = [v113 centerXAnchor];
    v115 = [(UIActivityActionGroupCell *)v3 titleLabel];
    v116 = [v115 centerXAnchor];
    v117 = [v114 constraintEqualToAnchor:v116];
    [v33 addObject:v117];

    v118 = [(UIActivityActionGroupCell *)v3 titleLabel];
    v119 = [v118 heightAnchor];
    uint64_t v120 = [v119 constraintGreaterThanOrEqualToConstant:0.0];
    titleLabelHeightAnchor = v3->_titleLabelHeightAnchor;
    v3->_titleLabelHeightAnchor = (NSLayoutConstraint *)v120;

    [(NSLayoutConstraint *)v3->_titleLabelHeightAnchor setActive:0];
    [v33 addObject:v3->_titleLabelHeightAnchor];
    v122 = [v11 heightAnchor];
    v123 = [v122 constraintEqualToConstant:0.0];

    LODWORD(v124) = 1132068864;
    [v123 setPriority:v124];
    [v33 addObject:v123];
    [MEMORY[0x1E4F28DC8] activateConstraints:v33];
  }
  return v3;
}

- (id)subtitleLabel
{
  v3 = [(UIActivityActionGroupCell *)self subtitleLabelIfLoaded];

  if (!v3)
  {
    v4 = objc_alloc_init(_UIActivityActionCellTitleLabel);
    [(_UIActivityActionCellTitleLabel *)v4 setTextStyle:*MEMORY[0x1E4FB2950]];
    v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(_UIActivityActionCellTitleLabel *)v4 setTextColor:v5];

    id v6 = [MEMORY[0x1E4FB1618] clearColor];
    [(_UIActivityActionCellTitleLabel *)v4 setBackgroundColor:v6];

    [(_UIActivityActionCellTitleLabel *)v4 setLineBreakMode:4];
    [(_UIActivityActionCellTitleLabel *)v4 setAlpha:0.0];
    [(_UIActivityActionCellTitleLabel *)v4 setHidden:1];
    [(UIStackView *)self->_titleStackView addArrangedSubview:v4];
    [(UIActivityActionGroupCell *)self setSubtitleLabelIfLoaded:v4];
  }
  return [(UIActivityActionGroupCell *)self subtitleLabelIfLoaded];
}

- (id)badgeView
{
  v3 = [(UIActivityActionGroupCell *)self badgeViewIfLoaded];

  if (!v3)
  {
    v4 = objc_alloc_init(_UIActivityActionCellBadgeView);
    [(_UIActivityActionCellBadgeView *)v4 setAlpha:0.0];
    [(_UIActivityActionCellBadgeView *)v4 setHidden:1];
    v5 = [(UIActivityActionGroupCell *)self imageStackView];
    [v5 insertArrangedSubview:v4 atIndex:0];

    [(UIActivityActionGroupCell *)self setBadgeViewIfLoaded:v4];
  }
  return [(UIActivityActionGroupCell *)self badgeViewIfLoaded];
}

- (id)statusImageView
{
  v3 = [(UIActivityActionGroupCell *)self statusImageViewIfLoaded];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    v5 = [MEMORY[0x1E4FB1830] configurationWithScale:1];
    [v4 setPreferredSymbolConfiguration:v5];

    [v4 setContentMode:4];
    [v4 setAlpha:0.0];
    [v4 setHidden:1];
    LODWORD(v6) = 1144766464;
    [v4 setContentHuggingPriority:0 forAxis:v6];
    id v7 = [(UIActivityActionGroupCell *)self imageStackView];
    id v8 = [(UIActivityActionGroupCell *)self badgeViewIfLoaded];
    [v7 insertArrangedSubview:v4 atIndex:v8 != 0];

    [(UIActivityActionGroupCell *)self setStatusImageViewIfLoaded:v4];
  }
  return [(UIActivityActionGroupCell *)self statusImageViewIfLoaded];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)UIActivityActionGroupCell;
  [(UIActivityActionCell *)&v4 prepareForReuse];
  v3 = [(UIActivityActionGroupCell *)self imageStackView];
  [v3 setNeedsLayout];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(UIActivityActionGroupCell *)self activitySlotView];
  double v6 = [v5 layer];
  id v7 = [v6 contents];

  id v8 = [(UIActivityActionGroupCell *)self titleSlotView];
  id v9 = [v8 layer];
  id v10 = [v9 contents];

  v15.receiver = self;
  v15.super_class = (Class)UIActivityActionGroupCell;
  [(UIActivityActionCell *)&v15 setHighlighted:v3];
  v11 = [(UIActivityActionGroupCell *)self activitySlotView];
  v12 = [v11 layer];
  [v12 setContents:v7];

  uint64_t v13 = [(UIActivityActionGroupCell *)self titleSlotView];
  v14 = [v13 layer];
  [v14 setContents:v10];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(UIActivityActionGroupCell *)self activitySlotView];
  double v6 = [v5 layer];
  id v7 = [v6 contents];

  id v8 = [(UIActivityActionGroupCell *)self titleSlotView];
  id v9 = [v8 layer];
  id v10 = [v9 contents];

  v15.receiver = self;
  v15.super_class = (Class)UIActivityActionGroupCell;
  [(UIActivityActionGroupCell *)&v15 setSelected:v3];
  v11 = [(UIActivityActionGroupCell *)self activitySlotView];
  v12 = [v11 layer];
  [v12 setContents:v7];

  uint64_t v13 = [(UIActivityActionGroupCell *)self titleSlotView];
  v14 = [v13 layer];
  [v14 setContents:v10];
}

- (void)setDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIActivityActionGroupCell;
  -[UIActivityActionCell setDisabled:](&v10, sel_setDisabled_);
  if (v3) {
    double v5 = 0.4;
  }
  else {
    double v5 = 1.0;
  }
  double v6 = [(UIActivityActionGroupCell *)self titleStackView];
  [v6 setAlpha:v5];

  id v7 = [(UIActivityActionGroupCell *)self imageStackView];
  [v7 setAlpha:v5];

  id v8 = [(UIActivityActionGroupCell *)self activitySlotView];
  [v8 setAlpha:v5];

  id v9 = [(UIActivityActionGroupCell *)self titleSlotView];
  [v9 setAlpha:v5];
}

- (double)_legacyIconSizeForContentSizeCategory:(id)a3
{
  +[UIActivity imageWidthForContentSizeCategory:a3];
  return result;
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  title = self->_title;
  id v9 = (NSString *)v5;
  id v7 = title;
  if (v7 == v9)
  {

    goto LABEL_8;
  }
  if ((v9 == 0) == (v7 != 0))
  {

    goto LABEL_7;
  }
  char v8 = [(NSString *)v9 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_title, a3);
    [(UIActivityActionGroupCell *)self _updateTitleView];
  }
LABEL_8:
}

- (void)setSubtitle:(id)a3
{
  id v5 = a3;
  subtitle = self->_subtitle;
  id v9 = (NSString *)v5;
  id v7 = subtitle;
  if (v7 == v9)
  {

    goto LABEL_8;
  }
  if ((v9 == 0) == (v7 != 0))
  {

    goto LABEL_7;
  }
  char v8 = [(NSString *)v9 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_subtitle, a3);
    [(UIActivityActionGroupCell *)self _updateSubtitleLabel];
  }
LABEL_8:
}

- (void)setImage:(id)a3
{
  id v5 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_image, a3);
    p_image = (UIImage **)[(UIActivityActionGroupCell *)self _updateImageView];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](p_image, v5);
}

- (void)setStatusImage:(id)a3
{
  id v5 = (UIImage *)a3;
  p_statusImage = &self->_statusImage;
  if (self->_statusImage != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_statusImage, a3);
    p_statusImage = (UIImage **)[(UIActivityActionGroupCell *)self _updateStatusImageView];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](p_statusImage, v5);
}

- (void)setStatusImageTintColor:(id)a3
{
  id v5 = (UIColor *)a3;
  p_statusImageTintColor = &self->_statusImageTintColor;
  if (self->_statusImageTintColor != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_statusImageTintColor, a3);
    p_statusImageTintColor = (UIColor **)[(UIActivityActionGroupCell *)self _updateStatusImageView];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](p_statusImageTintColor, v5);
}

- (void)setImageSlotID:(unsigned int)a3
{
  if (self->_imageSlotID != a3)
  {
    self->_imageSlotID = a3;
    [(UIActivityActionGroupCell *)self _updateImageView];
  }
}

- (void)setTitleSlotID:(unsigned int)a3
{
  if (self->_titleSlotID != a3)
  {
    self->_titleSlotID = a3;
    [(UIActivityActionGroupCell *)self _updateTitleView];
  }
}

- (void)setPlatterTextHeight:(double)a3
{
  if (self->_platterTextHeight != a3)
  {
    self->_platterTextHeight = a3;
    [(UIActivityActionGroupCell *)self _updateTitleHeight];
  }
}

- (void)setContentTintColor:(id)a3
{
  id v5 = (UIColor *)a3;
  p_contentTintColor = &self->_contentTintColor;
  if (self->_contentTintColor != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_contentTintColor, a3);
    p_contentTintColor = (UIColor **)[(UIActivityActionGroupCell *)self _updateContentTintColor];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](p_contentTintColor, v5);
}

- (void)_updateContentTintColor
{
  BOOL v3 = [(UIActivityActionGroupCell *)self contentTintColor];
  objc_super v4 = [(UIActivityActionGroupCell *)self titleLabel];
  [v4 setTextColor:v3];

  id v5 = [(UIActivityActionGroupCell *)self contentTintColor];
  double v6 = [(UIActivityActionGroupCell *)self activityImageView];
  [v6 setTintColor:v5];

  id v10 = [(UIActivityActionGroupCell *)self contentTintColor];
  uint64_t v7 = [v10 CGColor];
  char v8 = [(UIActivityActionGroupCell *)self activitySlotView];
  id v9 = [v8 layer];
  [v9 setContentsMultiplyColor:v7];
}

- (void)_updateSubtitleLabel
{
  BOOL v3 = [(UIActivityActionGroupCell *)self subtitle];
  uint64_t v4 = [v3 length];

  id v5 = [(UIActivityActionGroupCell *)self subtitle];
  double v6 = [(UIActivityActionGroupCell *)self subtitleLabel];
  [v6 setText:v5];

  BOOL v7 = v4 == 0;
  if (v4) {
    double v8 = 1.0;
  }
  else {
    double v8 = 0.0;
  }
  id v9 = [(UIActivityActionGroupCell *)self subtitleLabel];
  [v9 setAlpha:v8];

  id v10 = [(UIActivityActionGroupCell *)self subtitleLabel];
  [v10 setHidden:v7];
}

- (void)_updateBadgeWithText:(id)a3 textColor:(id)a4 backgroundColor:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 length];
  v12 = [(UIActivityActionGroupCell *)self badgeView];
  uint64_t v13 = [v12 titleLabel];
  [v13 setText:v10];

  v14 = [(UIActivityActionGroupCell *)self badgeView];
  objc_super v15 = [v14 titleLabel];
  [v15 setTextColor:v9];

  v16 = [(UIActivityActionGroupCell *)self badgeView];
  [v16 setBackgroundColor:v8];

  BOOL v17 = v11 == 0;
  if (v11) {
    double v18 = 1.0;
  }
  else {
    double v18 = 0.0;
  }
  double v19 = [(UIActivityActionGroupCell *)self badgeView];
  [v19 setAlpha:v18];

  id v20 = [(UIActivityActionGroupCell *)self badgeView];
  [v20 setHidden:v17];
}

- (void)_updateImageView
{
  BOOL v3 = [(UIActivityActionGroupCell *)self image];

  uint64_t v4 = [(UIActivityActionGroupCell *)self image];
  id v5 = [(UIActivityActionGroupCell *)self activityImageView];
  [v5 setImage:v4];

  if (v3) {
    double v6 = 1.0;
  }
  else {
    double v6 = 0.0;
  }
  BOOL v7 = [(UIActivityActionGroupCell *)self activityImageView];
  [v7 setAlpha:v6];

  unsigned int v8 = [(UIActivityActionGroupCell *)self imageSlotID];
  if (v8)
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F39B58], "objectForSlot:", -[UIActivityActionGroupCell imageSlotID](self, "imageSlotID"));
    uint64_t v10 = *MEMORY[0x1E4F3A3D0];
    uint64_t v11 = [(UIActivityActionGroupCell *)self activitySlotView];
    v12 = [v11 layer];
    [v12 setContentsGravity:v10];

    uint64_t v13 = [(UIActivityActionGroupCell *)self activitySlotView];
    v14 = [v13 layer];
    [v14 setContents:v9];
  }
  else
  {
    id v9 = [(UIActivityActionGroupCell *)self activitySlotView];
    uint64_t v13 = [v9 layer];
    [v13 setContents:0];
  }

  if (v8) {
    double v15 = 1.0;
  }
  else {
    double v15 = 0.0;
  }
  id v16 = [(UIActivityActionGroupCell *)self activitySlotView];
  [v16 setAlpha:v15];
}

- (void)_updateStatusImageView
{
  BOOL v3 = [(UIActivityActionGroupCell *)self statusImage];

  uint64_t v4 = [(UIActivityActionGroupCell *)self statusImage];
  id v5 = [(UIActivityActionGroupCell *)self statusImageView];
  [v5 setImage:v4];

  BOOL v6 = v3 == 0;
  BOOL v7 = v3 == 0;
  if (v6) {
    double v8 = 0.0;
  }
  else {
    double v8 = 1.0;
  }
  id v9 = [(UIActivityActionGroupCell *)self statusImageView];
  [v9 setAlpha:v8];

  uint64_t v10 = [(UIActivityActionGroupCell *)self statusImageView];
  [v10 setHidden:v7];

  id v12 = [(UIActivityActionGroupCell *)self statusImageTintColor];
  uint64_t v11 = [(UIActivityActionGroupCell *)self statusImageView];
  [v11 setTintColor:v12];
}

- (void)_updateTitleView
{
  BOOL v3 = [(UIActivityActionGroupCell *)self title];
  uint64_t v4 = [v3 length];

  id v5 = [(UIActivityActionGroupCell *)self title];
  BOOL v6 = [(UIActivityActionGroupCell *)self titleLabel];
  [v6 setText:v5];

  if (v4) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  double v8 = [(UIActivityActionGroupCell *)self titleLabel];
  [v8 setAlpha:v7];

  unsigned int v9 = [(UIActivityActionGroupCell *)self titleSlotID];
  if (v9)
  {
    uint64_t v10 = [(UIActivityActionGroupCell *)self traitCollection];
    uint64_t v11 = [v10 layoutDirection];

    id v12 = (id *)MEMORY[0x1E4F3A3E8];
    if (v11 != 1) {
      id v12 = (id *)MEMORY[0x1E4F3A3C8];
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F39B58];
    id v14 = *v12;
    double v15 = objc_msgSend(v13, "objectForSlot:", -[UIActivityActionGroupCell titleSlotID](self, "titleSlotID"));
    double v16 = _ShareSheetDeviceScreenScale();
    BOOL v17 = [(UIActivityActionGroupCell *)self titleSlotView];
    double v18 = [v17 layer];
    [v18 setContentsScale:v16];

    double v19 = _ShareSheetDeviceScreenScale();
    id v20 = [(UIActivityActionGroupCell *)self titleSlotView];
    v21 = [v20 layer];
    [v21 setRasterizationScale:v19];

    v22 = [(UIActivityActionGroupCell *)self titleSlotView];
    v23 = [v22 layer];
    [v23 setContentsGravity:v14];

    v24 = [(UIActivityActionGroupCell *)self titleSlotView];
    v25 = [v24 layer];
    [v25 setContents:v15];
  }
  else
  {
    double v15 = [(UIActivityActionGroupCell *)self titleSlotView];
    v24 = [v15 layer];
    [v24 setContents:0];
  }

  if (v9) {
    double v26 = 1.0;
  }
  else {
    double v26 = 0.0;
  }
  id v27 = [(UIActivityActionGroupCell *)self titleSlotView];
  [v27 setAlpha:v26];
}

- (void)_updateTitleHeight
{
  [(NSLayoutConstraint *)self->_titleLabelHeightAnchor constant];
  double v4 = v3;
  [(UIActivityActionGroupCell *)self platterTextHeight];
  double v6 = v5 / _ShareSheetDeviceScreenScale();
  [(NSLayoutConstraint *)self->_titleLabelHeightAnchor setConstant:v6];
  [(NSLayoutConstraint *)self->_titleLabelHeightAnchor setActive:v6 > 0.0];
  if (vabdd_f64(v4, v6) >= 0.00000011920929)
  {
    [(UIActivityActionGroupCell *)self setNeedsLayout];
  }
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (_UIHostActivityProxy)activityProxy
{
  return self->_activityProxy;
}

- (void)setActivityProxy:(id)a3
{
}

- (unsigned)imageSlotID
{
  return self->_imageSlotID;
}

- (unsigned)titleSlotID
{
  return self->_titleSlotID;
}

- (double)platterTextHeight
{
  return self->_platterTextHeight;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImage)image
{
  return self->_image;
}

- (UIImage)statusImage
{
  return self->_statusImage;
}

- (UIColor)statusImageTintColor
{
  return self->_statusImageTintColor;
}

- (UIColor)contentTintColor
{
  return self->_contentTintColor;
}

- (_UIActivityActionCellTitleLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIImageView)activityImageView
{
  return self->_activityImageView;
}

- (void)setActivityImageView:(id)a3
{
}

- (UIView)activitySlotView
{
  return self->_activitySlotView;
}

- (void)setActivitySlotView:(id)a3
{
}

- (UIView)titleSlotView
{
  return self->_titleSlotView;
}

- (void)setTitleSlotView:(id)a3
{
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (UIStackView)titleStackView
{
  return self->_titleStackView;
}

- (void)setTitleStackView:(id)a3
{
}

- (UIStackView)imageStackView
{
  return self->_imageStackView;
}

- (void)setImageStackView:(id)a3
{
}

- (_UIActivityActionCellTitleLabel)subtitleLabelIfLoaded
{
  return self->_subtitleLabelIfLoaded;
}

- (void)setSubtitleLabelIfLoaded:(id)a3
{
}

- (_UIActivityActionCellBadgeView)badgeViewIfLoaded
{
  return self->_badgeViewIfLoaded;
}

- (void)setBadgeViewIfLoaded:(id)a3
{
}

- (UIImageView)statusImageViewIfLoaded
{
  return self->_statusImageViewIfLoaded;
}

- (void)setStatusImageViewIfLoaded:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusImageViewIfLoaded, 0);
  objc_storeStrong((id *)&self->_badgeViewIfLoaded, 0);
  objc_storeStrong((id *)&self->_subtitleLabelIfLoaded, 0);
  objc_storeStrong((id *)&self->_imageStackView, 0);
  objc_storeStrong((id *)&self->_titleStackView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_titleSlotView, 0);
  objc_storeStrong((id *)&self->_activitySlotView, 0);
  objc_storeStrong((id *)&self->_activityImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentTintColor, 0);
  objc_storeStrong((id *)&self->_statusImageTintColor, 0);
  objc_storeStrong((id *)&self->_statusImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_activityProxy, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_titleLabelHeightAnchor, 0);
}

@end