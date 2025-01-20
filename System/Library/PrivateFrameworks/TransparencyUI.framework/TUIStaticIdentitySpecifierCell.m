@interface TUIStaticIdentitySpecifierCell
+ (int64_t)cellStyle;
- (TUIStaticIdentitySpecifierCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIStackView)stackView;
- (UITextView)textView;
- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setStackView:(id)a3;
- (void)setTextView:(id)a3;
@end

@implementation TUIStaticIdentitySpecifierCell

+ (int64_t)cellStyle
{
  return 3;
}

- (TUIStaticIdentitySpecifierCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v35[4] = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_21 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_21, &__block_literal_global_22);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_21, OS_LOG_TYPE_DEBUG)) {
    -[TUIStaticIdentitySpecifierCell initWithStyle:reuseIdentifier:]();
  }
  v34.receiver = self;
  v34.super_class = (Class)TUIStaticIdentitySpecifierCell;
  v7 = [(TUIStaticIdentitySpecifierCell *)&v34 initWithStyle:a3 reuseIdentifier:v6];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F1CAC8]);
    uint64_t v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    textView = v7->_textView;
    v7->_textView = (UITextView *)v9;

    [(UITextView *)v7->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = v7->_textView;
    v12 = [MEMORY[0x263F1C550] clearColor];
    [(UITextView *)v11 setBackgroundColor:v12];

    v13 = [(UITextView *)v7->_textView textContainer];
    [v13 setLineBreakMode:0];

    -[UITextView setTextContainerInset:](v7->_textView, "setTextContainerInset:", 0.0, 0.0, 0.0, 0.0);
    v14 = [(UITextView *)v7->_textView textContainer];
    [v14 setLineFragmentPadding:0.0];

    [(UITextView *)v7->_textView setScrollEnabled:0];
    [(UITextView *)v7->_textView setSelectable:1];
    [(UITextView *)v7->_textView setEditable:0];
    [(UITextView *)v7->_textView _setInteractiveTextSelectionDisabled:1];
    [(UITextView *)v7->_textView setDelegate:v7];
    [(TUIStaticIdentitySpecifierCell *)v7 addSubview:v7->_textView];
    v26 = (void *)MEMORY[0x263F08938];
    v31 = [(UITextView *)v7->_textView topAnchor];
    v32 = [(TUIStaticIdentitySpecifierCell *)v7 detailTextLabel];
    v30 = [v32 topAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v35[0] = v29;
    v27 = [(UITextView *)v7->_textView leadingAnchor];
    v28 = [(TUIStaticIdentitySpecifierCell *)v7 detailTextLabel];
    v25 = [v28 leadingAnchor];
    v15 = [v27 constraintEqualToAnchor:v25];
    v35[1] = v15;
    v16 = [(UITextView *)v7->_textView trailingAnchor];
    v17 = [(TUIStaticIdentitySpecifierCell *)v7 detailTextLabel];
    [v17 trailingAnchor];
    v18 = id v33 = v6;
    v19 = [v16 constraintEqualToAnchor:v18];
    v35[2] = v19;
    v20 = [(UITextView *)v7->_textView bottomAnchor];
    v21 = [(TUIStaticIdentitySpecifierCell *)v7 bottomAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v35[3] = v22;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:4];
    [v26 activateConstraints:v23];

    id v6 = v33;
  }

  return v7;
}

uint64_t __64__TUIStaticIdentitySpecifierCell_initWithStyle_reuseIdentifier___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_21 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v95[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v91.receiver = self;
  v91.super_class = (Class)TUIStaticIdentitySpecifierCell;
  [(PSTableCell *)&v91 refreshCellContentsWithSpecifier:v4];
  v5 = [(TUIStaticIdentitySpecifierCell *)self textLabel];
  id v6 = [v5 layer];
  int v7 = [v6 disableUpdateMask];

  uint64_t v8 = v7 | 0x12u;
  uint64_t v9 = [(TUIStaticIdentitySpecifierCell *)self textLabel];
  v10 = [v9 layer];
  [v10 setDisableUpdateMask:v8];

  v11 = [(TUIStaticIdentitySpecifierCell *)self textLabel];
  v12 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2F8]];
  [v11 setFont:v12];

  v13 = [(TUIStaticIdentitySpecifierCell *)self textLabel];
  v14 = [MEMORY[0x263F1C550] labelColor];
  [v13 setTextColor:v14];

  v15 = [(TUIStaticIdentitySpecifierCell *)self textLabel];
  [v15 setLineBreakMode:0];

  v16 = [(TUIStaticIdentitySpecifierCell *)self textLabel];
  [v16 setNumberOfLines:0];

  stackView = self->_stackView;
  if (stackView)
  {
    [(UIStackView *)stackView removeFromSuperview];
    v18 = self->_stackView;
    self->_stackView = 0;
  }
  v19 = [v4 propertyForKey:*MEMORY[0x263F602D0]];
  v20 = [(TUIStaticIdentitySpecifierCell *)self textLabel];
  v21 = v20;
  v22 = (uint64_t *)MEMORY[0x263F1C238];
  if (v19)
  {
    [v20 setText:v19];

    v23 = [(TUIStaticIdentitySpecifierCell *)self textLabel];
    [v23 setAccessibilityIdentifier:@"Verification Code"];
  }
  else
  {
    [v20 setText:@" "];

    uint64_t v94 = *v22;
    v24 = [(TUIStaticIdentitySpecifierCell *)self textLabel];
    v25 = [v24 font];
    v95[0] = v25;
    v26 = [NSDictionary dictionaryWithObjects:v95 forKeys:&v94 count:1];
    [@"8888" sizeWithAttributes:v26];
    double v28 = v27;

    v23 = objc_opt_new();
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
    v29 = [MEMORY[0x263F1C550] tertiarySystemFillColor];
    [v23 setBackgroundColor:v29];

    v30 = [v23 layer];
    [v30 setCornerRadius:8.0];

    v31 = [v23 layer];
    [v31 setMasksToBounds:0];

    v32 = objc_opt_new();
    [v32 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v33 = [MEMORY[0x263F1C550] tertiarySystemFillColor];
    [v32 setBackgroundColor:v33];

    objc_super v34 = [v32 layer];
    [v34 setCornerRadius:8.0];

    v90 = v32;
    v35 = [v32 layer];
    [v35 setMasksToBounds:0];

    id v36 = objc_alloc(MEMORY[0x263F1C9B8]);
    v93[0] = v23;
    v93[1] = v32;
    v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v93 count:2];
    v38 = (UIStackView *)[v36 initWithArrangedSubviews:v37];
    v39 = self->_stackView;
    self->_stackView = v38;

    [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_stackView setAxis:0];
    [(UIStackView *)self->_stackView setSpacing:8.0];
    [(UIStackView *)self->_stackView setDistribution:3];
    [(UIStackView *)self->_stackView setAccessibilityIdentifier:@"Verification Code"];
    [(TUIStaticIdentitySpecifierCell *)self addSubview:self->_stackView];
    v81 = (void *)MEMORY[0x263F08938];
    v88 = [(UIStackView *)self->_stackView topAnchor];
    v89 = [(TUIStaticIdentitySpecifierCell *)self textLabel];
    v87 = [v89 topAnchor];
    v86 = [v88 constraintEqualToAnchor:v87];
    v92[0] = v86;
    v84 = [(UIStackView *)self->_stackView leadingAnchor];
    v85 = [(TUIStaticIdentitySpecifierCell *)self textLabel];
    v83 = [v85 leadingAnchor];
    v82 = [v84 constraintEqualToAnchor:v83];
    v92[1] = v82;
    v79 = [(UIStackView *)self->_stackView bottomAnchor];
    v80 = [(TUIStaticIdentitySpecifierCell *)self textLabel];
    v78 = [v80 bottomAnchor];
    v77 = [v79 constraintEqualToAnchor:v78];
    v92[2] = v77;
    v76 = [(UIStackView *)self->_stackView trailingAnchor];
    v40 = [(TUIStaticIdentitySpecifierCell *)self trailingAnchor];
    v41 = [v76 constraintLessThanOrEqualToAnchor:v40];
    v92[3] = v41;
    v42 = [v23 widthAnchor];
    [v42 constraintEqualToConstant:v28];
    v44 = id v43 = v4;
    v92[4] = v44;
    v45 = [v90 widthAnchor];
    v46 = [v45 constraintEqualToConstant:v28];
    v92[5] = v46;
    v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v92 count:6];
    [v81 activateConstraints:v47];

    v19 = 0;
    id v4 = v43;

    v22 = (uint64_t *)MEMORY[0x263F1C238];
  }

  v48 = [(TUIStaticIdentitySpecifierCell *)self detailTextLabel];
  v49 = (void *)MEMORY[0x263F1C658];
  v50 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D280] addingSymbolicTraits:0x8000 options:0];
  v51 = [v49 fontWithDescriptor:v50 size:0.0];
  [v48 setFont:v51];

  v52 = [(TUIStaticIdentitySpecifierCell *)self detailTextLabel];
  uint64_t v53 = *MEMORY[0x263F602C8];
  v54 = [v4 propertyForKey:*MEMORY[0x263F602C8]];
  [v52 setText:v54];

  v55 = [(TUIStaticIdentitySpecifierCell *)self detailTextLabel];
  [v55 setLineBreakMode:0];

  v56 = [(TUIStaticIdentitySpecifierCell *)self detailTextLabel];
  [v56 setNumberOfLines:0];

  v57 = [(TUIStaticIdentitySpecifierCell *)self detailTextLabel];
  v58 = [MEMORY[0x263F1C550] clearColor];
  [v57 setTextColor:v58];

  v59 = [v4 propertyForKey:v53];
  v60 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v59];
  v61 = [v60 mutableString];
  uint64_t v62 = [v61 length];

  uint64_t v63 = *v22;
  v64 = [(TUIStaticIdentitySpecifierCell *)self detailTextLabel];
  v65 = [v64 font];
  objc_msgSend(v60, "addAttribute:value:range:", v63, v65, 0, v62);

  uint64_t v66 = *MEMORY[0x263F1C240];
  v67 = [MEMORY[0x263F1C550] secondaryLabelColor];
  objc_msgSend(v60, "addAttribute:value:range:", v66, v67, 0, v62);

  v68 = [v60 mutableString];
  v69 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v70 = [v69 localizedStringForKey:@"LEARN_MORE" value:&stru_270C3F140 table:@"Localizable"];
  uint64_t v71 = [v68 rangeOfString:v70];
  uint64_t v73 = v72;

  if (v71 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v74 = *MEMORY[0x263F1C258];
    v75 = [NSURL URLWithString:&stru_270C3F140];
    objc_msgSend(v60, "addAttribute:value:range:", v74, v75, v71, v73);
  }
  [(UITextView *)self->_textView setAttributedText:v60];
  [(TUIStaticIdentitySpecifierCell *)self bringSubviewToFront:self->_textView];
  [(TUIStaticIdentitySpecifierCell *)self setNeedsLayout];
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_21 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_21, &__block_literal_global_30);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_21, OS_LOG_TYPE_DEBUG)) {
    -[TUIStaticIdentitySpecifierCell textView:primaryActionForTextItem:defaultAction:]();
  }
  v10 = [NSURL URLWithString:@"https://support.apple.com/ht213465"];
  [(id)*MEMORY[0x263F1D020] openURL:v10 options:MEMORY[0x263EFFA78] completionHandler:0];

  return v9;
}

uint64_t __82__TUIStaticIdentitySpecifierCell_textView_primaryActionForTextItem_defaultAction___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_21 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_260338000, v0, OS_LOG_TYPE_DEBUG, "%s  on %{public}@", (uint8_t *)v1, 0x16u);
}

- (void)textView:primaryActionForTextItem:defaultAction:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_260338000, v0, OS_LOG_TYPE_DEBUG, "%s  on %{public}@", (uint8_t *)v1, 0x16u);
}

@end