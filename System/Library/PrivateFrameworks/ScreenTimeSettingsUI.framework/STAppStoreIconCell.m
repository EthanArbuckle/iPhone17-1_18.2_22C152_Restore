@interface STAppStoreIconCell
- (STAppStoreIconCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIImageView)appIconView;
- (UILabel)nameLabel;
- (id)value;
- (void)_didFetchAppInfoOrIcon:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation STAppStoreIconCell

- (STAppStoreIconCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v46[9] = *MEMORY[0x263EF8340];
  v45.receiver = self;
  v45.super_class = (Class)STAppStoreIconCell;
  v5 = [(STTableCell *)&v45 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(STAppStoreIconCell *)v5 contentView];
    uint64_t v8 = objc_opt_new();
    appIconView = v6->_appIconView;
    v6->_appIconView = (UIImageView *)v8;

    [(UIImageView *)v6->_appIconView setContentMode:1];
    [(UIImageView *)v6->_appIconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [v7 addSubview:v6->_appIconView];
    uint64_t v10 = objc_opt_new();
    nameLabel = v6->_nameLabel;
    v6->_nameLabel = (UILabel *)v10;

    [(UILabel *)v6->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
    [(UILabel *)v6->_nameLabel setFont:v12];

    [v7 addSubview:v6->_nameLabel];
    v13 = [(UIImageView *)v6->_appIconView heightAnchor];
    v44 = [v13 constraintEqualToConstant:44.0];

    LODWORD(v14) = 1144750080;
    [v44 setPriority:v14];
    v41 = [(STTableCell *)v6 contentLayoutGuide];
    v33 = (void *)MEMORY[0x263F08938];
    v46[0] = v44;
    v43 = [(UIImageView *)v6->_appIconView topAnchor];
    v42 = [v7 topAnchor];
    v40 = [v43 constraintEqualToSystemSpacingBelowAnchor:v42 multiplier:1.0];
    v46[1] = v40;
    v39 = [(UIImageView *)v6->_appIconView leadingAnchor];
    v38 = [v41 leadingAnchor];
    v37 = [v39 constraintEqualToAnchor:v38];
    v46[2] = v37;
    v36 = [v7 bottomAnchor];
    v35 = [(UIImageView *)v6->_appIconView bottomAnchor];
    v34 = [v36 constraintEqualToSystemSpacingBelowAnchor:v35 multiplier:1.0];
    v46[3] = v34;
    v32 = [(UIImageView *)v6->_appIconView widthAnchor];
    v31 = [(UIImageView *)v6->_appIconView heightAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v46[4] = v30;
    v28 = [(UIImageView *)v6->_appIconView centerYAnchor];
    v29 = v7;
    v27 = [v7 centerYAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v46[5] = v26;
    v25 = [(UILabel *)v6->_nameLabel leadingAnchor];
    v15 = [(UIImageView *)v6->_appIconView trailingAnchor];
    v16 = [v25 constraintEqualToSystemSpacingAfterAnchor:v15 multiplier:2.0];
    v46[6] = v16;
    v17 = [(UILabel *)v6->_nameLabel centerYAnchor];
    v18 = [(UIImageView *)v6->_appIconView centerYAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v46[7] = v19;
    v20 = [(UILabel *)v6->_nameLabel trailingAnchor];
    v21 = [v7 trailingAnchor];
    v22 = [v20 constraintLessThanOrEqualToAnchor:v21];
    v46[8] = v22;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:9];
    [v33 activateConstraints:v23];
  }
  return v6;
}

- (id)value
{
  v4.receiver = self;
  v4.super_class = (Class)STAppStoreIconCell;
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
      double v14 = [MEMORY[0x263F08690] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"STAppStoreIconCell.m", 72, @"Invalid parameter not satisfying: %@", @"(usageItem == nil) || [usageItem isKindOfClass:[STUsageItem class]]" object file lineNumber description];
    }
  }
  unint64_t v6 = [v5 itemType];
  if (v6 > 6 || ((1 << v6) & 0x54) == 0)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"STAppStoreIconCell.m", 75, @"Invalid parameter not satisfying: %@", @"isAppItem || (itemType == STUsageItemTypeWebsite)" object file lineNumber description];
  }
  v9 = [(STAppStoreIconCell *)self value];
  v15.receiver = self;
  v15.super_class = (Class)STAppStoreIconCell;
  [(PSTableCell *)&v15 setValue:v5];
  uint64_t v10 = [v5 budgetItemIdentifier];
  v11 = [v9 budgetItemIdentifier];
  if (v10 != v11)
  {
    v12 = [MEMORY[0x263F67408] sharedCache];
    v13 = [MEMORY[0x263F670A8] sharedCache];
    if (([v9 itemType] & 0xFFFFFFFFFFFFFFFBLL) == 2)
    {
      if ([v10 isEqualToString:v11])
      {
LABEL_16:

        goto LABEL_17;
      }
      [v12 removeObserver:self bundleIdentifier:v11];
      [v13 removeObserver:self bundleIdentifier:v11];
    }
    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 2)
    {
      [v12 addObserver:self selector:sel__didFetchAppInfoOrIcon_ bundleIdentifier:v10];
      [v13 addObserver:self selector:sel__didFetchAppInfoOrIcon_ bundleIdentifier:v10];
    }
    goto LABEL_16;
  }
LABEL_17:
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)STAppStoreIconCell;
  [(PSTableCell *)&v13 refreshCellContentsWithSpecifier:a3];
  objc_super v4 = [(STAppStoreIconCell *)self value];
  id v5 = [v4 budgetItemIdentifier];
  if (v5)
  {
    if ([v4 itemType] == 4)
    {
      unint64_t v6 = [v4 displayName];
      v7 = [v4 image];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x263F670A8] sharedCache];
      v9 = [v8 appInfoForBundleIdentifier:v5];
      unint64_t v6 = [v9 displayName];

      uint64_t v10 = [MEMORY[0x263F67408] sharedCache];
      v7 = [v10 imageForBundleIdentifier:v5];
    }
  }
  else
  {
    v7 = 0;
    unint64_t v6 = 0;
  }
  v11 = [(STAppStoreIconCell *)self nameLabel];
  [v11 setText:v6];

  v12 = [(STAppStoreIconCell *)self appIconView];
  [v12 setImage:v7];

  [(STAppStoreIconCell *)self setNeedsLayout];
}

- (void)_didFetchAppInfoOrIcon:(id)a3
{
  uint64_t v4 = [(PSTableCell *)self specifier];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v4 = [(STAppStoreIconCell *)self refreshCellContentsWithSpecifier:v4];
    uint64_t v5 = v6;
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (UIImageView)appIconView
{
  return self->_appIconView;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);

  objc_storeStrong((id *)&self->_appIconView, 0);
}

@end