@interface PSCapacityBarCell
+ (id)specifierWithTitle:(id)a3;
+ (id)specifierWithTitle:(id)a3 useStandardFontSizeForSizeLabel:(BOOL)a4;
- (PSCapacityBarCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (PSCapacityBarCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)usageString:(id)a3;
- (void)addHorizontalLegends;
- (void)addVerticalLegends;
- (void)createCommonConstraints;
- (void)createLargeConstraints;
- (void)createLegends:(id)a3;
- (void)createNormalConstraints;
- (void)initializeViews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation PSCapacityBarCell

+ (id)specifierWithTitle:(id)a3
{
  id v3 = a3;
  v4 = +[PSSpecifier preferenceSpecifierNamed:&stru_1EFB51FD0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
  [v4 setProperty:objc_opt_class() forKey:@"cellClass"];
  [v4 setProperty:v3 forKey:@"label"];

  return v4;
}

+ (id)specifierWithTitle:(id)a3 useStandardFontSizeForSizeLabel:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = [a1 specifierWithTitle:a3];
  v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  [v5 setProperty:v6 forKey:@"psCapBarSizeLblUsesStandardFont"];

  return v5;
}

- (PSCapacityBarCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PSCapacityBarCell;
  BOOL v4 = [(PSCapacityBarCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(PSCapacityBarCell *)v4 initializeViews];
  }
  return v5;
}

- (PSCapacityBarCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PSCapacityBarCell;
  v9 = [(PSTableCell *)&v12 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    [(PSCapacityBarCell *)v9 initializeViews];
    [(PSCapacityBarCell *)v10 refreshCellContentsWithSpecifier:v8];
  }

  return v10;
}

- (void)initializeViews
{
  v38[4] = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)PSCapacityBarCell;
  id v3 = [(PSTableCell *)&v37 titleLabel];
  [v3 setText:0];

  v36.receiver = self;
  v36.super_class = (Class)PSCapacityBarCell;
  BOOL v4 = [(PSTableCell *)&v36 titleLabel];
  [v4 setHidden:1];

  v5 = [(PSCapacityBarCell *)self contentView];
  [v5 layoutIfNeeded];
  v6 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  bigFont = self->_bigFont;
  self->_bigFont = v6;

  id v8 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C8]];
  v9 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43880]];
  legendFont = self->_legendFont;
  self->_legendFont = v9;

  id v11 = objc_alloc(MEMORY[0x1E4F42B38]);
  double v12 = *MEMORY[0x1E4F1DB28];
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v16 = (UILabel *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], v13, v14, v15);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v16;

  [(UILabel *)self->_titleLabel setFont:self->_bigFont];
  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:@"Title"];
  [(UILabel *)self->_titleLabel setNumberOfLines:1];
  [(UILabel *)self->_titleLabel setLineBreakMode:4];
  [(UILabel *)self->_titleLabel setAllowsDefaultTighteningForTruncation:1];
  [(UILabel *)self->_titleLabel setAdjustsFontForContentSizeCategory:1];
  LODWORD(v18) = 1132068864;
  [(UILabel *)self->_titleLabel setContentHuggingPriority:0 forAxis:v18];
  [v5 addSubview:self->_titleLabel];
  v19 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v12, v13, v14, v15);
  sizeLabel = self->_sizeLabel;
  self->_sizeLabel = v19;

  [(UILabel *)self->_sizeLabel setFont:v8];
  [(UILabel *)self->_sizeLabel setEnabled:0];
  [(UILabel *)self->_sizeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_sizeLabel setAccessibilityIdentifier:@"Size"];
  [(UILabel *)self->_sizeLabel setNumberOfLines:1];
  [(UILabel *)self->_sizeLabel setLineBreakMode:4];
  [(UILabel *)self->_sizeLabel setAllowsDefaultTighteningForTruncation:1];
  [(UILabel *)self->_sizeLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_sizeLabel setAdjustsFontForContentSizeCategory:1];
  LODWORD(v21) = 1144750080;
  [(UILabel *)self->_sizeLabel setContentHuggingPriority:0 forAxis:v21];
  [v5 addSubview:self->_sizeLabel];
  v22 = -[PSCapacityBarView initWithFrame:]([PSCapacityBarView alloc], "initWithFrame:", v12, v13, v14, v15);
  barView = self->_barView;
  self->_barView = v22;

  [(PSCapacityBarView *)self->_barView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PSCapacityBarView *)self->_barView setAccessibilityIdentifier:@"CategoryBar"];
  [v5 addSubview:self->_barView];
  v24 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42E20]), "initWithFrame:", v12, v13, v14, v15);
  legendView = self->_legendView;
  self->_legendView = v24;

  [(UIStackView *)self->_legendView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_legendView setAccessibilityIdentifier:@"Legend"];
  LODWORD(v26) = 1148846080;
  [(UIStackView *)self->_legendView setContentHuggingPriority:1 forAxis:v26];
  [v5 addSubview:self->_legendView];
  v27 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v12, v13, v14, v15);
  loadingLabel = self->_loadingLabel;
  self->_loadingLabel = v27;

  [(UILabel *)self->_loadingLabel setFont:self->_legendFont];
  [(UILabel *)self->_loadingLabel setEnabled:0];
  [(UILabel *)self->_loadingLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_loadingLabel setAccessibilityIdentifier:@"Calculating"];
  [(UILabel *)self->_loadingLabel setNumberOfLines:1];
  [(UILabel *)self->_loadingLabel setLineBreakMode:0];
  [(UILabel *)self->_loadingLabel setAdjustsFontForContentSizeCategory:1];
  v29 = [[PSCapacityBarLegendView alloc] initWithCapacityBarCategory:0];
  otherLegend = self->_otherLegend;
  self->_otherLegend = v29;

  id WeakRetained = objc_loadWeakRetained((id *)&self->super._specifier);
  v32 = [WeakRetained propertyForKey:@"psCapBarHideLegend"];
  self->_hideLegend = [v32 BOOLValue];

  v33 = self->_sizeLabel;
  v38[0] = self->_titleLabel;
  v38[1] = v33;
  v34 = self->_legendView;
  v38[2] = self->_barView;
  v38[3] = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
  [v5 setAccessibilityElements:v35];

  [(PSCapacityBarCell *)self setNeedsUpdateConstraints];
  [(PSCapacityBarCell *)self setNeedsLayout];
}

- (void)createNormalConstraints
{
  id v11 = [(PSCapacityBarCell *)self contentView];
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:6];
  BOOL v4 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_titleLabel attribute:5 relatedBy:0 toItem:v11 attribute:5 multiplier:1.0 constant:15.0];
  [(NSMutableArray *)v3 addObject:v4];

  v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_titleLabel attribute:6 relatedBy:0 toItem:self->_sizeLabel attribute:5 multiplier:1.0 constant:-12.0];
  [(NSMutableArray *)v3 addObject:v5];

  v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_sizeLabel attribute:6 relatedBy:0 toItem:v11 attribute:6 multiplier:1.0 constant:-15.0];
  [(NSMutableArray *)v3 addObject:v6];

  objc_super v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_titleLabel attribute:3 relatedBy:0 toItem:v11 attribute:3 multiplier:1.0 constant:10.0];
  [(NSMutableArray *)v3 addObject:v7];

  id v8 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_sizeLabel attribute:12 relatedBy:0 toItem:self->_titleLabel attribute:12 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v3 addObject:v8];

  v9 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_barView attribute:3 relatedBy:0 toItem:self->_titleLabel attribute:4 multiplier:1.0 constant:10.0];
  [(NSMutableArray *)v3 addObject:v9];

  normalConstraints = self->_normalConstraints;
  self->_normalConstraints = v3;
}

- (void)createLargeConstraints
{
  id v14 = [(PSCapacityBarCell *)self contentView];
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:9];
  BOOL v4 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_titleLabel attribute:5 relatedBy:0 toItem:v14 attribute:5 multiplier:1.0 constant:15.0];
  [(NSMutableArray *)v3 addObject:v4];

  v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_titleLabel attribute:6 relatedBy:-1 toItem:v14 attribute:6 multiplier:1.0 constant:-15.0];
  [(NSMutableArray *)v3 addObject:v5];

  v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_sizeLabel attribute:5 relatedBy:0 toItem:v14 attribute:5 multiplier:1.0 constant:15.0];
  [(NSMutableArray *)v3 addObject:v6];

  objc_super v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_sizeLabel attribute:6 relatedBy:-1 toItem:v14 attribute:6 multiplier:1.0 constant:-15.0];
  [(NSMutableArray *)v3 addObject:v7];

  id v8 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_titleLabel attribute:3 relatedBy:0 toItem:v14 attribute:3 multiplier:1.0 constant:10.0];
  [(NSMutableArray *)v3 addObject:v8];

  v9 = [MEMORY[0x1E4F28DC8] constraintWithItem:v14 attribute:4 relatedBy:1 toItem:self->_titleLabel attribute:4 multiplier:1.0 constant:10.0];
  [(NSMutableArray *)v3 addObject:v9];

  v10 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_sizeLabel attribute:3 relatedBy:0 toItem:self->_titleLabel attribute:4 multiplier:1.0 constant:4.0];
  [(NSMutableArray *)v3 addObject:v10];

  id v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:v14 attribute:4 relatedBy:1 toItem:self->_sizeLabel attribute:4 multiplier:1.0 constant:10.0];
  [(NSMutableArray *)v3 addObject:v11];

  double v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_barView attribute:3 relatedBy:0 toItem:self->_sizeLabel attribute:4 multiplier:1.0 constant:10.0];
  [(NSMutableArray *)v3 addObject:v12];

  largeConstraints = self->_largeConstraints;
  self->_largeConstraints = v3;
}

- (void)createCommonConstraints
{
  id v17 = [(PSCapacityBarCell *)self contentView];
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
  BOOL v4 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_barView attribute:5 relatedBy:0 toItem:v17 attribute:5 multiplier:1.0 constant:12.0];
  [(NSMutableArray *)v3 addObject:v4];

  v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_barView attribute:6 relatedBy:0 toItem:v17 attribute:6 multiplier:1.0 constant:-12.0];
  [(NSMutableArray *)v3 addObject:v5];

  v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:v17 attribute:4 relatedBy:1 toItem:self->_barView attribute:4 multiplier:1.0 constant:10.0];
  [(NSMutableArray *)v3 addObject:v6];

  objc_super v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_barView attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:0.0 constant:16.0];
  barHeightConstraint = self->_barHeightConstraint;
  self->_barHeightConstraint = v7;

  [(NSMutableArray *)v3 addObject:self->_barHeightConstraint];
  commonConstraints = self->_commonConstraints;
  self->_commonConstraints = v3;
  v10 = v3;

  id v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];

  double v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_legendView attribute:5 relatedBy:0 toItem:v17 attribute:5 multiplier:1.0 constant:15.0];
  [(NSMutableArray *)v11 addObject:v12];

  double v13 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_legendView attribute:6 relatedBy:-1 toItem:v17 attribute:6 multiplier:1.0 constant:-15.0];
  [(NSMutableArray *)v11 addObject:v13];

  id v14 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_legendView attribute:3 relatedBy:0 toItem:self->_barView attribute:4 multiplier:1.0 constant:10.0];
  [(NSMutableArray *)v11 addObject:v14];

  double v15 = [MEMORY[0x1E4F28DC8] constraintWithItem:v17 attribute:4 relatedBy:1 toItem:self->_legendView attribute:4 multiplier:1.0 constant:10.0];
  [(NSMutableArray *)v11 addObject:v15];

  legendConstraints = self->_legendConstraints;
  self->_legendConstraints = v11;
}

- (void)addVerticalLegends
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(UIStackView *)self->_legendView setAxis:1];
  [(UIStackView *)self->_legendView setAlignment:1];
  [(UIFont *)self->_legendFont leading];
  [(UIStackView *)self->_legendView setSpacing:v3 * 1.5];
  BOOL v4 = self->_legends;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if (*(PSCapacityBarLegendView **)(*((void *)&v9 + 1) + 8 * i) != self->_otherLegend) {
          -[UIStackView addArrangedSubview:](self->_legendView, "addArrangedSubview:");
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  if (self->_showOtherLegend && [(NSArray *)v4 containsObject:self->_otherLegend]) {
    [(UIStackView *)self->_legendView addArrangedSubview:self->_otherLegend];
  }
}

- (void)addHorizontalLegends
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(UIStackView *)self->_legendView setAxis:0];
  [(UIStackView *)self->_legendView setAlignment:4];
  [(UIStackView *)self->_legendView setSpacing:12.0];
  double v3 = self->_legends;
  [(PSCapacityBarLegendView *)self->_otherLegend layoutIfNeeded];
  BOOL v4 = [(PSCapacityBarCell *)self contentView];
  [v4 frame];
  double v6 = v5 + -30.0;

  if (self->_showOtherLegend)
  {
    [(PSCapacityBarLegendView *)self->_otherLegend frame];
    double v6 = v6 - v7;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v3;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(PSCapacityBarLegendView **)(*((void *)&v15 + 1) + 8 * i);
        if (v13 != self->_otherLegend)
        {
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "layoutIfNeeded", (void)v15);
          [(PSCapacityBarLegendView *)v13 frame];
          double v6 = v6 - (v14 + 12.0);
          if (v6 < 0.0) {
            goto LABEL_13;
          }
          [(UIStackView *)self->_legendView addArrangedSubview:v13];
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
LABEL_13:

  if (self->_showOtherLegend && [(NSArray *)v8 containsObject:self->_otherLegend]) {
    [(UIStackView *)self->_legendView addArrangedSubview:self->_otherLegend];
  }
}

- (void)updateConstraints
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  double v3 = [(PSCapacityBarCell *)self traitCollection];
  BOOL v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
  {
    p_largeConstraints = &self->_largeConstraints;
    if (!self->_largeConstraints) {
      [(PSCapacityBarCell *)self createLargeConstraints];
    }
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    if (!self->_normalConstraints) {
      goto LABEL_10;
    }
LABEL_9:
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
    uint64_t v8 = v7;
    goto LABEL_10;
  }
  p_largeConstraints = &self->_normalConstraints;
  if (!self->_normalConstraints) {
    [(PSCapacityBarCell *)self createNormalConstraints];
  }
  uint64_t v7 = 2;
  uint64_t v8 = 2;
  if (self->_largeConstraints) {
    goto LABEL_9;
  }
LABEL_10:
  [MEMORY[0x1E4F28DC8] activateConstraints:*p_largeConstraints];
  [(UILabel *)self->_sizeLabel setTextAlignment:v8];
  if (!self->_commonConstraints)
  {
    [(PSCapacityBarCell *)self createCommonConstraints];
    [MEMORY[0x1E4F28DC8] activateConstraints:self->_commonConstraints];
  }
  uint64_t v9 = [(UILabel *)self->_titleLabel font];
  [v9 lineHeight];
  double v11 = v10;

  double v12 = 16.0;
  if (v11 >= 16.0)
  {
    double v12 = v11;
    if (v11 > 32.0) {
      double v12 = 32.0;
    }
  }
  [(NSLayoutConstraint *)self->_barHeightConstraint setConstant:v12];
  if (self->_hideLegend)
  {
    [(UIStackView *)self->_legendView setHidden:1];
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_legendConstraints];
    double v13 = [(UIStackView *)self->_legendView subviews];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v15);
    }
  }
  else
  {
    [MEMORY[0x1E4F28DC8] activateConstraints:self->_legendConstraints];
    double v13 = [(UIStackView *)self->_legendView subviews];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v18 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * j) removeFromSuperview];
        }
        uint64_t v19 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v19);
    }
    if (IsAccessibilityCategory) {
      [(PSCapacityBarCell *)self addVerticalLegends];
    }
    else {
      [(PSCapacityBarCell *)self addHorizontalLegends];
    }
    [(UIStackView *)self->_legendView setHidden:0];
  }

  v22.receiver = self;
  v22.super_class = (Class)PSCapacityBarCell;
  [(PSCapacityBarCell *)&v22 updateConstraints];
}

- (void)createLegends:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [a3 orderedCategories];
  if ([v4 count] && !self->_forceLoading)
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count") + 1);
    uint64_t v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v17 = v4;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v13 bytes])
          {
            uint64_t v14 = [v13 identifier];
            char v15 = [v14 isEqualToString:@"_CAT_OTHER_"];

            if ((v15 & 1) == 0)
            {
              uint64_t v16 = [[PSCapacityBarLegendView alloc] initWithCapacityBarCategory:v13];
              [(PSCapacityBarLegendView *)v16 setTextColor:self->_legendTextColor];
              [(NSArray *)v7 addObject:v16];
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    if (self->_showOtherLegend)
    {
      [(PSCapacityBarLegendView *)self->_otherLegend setTextColor:self->_legendTextColor];
      [(NSArray *)v7 addObject:self->_otherLegend];
    }
    legends = self->_legends;
    self->_legends = v7;
    BOOL v4 = v17;
  }
  else
  {
    v23[0] = self->_loadingLabel;
    double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    legends = self->_legends;
    self->_legends = v5;
  }
}

- (id)usageString:(id)a3
{
  id v4 = a3;
  if ([v4 capacity])
  {
    uint64_t v5 = [v4 bytesUsed];
    uint64_t v6 = 1000;
    if (self->_sizesAreMem) {
      uint64_t v6 = 1024;
    }
    uint64_t v7 = 0x40000000;
    if (!self->_sizesAreMem) {
      uint64_t v7 = 1000000000;
    }
    if (v7 < v5)
    {
      double v8 = (double)v5 / (double)v7;
      double v9 = (double)v6;
      while (v8 > v9)
      {
        double v8 = v8 / v9;
        v7 *= v6;
      }
    }
    uint64_t v11 = NSLocalizedFileSizeDescription();
    double v12 = NSLocalizedFileSizeDescription();
    objc_msgSend(NSString, "stringWithFormat:", self->_sizeFormat, v11, v12);
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v10 = &stru_1EFB51FD0;
  }

  return v10;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PSCapacityBarCell;
  [(PSTableCell *)&v37 refreshCellContentsWithSpecifier:v4];
  uint64_t v5 = [v4 propertyForKey:@"psCapBarLoading"];
  if (v5)
  {
    [(UILabel *)self->_loadingLabel setText:v5];
  }
  else
  {
    uint64_t v6 = PSStorageLocStr(@"CALC_BAR_LOADING");
    [(UILabel *)self->_loadingLabel setText:v6];
  }
  uint64_t v7 = [v4 propertyForKey:@"psCapBarOtherDataLegendText"];
  if (v7)
  {
    p_otherLegend = &self->_otherLegend;
    [(PSCapacityBarLegendView *)self->_otherLegend setText:v7];
  }
  else
  {
    double v9 = PSStorageLocStr(@"OTHER");
    p_otherLegend = &self->_otherLegend;
    [(PSCapacityBarLegendView *)self->_otherLegend setText:v9];
  }
  uint64_t v10 = [v4 propertyForKey:@"psCapBarSizesAreMem"];
  self->_sizesAreMem = [v10 BOOLValue];

  uint64_t v11 = [v4 propertyForKey:@"psCapBarSizeFormat"];
  double v12 = v11;
  if (!v11)
  {
    double v12 = PSStorageLocStr(@"USED_OF_FMT");
  }
  objc_storeStrong((id *)&self->_sizeFormat, v12);
  if (!v11) {

  }
  double v13 = [v4 propertyForKey:@"psCapBarData"];
  uint64_t v14 = [(PSCapacityBarCell *)self usageString:v13];
  v36.receiver = self;
  v36.super_class = (Class)PSCapacityBarCell;
  char v15 = [(PSTableCell *)&v36 titleLabel];
  [v15 setText:v14];

  [(UILabel *)self->_sizeLabel setText:v14];
  -[UILabel setHidden:](self->_sizeLabel, "setHidden:", [v14 length] == 0);
  uint64_t v16 = [v4 propertyForKey:@"psCapBarSizeLblUsesStandardFont"];
  int v17 = [v16 BOOLValue];

  if (v17) {
    [(UILabel *)self->_sizeLabel setFont:self->_bigFont];
  }
  long long v18 = [v4 propertyForKey:@"psCapBarBackgroundColor"];
  [(PSCapacityBarView *)self->_barView setBarBackgroundColor:v18];

  long long v19 = [v4 propertyForKey:@"psCapBarOtherDataColor"];
  [(PSCapacityBarView *)self->_barView setBarOtherDataColor:v19];

  long long v20 = [v4 propertyForKey:@"psCapBarSeparatorColor"];
  [(PSCapacityBarView *)self->_barView setBarSeparatorColor:v20];

  long long v21 = [v4 propertyForKey:@"psCapBarBackgroundColor"];
  [(PSCapacityBarView *)self->_barView setBarBackgroundColor:v21];

  objc_super v22 = [v4 propertyForKey:@"psCapBarTitleTextColor"];
  if (v22)
  {
    p_titleLabel = &self->_titleLabel;
    [(UILabel *)self->_titleLabel setTextColor:v22];
  }
  else
  {
    long long v24 = [MEMORY[0x1E4F428B8] labelColor];
    p_titleLabel = &self->_titleLabel;
    [(UILabel *)self->_titleLabel setTextColor:v24];
  }
  long long v25 = [v4 propertyForKey:@"psCapBarSizeTextColor"];
  if (v25)
  {
    [(UILabel *)self->_sizeLabel setTextColor:v25];
  }
  else
  {
    long long v26 = [MEMORY[0x1E4F428B8] labelColor];
    [(UILabel *)self->_sizeLabel setTextColor:v26];
  }
  long long v27 = [v4 propertyForKey:@"psCapBarLegendTextColor"];
  long long v28 = v27;
  if (!v27)
  {
    long long v28 = [MEMORY[0x1E4F428B8] labelColor];
  }
  objc_storeStrong((id *)&self->_legendTextColor, v28);
  if (!v27) {

  }
  long long v29 = [(PSCapacityBarView *)self->_barView barOtherDataColor];
  [(PSCapacityBarLegendView *)*p_otherLegend setColor:v29];

  [(PSCapacityBarLegendView *)*p_otherLegend setTextColor:self->_legendTextColor];
  long long v30 = [v4 propertyForKey:@"psCapBarHideLegend"];
  self->_hideLegend = [v30 BOOLValue];

  v31 = [v4 propertyForKey:@"psCapBarShowOtherDataLegend"];
  self->_showOtherLegend = [v31 BOOLValue];

  v32 = [v4 propertyForKey:@"psCapBarForceLoading"];
  self->_forceLoading = [v32 BOOLValue];

  [(PSCapacityBarCell *)self createLegends:v13];
  [(PSCapacityBarView *)self->_barView setBarData:v13];
  uint64_t v33 = [v4 propertyForKey:@"label"];
  v34 = [(UILabel *)*p_titleLabel text];
  char v35 = [v33 isEqualToString:v34];

  if ((v35 & 1) == 0) {
    [(UILabel *)*p_titleLabel setText:v33];
  }
  [(PSCapacityBarCell *)self setNeedsUpdateConstraints];
  [(PSCapacityBarCell *)self setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PSCapacityBarCell;
  [(PSCapacityBarCell *)&v4 traitCollectionDidChange:a3];
  [(PSCapacityBarCell *)self setNeedsUpdateConstraints];
  [(PSCapacityBarCell *)self setNeedsLayout];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeFormat, 0);
  objc_storeStrong((id *)&self->_legendTextColor, 0);
  objc_storeStrong((id *)&self->_bigFont, 0);
  objc_storeStrong((id *)&self->_legendFont, 0);
  objc_storeStrong((id *)&self->_otherLegend, 0);
  objc_storeStrong((id *)&self->_legends, 0);
  objc_storeStrong((id *)&self->_legendView, 0);
  objc_storeStrong((id *)&self->_barView, 0);
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_sizeLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_barHeightConstraint, 0);
  objc_storeStrong((id *)&self->_commonConstraints, 0);
  objc_storeStrong((id *)&self->_legendConstraints, 0);
  objc_storeStrong((id *)&self->_largeConstraints, 0);
  objc_storeStrong((id *)&self->_normalConstraints, 0);
}

@end