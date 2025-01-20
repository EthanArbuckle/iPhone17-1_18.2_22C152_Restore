@interface STStorageTableCell
+ (double)defaultCellHeight;
- (BOOL)cloudIconHidden;
- (BOOL)infoHidden;
- (NSString)info;
- (NSString)sizeString;
- (NSString)title;
- (STStorageTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIActivityIndicatorView)spinner;
- (UIImage)icon;
- (id)_cloudIconColor;
- (int64_t)size;
- (void)createLargeFontConstraints;
- (void)createNormalFontConstraints;
- (void)setCloudIconHidden:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setInfo:(id)a3;
- (void)setInfoHidden:(BOOL)a3;
- (void)setSize:(int64_t)a3;
- (void)setSizeString:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setTitle:(id)a3;
- (void)setupTitleAndInfoConstraints;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation STStorageTableCell

- (int64_t)size
{
  return self->_size;
}

- (void)setSizeString:(id)a3
{
  v13 = (__CFString *)a3;
  if ([(__CFString *)v13 isEqualToString:@"…"])
  {
    [(UILabel *)self->_sizeLabel setText:0];
    v4 = [(STStorageTableCell *)self spinner];
    [(__CFString *)v4 startAnimating];
  }
  else
  {
    v5 = [(STStorageTableCell *)self spinner];
    [v5 stopAnimating];

    uint64_t v6 = [(UILabel *)self->_sizeLabel text];
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = &stru_26C91D0A0;
    }
    v4 = v8;

    if (v13) {
      v9 = v13;
    }
    else {
      v9 = &stru_26C91D0A0;
    }
    v10 = v9;
    if (([(__CFString *)v4 isEqualToString:v10] & 1) == 0)
    {
      if ([(__CFString *)v13 length]) {
        v11 = v13;
      }
      else {
        v11 = 0;
      }
      [(UILabel *)self->_sizeLabel setText:v11];
      v12 = [(STStorageTableCell *)self contentView];
      [v12 setNeedsLayout];
    }
  }
}

- (UIActivityIndicatorView)spinner
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 1312, 1);
}

- (void)setInfo:(id)a3
{
  v4 = (__CFString *)a3;
  if ([(__CFString *)v4 length]) {
    v5 = v4;
  }
  else {
    v5 = &stru_26C91D0A0;
  }
  [(UILabel *)self->_infoLabel setText:v5];

  [(STStorageTableCell *)self setNeedsLayout];
}

- (STStorageTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v57.receiver = self;
  v57.super_class = (Class)STStorageTableCell;
  v5 = [(PSTableCell *)&v57 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  uint64_t v6 = v5;
  if (v5)
  {
    v7 = [(STStorageTableCell *)v5 contentView];
    uint64_t v8 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    v56 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D270]];
    v9 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
    id v10 = objc_alloc(MEMORY[0x263F1C6D0]);
    double v11 = *MEMORY[0x263F001A8];
    double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v15 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x263F001A8], v12, v13, v14);
    iconView = v6->_iconView;
    v6->_iconView = (UIImageView *)v15;

    [(UIImageView *)v6->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v6->_iconView setAccessibilityIdentifier:@"Icon"];
    [(UIImageView *)v6->_iconView setContentMode:1];
    [v7 addSubview:v6->_iconView];
    [v9 addObject:v6->_iconView];
    uint64_t v17 = [MEMORY[0x263F08938] constraintWithItem:v6->_iconView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:29.0];
    iconSizeConstraint = v6->_iconSizeConstraint;
    v6->_iconSizeConstraint = (NSLayoutConstraint *)v17;

    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v11, v12, v13, v14);
    titleInfoView = v6->_titleInfoView;
    v6->_titleInfoView = (UIView *)v19;

    [(UIView *)v6->_titleInfoView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v21) = 1144750080;
    [(UIView *)v6->_titleInfoView setContentHuggingPriority:1 forAxis:v21];
    LODWORD(v22) = 1144750080;
    [(UIView *)v6->_titleInfoView setContentCompressionResistancePriority:1 forAxis:v22];
    [v7 addSubview:v6->_titleInfoView];
    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v11, v12, v13, v14);
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = (UILabel *)v23;

    v55 = (void *)v8;
    [(UILabel *)v6->_titleLabel setFont:v8];
    [(UILabel *)v6->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v6->_titleLabel setAccessibilityIdentifier:@"Title"];
    [(UILabel *)v6->_titleLabel setNumberOfLines:1];
    [(UILabel *)v6->_titleLabel setLineBreakMode:4];
    [(UILabel *)v6->_titleLabel setAllowsDefaultTighteningForTruncation:1];
    [(UILabel *)v6->_titleLabel setAdjustsFontForContentSizeCategory:1];
    LODWORD(v25) = 1144750080;
    [(UILabel *)v6->_titleLabel setContentHuggingPriority:1 forAxis:v25];
    LODWORD(v26) = 1144750080;
    [(UILabel *)v6->_titleLabel setContentCompressionResistancePriority:1 forAxis:v26];
    [(UIView *)v6->_titleInfoView addSubview:v6->_titleLabel];
    [v9 addObject:v6->_titleLabel];
    uint64_t v27 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", v11, v12, v13, v14);
    cloudIconView = v6->_cloudIconView;
    v6->_cloudIconView = (UIImageView *)v27;

    [(UIImageView *)v6->_cloudIconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v6->_cloudIconView setAccessibilityIdentifier:@"CloudIcon"];
    [(UIImageView *)v6->_cloudIconView setContentMode:1];
    [(UIImageView *)v6->_cloudIconView setHidden:1];
    v29 = [MEMORY[0x263F1C6B0] systemImageNamed:@"icloud.and.arrow.down"];
    [(UIImageView *)v6->_cloudIconView setImage:v29];

    v30 = [(STStorageTableCell *)v6 _cloudIconColor];
    [(UIImageView *)v6->_cloudIconView setTintColor:v30];

    [(UIView *)v6->_titleInfoView addSubview:v6->_cloudIconView];
    [v9 addObject:v6->_cloudIconView];
    uint64_t v31 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v11, v12, v13, v14);
    infoLabel = v6->_infoLabel;
    v6->_infoLabel = (UILabel *)v31;

    [(UILabel *)v6->_infoLabel setFont:v56];
    v33 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [(UILabel *)v6->_sizeLabel setTextColor:v33];

    [(UILabel *)v6->_infoLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v6->_infoLabel setAccessibilityIdentifier:@"Info"];
    [(UILabel *)v6->_infoLabel setNumberOfLines:1];
    [(UILabel *)v6->_infoLabel setLineBreakMode:4];
    [(UILabel *)v6->_infoLabel setAllowsDefaultTighteningForTruncation:1];
    [(UILabel *)v6->_infoLabel setAdjustsFontForContentSizeCategory:1];
    LODWORD(v34) = 1144750080;
    [(UILabel *)v6->_infoLabel setContentHuggingPriority:1 forAxis:v34];
    LODWORD(v35) = 1144750080;
    [(UILabel *)v6->_infoLabel setContentCompressionResistancePriority:1 forAxis:v35];
    [(UIView *)v6->_titleInfoView addSubview:v6->_infoLabel];
    [v9 addObject:v6->_infoLabel];
    uint64_t v36 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v11, v12, v13, v14);
    sizeLabel = v6->_sizeLabel;
    v6->_sizeLabel = (UILabel *)v36;

    [(UILabel *)v6->_sizeLabel setFont:v8];
    v38 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [(UILabel *)v6->_sizeLabel setTextColor:v38];

    [(UILabel *)v6->_sizeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v6->_sizeLabel setAccessibilityIdentifier:@"Size"];
    [(UILabel *)v6->_sizeLabel setNumberOfLines:1];
    [(UILabel *)v6->_sizeLabel setLineBreakMode:4];
    [(UILabel *)v6->_sizeLabel setAdjustsFontForContentSizeCategory:1];
    LODWORD(v39) = 1148846080;
    [(UILabel *)v6->_sizeLabel setContentHuggingPriority:0 forAxis:v39];
    LODWORD(v40) = 1148846080;
    [(UILabel *)v6->_sizeLabel setContentCompressionResistancePriority:0 forAxis:v40];
    [v7 addSubview:v6->_sizeLabel];
    [v9 addObject:v6->_sizeLabel];
    uint64_t v41 = objc_msgSend(objc_alloc(MEMORY[0x263F1C3D8]), "initWithFrame:", v11, v12, v13, v14);
    spinner = v6->_spinner;
    v6->_spinner = (UIActivityIndicatorView *)v41;

    [(UIActivityIndicatorView *)v6->_spinner setEnabled:0];
    [(UIActivityIndicatorView *)v6->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)v6->_spinner setAccessibilityIdentifier:@"Spinner"];
    [(UIActivityIndicatorView *)v6->_spinner setHidesWhenStopped:1];
    LODWORD(v43) = 1148846080;
    [(UIActivityIndicatorView *)v6->_spinner setContentHuggingPriority:0 forAxis:v43];
    LODWORD(v44) = 1148846080;
    [(UIActivityIndicatorView *)v6->_spinner setContentCompressionResistancePriority:0 forAxis:v44];
    [v7 addSubview:v6->_spinner];
    [v9 addObject:v6->_spinner];
    [v7 setAccessibilityElements:v9];
    v45 = (void *)MEMORY[0x263F08938];
    v46 = [(STStorageTableCell *)v6 contentView];
    uint64_t v47 = [v45 constraintWithItem:v46 attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:0.0 constant:0.0];
    minHeightConstraint = v6->_minHeightConstraint;
    v6->_minHeightConstraint = (NSLayoutConstraint *)v47;

    LODWORD(v49) = 1144750080;
    [(NSLayoutConstraint *)v6->_minHeightConstraint setPriority:v49];
    uint64_t v50 = [MEMORY[0x263F08938] constraintWithItem:v6->_titleLabel attribute:5 relatedBy:0 toItem:v6->_titleInfoView attribute:5 multiplier:1.0 constant:0.0];
    cloudIconConstraint = v6->_cloudIconConstraint;
    v6->_cloudIconConstraint = (NSLayoutConstraint *)v50;

    uint64_t v52 = [MEMORY[0x263F08938] constraintWithItem:v6->_titleLabel attribute:5 relatedBy:0 toItem:v6->_titleInfoView attribute:5 multiplier:1.0 constant:0.0];
    noCloudIconConstraint = v6->_noCloudIconConstraint;
    v6->_noCloudIconConstraint = (NSLayoutConstraint *)v52;

    [(STStorageTableCell *)v6 setupTitleAndInfoConstraints];
    [(STStorageTableCell *)v6 setNeedsUpdateConstraints];
  }
  return v6;
}

- (void)setupTitleAndInfoConstraints
{
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:16];
  [v3 addObject:self->_noCloudIconConstraint];
  [v3 addObject:self->_cloudIconConstraint];
  v4 = [MEMORY[0x263F08938] constraintWithItem:self->_cloudIconView attribute:5 relatedBy:0 toItem:self->_titleInfoView attribute:5 multiplier:1.0 constant:0.0];
  [v3 addObject:v4];

  v5 = [MEMORY[0x263F08938] constraintWithItem:self->_cloudIconView attribute:12 relatedBy:0 toItem:self->_titleLabel attribute:12 multiplier:1.0 constant:0.0];
  [v3 addObject:v5];

  uint64_t v6 = [MEMORY[0x263F08938] constraintWithItem:self->_cloudIconView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:22.0];
  [v3 addObject:v6];

  [(UIImageView *)self->_cloudIconView sizeToFit];
  [(UIImageView *)self->_cloudIconView size];
  [(NSLayoutConstraint *)self->_cloudIconConstraint setConstant:v7 + 5.0];
  uint64_t v8 = [MEMORY[0x263F08938] constraintWithItem:self->_titleInfoView attribute:6 relatedBy:1 toItem:self->_titleLabel attribute:6 multiplier:1.0 constant:0.0];
  [v3 addObject:v8];

  v9 = [MEMORY[0x263F08938] constraintWithItem:self->_titleLabel attribute:3 relatedBy:0 toItem:self->_titleInfoView attribute:3 multiplier:1.0 constant:0.0];
  [v3 addObject:v9];

  id v10 = [MEMORY[0x263F08938] constraintWithItem:self->_titleInfoView attribute:4 relatedBy:1 toItem:self->_titleLabel attribute:4 multiplier:1.0 constant:0.0];
  [v3 addObject:v10];

  [MEMORY[0x263F08938] activateConstraints:v3];
  double v11 = [MEMORY[0x263EFF980] arrayWithCapacity:4];

  double v12 = [MEMORY[0x263F08938] constraintWithItem:self->_infoLabel attribute:5 relatedBy:0 toItem:self->_titleInfoView attribute:5 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v11 addObject:v12];

  double v13 = [MEMORY[0x263F08938] constraintWithItem:self->_infoLabel attribute:6 relatedBy:-1 toItem:self->_titleInfoView attribute:6 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v11 addObject:v13];

  double v14 = [MEMORY[0x263F08938] constraintWithItem:self->_infoLabel attribute:3 relatedBy:0 toItem:self->_titleLabel attribute:4 multiplier:1.0 constant:2.0];
  [(NSMutableArray *)v11 addObject:v14];

  uint64_t v15 = [MEMORY[0x263F08938] constraintWithItem:self->_titleInfoView attribute:4 relatedBy:1 toItem:self->_infoLabel attribute:4 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v11 addObject:v15];

  infoConstraints = self->_infoConstraints;
  self->_infoConstraints = v11;
}

+ (double)defaultCellHeight
{
  return *MEMORY[0x263F1D600];
}

- (void)createNormalFontConstraints
{
  id v17 = [(STStorageTableCell *)self contentView];
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:16];
  v4 = [MEMORY[0x263F08938] constraintWithItem:self->_iconView attribute:5 relatedBy:0 toItem:v17 attribute:5 multiplier:1.0 constant:15.0];
  [(NSMutableArray *)v3 addObject:v4];

  v5 = [MEMORY[0x263F08938] constraintWithItem:self->_iconView attribute:7 relatedBy:0 toItem:self->_iconView attribute:8 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v3 addObject:v5];

  uint64_t v6 = [MEMORY[0x263F08938] constraintWithItem:self->_iconView attribute:10 relatedBy:0 toItem:v17 attribute:10 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v3 addObject:v6];

  double v7 = [MEMORY[0x263F08938] constraintWithItem:self->_sizeLabel attribute:6 relatedBy:0 toItem:v17 attribute:6 multiplier:1.0 constant:0.0];
  sizeRightConstraint = self->_sizeRightConstraint;
  self->_sizeRightConstraint = v7;

  [(NSMutableArray *)v3 addObject:self->_sizeRightConstraint];
  v9 = [MEMORY[0x263F08938] constraintWithItem:self->_sizeLabel attribute:10 relatedBy:0 toItem:v17 attribute:10 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v3 addObject:v9];

  id v10 = [MEMORY[0x263F08938] constraintWithItem:self->_titleInfoView attribute:5 relatedBy:0 toItem:self->_iconView attribute:6 multiplier:1.0 constant:15.0];
  [(NSMutableArray *)v3 addObject:v10];

  double v11 = [MEMORY[0x263F08938] constraintWithItem:self->_titleInfoView attribute:6 relatedBy:0 toItem:self->_sizeLabel attribute:5 multiplier:1.0 constant:-10.0];
  [(NSMutableArray *)v3 addObject:v11];

  double v12 = [MEMORY[0x263F08938] constraintWithItem:self->_titleInfoView attribute:10 relatedBy:0 toItem:v17 attribute:10 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v3 addObject:v12];

  double v13 = [MEMORY[0x263F08938] constraintWithItem:self->_titleInfoView attribute:10 relatedBy:1 toItem:v17 attribute:10 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v3 addObject:v13];

  double v14 = [MEMORY[0x263F08938] constraintWithItem:self->_spinner attribute:10 relatedBy:0 toItem:v17 attribute:10 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v3 addObject:v14];

  uint64_t v15 = [MEMORY[0x263F08938] constraintWithItem:self->_spinner attribute:6 relatedBy:0 toItem:v17 attribute:6 multiplier:1.0 constant:-10.0];
  [(NSMutableArray *)v3 addObject:v15];

  normalFontConstraints = self->_normalFontConstraints;
  self->_normalFontConstraints = v3;
}

- (void)createLargeFontConstraints
{
  id v18 = [(STStorageTableCell *)self contentView];
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:12];
  v4 = [MEMORY[0x263F08938] constraintWithItem:self->_iconView attribute:5 relatedBy:0 toItem:v18 attribute:5 multiplier:1.0 constant:10.0];
  [(NSMutableArray *)v3 addObject:v4];

  v5 = [MEMORY[0x263F08938] constraintWithItem:self->_iconView attribute:7 relatedBy:0 toItem:self->_iconView attribute:8 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v3 addObject:v5];

  uint64_t v6 = [MEMORY[0x263F08938] constraintWithItem:self->_iconView attribute:4 relatedBy:0 toItem:self->_titleLabel attribute:12 multiplier:1.0 constant:2.0];
  [(NSMutableArray *)v3 addObject:v6];

  double v7 = [MEMORY[0x263F08938] constraintWithItem:self->_titleInfoView attribute:5 relatedBy:0 toItem:self->_iconView attribute:6 multiplier:1.0 constant:15.0];
  [(NSMutableArray *)v3 addObject:v7];

  uint64_t v8 = [MEMORY[0x263F08938] constraintWithItem:self->_titleInfoView attribute:6 relatedBy:0 toItem:v18 attribute:6 multiplier:1.0 constant:-10.0];
  [(NSMutableArray *)v3 addObject:v8];

  v9 = [MEMORY[0x263F08938] constraintWithItem:self->_titleInfoView attribute:3 relatedBy:0 toItem:v18 attribute:3 multiplier:1.0 constant:12.0];
  [(NSMutableArray *)v3 addObject:v9];

  id v10 = [MEMORY[0x263F08938] constraintWithItem:v18 attribute:4 relatedBy:1 toItem:self->_titleInfoView attribute:4 multiplier:1.0 constant:12.0];
  [(NSMutableArray *)v3 addObject:v10];

  double v11 = [MEMORY[0x263F08938] constraintWithItem:self->_sizeLabel attribute:5 relatedBy:0 toItem:self->_iconView attribute:6 multiplier:1.0 constant:15.0];
  [(NSMutableArray *)v3 addObject:v11];

  double v12 = [MEMORY[0x263F08938] constraintWithItem:self->_sizeLabel attribute:6 relatedBy:-1 toItem:v18 attribute:6 multiplier:1.0 constant:-10.0];
  [(NSMutableArray *)v3 addObject:v12];

  double v13 = [MEMORY[0x263F08938] constraintWithItem:self->_sizeLabel attribute:3 relatedBy:0 toItem:self->_titleInfoView attribute:4 multiplier:1.0 constant:2.0];
  [(NSMutableArray *)v3 addObject:v13];

  double v14 = [MEMORY[0x263F08938] constraintWithItem:v18 attribute:4 relatedBy:1 toItem:self->_sizeLabel attribute:4 multiplier:1.0 constant:12.0];
  [(NSMutableArray *)v3 addObject:v14];

  uint64_t v15 = [MEMORY[0x263F08938] constraintWithItem:self->_spinner attribute:10 relatedBy:0 toItem:v18 attribute:10 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v3 addObject:v15];

  v16 = [MEMORY[0x263F08938] constraintWithItem:self->_spinner attribute:6 relatedBy:0 toItem:v18 attribute:6 multiplier:1.0 constant:-10.0];
  [(NSMutableArray *)v3 addObject:v16];

  largeFontConstraints = self->_largeFontConstraints;
  self->_largeFontConstraints = v3;
}

- (void)updateConstraints
{
  v33[1] = *MEMORY[0x263EF8340];
  v3 = [(STStorageTableCell *)self traitCollection];
  v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  uint64_t v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  double v7 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D270]];
  [v6 ascender];
  double v9 = v8;
  [v6 descender];
  double v11 = v9 - v10;
  [v7 ascender];
  double v13 = v12;
  [v7 descender];
  double v15 = v11 + v13 - v14 + 2.0 + 12.0 + 12.0;
  if (IsAccessibilityCategory)
  {
    if (!self->_largeFontConstraints) {
      [(STStorageTableCell *)self createLargeFontConstraints];
    }
    if (self->_normalFontConstraints) {
      objc_msgSend(MEMORY[0x263F08938], "deactivateConstraints:");
    }
    [MEMORY[0x263F08938] activateConstraints:self->_largeFontConstraints];
    [(NSLayoutConstraint *)self->_sizeRightConstraint setActive:0];
    [(UILabel *)self->_infoLabel setNumberOfLines:3];
    double v15 = v11 + 2.0 + v15;
  }
  else
  {
    if (!self->_normalFontConstraints) {
      [(STStorageTableCell *)self createNormalFontConstraints];
    }
    if (self->_largeFontConstraints) {
      objc_msgSend(MEMORY[0x263F08938], "deactivateConstraints:");
    }
    [MEMORY[0x263F08938] activateConstraints:self->_normalFontConstraints];
    uint64_t v16 = [(STStorageTableCell *)self accessoryType];
    double v17 = -15.0;
    if (v16 == 1) {
      double v17 = 0.0;
    }
    [(NSLayoutConstraint *)self->_sizeRightConstraint setConstant:v17];
    [(NSLayoutConstraint *)self->_sizeRightConstraint setActive:1];
    [(UILabel *)self->_infoLabel setNumberOfLines:1];
  }
  int v18 = [(UILabel *)self->_infoLabel isHidden];
  infoConstraints = self->_infoConstraints;
  if (v18) {
    [MEMORY[0x263F08938] deactivateConstraints:infoConstraints];
  }
  else {
    [MEMORY[0x263F08938] activateConstraints:infoConstraints];
  }
  int v20 = [(UIImageView *)self->_cloudIconView isHidden];
  double v21 = (void *)MEMORY[0x263F08938];
  if (v20)
  {
    v33[0] = self->_cloudIconConstraint;
    double v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
    [v21 deactivateConstraints:v22];

    uint64_t v23 = (void *)MEMORY[0x263F08938];
    noCloudIconConstraint = self->_noCloudIconConstraint;
    v24 = (void *)MEMORY[0x263EFF8C0];
    p_noCloudIconConstraint = &noCloudIconConstraint;
  }
  else
  {
    uint64_t v31 = self->_noCloudIconConstraint;
    double v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
    [v21 deactivateConstraints:v26];

    uint64_t v23 = (void *)MEMORY[0x263F08938];
    cloudIconConstraint = self->_cloudIconConstraint;
    v24 = (void *)MEMORY[0x263EFF8C0];
    p_noCloudIconConstraint = &cloudIconConstraint;
  }
  uint64_t v27 = [v24 arrayWithObjects:p_noCloudIconConstraint count:1];
  [v23 activateConstraints:v27];

  double v28 = 39.0;
  if (v15 >= 39.0) {
    double v28 = v15;
  }
  [(NSLayoutConstraint *)self->_minHeightConstraint setConstant:v28];
  [(NSLayoutConstraint *)self->_minHeightConstraint setActive:1];
  [(NSLayoutConstraint *)self->_iconSizeConstraint setActive:1];
  v29.receiver = self;
  v29.super_class = (Class)STStorageTableCell;
  [(STStorageTableCell *)&v29 updateConstraints];
  [(STStorageTableCell *)self setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)STStorageTableCell;
  [(STStorageTableCell *)&v4 traitCollectionDidChange:a3];
  [(STStorageTableCell *)self setNeedsUpdateConstraints];
}

- (void)setIcon:(id)a3
{
}

- (UIImage)icon
{
  return [(UIImageView *)self->_iconView image];
}

- (void)setTitle:(id)a3
{
  objc_super v4 = (__CFString *)a3;
  if ([(__CFString *)v4 length]) {
    v5 = v4;
  }
  else {
    v5 = &stru_26C91D0A0;
  }
  [(UILabel *)self->_titleLabel setText:v5];

  [(STStorageTableCell *)self setNeedsLayout];
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (NSString)info
{
  return [(UILabel *)self->_infoLabel text];
}

- (BOOL)infoHidden
{
  return [(UILabel *)self->_infoLabel isHidden];
}

- (void)setInfoHidden:(BOOL)a3
{
  [(UILabel *)self->_infoLabel setHidden:a3];

  [(STStorageTableCell *)self setNeedsUpdateConstraints];
}

- (NSString)sizeString
{
  v2 = [(UILabel *)self->_sizeLabel text];
  v3 = v2;
  if (!v2) {
    v2 = &stru_26C91D0A0;
  }
  objc_super v4 = v2;

  return v4;
}

- (void)setSize:(int64_t)a3
{
  if (a3 < 0)
  {
    [(STStorageTableCell *)self setSizeString:@"…"];
  }
  else if (self->_size != a3)
  {
    self->_size = a3;
    STFormattedSize();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(STStorageTableCell *)self setSizeString:v4];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)STStorageTableCell;
  -[STStorageTableCell setEnabled:](&v5, sel_setEnabled_);
  [(UILabel *)self->_titleLabel setEnabled:v3];
}

- (BOOL)cloudIconHidden
{
  return [(UIImageView *)self->_cloudIconView isHidden];
}

- (void)setCloudIconHidden:(BOOL)a3
{
  [(UIImageView *)self->_cloudIconView setHidden:a3];
  id v4 = [(STStorageTableCell *)self contentView];
  [v4 setNeedsUpdateConstraints];
}

- (id)_cloudIconColor
{
  return (id)[MEMORY[0x263F1C550] systemGrayColor];
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_cloudIconView, 0);
  objc_storeStrong((id *)&self->_sizeLabel, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleInfoView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_cloudIconConstraint, 0);
  objc_storeStrong((id *)&self->_noCloudIconConstraint, 0);
  objc_storeStrong((id *)&self->_minHeightConstraint, 0);
  objc_storeStrong((id *)&self->_sizeRightConstraint, 0);
  objc_storeStrong((id *)&self->_iconSizeConstraint, 0);
  objc_storeStrong((id *)&self->_infoConstraints, 0);
  objc_storeStrong((id *)&self->_largeFontConstraints, 0);

  objc_storeStrong((id *)&self->_normalFontConstraints, 0);
}

@end