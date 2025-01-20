@interface STStorageTipCell
- (STStorageTipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)_activateOption;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)updateConstraints;
@end

@implementation STStorageTipCell

- (STStorageTipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v45[7] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v44.receiver = self;
  v44.super_class = (Class)STStorageTipCell;
  v9 = [(PSTableCell *)&v44 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    v11 = [(STStorageTipCell *)v9 contentView];
    id v12 = objc_alloc(MEMORY[0x263F1C768]);
    double v13 = *MEMORY[0x263F001A8];
    double v14 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v15 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v16 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v17 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x263F001A8], v14, v15, v16);
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = (UILabel *)v17;

    v19 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    [(UILabel *)v10->_titleLabel setFont:v19];

    [(UILabel *)v10->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v10->_titleLabel setAccessibilityIdentifier:@"Title"];
    [(UILabel *)v10->_titleLabel setAllowsDefaultTighteningForTruncation:1];
    [v11 addSubview:v10->_titleLabel];
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", v13, v14, v15, v16);
    appIconView = v10->_appIconView;
    v10->_appIconView = (UIImageView *)v20;

    [(UIImageView *)v10->_appIconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v10->_appIconView setAccessibilityIdentifier:@"Icon"];
    [(UIImageView *)v10->_appIconView setContentMode:1];
    [v11 addSubview:v10->_appIconView];
    uint64_t v22 = [MEMORY[0x263F1C488] buttonWithType:1];
    enableButton = v10->_enableButton;
    v10->_enableButton = (UIButton *)v22;

    [(UIButton *)v10->_enableButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v10->_enableButton setAccessibilityIdentifier:@"Switch"];
    v24 = v10->_enableButton;
    v25 = [MEMORY[0x263F1C550] systemBlueColor];
    [(UIButton *)v24 setTitleColor:v25 forState:0];

    v26 = v10->_enableButton;
    v27 = [MEMORY[0x263F1C550] systemGrayColor];
    [(UIButton *)v26 setTitleColor:v27 forState:2];

    [(UIButton *)v10->_enableButton addTarget:v10 action:sel__activateOption forControlEvents:0x2000];
    [(UIButton *)v10->_enableButton setEnabled:1];
    [(UIButton *)v10->_enableButton setHidden:1];
    [v11 addSubview:v10->_enableButton];
    uint64_t v28 = [objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
    spinner = v10->_spinner;
    v10->_spinner = (UIActivityIndicatorView *)v28;

    [(UIActivityIndicatorView *)v10->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)v10->_spinner setAccessibilityIdentifier:@"Spinner"];
    [(UIActivityIndicatorView *)v10->_spinner setHidesWhenStopped:1];
    [(UIActivityIndicatorView *)v10->_spinner sizeToFit];
    [(UIActivityIndicatorView *)v10->_spinner bounds];
    v10->_nativeSpinnerWidth = v30;
    [v11 addSubview:v10->_spinner];
    uint64_t v31 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", v13, v14, v15, v16);
    checkIconView = v10->_checkIconView;
    v10->_checkIconView = (UIImageView *)v31;

    [(UIImageView *)v10->_checkIconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v10->_checkIconView setAccessibilityIdentifier:@"CheckIcon"];
    [(UIImageView *)v10->_checkIconView setContentMode:1];
    [(UIImageView *)v10->_checkIconView setHidden:1];
    v33 = [MEMORY[0x263F1C6B0] systemImageNamed:@"checkmark.circle.fill"];
    [(UIImageView *)v10->_checkIconView setImage:v33];

    v34 = [MEMORY[0x263F1C550] systemGreenColor];
    [(UIImageView *)v10->_checkIconView setTintColor:v34];

    [v11 addSubview:v10->_checkIconView];
    uint64_t v35 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v13, v14, v15, v16);
    progressLabel = v10->_progressLabel;
    v10->_progressLabel = (UILabel *)v35;

    v37 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D2C0]];
    [(UILabel *)v10->_progressLabel setFont:v37];

    v38 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [(UILabel *)v10->_progressLabel setTextColor:v38];

    [(UILabel *)v10->_progressLabel setHidden:1];
    [(UILabel *)v10->_progressLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v10->_progressLabel setAccessibilityIdentifier:@"Progress"];
    [(UILabel *)v10->_progressLabel setNumberOfLines:1];
    [(UILabel *)v10->_progressLabel setLineBreakMode:4];
    [v11 addSubview:v10->_progressLabel];
    v39 = [STStorageProgressView alloc];
    [(UIActivityIndicatorView *)v10->_spinner frame];
    uint64_t v40 = -[STStorageProgressView initWithFrame:](v39, "initWithFrame:");
    progressView = v10->_progressView;
    v10->_progressView = (STStorageProgressView *)v40;

    [(STStorageProgressView *)v10->_progressView setPercent:0.0];
    [(STStorageProgressView *)v10->_progressView setHidden:1];
    [(STStorageProgressView *)v10->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(STStorageProgressView *)v10->_progressView setAccessibilityIdentifier:@"ProgressIndicator"];
    [(STStorageProgressView *)v10->_progressView sizeToFit];
    [v11 addSubview:v10->_progressView];
    v45[0] = v10->_titleLabel;
    v45[1] = v10->_appIconView;
    v45[2] = v10->_enableButton;
    v45[3] = v10->_spinner;
    v45[4] = v10->_checkIconView;
    v45[5] = v10->_progressLabel;
    v45[6] = v10->_progressView;
    v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:7];
    [v11 setAccessibilityElements:v42];

    -[STStorageTipCell setSeparatorInset:](v10, "setSeparatorInset:", 0.0, 58.0, 0.0, 0.0);
    [(STStorageTipCell *)v10 refreshCellContentsWithSpecifier:v8];
  }
  return v10;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)STStorageTipCell;
  [(PSTableCell *)&v27 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 propertyForKey:@"stTitle"];
  [(UILabel *)self->_titleLabel setText:v5];
  v6 = [v4 propertyForKey:@"stIcon"];
  if (v6)
  {
    [(UIImageView *)self->_appIconView setImage:v6];
  }
  else
  {
    v7 = [v4 propertyForKey:@"stRepresentedApp"];
    if ([v7 length])
    {
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __53__STStorageTipCell_refreshCellContentsWithSpecifier___block_invoke;
      v26[3] = &unk_264302350;
      v26[4] = self;
      STLoadTableIconForAppID(v7, v26);
    }
    else
    {
      id v8 = (void *)MEMORY[0x263F1C6B0];
      v9 = [(UIImageView *)self->_appIconView traitCollection];
      v10 = [v8 systemImageNamed:@"info.circle" compatibleWithTraitCollection:v9];
      [(UIImageView *)self->_appIconView setImage:v10];
    }
  }
  v11 = [v4 propertyForKey:@"stEnableTitle"];

  id v12 = objc_alloc(MEMORY[0x263F086A0]);
  double v13 = v11;
  if (!v11)
  {
    double v13 = STFrameworkLocStr(@"ST_ENABLE");
  }
  uint64_t v28 = *MEMORY[0x263F814F0];
  double v14 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  v29[0] = v14;
  double v15 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
  double v16 = (void *)[v12 initWithString:v13 attributes:v15];

  if (!v11) {
  [(UIButton *)self->_enableButton setAttributedTitle:v16 forState:0];
  }
  uint64_t v17 = [v4 propertyForKey:@"stTipKind"];
  self->_isOption = [v17 isEqualToString:@"stOptionTip"];

  if (self->_isOption)
  {
    v18 = [v4 propertyForKey:@"stPercent"];
    [v18 floatValue];
    self->_percent = *(float *)&v19;
    if (*(float *)&v19 > 1.0)
    {
      self->_percent = 1.0;
      LODWORD(v19) = 1.0;
      uint64_t v20 = [NSNumber numberWithFloat:v19];

      *(float *)&double v19 = self->_percent;
      v18 = (void *)v20;
    }
    if (*(float *)&v19 == 0.0 || *(float *)&v19 == 1.0)
    {
      [(UIActivityIndicatorView *)self->_spinner stopAnimating];
      [(STStorageProgressView *)self->_progressView setHidden:1];
      [(UILabel *)self->_progressLabel setHidden:1];
      [(UILabel *)self->_progressLabel setText:0];
    }
    else if (*(float *)&v19 >= 0.0)
    {
      [(UIActivityIndicatorView *)self->_spinner stopAnimating];
      [(STStorageProgressView *)self->_progressView setPercent:self->_percent];
      [(STStorageProgressView *)self->_progressView setHidden:0];
      uint64_t v23 = PercentString_onceToken;
      id v24 = v18;
      if (v23 != -1) {
        dispatch_once(&PercentString_onceToken, &__block_literal_global_4);
      }
      v25 = [(id)PercentString__formatter stringFromNumber:v24];

      [(UILabel *)self->_progressLabel setText:v25];
      [(UILabel *)self->_progressLabel setHidden:0];
    }
    else
    {
      [(STStorageProgressView *)self->_progressView setHidden:1];
      [(UIActivityIndicatorView *)self->_spinner startAnimating];
      v21 = [v4 propertyForKey:@"stActivating"];
      [(UILabel *)self->_progressLabel setText:v21];

      uint64_t v22 = [(UILabel *)self->_progressLabel text];
      -[UILabel setHidden:](self->_progressLabel, "setHidden:", [v22 length] == 0);
    }
    [(UIButton *)self->_enableButton setHidden:self->_percent != 0.0];
    [(UIImageView *)self->_checkIconView setHidden:self->_percent < 1.0];
  }
  [(STStorageTipCell *)self setNeedsUpdateConstraints];
  [(STStorageTipCell *)self setNeedsDisplay];
}

- (void)updateConstraints
{
  v3 = [(STStorageTipCell *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  v70 = self->_hformat;
  v71 = self->_h2format;
  double titleWidth = self->_titleWidth;
  double enableWidth = self->_enableWidth;
  double progressWidth = self->_progressWidth;
  [(UILabel *)self->_titleLabel sizeToFit];
  [(UIButton *)self->_enableButton sizeToFit];
  [(UILabel *)self->_progressLabel sizeToFit];
  [(UILabel *)self->_titleLabel bounds];
  self->_double titleWidth = v8;
  [(UIButton *)self->_enableButton bounds];
  self->_double enableWidth = v9;
  [(UILabel *)self->_progressLabel bounds];
  self->_double progressWidth = v10;
  hformat = self->_hformat;
  self->_hformat = (NSString *)@"H:|-59-[_titleLabel]-15-|";

  h2format = self->_h2format;
  self->_h2format = 0;

  if (IsAccessibilityCategory)
  {
    double v14 = v70;
    double v13 = v71;
    if (!self->_isOption) {
      goto LABEL_21;
    }
    float percent = self->_percent;
    if (percent == 0.0)
    {
      double v16 = self->_h2format;
      uint64_t v17 = @"H:|-59-[_enableButton(==enableWidth)]";
    }
    else if (percent >= 1.0)
    {
      double v16 = self->_h2format;
      uint64_t v17 = @"H:|-59-[_checkIconView(==56)]";
    }
    else
    {
      double v16 = self->_h2format;
      if (percent >= 0.0) {
        uint64_t v17 = @"H:|-59-[_progressLabel(==progressWidth)]-6-[_progressView(==48)]";
      }
      else {
        uint64_t v17 = @"H:|-59-[_progressLabel(==progressWidth)]-6-[_spinner(==spinnerWidth)]";
      }
    }
    self->_h2format = &v17->isa;
  }
  else
  {
    double v14 = v70;
    double v13 = v71;
    if (!self->_isOption) {
      goto LABEL_21;
    }
    float v18 = self->_percent;
    if (v18 == 0.0)
    {
      double v16 = self->_hformat;
      double v19 = @"H:|-59-[_titleLabel]-6-[_enableButton(==enableWidth)]-15-|";
    }
    else if (v18 >= 1.0)
    {
      double v16 = self->_hformat;
      double v19 = @"H:|-59-[_titleLabel]-6-[_checkIconView(==28)]-15-|";
    }
    else
    {
      double v16 = self->_hformat;
      if (v18 >= 0.0) {
        double v19 = @"H:|-59-[_titleLabel]-6-[_progressLabel(==progressWidth)]-6-[_progressView(==24)]-15-|";
      }
      else {
        double v19 = @"H:|-59-[_titleLabel]-6-[_progressLabel(==progressWidth)]-6-[_spinner(==spinnerWidth)]-15-|";
      }
    }
    self->_hformat = &v19->isa;
  }

LABEL_21:
  if (v14 != self->_hformat)
  {
    double v20 = self->_titleWidth;
    goto LABEL_23;
  }
  double v20 = self->_titleWidth;
  if (v13 != self->_h2format
    || titleWidth != v20
    || enableWidth != self->_enableWidth
    || progressWidth != self->_progressWidth)
  {
LABEL_23:
    v21 = [NSNumber numberWithDouble:v20];
    uint64_t v22 = [NSNumber numberWithDouble:self->_enableWidth];
    double nativeSpinnerWidth = self->_nativeSpinnerWidth;
    if (IsAccessibilityCategory) {
      double nativeSpinnerWidth = nativeSpinnerWidth + nativeSpinnerWidth;
    }
    uint64_t v24 = [NSNumber numberWithDouble:nativeSpinnerWidth];
    uint64_t v25 = [NSNumber numberWithDouble:self->_progressWidth];
    v26 = _NSDictionaryOfVariableBindings(&cfstr_AppiconviewTit.isa, self->_appIconView, self->_titleLabel, self->_enableButton, self->_spinner, self->_checkIconView, self->_progressLabel, self->_progressView, 0);
    v68 = (void *)v25;
    v69 = (void *)v24;
    uint64_t v27 = _NSDictionaryOfVariableBindings(&cfstr_TitlewidthSpin.isa, v21, v24, v22, v25, 0);
    if ([(NSMutableArray *)self->_constraints count]) {
      [MEMORY[0x263F08938] deactivateConstraints:self->_constraints];
    }
    uint64_t v28 = [MEMORY[0x263EFF980] array];
    constraints = self->_constraints;
    self->_constraints = v28;

    double v30 = self->_constraints;
    uint64_t v31 = [MEMORY[0x263F08938] constraintsWithVisualFormat:self->_hformat options:0 metrics:v27 views:v26];
    [(NSMutableArray *)v30 addObjectsFromArray:v31];

    v32 = self->_h2format;
    if (v32)
    {
      v33 = self->_constraints;
      v34 = [MEMORY[0x263F08938] constraintsWithVisualFormat:v32 options:0 metrics:v27 views:v26];
      [(NSMutableArray *)v33 addObjectsFromArray:v34];
    }
    [(UILabel *)self->_titleLabel setNumberOfLines:2];
    [(UILabel *)self->_titleLabel setLineBreakMode:0];
    uint64_t v35 = self->_constraints;
    v36 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-15-[_appIconView(==29)]" options:0 metrics:0 views:v26];
    [(NSMutableArray *)v35 addObjectsFromArray:v36];

    v37 = self->_constraints;
    if (IsAccessibilityCategory)
    {
      v38 = [MEMORY[0x263F08938] constraintWithItem:self->_appIconView attribute:4 relatedBy:0 toItem:self->_titleLabel attribute:12 multiplier:1.0 constant:2.0];
      [(NSMutableArray *)v37 addObject:v38];

      v39 = self->_constraints;
      uint64_t v40 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[_appIconView(==29)]-(>=8)-|" options:0 metrics:0 views:v26];
      [(NSMutableArray *)v39 addObjectsFromArray:v40];

      v41 = self->_constraints;
      v42 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-13-[_titleLabel]-(>=8)-|" options:0 metrics:0 views:v26];
      [(NSMutableArray *)v41 addObjectsFromArray:v42];

      if (([(UILabel *)self->_progressLabel isHidden] & 1) == 0)
      {
        v43 = self->_constraints;
        objc_super v44 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-13-[_titleLabel]-1-[_progressLabel]-(>=8)-|" options:0 metrics:0 views:v26];
        [(NSMutableArray *)v43 addObjectsFromArray:v44];
      }
      v45 = (void *)v27;
      if (([(UIActivityIndicatorView *)self->_spinner isHidden] & 1) == 0)
      {
        v46 = self->_constraints;
        v47 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[_titleLabel]-8-[_spinner]-(>=8)-|" options:0 metrics:0 views:v26];
        [(NSMutableArray *)v46 addObjectsFromArray:v47];
      }
      double v14 = v70;
      v49 = v68;
      v48 = v21;
      if (([(STStorageProgressView *)self->_progressView isHidden] & 1) == 0)
      {
        v50 = self->_constraints;
        v51 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[_titleLabel]-6-[_progressView(==48)]-(>=8)-|" options:0 metrics:v45 views:v26];
        [(NSMutableArray *)v50 addObjectsFromArray:v51];
      }
      if (([(UIButton *)self->_enableButton isHidden] & 1) == 0)
      {
        v52 = self->_constraints;
        v53 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[_titleLabel]-1-[_enableButton]-(>=8)-|" options:0 metrics:0 views:v26];
        [(NSMutableArray *)v52 addObjectsFromArray:v53];
      }
      if ([(UIImageView *)self->_checkIconView isHidden]) {
        goto LABEL_42;
      }
      v54 = self->_constraints;
      v55 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[_titleLabel]-10-[_checkIconView(==56)]-(>=8)-|" options:0 metrics:0 views:v26];
      [(NSMutableArray *)v54 addObjectsFromArray:v55];
    }
    else
    {
      v56 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-7-[_appIconView(==29)]-(>=8)-|" options:0 metrics:0 views:v26];
      [(NSMutableArray *)v37 addObjectsFromArray:v56];

      v57 = self->_constraints;
      v58 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-13-[_titleLabel]-(>=8)-|" options:0 metrics:0 views:v26];
      [(NSMutableArray *)v57 addObjectsFromArray:v58];

      v59 = self->_constraints;
      v60 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-14-[_progressLabel]" options:0 metrics:0 views:v26];
      [(NSMutableArray *)v59 addObjectsFromArray:v60];

      v61 = self->_constraints;
      v62 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-13-[_spinner]" options:0 metrics:0 views:v26];
      [(NSMutableArray *)v61 addObjectsFromArray:v62];

      v63 = self->_constraints;
      v45 = (void *)v27;
      v64 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-10-[_progressView(==24)]" options:0 metrics:v27 views:v26];
      [(NSMutableArray *)v63 addObjectsFromArray:v64];

      v65 = self->_constraints;
      v66 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-7-[_enableButton]" options:0 metrics:0 views:v26];
      [(NSMutableArray *)v65 addObjectsFromArray:v66];

      v67 = self->_constraints;
      v55 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-10-[_checkIconView(==28)]" options:0 metrics:0 views:v26];
      [(NSMutableArray *)v67 addObjectsFromArray:v55];
      double v14 = v70;
      v49 = v68;
      v48 = v21;
    }

LABEL_42:
    [MEMORY[0x263F08938] activateConstraints:self->_constraints];

    double v13 = v71;
  }
  v73.receiver = self;
  v73.super_class = (Class)STStorageTipCell;
  [(STStorageTipCell *)&v73 updateConstraints];
}

uint64_t __53__STStorageTipCell_refreshCellContentsWithSpecifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 1200) setImage:a2];
}

- (void)_activateOption
{
  id v3 = [(PSTableCell *)self specifier];
  v2 = [NSNumber numberWithBool:1];
  [v3 performSetterWithValue:v2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_h2format, 0);
  objc_storeStrong((id *)&self->_hformat, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_enableButton, 0);
  objc_storeStrong((id *)&self->_checkIconView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_appIconView, 0);

  objc_storeStrong((id *)&self->_constraints, 0);
}

@end