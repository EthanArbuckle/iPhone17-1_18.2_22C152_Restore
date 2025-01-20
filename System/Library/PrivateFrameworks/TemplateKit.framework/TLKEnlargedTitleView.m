@interface TLKEnlargedTitleView
- (TLKLabel)subtitleLabel;
- (TLKLabel)titleLabel;
- (TLKMultilineText)subtitle;
- (TLKMultilineText)title;
- (id)setupContentView;
- (id)subtitleLabelText;
- (id)titleLabelText;
- (void)observedPropertiesChanged;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation TLKEnlargedTitleView

- (id)setupContentView
{
  v3 = objc_opt_new();
  [v3 setAxis:1];
  [v3 setSpacing:4.0];
  v4 = objc_opt_new();
  v5 = +[TLKFontUtilities cachedFontForTextStyle:*MEMORY[0x1E4FB2988]];
  [v4 setFont:v5];

  [(TLKEnlargedTitleView *)self setTitleLabel:v4];
  [v3 addArrangedSubview:v4];
  v6 = +[TLKLabel secondaryLabel];
  [v3 addArrangedSubview:v6];
  v7 = +[TLKFontUtilities subheadFont];
  [v6 setFont:v7];

  [(TLKEnlargedTitleView *)self setSubtitleLabel:v6];
  return v3;
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

- (void)observedPropertiesChanged
{
  v3 = [(TLKEnlargedTitleView *)self title];
  v4 = [v3 text];
  id v5 = [(TLKEnlargedTitleView *)self titleLabel];
  [v5 setText:v4];

  id v8 = [(TLKEnlargedTitleView *)self subtitle];
  v6 = [v8 text];
  v7 = [(TLKEnlargedTitleView *)self subtitleLabel];
  [v7 setText:v6];
}

- (id)titleLabelText
{
  v2 = [(TLKEnlargedTitleView *)self titleLabel];
  v3 = [v2 text];

  return v3;
}

- (id)subtitleLabelText
{
  v2 = [(TLKEnlargedTitleView *)self subtitleLabel];
  v3 = [v2 text];

  return v3;
}

- (TLKMultilineText)title
{
  return self->_title;
}

- (TLKMultilineText)subtitle
{
  return self->_subtitle;
}

- (TLKLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (TLKLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end