@interface PUIAttributedStringFooter
+ (id)string:(id)a3 replacingSubstring:(id)a4 withImage:(id)a5;
- (NSLayoutConstraint)textViewLeadingConstraint;
- (NSLayoutConstraint)textViewTrailingConstraint;
- (PSSpecifier)specifier;
- (PUIAttributedStringFooter)initWithSpecifier:(id)a3;
- (UITextView)textView;
- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4;
- (void)_accessibilitySetInterfaceStyleIntent:(unint64_t)a3;
- (void)refreshContentsWithSpecifier:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTextView:(id)a3;
- (void)setTextViewLeadingConstraint:(id)a3;
- (void)setTextViewTrailingConstraint:(id)a3;
- (void)setupSubviewsAndContstraints;
- (void)updateConstraints;
@end

@implementation PUIAttributedStringFooter

+ (id)string:(id)a3 replacingSubstring:(id)a4 withImage:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [v7 string];
  uint64_t v11 = [v10 rangeOfString:v9];
  uint64_t v13 = v12;

  v14 = objc_opt_new();
  [v14 setImage:v8];

  v15 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v14];
  objc_msgSend(v7, "replaceCharactersInRange:withAttributedString:", v11, v13, v15);

  return v7;
}

- (PUIAttributedStringFooter)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = -[PUIAttributedStringFooter initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    [(PUIAttributedStringFooter *)v5 setupSubviewsAndContstraints];
    [(PUIAttributedStringFooter *)v6 refreshContentsWithSpecifier:v4];
  }

  return v6;
}

- (void)refreshContentsWithSpecifier:(id)a3
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PUIAttributedStringFooter *)self setSpecifier:v4];
  v5 = [v4 objectForKeyedSubscript:@"PUIAttributedStringTextViewDelegateKey"];
  v6 = [v5 nonretainedObjectValue];
  id v7 = [(PUIAttributedStringFooter *)self textView];
  [v7 setDelegate:v6];

  id v8 = [v4 objectForKeyedSubscript:@"PUIAttributedStringFooterStringKey"];

  id v9 = (void *)[v8 mutableCopy];
  uint64_t v10 = [v9 length];
  uint64_t v11 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v12 = [v11 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

  if (IsAccessibilityCategory)
  {
    v14 = objc_opt_new();
    LODWORD(v15) = 1055286886;
    [v14 setHyphenationFactor:v15];
    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v14, 0, v10);
  }
  v16 = [MEMORY[0x1E4F92E40] appearance];
  v17 = [v16 altTextColor];
  if (v17)
  {
    v18 = [MEMORY[0x1E4F92E40] appearance];
    v19 = [v18 altTextColor];
  }
  else
  {
    v19 = PreferencesTableViewFooterColor();
  }

  v20 = [MEMORY[0x1E4F92E40] appearance];
  v21 = [v20 footerHyperlinkColor];
  if (v21)
  {
    v22 = [MEMORY[0x1E4F92E40] appearance];
    v23 = [v22 footerHyperlinkColor];
  }
  else
  {
    v23 = [MEMORY[0x1E4FB1618] systemBlueColor];
  }

  uint64_t v24 = *MEMORY[0x1E4FB06F8];
  v25 = PreferencesTableViewFooterFont();
  objc_msgSend(v9, "addAttribute:value:range:", v24, v25, 0, v10);

  uint64_t v26 = *MEMORY[0x1E4FB0700];
  v27 = [(PUIAttributedStringFooter *)self _accessibilityHigherContrastTintColorForColor:v19];
  objc_msgSend(v9, "addAttribute:value:range:", v26, v27, 0, v10);

  v33[0] = v26;
  v28 = [(PUIAttributedStringFooter *)self _accessibilityHigherContrastTintColorForColor:v23];
  v33[1] = *MEMORY[0x1E4FB0808];
  v34[0] = v28;
  v34[1] = MEMORY[0x1E4F1CC28];
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  v30 = [(PUIAttributedStringFooter *)self textView];
  [v30 setLinkTextAttributes:v29];

  v31 = (void *)[v9 copy];
  v32 = [(PUIAttributedStringFooter *)self textView];
  [v32 setAttributedText:v31];
}

- (void)setupSubviewsAndContstraints
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1DD8]);
  [(PUIAttributedStringFooter *)self setTextView:v3];

  id v4 = [(PUIAttributedStringFooter *)self textView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [MEMORY[0x1E4FB1618] clearColor];
  v6 = [(PUIAttributedStringFooter *)self textView];
  [v6 setBackgroundColor:v5];

  id v7 = [(PUIAttributedStringFooter *)self textView];
  [v7 setShowsVerticalScrollIndicator:0];

  id v8 = [(PUIAttributedStringFooter *)self textView];
  [v8 setEditable:0];

  id v9 = [(PUIAttributedStringFooter *)self textView];
  [v9 setSelectable:1];

  uint64_t v10 = [(PUIAttributedStringFooter *)self textView];
  [v10 setScrollEnabled:0];

  uint64_t v11 = [(PUIAttributedStringFooter *)self textView];
  uint64_t v12 = [v11 textContainer];
  [v12 setLineFragmentPadding:0.0];

  uint64_t v13 = [(PUIAttributedStringFooter *)self textView];
  [v13 _setInteractiveTextSelectionDisabled:1];

  v14 = [(PUIAttributedStringFooter *)self contentView];
  double v15 = [(PUIAttributedStringFooter *)self textView];
  [v14 addSubview:v15];

  id v42 = [MEMORY[0x1E4F1CA48] array];
  v16 = [(PUIAttributedStringFooter *)self textView];
  v17 = [v16 leadingAnchor];
  v18 = [(PUIAttributedStringFooter *)self contentView];
  v19 = [v18 safeAreaLayoutGuide];
  v20 = [v19 leadingAnchor];
  v21 = [(PUIAttributedStringFooter *)self tableView];
  [v21 _marginWidth];
  v22 = objc_msgSend(v17, "constraintEqualToAnchor:constant:", v20);
  [(PUIAttributedStringFooter *)self setTextViewLeadingConstraint:v22];

  v23 = [(PUIAttributedStringFooter *)self textViewLeadingConstraint];
  [v42 addObject:v23];

  uint64_t v24 = [(PUIAttributedStringFooter *)self contentView];
  v25 = [v24 safeAreaLayoutGuide];
  uint64_t v26 = [v25 trailingAnchor];
  v27 = [(PUIAttributedStringFooter *)self textView];
  v28 = [v27 trailingAnchor];
  v29 = [(PUIAttributedStringFooter *)self tableView];
  [v29 _marginWidth];
  v30 = objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28);
  [(PUIAttributedStringFooter *)self setTextViewTrailingConstraint:v30];

  v31 = [(PUIAttributedStringFooter *)self textViewTrailingConstraint];
  [v42 addObject:v31];

  v32 = [(PUIAttributedStringFooter *)self textView];
  v33 = [v32 topAnchor];
  v34 = [(PUIAttributedStringFooter *)self contentView];
  v35 = [v34 topAnchor];
  v36 = [v33 constraintEqualToAnchor:v35];
  [v42 addObject:v36];

  v37 = [(PUIAttributedStringFooter *)self textView];
  v38 = [v37 bottomAnchor];
  v39 = [(PUIAttributedStringFooter *)self contentView];
  v40 = [v39 bottomAnchor];
  v41 = [v38 constraintEqualToAnchor:v40];
  [v42 addObject:v41];

  [MEMORY[0x1E4F28DC8] activateConstraints:v42];
}

- (void)setTableView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUIAttributedStringFooter;
  [(PUIAttributedStringFooter *)&v4 setTableView:a3];
  [(PUIAttributedStringFooter *)self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  id v3 = [(PUIAttributedStringFooter *)self textViewTrailingConstraint];
  [v3 constant];
  double v5 = v4;
  v6 = [(PUIAttributedStringFooter *)self tableView];
  [v6 _marginWidth];
  double v8 = v7;

  if (v5 != v8)
  {
    id v9 = [(PUIAttributedStringFooter *)self tableView];
    [v9 _marginWidth];
    double v11 = v10;
    uint64_t v12 = [(PUIAttributedStringFooter *)self textViewTrailingConstraint];
    [v12 setConstant:v11];
  }
  uint64_t v13 = [(PUIAttributedStringFooter *)self textViewLeadingConstraint];
  [v13 constant];
  double v15 = v14;
  v16 = [(PUIAttributedStringFooter *)self tableView];
  [v16 _marginWidth];
  double v18 = v17;

  if (v15 != v18)
  {
    v19 = [(PUIAttributedStringFooter *)self tableView];
    [v19 _marginWidth];
    double v21 = v20;
    v22 = [(PUIAttributedStringFooter *)self textViewLeadingConstraint];
    [v22 setConstant:v21];
  }
  v23.receiver = self;
  v23.super_class = (Class)PUIAttributedStringFooter;
  [(PUIAttributedStringFooter *)&v23 updateConstraints];
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  LODWORD(v4) = 1148846080;
  LODWORD(v5) = 1112014848;
  -[PUIAttributedStringFooter systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a4, a3, *(double *)(MEMORY[0x1E4FB2C68] + 8), v4, v5);
  return v6;
}

- (void)_accessibilitySetInterfaceStyleIntent:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUIAttributedStringFooter;
  [(PUIAttributedStringFooter *)&v5 _accessibilitySetInterfaceStyleIntent:a3];
  double v4 = [(PUIAttributedStringFooter *)self specifier];
  [(PUIAttributedStringFooter *)self refreshContentsWithSpecifier:v4];
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (PSSpecifier)specifier
{
  return self->_specifier;
}

- (void)setSpecifier:(id)a3
{
}

- (NSLayoutConstraint)textViewLeadingConstraint
{
  return self->_textViewLeadingConstraint;
}

- (void)setTextViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)textViewTrailingConstraint
{
  return self->_textViewTrailingConstraint;
}

- (void)setTextViewTrailingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_textViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end