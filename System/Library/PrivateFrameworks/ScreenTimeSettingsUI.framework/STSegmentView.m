@interface STSegmentView
- (BOOL)useVibrancy;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSLayoutConstraint)detailImageHeightConstraint;
- (NSLayoutConstraint)detailImageWidthConstraint;
- (NSLayoutConstraint)detailLabelLeadingConstraint;
- (STSegmentItem)item;
- (STSegmentView)initWithItem:(id)a3 useVibrancy:(BOOL)a4 truncateLabels:(BOOL)a5;
- (UIImageView)detailImageView;
- (UILabel)detailLabel;
- (UILabel)titleLabel;
- (void)setItem:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation STSegmentView

- (STSegmentView)initWithItem:(id)a3 useVibrancy:(BOOL)a4 truncateLabels:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  v82.receiver = self;
  v82.super_class = (Class)STSegmentView;
  v10 = -[STSegmentView initWithFrame:](&v82, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_item, a3);
    v11->_useVibrancy = v6;
    uint64_t v12 = objc_opt_new();
    titleLabel = v11->_titleLabel;
    v11->_titleLabel = (UILabel *)v12;

    uint64_t v14 = *MEMORY[0x263F835F0];
    v15 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
    [(UILabel *)v11->_titleLabel setFont:v15];

    v16 = [v9 titleText];
    [(UILabel *)v11->_titleLabel setText:v16];

    v17 = [v9 titleColor];
    [(UILabel *)v11->_titleLabel setTextColor:v17];
    BOOL v18 = v5;
    [(UILabel *)v11->_titleLabel setNumberOfLines:v5];
    if (v5) {
      uint64_t v19 = 4;
    }
    else {
      uint64_t v19 = 0;
    }
    [(UILabel *)v11->_titleLabel setLineBreakMode:v19];
    [(UILabel *)v11->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v20) = 1144750080;
    [(UILabel *)v11->_titleLabel setContentHuggingPriority:1 forAxis:v20];
    [(STSegmentView *)v11 addSubview:v11->_titleLabel];
    uint64_t v21 = objc_opt_new();
    detailLabel = v11->_detailLabel;
    v11->_detailLabel = (UILabel *)v21;

    v23 = [MEMORY[0x263F81708] preferredFontForTextStyle:v14];
    [(UILabel *)v11->_detailLabel setFont:v23];

    v24 = [v9 detailText];
    [(UILabel *)v11->_detailLabel setText:v24];

    v25 = [v9 accessibilityText];
    [(UILabel *)v11->_detailLabel setAccessibilityLabel:v25];

    [(UILabel *)v11->_detailLabel setNumberOfLines:v18];
    [(UILabel *)v11->_detailLabel setLineBreakMode:v19];
    [(UILabel *)v11->_detailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v26) = 1144750080;
    [(UILabel *)v11->_detailLabel setContentHuggingPriority:1 forAxis:v26];
    v27 = objc_opt_new();
    if (v6)
    {
      +[STUsageColors updateVibrancyStylingForView:v11->_titleLabel withUsageColor:v17];
      v28 = [MEMORY[0x263F82DF0] widgetEffectForVibrancyStyle:101];
      v29 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v28];
      [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(STSegmentView *)v11 addSubview:v29];
      v30 = [v29 contentView];
      [v30 addSubview:v11->_detailLabel];
      v31 = objc_msgSend(MEMORY[0x263F08938], "st_constraintsForView:equalToView:", v30, v11->_detailLabel);
      [v27 addObjectsFromArray:v31];

      double v32 = 0.0;
    }
    else
    {
      [(STSegmentView *)v11 addSubview:v11->_detailLabel];
      double v32 = 2.0;
    }
    v33 = [(UILabel *)v11->_titleLabel topAnchor];
    v34 = [(STSegmentView *)v11 topAnchor];
    v35 = [v33 constraintEqualToAnchor:v34];
    [v27 addObject:v35];

    v36 = [(UILabel *)v11->_titleLabel leadingAnchor];
    v37 = [(STSegmentView *)v11 leadingAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    [v27 addObject:v38];

    v39 = [(UILabel *)v11->_titleLabel trailingAnchor];
    v40 = [(STSegmentView *)v11 trailingAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    [v27 addObject:v41];

    v42 = [(UILabel *)v11->_titleLabel heightAnchor];
    v43 = [(UILabel *)v11->_detailLabel heightAnchor];
    v44 = [v42 constraintEqualToAnchor:v43];
    [v27 addObject:v44];

    id v45 = objc_alloc(MEMORY[0x263F82828]);
    v46 = [v9 detailImage];
    uint64_t v47 = [v45 initWithImage:v46];
    detailImageView = v11->_detailImageView;
    v11->_detailImageView = (UIImageView *)v47;

    [(UIImageView *)v11->_detailImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
    v49 = [v9 detailImageTintColor];
    [(UIImageView *)v11->_detailImageView setTintColor:v49];

    [(UIImageView *)v11->_detailImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(STSegmentView *)v11 addSubview:v11->_detailImageView];
    v50 = [(UIImageView *)v11->_detailImageView leadingAnchor];
    v51 = [(STSegmentView *)v11 leadingAnchor];
    v52 = [v50 constraintEqualToAnchor:v51];
    [v27 addObject:v52];

    v53 = [(UIImageView *)v11->_detailImageView bottomAnchor];
    v54 = [(UILabel *)v11->_detailLabel lastBaselineAnchor];
    v55 = [v53 constraintEqualToAnchor:v54];
    [v27 addObject:v55];

    -[UIImageView sizeThatFits:](v11->_detailImageView, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    double v57 = v56;
    double v59 = v58;
    v60 = [(UILabel *)v11->_detailLabel leadingAnchor];
    v61 = [(UIImageView *)v11->_detailImageView trailingAnchor];
    BOOL v62 = v59 == *(double *)(MEMORY[0x263F001B0] + 8) && v57 == *MEMORY[0x263F001B0];
    double v63 = 2.0;
    if (v62) {
      double v63 = 0.0;
    }
    uint64_t v64 = [v60 constraintEqualToAnchor:v61 constant:v63];
    detailLabelLeadingConstraint = v11->_detailLabelLeadingConstraint;
    v11->_detailLabelLeadingConstraint = (NSLayoutConstraint *)v64;

    [v27 addObject:v11->_detailLabelLeadingConstraint];
    v66 = [(UIImageView *)v11->_detailImageView widthAnchor];
    uint64_t v67 = [v66 constraintEqualToConstant:v57];
    detailImageWidthConstraint = v11->_detailImageWidthConstraint;
    v11->_detailImageWidthConstraint = (NSLayoutConstraint *)v67;

    [v27 addObject:v11->_detailImageWidthConstraint];
    v69 = [(UIImageView *)v11->_detailImageView heightAnchor];
    uint64_t v70 = [v69 constraintEqualToConstant:v59];
    detailImageHeightConstraint = v11->_detailImageHeightConstraint;
    v11->_detailImageHeightConstraint = (NSLayoutConstraint *)v70;

    [v27 addObject:v11->_detailImageHeightConstraint];
    v72 = [(UILabel *)v11->_detailLabel topAnchor];
    v73 = [(UILabel *)v11->_titleLabel bottomAnchor];
    v74 = [v72 constraintEqualToAnchor:v73 constant:v32];
    [v27 addObject:v74];

    v75 = [(UILabel *)v11->_detailLabel bottomAnchor];
    v76 = [(STSegmentView *)v11 bottomAnchor];
    v77 = [v75 constraintEqualToAnchor:v76];
    [v27 addObject:v77];

    v78 = [(UILabel *)v11->_detailLabel trailingAnchor];
    v79 = [(STSegmentView *)v11 trailingAnchor];
    v80 = [v78 constraintEqualToAnchor:v79];
    [v27 addObject:v80];

    [MEMORY[0x263F08938] activateConstraints:v27];
  }

  return v11;
}

- (void)setItem:(id)a3
{
  BOOL v5 = (STSegmentItem *)a3;
  BOOL v6 = v5;
  if (self->_item != v5)
  {
    v24 = v5;
    BOOL v5 = (STSegmentItem *)-[STSegmentItem isEqual:](v5, "isEqual:");
    BOOL v6 = v24;
    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_item, a3);
      v7 = [(STSegmentItem *)v24 detailText];
      v8 = [(STSegmentView *)self detailLabel];
      [v8 setText:v7];

      id v9 = [(STSegmentView *)self titleLabel];
      v10 = [(STSegmentItem *)v24 titleText];
      [v9 setText:v10];

      v11 = [(STSegmentItem *)v24 titleColor];
      [v9 setTextColor:v11];

      uint64_t v12 = [(STSegmentView *)self detailImageView];
      v13 = [(STSegmentItem *)v24 detailImage];
      [v12 setImage:v13];

      uint64_t v14 = [(STSegmentItem *)v24 detailImageTintColor];
      [v12 setTintColor:v14];

      objc_msgSend(v12, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      double v16 = v15;
      double v18 = v17;
      if (v17 == *(double *)(MEMORY[0x263F001B0] + 8) && v15 == *MEMORY[0x263F001B0]) {
        double v20 = 0.0;
      }
      else {
        double v20 = 2.0;
      }
      uint64_t v21 = [(STSegmentView *)self detailLabelLeadingConstraint];
      [v21 setConstant:v20];

      v22 = [(STSegmentView *)self detailImageWidthConstraint];
      [v22 setConstant:v16];

      v23 = [(STSegmentView *)self detailImageHeightConstraint];
      [v23 setConstant:v18];

      BOOL v6 = v24;
    }
  }

  MEMORY[0x270F9A758](v5, v6);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = [(STSegmentView *)self titleLabel];
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7;
  double v10 = v9;

  v11 = [(STSegmentView *)self detailLabel];
  objc_msgSend(v11, "sizeThatFits:", width, height);
  double v13 = v12;
  double v15 = v14;

  double v16 = [(STSegmentView *)self detailImageView];
  objc_msgSend(v16, "sizeThatFits:", width, height);
  double v18 = v17;

  BOOL v19 = [(STSegmentView *)self useVibrancy];
  double v20 = v10 + v15 + 2.0;
  if (v19) {
    double v20 = v10 + v15;
  }
  double v21 = v13 + v18 + 2.0;
  if (v8 >= v21) {
    double v21 = v8;
  }
  result.double height = v20;
  result.double width = v21;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STSegmentView;
  [(STSegmentView *)&v11 traitCollectionDidChange:v4];
  if ([(STSegmentView *)self useVibrancy])
  {
    if (!v4
      || (uint64_t v5 = [v4 userInterfaceStyle],
          [(STSegmentView *)self traitCollection],
          BOOL v6 = objc_claimAutoreleasedReturnValue(),
          uint64_t v7 = [v6 userInterfaceStyle],
          v6,
          v5 != v7))
    {
      double v8 = [(STSegmentView *)self titleLabel];
      double v9 = [(STSegmentView *)self item];
      double v10 = [v9 titleColor];
      +[STUsageColors updateVibrancyStylingForView:v8 withUsageColor:v10];
    }
  }
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (NSLayoutConstraint)detailLabelLeadingConstraint
{
  return self->_detailLabelLeadingConstraint;
}

- (UIImageView)detailImageView
{
  return self->_detailImageView;
}

- (NSLayoutConstraint)detailImageWidthConstraint
{
  return self->_detailImageWidthConstraint;
}

- (NSLayoutConstraint)detailImageHeightConstraint
{
  return self->_detailImageHeightConstraint;
}

- (STSegmentItem)item
{
  return self->_item;
}

- (BOOL)useVibrancy
{
  return self->_useVibrancy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_detailImageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_detailImageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_detailImageView, 0);
  objc_storeStrong((id *)&self->_detailLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end