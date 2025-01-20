@interface PRXFeatureTableViewCell
- (BOOL)isHidingSeparator;
- (NSLayoutConstraint)imageViewLeadingAnchor;
- (NSLayoutConstraint)imageViewVerticalAnchor;
- (NSLayoutConstraint)layoutGuideHeightConstraint;
- (NSLayoutConstraint)titleLabelLeadingAnchor;
- (NSLayoutConstraint)titleLabelTrailingAnchor;
- (NSString)subtitle;
- (NSString)title;
- (PRXFeatureTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UISwitch)switchControl;
- (UIView)featureImageView;
- (double)featureImageSize;
- (void)_updateImageViewAnchors;
- (void)_updateLabelHyphenationFactor;
- (void)_updateTitleIndent;
- (void)_updateTitleLeadingAnchor;
- (void)layoutMarginsDidChange;
- (void)setFeatureImageSize:(double)a3;
- (void)setFeatureImageView:(id)a3;
- (void)setHidingSeparator:(BOOL)a3;
- (void)setImageViewLeadingAnchor:(id)a3;
- (void)setImageViewVerticalAnchor:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSwitchControl:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabelLeadingAnchor:(id)a3;
- (void)setTitleLabelTrailingAnchor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PRXFeatureTableViewCell

- (PRXFeatureTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v74[11] = *MEMORY[0x263EF8340];
  v73.receiver = self;
  v73.super_class = (Class)PRXFeatureTableViewCell;
  v4 = [(PRXFeatureTableViewCell *)&v73 initWithStyle:0 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2C0]];
    v72 = objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v5, "symbolicTraits") | 0x8000);

    v6 = (void *)MEMORY[0x263F1C658];
    [v72 pointSize];
    v70 = objc_msgSend(v6, "fontWithDescriptor:size:", v72);
    v7 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D270]];
    v71 = objc_msgSend(v7, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v7, "symbolicTraits") | 0x8000);

    v8 = (void *)MEMORY[0x263F1C658];
    [v71 pointSize];
    v69 = objc_msgSend(v8, "fontWithDescriptor:size:", v71);
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v9;

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_titleLabel setFont:v70];
    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(UILabel *)v4->_titleLabel setLineBreakMode:0];
    [(UILabel *)v4->_titleLabel setAdjustsFontForContentSizeCategory:1];
    LODWORD(v11) = 1148846080;
    [(UILabel *)v4->_titleLabel setContentCompressionResistancePriority:1 forAxis:v11];
    v12 = [(PRXFeatureTableViewCell *)v4 contentView];
    [v12 addSubview:v4->_titleLabel];

    v13 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v13;

    [(UILabel *)v4->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_subtitleLabel setFont:v69];
    [(UILabel *)v4->_subtitleLabel setNumberOfLines:0];
    v15 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [(UILabel *)v4->_subtitleLabel setTextColor:v15];

    [(UILabel *)v4->_subtitleLabel setLineBreakMode:0];
    [(UILabel *)v4->_subtitleLabel setAdjustsFontForContentSizeCategory:1];
    LODWORD(v16) = 1148846080;
    [(UILabel *)v4->_subtitleLabel setContentCompressionResistancePriority:1 forAxis:v16];
    v17 = [(PRXFeatureTableViewCell *)v4 contentView];
    [v17 addSubview:v4->_subtitleLabel];

    v18 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v19 = [(PRXFeatureTableViewCell *)v4 contentView];
    v20 = [v19 layoutMarginsGuide];
    v21 = [v20 leadingAnchor];
    uint64_t v22 = [v18 constraintEqualToAnchor:v21];
    titleLabelLeadingAnchor = v4->_titleLabelLeadingAnchor;
    v4->_titleLabelLeadingAnchor = (NSLayoutConstraint *)v22;

    v24 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v25 = [(PRXFeatureTableViewCell *)v4 contentView];
    v26 = [v25 layoutMarginsGuide];
    v27 = [v26 trailingAnchor];
    uint64_t v28 = [v24 constraintEqualToAnchor:v27];
    titleLabelTrailingAnchor = v4->_titleLabelTrailingAnchor;
    v4->_titleLabelTrailingAnchor = (NSLayoutConstraint *)v28;

    id v30 = objc_alloc_init(MEMORY[0x263F1C778]);
    id v31 = objc_alloc_init(MEMORY[0x263F1C778]);
    v32 = [(PRXFeatureTableViewCell *)v4 contentView];
    [v32 addLayoutGuide:v30];

    v33 = [(PRXFeatureTableViewCell *)v4 contentView];
    [v33 addLayoutGuide:v31];

    v34 = [v30 heightAnchor];
    uint64_t v35 = [v34 constraintGreaterThanOrEqualToConstant:15.0];
    layoutGuideHeightConstraint = v4->_layoutGuideHeightConstraint;
    v4->_layoutGuideHeightConstraint = (NSLayoutConstraint *)v35;

    v55 = (void *)MEMORY[0x263F08938];
    v68 = [v30 heightAnchor];
    v67 = [v31 heightAnchor];
    v66 = [v68 constraintEqualToAnchor:v67];
    v74[0] = v66;
    v74[1] = v4->_layoutGuideHeightConstraint;
    v63 = v30;
    v64 = [v30 topAnchor];
    v65 = [(PRXFeatureTableViewCell *)v4 contentView];
    v62 = [v65 topAnchor];
    [v64 constraintEqualToAnchor:v62];
    v61 = v60 = v31;
    v74[2] = v61;
    v58 = [v31 bottomAnchor];
    v59 = [(PRXFeatureTableViewCell *)v4 contentView];
    v57 = [v59 bottomAnchor];
    v56 = [v58 constraintEqualToAnchor:v57];
    v74[3] = v56;
    v54 = [(UILabel *)v4->_titleLabel topAnchor];
    v53 = [v30 bottomAnchor];
    v52 = [v54 constraintEqualToAnchor:v53];
    v74[4] = v52;
    v51 = [(UILabel *)v4->_subtitleLabel bottomAnchor];
    v50 = [v31 topAnchor];
    v49 = [v51 constraintEqualToAnchor:v50];
    v74[5] = v49;
    v74[6] = v4->_titleLabelLeadingAnchor;
    v74[7] = v4->_titleLabelTrailingAnchor;
    v48 = [(UILabel *)v4->_subtitleLabel topAnchor];
    v37 = [(UILabel *)v4->_titleLabel bottomAnchor];
    v38 = [v48 constraintEqualToAnchor:v37 constant:2.0];
    v74[8] = v38;
    v39 = [(UILabel *)v4->_subtitleLabel leadingAnchor];
    v40 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    v74[9] = v41;
    v42 = [(UILabel *)v4->_subtitleLabel trailingAnchor];
    v43 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v44 = [v42 constraintEqualToAnchor:v43];
    v74[10] = v44;
    v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:11];
    [v55 activateConstraints:v45];

    [(PRXFeatureTableViewCell *)v4 _updateLabelHyphenationFactor];
    v46 = v4;
  }
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRXFeatureTableViewCell;
  [(PRXFeatureTableViewCell *)&v4 traitCollectionDidChange:a3];
  [(PRXFeatureTableViewCell *)self _updateLabelHyphenationFactor];
  [(PRXFeatureTableViewCell *)self _updateImageViewAnchors];
  [(PRXFeatureTableViewCell *)self _updateTitleIndent];
}

- (void)layoutMarginsDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)PRXFeatureTableViewCell;
  [(PRXFeatureTableViewCell *)&v7 layoutMarginsDidChange];
  [(PRXFeatureTableViewCell *)self directionalLayoutMargins];
  double v4 = v3;
  v5 = [(PRXFeatureTableViewCell *)self featureImageView];

  if (v5)
  {
    [(PRXFeatureTableViewCell *)self featureImageSize];
    double v4 = v4 + v6 + 16.0;
  }
  [(PRXFeatureTableViewCell *)self directionalLayoutMargins];
  -[PRXFeatureTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v4, 0.0);
}

- (void)setFeatureImageView:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  v5 = (UIView *)a3;
  p_featureImageView = &self->_featureImageView;
  if (self->_featureImageView != v5)
  {
    objc_storeStrong((id *)&self->_featureImageView, a3);
    [(UIView *)*p_featureImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_super v7 = [(PRXFeatureTableViewCell *)self contentView];
    [v7 addSubview:*p_featureImageView];

    v8 = [(UIView *)*p_featureImageView leadingAnchor];
    v9 = [(PRXFeatureTableViewCell *)self contentView];
    v10 = [v9 layoutMarginsGuide];
    double v11 = [v10 leadingAnchor];
    v12 = [v8 constraintEqualToAnchor:v11];
    [(PRXFeatureTableViewCell *)self setImageViewLeadingAnchor:v12];

    [(PRXFeatureTableViewCell *)self _updateImageViewAnchors];
    [(PRXFeatureTableViewCell *)self _updateTitleLeadingAnchor];
    [(PRXFeatureTableViewCell *)self _updateTitleIndent];
    v13 = (void *)MEMORY[0x263F08938];
    v14 = [(PRXFeatureTableViewCell *)self imageViewLeadingAnchor];
    v16[0] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    [v13 activateConstraints:v15];
  }
}

- (void)setSwitchControl:(id)a3
{
  v30[1] = *MEMORY[0x263EF8340];
  v5 = (UISwitch *)a3;
  p_switchControl = &self->_switchControl;
  switchControl = self->_switchControl;
  if (switchControl != v5)
  {
    uint64_t v28 = v5;
    [(UISwitch *)switchControl removeFromSuperview];
    objc_storeStrong((id *)&self->_switchControl, a3);
    [(UISwitch *)*p_switchControl setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v8) = 1148846080;
    [(UISwitch *)*p_switchControl setContentCompressionResistancePriority:0 forAxis:v8];
    v9 = [(PRXFeatureTableViewCell *)self contentView];
    [v9 addSubview:*p_switchControl];

    v10 = (void *)MEMORY[0x263F08938];
    double v11 = [(PRXFeatureTableViewCell *)self titleLabelTrailingAnchor];
    v30[0] = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
    [v10 deactivateConstraints:v12];

    v23 = (void *)MEMORY[0x263F08938];
    v26 = [(UISwitch *)*p_switchControl leadingAnchor];
    v27 = [(PRXFeatureTableViewCell *)self titleLabel];
    v25 = [v27 trailingAnchor];
    v24 = [v26 constraintGreaterThanOrEqualToAnchor:v25 constant:12.0];
    v29[0] = v24;
    v13 = [(UISwitch *)*p_switchControl centerYAnchor];
    v14 = [(PRXFeatureTableViewCell *)self contentView];
    v15 = [v14 centerYAnchor];
    double v16 = [v13 constraintEqualToAnchor:v15];
    v29[1] = v16;
    v17 = [(UISwitch *)*p_switchControl trailingAnchor];
    v18 = [(PRXFeatureTableViewCell *)self contentView];
    v19 = [v18 layoutMarginsGuide];
    v20 = [v19 trailingAnchor];
    v21 = [v17 constraintEqualToAnchor:v20 constant:-2.0];
    v29[2] = v21;
    uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
    [v23 activateConstraints:v22];

    v5 = v28;
  }
}

- (void)setTitle:(id)a3
{
  double v4 = (objc_class *)MEMORY[0x263F086A0];
  id v5 = a3;
  double v6 = (void *)[[v4 alloc] initWithString:v5];

  objc_super v7 = [(PRXFeatureTableViewCell *)self titleLabel];
  [v7 setAttributedText:v6];

  [(PRXFeatureTableViewCell *)self _updateTitleIndent];
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = [(PRXFeatureTableViewCell *)self subtitleLabel];
  [v5 setText:v4];
}

- (void)setFeatureImageSize:(double)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  self->_featureImageSize = a3;
  id v5 = (void *)MEMORY[0x263F08938];
  double v6 = [(UIView *)self->_featureImageView widthAnchor];
  objc_super v7 = [v6 constraintEqualToConstant:a3];
  v11[0] = v7;
  double v8 = [(UIView *)self->_featureImageView heightAnchor];
  v9 = [v8 constraintEqualToConstant:a3];
  v11[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  [v5 activateConstraints:v10];

  [(PRXFeatureTableViewCell *)self _updateTitleIndent];
}

- (void)setHidingSeparator:(BOOL)a3
{
  self->_hidingSeparator = a3;
  id v3 = [(PRXFeatureTableViewCell *)self layoutGuideHeightConstraint];
  [v3 setConstant:15.0];
}

- (void)_updateLabelHyphenationFactor
{
  id v3 = [(PRXFeatureTableViewCell *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
  {
    double v6 = [(PRXFeatureTableViewCell *)self titleLabel];
    LODWORD(v7) = 1045220557;
    [v6 _setHyphenationFactor:v7];

    id v9 = [(PRXFeatureTableViewCell *)self subtitleLabel];
    LODWORD(v8) = 1055286886;
    [v9 _setHyphenationFactor:v8];
  }
}

- (void)_updateImageViewAnchors
{
  id v3 = [(PRXFeatureTableViewCell *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (self->_featureImageView)
  {
    double v6 = [(PRXFeatureTableViewCell *)self imageViewVerticalAnchor];
    [v6 setActive:0];

    if (IsAccessibilityCategory)
    {
      double v7 = [(PRXFeatureTableViewCell *)self titleLabel];
      double v8 = [v7 font];
      [v8 lineHeight];
      double v10 = v9 * 0.5;

      double v11 = [(UIView *)self->_featureImageView centerYAnchor];
      v12 = [(PRXFeatureTableViewCell *)self titleLabel];
      v13 = [v12 topAnchor];
      [v11 constraintEqualToAnchor:v13 constant:v10];
    }
    else
    {
      double v11 = [(UIView *)self->_featureImageView centerYAnchor];
      v12 = [(PRXFeatureTableViewCell *)self contentView];
      v13 = [v12 centerYAnchor];
      [v11 constraintEqualToAnchor:v13];
    v14 = };
    [(PRXFeatureTableViewCell *)self setImageViewVerticalAnchor:v14];

    id v15 = [(PRXFeatureTableViewCell *)self imageViewVerticalAnchor];
    [v15 setActive:1];
  }
}

- (void)_updateTitleLeadingAnchor
{
  if (self->_featureImageView)
  {
    id v3 = [(PRXFeatureTableViewCell *)self titleLabelLeadingAnchor];
    [v3 setActive:0];

    id v4 = [(PRXFeatureTableViewCell *)self traitCollection];
    id v5 = [v4 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

    double v7 = [(PRXFeatureTableViewCell *)self titleLabel];
    double v8 = [v7 leadingAnchor];
    if (IsAccessibilityCategory)
    {
      double v9 = [(PRXFeatureTableViewCell *)self contentView];
      double v10 = [v9 layoutMarginsGuide];
      double v11 = [v10 leadingAnchor];
      v12 = [v8 constraintEqualToAnchor:v11];
      [(PRXFeatureTableViewCell *)self setTitleLabelLeadingAnchor:v12];
    }
    else
    {
      double v9 = [(PRXFeatureTableViewCell *)self featureImageView];
      double v10 = [v9 trailingAnchor];
      double v11 = [v8 constraintEqualToAnchor:v10 constant:16.0];
      [(PRXFeatureTableViewCell *)self setTitleLabelLeadingAnchor:v11];
    }

    id v13 = [(PRXFeatureTableViewCell *)self titleLabelLeadingAnchor];
    [v13 setActive:1];
  }
}

- (void)_updateTitleIndent
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = [(PRXFeatureTableViewCell *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  if (!UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v4))
  {

    goto LABEL_5;
  }
  featureImageView = self->_featureImageView;

  if (!featureImageView)
  {
LABEL_5:
    double v8 = (void *)MEMORY[0x263EFFA78];
    goto LABEL_6;
  }
  id v6 = objc_alloc_init(MEMORY[0x263F1C350]);
  [(PRXFeatureTableViewCell *)self featureImageSize];
  [v6 setFirstLineHeadIndent:v7 + 16.0];
  [v6 setLineBreakStrategy:0xFFFFLL];
  uint64_t v13 = *MEMORY[0x263F1C268];
  v14[0] = v6;
  double v8 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];

LABEL_6:
  double v9 = [(PRXFeatureTableViewCell *)self titleLabel];
  double v10 = [v9 attributedText];
  double v11 = (void *)[v10 mutableCopy];

  objc_msgSend(v11, "setAttributes:range:", v8, 0, objc_msgSend(v11, "length"));
  v12 = [(PRXFeatureTableViewCell *)self titleLabel];
  [v12 setAttributedText:v11];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIView)featureImageView
{
  return self->_featureImageView;
}

- (UISwitch)switchControl
{
  return self->_switchControl;
}

- (BOOL)isHidingSeparator
{
  return self->_hidingSeparator;
}

- (double)featureImageSize
{
  return self->_featureImageSize;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (NSLayoutConstraint)layoutGuideHeightConstraint
{
  return self->_layoutGuideHeightConstraint;
}

- (NSLayoutConstraint)titleLabelLeadingAnchor
{
  return self->_titleLabelLeadingAnchor;
}

- (void)setTitleLabelLeadingAnchor:(id)a3
{
}

- (NSLayoutConstraint)titleLabelTrailingAnchor
{
  return self->_titleLabelTrailingAnchor;
}

- (void)setTitleLabelTrailingAnchor:(id)a3
{
}

- (NSLayoutConstraint)imageViewLeadingAnchor
{
  return self->_imageViewLeadingAnchor;
}

- (void)setImageViewLeadingAnchor:(id)a3
{
}

- (NSLayoutConstraint)imageViewVerticalAnchor
{
  return self->_imageViewVerticalAnchor;
}

- (void)setImageViewVerticalAnchor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewVerticalAnchor, 0);
  objc_storeStrong((id *)&self->_imageViewLeadingAnchor, 0);
  objc_storeStrong((id *)&self->_titleLabelTrailingAnchor, 0);
  objc_storeStrong((id *)&self->_titleLabelLeadingAnchor, 0);
  objc_storeStrong((id *)&self->_layoutGuideHeightConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_switchControl, 0);
  objc_storeStrong((id *)&self->_featureImageView, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end