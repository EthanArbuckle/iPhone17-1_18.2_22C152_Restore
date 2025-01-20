@interface PUITrackerBarCell
- (NSArray)constraints;
- (PUITrackerBarCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIColor)barColor;
- (UIImageView)appAttributedBackgroundView;
- (UIImageView)appAttributedView;
- (UILabel)iconLabelView;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (UILabel)tertiaryLabel;
- (UILabel)valueLabel;
- (UIStackView)barStackView;
- (UIStackView)stackView;
- (UIView)barView;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setAppAttributedBackgroundView:(id)a3;
- (void)setAppAttributedView:(id)a3;
- (void)setBarColor:(id)a3;
- (void)setBarStackView:(id)a3;
- (void)setBarView:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setIconLabelView:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setStackView:(id)a3;
- (void)setTertiaryLabel:(id)a3;
- (void)setValueLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation PUITrackerBarCell

- (PUITrackerBarCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v95.receiver = self;
  v95.super_class = (Class)PUITrackerBarCell;
  v4 = [(PUITrackerBarCell *)&v95 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(PUITrackerBarCell *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    v7 = [v6 fontDescriptor];
    v8 = [v7 fontDescriptorWithSymbolicTraits:0x8000];

    v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    v10 = [v9 fontDescriptor];
    v11 = [v10 fontDescriptorWithSymbolicTraits:0x8000];

    v12 = [(PSTableCell *)v5 titleLabel];
    [v12 setHidden:1];

    v13 = [(PUITrackerBarCell *)v5 detailTextLabel];
    [v13 setHidden:1];

    v14 = PUIWebsiteIconView();
    [(PUITrackerBarCell *)v5 setIconLabelView:v14];

    v15 = [(PUITrackerBarCell *)v5 contentView];
    v16 = [(PUITrackerBarCell *)v5 iconLabelView];
    [v15 addSubview:v16];

    v17 = objc_opt_new();
    [(PUITrackerBarCell *)v5 setStackView:v17];

    v18 = [(PUITrackerBarCell *)v5 stackView];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

    v19 = [(PUITrackerBarCell *)v5 stackView];
    [v19 setAxis:1];

    v20 = [(PUITrackerBarCell *)v5 contentView];
    v21 = [(PUITrackerBarCell *)v5 stackView];
    [v20 addSubview:v21];

    v22 = objc_opt_new();
    [(PUITrackerBarCell *)v5 setPrimaryLabel:v22];

    v23 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v8 size:0.0];
    v24 = [(PUITrackerBarCell *)v5 primaryLabel];
    [v24 setFont:v23];

    v25 = [MEMORY[0x1E4FB1618] labelColor];
    v26 = [(PUITrackerBarCell *)v5 primaryLabel];
    [v26 setTextColor:v25];

    v27 = [(PUITrackerBarCell *)v5 primaryLabel];
    [v27 setTranslatesAutoresizingMaskIntoConstraints:0];

    v28 = [(PUITrackerBarCell *)v5 primaryLabel];
    [v28 setNumberOfLines:0];

    v29 = [(PUITrackerBarCell *)v5 stackView];
    v30 = [(PUITrackerBarCell *)v5 primaryLabel];
    [v29 addArrangedSubview:v30];

    v31 = objc_opt_new();
    [(PUITrackerBarCell *)v5 setBarStackView:v31];

    v32 = [(PUITrackerBarCell *)v5 barStackView];
    [v32 setTranslatesAutoresizingMaskIntoConstraints:0];

    v33 = [(PUITrackerBarCell *)v5 barStackView];
    [v33 setSpacing:8.0];

    v34 = [(PUITrackerBarCell *)v5 barStackView];
    [v34 setAlignment:3];

    v35 = [(PUITrackerBarCell *)v5 stackView];
    v36 = [(PUITrackerBarCell *)v5 barStackView];
    [v35 addArrangedSubview:v36];

    v37 = objc_opt_new();
    [(PUITrackerBarCell *)v5 setBarView:v37];

    v38 = [(PUITrackerBarCell *)v5 barView];
    [v38 setTranslatesAutoresizingMaskIntoConstraints:0];

    v39 = [(PUITrackerBarCell *)v5 barView];
    v40 = [v39 layer];
    [v40 setCornerRadius:2.5];

    v41 = [(PUITrackerBarCell *)v5 barView];
    v42 = [v41 heightAnchor];
    v43 = [v42 constraintEqualToConstant:5.0];
    [v43 setActive:1];

    v44 = [(PUITrackerBarCell *)v5 barStackView];
    v45 = [(PUITrackerBarCell *)v5 barView];
    [v44 addArrangedSubview:v45];

    v46 = objc_opt_new();
    [(PUITrackerBarCell *)v5 setValueLabel:v46];

    v47 = [(PUITrackerBarCell *)v5 valueLabel];
    [v47 setTranslatesAutoresizingMaskIntoConstraints:0];

    v48 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v11 size:0.0];
    v49 = [(PUITrackerBarCell *)v5 valueLabel];
    [v49 setFont:v48];

    v50 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v51 = [(PUITrackerBarCell *)v5 valueLabel];
    [v51 setTextColor:v50];

    v52 = [(PUITrackerBarCell *)v5 barStackView];
    v53 = [(PUITrackerBarCell *)v5 valueLabel];
    [v52 addArrangedSubview:v53];

    v54 = objc_opt_new();
    [(PUITrackerBarCell *)v5 setSecondaryLabel:v54];

    v55 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v11 size:0.0];
    v56 = [(PUITrackerBarCell *)v5 secondaryLabel];
    [v56 setFont:v55];

    v57 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v58 = [(PUITrackerBarCell *)v5 secondaryLabel];
    [v58 setTextColor:v57];

    v59 = [(PUITrackerBarCell *)v5 secondaryLabel];
    [v59 setTranslatesAutoresizingMaskIntoConstraints:0];

    v60 = [(PUITrackerBarCell *)v5 secondaryLabel];
    [v60 setNumberOfLines:0];

    v61 = [(PUITrackerBarCell *)v5 stackView];
    v62 = [(PUITrackerBarCell *)v5 secondaryLabel];
    [v61 addArrangedSubview:v62];

    v63 = objc_opt_new();
    [(PUITrackerBarCell *)v5 setTertiaryLabel:v63];

    v64 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v11 size:0.0];
    v65 = [(PUITrackerBarCell *)v5 tertiaryLabel];
    [v65 setFont:v64];

    v66 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v67 = [(PUITrackerBarCell *)v5 tertiaryLabel];
    [v67 setTextColor:v66];

    v68 = [(PUITrackerBarCell *)v5 tertiaryLabel];
    [v68 setTranslatesAutoresizingMaskIntoConstraints:0];

    v69 = [(PUITrackerBarCell *)v5 tertiaryLabel];
    [v69 setNumberOfLines:0];

    v70 = [(PUITrackerBarCell *)v5 stackView];
    v71 = [(PUITrackerBarCell *)v5 tertiaryLabel];
    [v70 addArrangedSubview:v71];

    v72 = objc_opt_new();
    [(PUITrackerBarCell *)v5 setAppAttributedBackgroundView:v72];

    v73 = [(PUITrackerBarCell *)v5 appAttributedBackgroundView];
    [v73 setContentMode:4];

    v74 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"appstore.circle.fill" withConfiguration:0];
    v75 = [v74 imageWithRenderingMode:2];
    v76 = [(PUITrackerBarCell *)v5 appAttributedBackgroundView];
    [v76 setImage:v75];

    v77 = [(PUITrackerBarCell *)v5 appAttributedBackgroundView];
    [v77 setTranslatesAutoresizingMaskIntoConstraints:0];

    v78 = [MEMORY[0x1E4FB1618] systemOrangeColor];
    v79 = [(PUITrackerBarCell *)v5 appAttributedBackgroundView];
    [v79 setTintColor:v78];

    v80 = [(PUITrackerBarCell *)v5 appAttributedBackgroundView];
    [v80 setHidden:1];

    v81 = [(PUITrackerBarCell *)v5 contentView];
    v82 = [(PUITrackerBarCell *)v5 appAttributedBackgroundView];
    [v81 addSubview:v82];

    v83 = objc_opt_new();
    [(PUITrackerBarCell *)v5 setAppAttributedView:v83];

    v84 = [(PUITrackerBarCell *)v5 appAttributedView];
    [v84 setContentMode:4];

    v85 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"appstore.circle" withConfiguration:0];
    v86 = [v85 imageWithRenderingMode:2];
    v87 = [(PUITrackerBarCell *)v5 appAttributedView];
    [v87 setImage:v86];

    v88 = [(PUITrackerBarCell *)v5 appAttributedView];
    [v88 setTranslatesAutoresizingMaskIntoConstraints:0];

    v89 = [MEMORY[0x1E4FB1618] whiteColor];
    v90 = [(PUITrackerBarCell *)v5 appAttributedView];
    [v90 setTintColor:v89];

    v91 = [(PUITrackerBarCell *)v5 appAttributedView];
    [v91 setHidden:1];

    v92 = [(PUITrackerBarCell *)v5 contentView];
    v93 = [(PUITrackerBarCell *)v5 appAttributedView];
    [v92 addSubview:v93];
  }
  return v5;
}

- (void)updateConstraints
{
  v3 = [(PUITrackerBarCell *)self contentView];
  v4 = [v3 layoutMarginsGuide];

  v5 = (void *)MEMORY[0x1E4F28DC8];
  v6 = [(PUITrackerBarCell *)self constraints];
  [v5 deactivateConstraints:v6];

  v7 = objc_opt_new();
  v8 = [(PUITrackerBarCell *)self imageView];
  v9 = [v8 image];

  if (v9)
  {
    v10 = [(PUITrackerBarCell *)self stackView];
    v11 = [v10 leadingAnchor];
    v12 = [v4 leadingAnchor];
    v13 = PSBlankIconImage();
    [v13 size];
    double v15 = v14 + 8.0;
    v16 = v11;
    v17 = v12;
  }
  else
  {
    v18 = [(PUITrackerBarCell *)self iconLabelView];
    uint64_t v19 = [v18 isHidden];

    if (v19)
    {
      v10 = [(PUITrackerBarCell *)self stackView];
      v11 = [v10 leadingAnchor];
      v12 = [v4 leadingAnchor];
      v13 = [v11 constraintEqualToAnchor:v12];
      [v7 addObject:v13];
      goto LABEL_7;
    }
    v20 = [(PUITrackerBarCell *)self iconLabelView];
    v21 = [v20 leadingAnchor];
    v22 = [v4 leadingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    [v7 addObject:v23];

    v24 = [(PUITrackerBarCell *)self iconLabelView];
    v25 = [v24 centerYAnchor];
    v26 = [(PUITrackerBarCell *)self contentView];
    v27 = [v26 centerYAnchor];
    v28 = [v25 constraintEqualToAnchor:v27];
    [v7 addObject:v28];

    v29 = [(PUITrackerBarCell *)self stackView];
    v30 = [v29 leadingAnchor];
    v31 = [(PUITrackerBarCell *)self iconLabelView];
    v32 = [v31 trailingAnchor];
    v33 = [v30 constraintEqualToSystemSpacingAfterAnchor:v32 multiplier:1.0];
    [v7 addObject:v33];

    v34 = [(PUITrackerBarCell *)self appAttributedView];
    v35 = [v34 centerXAnchor];
    v36 = [(PUITrackerBarCell *)self iconLabelView];
    v37 = [v36 centerXAnchor];
    v38 = [v35 constraintEqualToAnchor:v37 constant:10.0];
    [v7 addObject:v38];

    v39 = [(PUITrackerBarCell *)self appAttributedView];
    v40 = [v39 centerYAnchor];
    v41 = [(PUITrackerBarCell *)self iconLabelView];
    v42 = [v41 centerYAnchor];
    v43 = [v40 constraintEqualToAnchor:v42 constant:10.0];
    [v7 addObject:v43];

    v44 = [(PUITrackerBarCell *)self appAttributedBackgroundView];
    v45 = [v44 centerXAnchor];
    v46 = [(PUITrackerBarCell *)self appAttributedView];
    v47 = [v46 centerXAnchor];
    v48 = [v45 constraintEqualToAnchor:v47 constant:0.0];
    [v7 addObject:v48];

    v10 = [(PUITrackerBarCell *)self appAttributedBackgroundView];
    v11 = [v10 centerYAnchor];
    v12 = [(PUITrackerBarCell *)self appAttributedView];
    v13 = [v12 centerYAnchor];
    double v15 = 0.0;
    v16 = v11;
    v17 = v13;
  }
  v49 = [v16 constraintEqualToAnchor:v17 constant:v15];
  [v7 addObject:v49];

LABEL_7:
  v50 = [(PUITrackerBarCell *)self stackView];
  v51 = [v50 trailingAnchor];
  v52 = [v4 trailingAnchor];
  v53 = [v51 constraintEqualToAnchor:v52];
  [v7 addObject:v53];

  v54 = [(PUITrackerBarCell *)self stackView];
  v55 = [v54 topAnchor];
  v56 = [(PUITrackerBarCell *)self contentView];
  v57 = [v56 topAnchor];
  v58 = [v55 constraintEqualToSystemSpacingBelowAnchor:v57 multiplier:1.0];
  [v7 addObject:v58];

  v59 = [(PUITrackerBarCell *)self contentView];
  v60 = [v59 bottomAnchor];
  v61 = [(PUITrackerBarCell *)self stackView];
  v62 = [v61 bottomAnchor];
  v63 = [v60 constraintEqualToSystemSpacingBelowAnchor:v62 multiplier:1.0];
  [v7 addObject:v63];

  v64 = [(PSTableCell *)self specifier];
  v65 = [v64 objectForKeyedSubscript:@"PUITrackerBarValueKey"];
  LODWORD(v61) = [v65 intValue];

  if (v61)
  {
    v66 = [(PUITrackerBarCell *)self barColor];
    v67 = [(PUITrackerBarCell *)self barView];
    [v67 setBackgroundColor:v66];

    v68 = [(PSTableCell *)self specifier];
    v69 = [v68 objectForKeyedSubscript:@"PUITrackerBarValueKey"];
    [v69 floatValue];
    float v71 = v70;

    v72 = [(PSTableCell *)self specifier];
    v73 = [v72 objectForKeyedSubscript:@"PUITrackerBarCapacityKey"];
    [v73 floatValue];
    float v75 = v74;

    v76 = [(PUITrackerBarCell *)self barView];
    v77 = [v76 widthAnchor];
    v78 = [(PUITrackerBarCell *)self stackView];
    v79 = [v78 widthAnchor];
    double v80 = 0.0;
    if (v75 > 0.0) {
      double v80 = (float)(v71 / v75);
    }
    v81 = [v77 constraintLessThanOrEqualToAnchor:v79 multiplier:v80 constant:10.0];
    [v7 addObject:v81];
  }
  else
  {
    v82 = [MEMORY[0x1E4FB1618] systemGray3Color];
    v83 = [(PUITrackerBarCell *)self barView];
    [v83 setBackgroundColor:v82];

    v76 = [(PUITrackerBarCell *)self barView];
    v77 = [v76 widthAnchor];
    v78 = [v77 constraintEqualToConstant:5.0];
    [v7 addObject:v78];
  }

  v84 = (void *)[v7 copy];
  [(PUITrackerBarCell *)self setConstraints:v84];

  v85 = (void *)MEMORY[0x1E4F28DC8];
  v86 = [(PUITrackerBarCell *)self constraints];
  [v85 activateConstraints:v86];

  v87.receiver = self;
  v87.super_class = (Class)PUITrackerBarCell;
  [(PUITrackerBarCell *)&v87 updateConstraints];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PUITrackerBarCell;
  [(PSTableCell *)&v34 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 objectForKeyedSubscript:@"PUITrackerBarShowAppAttributedBadgeKey"];
  int v6 = [v5 BOOLValue];

  v7 = [v4 objectForKeyedSubscript:@"PUITrackerBarIconLabelKey"];
  uint64_t v8 = [v7 length];

  v9 = [(PUITrackerBarCell *)self iconLabelView];
  v10 = v9;
  if (v8)
  {
    [v9 setHidden:0];

    v11 = [v4 objectForKeyedSubscript:@"PUITrackerBarIconLabelKey"];
    v12 = objc_msgSend(v11, "substringWithRange:", 0, 1);
    v13 = [v12 localizedUppercaseString];
    double v14 = [(PUITrackerBarCell *)self iconLabelView];
    [v14 setText:v13];

    uint64_t v15 = v6 ^ 1u;
    v16 = [(PUITrackerBarCell *)self appAttributedView];
    [v16 setHidden:v15];

    v9 = [(PUITrackerBarCell *)self appAttributedBackgroundView];
    v10 = v9;
    uint64_t v17 = v15;
  }
  else
  {
    uint64_t v17 = 1;
  }
  [v9 setHidden:v17];

  v18 = [(PSTableCell *)self titleLabel];
  uint64_t v19 = [v18 text];
  v20 = [(PUITrackerBarCell *)self primaryLabel];
  [v20 setText:v19];

  v21 = [(PSTableCell *)self specifier];
  v22 = [v21 objectForKeyedSubscript:@"PUITrackerBarDomainOwnerKey"];
  v23 = [(PUITrackerBarCell *)self secondaryLabel];
  [v23 setText:v22];

  v24 = objc_opt_new();
  v25 = [(PSTableCell *)self specifier];
  v26 = [v25 objectForKeyedSubscript:@"PUITrackerBarValueKey"];
  v27 = [v24 stringFromNumber:v26];
  v28 = [(PUITrackerBarCell *)self valueLabel];
  [v28 setText:v27];

  v29 = [(PSTableCell *)self specifier];
  uint64_t v30 = [v29 objectForKeyedSubscript:@"PUITrackerBarTertiaryLabelKey"];
  v31 = [(PUITrackerBarCell *)self tertiaryLabel];
  [v31 setText:v30];

  v32 = [v4 objectForKeyedSubscript:@"PUITrackerBarColorKey"];
  objc_opt_class();
  LOBYTE(v30) = objc_opt_isKindOfClass();

  if (v30) {
    [v4 objectForKeyedSubscript:@"PUITrackerBarColorKey"];
  }
  else {
  v33 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  }
  [(PUITrackerBarCell *)self setBarColor:v33];

  [(PUITrackerBarCell *)self setNeedsUpdateConstraints];
  [(PUITrackerBarCell *)self setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUITrackerBarCell;
  [(PUITrackerBarCell *)&v4 traitCollectionDidChange:a3];
  [(PUITrackerBarCell *)self setNeedsUpdateConstraints];
  [(PUITrackerBarCell *)self setNeedsLayout];
}

- (UILabel)iconLabelView
{
  return self->_iconLabelView;
}

- (void)setIconLabelView:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (UILabel)tertiaryLabel
{
  return self->_tertiaryLabel;
}

- (void)setTertiaryLabel:(id)a3
{
}

- (UIImageView)appAttributedView
{
  return self->_appAttributedView;
}

- (void)setAppAttributedView:(id)a3
{
}

- (UIImageView)appAttributedBackgroundView
{
  return self->_appAttributedBackgroundView;
}

- (void)setAppAttributedBackgroundView:(id)a3
{
}

- (UIStackView)barStackView
{
  return self->_barStackView;
}

- (void)setBarStackView:(id)a3
{
}

- (UIView)barView
{
  return self->_barView;
}

- (void)setBarView:(id)a3
{
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
}

- (UIColor)barColor
{
  return self->_barColor;
}

- (void)setBarColor:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_barColor, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_barView, 0);
  objc_storeStrong((id *)&self->_barStackView, 0);
  objc_storeStrong((id *)&self->_appAttributedBackgroundView, 0);
  objc_storeStrong((id *)&self->_appAttributedView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_iconLabelView, 0);
}

@end