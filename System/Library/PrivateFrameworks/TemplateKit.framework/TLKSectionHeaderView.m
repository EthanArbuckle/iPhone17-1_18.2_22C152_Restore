@interface TLKSectionHeaderView
- (BOOL)usesDefaultLayoutMargins;
- (TLKLabel)headerTextLabel;
- (TLKMultilineText)headerText;
- (TLKProminenceView)backgroundView;
- (id)headerLabelText;
- (id)setupContentView;
- (void)observedPropertiesChanged;
- (void)setBackgroundView:(id)a3;
- (void)setHeaderText:(id)a3;
- (void)setHeaderTextLabel:(id)a3;
@end

@implementation TLKSectionHeaderView

- (id)setupContentView
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v3 = +[TLKProminenceView viewWithProminence:3];
  [(TLKSectionHeaderView *)self setBackgroundView:v3];
  v4 = objc_opt_new();
  v5 = +[TLKFontUtilities subheadFont];
  [v4 setFont:v5];

  +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:8.0];
  double v7 = -v6;
  +[TLKUtilities standardTableCellContentInset];
  double v9 = -v8;
  +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:8.0];
  double v11 = -v10;
  +[TLKUtilities standardTableCellContentInset];
  objc_msgSend(v4, "setCustomAlignmentRectInsets:", v7, v9, v11, -v12);
  [(TLKSectionHeaderView *)self setHeaderTextLabel:v4];
  id v13 = objc_alloc(MEMORY[0x1E4F4BEE8]);
  v17[0] = v3;
  v17[1] = v4;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v15 = (void *)[v13 initWithArrangedSubviews:v14];

  [v15 setHorizontalAlignment:1];
  [v15 setAlignment:0 forView:v3 inAxis:0];
  [v15 setAlignment:0 forView:v3 inAxis:1];
  objc_msgSend(v15, "setLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
  -[TLKSectionHeaderView setMinimumLayoutSize:](self, "setMinimumLayoutSize:", 0.0, 8.0);

  return v15;
}

- (BOOL)usesDefaultLayoutMargins
{
  return 0;
}

- (void)setHeaderText:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_headerText = &self->_headerText;
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_headerText setObserver:0];
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
      double v7 = *p_headerText;
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
  objc_storeStrong((id *)&self->_headerText, a3);
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_headerText setObserver:self];
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
      id v13 = *p_headerText;
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
  v3 = [(TLKSectionHeaderView *)self headerText];
  v4 = [(TLKSectionHeaderView *)self headerTextLabel];
  [v4 setMultilineText:v3];

  id v5 = [(TLKSectionHeaderView *)self headerText];
  double v6 = [v5 text];
  uint64_t v7 = [v6 length];

  uint64_t v8 = [(TLKSectionHeaderView *)self headerTextLabel];
  LODWORD(v6) = [v8 isHidden];

  if ((v7 == 0) != v6)
  {
    id v9 = [(TLKSectionHeaderView *)self headerTextLabel];
    [v9 setHidden:v7 == 0];
  }
}

- (id)headerLabelText
{
  v2 = [(TLKSectionHeaderView *)self headerTextLabel];
  v3 = [v2 text];

  return v3;
}

- (TLKMultilineText)headerText
{
  return self->_headerText;
}

- (TLKLabel)headerTextLabel
{
  return self->_headerTextLabel;
}

- (void)setHeaderTextLabel:(id)a3
{
}

- (TLKProminenceView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_headerTextLabel, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
}

@end