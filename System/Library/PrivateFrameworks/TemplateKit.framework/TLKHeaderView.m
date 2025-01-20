@interface TLKHeaderView
- (BOOL)subtitleIsEmphasized;
- (BOOL)useCompactWidth;
- (BOOL)usesDefaultLayoutMargins;
- (NSString)roundedBorderText;
- (TLKImage)image;
- (TLKImage)subtitleImage;
- (TLKImageView)imageView;
- (TLKImageView)subtitleImageView;
- (TLKLabel)footnoteLabel;
- (TLKLabel)subtitleLabel;
- (TLKLabel)titleLabel;
- (TLKLabel)trailingTextLabel;
- (TLKMultilineText)footnote;
- (TLKMultilineText)title;
- (TLKMultilineText)trailingText;
- (TLKRichText)subtitle;
- (TLKRoundedCornerLabel)roundedCornerLabel;
- (TLKStackView)innerStackView;
- (TLKStackView)subtitleStackView;
- (id)footnoteLabelText;
- (id)hasImage;
- (id)roundedCornerLabelText;
- (id)setupContentView;
- (int64_t)axis;
- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5;
- (void)didMoveToWindow;
- (void)observedPropertiesChanged;
- (void)setAxis:(int64_t)a3;
- (void)setFootnote:(id)a3;
- (void)setFootnoteLabel:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setInnerStackView:(id)a3;
- (void)setRoundedBorderText:(id)a3;
- (void)setRoundedCornerLabel:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleImage:(id)a3;
- (void)setSubtitleImageView:(id)a3;
- (void)setSubtitleIsEmphasized:(BOOL)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSubtitleStackView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTrailingText:(id)a3;
- (void)setTrailingTextLabel:(id)a3;
- (void)setUseCompactWidth:(BOOL)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TLKHeaderView

- (id)setupContentView
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v22 = objc_opt_new();
  +[TLKLayoutUtilities requireIntrinsicSizeForView:v22];
  [(TLKHeaderView *)self setImageView:v22];
  v21 = objc_opt_new();
  [(TLKHeaderView *)self setTitleLabel:v21];
  v3 = objc_opt_new();
  +[TLKLayoutUtilities requireIntrinsicSizeForView:v3];
  [(TLKHeaderView *)self setSubtitleImageView:v3];
  v23 = +[TLKLabel secondaryLabel];
  -[TLKHeaderView setSubtitleLabel:](self, "setSubtitleLabel:");
  v4 = [TLKStackView alloc];
  v26[0] = v3;
  v26[1] = v23;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v6 = [(NUIContainerStackView *)v4 initWithArrangedSubviews:v5];

  [(TLKStackView *)v6 setAlignment:3];
  [(NUIContainerStackView *)v6 setSpacing:8.0];
  +[TLKView makeContainerShadowCompatible:v6];
  [(TLKHeaderView *)self setSubtitleStackView:v6];
  [(TLKHeaderView *)self setAxis:1];
  v7 = +[TLKLabel tertiaryLabel];
  v8 = +[TLKFontUtilities shortFootnoteFont];
  [v7 setFont:v8];

  [(TLKHeaderView *)self setFootnoteLabel:v7];
  v9 = objc_opt_new();
  [(TLKHeaderView *)self setTrailingTextLabel:v9];
  v10 = [(TLKHeaderView *)self trailingTextLabel];
  [v10 setTextAlignment:2];

  v11 = [MEMORY[0x1E4FB1798] _thinSystemFontOfSize:60.0];
  v12 = [(TLKHeaderView *)self trailingTextLabel];
  [v12 setFont:v11];

  v13 = [(TLKHeaderView *)self trailingTextLabel];
  +[TLKLayoutUtilities requireIntrinsicSizeForView:v13];

  v14 = [TLKStackView alloc];
  v25[0] = v21;
  v25[1] = v6;
  v25[2] = v7;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
  v16 = [(NUIContainerStackView *)v14 initWithArrangedSubviews:v15];

  [(TLKStackView *)v16 setAxis:1];
  [(NUIContainerStackView *)v16 setCustomSpacing:v6 afterView:2.0];
  +[TLKView makeContainerShadowCompatible:v16];
  [(TLKHeaderView *)self setInnerStackView:v16];
  v17 = [TLKStackView alloc];
  v24[0] = v22;
  v24[1] = v16;
  v24[2] = v9;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
  v19 = [(NUIContainerStackView *)v17 initWithArrangedSubviews:v18];

  [(TLKStackView *)v19 setDelegate:self];
  [(TLKStackView *)v19 setAlignment:3];
  [(NUIContainerStackView *)v19 setSpacing:12.0];

  return v19;
}

- (void)setTitle:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_title = &self->_title;
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_title setObserver:0];
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
      v7 = *p_title;
      uint64_t v8 = [(TLKMultilineText *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
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
          uint64_t v9 = [(TLKMultilineText *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v9);
      }

      id v5 = v24;
    }
  }
  objc_storeStrong((id *)&self->_title, a3);
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_title setObserver:self];
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
      v13 = *p_title;
      uint64_t v14 = [(TLKMultilineText *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
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
          uint64_t v15 = [(TLKMultilineText *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
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

- (void)setSubtitle:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_subtitle = &self->_subtitle;
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_subtitle setObserver:0];
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
      v7 = *p_subtitle;
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
  objc_storeStrong((id *)&self->_subtitle, a3);
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_subtitle setObserver:self];
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
      v13 = *p_subtitle;
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

- (void)setFootnote:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_footnote = &self->_footnote;
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_footnote setObserver:0];
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
      v7 = *p_footnote;
      uint64_t v8 = [(TLKMultilineText *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
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
          uint64_t v9 = [(TLKMultilineText *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v9);
      }

      id v5 = v24;
    }
  }
  objc_storeStrong((id *)&self->_footnote, a3);
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_footnote setObserver:self];
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
      v13 = *p_footnote;
      uint64_t v14 = [(TLKMultilineText *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
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
          uint64_t v15 = [(TLKMultilineText *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
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

- (void)setTrailingText:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_trailingText = &self->_trailingText;
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_trailingText setObserver:0];
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
      v7 = *p_trailingText;
      uint64_t v8 = [(TLKMultilineText *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
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
          uint64_t v9 = [(TLKMultilineText *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v9);
      }

      id v5 = v24;
    }
  }
  objc_storeStrong((id *)&self->_trailingText, a3);
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_trailingText setObserver:self];
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
      v13 = *p_trailingText;
      uint64_t v14 = [(TLKMultilineText *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
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
          uint64_t v15 = [(TLKMultilineText *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
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

- (void)setImage:(id)a3
{
  uint64_t v10 = (TLKImage *)a3;
  if (self->_image != v10)
  {
    objc_storeStrong((id *)&self->_image, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        uint64_t v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setSubtitleImage:(id)a3
{
  uint64_t v10 = (TLKImage *)a3;
  if (self->_subtitleImage != v10)
  {
    objc_storeStrong((id *)&self->_subtitleImage, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        uint64_t v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setRoundedBorderText:(id)a3
{
  uint64_t v10 = (NSString *)a3;
  if (self->_roundedBorderText != v10)
  {
    objc_storeStrong((id *)&self->_roundedBorderText, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        uint64_t v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setAxis:(int64_t)a3
{
  if (self->_axis != a3)
  {
    self->_axis = a3;
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

- (void)observedPropertiesChanged
{
  int64_t v3 = [(TLKHeaderView *)self axis];
  if (v3 == 1)
  {
    uint64_t v4 = 1;
    [(TLKHeaderView *)self footnote];
  }
  else
  {
    uint64_t v5 = [(TLKHeaderView *)self trailingText];
    v6 = [v5 text];
    BOOL v118 = v6 == 0;

    uint64_t v4 = 4;
    [(TLKHeaderView *)self footnote];
  uint64_t v7 = };
  BOOL v8 = v7 == 0;

  uint64_t v9 = [(TLKHeaderView *)self innerStackView];
  uint64_t v10 = v9;
  BOOL v121 = v8;
  if (v3 != 1)
  {
    [v9 setAlignment:1];

    v23 = [(TLKHeaderView *)self innerStackView];
    id v24 = [v23 arrangedSubviews];
    long long v25 = [(TLKHeaderView *)self imageView];
    int v26 = [v24 containsObject:v25];

    if (v26)
    {
      long long v27 = [(TLKHeaderView *)self innerStackView];
      long long v28 = [(TLKHeaderView *)self imageView];
      [v27 removeArrangedSubview:v28];
    }
    long long v29 = [(TLKView *)self contentView];
    long long v30 = [v29 arrangedSubviews];
    long long v31 = [(TLKHeaderView *)self imageView];
    char v32 = [v30 containsObject:v31];

    if ((v32 & 1) == 0)
    {
      v33 = [(TLKView *)self contentView];
      v34 = [(TLKHeaderView *)self imageView];
      [v33 insertArrangedSubview:v34 atIndex:0];
    }
    v21 = [(TLKView *)self contentView];
    uint64_t v22 = [(TLKHeaderView *)self imageView];
    [v21 setAlignment:1 forView:v22 inAxis:1];
    goto LABEL_14;
  }
  [v9 setAlignment:3];

  uint64_t v11 = [(TLKView *)self contentView];
  v12 = [v11 arrangedSubviews];
  v13 = [(TLKHeaderView *)self imageView];
  int v14 = [v12 containsObject:v13];

  if (v14)
  {
    uint64_t v15 = [(TLKView *)self contentView];
    uint64_t v16 = [(TLKHeaderView *)self imageView];
    [v15 removeArrangedSubview:v16];
  }
  uint64_t v17 = [(TLKHeaderView *)self innerStackView];
  v18 = [v17 arrangedSubviews];
  uint64_t v19 = [(TLKHeaderView *)self imageView];
  char v20 = [v18 containsObject:v19];

  if ((v20 & 1) == 0)
  {
    v21 = [(TLKHeaderView *)self innerStackView];
    uint64_t v22 = [(TLKHeaderView *)self imageView];
    [v21 insertArrangedSubview:v22 atIndex:0];
LABEL_14:
  }
  uint64_t v35 = [(TLKHeaderView *)self footnoteLabel];
  [v35 setTextAlignment:v4];

  v36 = [(TLKHeaderView *)self subtitleLabel];
  [v36 setTextAlignment:v4];

  v37 = [(TLKHeaderView *)self titleLabel];
  [v37 setTextAlignment:v4];

  v38 = [(TLKHeaderView *)self image];
  LOBYTE(v37) = v38 == 0;

  v39 = [(TLKHeaderView *)self imageView];
  v134[0] = MEMORY[0x1E4F143A8];
  v134[1] = 3221225472;
  v134[2] = __42__TLKHeaderView_observedPropertiesChanged__block_invoke;
  v134[3] = &unk_1E5FD3218;
  v134[4] = self;
  char v135 = (char)v37;
  [v39 performBatchUpdates:v134];

  int v40 = TLKSnippetModernizationEnabled();
  if (v40) {
    BOOL v41 = +[TLKUtilities isMacOS];
  }
  else {
    BOOL v41 = 0;
  }
  v42 = (id *)MEMORY[0x1E4FB2990];
  v43 = (id *)MEMORY[0x1E4FB2928];
  int v44 = v3 == 1 || v41;
  if (!v40) {
    v43 = (id *)MEMORY[0x1E4FB2998];
  }
  if (!v44) {
    v42 = v43;
  }
  id v45 = *v42;
  if (v3 == 1)
  {
    v46 = (id *)MEMORY[0x1E4FB2908];
  }
  else if (v40 && +[TLKUtilities isMacOS])
  {
    v46 = (id *)MEMORY[0x1E4FB28D0];
  }
  else
  {
    v46 = (id *)MEMORY[0x1E4FB2950];
  }
  id v47 = *v46;
  char v48 = v40 ^ 1;
  v120 = v45;
  v49 = +[TLKFontUtilities cachedFontForTextStyle:v45 isBold:v40 ^ 1u isMacStyle:v41];
  v119 = v47;
  v50 = +[TLKFontUtilities cachedFontForTextStyle:v47 isBold:0 isMacStyle:v41];
  v51 = [(TLKHeaderView *)self titleLabel];
  v131[0] = MEMORY[0x1E4F143A8];
  v131[1] = 3221225472;
  v131[2] = __42__TLKHeaderView_observedPropertiesChanged__block_invoke_2;
  v131[3] = &unk_1E5FD3240;
  v131[4] = self;
  id v52 = v50;
  id v132 = v52;
  id v53 = v49;
  id v133 = v53;
  [v51 performBatchUpdates:v131];

  v54 = [(TLKHeaderView *)self subtitleImageView];
  v130[0] = MEMORY[0x1E4F143A8];
  v130[1] = 3221225472;
  v130[2] = __42__TLKHeaderView_observedPropertiesChanged__block_invoke_3;
  v130[3] = &unk_1E5FD30E8;
  v130[4] = self;
  [v54 performBatchUpdates:v130];

  v55 = [(TLKHeaderView *)self subtitleLabel];
  v127[0] = MEMORY[0x1E4F143A8];
  v127[1] = 3221225472;
  v127[2] = __42__TLKHeaderView_observedPropertiesChanged__block_invoke_4;
  v127[3] = &unk_1E5FD3240;
  v127[4] = self;
  id v56 = v53;
  id v128 = v56;
  id v57 = v52;
  id v129 = v57;
  [v55 performBatchUpdates:v127];

  double v58 = 4.0;
  if (v41) {
    double v58 = 2.5;
  }
  if (!v40) {
    double v58 = 0.5;
  }
  if (v3 == 1) {
    double v58 = 1.5;
  }
  +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:v58];
  double v60 = v59;
  v61 = [(TLKHeaderView *)self innerStackView];
  [v61 setSpacing:v60];

  v62 = [(TLKHeaderView *)self roundedBorderText];
  v63 = [(TLKHeaderView *)self roundedCornerLabel];
  [v63 setHidden:v62 == 0];

  v64 = [(TLKHeaderView *)self roundedBorderText];

  if (v64)
  {
    v65 = [(TLKHeaderView *)self roundedCornerLabel];

    if (!v65)
    {
      v66 = [[TLKRoundedCornerLabel alloc] initWithProminence:1];
      [(TLKHeaderView *)self setRoundedCornerLabel:v66];

      v67 = [(TLKHeaderView *)self roundedCornerLabel];
      [v67 setSizeConfiguration:1];

      v68 = [(TLKHeaderView *)self roundedCornerLabel];
      +[TLKLayoutUtilities requireIntrinsicSizeForView:v68];

      v69 = [(TLKHeaderView *)self subtitleStackView];
      v70 = [(TLKHeaderView *)self roundedCornerLabel];
      [v69 addArrangedSubview:v70];
    }
    v71 = [(TLKHeaderView *)self roundedBorderText];
    v72 = [(TLKHeaderView *)self roundedCornerLabel];
    v63 = [v72 label];
    [v63 setText:v71];
  }
  v73 = [(TLKHeaderView *)self subtitle];
  if (v73)
  {
    BOOL v74 = 0;
  }
  else
  {
    v63 = [(TLKHeaderView *)self subtitleImage];
    BOOL v74 = v63 == 0;
  }
  v75 = [(TLKHeaderView *)self subtitleStackView];
  [v75 setHidden:v74];

  if (!v73) {
  v76 = [(TLKHeaderView *)self footnoteLabel];
  }
  v125[0] = MEMORY[0x1E4F143A8];
  v125[1] = 3221225472;
  v125[2] = __42__TLKHeaderView_observedPropertiesChanged__block_invoke_5;
  v125[3] = &unk_1E5FD3218;
  v125[4] = self;
  BOOL v126 = v121;
  [v76 performBatchUpdates:v125];

  v77 = [(TLKHeaderView *)self trailingTextLabel];
  v123[0] = MEMORY[0x1E4F143A8];
  v123[1] = 3221225472;
  v123[2] = __42__TLKHeaderView_observedPropertiesChanged__block_invoke_6;
  v123[3] = &unk_1E5FD3218;
  v123[4] = self;
  char v124 = v117;
  [v77 performBatchUpdates:v123];

  v78 = [(TLKHeaderView *)self innerStackView];
  v79 = [v78 viewForFirstBaselineLayout];
  v80 = [(TLKHeaderView *)self titleLabel];
  if (v79 == v80)
  {
    [(TLKHeaderView *)self titleLabel];
    int v81 = v40;
    int64_t v82 = v3;
    char v83 = v48;
    id v84 = v57;
    v86 = id v85 = v56;
    v122 = [v86 font];

    id v56 = v85;
    id v57 = v84;
    char v48 = v83;
    int64_t v3 = v82;
    int v40 = v81;
  }
  else
  {
    v122 = 0;
  }

  v87 = [(TLKHeaderView *)self innerStackView];
  v88 = [v87 viewForLastBaselineLayout];

  v89 = [(TLKHeaderView *)self subtitleLabel];
  v90 = [v89 font];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v91 = [v88 font];

    v90 = (void *)v91;
  }
  [v122 ascender];
  double v93 = v92;
  [v122 capHeight];
  double v95 = v93 - v94;
  [v90 descender];
  +[TLKLayoutUtilities deviceScaledFlooredValue:forView:](TLKLayoutUtilities, "deviceScaledFlooredValue:forView:", self);
  double v97 = -v96;
  v98 = [(TLKHeaderView *)self innerStackView];
  objc_msgSend(v98, "setCustomAlignmentRectInsets:", v95, 0.0, v97, 0.0);

  [(id)objc_opt_class() defaultLayoutMargins];
  double v101 = v100;
  double v103 = v102;
  if (v3 == 1) {
    char v104 = 1;
  }
  else {
    char v104 = v48;
  }
  if (v3 == 1) {
    double v105 = 25.0;
  }
  else {
    double v105 = v99;
  }
  if ((v104 & 1) == 0)
  {
    if (+[TLKUtilities isMacOS]) {
      double v105 = 13.0;
    }
    else {
      double v105 = 22.5;
    }
  }
  double v106 = v105;
  if (v40)
  {
    BOOL v107 = +[TLKUtilities isMacOS];
    double v106 = 19.5;
    if (v107) {
      double v106 = 14.0;
    }
  }
  +[TLKLayoutUtilities deviceScaledRoundedInsets:forView:](TLKLayoutUtilities, "deviceScaledRoundedInsets:forView:", self, v106, v101, v105, v103);
  double v109 = v108;
  double v111 = v110;
  double v113 = v112;
  double v115 = v114;
  v116 = [(TLKView *)self contentView];
  objc_msgSend(v116, "setLayoutMargins:", v109, v111, v113, v115);

  [(UIView *)self tlk_updateWithCurrentAppearance];
}

void __42__TLKHeaderView_observedPropertiesChanged__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) image];
  int64_t v3 = [*(id *)(a1 + 32) imageView];
  [v3 setTlkImage:v2];

  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) imageView];
  [v5 setHidden:v4];
}

void __42__TLKHeaderView_observedPropertiesChanged__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) title];
  int64_t v3 = [*(id *)(a1 + 32) titleLabel];
  [v3 setHidden:v2 == 0];

  uint64_t v4 = [*(id *)(a1 + 32) title];
  id v5 = [*(id *)(a1 + 32) titleLabel];
  [v5 setMultilineText:v4];

  int v6 = [*(id *)(a1 + 32) subtitleIsEmphasized];
  uint64_t v7 = 48;
  if (v6) {
    uint64_t v7 = 40;
  }
  uint64_t v8 = *(void *)(a1 + v7);
  uint64_t v9 = [*(id *)(a1 + 32) titleLabel];
  [v9 setFont:v8];

  uint64_t v10 = [*(id *)(a1 + 32) subtitleIsEmphasized];
  id v11 = [*(id *)(a1 + 32) titleLabel];
  [v11 setProminence:v10];
}

void __42__TLKHeaderView_observedPropertiesChanged__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) subtitleImage];
  int64_t v3 = [*(id *)(a1 + 32) subtitleImageView];
  [v3 setHidden:v2 == 0];

  id v5 = [*(id *)(a1 + 32) subtitleImage];
  uint64_t v4 = [*(id *)(a1 + 32) subtitleImageView];
  [v4 setTlkImage:v5];
}

void __42__TLKHeaderView_observedPropertiesChanged__block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) subtitle];
  uint64_t v3 = v2 == 0;
  uint64_t v4 = [*(id *)(a1 + 32) subtitleLabel];
  [v4 setHidden:v3];

  id v5 = [*(id *)(a1 + 32) roundedBorderText];
  if (v5)
  {
    int v6 = 0;
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 32) subtitleImage];
    if (v3)
    {
      int v6 = 0;
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v4 = [*(id *)(a1 + 32) subtitle];
      uint64_t v7 = [v4 maxLines];
      int v6 = 1;
    }
  }
  uint64_t v8 = [*(id *)(a1 + 32) subtitle];
  [v8 setMaxLines:v7];

  if (v6) {
  if (!v5)
  }

  uint64_t v9 = [*(id *)(a1 + 32) subtitle];
  uint64_t v10 = [*(id *)(a1 + 32) subtitleLabel];
  [v10 setRichText:v9];

  int v11 = [*(id *)(a1 + 32) subtitleIsEmphasized];
  uint64_t v12 = 48;
  if (v11) {
    uint64_t v12 = 40;
  }
  uint64_t v13 = *(void *)(a1 + v12);
  id v14 = [*(id *)(a1 + 32) subtitleLabel];
  [v14 setFont:v13];
}

void __42__TLKHeaderView_observedPropertiesChanged__block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) footnoteLabel];
  [v3 setHidden:v2];

  id v5 = [*(id *)(a1 + 32) footnote];
  uint64_t v4 = [*(id *)(a1 + 32) footnoteLabel];
  [v4 setMultilineText:v5];
}

void __42__TLKHeaderView_observedPropertiesChanged__block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) trailingTextLabel];
  [v3 setHidden:v2];

  id v5 = [*(id *)(a1 + 32) trailingText];
  uint64_t v4 = [*(id *)(a1 + 32) trailingTextLabel];
  [v4 setMultilineText:v5];
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  if (!+[TLKUtilities isMacOS])
  {
    int v6 = [(TLKHeaderView *)self imageView];
    if ([(TLKHeaderView *)self axis] == 1)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __80__TLKHeaderView_containerView_willMeasureArrangedSubviewsFittingSize_forReason___block_invoke;
      v7[3] = &unk_1E5FD30E8;
      id v8 = v6;
      [v8 performBatchUpdates:v7];
    }
    else
    {
      +[TLKLayoutUtilities applyRowBoundedSizingToImageView:v6 isCompactWidth:[(TLKHeaderView *)self useCompactWidth]];
    }
  }
}

uint64_t __80__TLKHeaderView_containerView_willMeasureArrangedSubviewsFittingSize_forReason___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMinimumLayoutSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v2 = *MEMORY[0x1E4F4BED0];
  double v3 = *(double *)(MEMORY[0x1E4F4BED0] + 8);
  uint64_t v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "setMaximumLayoutSize:", v2, v3);
}

- (BOOL)usesDefaultLayoutMargins
{
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLKHeaderView;
  [(TLKHeaderView *)&v9 traitCollectionDidChange:v4];
  id v5 = [(TLKHeaderView *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(UIView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  int v6 = [(TLKHeaderView *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)TLKHeaderView;
  [(TLKHeaderView *)&v3 didMoveToWindow];
  [(UIView *)self tlk_updateWithCurrentAppearance];
}

- (void)tlk_updateForAppearance:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TLKHeaderView;
  [(UIView *)&v6 tlk_updateForAppearance:a3];
  if (+[TLKAppearance viewHasOverriddenAppearance:self]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [(TLKHeaderView *)self subtitleIsEmphasized] ^ 1;
  }
  id v5 = [(TLKHeaderView *)self subtitleLabel];
  [v5 setProminence:v4];
}

- (id)footnoteLabelText
{
  double v2 = [(TLKHeaderView *)self footnoteLabel];
  objc_super v3 = [v2 text];

  return v3;
}

- (id)hasImage
{
  double v2 = [(TLKHeaderView *)self imageView];
  objc_super v3 = [v2 tlkImage];
  uint64_t v4 = [v3 uiImage];

  return v4;
}

- (id)roundedCornerLabelText
{
  objc_super v3 = [(TLKHeaderView *)self roundedCornerLabel];
  if ([v3 isHidden])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = [(TLKHeaderView *)self roundedCornerLabel];
    objc_super v6 = [v5 label];
    uint64_t v4 = [v6 text];
  }
  return v4;
}

- (TLKImage)image
{
  return self->_image;
}

- (TLKMultilineText)title
{
  return self->_title;
}

- (TLKRichText)subtitle
{
  return self->_subtitle;
}

- (BOOL)subtitleIsEmphasized
{
  return self->_subtitleIsEmphasized;
}

- (void)setSubtitleIsEmphasized:(BOOL)a3
{
  self->_subtitleIsEmphasized = a3;
}

- (TLKMultilineText)footnote
{
  return self->_footnote;
}

- (TLKMultilineText)trailingText
{
  return self->_trailingText;
}

- (TLKImage)subtitleImage
{
  return self->_subtitleImage;
}

- (NSString)roundedBorderText
{
  return self->_roundedBorderText;
}

- (int64_t)axis
{
  return self->_axis;
}

- (BOOL)useCompactWidth
{
  return self->_useCompactWidth;
}

- (void)setUseCompactWidth:(BOOL)a3
{
  self->_useCompactWidth = a3;
}

- (TLKImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (TLKLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (TLKLabel)trailingTextLabel
{
  return self->_trailingTextLabel;
}

- (void)setTrailingTextLabel:(id)a3
{
}

- (TLKLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (TLKLabel)footnoteLabel
{
  return self->_footnoteLabel;
}

- (void)setFootnoteLabel:(id)a3
{
}

- (TLKImageView)subtitleImageView
{
  return self->_subtitleImageView;
}

- (void)setSubtitleImageView:(id)a3
{
}

- (TLKStackView)subtitleStackView
{
  return self->_subtitleStackView;
}

- (void)setSubtitleStackView:(id)a3
{
}

- (TLKStackView)innerStackView
{
  return self->_innerStackView;
}

- (void)setInnerStackView:(id)a3
{
}

- (TLKRoundedCornerLabel)roundedCornerLabel
{
  return self->_roundedCornerLabel;
}

- (void)setRoundedCornerLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roundedCornerLabel, 0);
  objc_storeStrong((id *)&self->_innerStackView, 0);
  objc_storeStrong((id *)&self->_subtitleStackView, 0);
  objc_storeStrong((id *)&self->_subtitleImageView, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_trailingTextLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_roundedBorderText, 0);
  objc_storeStrong((id *)&self->_subtitleImage, 0);
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end