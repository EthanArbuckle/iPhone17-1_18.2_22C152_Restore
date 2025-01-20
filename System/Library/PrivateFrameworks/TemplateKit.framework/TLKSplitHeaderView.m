@interface TLKSplitHeaderView
- (BOOL)isLeadingButtonEnabled;
- (BOOL)isTrailingButtonEnabled;
- (BOOL)secondRowIsHidden;
- (BOOL)shouldBadgeSubtitle;
- (BOOL)useCompactWidth;
- (BOOL)useLargeTitle;
- (BOOL)usesDefaultLayoutMargins;
- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5;
- (NUIContainerStackView)subtitleStackView;
- (TLKEmbossedLabel)subtitle2Label;
- (TLKImage)leadingImage;
- (TLKImage)trailingImage;
- (TLKLabel)leadingSubtitleLabel;
- (TLKLabel)leadingTitleLabel;
- (TLKLabel)subtitle1Label;
- (TLKLabel)trailingSubtitleLabel;
- (TLKLabel)trailingTitleLabel;
- (TLKMultilineText)centerLeadingTitle;
- (TLKMultilineText)centerTrailingTitle;
- (TLKMultilineText)leadingSubtitle;
- (TLKMultilineText)leadingTitle;
- (TLKMultilineText)subtitle1;
- (TLKMultilineText)subtitle2;
- (TLKMultilineText)title;
- (TLKMultilineText)trailingSubtitle;
- (TLKMultilineText)trailingTitle;
- (TLKSplitHeaderViewDelegate)delegate;
- (TLKSplitTitleContainer)titleContainerView;
- (TLKTextButton)leadingButton;
- (TLKTextButton)trailingButton;
- (id)centerLeadingTitleLabel;
- (id)centerTrailingTitleLabel;
- (id)firstRowOfViews;
- (id)grid;
- (id)leadingImageInView;
- (id)secondRowOfViews;
- (id)setupContentView;
- (id)subtitleLabel;
- (id)thirdRowOfViews;
- (id)titleLabel;
- (id)trailingImageInView;
- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5;
- (void)observedPropertiesChanged;
- (void)performLeadingButtonSelector;
- (void)performTrailingButtonSelector;
- (void)setCenterLeadingTitle:(id)a3;
- (void)setCenterTrailingTitle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsLeadingButtonEnabled:(BOOL)a3;
- (void)setIsTrailingButtonEnabled:(BOOL)a3;
- (void)setLeadingButton:(id)a3;
- (void)setLeadingImage:(id)a3;
- (void)setLeadingSubtitle:(id)a3;
- (void)setLeadingSubtitleLabel:(id)a3;
- (void)setLeadingTitle:(id)a3;
- (void)setLeadingTitleLabel:(id)a3;
- (void)setShouldBadgeSubtitle:(BOOL)a3;
- (void)setSubtitle1:(id)a3;
- (void)setSubtitle1Label:(id)a3;
- (void)setSubtitle2:(id)a3;
- (void)setSubtitle2Label:(id)a3;
- (void)setSubtitleStackView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleContainerView:(id)a3;
- (void)setTrailingButton:(id)a3;
- (void)setTrailingImage:(id)a3;
- (void)setTrailingSubtitle:(id)a3;
- (void)setTrailingSubtitleLabel:(id)a3;
- (void)setTrailingTitle:(id)a3;
- (void)setTrailingTitleLabel:(id)a3;
- (void)setUseCompactWidth:(BOOL)a3;
- (void)setUseLargeTitle:(BOOL)a3;
@end

@implementation TLKSplitHeaderView

- (id)setupContentView
{
  id v3 = objc_alloc(MEMORY[0x1E4F4BEF8]);
  v4 = [(TLKSplitHeaderView *)self grid];
  v5 = (void *)[v3 initWithArrangedSubviewRows:v4];

  [v5 setHorizontalAlignment:3];
  v6 = [v5 rowAtIndex:0];
  [v6 setAlignment:4];

  v7 = [v5 rowAtIndex:1];
  [v7 setAlignment:2];

  v8 = [v5 rowAtIndex:0];
  [v8 setSpacingAfter:10.0];

  v9 = [v5 rowAtIndex:1];
  [v9 setSpacingAfter:1.0];

  +[TLKView defaultLayoutMargins];
  double v11 = v10;
  double v13 = v12;
  v14 = [(TLKSplitHeaderView *)self leadingSubtitleLabel];
  [v14 effectiveBaselineOffsetFromBottom];
  double v16 = v13 - ceil(v15);

  objc_msgSend(v5, "setLayoutMargins:", v11, 16.0, v16, 16.0);
  [v5 setRowSpacing:0.0];
  [v5 setColumnSpacing:8.0];
  [v5 setDelegate:self];
  v17 = [(TLKSplitHeaderView *)self titleContainerView];
  [v5 setAlignment:0 forView:v17 inAxis:1];

  return v5;
}

- (void)setIsLeadingButtonEnabled:(BOOL)a3
{
  if (self->_isLeadingButtonEnabled != a3)
  {
    self->_isLeadingButtonEnabled = a3;
    uint64_t v4 = [(TLKView *)self observer];
    if (v4)
    {
      v5 = (void *)v4;
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

- (void)setLeadingImage:(id)a3
{
  double v10 = (TLKImage *)a3;
  if (self->_leadingImage != v10)
  {
    objc_storeStrong((id *)&self->_leadingImage, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      uint64_t v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setIsTrailingButtonEnabled:(BOOL)a3
{
  if (self->_isTrailingButtonEnabled != a3)
  {
    self->_isTrailingButtonEnabled = a3;
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

- (void)setTrailingImage:(id)a3
{
  double v10 = (TLKImage *)a3;
  if (self->_trailingImage != v10)
  {
    objc_storeStrong((id *)&self->_trailingImage, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      uint64_t v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setShouldBadgeSubtitle:(BOOL)a3
{
  if (self->_shouldBadgeSubtitle != a3)
  {
    self->_shouldBadgeSubtitle = a3;
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

- (void)setUseLargeTitle:(BOOL)a3
{
  if (self->_useLargeTitle != a3)
  {
    self->_useLargeTitle = a3;
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
      uint64_t v7 = *p_leadingTitle;
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
            double v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
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
      double v13 = *p_leadingTitle;
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
      uint64_t v7 = *p_trailingTitle;
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
            double v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
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
      double v13 = *p_trailingTitle;
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
      uint64_t v7 = *p_leadingSubtitle;
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
            double v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
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
      double v13 = *p_leadingSubtitle;
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
      uint64_t v7 = *p_title;
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
            double v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
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
      double v13 = *p_title;
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

- (void)setCenterLeadingTitle:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_centerLeadingTitle = &self->_centerLeadingTitle;
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_centerLeadingTitle setObserver:0];
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
      uint64_t v7 = *p_centerLeadingTitle;
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
            double v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
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
  objc_storeStrong((id *)&self->_centerLeadingTitle, a3);
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_centerLeadingTitle setObserver:self];
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
      double v13 = *p_centerLeadingTitle;
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

- (void)setCenterTrailingTitle:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_centerTrailingTitle = &self->_centerTrailingTitle;
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_centerTrailingTitle setObserver:0];
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
      uint64_t v7 = *p_centerTrailingTitle;
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
            double v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
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
  objc_storeStrong((id *)&self->_centerTrailingTitle, a3);
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_centerTrailingTitle setObserver:self];
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
      double v13 = *p_centerTrailingTitle;
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

- (void)setSubtitle1:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_subtitle1 = &self->_subtitle1;
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_subtitle1 setObserver:0];
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
      uint64_t v7 = *p_subtitle1;
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
            double v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
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
  objc_storeStrong((id *)&self->_subtitle1, a3);
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_subtitle1 setObserver:self];
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
      double v13 = *p_subtitle1;
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

- (void)setSubtitle2:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_subtitle2 = &self->_subtitle2;
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_subtitle2 setObserver:0];
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
      uint64_t v7 = *p_subtitle2;
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
            double v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
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
  objc_storeStrong((id *)&self->_subtitle2, a3);
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_subtitle2 setObserver:self];
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
      double v13 = *p_subtitle2;
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

- (id)grid
{
  v8[3] = *MEMORY[0x1E4F143B8];
  id v3 = [(TLKSplitHeaderView *)self firstRowOfViews];
  uint64_t v4 = [(TLKSplitHeaderView *)self secondRowOfViews];
  id v5 = [(TLKSplitHeaderView *)self thirdRowOfViews];
  v8[0] = v3;
  v8[1] = v4;
  v8[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  return v6;
}

- (id)firstRowOfViews
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  +[TLKLayoutUtilities requireIntrinsicSizeForView:v3];
  objc_msgSend(v3, "setCustomAlignmentRectInsets:", 0.0, -17.0, 0.0, -17.0);
  [v3 addTarget:self action:sel_performLeadingButtonSelector];
  [(TLKSplitHeaderView *)self setLeadingButton:v3];
  uint64_t v4 = objc_opt_new();
  [(TLKSplitHeaderView *)self setTitleContainerView:v4];

  id v5 = objc_opt_new();
  +[TLKLayoutUtilities requireIntrinsicSizeForView:v5];
  objc_msgSend(v5, "setCustomAlignmentRectInsets:", 0.0, -17.0, 0.0, -17.0);
  [v5 addTarget:self action:sel_performTrailingButtonSelector];
  [(TLKSplitHeaderView *)self setTrailingButton:v5];
  v6 = [(TLKSplitHeaderView *)self titleContainerView];
  v9[1] = v6;
  v9[2] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];

  return v7;
}

- (id)secondRowOfViews
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v3 = +[TLKFontUtilities cachedFontForTextStyle:*MEMORY[0x1E4FB2950] isShort:0 isBold:1];
  uint64_t v4 = [(TLKSplitHeaderView *)self subtitleLabel];
  [v4 setFont:v3];
  [(TLKSplitHeaderView *)self setLeadingTitleLabel:v4];
  id v5 = [(TLKSplitHeaderView *)self subtitleLabel];
  [v5 setFont:v3];
  [(TLKSplitHeaderView *)self setTrailingTitleLabel:v5];
  v6 = [(TLKSplitHeaderView *)self subtitleLabel];
  [v6 setProminence:1];
  LODWORD(v7) = 1132068864;
  [v6 setContentHuggingPriority:0 forAxis:v7];
  [(TLKSplitHeaderView *)self setSubtitle1Label:v6];
  uint64_t v8 = objc_opt_new();
  [(TLKSplitHeaderView *)self setSubtitle2Label:v8];
  id v9 = objc_alloc(MEMORY[0x1E4F4BF00]);
  v15[0] = v6;
  v15[1] = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  uint64_t v11 = (void *)[v9 initWithArrangedSubviews:v10];

  [v11 setSpacing:2.0];
  [v11 setAlignment:3];
  [v11 setAxis:1];
  [(TLKSplitHeaderView *)self setSubtitleStackView:v11];
  v14[0] = v4;
  v14[1] = v11;
  v14[2] = v5;
  double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  return v12;
}

- (id)thirdRowOfViews
{
  v8[3] = *MEMORY[0x1E4F143B8];
  id v3 = [(TLKSplitHeaderView *)self subtitleLabel];
  [v3 setProminence:1];
  [(TLKSplitHeaderView *)self setLeadingSubtitleLabel:v3];
  uint64_t v4 = [(TLKSplitHeaderView *)self subtitleLabel];
  [v4 setProminence:1];
  [(TLKSplitHeaderView *)self setTrailingSubtitleLabel:v4];
  id v5 = [(TLKSplitHeaderView *)self subtitleStackView];
  v8[1] = v5;
  v8[2] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  return v6;
}

- (id)subtitleLabel
{
  v2 = objc_opt_new();
  id v3 = +[TLKFontUtilities footnoteFont];
  [v2 setFont:v3];

  [v2 setTextAlignment:1];
  LODWORD(v4) = 1148846080;
  [v2 setContentHuggingPriority:0 forAxis:v4];
  LODWORD(v5) = 1132068864;
  [v2 setContentCompressionResistancePriority:0 forAxis:v5];
  return v2;
}

- (id)centerLeadingTitleLabel
{
  v2 = [(TLKSplitHeaderView *)self titleContainerView];
  id v3 = [v2 centerLeadingTitleLabel];

  return v3;
}

- (id)centerTrailingTitleLabel
{
  v2 = [(TLKSplitHeaderView *)self titleContainerView];
  id v3 = [v2 centerTrailingTitleLabel];

  return v3;
}

- (id)titleLabel
{
  v2 = [(TLKSplitHeaderView *)self titleContainerView];
  id v3 = [v2 titleLabel];

  return v3;
}

- (void)observedPropertiesChanged
{
  BOOL v3 = [(TLKSplitHeaderView *)self useLargeTitle];
  double v4 = [(TLKSplitHeaderView *)self titleContainerView];
  [v4 setUseLargeTitle:v3];

  double v5 = [(TLKSplitHeaderView *)self titleContainerView];
  v6 = [v5 titleFont];

  double v7 = [(TLKSplitHeaderView *)self centerLeadingTitle];
  uint64_t v8 = [(TLKSplitHeaderView *)self centerLeadingTitleLabel];
  [v8 setHidden:v7 == 0];

  id v9 = [(TLKSplitHeaderView *)self centerLeadingTitleLabel];
  [v9 setFont:v6];

  uint64_t v10 = [(TLKSplitHeaderView *)self centerLeadingTitle];
  uint64_t v11 = [(TLKSplitHeaderView *)self centerLeadingTitleLabel];
  [v11 setMultilineText:v10];

  double v12 = [(TLKSplitHeaderView *)self centerTrailingTitle];
  double v13 = [(TLKSplitHeaderView *)self centerTrailingTitleLabel];
  [v13 setHidden:v12 == 0];

  uint64_t v14 = [(TLKSplitHeaderView *)self centerTrailingTitleLabel];
  [v14 setFont:v6];

  uint64_t v15 = [(TLKSplitHeaderView *)self centerTrailingTitle];
  uint64_t v16 = [(TLKSplitHeaderView *)self centerTrailingTitleLabel];
  [v16 setMultilineText:v15];

  uint64_t v17 = [(TLKSplitHeaderView *)self centerLeadingTitle];
  v18 = [v17 text];
  uint64_t v19 = [v18 length];
  v20 = [(TLKSplitHeaderView *)self centerTrailingTitle];
  v21 = [v20 text];
  unint64_t v22 = [v21 length] + v19;

  v23 = [(TLKSplitHeaderView *)self titleLabel];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __47__TLKSplitHeaderView_observedPropertiesChanged__block_invoke;
  v80[3] = &unk_1E5FD3138;
  v80[4] = self;
  id v24 = v6;
  id v81 = v24;
  unint64_t v82 = v22;
  [v23 performBatchUpdates:v80];

  uint64_t v25 = [(TLKSplitHeaderView *)self title];
  long long v26 = [(TLKSplitHeaderView *)self titleContainerView];
  long long v27 = [v26 titleStackView];
  [v27 setHidden:(v25 | v22) == 0];

  if (v22 <= 4) {
    double v28 = 7.0;
  }
  else {
    double v28 = 0.0;
  }
  long long v29 = [(TLKSplitHeaderView *)self titleContainerView];
  long long v30 = [v29 titleStackView];
  [v30 setSpacing:v28];

  long long v31 = [(TLKSplitHeaderView *)self leadingTitle];
  if (v31)
  {
    int v32 = 0;
    BOOL v33 = 0;
  }
  else
  {
    long long v30 = [(TLKSplitHeaderView *)self trailingTitle];
    if (v30)
    {
      int v32 = 0;
      BOOL v33 = 0;
    }
    else
    {
      long long v26 = [(TLKSplitHeaderView *)self subtitle1];
      BOOL v33 = v26 == 0;
      int v32 = 1;
    }
  }
  v34 = [(TLKView *)self contentView];
  uint64_t v35 = [v34 rowAtIndex:1];
  [v35 setHidden:v33];

  if (v32) {
  if (!v31)
  }

  v36 = [(TLKSplitHeaderView *)self leadingSubtitle];
  if (v36)
  {
    int v37 = 0;
    BOOL v38 = 0;
  }
  else
  {
    long long v30 = [(TLKSplitHeaderView *)self trailingSubtitle];
    if (v30)
    {
      int v37 = 0;
      BOOL v38 = 0;
    }
    else
    {
      long long v26 = [(TLKSplitHeaderView *)self subtitle2];
      BOOL v38 = v26 == 0;
      int v37 = 1;
    }
  }
  v39 = [(TLKView *)self contentView];
  v40 = [v39 rowAtIndex:2];
  [v40 setHidden:v38];

  if (v37) {
  if (!v36)
  }

  v41 = [(TLKSplitHeaderView *)self subtitle1];
  v42 = [(TLKSplitHeaderView *)self subtitle1Label];
  [v42 setHidden:v41 == 0];

  v43 = [(TLKSplitHeaderView *)self subtitle1];
  v44 = [(TLKSplitHeaderView *)self subtitle1Label];
  [v44 setMultilineText:v43];

  v45 = [(TLKSplitHeaderView *)self subtitle2Label];
  v46 = [(TLKSplitHeaderView *)self subtitle2];
  BOOL v47 = [(TLKSplitHeaderView *)self shouldBadgeSubtitle];
  v48 = (void *)MEMORY[0x1E4FB28F0];
  if (v47) {
    v48 = (void *)MEMORY[0x1E4FB28E0];
  }
  v49 = +[TLKFontUtilities cachedFontForTextStyle:*v48 isShort:TLKSnippetModernizationEnabled() ^ 1 isBold:v47];
  BOOL v50 = [(TLKSplitHeaderView *)self shouldBadgeSubtitle];
  if (v50) {
    double v51 = 2.25;
  }
  else {
    double v51 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (v50) {
    double v52 = 7.0;
  }
  else {
    double v52 = *MEMORY[0x1E4F1DB30];
  }
  objc_msgSend(v45, "setText:font:customInsetSize:badge:", v46, v49, -[TLKSplitHeaderView shouldBadgeSubtitle](self, "shouldBadgeSubtitle", *MEMORY[0x1E4F1DB30]), v52, v51);

  v53 = [(TLKSplitHeaderView *)self subtitle2];
  v54 = [(TLKSplitHeaderView *)self subtitle2Label];
  [v54 setHidden:v53 == 0];

  v55 = [(TLKSplitHeaderView *)self leadingImage];
  v56 = [(TLKSplitHeaderView *)self leadingButton];
  [v56 setTlkImage:v55];

  BOOL v57 = [(TLKSplitHeaderView *)self isLeadingButtonEnabled];
  v58 = [(TLKSplitHeaderView *)self leadingButton];
  [v58 setEnabled:v57];

  v59 = [(TLKSplitHeaderView *)self leadingTitle];
  v60 = [(TLKSplitHeaderView *)self leadingTitleLabel];
  [v60 setHidden:v59 == 0];

  v61 = [(TLKSplitHeaderView *)self leadingTitle];
  v62 = [(TLKSplitHeaderView *)self leadingTitleLabel];
  [v62 setMultilineText:v61];

  v63 = [(TLKSplitHeaderView *)self leadingSubtitle];
  v64 = [(TLKSplitHeaderView *)self leadingSubtitleLabel];
  [v64 setHidden:v63 == 0];

  v65 = [(TLKSplitHeaderView *)self leadingSubtitle];
  v66 = [(TLKSplitHeaderView *)self leadingSubtitleLabel];
  [v66 setMultilineText:v65];

  v67 = [(TLKSplitHeaderView *)self trailingImage];
  v68 = [(TLKSplitHeaderView *)self trailingButton];
  [v68 setTlkImage:v67];

  BOOL v69 = [(TLKSplitHeaderView *)self isTrailingButtonEnabled];
  v70 = [(TLKSplitHeaderView *)self trailingButton];
  [v70 setEnabled:v69];

  v71 = [(TLKSplitHeaderView *)self trailingTitle];
  v72 = [(TLKSplitHeaderView *)self trailingTitleLabel];
  [v72 setHidden:v71 == 0];

  v73 = [(TLKSplitHeaderView *)self trailingTitle];
  v74 = [(TLKSplitHeaderView *)self trailingTitleLabel];
  [v74 setMultilineText:v73];

  v75 = [(TLKSplitHeaderView *)self trailingSubtitle];
  v76 = [(TLKSplitHeaderView *)self trailingSubtitleLabel];
  [v76 setHidden:v75 == 0];

  v77 = [(TLKSplitHeaderView *)self trailingSubtitle];
  v78 = [(TLKSplitHeaderView *)self trailingSubtitleLabel];
  [v78 setMultilineText:v77];

  v79 = [(TLKSplitHeaderView *)self titleContainerView];
  [v79 setNeedsLayout];
}

void __47__TLKSplitHeaderView_observedPropertiesChanged__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) title];
  BOOL v3 = [*(id *)(a1 + 32) titleLabel];
  [v3 setHidden:v2 == 0];

  uint64_t v4 = *(void *)(a1 + 40);
  double v5 = [*(id *)(a1 + 32) titleLabel];
  [v5 setFont:v4];

  v6 = [*(id *)(a1 + 32) title];
  double v7 = [*(id *)(a1 + 32) titleLabel];
  [v7 setMultilineText:v6];

  BOOL v8 = *(void *)(a1 + 48) != 0;
  id v9 = [*(id *)(a1 + 32) titleLabel];
  [v9 setAdjustsFontSizeToFitWidth:v8];

  if (+[TLKUtilities isMacOS])
  {
    if (*(void *)(a1 + 48))
    {
      double v10 = 6.0;
      double v11 = 0.0;
      double v12 = 0.0;
      double v13 = 6.0;
    }
    else
    {
      double v11 = *MEMORY[0x1E4F4BEB8];
      double v10 = *(double *)(MEMORY[0x1E4F4BEB8] + 8);
      double v12 = *(double *)(MEMORY[0x1E4F4BEB8] + 16);
      double v13 = *(double *)(MEMORY[0x1E4F4BEB8] + 24);
    }
    id v14 = [*(id *)(a1 + 32) titleLabel];
    objc_msgSend(v14, "setCustomAlignmentRectInsets:", v11, v10, v12, v13);
  }
}

- (void)performLeadingButtonSelector
{
  BOOL v3 = [(TLKSplitHeaderView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(TLKSplitHeaderView *)self delegate];
    [v5 didPressLeadingButtonForSplitHeader:self];
  }
}

- (void)performTrailingButtonSelector
{
  BOOL v3 = [(TLKSplitHeaderView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(TLKSplitHeaderView *)self delegate];
    [v5 didPressTrailingButtonForSplitHeader:self];
  }
}

- (BOOL)usesDefaultLayoutMargins
{
  return 0;
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  v6 = [(TLKSplitHeaderView *)self leadingButton];
  double v7 = [v6 tlkImageView];
  +[TLKLayoutUtilities applyRowBoundedSizingToImageView:v7 isCompactWidth:[(TLKSplitHeaderView *)self useCompactWidth]];

  id v9 = [(TLKSplitHeaderView *)self trailingButton];
  BOOL v8 = [v9 tlkImageView];
  +[TLKLayoutUtilities applyRowBoundedSizingToImageView:v8 isCompactWidth:[(TLKSplitHeaderView *)self useCompactWidth]];
}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a5;
  uint64_t v9 = [(TLKSplitHeaderView *)self leadingTitleLabel];
  if ((id)v9 == v8)
  {

    goto LABEL_6;
  }
  double v10 = (void *)v9;
  id v11 = [(TLKSplitHeaderView *)self trailingTitleLabel];

  if (v11 == v8)
  {
LABEL_6:
    uint64_t v15 = [(TLKSplitHeaderView *)self leadingImage];
    [v15 size];
    double v17 = v16;

    v18 = [(TLKSplitHeaderView *)self leadingButton];
    [v18 customAlignmentRectInsets];
    double v20 = v17 - v19;
    v21 = [(TLKSplitHeaderView *)self leadingButton];
    [v21 customAlignmentRectInsets];
    double v14 = v20 - v22;

    objc_msgSend(v8, "systemLayoutSizeFittingSize:", v14, height);
    double v13 = v23;
    goto LABEL_8;
  }
  id v12 = [(TLKSplitHeaderView *)self titleContainerView];

  if (v12 == v8)
  {
    id v24 = [(TLKSplitHeaderView *)self titleContainerView];
    double v14 = 1000.0;
    objc_msgSend(v24, "effectiveLayoutSizeFittingSize:", width, 1000.0);
    double v13 = v25;
  }
  else
  {
    double v14 = *MEMORY[0x1E4F4BED8];
    double v13 = *(double *)(MEMORY[0x1E4F4BED8] + 8);
  }
LABEL_8:

  double v26 = v14;
  double v27 = v13;
  result.double height = v27;
  result.double width = v26;
  return result;
}

- (BOOL)secondRowIsHidden
{
  v2 = [(TLKView *)self contentView];
  BOOL v3 = [v2 rowAtIndex:1];
  char v4 = [v3 isHidden];

  return v4;
}

- (id)leadingImageInView
{
  v2 = [(TLKSplitHeaderView *)self leadingButton];
  BOOL v3 = [v2 tlkImage];
  char v4 = [v3 uiImage];

  return v4;
}

- (id)trailingImageInView
{
  v2 = [(TLKSplitHeaderView *)self trailingButton];
  BOOL v3 = [v2 tlkImage];
  char v4 = [v3 uiImage];

  return v4;
}

- (TLKMultilineText)title
{
  return self->_title;
}

- (TLKMultilineText)centerLeadingTitle
{
  return self->_centerLeadingTitle;
}

- (TLKMultilineText)centerTrailingTitle
{
  return self->_centerTrailingTitle;
}

- (TLKMultilineText)subtitle1
{
  return self->_subtitle1;
}

- (TLKMultilineText)subtitle2
{
  return self->_subtitle2;
}

- (BOOL)useLargeTitle
{
  return self->_useLargeTitle;
}

- (BOOL)shouldBadgeSubtitle
{
  return self->_shouldBadgeSubtitle;
}

- (BOOL)useCompactWidth
{
  return self->_useCompactWidth;
}

- (void)setUseCompactWidth:(BOOL)a3
{
  self->_useCompactWidth = a3;
}

- (BOOL)isLeadingButtonEnabled
{
  return self->_isLeadingButtonEnabled;
}

- (TLKImage)leadingImage
{
  return self->_leadingImage;
}

- (TLKMultilineText)leadingTitle
{
  return self->_leadingTitle;
}

- (TLKMultilineText)leadingSubtitle
{
  return self->_leadingSubtitle;
}

- (BOOL)isTrailingButtonEnabled
{
  return self->_isTrailingButtonEnabled;
}

- (TLKImage)trailingImage
{
  return self->_trailingImage;
}

- (TLKMultilineText)trailingTitle
{
  return self->_trailingTitle;
}

- (TLKMultilineText)trailingSubtitle
{
  return self->_trailingSubtitle;
}

- (void)setTrailingSubtitle:(id)a3
{
}

- (TLKSplitHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TLKSplitHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TLKTextButton)leadingButton
{
  return self->_leadingButton;
}

- (void)setLeadingButton:(id)a3
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

- (TLKTextButton)trailingButton
{
  return self->_trailingButton;
}

- (void)setTrailingButton:(id)a3
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

- (TLKSplitTitleContainer)titleContainerView
{
  return self->_titleContainerView;
}

- (void)setTitleContainerView:(id)a3
{
}

- (NUIContainerStackView)subtitleStackView
{
  return self->_subtitleStackView;
}

- (void)setSubtitleStackView:(id)a3
{
}

- (TLKLabel)subtitle1Label
{
  return self->_subtitle1Label;
}

- (void)setSubtitle1Label:(id)a3
{
}

- (TLKEmbossedLabel)subtitle2Label
{
  return self->_subtitle2Label;
}

- (void)setSubtitle2Label:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle2Label, 0);
  objc_storeStrong((id *)&self->_subtitle1Label, 0);
  objc_storeStrong((id *)&self->_subtitleStackView, 0);
  objc_storeStrong((id *)&self->_titleContainerView, 0);
  objc_storeStrong((id *)&self->_trailingSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_trailingTitleLabel, 0);
  objc_storeStrong((id *)&self->_trailingButton, 0);
  objc_storeStrong((id *)&self->_leadingSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_leadingTitleLabel, 0);
  objc_storeStrong((id *)&self->_leadingButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trailingSubtitle, 0);
  objc_storeStrong((id *)&self->_trailingTitle, 0);
  objc_storeStrong((id *)&self->_trailingImage, 0);
  objc_storeStrong((id *)&self->_leadingSubtitle, 0);
  objc_storeStrong((id *)&self->_leadingTitle, 0);
  objc_storeStrong((id *)&self->_leadingImage, 0);
  objc_storeStrong((id *)&self->_subtitle2, 0);
  objc_storeStrong((id *)&self->_subtitle1, 0);
  objc_storeStrong((id *)&self->_centerTrailingTitle, 0);
  objc_storeStrong((id *)&self->_centerLeadingTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end