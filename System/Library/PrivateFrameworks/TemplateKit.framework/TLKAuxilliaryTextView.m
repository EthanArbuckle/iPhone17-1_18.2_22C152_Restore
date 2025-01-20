@interface TLKAuxilliaryTextView
- (BOOL)useCompactMode;
- (TLKLabel)bottomLabel;
- (TLKLabel)middleLabel;
- (TLKLabel)topLabel;
- (TLKRichText)bottomText;
- (TLKRichText)middleText;
- (TLKRichText)topText;
- (id)bottomLabelFont;
- (id)bottomLabelString;
- (id)middleLabelFont;
- (id)middleLabelString;
- (id)setupContentView;
- (id)topLabelString;
- (void)observedPropertiesChanged;
- (void)setBottomLabel:(id)a3;
- (void)setBottomText:(id)a3;
- (void)setMiddleLabel:(id)a3;
- (void)setMiddleText:(id)a3;
- (void)setTopLabel:(id)a3;
- (void)setTopText:(id)a3;
- (void)setUseCompactMode:(BOOL)a3;
@end

@implementation TLKAuxilliaryTextView

- (id)setupContentView
{
  v3 = objc_opt_new();
  [v3 setDelegate:self];
  [v3 setAxis:1];
  int v4 = +[TLKLayoutUtilities isLTR];
  v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  v6 = [v5 preferredContentSizeCategory];
  int IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  [(TLKAuxilliaryTextView *)self setUserInteractionEnabled:0];
  if (v4 != IsAccessibilityCategory) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = objc_opt_new();
  [v9 setSupportsColorGlyphs:1];
  [v9 setTextAlignment:v8];
  [(TLKAuxilliaryTextView *)self setTopLabel:v9];
  [v3 addArrangedSubview:v9];
  v10 = objc_opt_new();
  [v10 setTextAlignment:v8];
  [(TLKAuxilliaryTextView *)self setMiddleLabel:v10];
  [v3 addArrangedSubview:v10];
  v11 = +[TLKLabel secondaryLabel];
  [v11 setTextAlignment:v8];
  [(TLKAuxilliaryTextView *)self setBottomLabel:v11];
  [v3 addArrangedSubview:v11];

  return v3;
}

- (void)setTopText:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_topText = &self->_topText;
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_topText setObserver:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v5;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v7 = *p_topText;
      uint64_t v8 = [(TLKRichText *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v30;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v30 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
            if (objc_opt_respondsToSelector()) {
              [v12 setObserver:0];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [(TLKRichText *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v9);
      }

      id v5 = v24;
    }
  }
  objc_storeStrong((id *)&self->_topText, a3);
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_topText setObserver:self];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v13 = *p_topText;
      uint64_t v14 = [(TLKRichText *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
            if (objc_opt_respondsToSelector()) {
              [v18 setObserver:self];
            }
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [(TLKRichText *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v15);
      }
    }
  }
  uint64_t v19 = [(TLKView *)self observer];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(TLKView *)self observer];
    uint64_t v22 = [v21 batchUpdateCount];

    if (!v22)
    {
      v23 = [(TLKView *)self observer];
      [v23 propertiesDidChange];
    }
  }
}

- (void)setMiddleText:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_middleText = &self->_middleText;
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_middleText setObserver:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v5;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v7 = *p_middleText;
      uint64_t v8 = [(TLKRichText *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v30;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v30 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
            if (objc_opt_respondsToSelector()) {
              [v12 setObserver:0];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [(TLKRichText *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v9);
      }

      id v5 = v24;
    }
  }
  objc_storeStrong((id *)&self->_middleText, a3);
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_middleText setObserver:self];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v13 = *p_middleText;
      uint64_t v14 = [(TLKRichText *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
            if (objc_opt_respondsToSelector()) {
              [v18 setObserver:self];
            }
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [(TLKRichText *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v15);
      }
    }
  }
  uint64_t v19 = [(TLKView *)self observer];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(TLKView *)self observer];
    uint64_t v22 = [v21 batchUpdateCount];

    if (!v22)
    {
      v23 = [(TLKView *)self observer];
      [v23 propertiesDidChange];
    }
  }
}

- (void)setBottomText:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_bottomText = &self->_bottomText;
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_bottomText setObserver:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v5;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v7 = *p_bottomText;
      uint64_t v8 = [(TLKRichText *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v30;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v30 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
            if (objc_opt_respondsToSelector()) {
              [v12 setObserver:0];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [(TLKRichText *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v9);
      }

      id v5 = v24;
    }
  }
  objc_storeStrong((id *)&self->_bottomText, a3);
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_bottomText setObserver:self];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v13 = *p_bottomText;
      uint64_t v14 = [(TLKRichText *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
            if (objc_opt_respondsToSelector()) {
              [v18 setObserver:self];
            }
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [(TLKRichText *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v15);
      }
    }
  }
  uint64_t v19 = [(TLKView *)self observer];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(TLKView *)self observer];
    uint64_t v22 = [v21 batchUpdateCount];

    if (!v22)
    {
      v23 = [(TLKView *)self observer];
      [v23 propertiesDidChange];
    }
  }
}

- (void)observedPropertiesChanged
{
  v3 = [(TLKAuxilliaryTextView *)self topText];
  int v4 = [(TLKAuxilliaryTextView *)self topLabel];
  [v4 setRichText:v3];

  id v5 = [(TLKAuxilliaryTextView *)self middleText];
  v6 = [(TLKAuxilliaryTextView *)self middleLabel];
  [v6 setRichText:v5];

  v7 = [(TLKAuxilliaryTextView *)self bottomText];
  uint64_t v8 = [(TLKAuxilliaryTextView *)self bottomLabel];
  [v8 setRichText:v7];

  uint64_t v9 = [(TLKAuxilliaryTextView *)self topText];
  uint64_t v10 = [v9 hasContent] ^ 1;
  uint64_t v11 = [(TLKAuxilliaryTextView *)self topLabel];
  [v11 setHidden:v10];

  v12 = [(TLKAuxilliaryTextView *)self middleText];
  uint64_t v13 = [v12 hasContent] ^ 1;
  uint64_t v14 = [(TLKAuxilliaryTextView *)self middleLabel];
  [v14 setHidden:v13];

  uint64_t v15 = [(TLKAuxilliaryTextView *)self bottomText];
  uint64_t v16 = [v15 hasContent] ^ 1;
  uint64_t v17 = [(TLKAuxilliaryTextView *)self bottomLabel];
  [v17 setHidden:v16];

  v18 = [(TLKAuxilliaryTextView *)self middleLabel];
  if ([v18 isHidden])
  {
    uint64_t v19 = [(TLKAuxilliaryTextView *)self bottomLabel];
    uint64_t v17 = (void *)[v19 isHidden];

    if (v17) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = 2;
    }
  }
  else
  {

    uint64_t v20 = 2;
  }
  v21 = [(TLKAuxilliaryTextView *)self topLabel];
  [v21 setProminence:v20];

  uint64_t v22 = [(TLKAuxilliaryTextView *)self topLabel];
  char v23 = [v22 isHidden];
  if (v23)
  {
    int v24 = 1;
  }
  else
  {
    uint64_t v17 = [(TLKAuxilliaryTextView *)self bottomLabel];
    int v24 = [v17 isHidden];
  }
  uint64_t v25 = v24 ^ 1u;
  long long v26 = [(TLKAuxilliaryTextView *)self middleLabel];
  [v26 setProminence:v25];

  if ((v23 & 1) == 0) {
  long long v27 = [(TLKAuxilliaryTextView *)self topLabel];
  }
  if ([v27 isHidden])
  {
    long long v28 = [(TLKAuxilliaryTextView *)self bottomLabel];
    char v29 = [v28 isHidden];
  }
  else
  {
    char v29 = 0;
  }

  long long v30 = [(TLKAuxilliaryTextView *)self topLabel];
  if ([v30 isHidden])
  {
    long long v31 = [(TLKAuxilliaryTextView *)self middleLabel];
    char v32 = [v31 isHidden];
  }
  else
  {
    char v32 = 0;
  }

  id v68 = +[TLKFontUtilities footnoteFont];
  if ([(TLKAuxilliaryTextView *)self useCompactMode])
  {
    if (TLKBiggerSuggestionsLayoutEnabled())
    {
      id v33 = (id)*MEMORY[0x1E4FB2998];
    }
    else
    {
      v45 = [(TLKAuxilliaryTextView *)self topLabel];
      if ([v45 isHidden])
      {
        v46 = [(TLKAuxilliaryTextView *)self bottomLabel];
        int v47 = [v46 isHidden];
        v48 = (id *)MEMORY[0x1E4FB28C8];
        if (v47) {
          v48 = (id *)MEMORY[0x1E4FB2988];
        }
        id v33 = *v48;
      }
      else
      {
        id v33 = (id)*MEMORY[0x1E4FB28C8];
      }
    }
    v43 = +[TLKFontUtilities cachedFontForTextStyle:v33 isShort:TLKSnippetModernizationEnabled() ^ 1 isBold:0];
    v44 = +[TLKFontUtilities cachedFontForTextStyle:*MEMORY[0x1E4FB28E0] isShort:TLKSnippetModernizationEnabled() ^ 1 isBold:0];
  }
  else if (TLKSnippetModernizationEnabled())
  {
    BOOL v34 = +[TLKUtilities isMacOS];
    BOOL v35 = v34;
    v36 = (void **)MEMORY[0x1E4FB28D0];
    if (!v34) {
      v36 = (void **)MEMORY[0x1E4FB2950];
    }
    v37 = *v36;
    if (v34) {
      v38 = (id *)MEMORY[0x1E4FB2990];
    }
    else {
      v38 = (id *)MEMORY[0x1E4FB2998];
    }
    id v39 = v37;
    uint64_t v40 = +[TLKFontUtilities cachedFontForTextStyle:v39 isBold:1 isMacStyle:v35];

    v41 = [(TLKAuxilliaryTextView *)self topLabel];
    if ([v41 isHidden]) {
      id v42 = *v38;
    }
    else {
      id v42 = v39;
    }
    v43 = +[TLKFontUtilities cachedFontForTextStyle:v42 isBold:0 isMacStyle:v35];

    v44 = +[TLKFontUtilities cachedFontForTextStyle:v39 isBold:0 isMacStyle:v35];

    id v68 = (id)v40;
  }
  else
  {
    v43 = +[TLKFontUtilities cachedFontForTextStyle:*MEMORY[0x1E4FB2928] isShort:0 fontWeight:*MEMORY[0x1E4FB29C0]];
    if (v32) {
      +[TLKFontUtilities shortBodyFont];
    }
    else {
    v44 = +[TLKFontUtilities footnoteFont];
    }
  }
  v49 = [(TLKAuxilliaryTextView *)self topLabel];
  [v49 setFont:v68];

  v50 = [(TLKAuxilliaryTextView *)self middleLabel];
  [v50 setFont:v43];

  v51 = [(TLKAuxilliaryTextView *)self bottomLabel];
  [v51 setFont:v44];

  v52 = [(TLKAuxilliaryTextView *)self bottomLabel];
  if ([v52 isHidden])
  {
    int v53 = 0;
  }
  else
  {
    v54 = [(TLKAuxilliaryTextView *)self middleLabel];
    if ([v54 isHidden])
    {
      int v53 = 0;
    }
    else
    {
      v55 = [(TLKAuxilliaryTextView *)self topLabel];
      int v53 = [v55 isHidden] ^ 1;
    }
  }

  BOOL v56 = +[TLKUtilities isMacOS];
  double v57 = 0.0;
  double v58 = 0.0;
  if (![(TLKAuxilliaryTextView *)self useCompactMode])
  {
    if (v56) {
      double v58 = 0.0;
    }
    else {
      double v58 = 2.0;
    }
    int v59 = TLKSnippetModernizationEnabled();
    if (!v59) {
      double v58 = -3.0;
    }
    if (((v59 ^ 1 | v53) & 1) == 0)
    {
      +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:0.5];
      double v58 = v60;
    }
  }
  v61 = [(TLKView *)self contentView];
  [v61 setSpacing:v58];

  v62 = [(TLKView *)self contentView];
  if ((TLKSnippetModernizationEnabled() & v53) != 0) {
    double v63 = 2.0;
  }
  else {
    double v63 = *MEMORY[0x1E4F4BEC8];
  }
  v64 = [(TLKAuxilliaryTextView *)self topLabel];
  [v62 setCustomSpacing:v64 afterView:v63];

  if (TLKSnippetModernizationEnabled())
  {
    if (v53)
    {
      if (+[TLKUtilities isMacOS]) {
        double v57 = 1.0;
      }
      else {
        double v57 = 2.0;
      }
    }
    else if ((v29 & 1) == 0)
    {
      BOOL v65 = +[TLKUtilities isMacOS];
      double v66 = -2.5;
      if (v65) {
        double v66 = -3.0;
      }
      +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:v66];
      double v57 = v67;
    }
  }
  -[TLKAuxilliaryTextView setLayoutMargins:](self, "setLayoutMargins:", v57, 0.0, 0.0, 0.0);
}

- (id)middleLabelFont
{
  v2 = [(TLKAuxilliaryTextView *)self middleLabel];
  v3 = [v2 font];

  return v3;
}

- (id)bottomLabelFont
{
  v2 = [(TLKAuxilliaryTextView *)self bottomLabel];
  v3 = [v2 font];

  return v3;
}

- (id)topLabelString
{
  v2 = [(TLKAuxilliaryTextView *)self topLabel];
  v3 = [v2 text];

  return v3;
}

- (id)middleLabelString
{
  v2 = [(TLKAuxilliaryTextView *)self middleLabel];
  v3 = [v2 text];

  return v3;
}

- (id)bottomLabelString
{
  v2 = [(TLKAuxilliaryTextView *)self bottomLabel];
  v3 = [v2 text];

  return v3;
}

- (TLKRichText)topText
{
  return self->_topText;
}

- (TLKRichText)middleText
{
  return self->_middleText;
}

- (TLKRichText)bottomText
{
  return self->_bottomText;
}

- (TLKLabel)topLabel
{
  return self->_topLabel;
}

- (void)setTopLabel:(id)a3
{
}

- (TLKLabel)middleLabel
{
  return self->_middleLabel;
}

- (void)setMiddleLabel:(id)a3
{
}

- (TLKLabel)bottomLabel
{
  return self->_bottomLabel;
}

- (void)setBottomLabel:(id)a3
{
}

- (BOOL)useCompactMode
{
  return self->_useCompactMode;
}

- (void)setUseCompactMode:(BOOL)a3
{
  self->_useCompactMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLabel, 0);
  objc_storeStrong((id *)&self->_middleLabel, 0);
  objc_storeStrong((id *)&self->_topLabel, 0);
  objc_storeStrong((id *)&self->_bottomText, 0);
  objc_storeStrong((id *)&self->_middleText, 0);
  objc_storeStrong((id *)&self->_topText, 0);
}

@end