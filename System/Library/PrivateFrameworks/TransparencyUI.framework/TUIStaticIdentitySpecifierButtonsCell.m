@interface TUIStaticIdentitySpecifierButtonsCell
+ (int64_t)cellStyle;
- (UIStackView)buttonsStackView;
- (void)markAsVerifiedTapped:(id)a3;
- (void)noMatchTapped:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setButtonsStackView:(id)a3;
@end

@implementation TUIStaticIdentitySpecifierButtonsCell

+ (int64_t)cellStyle
{
  return 0;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v92[1] = *MEMORY[0x263EF8340];
  v77.receiver = self;
  v77.super_class = (Class)TUIStaticIdentitySpecifierButtonsCell;
  id v4 = a3;
  [(PSTableCell *)&v77 refreshCellContentsWithSpecifier:v4];
  v5 = [(PSTableCell *)self titleLabel];
  [v5 setText:&stru_270C3F140];

  v6 = [v4 propertyForKey:*MEMORY[0x263F600A8]];
  v7 = [v4 propertyForKey:*MEMORY[0x263F60308]];

  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"NO_MATCH" value:&stru_270C3F140 table:@"Localizable"];

  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v74 = [v10 localizedStringForKey:@"VERIFIED" value:&stru_270C3F140 table:@"Localizable"];

  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v76 = [v11 localizedStringForKey:@"MARK_AS_VERIFIED_NO_DOTS" value:&stru_270C3F140 table:@"Localizable"];

  v12 = [MEMORY[0x263F1C488] buttonWithType:1];
  v13 = [MEMORY[0x263F1CB00] currentTraitCollection];
  v14 = [v13 preferredContentSizeCategory];
  LODWORD(v5) = UIContentSizeCategoryIsAccessibilityCategory(v14);

  v75 = v9;
  if (v5) {
    goto LABEL_7;
  }
  uint64_t v15 = *MEMORY[0x263F1C238];
  uint64_t v91 = *MEMORY[0x263F1C238];
  v16 = [v12 titleLabel];
  v17 = [v16 font];
  v92[0] = v17;
  v18 = [NSDictionary dictionaryWithObjects:v92 forKeys:&v91 count:1];
  [v9 sizeWithAttributes:v18];
  UICeilToViewScale();
  double v20 = v19;

  v21 = [(TUIStaticIdentitySpecifierButtonsCell *)self _tableView];
  [v21 frame];
  v22 = [(TUIStaticIdentitySpecifierButtonsCell *)self _tableView];
  [v22 layoutMargins];
  v23 = [(TUIStaticIdentitySpecifierButtonsCell *)self _tableView];
  [v23 layoutMargins];
  [(UIStackView *)self->_buttonsStackView spacing];
  UICeilToViewScale();
  double v25 = v24;

  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_21 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_21, &__block_literal_global_178);
  }
  v26 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_21;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    v82 = "-[TUIStaticIdentitySpecifierButtonsCell refreshCellContentsWithSpecifier:]";
    __int16 v83 = 1024;
    BOOL v84 = v20 > v25;
    __int16 v85 = 2048;
    double v86 = v25;
    __int16 v87 = 2048;
    double v88 = v20;
    __int16 v89 = 2114;
    v90 = self;
    _os_log_debug_impl(&dword_260338000, v26, OS_LOG_TYPE_DEBUG, "%s verticalLayout = %d (cellHalfWidth = %f, stringWidth = %f) on %{public}@", buf, 0x30u);
  }
  if (v20 > v25)
  {
LABEL_7:
    BOOL v27 = 1;
  }
  else
  {
    if ([v7 BOOLValue]) {
      v28 = v74;
    }
    else {
      v28 = v76;
    }
    uint64_t v79 = v15;
    v29 = [v12 titleLabel];
    v30 = [v29 font];
    v80 = v30;
    v31 = [NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
    [v28 sizeWithAttributes:v31];
    UICeilToViewScale();
    double v33 = v32;

    BOOL v27 = v33 > v25;
  }
  buttonsStackView = self->_buttonsStackView;
  if (buttonsStackView) {
    [(UIStackView *)buttonsStackView removeFromSuperview];
  }
  v35 = (UIStackView *)objc_alloc_init(MEMORY[0x263F1C9B8]);
  v36 = self->_buttonsStackView;
  self->_buttonsStackView = v35;

  [(UIStackView *)self->_buttonsStackView setAxis:v27];
  [(UIStackView *)self->_buttonsStackView setSpacing:12.0];
  [(UIStackView *)self->_buttonsStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_buttonsStackView setAlignment:0];
  [(UIStackView *)self->_buttonsStackView setDistribution:1];
  [v12 setTitle:v9 forState:0];
  v37 = [MEMORY[0x263F1C490] grayButtonConfiguration];
  objc_msgSend(v37, "setContentInsets:", 10.0, 0.0, 10.0, 0.0);
  v38 = [MEMORY[0x263F1C550] systemRedColor];
  [v37 setBaseForegroundColor:v38];

  [v12 setConfiguration:v37];
  v39 = [v12 titleLabel];
  [v39 setTextAlignment:1];

  objc_msgSend(v12, "setEnabled:", objc_msgSend(v6, "BOOLValue"));
  [v12 addTarget:self action:sel_noMatchTapped_ forControlEvents:64];
  [(UIStackView *)self->_buttonsStackView addArrangedSubview:v12];
  v40 = [MEMORY[0x263F1C488] buttonWithType:1];

  [v37 setBaseForegroundColor:0];
  int v41 = [v7 BOOLValue];
  v42 = v76;
  if (v41)
  {
    v43 = [MEMORY[0x263F1C6B0] systemImageNamed:@"checkmark.circle.fill"];
    [v37 setImage:v43];

    [v37 setImagePadding:5.0];
    v44 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D298] scale:-1];
    [v37 setPreferredSymbolConfigurationForImage:v44];

    v45 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [v37 setBaseForegroundColor:v45];

    v42 = v74;
  }
  [v40 setTitle:v42 forState:0];
  [v40 setConfiguration:v37];
  v46 = [v40 titleLabel];
  [v46 setTextAlignment:1];

  v72 = v37;
  v73 = v6;
  v71 = v7;
  if ([v6 BOOLValue]) {
    uint64_t v47 = [v7 BOOLValue] ^ 1;
  }
  else {
    uint64_t v47 = 0;
  }
  [v40 setEnabled:v47];
  [v40 addTarget:self action:sel_markAsVerifiedTapped_ forControlEvents:64];
  [(UIStackView *)self->_buttonsStackView addArrangedSubview:v40];
  v48 = [(TUIStaticIdentitySpecifierButtonsCell *)self contentView];
  [v48 addSubview:self->_buttonsStackView];

  v62 = (void *)MEMORY[0x263F08938];
  v69 = [(UIStackView *)self->_buttonsStackView topAnchor];
  v70 = [(TUIStaticIdentitySpecifierButtonsCell *)self contentView];
  v68 = [v70 topAnchor];
  v67 = [v69 constraintEqualToAnchor:v68];
  v78[0] = v67;
  v65 = [(UIStackView *)self->_buttonsStackView leadingAnchor];
  v66 = [(TUIStaticIdentitySpecifierButtonsCell *)self contentView];
  v64 = [v66 layoutMarginsGuide];
  v63 = [v64 leadingAnchor];
  v61 = [v65 constraintEqualToAnchor:v63];
  v78[1] = v61;
  v58 = [(UIStackView *)self->_buttonsStackView trailingAnchor];
  v59 = [(TUIStaticIdentitySpecifierButtonsCell *)self contentView];
  v49 = [v59 layoutMarginsGuide];
  v50 = [v49 trailingAnchor];
  v51 = [v58 constraintEqualToAnchor:v50];
  v78[2] = v51;
  v52 = [(UIStackView *)self->_buttonsStackView bottomAnchor];
  v53 = [(TUIStaticIdentitySpecifierButtonsCell *)self contentView];
  v54 = [v53 layoutMarginsGuide];
  v55 = [v54 bottomAnchor];
  [v52 constraintEqualToAnchor:v55 constant:-5.0];
  v56 = v60 = v40;
  v78[3] = v56;
  v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:4];
  [v62 activateConstraints:v57];

  [(TUIStaticIdentitySpecifierButtonsCell *)self setNeedsLayout];
}

uint64_t __74__TUIStaticIdentitySpecifierButtonsCell_refreshCellContentsWithSpecifier___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_21 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)noMatchTapped:(id)a3
{
  id v3 = [(PSTableCell *)self specifier];
  [v3 performConfirmationAlternateAction];
}

- (void)markAsVerifiedTapped:(id)a3
{
  id v3 = [(PSTableCell *)self specifier];
  [v3 performConfirmationAction];
}

- (UIStackView)buttonsStackView
{
  return self->_buttonsStackView;
}

- (void)setButtonsStackView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end