@interface STStorageAppHeaderCell
+ (id)specifierForAppBundleURL:(id)a3;
+ (id)specifierForAppIdentifier:(id)a3;
+ (id)specifierForAppProxy:(id)a3;
+ (id)specifierForStorageApp:(id)a3;
- (BOOL)infoHidden;
- (NSString)info;
- (NSString)title;
- (NSString)vendor;
- (STStorageAppHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIImage)icon;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setIcon:(id)a3;
- (void)setInfo:(id)a3;
- (void)setInfoHidden:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setVendor:(id)a3;
- (void)updateConstraints;
@end

@implementation STStorageAppHeaderCell

+ (id)specifierForStorageApp:(id)a3
{
  v3 = (void *)MEMORY[0x263F5FC40];
  id v4 = a3;
  v5 = [v3 preferenceSpecifierNamed:&stru_26C91D0A0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
  [v5 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v5 setProperty:v4 forKey:@"stStorageApp"];

  return v5;
}

+ (id)specifierForAppIdentifier:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F7B000];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4];

  v6 = +[STStorageAppHeaderCell specifierForStorageApp:v5];

  return v6;
}

+ (id)specifierForAppProxy:(id)a3
{
  v3 = [a3 bundleIdentifier];
  id v4 = +[STStorageAppHeaderCell specifierForAppIdentifier:v3];

  return v4;
}

+ (id)specifierForAppBundleURL:(id)a3
{
  v3 = [MEMORY[0x263F086E0] bundleWithURL:a3];
  id v4 = [v3 bundleIdentifier];
  v5 = +[STStorageAppHeaderCell specifierForAppIdentifier:v4];

  return v5;
}

- (STStorageAppHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v41[5] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v39.receiver = self;
  v39.super_class = (Class)STStorageAppHeaderCell;
  v9 = [(PSTableCell *)&v39 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    v11 = [(STStorageAppHeaderCell *)v9 contentView];
    uint64_t v12 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    v13 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
    v10->_infoHidden = [v8 versionLabelEnabled] ^ 1;
    id v14 = objc_alloc(MEMORY[0x263F1C768]);
    double v15 = *MEMORY[0x263F001A8];
    double v16 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v17 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v18 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v19 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x263F001A8], v16, v17, v18);
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = (UILabel *)v19;

    v38 = (void *)v12;
    [(UILabel *)v10->_titleLabel setFont:v12];
    [(UILabel *)v10->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v10->_titleLabel setAccessibilityIdentifier:@"Title"];
    [(UILabel *)v10->_titleLabel setNumberOfLines:1];
    [(UILabel *)v10->_titleLabel setLineBreakMode:4];
    [(UILabel *)v10->_titleLabel setAllowsDefaultTighteningForTruncation:1];
    [v11 addSubview:v10->_titleLabel];
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v15, v16, v17, v18);
    infoLabel = v10->_infoLabel;
    v10->_infoLabel = (UILabel *)v21;

    [(UILabel *)v10->_infoLabel setFont:v13];
    v23 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [(UILabel *)v10->_infoLabel setTextColor:v23];

    [(UILabel *)v10->_infoLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v10->_infoLabel setAccessibilityIdentifier:@"Info"];
    [(UILabel *)v10->_infoLabel setNumberOfLines:1];
    [(UILabel *)v10->_infoLabel setLineBreakMode:4];
    [(UILabel *)v10->_infoLabel setAllowsDefaultTighteningForTruncation:1];
    [v11 addSubview:v10->_infoLabel];
    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v15, v16, v17, v18);
    vendorLabel = v10->_vendorLabel;
    v10->_vendorLabel = (UILabel *)v24;

    [(UILabel *)v10->_vendorLabel setFont:v13];
    v26 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [(UILabel *)v10->_vendorLabel setTextColor:v26];

    [(UILabel *)v10->_vendorLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v10->_vendorLabel setAccessibilityIdentifier:@"Creator"];
    [(UILabel *)v10->_vendorLabel setNumberOfLines:1];
    [(UILabel *)v10->_vendorLabel setLineBreakMode:4];
    [(UILabel *)v10->_vendorLabel setAllowsDefaultTighteningForTruncation:1];
    [v11 addSubview:v10->_vendorLabel];
    uint64_t v27 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", v15, v16, v17, v18);
    appIconView = v10->_appIconView;
    v10->_appIconView = (UIImageView *)v27;

    [(UIImageView *)v10->_appIconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v10->_appIconView setAccessibilityIdentifier:@"Icon"];
    [(UIImageView *)v10->_appIconView setContentMode:1];
    [v11 addSubview:v10->_appIconView];
    uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", v15, v16, v17, v18);
    cloudIconView = v10->_cloudIconView;
    v10->_cloudIconView = (UIImageView *)v29;

    [(UIImageView *)v10->_cloudIconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v10->_cloudIconView setAccessibilityIdentifier:@"CloudIcon"];
    [(UIImageView *)v10->_cloudIconView setContentMode:1];
    [(UIImageView *)v10->_cloudIconView setHidden:1];
    v31 = [MEMORY[0x263F1C6B0] systemImageNamed:@"icloud.and.arrow.down"];
    [(UIImageView *)v10->_cloudIconView setImage:v31];

    v32 = [MEMORY[0x263F1C550] systemGray2Color];
    [(UIImageView *)v10->_cloudIconView setTintColor:v32];

    [v11 addSubview:v10->_cloudIconView];
    if (v10->_infoHidden)
    {
      v40[0] = v10->_titleLabel;
      v40[1] = v10->_vendorLabel;
      v40[2] = v10->_appIconView;
      v40[3] = v10->_cloudIconView;
      v33 = (void *)MEMORY[0x263EFF8C0];
      v34 = v40;
      uint64_t v35 = 4;
    }
    else
    {
      v41[0] = v10->_titleLabel;
      v41[1] = v10->_infoLabel;
      v41[2] = v10->_vendorLabel;
      v41[3] = v10->_appIconView;
      v41[4] = v10->_cloudIconView;
      v33 = (void *)MEMORY[0x263EFF8C0];
      v34 = v41;
      uint64_t v35 = 5;
    }
    v36 = objc_msgSend(v33, "arrayWithObjects:count:", v34, v35, 1241);
    [v11 setAccessibilityElements:v36];

    [(STStorageAppHeaderCell *)v10 setNeedsUpdateConstraints];
    [(STStorageAppHeaderCell *)v10 refreshCellContentsWithSpecifier:v8];
  }
  return v10;
}

- (void)updateConstraints
{
  titleLabel = self->_titleLabel;
  if (self->_infoHidden) {
    _NSDictionaryOfVariableBindings(&cfstr_TitlelabelVend.isa, titleLabel, self->_vendorLabel, self->_appIconView, self->_cloudIconView, 0);
  }
  else {
  id v4 = _NSDictionaryOfVariableBindings(&cfstr_TitlelabelInfo.isa, titleLabel, self->_infoLabel, self->_vendorLabel, self->_appIconView, self->_cloudIconView, 0);
  }
  if ([(NSMutableArray *)self->_constraints count]) {
    [MEMORY[0x263F08938] deactivateConstraints:self->_constraints];
  }
  v5 = [MEMORY[0x263EFF980] array];
  constraints = self->_constraints;
  self->_constraints = v5;

  v7 = self->_constraints;
  id v8 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-15-[_appIconView(==58)]" options:0 metrics:0 views:v4];
  [(NSMutableArray *)v7 addObjectsFromArray:v8];

  v9 = self->_constraints;
  v10 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-16-[_appIconView(==58)]-(>=16)-|" options:0 metrics:0 views:v4];
  [(NSMutableArray *)v9 addObjectsFromArray:v10];

  if (self->_isDemoted) {
    v11 = @"H:|-84-[_cloudIconView(==22)]-5-[_titleLabel]-(>=15)-|";
  }
  else {
    v11 = @"H:|-84-[_titleLabel]-15-|";
  }
  uint64_t v12 = self->_constraints;
  v13 = [MEMORY[0x263F08938] constraintsWithVisualFormat:v11 options:0 metrics:0 views:v4];
  [(NSMutableArray *)v12 addObjectsFromArray:v13];

  id v14 = self->_constraints;
  if (self->_infoHidden) {
    double v15 = @"V:|-16-[_titleLabel]-2-[_vendorLabel]-(>=16)-|";
  }
  else {
    double v15 = @"V:|-16-[_titleLabel]-2-[_infoLabel]-2-[_vendorLabel]-(>=16)-|";
  }
  double v16 = [MEMORY[0x263F08938] constraintsWithVisualFormat:v15 options:0 metrics:0 views:v4];
  [(NSMutableArray *)v14 addObjectsFromArray:v16];

  double v17 = self->_constraints;
  double v18 = [MEMORY[0x263F08938] constraintWithItem:self->_cloudIconView attribute:12 relatedBy:0 toItem:self->_titleLabel attribute:12 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v17 addObject:v18];

  uint64_t v19 = self->_constraints;
  v20 = [MEMORY[0x263F08938] constraintWithItem:self->_cloudIconView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:22.0];
  [(NSMutableArray *)v19 addObject:v20];

  if (!self->_infoHidden)
  {
    uint64_t v21 = self->_constraints;
    v22 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-84-[_infoLabel]-15-|" options:0 metrics:0 views:v4];
    [(NSMutableArray *)v21 addObjectsFromArray:v22];
  }
  v23 = self->_constraints;
  uint64_t v24 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-84-[_vendorLabel]-15-|" options:0 metrics:0 views:v4];
  [(NSMutableArray *)v23 addObjectsFromArray:v24];

  [MEMORY[0x263F08938] activateConstraints:self->_constraints];
  v25.receiver = self;
  v25.super_class = (Class)STStorageAppHeaderCell;
  [(STStorageAppHeaderCell *)&v25 updateConstraints];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)STStorageAppHeaderCell;
  [(PSTableCell *)&v18 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 propertyForKey:@"stStorageApp"];
  v6 = v5;
  if (v5)
  {
    int v7 = [v5 isDemoted];
    id v8 = [v6 bundleIdentifier];
    int v9 = [v8 isEqualToString:@"com.apple.Health"];

    if (v9) {
      v7 &= ~[v6 isDemoted];
    }
    v10 = [(STStorageAppHeaderCell *)self icon];

    if (!v10)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __59__STStorageAppHeaderCell_refreshCellContentsWithSpecifier___block_invoke;
      v17[3] = &unk_264302350;
      v17[4] = self;
      STLoadHeaderIconForApp(v6, v17);
    }
    v11 = [v6 name];
    [(STStorageAppHeaderCell *)self setTitle:v11];

    if ([v4 versionLabelEnabled])
    {
      uint64_t v12 = [v6 versionString];
      [(STStorageAppHeaderCell *)self setInfo:v12];
    }
    else
    {
      [(STStorageAppHeaderCell *)self setInfo:0];
    }
    v13 = [v6 vendorName];
    if (v13)
    {
      id v14 = [v6 appIdentifier];
      int v15 = [v14 hasPrefix:@"com.apple."];

      if (v15)
      {
        id v16 = (id)*MEMORY[0x263F7B088];

        v13 = v16;
      }
    }
    [(STStorageAppHeaderCell *)self setVendor:v13];
    if (self->_isDemoted != v7)
    {
      self->_isDemoted = v7;
      [(STStorageAppHeaderCell *)self setNeedsUpdateConstraints];
    }
    [(UIImageView *)self->_cloudIconView setHidden:v7 ^ 1u];
  }
  [(STStorageAppHeaderCell *)self setNeedsDisplay];
}

uint64_t __59__STStorageAppHeaderCell_refreshCellContentsWithSpecifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setIcon:a2];
}

- (void)setIcon:(id)a3
{
}

- (UIImage)icon
{
  return [(UIImageView *)self->_appIconView image];
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  if ([v5 length]) {
    id v4 = v5;
  }
  else {
    id v4 = 0;
  }
  [(UILabel *)self->_titleLabel setText:v4];
}

- (NSString)title
{
  v2 = [(UILabel *)self->_titleLabel text];
  v3 = v2;
  if (!v2) {
    v2 = &stru_26C91D0A0;
  }
  id v4 = v2;

  return v4;
}

- (void)setVendor:(id)a3
{
}

- (NSString)vendor
{
  v2 = [(UILabel *)self->_vendorLabel text];
  v3 = v2;
  if (!v2) {
    v2 = &stru_26C91D0A0;
  }
  id v4 = v2;

  return v4;
}

- (void)setInfo:(id)a3
{
}

- (NSString)info
{
  v2 = [(UILabel *)self->_infoLabel text];
  v3 = v2;
  if (!v2) {
    v2 = &stru_26C91D0A0;
  }
  id v4 = v2;

  return v4;
}

- (BOOL)infoHidden
{
  return self->_infoHidden;
}

- (void)setInfoHidden:(BOOL)a3
{
  self->_infoHidden = a3;
  [(STStorageAppHeaderCell *)self setNeedsUpdateConstraints];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudIconView, 0);
  objc_storeStrong((id *)&self->_appIconView, 0);
  objc_storeStrong((id *)&self->_vendorLabel, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_constraints, 0);
}

@end