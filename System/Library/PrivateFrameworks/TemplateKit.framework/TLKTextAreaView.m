@interface TLKTextAreaView
+ (id)footNoteLabelFont;
- (BOOL)disableAllObservers;
- (BOOL)isAccessoryViewBottomAligned;
- (BOOL)isHorizontallyCompressed;
- (BOOL)secondaryTitleIsDetached;
- (BOOL)truncateTitleMiddle;
- (BOOL)useCompactMode;
- (NSArray)detailTexts;
- (NSMutableArray)bulletFields;
- (NSMutableArray)detailsFields;
- (NSString)footnoteButtonText;
- (NUIContainerStackView)detailFieldAndFootnoteStackView;
- (NUIContainerStackView)detailFieldFootnoteAndAccessoryStackView;
- (NUIContainerStackView)detailFieldStackView;
- (NUIContainerStackView)footnoteContainer;
- (TLKEmbossedLabel)bannerBadgeView;
- (TLKImage)secondaryTitleImage;
- (TLKLabel)hyphenField;
- (TLKRichText)bannerText;
- (TLKRichText)footnote;
- (TLKRichText)secondaryTitle;
- (TLKRichText)title;
- (TLKRichText)topText;
- (TLKRichTextField)footnoteLabel;
- (TLKRichTextField)topTextField;
- (TLKTextAreaViewDelegate)buttonDelegate;
- (TLKTextButton)footnoteButton;
- (TLKTitleContainerView)titleContainer;
- (UIView)accessoryView;
- (id)detailsStrings;
- (id)footnoteLabelString;
- (id)secondaryTitleLabelString;
- (id)setupContentView;
- (id)titleLabelString;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (void)insertDetailsStackViewIfNeeded;
- (void)internalTextFieldsInBatchUpdate:(BOOL)a3;
- (void)performBatchUpdates:(id)a3;
- (void)propertiesDidChange;
- (void)setAccessoryView:(id)a3;
- (void)setBannerBadgeView:(id)a3;
- (void)setBannerText:(id)a3;
- (void)setBulletFields:(id)a3;
- (void)setButtonDelegate:(id)a3;
- (void)setDetailFieldAndFootnoteStackView:(id)a3;
- (void)setDetailFieldFootnoteAndAccessoryStackView:(id)a3;
- (void)setDetailFieldStackView:(id)a3;
- (void)setDetailTexts:(id)a3;
- (void)setDetailsFields:(id)a3;
- (void)setDisableAllObservers:(BOOL)a3;
- (void)setFootnote:(id)a3;
- (void)setFootnoteButton:(id)a3;
- (void)setFootnoteButtonText:(id)a3;
- (void)setFootnoteContainer:(id)a3;
- (void)setFootnoteLabel:(id)a3;
- (void)setHyphenField:(id)a3;
- (void)setIsAccessoryViewBottomAligned:(BOOL)a3;
- (void)setIsHorizontallyCompressed:(BOOL)a3;
- (void)setSecondaryTitle:(id)a3;
- (void)setSecondaryTitleImage:(id)a3;
- (void)setSecondaryTitleIsDetached:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleContainer:(id)a3;
- (void)setTopText:(id)a3;
- (void)setTopTextField:(id)a3;
- (void)setTruncateTitleMiddle:(BOOL)a3;
- (void)setUseCompactMode:(BOOL)a3;
- (void)updateBannerBadge;
- (void)updateDetailFieldStackViewVisibility;
- (void)updateDetails;
- (void)updateFootnote;
@end

@implementation TLKTextAreaView

- (id)setupContentView
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  [(TLKTextAreaView *)self setTitleContainer:v3];

  v4 = [(TLKTextAreaView *)self titleContainer];
  +[TLKLayoutUtilities requireIntrinsicSizeForView:v4];

  v5 = objc_opt_new();
  [(TLKTextAreaView *)self setDetailFieldAndFootnoteStackView:v5];

  v6 = [(TLKTextAreaView *)self detailFieldAndFootnoteStackView];
  [v6 setAxis:1];

  v7 = [(TLKTextAreaView *)self detailFieldAndFootnoteStackView];
  [v7 setArrangedSubviewRemovalPolicy:1];

  v8 = [(TLKTextAreaView *)self detailFieldAndFootnoteStackView];
  [v8 setArrangedSubviewAdditionPolicy:1];

  id v9 = objc_alloc(MEMORY[0x1E4F4BF00]);
  v10 = [(TLKTextAreaView *)self detailFieldAndFootnoteStackView];
  v21[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  v12 = (void *)[v9 initWithArrangedSubviews:v11];

  [v12 setSpacing:10.0];
  +[TLKView makeContainerShadowCompatible:v12];
  [(TLKTextAreaView *)self setDetailFieldFootnoteAndAccessoryStackView:v12];
  v13 = [TLKStackView alloc];
  v14 = [(TLKTextAreaView *)self titleContainer];
  v20[0] = v14;
  v20[1] = v12;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v16 = [(NUIContainerStackView *)v13 initWithArrangedSubviews:v15];

  [(TLKStackView *)v16 setDelegate:self];
  [(TLKStackView *)v16 setAlignment:0 forView:v12 inAxis:0];
  +[TLKView makeContainerShadowCompatible:v16];
  v17 = objc_opt_new();
  [(TLKTextAreaView *)self setDetailsFields:v17];

  v18 = objc_opt_new();
  [(TLKTextAreaView *)self setBulletFields:v18];

  return v16;
}

- (void)setBannerText:(id)a3
{
  v10 = (TLKRichText *)a3;
  if (self->_bannerText != v10)
  {
    objc_storeStrong((id *)&self->_bannerText, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        id v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setTopText:(id)a3
{
  v10 = (TLKRichText *)a3;
  if (self->_topText != v10)
  {
    objc_storeStrong((id *)&self->_topText, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        id v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setTitle:(id)a3
{
  v10 = (TLKRichText *)a3;
  if (self->_title != v10)
  {
    objc_storeStrong((id *)&self->_title, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        id v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setTruncateTitleMiddle:(BOOL)a3
{
  if (self->_truncateTitleMiddle != a3)
  {
    self->_truncateTitleMiddle = a3;
    uint64_t v4 = [(TLKView *)self observer];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      v6 = [(TLKView *)self observer];
      uint64_t v7 = [v6 batchUpdateCount];

      if (!v7)
      {
        id v8 = [(TLKView *)self observer];
        [v8 propertiesDidChange];
      }
    }
  }
}

- (void)setSecondaryTitle:(id)a3
{
  v10 = (TLKRichText *)a3;
  if (self->_secondaryTitle != v10)
  {
    objc_storeStrong((id *)&self->_secondaryTitle, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      uint64_t v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        id v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setSecondaryTitleImage:(id)a3
{
  v10 = (TLKImage *)a3;
  if (self->_secondaryTitleImage != v10)
  {
    objc_storeStrong((id *)&self->_secondaryTitleImage, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      uint64_t v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        id v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setSecondaryTitleIsDetached:(BOOL)a3
{
  if (self->_secondaryTitleIsDetached != a3)
  {
    self->_secondaryTitleIsDetached = a3;
    uint64_t v4 = [(TLKView *)self observer];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      v6 = [(TLKView *)self observer];
      uint64_t v7 = [v6 batchUpdateCount];

      if (!v7)
      {
        id v8 = [(TLKView *)self observer];
        [v8 propertiesDidChange];
      }
    }
  }
}

- (void)setDetailTexts:(id)a3
{
  v10 = (NSArray *)a3;
  if (self->_detailTexts != v10)
  {
    objc_storeStrong((id *)&self->_detailTexts, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      uint64_t v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        id v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setFootnote:(id)a3
{
  v10 = (TLKRichText *)a3;
  if (self->_footnote != v10)
  {
    objc_storeStrong((id *)&self->_footnote, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      uint64_t v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        id v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setFootnoteButtonText:(id)a3
{
  v10 = (NSString *)a3;
  if (self->_footnoteButtonText != v10)
  {
    objc_storeStrong((id *)&self->_footnoteButtonText, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      uint64_t v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        id v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setUseCompactMode:(BOOL)a3
{
  if (self->_useCompactMode != a3)
  {
    self->_useCompactMode = a3;
    uint64_t v4 = [(TLKView *)self observer];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      v6 = [(TLKView *)self observer];
      uint64_t v7 = [v6 batchUpdateCount];

      if (!v7)
      {
        id v8 = [(TLKView *)self observer];
        [v8 propertiesDidChange];
      }
    }
  }
}

- (void)setAccessoryView:(id)a3
{
  v10 = (UIView *)a3;
  if (self->_accessoryView != v10)
  {
    objc_storeStrong((id *)&self->_accessoryView, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      uint64_t v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        id v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)propertiesDidChange
{
  if (+[TLKUtilities isMacOS]) {
    uint64_t v3 = [(TLKTextAreaView *)self useCompactMode] ^ 1;
  }
  else {
    uint64_t v3 = 1;
  }
  uint64_t v4 = [(TLKView *)self contentView];
  [v4 setAxis:v3];

  uint64_t v5 = [(TLKView *)self contentView];
  if ([v5 axis]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 5;
  }
  uint64_t v7 = [(TLKView *)self contentView];
  [v7 setAlignment:v6];

  uint64_t v8 = [(TLKView *)self contentView];
  if ([v8 axis]) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 5;
  }
  v10 = [(TLKView *)self contentView];
  [v10 setAlignment:v9];

  id v42 = [(TLKTextAreaView *)self topTextField];
  v11 = [(TLKTextAreaView *)self topText];

  if (v11 && !v42)
  {
    id v42 = (id)objc_opt_new();
    [v42 setProminence:1];
    v12 = +[TLKFontUtilities cachedFontForTextStyle:*MEMORY[0x1E4FB28E0] isShort:0 isBold:1];
    [v42 setFont:v12];

    [v42 setScaleIconsToFont:1];
    v13 = [(TLKView *)self contentView];
    [v13 insertArrangedSubview:v42 atIndex:0];

    v14 = [(TLKView *)self contentView];
    +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:2.5];
    objc_msgSend(v14, "setCustomSpacing:afterView:", v42);

    [(TLKTextAreaView *)self setTopTextField:v42];
  }
  v15 = [(TLKTextAreaView *)self topText];
  [v42 setRichText:v15];

  v16 = [(TLKTextAreaView *)self topText];
  [v42 setHidden:v16 == 0];

  v17 = [(TLKTextAreaView *)self titleContainer];
  v18 = [(TLKTextAreaView *)self title];
  v19 = [(TLKTextAreaView *)self secondaryTitle];
  v20 = [(TLKTextAreaView *)self secondaryTitleImage];
  objc_msgSend(v17, "updateResultWithTitle:secondaryTitle:image:detached:useCompactMode:truncateMiddle:", v18, v19, v20, -[TLKTextAreaView secondaryTitleIsDetached](self, "secondaryTitleIsDetached"), -[TLKTextAreaView useCompactMode](self, "useCompactMode"), -[TLKTextAreaView truncateTitleMiddle](self, "truncateTitleMiddle"));

  v21 = [(TLKView *)self contentView];
  v22 = [(TLKTextAreaView *)self secondaryTitle];
  v23 = [(TLKTextAreaView *)self titleContainer];
  [v21 setAlignment:v22 == 0 forView:v23 inAxis:0];

  [(TLKTextAreaView *)self updateBannerBadge];
  [(TLKTextAreaView *)self updateDetails];
  [(TLKTextAreaView *)self updateFootnote];
  v24 = [(TLKTextAreaView *)self detailFieldFootnoteAndAccessoryStackView];
  v25 = [v24 arrangedSubviews];

  v26 = 0;
  if ((unint64_t)[v25 count] >= 2)
  {
    v26 = [v25 lastObject];
  }
  v27 = [(TLKTextAreaView *)self accessoryView];
  if (v26 != v27)
  {
    if (v26)
    {
      v28 = [(TLKTextAreaView *)self detailFieldFootnoteAndAccessoryStackView];
      [v28 removeArrangedSubview:v26];
    }
    if (v27)
    {
      objc_msgSend(v27, "setCustomAlignmentRectInsets:", -2.0, 0.0, 0.0, 0.0);
      [(TLKTextAreaView *)self insertDetailsStackViewIfNeeded];
      v29 = [(TLKTextAreaView *)self detailFieldFootnoteAndAccessoryStackView];
      [v29 addArrangedSubview:v27];
    }
  }
  v30 = [(TLKTextAreaView *)self detailsFields];
  v31 = [v30 firstObject];

  double v32 = 3.0;
  if (!+[TLKUtilities isMacOS])
  {
    double v32 = 1.0;
    if (TLKBiggerSuggestionsLayoutEnabled())
    {
      +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:1.5];
      double v32 = v33;
    }
  }
  BOOL v34 = +[TLKUtilities isMacOS];
  int v35 = TLKSnippetModernizationEnabled();
  if (v34)
  {
    if (v35) {
      double v36 = 2.0;
    }
    else {
      double v36 = 3.0;
    }
  }
  else
  {
    double v36 = 1.0;
    if (v35)
    {
      +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:1.7];
      double v36 = v37;
    }
  }
  v38 = [(TLKView *)self contentView];
  if (![(TLKTextAreaView *)self useCompactMode])
  {
    if (+[TLKUtilities isHiddenView:v31]) {
      double v32 = 5.0;
    }
    else {
      double v32 = v36;
    }
  }
  v39 = [(TLKTextAreaView *)self titleContainer];
  [v38 setCustomSpacing:v39 afterView:v32];

  [(TLKTextAreaView *)self updateDetailFieldStackViewVisibility];
  if ([(TLKTextAreaView *)self isAccessoryViewBottomAligned]) {
    uint64_t v40 = 4;
  }
  else {
    uint64_t v40 = 1;
  }
  v41 = [(TLKTextAreaView *)self detailFieldFootnoteAndAccessoryStackView];
  [v41 setAlignment:v40];
}

- (void)updateBannerBadge
{
  id v13 = [(TLKTextAreaView *)self bannerText];
  if (v13)
  {
    uint64_t v3 = [(TLKTextAreaView *)self bannerBadgeView];

    if (!v3)
    {
      uint64_t v4 = objc_opt_new();
      [(TLKTextAreaView *)self setBannerBadgeView:v4];

      uint64_t v5 = [(TLKView *)self contentView];
      uint64_t v6 = [(TLKTextAreaView *)self bannerBadgeView];
      [v5 insertArrangedSubview:v6 atIndex:0];

      uint64_t v7 = [(TLKView *)self contentView];
      uint64_t v8 = [(TLKTextAreaView *)self bannerBadgeView];
      [v7 setCustomSpacing:v8 afterView:4.0];

      uint64_t v9 = [(TLKTextAreaView *)self bannerBadgeView];
      +[TLKLayoutUtilities requireIntrinsicSizeForView:v9];
    }
  }
  v10 = [(TLKTextAreaView *)self bannerBadgeView];
  v11 = +[TLKFontUtilities cachedFontForTextStyle:*MEMORY[0x1E4FB28E0] isShort:TLKSnippetModernizationEnabled() ^ 1 isBold:1];
  objc_msgSend(v10, "setText:font:customInsetSize:badge:", v13, v11, 1, 4.0, 2.0);

  v12 = [(TLKTextAreaView *)self bannerBadgeView];
  [v12 setHidden:v13 == 0];
}

- (void)insertDetailsStackViewIfNeeded
{
  uint64_t v3 = [(TLKTextAreaView *)self detailFieldStackView];

  if (!v3)
  {
    uint64_t v4 = objc_opt_new();
    [(TLKTextAreaView *)self setDetailFieldStackView:v4];

    uint64_t v5 = [(TLKTextAreaView *)self detailFieldStackView];
    [v5 setArrangedSubviewRemovalPolicy:1];

    uint64_t v6 = [(TLKTextAreaView *)self detailFieldStackView];
    [v6 setArrangedSubviewAdditionPolicy:1];

    id v8 = [(TLKTextAreaView *)self detailFieldAndFootnoteStackView];
    uint64_t v7 = [(TLKTextAreaView *)self detailFieldStackView];
    [v8 insertArrangedSubview:v7 atIndex:0];
  }
}

- (void)updateDetails
{
  v2 = self;
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TLKTextAreaView *)self detailTexts];
  if (![v3 count]) {
    goto LABEL_38;
  }
  unint64_t v101 = 0;
  unint64_t v4 = 0;
  uint64_t v5 = (void *)*MEMORY[0x1E4FB2950];
  uint64_t v99 = *MEMORY[0x1E4FB28D0];
  uint64_t v6 = (void *)*MEMORY[0x1E4FB28E0];
  uint64_t v97 = -1;
  do
  {
    [(TLKTextAreaView *)v2 insertDetailsStackViewIfNeeded];
    uint64_t v7 = [(TLKTextAreaView *)v2 detailsFields];
    unint64_t v8 = [v7 count];

    if (v4 >= v8)
    {
      v10 = objc_opt_new();
      uint64_t v9 = [(TLKTextAreaView *)v2 detailsFields];
      [v9 addObject:v10];
    }
    else
    {
      uint64_t v9 = [(TLKTextAreaView *)v2 detailsFields];
      v10 = [v9 objectAtIndexedSubscript:v4];
    }

    objc_msgSend(v10, "setUseCompactMode:", -[TLKTextAreaView useCompactMode](v2, "useCompactMode"));
    v11 = [v3 objectAtIndexedSubscript:v4];
    if ([(TLKTextAreaView *)v2 useCompactMode]) {
      [v11 setMaxLines:1];
    }
    [v10 setRichText:v11];
    if ([(TLKTextAreaView *)v2 useCompactMode])
    {
      if (TLKBiggerSuggestionsLayoutEnabled()) {
        v12 = v5;
      }
      else {
        v12 = v6;
      }
      id v13 = v12;
      if (+[TLKUtilities isMacOS])
      {
        v14 = [(TLKTextAreaView *)v2 titleContainer];
        v15 = [v14 titleFont];
      }
      else
      {
        v15 = +[TLKFontUtilities cachedFontForTextStyle:v13 isShort:TLKSnippetModernizationEnabled() ^ 1 isBold:0];
      }
    }
    else
    {
      if (TLKSnippetModernizationEnabled())
      {
        if (+[TLKUtilities isMacOS]) {
          +[TLKFontUtilities cachedFontForMacTextStyle:v99];
        }
        else {
        uint64_t v16 = +[TLKFontUtilities cachedFontForTextStyle:v5];
        }
      }
      else
      {
        uint64_t v16 = +[TLKFontUtilities shortFootnoteFont];
      }
      v15 = (void *)v16;
    }
    [v10 setFont:v15];
    if ([(TLKTextAreaView *)v2 useCompactMode])
    {
      uint64_t v17 = [v11 stars];
      if (v17)
      {
        v18 = (void *)v17;
      }
      else
      {
        v19 = [v11 text];
        unint64_t v20 = [v19 length];

        if (v20 < v101)
        {
LABEL_29:
          v21 = [v11 stars];
          if (v21) {
            *(float *)&double v22 = 1000.0;
          }
          else {
            *(float *)&double v22 = 750.0;
          }
          [v10 setContentCompressionResistancePriority:0 forAxis:v22];

          uint64_t v23 = [v3 count];
          LODWORD(v24) = 1132068864;
          if (v4 != v23 - 1) {
            *(float *)&double v24 = 1000.0;
          }
          [v10 setContentHuggingPriority:0 forAxis:v24];
          goto LABEL_35;
        }
        v18 = [v11 text];
        unint64_t v101 = [v18 length];
        uint64_t v97 = v4;
      }

      goto LABEL_29;
    }
LABEL_35:

    ++v4;
  }
  while (v4 < [v3 count]);
  if (v97 > 0)
  {
    v25 = [(TLKTextAreaView *)v2 detailsFields];
    v26 = [v25 objectAtIndexedSubscript:v97];
    LODWORD(v27) = 1132068864;
    [v26 setContentCompressionResistancePriority:0 forAxis:v27];
  }
LABEL_38:
  v28 = objc_opt_new();
  if (+[TLKUtilities isMacOS])
  {
    if ([(TLKTextAreaView *)v2 useCompactMode]) {
      uint64_t v29 = 2;
    }
    else {
      uint64_t v29 = 1;
    }
  }
  else
  {
    uint64_t v29 = 1;
  }
  v98 = v28;
  if (+[TLKUtilities isMacOS])
  {
    v30 = [(TLKTextAreaView *)v2 detailTexts];
    if (![v30 count]) {
      goto LABEL_49;
    }
    BOOL v31 = [(TLKTextAreaView *)v2 useCompactMode];

    v28 = v98;
    if (v31)
    {
      double v32 = [(TLKTextAreaView *)v2 hyphenField];

      if (!v32)
      {
        double v33 = [[TLKLabel alloc] initWithProminence:v29];
        [(TLKTextAreaView *)v2 setHyphenField:v33];

        BOOL v34 = [(TLKTextAreaView *)v2 hyphenField];
        [v34 setText:@"—"];
      }
      int v35 = [(TLKTextAreaView *)v2 hyphenField];
      [v98 addObject:v35];

      v30 = [(TLKTextAreaView *)v2 hyphenField];
      +[TLKLayoutUtilities requireIntrinsicSizeForView:v30];
LABEL_49:

      v28 = v98;
    }
  }
  v100 = objc_opt_new();
  double v36 = [(TLKTextAreaView *)v2 detailsFields];
  uint64_t v37 = [v36 count];

  if (v37)
  {
    unint64_t v38 = 0;
    do
    {
      unint64_t v39 = [v3 count];
      uint64_t v40 = [(TLKTextAreaView *)v2 detailsFields];
      v41 = [v40 objectAtIndexedSubscript:v38];

      [v41 setHidden:v38 >= v39];
      if (v38 < v39)
      {
        [v41 setProminence:v29];
        [v100 addObject:v41];
        [v28 addObject:v41];
        if ([(TLKTextAreaView *)v2 useCompactMode])
        {
          if (v38 != [v3 count] - 1)
          {
            id v42 = [(TLKTextAreaView *)v2 bulletFields];
            unint64_t v43 = [v42 count];

            if (v38 >= v43)
            {
              v45 = [[TLKLabel alloc] initWithProminence:v29];
              v46 = [v41 font];
              [(TLKLabel *)v45 setFont:v46];

              [(TLKLabel *)v45 setText:@"·"];
              +[TLKLayoutUtilities requireIntrinsicSizeForView:v45];
              v44 = [(TLKTextAreaView *)v2 bulletFields];
              [v44 addObject:v45];
            }
            else
            {
              [0 setProminence:v29];
              v44 = [(TLKTextAreaView *)v2 bulletFields];
              v45 = [v44 objectAtIndexedSubscript:v38];
            }

            [v28 addObject:v45];
          }
        }
      }

      ++v38;
      v47 = [(TLKTextAreaView *)v2 detailsFields];
      unint64_t v48 = [v47 count];
    }
    while (v38 < v48);
  }
  v49 = [(TLKTextAreaView *)v2 detailFieldStackView];
  [v49 setArrangedSubviews:v28];

  [(TLKTextAreaView *)v2 updateDetailFieldStackViewVisibility];
  uint64_t v50 = [(TLKTextAreaView *)v2 useCompactMode] ^ 1;
  v51 = [(TLKTextAreaView *)v2 detailFieldStackView];
  [v51 setAxis:v50];

  if ([(TLKTextAreaView *)v2 useCompactMode]) {
    uint64_t v52 = 5;
  }
  else {
    uint64_t v52 = 1;
  }
  v53 = [(TLKTextAreaView *)v2 detailFieldStackView];
  [v53 setAlignment:v52];

  int v54 = TLKSnippetModernizationEnabled();
  BOOL v55 = +[TLKUtilities isMacOS];
  double v56 = 2.0;
  if (v55) {
    double v57 = 0.0;
  }
  else {
    double v57 = 2.0;
  }
  if (!v55) {
    double v56 = 0.0;
  }
  if (v54) {
    double v58 = v57;
  }
  else {
    double v58 = v56;
  }
  if ([(TLKTextAreaView *)v2 useCompactMode]) {
    double v59 = 3.0;
  }
  else {
    double v59 = v58;
  }
  v60 = [(TLKTextAreaView *)v2 detailFieldStackView];
  [v60 setSpacing:v59];

  if (+[TLKUtilities isMacOS])
  {
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    id v61 = v28;
    uint64_t v62 = [v61 countByEnumeratingWithState:&v111 objects:v117 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v112;
      double v65 = *MEMORY[0x1E4F4BEC8];
      do
      {
        for (uint64_t i = 0; i != v63; ++i)
        {
          if (*(void *)v112 != v64) {
            objc_enumerationMutation(v61);
          }
          uint64_t v67 = *(void *)(*((void *)&v111 + 1) + 8 * i);
          v68 = [(TLKTextAreaView *)v2 detailFieldStackView];
          [v68 setCustomSpacing:v67 afterView:v65];
        }
        uint64_t v63 = [v61 countByEnumeratingWithState:&v111 objects:v117 count:16];
      }
      while (v63);
    }

    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v69 = v61;
    uint64_t v70 = [v69 countByEnumeratingWithState:&v107 objects:v116 count:16];
    if (v70)
    {
      uint64_t v71 = v70;
      id v72 = 0;
      uint64_t v73 = *(void *)v108;
      unint64_t v74 = 0x1EB3A2000uLL;
      do
      {
        uint64_t v75 = 0;
        uint64_t v102 = v71;
        do
        {
          v76 = v72;
          if (*(void *)v108 != v73) {
            objc_enumerationMutation(v69);
          }
          v77 = *(void **)(*((void *)&v107 + 1) + 8 * v75);
          if (([v77 isHidden] & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v77 richText];
              uint64_t v78 = v73;
              v79 = v2;
              id v80 = v69;
              v82 = unint64_t v81 = v74;
              v83 = [v82 icons];
              uint64_t v84 = [v83 count];

              unint64_t v74 = v81;
              id v69 = v80;
              v2 = v79;
              uint64_t v73 = v78;
              uint64_t v71 = v102;
              if (v84 == 1)
              {
                v85 = [(TLKTextAreaView *)v2 detailFieldStackView];
                [v85 setCustomSpacing:v76 afterView:v58];

                v86 = [(TLKTextAreaView *)v2 detailFieldStackView];
                [v86 setCustomSpacing:v77 afterView:3.0];
              }
            }
          }
          id v72 = v77;

          ++v75;
        }
        while (v71 != v75);
        uint64_t v71 = [v69 countByEnumeratingWithState:&v107 objects:v116 count:16];
      }
      while (v71);
    }
    else
    {
      id v72 = 0;
    }
  }
  else
  {
    id v72 = 0;
  }
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v87 = v100;
  uint64_t v88 = [v87 countByEnumeratingWithState:&v103 objects:v115 count:16];
  if (v88)
  {
    uint64_t v89 = v88;
    uint64_t v90 = *(void *)v104;
    do
    {
      for (uint64_t j = 0; j != v89; ++j)
      {
        if (*(void *)v104 != v90) {
          objc_enumerationMutation(v87);
        }
        v92 = *(void **)(*((void *)&v103 + 1) + 8 * j);
        if ([(TLKTextAreaView *)v2 useCompactMode])
        {
          v93 = [v92 viewForLastBaselineLayout];
          uint64_t v94 = [v92 alignmentForView:v93 inAxis:1];

          if (v94 == -1) {
            uint64_t v94 = [v92 alignment];
          }
        }
        else
        {
          uint64_t v94 = -1;
        }
        v95 = [(TLKTextAreaView *)v2 detailFieldStackView];
        [v95 setAlignment:v94 forView:v92 inAxis:1];
      }
      uint64_t v89 = [v87 countByEnumeratingWithState:&v103 objects:v115 count:16];
    }
    while (v89);
  }
}

- (void)updateDetailFieldStackViewVisibility
{
  uint64_t v3 = [(TLKTextAreaView *)self detailFieldStackView];
  unint64_t v4 = [v3 visibleArrangedSubviews];
  if ([v4 count])
  {
    if ([(TLKTextAreaView *)self useCompactMode]) {
      BOOL v5 = [(TLKTextAreaView *)self isHorizontallyCompressed];
    }
    else {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 1;
  }
  uint64_t v6 = [(TLKTextAreaView *)self detailFieldStackView];
  [v6 setHidden:v5];

  uint64_t v7 = [(TLKTextAreaView *)self detailFieldAndFootnoteStackView];
  unint64_t v8 = [v7 visibleArrangedSubviews];
  BOOL v9 = [v8 count] == 0;
  v10 = [(TLKTextAreaView *)self detailFieldAndFootnoteStackView];
  [v10 setHidden:v9];

  id v14 = [(TLKTextAreaView *)self detailFieldFootnoteAndAccessoryStackView];
  v11 = [v14 visibleArrangedSubviews];
  BOOL v12 = [v11 count] == 0;
  id v13 = [(TLKTextAreaView *)self detailFieldFootnoteAndAccessoryStackView];
  [v13 setHidden:v12];
}

- (void)performBatchUpdates:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__TLKTextAreaView_performBatchUpdates___block_invoke;
  v7[3] = &unk_1E5FD30C0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)TLKTextAreaView;
  id v5 = v4;
  [(TLKView *)&v6 performBatchUpdates:v7];
}

uint64_t __39__TLKTextAreaView_performBatchUpdates___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) internalTextFieldsInBatchUpdate:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 internalTextFieldsInBatchUpdate:0];
}

- (void)internalTextFieldsInBatchUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(TLKTextAreaView *)self detailsFields];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    if (v3) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = -1;
    }
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 observer];
        uint64_t v12 = [v11 batchUpdateCount] + v8;
        id v13 = [v10 observer];
        [v13 setBatchUpdateCount:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)updateFootnote
{
  uint64_t v4 = [(TLKTextAreaView *)self footnote];
  uint64_t v5 = [(TLKTextAreaView *)self footnoteButtonText];
  if (v4 | v5)
  {
    uint64_t v6 = [(TLKTextAreaView *)self footnoteContainer];

    if (!v6)
    {
      uint64_t v7 = objc_opt_new();
      [(TLKTextAreaView *)self setFootnoteContainer:v7];

      uint64_t v8 = [(TLKTextAreaView *)self footnoteContainer];
      [v8 setAlignment:5];

      BOOL v9 = objc_opt_new();
      [(TLKTextAreaView *)self setFootnoteLabel:v9];
      v10 = [(TLKTextAreaView *)self footnoteContainer];
      [v10 addArrangedSubview:v9];

      v11 = [(TLKTextAreaView *)self detailFieldAndFootnoteStackView];
      uint64_t v12 = [(TLKTextAreaView *)self footnoteContainer];
      [v11 addArrangedSubview:v12];
    }
    int v13 = TLKBiggerSuggestionsLayoutEnabled();
    long long v14 = (id *)MEMORY[0x1E4FB2950];
    if (!v13) {
      long long v14 = (id *)MEMORY[0x1E4FB28E0];
    }
    id v15 = *v14;
    if ([(TLKTextAreaView *)self useCompactMode]) {
      +[TLKFontUtilities cachedFontForTextStyle:v15];
    }
    else {
    long long v16 = [(id)objc_opt_class() footNoteLabelFont];
    }
    long long v17 = [(TLKTextAreaView *)self footnoteLabel];
    [v17 setFont:v16];

    if (v5)
    {
      v18 = [(TLKTextAreaView *)self footnoteButton];

      if (!v18)
      {
        uint64_t v19 = objc_opt_new();
        unint64_t v20 = [(TLKTextAreaView *)self buttonDelegate];
        [v19 addTarget:v20 action:sel_footnoteButtonPressed];

        [v19 setProminence:3];
        [v19 setMatchesHeightForAlignmentRectWithIntrinsicContentSize:1];
        if (+[TLKLayoutUtilities isLTR]) {
          uint64_t v21 = 2;
        }
        else {
          uint64_t v21 = 0;
        }
        double v22 = [v19 titleLabel];
        [v22 setTextAlignment:v21];

        +[TLKLayoutUtilities requireIntrinsicSizeForView:v19];
        [(TLKTextAreaView *)self setFootnoteButton:v19];
        uint64_t v23 = [(TLKTextAreaView *)self footnoteContainer];
        v2 = [(TLKTextAreaView *)self footnoteButton];
        [v23 addArrangedSubview:v2];
      }
    }
    double v24 = [(TLKTextAreaView *)self footnoteButton];
    [v24 setFont:v16];

    v25 = [(TLKTextAreaView *)self footnoteButton];

    if (v25)
    {
      id v26 = v15;
      if (v5)
      {
        v25 = [(TLKTextAreaView *)self buttonDelegate];
        if (objc_opt_respondsToSelector())
        {
          double v27 = [(TLKTextAreaView *)self buttonDelegate];
          v2 = [(TLKTextAreaView *)self footnoteButton];
          unint64_t v48 = v27;
          uint64_t v28 = [v27 configureMenuForFootnoteButton:v2];
          int v29 = 1;
        }
        else
        {
          int v29 = 0;
          uint64_t v28 = 0;
        }
      }
      else
      {
        int v29 = 0;
        uint64_t v28 = 0;
      }
      v30 = [(TLKTextAreaView *)self footnoteButton];
      [v30 setShowsMenuAsPrimaryAction:v28];

      if (v29)
      {
      }
      id v15 = v26;
      if (v5) {
    }
      }
    BOOL v31 = [(TLKTextAreaView *)self footnoteButton];
    [v31 setTitle:v5];

    double v32 = [(TLKTextAreaView *)self footnoteLabel];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __33__TLKTextAreaView_updateFootnote__block_invoke;
    v49[3] = &unk_1E5FD3020;
    v49[4] = self;
    id v50 = (id)v4;
    [v32 performBatchUpdates:v49];

    double v33 = [(TLKTextAreaView *)self detailFieldAndFootnoteStackView];
    BOOL v34 = [(TLKTextAreaView *)self footnoteContainer];
    [v33 setAlignment:v5 == 0 forView:v34 inAxis:0];

    if ([(TLKTextAreaView *)self useCompactMode]) {
      uint64_t v35 = 1;
    }
    else {
      uint64_t v35 = 2;
    }
    double v36 = [(TLKTextAreaView *)self footnoteLabel];
    [v36 setProminence:v35];

    double v37 = 1.0;
    if (![(TLKTextAreaView *)self useCompactMode])
    {
      if (TLKSnippetModernizationEnabled()) {
        double v37 = 3.0;
      }
      else {
        double v37 = 4.0;
      }
    }
    unint64_t v38 = [(TLKTextAreaView *)self detailFieldAndFootnoteStackView];
    unint64_t v39 = [(TLKTextAreaView *)self detailFieldStackView];
    [v38 setCustomSpacing:v39 afterView:v37];
  }
  uint64_t v40 = [(id)v4 hasContent] ^ 1;
  v41 = [(TLKTextAreaView *)self footnoteLabel];
  [v41 setHidden:v40];

  BOOL v42 = [(id)v5 length] == 0;
  unint64_t v43 = [(TLKTextAreaView *)self footnoteButton];
  [v43 setHidden:v42];

  v44 = [(TLKTextAreaView *)self footnoteContainer];
  v45 = [v44 visibleArrangedSubviews];
  BOOL v46 = [v45 count] == 0;
  v47 = [(TLKTextAreaView *)self footnoteContainer];
  [v47 setHidden:v46];
}

void __33__TLKTextAreaView_updateFootnote__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) footnoteLabel];
  [v2 setRichText:v1];
}

+ (id)footNoteLabelFont
{
  if (TLKSnippetModernizationEnabled())
  {
    if (+[TLKUtilities isMacOS])
    {
      id v2 = +[TLKFontUtilities cachedFontForMacTextStyle:*MEMORY[0x1E4FB28D8]];
      goto LABEL_7;
    }
    BOOL v3 = (void *)MEMORY[0x1E4FB28F0];
  }
  else
  {
    BOOL v3 = (void *)MEMORY[0x1E4FB28E0];
  }
  id v2 = +[TLKFontUtilities cachedFontForTextStyle:*v3];
LABEL_7:
  return v2;
}

- (id)viewForFirstBaselineLayout
{
  BOOL v3 = [(TLKView *)self contentView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    while (1)
    {
      uint64_t v4 = [v3 viewForFirstBaselineLayout];

      if (v4 == v3) {
        break;
      }
      uint64_t v5 = [v3 viewForFirstBaselineLayout];

      uint64_t v6 = [(TLKTextAreaView *)self detailFieldFootnoteAndAccessoryStackView];

      if (v5 == v6)
      {
        uint64_t v7 = [(TLKTextAreaView *)self detailFieldAndFootnoteStackView];

        uint64_t v5 = (void *)v7;
      }
      objc_opt_class();
      BOOL v3 = v5;
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_8;
      }
    }
  }
  uint64_t v5 = v3;
LABEL_8:
  return v5;
}

- (id)viewForLastBaselineLayout
{
  BOOL v3 = [(TLKView *)self contentView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    while (1)
    {
      uint64_t v4 = [v3 viewForLastBaselineLayout];

      if (v4 == v3) {
        break;
      }
      uint64_t v5 = [v3 viewForLastBaselineLayout];

      uint64_t v6 = [(TLKTextAreaView *)self detailFieldFootnoteAndAccessoryStackView];

      if (v5 == v6)
      {
        uint64_t v7 = [(TLKTextAreaView *)self detailFieldAndFootnoteStackView];

        uint64_t v5 = (void *)v7;
      }
      objc_opt_class();
      BOOL v3 = v5;
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_8;
      }
    }
  }
  uint64_t v5 = v3;
LABEL_8:
  return v5;
}

- (id)detailsStrings
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(TLKTextAreaView *)self detailsFields];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v9 isHidden] & 1) == 0)
        {
          v10 = [v9 attributedString];
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)titleLabelString
{
  id v2 = [(TLKTextAreaView *)self titleContainer];
  BOOL v3 = [v2 titleLabelString];

  return v3;
}

- (id)secondaryTitleLabelString
{
  id v2 = [(TLKTextAreaView *)self titleContainer];
  BOOL v3 = [v2 secondaryTitleLabelString];

  return v3;
}

- (id)footnoteLabelString
{
  BOOL v3 = [(TLKTextAreaView *)self footnoteLabel];
  char v4 = [v3 isHidden];

  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = [(TLKTextAreaView *)self footnoteLabel];
    uint64_t v7 = [v6 attributedString];
    uint64_t v5 = [v7 string];
  }
  return v5;
}

- (TLKTextAreaViewDelegate)buttonDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonDelegate);
  return (TLKTextAreaViewDelegate *)WeakRetained;
}

- (void)setButtonDelegate:(id)a3
{
}

- (TLKRichText)bannerText
{
  return self->_bannerText;
}

- (TLKRichText)topText
{
  return self->_topText;
}

- (TLKRichText)title
{
  return self->_title;
}

- (BOOL)truncateTitleMiddle
{
  return self->_truncateTitleMiddle;
}

- (TLKRichText)secondaryTitle
{
  return self->_secondaryTitle;
}

- (TLKImage)secondaryTitleImage
{
  return self->_secondaryTitleImage;
}

- (BOOL)secondaryTitleIsDetached
{
  return self->_secondaryTitleIsDetached;
}

- (NSArray)detailTexts
{
  return self->_detailTexts;
}

- (TLKRichText)footnote
{
  return self->_footnote;
}

- (NSString)footnoteButtonText
{
  return self->_footnoteButtonText;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (BOOL)isAccessoryViewBottomAligned
{
  return self->_isAccessoryViewBottomAligned;
}

- (void)setIsAccessoryViewBottomAligned:(BOOL)a3
{
  self->_isAccessoryViewBottomAligned = a3;
}

- (BOOL)useCompactMode
{
  return self->_useCompactMode;
}

- (TLKEmbossedLabel)bannerBadgeView
{
  return self->_bannerBadgeView;
}

- (void)setBannerBadgeView:(id)a3
{
}

- (TLKRichTextField)topTextField
{
  return self->_topTextField;
}

- (void)setTopTextField:(id)a3
{
}

- (TLKTitleContainerView)titleContainer
{
  return self->_titleContainer;
}

- (void)setTitleContainer:(id)a3
{
}

- (NUIContainerStackView)detailFieldFootnoteAndAccessoryStackView
{
  return self->_detailFieldFootnoteAndAccessoryStackView;
}

- (void)setDetailFieldFootnoteAndAccessoryStackView:(id)a3
{
}

- (NUIContainerStackView)detailFieldAndFootnoteStackView
{
  return self->_detailFieldAndFootnoteStackView;
}

- (void)setDetailFieldAndFootnoteStackView:(id)a3
{
}

- (NUIContainerStackView)detailFieldStackView
{
  return self->_detailFieldStackView;
}

- (void)setDetailFieldStackView:(id)a3
{
}

- (NSMutableArray)detailsFields
{
  return self->_detailsFields;
}

- (void)setDetailsFields:(id)a3
{
}

- (NSMutableArray)bulletFields
{
  return self->_bulletFields;
}

- (void)setBulletFields:(id)a3
{
}

- (TLKLabel)hyphenField
{
  return self->_hyphenField;
}

- (void)setHyphenField:(id)a3
{
}

- (TLKRichTextField)footnoteLabel
{
  return self->_footnoteLabel;
}

- (void)setFootnoteLabel:(id)a3
{
}

- (TLKTextButton)footnoteButton
{
  return self->_footnoteButton;
}

- (void)setFootnoteButton:(id)a3
{
}

- (NUIContainerStackView)footnoteContainer
{
  return self->_footnoteContainer;
}

- (void)setFootnoteContainer:(id)a3
{
}

- (BOOL)disableAllObservers
{
  return self->_disableAllObservers;
}

- (void)setDisableAllObservers:(BOOL)a3
{
  self->_disableAllObservers = a3;
}

- (BOOL)isHorizontallyCompressed
{
  return self->_isHorizontallyCompressed;
}

- (void)setIsHorizontallyCompressed:(BOOL)a3
{
  self->_isHorizontallyCompressed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnoteContainer, 0);
  objc_storeStrong((id *)&self->_footnoteButton, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_hyphenField, 0);
  objc_storeStrong((id *)&self->_bulletFields, 0);
  objc_storeStrong((id *)&self->_detailsFields, 0);
  objc_storeStrong((id *)&self->_detailFieldStackView, 0);
  objc_storeStrong((id *)&self->_detailFieldAndFootnoteStackView, 0);
  objc_storeStrong((id *)&self->_detailFieldFootnoteAndAccessoryStackView, 0);
  objc_storeStrong((id *)&self->_titleContainer, 0);
  objc_storeStrong((id *)&self->_topTextField, 0);
  objc_storeStrong((id *)&self->_bannerBadgeView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_footnoteButtonText, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_detailTexts, 0);
  objc_storeStrong((id *)&self->_secondaryTitleImage, 0);
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_topText, 0);
  objc_storeStrong((id *)&self->_bannerText, 0);
  objc_destroyWeak((id *)&self->_buttonDelegate);
}

@end