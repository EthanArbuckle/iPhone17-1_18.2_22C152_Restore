@interface TUIAccountKeySpecifierCell
+ (int64_t)cellStyle;
- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4;
- (TUIAccountKeyLabel)accountKeyLabel;
- (TUIAccountKeySpecifierCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIEditMenuInteraction)editInteraction;
- (void)handleLongPressGesture:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setAccountKeyLabel:(id)a3;
- (void)setEditInteraction:(id)a3;
@end

@implementation TUIAccountKeySpecifierCell

+ (int64_t)cellStyle
{
  return 3;
}

- (TUIAccountKeySpecifierCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v42[4] = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_8 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_8, &__block_literal_global_8);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_8, OS_LOG_TYPE_DEBUG)) {
    -[TUIAccountKeySpecifierCell initWithStyle:reuseIdentifier:]();
  }
  v41.receiver = self;
  v41.super_class = (Class)TUIAccountKeySpecifierCell;
  v7 = [(TUIAccountKeySpecifierCell *)&v41 initWithStyle:a3 reuseIdentifier:v6];
  if (v7)
  {
    v8 = [TUIAccountKeyLabel alloc];
    uint64_t v9 = -[TUIAccountKeyLabel initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    accountKeyLabel = v7->_accountKeyLabel;
    v7->_accountKeyLabel = (TUIAccountKeyLabel *)v9;

    v11 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2C0]];
    [v11 pointSize];
    double v13 = v12;

    v14 = v7->_accountKeyLabel;
    v15 = [MEMORY[0x263F1C658] monospacedSystemFontOfSize:v13 weight:*MEMORY[0x263F1D330]];
    [(TUIAccountKeyLabel *)v14 setFont:v15];

    v16 = v7->_accountKeyLabel;
    v17 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [(TUIAccountKeyLabel *)v16 setTextColor:v17];

    [(TUIAccountKeyLabel *)v7->_accountKeyLabel setUserInteractionEnabled:1];
    [(TUIAccountKeyLabel *)v7->_accountKeyLabel setLineBreakMode:1];
    [(TUIAccountKeyLabel *)v7->_accountKeyLabel setNumberOfLines:0];
    [(TUIAccountKeyLabel *)v7->_accountKeyLabel setTextAlignment:0];
    v18 = (void *)[objc_alloc(MEMORY[0x263F1C620]) initWithDelegate:v7];
    [(TUIAccountKeySpecifierCell *)v7 setEditInteraction:v18];

    v19 = v7->_accountKeyLabel;
    v20 = [(TUIAccountKeySpecifierCell *)v7 editInteraction];
    [(TUIAccountKeyLabel *)v19 addInteraction:v20];

    v39 = (void *)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:v7 action:sel_handleLongPressGesture_];
    [v39 setAllowedTouchTypes:&unk_270C4C190];
    [(TUIAccountKeyLabel *)v7->_accountKeyLabel addGestureRecognizer:v39];
    v21 = [(TUIAccountKeySpecifierCell *)v7 contentView];
    [v21 addSubview:v7->_accountKeyLabel];

    [(TUIAccountKeyLabel *)v7->_accountKeyLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = [(TUIAccountKeySpecifierCell *)v7 contentView];
    [v22 layoutMarginsGuide];
    v23 = id v40 = v6;

    v33 = (void *)MEMORY[0x263F08938];
    v38 = [(TUIAccountKeyLabel *)v7->_accountKeyLabel topAnchor];
    v37 = [v23 topAnchor];
    v36 = [v38 constraintEqualToAnchor:v37 constant:5.0];
    v42[0] = v36;
    v35 = [(TUIAccountKeyLabel *)v7->_accountKeyLabel bottomAnchor];
    v34 = [v23 bottomAnchor];
    v24 = [v35 constraintEqualToAnchor:v34 constant:-5.0];
    v42[1] = v24;
    v25 = [(TUIAccountKeyLabel *)v7->_accountKeyLabel leadingAnchor];
    v26 = [v23 leadingAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v42[2] = v27;
    v28 = [(TUIAccountKeyLabel *)v7->_accountKeyLabel trailingAnchor];
    v29 = [v23 trailingAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v42[3] = v30;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];
    [v33 activateConstraints:v31];

    id v6 = v40;
  }

  return v7;
}

uint64_t __60__TUIAccountKeySpecifierCell_initWithStyle_reuseIdentifier___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_8 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_8 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_8, &__block_literal_global_13);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_8, OS_LOG_TYPE_DEBUG)) {
    -[TUIAccountKeySpecifierCell refreshCellContentsWithSpecifier:]();
  }
  v10.receiver = self;
  v10.super_class = (Class)TUIAccountKeySpecifierCell;
  [(PSTableCell *)&v10 refreshCellContentsWithSpecifier:v4];
  v5 = [(TUIAccountKeySpecifierCell *)self textLabel];
  [v5 setHidden:1];

  accountKeyLabel = self->_accountKeyLabel;
  v7 = [v4 propertyForKey:*MEMORY[0x263F602D0]];
  [(TUIAccountKeyLabel *)accountKeyLabel setText:v7];

  v8 = self->_accountKeyLabel;
  uint64_t v9 = [v4 propertyForKey:*MEMORY[0x263F60308]];
  [(TUIAccountKeyLabel *)v8 setAccessibilityIdentifier:v9];

  [(TUIAccountKeySpecifierCell *)self setNeedsLayout];
}

uint64_t __63__TUIAccountKeySpecifierCell_refreshCellContentsWithSpecifier___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_8 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)handleLongPressGesture:(id)a3
{
  id v4 = a3;
  v5 = [v4 view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  objc_msgSend(MEMORY[0x263F1C618], "configurationWithIdentifier:sourcePoint:", 0, v7, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v10 = [(TUIAccountKeySpecifierCell *)self editInteraction];
  [v10 presentEditMenuWithConfiguration:v11];
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  id v4 = [a3 view];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (TUIAccountKeyLabel)accountKeyLabel
{
  return self->_accountKeyLabel;
}

- (void)setAccountKeyLabel:(id)a3
{
}

- (UIEditMenuInteraction)editInteraction
{
  return self->_editInteraction;
}

- (void)setEditInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editInteraction, 0);
  objc_storeStrong((id *)&self->_accountKeyLabel, 0);
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

@end