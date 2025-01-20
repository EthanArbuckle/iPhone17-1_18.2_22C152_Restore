@interface _CarTitleView
- (BOOL)largeText;
- (CGSize)intrinsicContentSize;
- (NSArray)extraConstraints;
- (NSString)text;
- (UIView)view;
- (void)_updateLayout;
- (void)_updateText;
- (void)setExtraConstraints:(id)a3;
- (void)setLargeText:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setView:(id)a3;
@end

@implementation _CarTitleView

- (void)setText:(id)a3
{
  p_text = (id *)&self->_text;
  id v11 = a3;
  if ((objc_msgSend(*p_text, "isEqualToString:") & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E4F5B268];
    v7 = [(_CarTitleView *)self extraConstraints];
    [v6 deactivateConstraints:v7];

    [(_CarTitleView *)self setExtraConstraints:0];
    objc_storeStrong((id *)&self->_text, a3);
    if (*p_text)
    {
      v8 = [UILabel alloc];
      v9 = -[UILabel initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(UIView *)v9 setText:v11];
      [(UIView *)v9 setAdjustsFontForContentSizeCategory:1];
    }
    else
    {
      v9 = 0;
    }
    view = self->_view;
    self->_view = v9;

    [(_CarTitleView *)self _updateText];
    [(_CarTitleView *)self _updateLayout];
  }
}

- (void)setView:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v4 = (UIView *)a3;
  text = self->_text;
  self->_text = 0;

  v6 = (void *)MEMORY[0x1E4F5B268];
  v7 = [(_CarTitleView *)self extraConstraints];
  [v6 deactivateConstraints:v7];

  [(_CarTitleView *)self setExtraConstraints:0];
  view = self->_view;
  self->_view = v4;
  v9 = v4;

  v10 = [(UIView *)v9 topAnchor];
  id v11 = [(UIView *)self topAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v17[0] = v12;
  v13 = [(UIView *)v9 bottomAnchor];
  v14 = [(UIView *)self bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v17[1] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

  [(_CarTitleView *)self setExtraConstraints:v16];
  [(_CarTitleView *)self _updateLayout];
}

- (void)setLargeText:(BOOL)a3
{
  if (self->_largeText != a3)
  {
    self->_largeText = a3;
    [(_CarTitleView *)self _updateText];
  }
}

- (CGSize)intrinsicContentSize
{
  v2 = [(_CarTitleView *)self view];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_updateText
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(_CarTitleView *)self text];
  if (v3)
  {
    double v4 = (void *)v3;
    double v5 = [(_CarTitleView *)self view];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v7 = [(_CarTitleView *)self view];
      double v8 = [(_CarTitleView *)self extraConstraints];

      if (!v8)
      {
        v9 = [v7 firstBaselineAnchor];
        v10 = [(UIView *)self topAnchor];
        id v11 = [v9 constraintEqualToAnchor:v10];
        v19[0] = v11;
        v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
        [(_CarTitleView *)self setExtraConstraints:v12];
      }
      if ([(_CarTitleView *)self largeText])
      {
        v13 = [off_1E52D39B8 _preferredFontForTextStyle:@"UICTFontTextStyleTitle1" variant:1024];
        [v7 setFont:v13];

        [v7 setTextAlignment:4];
        v14 = [(_CarTitleView *)self extraConstraints];
        v15 = [v14 objectAtIndexedSubscript:0];
        v16 = v15;
        double v17 = 32.0;
      }
      else
      {
        v18 = [off_1E52D39B8 _preferredFontForTextStyle:@"UICTFontTextStyleCallout" variant:1024];
        [v7 setFont:v18];

        [v7 setTextAlignment:1];
        v14 = [(_CarTitleView *)self extraConstraints];
        v15 = [v14 objectAtIndexedSubscript:0];
        v16 = v15;
        double v17 = 28.0;
      }
      [v15 setConstant:v17];

      [v7 sizeToFit];
    }
  }
}

- (void)_updateLayout
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v3 = [(UIView *)self subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v7++) removeFromSuperview];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  double v8 = [(_CarTitleView *)self view];

  if (v8)
  {
    v9 = [(_CarTitleView *)self view];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    v10 = [(_CarTitleView *)self view];
    [(UIView *)self addSubview:v10];

    id v11 = [(_CarTitleView *)self extraConstraints];
    v12 = (void *)[v11 mutableCopy];

    v13 = [(UIView *)self->_view leadingAnchor];
    v14 = [(UIView *)self leadingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v24[0] = v15;
    v16 = [(UIView *)self->_view trailingAnchor];
    double v17 = [(UIView *)self trailingAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v24[1] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    [v12 addObjectsFromArray:v19];

    [MEMORY[0x1E4F5B268] activateConstraints:v12];
  }
}

- (UIView)view
{
  return self->_view;
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)largeText
{
  return self->_largeText;
}

- (NSArray)extraConstraints
{
  return self->_extraConstraints;
}

- (void)setExtraConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraConstraints, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end