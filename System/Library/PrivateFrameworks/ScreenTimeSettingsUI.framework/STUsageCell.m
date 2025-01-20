@interface STUsageCell
- (NSLayoutConstraint)usageBarWidthConstraint;
- (STCandyBarView)usageBarView;
- (STUsageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIImageView)trustWarningImageView;
- (UILabel)itemNameLabel;
- (UILabel)usageLabel;
- (id)value;
- (void)_didFetchAppInfoOrIcon:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation STUsageCell

- (STUsageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v91[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v89.receiver = self;
  v89.super_class = (Class)STUsageCell;
  v9 = [(STTableCell *)&v89 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    v11 = [(STUsageCell *)v9 contentView];
    v86 = [MEMORY[0x263F827E8] systemImageNamed:@"exclamationmark.triangle.fill"];
    uint64_t v12 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v86];
    trustWarningImageView = v10->_trustWarningImageView;
    v10->_trustWarningImageView = (UIImageView *)v12;

    v14 = [MEMORY[0x263F825C8] systemYellowColor];
    [(UIImageView *)v10->_trustWarningImageView setTintColor:v14];

    [(UIImageView *)v10->_trustWarningImageView setHidden:1];
    uint64_t v15 = objc_opt_new();
    itemNameLabel = v10->_itemNameLabel;
    v10->_itemNameLabel = (UILabel *)v15;

    v17 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [(UILabel *)v10->_itemNameLabel setFont:v17];

    LODWORD(v18) = 1148846080;
    [(UILabel *)v10->_itemNameLabel setContentCompressionResistancePriority:1 forAxis:v18];
    id v19 = objc_alloc(MEMORY[0x263F82BF8]);
    v91[0] = v10->_trustWarningImageView;
    v91[1] = v10->_itemNameLabel;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v91 count:2];
    v21 = (void *)[v19 initWithArrangedSubviews:v20];

    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v21 setSpacing:1.17549435e-38];
    [v11 addSubview:v21];
    uint64_t v22 = objc_opt_new();
    usageLabel = v10->_usageLabel;
    v10->_usageLabel = (UILabel *)v22;

    [(UILabel *)v10->_usageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v24 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
    [(UILabel *)v10->_usageLabel setFont:v24];

    v25 = [MEMORY[0x263F825C8] tertiaryLabelColor];
    [(UILabel *)v10->_usageLabel setTextColor:v25];

    [v11 addSubview:v10->_usageLabel];
    v26 = [[STCandyBarView alloc] initWithVibrancy:0];
    usageBarView = v10->_usageBarView;
    v10->_usageBarView = v26;

    [(STCandyBarView *)v10->_usageBarView setTranslatesAutoresizingMaskIntoConstraints:0];
    v28 = objc_opt_new();
    [v28 setTotalUsage:&unk_26D967438];
    id v87 = v8;
    v29 = [v8 objectForKeyedSubscript:@"STUsageBarColorKey"];
    if (v29)
    {
      [v28 setColor:v29];
    }
    else
    {
      v30 = [MEMORY[0x263F825C8] systemGray4Color];
      [v28 setColor:v30];
    }
    v85 = v28;
    v90 = v28;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v90 count:1];
    [(STCandyBarView *)v10->_usageBarView setUsageItems:v31];

    [v11 addSubview:v10->_usageBarView];
    v88 = [(STTableCell *)v10 contentLayoutGuide];
    v32 = objc_opt_new();
    v33 = [v11 bottomAnchor];
    v34 = [(STCandyBarView *)v10->_usageBarView bottomAnchor];
    v35 = [v33 constraintGreaterThanOrEqualToAnchor:v34 constant:7.0];
    [v32 addObject:v35];

    v36 = [v11 bottomAnchor];
    v37 = [(UILabel *)v10->_usageLabel bottomAnchor];
    v38 = [v36 constraintGreaterThanOrEqualToAnchor:v37 constant:7.0];
    [v32 addObject:v38];

    v39 = [v21 topAnchor];
    v40 = [v11 topAnchor];
    v41 = [v39 constraintEqualToAnchor:v40 constant:7.0];
    [v32 addObject:v41];

    v42 = [v21 bottomAnchor];
    v43 = [(STCandyBarView *)v10->_usageBarView topAnchor];
    v44 = [v42 constraintLessThanOrEqualToAnchor:v43];
    [v32 addObject:v44];

    v45 = [v21 bottomAnchor];
    v46 = [(UILabel *)v10->_usageLabel topAnchor];
    v47 = [v45 constraintLessThanOrEqualToAnchor:v46];
    [v32 addObject:v47];

    v48 = [(STCandyBarView *)v10->_usageBarView leadingAnchor];
    v49 = [v21 leadingAnchor];
    v50 = [v48 constraintEqualToAnchor:v49];
    [v32 addObject:v50];

    v51 = [(STCandyBarView *)v10->_usageBarView heightAnchor];
    v52 = [v51 constraintEqualToConstant:5.0];
    [v32 addObject:v52];

    v53 = [(STCandyBarView *)v10->_usageBarView widthAnchor];
    v54 = [v53 constraintGreaterThanOrEqualToConstant:5.0];
    [v32 addObject:v54];

    v55 = [(STCandyBarView *)v10->_usageBarView bottomAnchor];
    v56 = [v11 bottomAnchor];
    v57 = [v55 constraintLessThanOrEqualToAnchor:v56];
    [v32 addObject:v57];

    v58 = [(STCandyBarView *)v10->_usageBarView widthAnchor];
    uint64_t v59 = [v58 constraintEqualToConstant:5.0];
    usageBarWidthConstraint = v10->_usageBarWidthConstraint;
    v10->_usageBarWidthConstraint = (NSLayoutConstraint *)v59;

    LODWORD(v61) = 1132068864;
    [(NSLayoutConstraint *)v10->_usageBarWidthConstraint setPriority:v61];
    [v32 addObject:v10->_usageBarWidthConstraint];
    v62 = [(STCandyBarView *)v10->_usageBarView centerYAnchor];
    v63 = [v11 centerYAnchor];
    v64 = [v62 constraintEqualToAnchor:v63 constant:12.0];

    LODWORD(v65) = 1144750080;
    [v64 setPriority:v65];
    [v32 addObject:v64];
    v66 = [(UILabel *)v10->_usageLabel centerYAnchor];
    v67 = [(STCandyBarView *)v10->_usageBarView centerYAnchor];
    v68 = [v66 constraintEqualToAnchor:v67];
    [v32 addObject:v68];

    v69 = [(UILabel *)v10->_usageLabel leadingAnchor];
    v70 = [(STCandyBarView *)v10->_usageBarView trailingAnchor];
    v71 = [v69 constraintEqualToAnchor:v70 constant:6.0];
    [v32 addObject:v71];

    v72 = [(UILabel *)v10->_usageLabel trailingAnchor];
    v73 = [v11 trailingAnchor];
    v74 = [v72 constraintEqualToAnchor:v73];

    LODWORD(v75) = 1132068864;
    [v74 setPriority:v75];
    [v32 addObject:v74];
    v76 = [(id)*MEMORY[0x263F83300] preferredContentSizeCategory];
    LODWORD(v71) = UIContentSizeCategoryIsAccessibilityCategory(v76);

    v77 = [v21 leadingAnchor];
    if (v71)
    {
      v78 = [(PSTableCell *)v10 iconImageView];
      v79 = [v78 trailingAnchor];
      v80 = [v77 constraintEqualToSystemSpacingAfterAnchor:v79 multiplier:2.0];
      [v32 addObject:v80];
    }
    else
    {
      v78 = [v88 leadingAnchor];
      v79 = [v77 constraintEqualToAnchor:v78];
      [v32 addObject:v79];
    }

    v81 = [(UIImageView *)v10->_trustWarningImageView widthAnchor];
    v82 = [(UIImageView *)v10->_trustWarningImageView heightAnchor];
    v83 = [v81 constraintEqualToAnchor:v82 multiplier:1.0];
    [v32 addObject:v83];

    [MEMORY[0x263F08938] activateConstraints:v32];
    id v8 = v87;
  }

  return v10;
}

- (id)value
{
  v4.receiver = self;
  v4.super_class = (Class)STUsageCell;
  v2 = [(PSTableCell *)&v4 value];

  return v2;
}

- (void)setValue:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v26 = [MEMORY[0x263F08690] currentHandler];
      [v26 handleFailureInMethod:a2, self, @"STUsageCell.m", 118, @"Invalid parameter not satisfying: %@", @"(usageItem == nil) || [usageItem isKindOfClass:[STUsageItem class]]" object file lineNumber description];
    }
  }
  v6 = [(STUsageCell *)self value];
  v27.receiver = self;
  v27.super_class = (Class)STUsageCell;
  [(PSTableCell *)&v27 setValue:v5];
  unint64_t v7 = [v6 itemType];
  id v8 = (id *)MEMORY[0x263F673B0];
  if (v7 == 4)
  {
    id v9 = (id)*MEMORY[0x263F673B0];
  }
  else
  {
    id v9 = [v6 budgetItemIdentifier];
  }
  id v10 = v9;
  unint64_t v11 = [v5 itemType];
  if (v11 == 4)
  {
    id v12 = *v8;
  }
  else
  {
    id v12 = [v5 budgetItemIdentifier];
  }
  v13 = v12;
  if (v12 != v10)
  {
    v14 = [MEMORY[0x263F67408] sharedCache];
    uint64_t v15 = [MEMORY[0x263F670A8] sharedCache];
    int v16 = 1;
    if (v7 <= 6 && ((1 << v7) & 0x74) != 0)
    {
      if ([v13 isEqualToString:v10])
      {
        int v16 = 0;
      }
      else
      {
        [v14 removeObserver:self bundleIdentifier:v10];
        if (v7 != 4) {
          [v15 removeObserver:self bundleIdentifier:v10];
        }
        int v16 = 1;
      }
    }
    if (v11 <= 6 && ((1 << v11) & 0x74) != 0)
    {
      if (v16)
      {
        [v14 addObserver:self selector:sel__didFetchAppInfoOrIcon_ bundleIdentifier:v13];
        if (v11 != 4) {
          [v15 addObserver:self selector:sel__didFetchAppInfoOrIcon_ bundleIdentifier:v13];
        }
      }
    }
  }
  v17 = [v5 maxUsage];
  [v17 doubleValue];
  double v19 = v18;

  if (v19 < 1.0) {
    double v19 = 1.0;
  }
  v20 = [v5 totalUsage];
  [v20 doubleValue];
  double v22 = v21 / v19 * 198.0;

  if (v22 < 5.0) {
    double v22 = 5.0;
  }
  v23 = [(STUsageCell *)self usageBarWidthConstraint];
  [v23 setConstant:v22];

  uint64_t v24 = [v5 usageTrusted];
  v25 = [(STUsageCell *)self trustWarningImageView];
  [v25 setHidden:v24];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)STUsageCell;
  [(PSTableCell *)&v9 refreshCellContentsWithSpecifier:a3];
  objc_super v4 = [(STUsageCell *)self value];
  id v5 = [v4 budgetItemIdentifier];
  if (v5)
  {
    v6 = [v4 displayName];
    unint64_t v7 = [v4 image];
  }
  else
  {
    v6 = 0;
    unint64_t v7 = 0;
  }
  id v8 = [(STUsageCell *)self itemNameLabel];
  [v8 setText:v6];

  [(PSTableCell *)self setIcon:v7];
  [(STUsageCell *)self setNeedsLayout];
}

- (void)_didFetchAppInfoOrIcon:(id)a3
{
  uint64_t v4 = [(PSTableCell *)self specifier];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v4 = [(STUsageCell *)self refreshCellContentsWithSpecifier:v4];
    uint64_t v5 = v6;
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (UILabel)itemNameLabel
{
  return self->_itemNameLabel;
}

- (STCandyBarView)usageBarView
{
  return self->_usageBarView;
}

- (UILabel)usageLabel
{
  return self->_usageLabel;
}

- (UIImageView)trustWarningImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 1248, 1);
}

- (NSLayoutConstraint)usageBarWidthConstraint
{
  return self->_usageBarWidthConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageBarWidthConstraint, 0);
  objc_storeStrong((id *)&self->_trustWarningImageView, 0);
  objc_storeStrong((id *)&self->_usageLabel, 0);
  objc_storeStrong((id *)&self->_usageBarView, 0);

  objc_storeStrong((id *)&self->_itemNameLabel, 0);
}

@end