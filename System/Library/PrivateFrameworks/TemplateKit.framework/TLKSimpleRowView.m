@interface TLKSimpleRowView
+ (double)naturalWidthOfLabel:(id)a3 inFittingSize:(CGSize)a4;
+ (void)applyText:(id)a3 toLabel:(id)a4;
- (BOOL)hasSubtitles;
- (BOOL)usesDefaultLayoutMargins;
- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5;
- (TLKImage)leadingImage;
- (TLKImage)trailingImage;
- (TLKImageView)leadingImageView;
- (TLKImageView)trailingImageView;
- (TLKLabel)leadingSubtitleLabel;
- (TLKLabel)leadingTitleLabel;
- (TLKLabel)trailingSubtitleLabel;
- (TLKLabel)trailingTitleLabel;
- (TLKRichText)leadingSubtitle;
- (TLKRichText)leadingTitle;
- (TLKRichText)trailingSubtitle;
- (TLKRichText)trailingTitle;
- (double)widthOfColumnAtIndex:(unint64_t)a3;
- (id)bottomRowViews;
- (id)fontForTextInLabel:(id)a3;
- (id)gridOfAllViews;
- (id)leadingSubtitleLabelString;
- (id)leadingTextView;
- (id)leadingTitleLabelFont;
- (id)leadingTitleLabelString;
- (id)setupContentView;
- (id)stringForLabel:(id)a3;
- (id)topRowViews;
- (id)trailingSubtitleLabelFont;
- (id)trailingSubtitleLabelString;
- (id)trailingTitleLabelFont;
- (id)trailingTitleLabelString;
- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5;
- (void)observedPropertiesChanged;
- (void)setLeadingImage:(id)a3;
- (void)setLeadingImageView:(id)a3;
- (void)setLeadingSubtitle:(id)a3;
- (void)setLeadingSubtitleLabel:(id)a3;
- (void)setLeadingTitle:(id)a3;
- (void)setLeadingTitleLabel:(id)a3;
- (void)setTrailingImage:(id)a3;
- (void)setTrailingImageView:(id)a3;
- (void)setTrailingSubtitle:(id)a3;
- (void)setTrailingSubtitleLabel:(id)a3;
- (void)setTrailingTitle:(id)a3;
- (void)setTrailingTitleLabel:(id)a3;
@end

@implementation TLKSimpleRowView

- (id)setupContentView
{
  id v3 = objc_alloc(MEMORY[0x1E4F4BEF8]);
  v4 = [(TLKSimpleRowView *)self gridOfAllViews];
  v5 = (void *)[v3 initWithArrangedSubviewRows:v4];

  [v5 setColumnSpacing:10.0];
  [v5 setDelegate:self];
  [v5 setBaselineRelativeArrangement:1];
  [(id)objc_opt_class() defaultLayoutMargins];
  double v7 = v6;
  [(id)objc_opt_class() defaultLayoutMargins];
  objc_msgSend(v5, "setLayoutMargins:", 0.0, v7, 0.0);
  return v5;
}

- (BOOL)usesDefaultLayoutMargins
{
  return 0;
}

- (id)gridOfAllViews
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  [(TLKSimpleRowView *)self setLeadingImageView:v3];

  v4 = [(TLKSimpleRowView *)self leadingImageView];
  objc_msgSend(v4, "setCustomAlignmentRectInsets:", -10.0, 0.0, -10.0, 0.0);

  v5 = [(TLKSimpleRowView *)self leadingImageView];
  +[TLKLayoutUtilities requireIntrinsicSizeForView:v5];

  double v6 = objc_opt_new();
  [(TLKSimpleRowView *)self setLeadingTitleLabel:v6];

  double v7 = [(TLKSimpleRowView *)self leadingTitleLabel];
  LODWORD(v8) = 1144750080;
  [v7 setContentHuggingPriority:1 forAxis:v8];

  v9 = [(TLKSimpleRowView *)self leadingTitleLabel];
  LODWORD(v10) = 1144750080;
  [v9 setContentCompressionResistancePriority:0 forAxis:v10];

  v11 = objc_opt_new();
  [(TLKSimpleRowView *)self setLeadingSubtitleLabel:v11];

  if (+[TLKLayoutUtilities isLTR]) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 0;
  }
  v13 = objc_opt_new();
  [(TLKSimpleRowView *)self setTrailingTitleLabel:v13];

  v14 = [(TLKSimpleRowView *)self trailingTitleLabel];
  [v14 setTextAlignment:v12];

  v15 = [(TLKSimpleRowView *)self trailingTitleLabel];
  LODWORD(v16) = 1144750080;
  [v15 setContentHuggingPriority:0 forAxis:v16];

  v17 = [(TLKSimpleRowView *)self trailingTitleLabel];
  LODWORD(v18) = 1144750080;
  [v17 setContentHuggingPriority:1 forAxis:v18];

  v19 = +[TLKLabel secondaryLabel];
  [(TLKSimpleRowView *)self setTrailingSubtitleLabel:v19];

  v20 = [(TLKSimpleRowView *)self trailingSubtitleLabel];
  [v20 setTextAlignment:v12];

  v21 = [(TLKSimpleRowView *)self trailingSubtitleLabel];
  LODWORD(v22) = 1144750080;
  [v21 setContentHuggingPriority:0 forAxis:v22];

  v23 = [(TLKSimpleRowView *)self trailingSubtitleLabel];
  LODWORD(v24) = 1144750080;
  [v23 setContentCompressionResistancePriority:0 forAxis:v24];

  v25 = objc_opt_new();
  [(TLKSimpleRowView *)self setTrailingImageView:v25];

  v26 = [(TLKSimpleRowView *)self trailingImageView];
  +[TLKLayoutUtilities requireIntrinsicSizeForView:v26];

  v38 = [(TLKSimpleRowView *)self leadingImageView];
  v40[0] = v38;
  v37 = [(TLKSimpleRowView *)self leadingTitleLabel];
  v40[1] = v37;
  v27 = [(TLKSimpleRowView *)self trailingTitleLabel];
  v40[2] = v27;
  v28 = [(TLKSimpleRowView *)self trailingImageView];
  v40[3] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
  v41[0] = v29;
  v30 = [(TLKSimpleRowView *)self leadingImageView];
  v39[0] = v30;
  v31 = [(TLKSimpleRowView *)self leadingSubtitleLabel];
  v39[1] = v31;
  v32 = [(TLKSimpleRowView *)self trailingSubtitleLabel];
  v39[2] = v32;
  v33 = [(TLKSimpleRowView *)self trailingImageView];
  v39[3] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
  v41[1] = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];

  return v35;
}

- (void)setLeadingTitle:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_leadingTitle = &self->_leadingTitle;
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_leadingTitle setObserver:0];
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
      double v7 = *p_leadingTitle;
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
            uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
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
  objc_storeStrong((id *)&self->_leadingTitle, a3);
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_leadingTitle setObserver:self];
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
      v13 = *p_leadingTitle;
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
            double v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
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

- (void)setLeadingSubtitle:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_leadingSubtitle = &self->_leadingSubtitle;
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_leadingSubtitle setObserver:0];
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
      double v7 = *p_leadingSubtitle;
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
            uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
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
  objc_storeStrong((id *)&self->_leadingSubtitle, a3);
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_leadingSubtitle setObserver:self];
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
      v13 = *p_leadingSubtitle;
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
            double v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
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

- (void)setTrailingTitle:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_trailingTitle = &self->_trailingTitle;
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_trailingTitle setObserver:0];
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
      double v7 = *p_trailingTitle;
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
            uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
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
  objc_storeStrong((id *)&self->_trailingTitle, a3);
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_trailingTitle setObserver:self];
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
      v13 = *p_trailingTitle;
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
            double v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
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

- (void)setTrailingSubtitle:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_trailingSubtitle = &self->_trailingSubtitle;
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_trailingSubtitle setObserver:0];
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
      double v7 = *p_trailingSubtitle;
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
            uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
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
  objc_storeStrong((id *)&self->_trailingSubtitle, a3);
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_trailingSubtitle setObserver:self];
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
      v13 = *p_trailingSubtitle;
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
            double v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
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

- (void)setTrailingImage:(id)a3
{
  uint64_t v10 = (TLKImage *)a3;
  if (self->_trailingImage != v10)
  {
    objc_storeStrong((id *)&self->_trailingImage, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      double v6 = (void *)v5;
      double v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        uint64_t v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setLeadingImage:(id)a3
{
  uint64_t v10 = (TLKImage *)a3;
  if (self->_leadingImage != v10)
  {
    objc_storeStrong((id *)&self->_leadingImage, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      double v6 = (void *)v5;
      double v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        uint64_t v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)observedPropertiesChanged
{
  id v3 = [(TLKView *)self contentView];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__TLKSimpleRowView_observedPropertiesChanged__block_invoke;
  v4[3] = &unk_1E5FD30E8;
  v4[4] = self;
  [v3 performBatchUpdates:v4];
}

void __45__TLKSimpleRowView_observedPropertiesChanged__block_invoke(uint64_t a1)
{
  v173[2] = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  v2 = [*(id *)(a1 + 32) leadingImage];
  [v2 size];
  double v4 = v3;
  BOOL v5 = v3 <= 18.0;

  if (([*v1 hasSubtitles] & v5) != 0) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 3;
  }
  double v7 = [*v1 leadingImage];
  uint64_t v8 = [*v1 leadingImageView];
  [v8 setTlkImage:v7];

  uint64_t v9 = [*v1 contentView];
  uint64_t v10 = [v9 columnAtIndex:0];

  uint64_t v11 = [*v1 contentView];
  uint64_t v12 = [v11 columnAtIndex:3];

  v13 = [*v1 leadingImage];
  v169 = v10;
  [v10 setHidden:v13 == 0];

  uint64_t v14 = [*v1 contentView];
  uint64_t v15 = [*v1 leadingImageView];
  [v14 setAlignment:v6 forView:v15 inAxis:1];

  uint64_t v16 = [*v1 trailingImage];
  uint64_t v17 = [*v1 trailingImageView];
  [v17 setTlkImage:v16];

  double v18 = [*v1 trailingImage];
  v168 = v12;
  [v12 setHidden:v18 == 0];

  uint64_t v19 = [*v1 contentView];
  v20 = [*v1 trailingImageView];
  [v19 setAlignment:v6 forView:v20 inAxis:1];

  uint64_t v21 = [*v1 hasSubtitles] ^ 1;
  uint64_t v22 = [*v1 contentView];
  v23 = [v22 rowAtIndex:1];
  [v23 setHidden:v21];

  id v24 = [*v1 leadingSubtitle];
  id v25 = *v1;
  if (v24) {
    [v25 leadingSubtitleLabel];
  }
  else {
  uint64_t v26 = [v25 leadingTitleLabel];
  }

  long long v27 = [*v1 contentView];
  [v27 removeColumnAtIndex:1];

  long long v28 = [*v1 contentView];
  long long v29 = [*v1 leadingTitleLabel];
  v173[0] = v29;
  v173[1] = v26;
  long long v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v173 count:2];
  long long v31 = [v28 insertColumnAtIndex:1 withArrangedSubviews:v30];

  v166 = v31;
  [v31 setSpacingAfter:16.0];
  long long v32 = [*v1 trailingSubtitle];
  id v33 = *v1;
  if (v32)
  {
    v34 = [v33 trailingSubtitle];
    char v35 = [v34 hasContent];
    id v36 = *v1;
    if (v35) {
      [v36 trailingSubtitleLabel];
    }
    else {
    uint64_t v37 = [v36 leadingSubtitleLabel];
    }
  }
  else
  {
    uint64_t v37 = [v33 trailingTitleLabel];
  }

  v38 = [*v1 contentView];
  [v38 removeColumnAtIndex:2];

  v39 = [*v1 contentView];
  v40 = [*v1 trailingTitleLabel];
  v172[0] = v40;
  v172[1] = v37;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v172 count:2];
  v42 = [v39 insertColumnAtIndex:2 withArrangedSubviews:v41];

  [v42 setAlignment:4];
  v43 = [*v1 leadingImage];
  if (v43) {
    goto LABEL_14;
  }
  uint64_t v47 = [*v1 leadingTitle];
  if (!v47) {
    goto LABEL_15;
  }
  v43 = (void *)v47;
  uint64_t v48 = [*v1 trailingTitle];
  if (!v48) {
    goto LABEL_14;
  }
  v49 = (void *)v48;
  v50 = [*v1 trailingImage];
  if (v50)
  {

LABEL_14:
    goto LABEL_15;
  }
  char v71 = [*v1 hasSubtitles];

  if ((v71 & 1) == 0)
  {
    uint64_t v46 = 1;
    goto LABEL_26;
  }
LABEL_15:
  v44 = [*v1 leadingTitle];
  if (v44)
  {
    v45 = [*v1 leadingSubtitle];
    if (v45) {
      uint64_t v46 = 1;
    }
    else {
      uint64_t v46 = 3;
    }
  }
  else
  {
    uint64_t v46 = 3;
  }

LABEL_26:
  v51 = [*v1 contentView];
  v52 = [*v1 leadingTitleLabel];
  [v51 setAlignment:v46 forView:v52 inAxis:1];

  v53 = [*v1 leadingSubtitleLabel];

  if ((void *)v26 == v53)
  {
    v54 = [*v1 contentView];
    v55 = [*v1 leadingSubtitleLabel];
    [v54 setAlignment:v46 forView:v55 inAxis:1];
  }
  v56 = [*v1 trailingTitle];
  if (v56)
  {
    v57 = [*v1 trailingSubtitle];
    if (v57) {
      uint64_t v58 = 1;
    }
    else {
      uint64_t v58 = 3;
    }
  }
  else
  {
    uint64_t v58 = 3;
  }

  v59 = [*v1 contentView];
  v60 = [*v1 trailingTitleLabel];
  [v59 setAlignment:v58 forView:v60 inAxis:1];

  v61 = [*v1 trailingSubtitleLabel];

  if ((void *)v37 == v61)
  {
    v62 = [*v1 contentView];
    v63 = [*v1 trailingSubtitleLabel];
    [v62 setAlignment:v58 forView:v63 inAxis:1];
  }
  v64 = [*v1 trailingTitle];
  if (v64)
  {
    [v42 setHidden:0];
  }
  else
  {
    v65 = [*v1 trailingSubtitle];
    [v42 setHidden:v65 == 0];
  }
  v66 = [*v1 leadingImage];
  v164 = v42;
  if (v66)
  {
    BOOL v67 = 0;
  }
  else
  {
    v68 = [*v1 leadingTitle];
    if (v68)
    {
      v69 = [*v1 trailingTitle];
      if (v69)
      {
        BOOL v67 = 0;
      }
      else
      {
        v70 = [*v1 trailingSubtitle];
        if (v70)
        {
          BOOL v67 = 0;
        }
        else
        {
          v72 = [*v1 trailingImage];
          [v72 size];
          if (v74 == 29.0 && v73 == 29.0)
          {
            BOOL v67 = 1;
          }
          else
          {
            v75 = [*v1 trailingImage];
            if ([v75 isTemplate])
            {
              v170 = [*v1 trailingImage];
              [v170 size];
              if (v76 <= 29.0)
              {
                BOOL v67 = 1;
              }
              else
              {
                [*v1 trailingImage];
                v77 = v162 = v75;
                [v77 size];
                BOOL v67 = v78 <= 29.0;

                v75 = v162;
              }
            }
            else
            {
              BOOL v67 = 0;
            }
          }
        }
      }
    }
    else
    {
      BOOL v67 = 0;
    }
  }
  v79 = [*v1 leadingTitle];
  v165 = (void *)v37;
  if (v79)
  {
    v80 = [*v1 leadingSubtitle];
    if (v80)
    {
      v81 = [*v1 trailingTitle];
      if (v81)
      {
        BOOL v82 = 0;
      }
      else
      {
        v84 = [*v1 trailingSubtitle];
        if (v84)
        {
          BOOL v82 = 0;
        }
        else
        {
          v85 = [*v1 leadingImage];
          if (v85)
          {
            v86 = [*v1 trailingImage];
            BOOL v82 = v4 <= 18.0 && v86 == 0;
          }
          else
          {
            BOOL v82 = 0;
          }
        }
      }

      BOOL v83 = v82;
    }
    else
    {
      BOOL v83 = 0;
    }
  }
  else
  {
    BOOL v83 = 0;
  }

  if (v67)
  {
    +[TLKLayoutUtilities deviceScaledRoundedValue:*v1 forView:-7.5];
    double v89 = v88;
    double v90 = 0.0;
    double v91 = -7.0;
    double v92 = 0.0;
  }
  else
  {
    v79 = [*v1 leadingImageView];
    [v79 customAlignmentRectInsets];
    double v89 = v93;
    double v90 = v94;
    double v91 = v95;
    double v92 = v96;
  }
  v97 = [*v1 trailingImageView];
  objc_msgSend(v97, "setCustomAlignmentRectInsets:", v89, v90, v91, v92);

  if (!v67) {
  int v171 = v83 || v67;
  }
  v98 = [*v1 leadingImage];
  v167 = (void *)v26;
  if (v98)
  {
    BOOL v99 = 1;
  }
  else
  {
    v100 = [*v1 trailingImage];
    BOOL v99 = v100 != 0;
  }
  v101 = (void *)MEMORY[0x1E4FB28C8];
  v102 = (void *)MEMORY[0x1E4FB2950];
  v103 = (void **)MEMORY[0x1E4FB28F0];
  BOOL v161 = v83;
  if (v67)
  {
    v104 = (void *)MEMORY[0x1E4FB28C8];
    v105 = (void *)MEMORY[0x1E4FB28F0];
    v106 = (void *)MEMORY[0x1E4FB2950];
    v107 = (void *)*MEMORY[0x1E4FB2950];
  }
  else
  {
    if (v83)
    {
      v106 = (void *)MEMORY[0x1E4FB2950];
      v104 = (void *)MEMORY[0x1E4FB28C8];
      v105 = (void *)MEMORY[0x1E4FB28F0];
    }
    else
    {
      v105 = (void *)MEMORY[0x1E4FB28F0];
      int v108 = [*v1 hasSubtitles];
      v103 = (void **)MEMORY[0x1E4FB2908];
      v104 = v101;
      v106 = v102;
      if (v99) {
        v109 = (void **)v101;
      }
      else {
        v109 = (void **)v102;
      }
      if (!v108) {
        v103 = v109;
      }
    }
    v107 = *v103;
  }
  id v163 = v107;
  v110 = +[TLKFontUtilities cachedFontForTextStyle:v163 isShort:TLKSnippetModernizationEnabled() ^ 1 isBold:0];
  v111 = [*v1 leadingTitleLabel];
  [v111 setFont:v110];

  v112 = (double *)MEMORY[0x1E4FB29C0];
  if (v171) {
    +[TLKFontUtilities captionFont];
  }
  else {
  v113 = +[TLKFontUtilities cachedFontForTextStyle:*v105 isShort:TLKSnippetModernizationEnabled() ^ 1 fontWeight:*MEMORY[0x1E4FB29C0]];
  }
  v114 = [*v1 leadingSubtitleLabel];
  [v114 setFont:v113];

  if ([*v1 hasSubtitles] | v99) {
    v115 = v104;
  }
  else {
    v115 = v106;
  }
  v116 = +[TLKFontUtilities cachedFontForTextStyle:*v115 isShort:TLKSnippetModernizationEnabled() ^ 1 isBold:0];
  v117 = [*v1 trailingTitleLabel];
  [v117 setFont:v116];

  v118 = +[TLKFontUtilities cachedFontForTextStyle:*v105 isShort:TLKSnippetModernizationEnabled() ^ 1 fontWeight:*v112];
  v119 = [*v1 trailingSubtitleLabel];
  [v119 setFont:v118];

  double v120 = 28.0;
  if (v67)
  {
    +[TLKLayoutUtilities deviceScaledRoundedValue:*v1 forView:26.5];
    double v120 = v121;
  }
  double v122 = v120 + -4.5;
  if (v67) {
    double v122 = 19.5;
  }
  +[TLKLayoutUtilities deviceScaledRoundedValue:*v1 forView:v122];
  double v124 = v123;
  if (v67)
  {
    +[TLKLayoutUtilities deviceScaledRoundedValue:*v1 forView:16.5];
    double v126 = v125;
    double v127 = 16.0;
  }
  else
  {
    double v126 = 16.0;
    double v127 = 18.0;
  }
  v128 = [*v1 leadingTitleLabel];
  v129 = [*v1 leadingSubtitle];
  if (v129) {
    double v130 = v124;
  }
  else {
    double v130 = v120;
  }
  v131 = [*v1 leadingSubtitle];
  if (v131) {
    double v132 = 0.0;
  }
  else {
    double v132 = v126;
  }
  +[TLKLayoutUtilities setDynamicBaselineAlignmentsForLabel:v128 top:*v1 bottom:v130 view:v132];

  v133 = [*v1 trailingTitleLabel];
  v134 = [*v1 trailingSubtitle];
  if (v134) {
    double v120 = v124;
  }
  v135 = [*v1 trailingSubtitle];
  if (v135) {
    double v136 = 0.0;
  }
  else {
    double v136 = v126;
  }
  +[TLKLayoutUtilities setDynamicBaselineAlignmentsForLabel:v133 top:*v1 bottom:v120 view:v136];

  if (v171) {
    double v137 = 14.0;
  }
  else {
    double v137 = 10.0;
  }
  v138 = [*v1 leadingSubtitleLabel];
  if (v67)
  {
    double v137 = 8.0;
    uint64_t v139 = 2;
  }
  else
  {
    uint64_t v139 = !v161;
  }
  +[TLKLayoutUtilities setDynamicBaselineAlignmentsForLabel:v138 top:*v1 bottom:0.0 view:v137];

  v140 = [*v1 trailingSubtitleLabel];
  +[TLKLayoutUtilities setDynamicBaselineAlignmentsForLabel:v140 top:*v1 bottom:0.0 view:v137];

  v141 = [*v1 leadingSubtitleLabel];
  v142 = [v141 font];
  +[TLKLayoutUtilities scaledValueForValue:v142 withFont:*v1 view:v127];
  double v144 = v143;
  v145 = [*v1 contentView];
  [v145 setRowSpacing:v144];

  v146 = [*v1 leadingTitleLabel];
  LODWORD(v147) = 1144750080;
  [v146 setContentCompressionResistancePriority:0 forAxis:v147];

  v148 = [*v1 trailingTitleLabel];
  LODWORD(v149) = 1144750080;
  [v148 setContentCompressionResistancePriority:0 forAxis:v149];

  double v150 = *MEMORY[0x1E4F4BEC8];
  [v166 setLength:*MEMORY[0x1E4F4BEC8]];
  [v164 setLength:v150];
  v151 = [*v1 leadingTitleLabel];
  [v151 setProminence:v67];

  v152 = [*v1 leadingSubtitleLabel];
  [v152 setProminence:v139];

  v153 = [*v1 leadingTitle];
  v154 = [*v1 leadingTitleLabel];
  +[TLKSimpleRowView applyText:v153 toLabel:v154];

  v155 = [*v1 leadingSubtitle];
  v156 = [*v1 leadingSubtitleLabel];
  +[TLKSimpleRowView applyText:v155 toLabel:v156];

  v157 = [*v1 trailingTitle];
  v158 = [*v1 trailingTitleLabel];
  +[TLKSimpleRowView applyText:v157 toLabel:v158];

  v159 = [*v1 trailingSubtitle];
  v160 = [*v1 trailingSubtitleLabel];
  +[TLKSimpleRowView applyText:v159 toLabel:v160];
}

- (BOOL)hasSubtitles
{
  double v3 = [(TLKSimpleRowView *)self leadingSubtitle];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    BOOL v5 = [(TLKSimpleRowView *)self trailingSubtitle];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  double height = a5.size.height;
  CGFloat width = a5.size.width;
  double y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  id v13 = [(TLKSimpleRowView *)self leadingImageView];

  if (v13 == v12)
  {
    uint64_t v14 = [(TLKSimpleRowView *)self leadingImageView];
    if ([v11 alignmentForView:v14 inAxis:1] != 1)
    {
LABEL_5:

      goto LABEL_6;
    }
    uint64_t v15 = [(TLKSimpleRowView *)self leadingTitleLabel];
    uint64_t v16 = [v15 font];
    [v16 ascender];
    double v18 = v17;
    uint64_t v19 = [(TLKSimpleRowView *)self leadingTitleLabel];
    v20 = [v19 font];
    [v20 descender];
    double v22 = v18 - v21;

    if (height < v22)
    {
      uint64_t v14 = [(TLKSimpleRowView *)self leadingTitleLabel];
      [v14 customAlignmentRectInsets];
      double v24 = v23;
      id v25 = [(TLKSimpleRowView *)self leadingTitleLabel];
      uint64_t v26 = [v25 font];
      [v26 ascender];
      double v28 = v27 - v24;
      long long v29 = [(TLKSimpleRowView *)self leadingTitleLabel];
      long long v30 = [v29 font];
      [v30 capHeight];
      double y = ceil(v28 + (height + v31) * -0.5);

      goto LABEL_5;
    }
  }
LABEL_6:

  double v32 = x;
  double v33 = y;
  double v34 = width;
  double v35 = height;
  result.size.double height = v35;
  result.size.CGFloat width = v34;
  result.origin.double y = v33;
  result.origin.CGFloat x = v32;
  return result;
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  CGFloat height = a4.height;
  double width = a4.width;
  id v9 = a3;
  uint64_t v10 = [(TLKSimpleRowView *)self leadingImageView];
  objc_msgSend(v10, "setMaximumLayoutSize:", width * 0.4, 1.79769313e308);

  id v11 = [(TLKSimpleRowView *)self leadingImageView];
  [v11 maximumLayoutSize];
  double v13 = v12;
  double v15 = v14;
  uint64_t v16 = [(TLKSimpleRowView *)self trailingImageView];
  objc_msgSend(v16, "setMaximumLayoutSize:", v13, v15);

  if (!a5)
  {
    double v17 = [(TLKSimpleRowView *)self leadingTitle];
    if (v17
      || ([(TLKSimpleRowView *)self leadingSubtitle],
          (id v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      double v18 = [(TLKSimpleRowView *)self trailingTitle];
      if (v18)
      {

        if (v17) {
          uint64_t v19 = v17;
        }
        else {
          uint64_t v19 = v11;
        }
      }
      else
      {
        v20 = [(TLKSimpleRowView *)self trailingSubtitle];

        if (v17)
        {

          if (!v20) {
            goto LABEL_10;
          }
        }
        else
        {

          if (!v20) {
            goto LABEL_10;
          }
        }
      }
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __83__TLKSimpleRowView_containerView_willMeasureArrangedSubviewsFittingSize_forReason___block_invoke;
      v21[3] = &unk_1E5FD3110;
      id v22 = v9;
      double v23 = self;
      double v24 = width;
      CGFloat v25 = height;
      [v22 performBatchUpdates:v21];
    }
  }
LABEL_10:
}

void __83__TLKSimpleRowView_containerView_willMeasureArrangedSubviewsFittingSize_forReason___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) columnSpacing];
  double v4 = v3;
  BOOL v5 = [*(id *)(a1 + 40) contentView];
  uint64_t v6 = [v5 columnAtIndex:0];
  char v7 = [v6 isHidden];
  if (v7)
  {
    double v8 = 0.0;
  }
  else
  {
    v1 = [*(id *)(a1 + 40) leadingImageView];
    [v1 intrinsicContentSize];
    double v8 = v4 + v9;
  }
  uint64_t v10 = [*(id *)(a1 + 40) contentView];
  id v11 = [v10 columnAtIndex:3];
  if ([v11 isHidden])
  {
    double v12 = v8 + 0.0;
  }
  else
  {
    double v13 = [*(id *)(a1 + 40) trailingImageView];
    [v13 intrinsicContentSize];
    double v12 = v8 + v4 + v14;
  }
  if ((v7 & 1) == 0) {

  }
  double v15 = *(double *)(a1 + 48) - v12;
  uint64_t v16 = [*(id *)(a1 + 40) contentView];
  double v17 = [v16 columnAtIndex:1];
  [v17 spacingAfter];
  double v19 = v15 - v18;
  [*(id *)(a1 + 32) layoutMargins];
  double v21 = v19 - v20;
  [*(id *)(a1 + 32) layoutMargins];
  double v23 = v21 - v22;

  double v24 = 0.0;
  double v25 = fmax(v23, 0.0);
  double v26 = fmax(*(double *)(a1 + 56), 0.0);
  double v27 = [*(id *)(a1 + 40) leadingTitle];
  if (v27)
  {
    double v28 = objc_opt_class();
    long long v29 = [*(id *)(a1 + 40) leadingTitleLabel];
    objc_msgSend(v28, "naturalWidthOfLabel:inFittingSize:", v29, v25, v26);
    double v24 = v30;
  }
  double v31 = [*(id *)(a1 + 40) leadingSubtitle];

  if (v31)
  {
    double v32 = objc_opt_class();
    double v33 = [*(id *)(a1 + 40) leadingSubtitleLabel];
    objc_msgSend(v32, "naturalWidthOfLabel:inFittingSize:", v33, v25, v26);
    double v35 = v34;

    if (v24 < v35) {
      double v24 = v35;
    }
  }
  id v36 = [*(id *)(a1 + 40) trailingTitle];
  if (v36)
  {
    uint64_t v37 = objc_opt_class();
    v38 = [*(id *)(a1 + 40) trailingTitleLabel];
    objc_msgSend(v37, "naturalWidthOfLabel:inFittingSize:", v38, v25, v26);
    double v40 = v39;
  }
  else
  {
    double v40 = 0.0;
  }

  v41 = [*(id *)(a1 + 40) trailingSubtitle];

  if (v41)
  {
    v42 = objc_opt_class();
    v43 = [*(id *)(a1 + 40) trailingSubtitleLabel];
    objc_msgSend(v42, "naturalWidthOfLabel:inFittingSize:", v43, v25, v26);
    double v45 = v44;

    if (v40 < v45) {
      double v40 = v45;
    }
  }
  double v46 = v25 * 0.5;
  if (v24 <= v25 * 0.5 || v40 <= v46)
  {
    if (v24 <= v46)
    {
      double v50 = 750.0;
      if (v40 <= v46) {
        double v49 = 750.0;
      }
      else {
        double v49 = 999.0;
      }
    }
    else
    {
      double v50 = 999.0;
      double v49 = 750.0;
    }
  }
  else
  {
    +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", *(void *)(a1 + 40));
    double v24 = v48;
    double v49 = 750.0;
    double v40 = v48;
    double v50 = 750.0;
  }
  v51 = [*(id *)(a1 + 40) leadingTitleLabel];
  [v51 contentCompressionResistancePriorityForAxis:0];
  double v53 = v52;

  if (v49 != v53)
  {
    v54 = [*(id *)(a1 + 40) leadingTitleLabel];
    *(float *)&double v55 = v49;
    [v54 setContentCompressionResistancePriority:0 forAxis:v55];
  }
  v56 = [*(id *)(a1 + 40) trailingTitleLabel];
  [v56 contentCompressionResistancePriorityForAxis:0];
  double v58 = v57;

  if (v50 != v58)
  {
    v59 = [*(id *)(a1 + 40) trailingTitleLabel];
    *(float *)&double v60 = v50;
    [v59 setContentCompressionResistancePriority:0 forAxis:v60];
  }
  id v64 = [*(id *)(a1 + 32) columnAtIndex:1];
  [v64 length];
  if (v61 != v24) {
    [v64 setLength:v24];
  }
  v62 = [*(id *)(a1 + 32) columnAtIndex:2];
  [v62 length];
  if (v63 != v40) {
    [v62 setLength:v40];
  }
}

- (id)leadingTextView
{
  double v3 = [(TLKSimpleRowView *)self leadingTitleLabel];
  if ([v3 isHidden])
  {
    double v4 = [(TLKSimpleRowView *)self leadingSubtitleLabel];
    if ([v4 isHidden])
    {
      BOOL v5 = 0;
    }
    else
    {
      BOOL v5 = [(TLKSimpleRowView *)self leadingSubtitleLabel];
    }
  }
  else
  {
    BOOL v5 = [(TLKSimpleRowView *)self leadingTitleLabel];
  }

  return v5;
}

+ (double)naturalWidthOfLabel:(id)a3 inFittingSize:(CGSize)a4
{
  objc_msgSend(a3, "systemLayoutSizeFittingSize:", a4.width, a4.height);
  return result;
}

+ (void)applyText:(id)a3 toLabel:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  objc_msgSend(v5, "setHidden:", objc_msgSend(v6, "hasContent") ^ 1);
  if (([v5 isHidden] & 1) == 0) {
    [v5 setRichText:v6];
  }
}

- (id)stringForLabel:(id)a3
{
  id v3 = a3;
  if ([v3 isHidden])
  {
    double v4 = 0;
  }
  else
  {
    double v4 = [v3 text];
  }

  return v4;
}

- (id)leadingTitleLabelString
{
  id v3 = [(TLKSimpleRowView *)self leadingTitleLabel];
  double v4 = [(TLKSimpleRowView *)self stringForLabel:v3];

  return v4;
}

- (id)leadingSubtitleLabelString
{
  id v3 = [(TLKSimpleRowView *)self leadingSubtitleLabel];
  double v4 = [(TLKSimpleRowView *)self stringForLabel:v3];

  return v4;
}

- (id)trailingTitleLabelString
{
  id v3 = [(TLKSimpleRowView *)self trailingTitleLabel];
  double v4 = [(TLKSimpleRowView *)self stringForLabel:v3];

  return v4;
}

- (id)trailingSubtitleLabelString
{
  id v3 = [(TLKSimpleRowView *)self trailingSubtitleLabel];
  double v4 = [(TLKSimpleRowView *)self stringForLabel:v3];

  return v4;
}

- (id)leadingTitleLabelFont
{
  id v3 = [(TLKSimpleRowView *)self leadingTitleLabel];
  double v4 = [(TLKSimpleRowView *)self fontForTextInLabel:v3];

  return v4;
}

- (id)trailingTitleLabelFont
{
  id v3 = [(TLKSimpleRowView *)self trailingTitleLabel];
  double v4 = [(TLKSimpleRowView *)self fontForTextInLabel:v3];

  return v4;
}

- (id)trailingSubtitleLabelFont
{
  id v3 = [(TLKSimpleRowView *)self trailingSubtitleLabel];
  double v4 = [(TLKSimpleRowView *)self fontForTextInLabel:v3];

  return v4;
}

- (id)fontForTextInLabel:(id)a3
{
  id v3 = [a3 attributedText];
  double v4 = [v3 attribute:*MEMORY[0x1E4FB12B0] atIndex:0 effectiveRange:0];

  return v4;
}

- (double)widthOfColumnAtIndex:(unint64_t)a3
{
  double v4 = [(TLKView *)self contentView];
  id v5 = [v4 columnAtIndex:a3];
  [v5 length];
  double v7 = v6;

  return v7;
}

- (id)topRowViews
{
  v2 = [(TLKView *)self contentView];
  id v3 = [v2 rowAtIndex:0];
  double v4 = [v3 arrangedSubviews];

  return v4;
}

- (id)bottomRowViews
{
  v2 = [(TLKView *)self contentView];
  id v3 = [v2 rowAtIndex:1];
  double v4 = [v3 arrangedSubviews];

  return v4;
}

- (TLKImage)leadingImage
{
  return self->_leadingImage;
}

- (TLKRichText)leadingTitle
{
  return self->_leadingTitle;
}

- (TLKRichText)leadingSubtitle
{
  return self->_leadingSubtitle;
}

- (TLKImage)trailingImage
{
  return self->_trailingImage;
}

- (TLKRichText)trailingTitle
{
  return self->_trailingTitle;
}

- (TLKRichText)trailingSubtitle
{
  return self->_trailingSubtitle;
}

- (TLKImageView)leadingImageView
{
  return self->_leadingImageView;
}

- (void)setLeadingImageView:(id)a3
{
}

- (TLKLabel)leadingTitleLabel
{
  return self->_leadingTitleLabel;
}

- (void)setLeadingTitleLabel:(id)a3
{
}

- (TLKLabel)leadingSubtitleLabel
{
  return self->_leadingSubtitleLabel;
}

- (void)setLeadingSubtitleLabel:(id)a3
{
}

- (TLKLabel)trailingTitleLabel
{
  return self->_trailingTitleLabel;
}

- (void)setTrailingTitleLabel:(id)a3
{
}

- (TLKLabel)trailingSubtitleLabel
{
  return self->_trailingSubtitleLabel;
}

- (void)setTrailingSubtitleLabel:(id)a3
{
}

- (TLKImageView)trailingImageView
{
  return self->_trailingImageView;
}

- (void)setTrailingImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingImageView, 0);
  objc_storeStrong((id *)&self->_trailingSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_trailingTitleLabel, 0);
  objc_storeStrong((id *)&self->_leadingSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_leadingTitleLabel, 0);
  objc_storeStrong((id *)&self->_leadingImageView, 0);
  objc_storeStrong((id *)&self->_trailingSubtitle, 0);
  objc_storeStrong((id *)&self->_trailingTitle, 0);
  objc_storeStrong((id *)&self->_trailingImage, 0);
  objc_storeStrong((id *)&self->_leadingSubtitle, 0);
  objc_storeStrong((id *)&self->_leadingTitle, 0);
  objc_storeStrong((id *)&self->_leadingImage, 0);
}

@end