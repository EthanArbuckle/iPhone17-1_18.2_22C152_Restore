@interface SearchUIAttributionFooterCardSectionView
+ (BOOL)prefersNoSeparatorAboveRowModel:(id)a3;
+ (BOOL)supportsCustomUserReportRequestAfforance;
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
+ (void)removeIconsFromRichText:(id)a3;
- (SFAttributionFooterCardSection)cardSection;
- (TLKStackView)stackView;
- (TLKTextButton)leadingTextButton;
- (TLKTextButton)trailingTextButton;
- (id)setupContentView;
- (id)setupTextButtonThatIsLeadingAttribution:(BOOL)a3;
- (void)configureMenuForTrailingFootnoteButton;
- (void)didPressLeadingTextButton;
- (void)didPressTrailingTextButton:(id)a3;
- (void)setCardSection:(id)a3;
- (void)setLeadingTextButton:(id)a3;
- (void)setStackView:(id)a3;
- (void)setTrailingTextButton:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3 forButton:(id)a4;
- (void)updateAttributionThatIsLeading:(BOOL)a3 withSection:(id)a4 isRTL:(BOOL)a5;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIAttributionFooterCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (BOOL)supportsCustomUserReportRequestAfforance
{
  return 1;
}

+ (BOOL)prefersNoSeparatorAboveRowModel:(id)a3
{
  return 1;
}

+ (void)removeIconsFromRichText:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = objc_msgSend(v3, "formattedTextItems", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v4 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [v3 setFormattedTextItems:v4];
}

- (id)setupTextButtonThatIsLeadingAttribution:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_opt_new();
  [v5 setProminence:3];
  uint64_t v6 = [MEMORY[0x1E4FAE090] cachedFontForTextStyle:*MEMORY[0x1E4FB28E0] isShort:TLKSnippetModernizationEnabled() ^ 1 isBold:0];
  [v5 setFont:v6];

  [v5 setMatchesHeightForAlignmentRectWithIntrinsicContentSize:1];
  uint64_t v7 = &selRef_didPressLeadingTextButton;
  if (v3)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = &selRef_didPressTrailingTextButton_;
    uint64_t v8 = 2;
  }
  [v5 addTarget:self action:*v7];
  [v5 setAlignment:v8];
  return v5;
}

- (id)setupContentView
{
  v23[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SearchUIAttributionFooterCardSectionView *)self setupTextButtonThatIsLeadingAttribution:1];
  [(SearchUIAttributionFooterCardSectionView *)self setLeadingTextButton:v3];

  v4 = [(SearchUIAttributionFooterCardSectionView *)self setupTextButtonThatIsLeadingAttribution:0];
  [(SearchUIAttributionFooterCardSectionView *)self setTrailingTextButton:v4];

  id v5 = objc_alloc(MEMORY[0x1E4FAE158]);
  uint64_t v6 = [(SearchUIAttributionFooterCardSectionView *)self leadingTextButton];
  v23[0] = v6;
  uint64_t v7 = [(SearchUIAttributionFooterCardSectionView *)self trailingTextButton];
  v23[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  uint64_t v9 = (void *)[v5 initWithArrangedSubviews:v8];
  [(SearchUIAttributionFooterCardSectionView *)self setStackView:v9];

  double v10 = *MEMORY[0x1E4FAE1B8];
  long long v11 = [(SearchUIAttributionFooterCardSectionView *)self stackView];
  [v11 setSpacing:v10];

  [MEMORY[0x1E4FAE1A0] defaultLayoutMargins];
  double v13 = v12;
  [MEMORY[0x1E4FAE1A0] defaultLayoutMargins];
  double v15 = v14;
  uint64_t v16 = [(SearchUIAttributionFooterCardSectionView *)self stackView];
  objc_msgSend(v16, "setLayoutMargins:", -3.0, v13, 13.0, v15);

  v17 = [(SearchUIAttributionFooterCardSectionView *)self stackView];
  [v17 setLayoutMarginsRelativeArrangement:1];

  v18 = [(SearchUIAttributionFooterCardSectionView *)self stackView];
  [v18 setAlignment:4];

  v19 = [(SearchUIAttributionFooterCardSectionView *)self stackView];
  [v19 setDistribution:5];

  v20 = [(SearchUIAttributionFooterCardSectionView *)self stackView];
  [v20 setFlipsToVerticalAxisForAccessibilityContentSizes:1];

  v21 = [(SearchUIAttributionFooterCardSectionView *)self stackView];
  return v21;
}

- (void)setUserInteractionEnabled:(BOOL)a3 forButton:(id)a4
{
}

- (void)updateAttributionThatIsLeading:(BOOL)a3 withSection:(id)a4 isRTL:(BOOL)a5
{
  int v5 = a5;
  int v6 = a3;
  id v23 = a4;
  uint64_t v8 = [v23 userReportRequest];
  uint64_t v9 = [v8 affordanceText];

  if (v9) {
    [MEMORY[0x1E4F9A378] textWithString:v9];
  }
  else {
  double v10 = [v23 trailingAttribution];
  }
  v21 = v10;
  if (v6)
  {
    objc_msgSend(v23, "leadingAttribution", v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [(SearchUIAttributionFooterCardSectionView *)self leadingTextButton];
  }
  else
  {
    id v11 = v10;
    [(SearchUIAttributionFooterCardSectionView *)self trailingTextButton];
  double v12 = };
  double v13 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v11];
  if (v6) {
    [v23 leadingAttributionPunchout];
  }
  else {
  double v14 = [v23 trailingAttributionPunchout];
  }
  double v15 = [v11 icons];
  uint64_t v16 = [v15 firstObject];

  if (v6 != v5) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = 2;
  }
  if (v14)
  {
    [(id)objc_opt_class() removeIconsFromRichText:v13];
    [v12 setAlignment:v17];
    [v12 setRichTitle:v13];
LABEL_17:
    unsigned int v19 = [v13 hasContent];
    if (v16) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = v19;
    }
    goto LABEL_20;
  }
  [(id)objc_opt_class() removeIconsFromRichText:v13];
  [v12 setAlignment:v17];
  [v12 setRichTitle:v13];
  uint64_t v18 = 0;
  if (v9 && (v6 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_20:
  [(SearchUIAttributionFooterCardSectionView *)self setUserInteractionEnabled:v18 forButton:v12];
  v20 = +[SearchUITLKImageConverter imageForSFImage:v16];
  [v12 setTlkImage:v20];
}

- (void)updateWithRowModel:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SearchUIAttributionFooterCardSectionView;
  id v4 = a3;
  [(SearchUICardSectionView *)&v9 updateWithRowModel:v4];
  int v5 = objc_msgSend(v4, "cardSection", v9.receiver, v9.super_class);

  [(SearchUIAttributionFooterCardSectionView *)self setCardSection:v5];
  uint64_t v6 = [MEMORY[0x1E4FAE100] isLTR] ^ 1;
  uint64_t v7 = [(SearchUIAttributionFooterCardSectionView *)self cardSection];
  [(SearchUIAttributionFooterCardSectionView *)self updateAttributionThatIsLeading:1 withSection:v7 isRTL:v6];

  uint64_t v8 = [(SearchUIAttributionFooterCardSectionView *)self cardSection];
  [(SearchUIAttributionFooterCardSectionView *)self updateAttributionThatIsLeading:0 withSection:v8 isRTL:v6];

  [(SearchUIAttributionFooterCardSectionView *)self configureMenuForTrailingFootnoteButton];
}

- (void)didPressLeadingTextButton
{
  id v4 = [(SearchUIAttributionFooterCardSectionView *)self cardSection];
  BOOL v3 = [v4 leadingAttributionPunchout];
  [(SearchUICardSectionView *)self openPunchout:v3 triggerEvent:2];
}

- (void)didPressTrailingTextButton:(id)a3
{
  id v4 = [(SearchUICardSectionView *)self rowModel];
  int v5 = [v4 cardSection];
  uint64_t v6 = [v5 userReportRequest];
  uint64_t v7 = [v6 affordanceText];

  if (!v7)
  {
    uint64_t v8 = [(SearchUIAttributionFooterCardSectionView *)self cardSection];
    objc_super v9 = [v8 trailingAttributionCommand];

    if (v9)
    {
      id v18 = (id)objc_opt_new();
      double v10 = [(SearchUIAttributionFooterCardSectionView *)self cardSection];
      id v11 = [v10 trailingAttributionCommand];
      [v18 setCommand:v11];

      double v12 = [(SearchUICardSectionView *)self rowModel];
      double v13 = [(SearchUICardSectionView *)self feedbackDelegate];
      double v14 = +[SearchUIUtilities environmentForDelegate:v13];
      double v15 = +[SearchUICommandHandler handlerForButton:v18 rowModel:v12 environment:v14];
      [v15 executeWithTriggerEvent:3];
    }
    else
    {
      uint64_t v16 = [(SearchUIAttributionFooterCardSectionView *)self cardSection];
      uint64_t v17 = [v16 trailingAttributionPunchout];

      if (!v17) {
        return;
      }
      id v18 = [(SearchUIAttributionFooterCardSectionView *)self cardSection];
      double v12 = [v18 trailingAttributionPunchout];
      [(SearchUICardSectionView *)self openPunchout:v12 triggerEvent:2];
    }
  }
}

- (void)configureMenuForTrailingFootnoteButton
{
  id v8 = [(SearchUIAttributionFooterCardSectionView *)self trailingTextButton];
  BOOL v3 = [(SearchUICardSectionView *)self rowModel];
  id v4 = [v3 cardSection];
  int v5 = [v4 userReportRequest];
  uint64_t v6 = [v5 affordanceText];

  if (v6) {
    [(SearchUICardSectionView *)self configureUserReportButton:v8];
  }
  else {
    [v8 setMenu:0];
  }
  uint64_t v7 = [v8 menu];
  [v8 setShowsMenuAsPrimaryAction:v7 != 0];
}

- (TLKStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (TLKTextButton)leadingTextButton
{
  return self->_leadingTextButton;
}

- (void)setLeadingTextButton:(id)a3
{
}

- (TLKTextButton)trailingTextButton
{
  return self->_trailingTextButton;
}

- (void)setTrailingTextButton:(id)a3
{
}

- (SFAttributionFooterCardSection)cardSection
{
  return self->_cardSection;
}

- (void)setCardSection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_storeStrong((id *)&self->_trailingTextButton, 0);
  objc_storeStrong((id *)&self->_leadingTextButton, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end