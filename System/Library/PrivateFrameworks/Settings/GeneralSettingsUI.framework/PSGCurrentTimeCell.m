@interface PSGCurrentTimeCell
- (PSGCurrentTimeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)axConstraints;
- (id)normalConstraints;
- (void)layoutSubviews;
- (void)setupLayoutConstraints;
@end

@implementation PSGCurrentTimeCell

- (PSGCurrentTimeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)PSGCurrentTimeCell;
  v5 = [(PSTableCell *)&v8 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    [(PSGCurrentTimeCell *)v5 layoutSubviews];
    [(PSGCurrentTimeCell *)v6 setupLayoutConstraints];
  }
  return v6;
}

- (void)layoutSubviews
{
  v3 = [(PSGCurrentTimeCell *)self textLabel];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v4 = [(PSGCurrentTimeCell *)self detailTextLabel];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [MEMORY[0x263F825C8] tableCellBlueTextColor];
  v6 = [(PSGCurrentTimeCell *)self detailTextLabel];
  [v6 setTextColor:v5];

  v7 = [MEMORY[0x263F825C8] tableCellBlueTextColor];
  objc_super v8 = [(PSGCurrentTimeCell *)self textLabel];
  [v8 setTextColor:v7];

  [(PSGCurrentTimeCell *)self setSelectionStyle:0];
}

- (void)setupLayoutConstraints
{
  v3 = [MEMORY[0x263F82438] sharedApplication];
  v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory) {
    [(PSGCurrentTimeCell *)self axConstraints];
  }
  else {
  id v6 = [(PSGCurrentTimeCell *)self normalConstraints];
  }
  [MEMORY[0x263F08938] activateConstraints:v6];
}

- (id)axConstraints
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = objc_opt_new();
  v5 = [(PSGCurrentTimeCell *)self contentView];
  [v5 addLayoutGuide:v4];

  id v6 = [v4 leadingAnchor];
  v7 = [(PSGCurrentTimeCell *)self contentView];
  objc_super v8 = [v7 layoutMarginsGuide];
  v9 = [v8 leadingAnchor];
  v10 = [v6 constraintEqualToAnchor:v9];
  [v3 addObject:v10];

  v11 = [v4 trailingAnchor];
  v12 = [(PSGCurrentTimeCell *)self contentView];
  v13 = [v12 layoutMarginsGuide];
  v14 = [v13 trailingAnchor];
  v15 = [v11 constraintEqualToAnchor:v14];
  [v3 addObject:v15];

  v16 = [v4 centerYAnchor];
  v17 = [(PSGCurrentTimeCell *)self contentView];
  v18 = [v17 centerYAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  [v3 addObject:v19];

  v20 = [(PSGCurrentTimeCell *)self textLabel];
  v21 = [v20 topAnchor];
  v22 = [v4 topAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  [v3 addObject:v23];

  v24 = [(PSGCurrentTimeCell *)self detailTextLabel];
  v25 = [v24 topAnchor];
  v26 = [(PSGCurrentTimeCell *)self textLabel];
  v27 = [v26 bottomAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  [v3 addObject:v28];

  v29 = [(PSGCurrentTimeCell *)self detailTextLabel];
  v30 = [v29 bottomAnchor];
  v31 = [v4 bottomAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  [v3 addObject:v32];

  v33 = [(PSGCurrentTimeCell *)self textLabel];
  v34 = [v33 centerXAnchor];
  v35 = [v4 centerXAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  [v3 addObject:v36];

  v37 = [(PSGCurrentTimeCell *)self detailTextLabel];
  v38 = [v37 centerXAnchor];
  v39 = [v4 centerXAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];
  [v3 addObject:v40];

  v41 = (void *)[v3 copy];
  return v41;
}

- (id)normalConstraints
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(PSGCurrentTimeCell *)self textLabel];
  v5 = [v4 centerXAnchor];
  id v6 = [(PSGCurrentTimeCell *)self contentView];
  v7 = [v6 centerXAnchor];
  objc_super v8 = [v5 constraintEqualToAnchor:v7];

  LODWORD(v9) = 1132068864;
  [v8 setPriority:v9];
  [v3 addObject:v8];
  v10 = [(PSGCurrentTimeCell *)self textLabel];
  v11 = [v10 leadingAnchor];
  v12 = [(PSGCurrentTimeCell *)self contentView];
  v13 = [v12 layoutMarginsGuide];
  v14 = [v13 leadingAnchor];
  v15 = [v11 constraintGreaterThanOrEqualToAnchor:v14];

  LODWORD(v16) = 1148846080;
  [v15 setPriority:v16];
  [v3 addObject:v15];
  v17 = [(PSGCurrentTimeCell *)self textLabel];
  v18 = [v17 centerYAnchor];
  v19 = [(PSGCurrentTimeCell *)self contentView];
  v20 = [v19 centerYAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  [v3 addObject:v21];

  v22 = [(PSGCurrentTimeCell *)self detailTextLabel];
  v23 = [v22 trailingAnchor];
  v24 = [(PSGCurrentTimeCell *)self contentView];
  v25 = [v24 layoutMarginsGuide];
  v26 = [v25 trailingAnchor];
  v27 = [v23 constraintEqualToAnchor:v26];

  LODWORD(v28) = 1144750080;
  [v27 setPriority:v28];
  [v3 addObject:v27];
  v29 = [(PSGCurrentTimeCell *)self detailTextLabel];
  v30 = [v29 centerYAnchor];
  v31 = [(PSGCurrentTimeCell *)self contentView];
  v32 = [v31 centerYAnchor];
  v33 = [v30 constraintEqualToAnchor:v32];
  [v3 addObject:v33];

  v34 = [(PSGCurrentTimeCell *)self detailTextLabel];
  v35 = [v34 leadingAnchor];
  v36 = [(PSGCurrentTimeCell *)self textLabel];
  v37 = [v36 trailingAnchor];
  v38 = [v35 constraintGreaterThanOrEqualToAnchor:v37 constant:8.0];

  LODWORD(v39) = 1144750080;
  [v38 setPriority:v39];
  [v3 addObject:v38];
  v40 = (void *)[v3 copy];

  return v40;
}

@end