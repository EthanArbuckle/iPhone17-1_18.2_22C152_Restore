@interface TUIKTStatusCell
- (NSArray)constraints;
- (TUIKTStatusCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)ktStatusTextLabel;
- (UILabel)ktStatusTitleLabel;
- (UIStackView)ktStatusStackView;
- (void)_setStatusText:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setKtStatusStackView:(id)a3;
- (void)setKtStatusTextLabel:(id)a3;
- (void)setKtStatusTitleLabel:(id)a3;
- (void)updateConstraints;
@end

@implementation TUIKTStatusCell

- (TUIKTStatusCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_13 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_13, &__block_literal_global_13);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTStatusCell initWithStyle:reuseIdentifier:]();
  }
  v26.receiver = self;
  v26.super_class = (Class)TUIKTStatusCell;
  v7 = [(TUIKTStatusCell *)&v26 initWithStyle:a3 reuseIdentifier:v6];
  v8 = v7;
  if (v7)
  {
    v9 = [(PSTableCell *)v7 titleLabel];
    [v9 setHidden:1];

    v10 = [(TUIKTStatusCell *)v8 detailTextLabel];
    [v10 setHidden:1];

    uint64_t v11 = objc_opt_new();
    ktStatusStackView = v8->_ktStatusStackView;
    v8->_ktStatusStackView = (UIStackView *)v11;

    [(UIStackView *)v8->_ktStatusStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v8->_ktStatusStackView setSpacing:6.0];
    [(UIStackView *)v8->_ktStatusStackView setAxis:0];
    [(UIStackView *)v8->_ktStatusStackView setAlignment:3];
    [(UIStackView *)v8->_ktStatusStackView setDistribution:0];
    v13 = [(TUIKTStatusCell *)v8 contentView];
    [v13 addSubview:v8->_ktStatusStackView];

    uint64_t v14 = objc_opt_new();
    ktStatusTitleLabel = v8->_ktStatusTitleLabel;
    v8->_ktStatusTitleLabel = (UILabel *)v14;

    [(UILabel *)v8->_ktStatusTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v8->_ktStatusTitleLabel setNumberOfLines:0];
    v16 = [MEMORY[0x263F1C550] labelColor];
    [(UILabel *)v8->_ktStatusTitleLabel setTextColor:v16];

    v17 = [(PSTableCell *)v8 titleLabel];
    v18 = [v17 font];
    [(UILabel *)v8->_ktStatusTitleLabel setFont:v18];

    [(UIStackView *)v8->_ktStatusStackView addArrangedSubview:v8->_ktStatusTitleLabel];
    uint64_t v19 = objc_opt_new();
    ktStatusTextLabel = v8->_ktStatusTextLabel;
    v8->_ktStatusTextLabel = (UILabel *)v19;

    [(UILabel *)v8->_ktStatusTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v8->_ktStatusTextLabel setNumberOfLines:1];
    v21 = [(TUIKTStatusCell *)v8 detailTextLabel];
    v22 = [v21 font];
    [(UILabel *)v8->_ktStatusTextLabel setFont:v22];

    LODWORD(v23) = 1148846080;
    [(UILabel *)v8->_ktStatusTextLabel setContentHuggingPriority:0 forAxis:v23];
    LODWORD(v24) = 1148846080;
    [(UILabel *)v8->_ktStatusTextLabel setContentHuggingPriority:1 forAxis:v24];
    [(UIStackView *)v8->_ktStatusStackView addArrangedSubview:v8->_ktStatusTextLabel];
  }

  return v8;
}

uint64_t __49__TUIKTStatusCell_initWithStyle_reuseIdentifier___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v39[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_13 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_13, &__block_literal_global_6);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTStatusCell refreshCellContentsWithSpecifier:]();
  }
  v25.receiver = self;
  v25.super_class = (Class)TUIKTStatusCell;
  [(PSTableCell *)&v25 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 name];
  [(UILabel *)self->_ktStatusTitleLabel setText:v5];

  [(TUIKTStatusCell *)self _setStatusText:v4];
  id v6 = [(TUIKTStatusCell *)self _tableView];
  [v6 frame];
  v7 = [(TUIKTStatusCell *)self _tableView];
  [v7 layoutMargins];
  v8 = [(TUIKTStatusCell *)self _tableView];
  [v8 layoutMargins];

  if ([v4 cellType] == 2)
  {
    v9 = [(TUIKTStatusCell *)self _tableView];
    [v9 layoutMargins];
  }
  UICeilToViewScale();
  double v11 = v10;
  v12 = [(UILabel *)self->_ktStatusTitleLabel text];
  uint64_t v38 = *MEMORY[0x263F1C238];
  v13 = [(UILabel *)self->_ktStatusTitleLabel font];
  v39[0] = v13;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
  [v12 sizeWithAttributes:v14];
  UICeilToViewScale();
  double v16 = v15;

  [(UILabel *)self->_ktStatusTextLabel intrinsicContentSize];
  UICeilToViewScale();
  double v18 = v17;
  double v19 = v16 + v17;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_13 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_13, &__block_literal_global_12);
  }
  double v20 = v19 + 6.0;
  v21 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    v27 = "-[TUIKTStatusCell refreshCellContentsWithSpecifier:]";
    __int16 v28 = 1024;
    BOOL v29 = v11 > v20;
    __int16 v30 = 2048;
    double v31 = v11;
    __int16 v32 = 2048;
    double v33 = v16;
    __int16 v34 = 2048;
    double v35 = v18;
    __int16 v36 = 2114;
    v37 = self;
    _os_log_debug_impl(&dword_260338000, v21, OS_LOG_TYPE_DEBUG, "%s isHorizontal = %d (cellWidth = %f, titleWidth = %f, statusWidth = %f) on %{public}@", buf, 0x3Au);
  }
  BOOL v22 = v11 <= v20;
  if (v11 <= v20) {
    uint64_t v23 = 1;
  }
  else {
    uint64_t v23 = 2;
  }
  if (v11 <= v20) {
    double v24 = 0.0;
  }
  else {
    double v24 = 6.0;
  }
  [(UIStackView *)self->_ktStatusStackView setAxis:v22];
  [(UIStackView *)self->_ktStatusStackView setAlignment:v23];
  [(UIStackView *)self->_ktStatusStackView setSpacing:v24];
  [(TUIKTStatusCell *)self setNeedsUpdateConstraints];
  [(TUIKTStatusCell *)self setNeedsLayout];
}

uint64_t __52__TUIKTStatusCell_refreshCellContentsWithSpecifier___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __52__TUIKTStatusCell_refreshCellContentsWithSpecifier___block_invoke_10()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)updateConstraints
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __36__TUIKTStatusCell_updateConstraints__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_setStatusText:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_13 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_13, &__block_literal_global_20_0);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTStatusCell _setStatusText:]();
  }
  uint64_t v5 = [v4 propertyForKey:*MEMORY[0x263F602C8]];
  if (v5) {
    id v6 = (__CFString *)v5;
  }
  else {
    id v6 = &stru_270C3F140;
  }
  v7 = [v4 propertyForKey:*MEMORY[0x263F602C0]];
  if (!v7)
  {
    v7 = [MEMORY[0x263F1C550] systemRedColor];
  }
  id v8 = objc_alloc_init(MEMORY[0x263F089B8]);
  if ([(__CFString *)v6 length])
  {
    v9 = [MEMORY[0x263F1C550] systemRedColor];

    if (v7 == v9)
    {
      double v10 = (void *)MEMORY[0x263F1C6C8];
      double v11 = [(TUIKTStatusCell *)self detailTextLabel];
      v12 = [v11 font];
      [v12 pointSize];
      objc_super v25 = objc_msgSend(v10, "configurationWithPointSize:weight:scale:", 4, 1);

      v13 = [MEMORY[0x263F1C6B0] systemImageNamed:@"exclamationmark.triangle.fill" withConfiguration:v25];
      uint64_t v14 = [v13 imageWithTintColor:v7];

      double v15 = [v14 imageWithRenderingMode:2];

      double v16 = [MEMORY[0x263F1C370] textAttachmentWithImage:v15];
      double v17 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v16];
      [v8 appendAttributedString:v17];

      double v18 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@" "];
      [v8 appendAttributedString:v18];
    }
  }
  double v19 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v6];
  [v8 appendAttributedString:v19];

  double v20 = objc_opt_new();
  objc_msgSend(v20, "setAlignment:", 2 * (-[TUIKTStatusCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1));
  uint64_t v21 = [v8 length];
  objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x263F1C268], v20, 0, v21);
  objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x263F1C240], v7, 0, v21);
  uint64_t v22 = *MEMORY[0x263F1C238];
  uint64_t v23 = [(TUIKTStatusCell *)self detailTextLabel];
  double v24 = [v23 font];
  objc_msgSend(v8, "addAttribute:value:range:", v22, v24, 0, v21);

  [(UILabel *)self->_ktStatusTextLabel setAttributedText:v8];
}

uint64_t __34__TUIKTStatusCell__setStatusText___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (UIStackView)ktStatusStackView
{
  return self->_ktStatusStackView;
}

- (void)setKtStatusStackView:(id)a3
{
}

- (UILabel)ktStatusTitleLabel
{
  return self->_ktStatusTitleLabel;
}

- (void)setKtStatusTitleLabel:(id)a3
{
}

- (UILabel)ktStatusTextLabel
{
  return self->_ktStatusTextLabel;
}

- (void)setKtStatusTextLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ktStatusTextLabel, 0);
  objc_storeStrong((id *)&self->_ktStatusTitleLabel, 0);
  objc_storeStrong((id *)&self->_ktStatusStackView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)refreshCellContentsWithSpecifier:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_setStatusText:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

@end