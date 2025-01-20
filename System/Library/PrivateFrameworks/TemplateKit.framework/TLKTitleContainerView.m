@interface TLKTitleContainerView
+ (BOOL)hasNonBoldFormattingInRichText:(id)a3;
- (NUIContainerBoxView)secondaryImageViewBoxView;
- (TLKImageView)secondaryImageView;
- (TLKLabel)secondaryLabel;
- (TLKRichTextField)titleField;
- (TLKTitleContainerView)init;
- (id)secondaryTitleLabelString;
- (id)titleFont;
- (id)titleLabel;
- (id)titleLabelString;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (void)setSecondaryImageView:(id)a3;
- (void)setSecondaryImageViewBoxView:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setTitleField:(id)a3;
- (void)updateResultWithTitle:(id)a3 secondaryTitle:(id)a4 image:(id)a5 detached:(BOOL)a6 useCompactMode:(BOOL)a7 truncateMiddle:(BOOL)a8;
@end

@implementation TLKTitleContainerView

- (TLKTitleContainerView)init
{
  v8.receiver = self;
  v8.super_class = (Class)TLKTitleContainerView;
  v2 = [(TLKTitleContainerView *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(TLKStackView *)v2 setFlipsToVerticalAxisForAccessibilityContentSizes:1];
    [(TLKStackView *)v3 setAlignment:5];
    v4 = objc_opt_new();
    [(TLKTitleContainerView *)v3 setTitleField:v4];

    v5 = [(TLKTitleContainerView *)v3 titleField];
    [v5 setRoundedCornerLabelSizeConfiguration:2];

    v6 = [(TLKTitleContainerView *)v3 titleField];
    [(TLKStackView *)v3 addArrangedSubview:v6];
  }
  return v3;
}

- (void)updateResultWithTitle:(id)a3 secondaryTitle:(id)a4 image:(id)a5 detached:(BOOL)a6 useCompactMode:(BOOL)a7 truncateMiddle:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __107__TLKTitleContainerView_updateResultWithTitle_secondaryTitle_image_detached_useCompactMode_truncateMiddle___block_invoke;
  v20[3] = &unk_1E5FD34B8;
  id v21 = v14;
  id v22 = v15;
  id v23 = v16;
  v24 = self;
  BOOL v25 = a6;
  BOOL v26 = a7;
  BOOL v27 = a8;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  [(TLKTitleContainerView *)self performBatchUpdates:v20];
}

void __107__TLKTitleContainerView_updateResultWithTitle_secondaryTitle_image_detached_useCompactMode_truncateMiddle___block_invoke(uint64_t a1)
{
  v53[1] = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) hasContent] & 1) != 0
    || [*(id *)(a1 + 40) hasContent])
  {
    v2 = (id *)(a1 + 56);
    [*(id *)(a1 + 56) setHidden:0];
  }
  else
  {
    v2 = (id *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 48);
    [*(id *)(a1 + 56) setHidden:v11 == 0];
    if (!v11) {
      return;
    }
  }
  int v3 = [*(id *)(a1 + 40) hasContent];
  int v4 = *(unsigned __int8 *)(a1 + 64);
  double v5 = 16.0;
  if (!*(unsigned char *)(a1 + 64)) {
    double v5 = 4.0;
  }
  uint64_t v6 = *(void *)(a1 + 48);
  [*(id *)(a1 + 56) setSpacing:v5];
  v7 = [*(id *)(a1 + 56) titleField];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __107__TLKTitleContainerView_updateResultWithTitle_secondaryTitle_image_detached_useCompactMode_truncateMiddle___block_invoke_2;
  v49[3] = &unk_1E5FD3490;
  v49[4] = *(void *)(a1 + 56);
  id v50 = *(id *)(a1 + 32);
  __int16 v51 = *(_WORD *)(a1 + 65);
  char v52 = v3;
  [v7 performBatchUpdates:v49];

  if (v3)
  {
    objc_super v8 = [*v2 secondaryLabel];

    if (!v8)
    {
      v9 = +[TLKLabel secondaryLabel];
      [*v2 setSecondaryLabel:v9];

      if (TLKSnippetModernizationEnabled())
      {
        if (+[TLKUtilities isMacOS]) {
          +[TLKFontUtilities cachedFontForMacTextStyle:*MEMORY[0x1E4FB28D0]];
        }
        else {
        uint64_t v10 = +[TLKFontUtilities cachedFontForTextStyle:*MEMORY[0x1E4FB2950]];
        }
      }
      else
      {
        uint64_t v10 = +[TLKFontUtilities footnoteFont];
      }
      v12 = (void *)v10;
      v13 = [*v2 secondaryLabel];
      [v13 setFont:v12];

      id v14 = *v2;
      id v15 = [*v2 secondaryLabel];
      [v14 insertArrangedSubview:v15 atIndex:1];
    }
    [*(id *)(a1 + 40) setMaxLines:1];
    uint64_t v16 = *(void *)(a1 + 40);
    id v17 = [*(id *)(a1 + 56) secondaryLabel];
    [v17 setRichText:v16];
  }
  id v18 = [*v2 secondaryLabel];
  [v18 setHidden:v3 ^ 1u];

  if (v6)
  {
    id v19 = [*v2 secondaryImageView];

    if (!v19)
    {
      v20 = objc_opt_new();
      [*v2 setSecondaryImageView:v20];

      id v21 = [*v2 secondaryLabel];
      id v22 = [v21 font];
      id v23 = [*v2 secondaryImageView];
      [v23 setSymbolFont:v22];

      v24 = [*v2 secondaryImageView];
      [v24 setSymbolScale:1];

      id v25 = objc_alloc(MEMORY[0x1E4F4BEE8]);
      BOOL v26 = [*v2 secondaryImageView];
      v53[0] = v26;
      BOOL v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
      v28 = (void *)[v25 initWithArrangedSubviews:v27];
      [*v2 setSecondaryImageViewBoxView:v28];

      v29 = [*v2 secondaryImageViewBoxView];
      [v29 setHorizontalAlignment:1];

      v30 = [*v2 secondaryImageViewBoxView];
      LODWORD(v31) = 1148846080;
      [v30 setContentCompressionResistancePriority:0 forAxis:v31];

      id v32 = *v2;
      v33 = [*v2 secondaryImageViewBoxView];
      [v32 addArrangedSubview:v33];
    }
    uint64_t v34 = *(void *)(a1 + 48);
    v35 = [*(id *)(a1 + 56) secondaryImageView];
    [v35 setTlkImage:v34];
  }
  v36 = [*v2 secondaryImageViewBoxView];
  [v36 setHidden:v6 == 0];

  id v37 = *v2;
  if (v4)
  {
    v38 = [v37 titleField];
    v39 = [*v2 secondaryLabel];
    float v41 = 0.0;
  }
  else
  {
    v38 = [v37 secondaryLabel];
    v39 = [*v2 titleField];
    HIDWORD(v40) = 0;
    if (v6) {
      float v41 = 0.0;
    }
    else {
      float v41 = 1.0;
    }
  }
  LODWORD(v40) = 1148813312;
  [v38 setContentCompressionResistancePriority:0 forAxis:v40];
  LODWORD(v42) = 1148829696;
  [v39 setContentCompressionResistancePriority:0 forAxis:v42];
  float v43 = 0.0;
  if (v4) {
    float v43 = 1.0;
  }
  float v44 = 1000.0 - v43;
  v45 = [*v2 titleField];
  *(float *)&double v46 = v44;
  [v45 setContentHuggingPriority:0 forAxis:v46];

  v47 = [*v2 secondaryLabel];
  *(float *)&double v48 = 1000.0 - v41;
  [v47 setContentHuggingPriority:0 forAxis:v48];
}

void __107__TLKTitleContainerView_updateResultWithTitle_secondaryTitle_image_detached_useCompactMode_truncateMiddle___block_invoke_2(uint64_t a1)
{
  int v2 = [(id)objc_opt_class() hasNonBoldFormattingInRichText:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 48))
  {
    if (!+[TLKUtilities isMacOS])
    {
      if (TLKBiggerSuggestionsLayoutEnabled()) {
        +[TLKFontUtilities cachedFontForTextStyle:*MEMORY[0x1E4FB28C8] isShort:0 isBold:1];
      }
      else {
      uint64_t v3 = +[TLKFontUtilities cachedFontForTextStyle:*MEMORY[0x1E4FB28C8] isShort:TLKSnippetModernizationEnabled() ^ 1 fontWeight:*MEMORY[0x1E4FB29C0]];
      }
      goto LABEL_13;
    }
LABEL_8:
    uint64_t v3 = +[TLKFontUtilities cachedFontForMacTextStyle:*MEMORY[0x1E4FB28C8]];
LABEL_13:
    id v18 = (id)v3;
    goto LABEL_14;
  }
  int v4 = v2;
  if (TLKSnippetModernizationEnabled() && +[TLKUtilities isMacOS]) {
    goto LABEL_8;
  }
  int v5 = TLKSnippetModernizationEnabled();
  uint64_t v6 = (id *)MEMORY[0x1E4FB28C8];
  if (!v5) {
    uint64_t v6 = (id *)MEMORY[0x1E4FB2950];
  }
  id v7 = *v6;
  id v18 = +[TLKFontUtilities cachedFontForTextStyle:v7 isShort:TLKSnippetModernizationEnabled() ^ 1 isBold:v4 ^ 1u];

LABEL_14:
  objc_super v8 = [*(id *)(a1 + 32) titleLabel];
  [v8 setAttributedText:0];

  v9 = [*(id *)(a1 + 32) titleLabel];
  [v9 setFont:v18];

  if (*(unsigned char *)(a1 + 49)) {
    uint64_t v10 = 5;
  }
  else {
    uint64_t v10 = 4;
  }
  uint64_t v11 = [*(id *)(a1 + 32) titleField];
  v12 = [v11 textLabel];
  [v12 setLineBreakMode:v10];

  BOOL v13 = +[TLKLayoutUtilities isSuperLargeAccessibilitySize];
  if (*(unsigned char *)(a1 + 50) || (!*(unsigned char *)(a1 + 48) ? (int v14 = 1) : (int v14 = v13), v14 != 1)) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = [*(id *)(a1 + 40) maxLines];
  }
  [*(id *)(a1 + 40) setMaxLines:v15];
  uint64_t v16 = *(void *)(a1 + 40);
  id v17 = [*(id *)(a1 + 32) titleField];
  [v17 setRichText:v16];
}

+ (BOOL)hasNonBoldFormattingInRichText:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = objc_msgSend(a3, "formattedTextItems", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && ([v7 isBold])
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (id)titleFont
{
  int v2 = [(TLKTitleContainerView *)self titleField];
  uint64_t v3 = [v2 font];

  return v3;
}

- (id)viewForFirstBaselineLayout
{
  int v2 = [(TLKTitleContainerView *)self titleField];
  uint64_t v3 = [v2 viewForFirstBaselineLayout];

  return v3;
}

- (id)viewForLastBaselineLayout
{
  int v2 = [(TLKTitleContainerView *)self titleField];
  uint64_t v3 = [v2 viewForLastBaselineLayout];

  return v3;
}

- (id)titleLabelString
{
  int v2 = [(TLKTitleContainerView *)self titleField];
  uint64_t v3 = [v2 richText];
  uint64_t v4 = [v3 text];

  return v4;
}

- (id)secondaryTitleLabelString
{
  int v2 = [(TLKTitleContainerView *)self secondaryLabel];
  uint64_t v3 = [v2 text];

  return v3;
}

- (id)titleLabel
{
  int v2 = [(TLKTitleContainerView *)self titleField];
  uint64_t v3 = [v2 textLabel];

  return v3;
}

- (TLKRichTextField)titleField
{
  return self->_titleField;
}

- (void)setTitleField:(id)a3
{
}

- (TLKLabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (NUIContainerBoxView)secondaryImageViewBoxView
{
  return self->_secondaryImageViewBoxView;
}

- (void)setSecondaryImageViewBoxView:(id)a3
{
}

- (TLKImageView)secondaryImageView
{
  return self->_secondaryImageView;
}

- (void)setSecondaryImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryImageView, 0);
  objc_storeStrong((id *)&self->_secondaryImageViewBoxView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_titleField, 0);
}

@end