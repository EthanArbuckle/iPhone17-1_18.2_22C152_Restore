@interface TLKRichTextField
- (BOOL)scaleIconsToFont;
- (BOOL)useCompactMode;
- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5;
- (NSString)description;
- (TLKIconsView)iconView;
- (TLKLabel)textLabel;
- (TLKObserver)observer;
- (TLKRichText)richText;
- (TLKRichTextField)init;
- (TLKRoundedCornerLabels)roundedCornerLabels;
- (TLKStarsView)starRatingView;
- (UIFont)font;
- (id)attributedString;
- (int64_t)batchUpdateCount;
- (unint64_t)prominence;
- (unint64_t)roundedCornerLabelSizeConfiguration;
- (void)propertiesDidChange;
- (void)setBatchUpdateCount:(int64_t)a3;
- (void)setFont:(id)a3;
- (void)setIconView:(id)a3;
- (void)setObserver:(id)a3;
- (void)setProminence:(unint64_t)a3;
- (void)setRichText:(id)a3;
- (void)setRoundedCornerLabelSizeConfiguration:(unint64_t)a3;
- (void)setRoundedCornerLabels:(id)a3;
- (void)setScaleIconsToFont:(BOOL)a3;
- (void)setStarRatingView:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)setUseCompactMode:(BOOL)a3;
- (void)updateIconSizing;
- (void)updateIcons:(id)a3;
- (void)updateRoundedCornerLabels:(id)a3;
- (void)updateStarRating:(id)a3;
- (void)updateWithRichText:(id)a3;
@end

@implementation TLKRichTextField

- (TLKRichTextField)init
{
  v9.receiver = self;
  v9.super_class = (Class)TLKRichTextField;
  v2 = [(TLKRichTextField *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(TLKStackView *)v2 setAxis:0];
    [(TLKStackView *)v3 setAlignment:5];
    v4 = objc_opt_new();
    [(TLKRichTextField *)v3 setTextLabel:v4];

    v5 = [(TLKRichTextField *)v3 textLabel];
    [v5 setSupportsColorGlyphs:1];

    v6 = +[TLKFontUtilities shortFootnoteFont];
    [(TLKRichTextField *)v3 setFont:v6];

    v7 = [(TLKRichTextField *)v3 textLabel];
    [(TLKStackView *)v3 addArrangedSubview:v7];

    [(TLKRichTextField *)v3 setDelegate:v3];
    [(TLKRichTextField *)v3 setObserver:v3];
  }
  return v3;
}

- (void)setRichText:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_richText = &self->_richText;
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_richText setObserver:0];
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
      v7 = *p_richText;
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
  objc_storeStrong((id *)&self->_richText, a3);
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_richText setObserver:self];
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
      v13 = *p_richText;
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
  uint64_t v19 = [(TLKRichTextField *)self observer];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(TLKRichTextField *)self observer];
    uint64_t v22 = [v21 batchUpdateCount];

    if (!v22)
    {
      v23 = [(TLKRichTextField *)self observer];
      [v23 propertiesDidChange];
    }
  }
}

- (void)propertiesDidChange
{
  id v3 = [(TLKRichTextField *)self richText];
  [(TLKRichTextField *)self updateWithRichText:v3];
}

- (void)updateWithRichText:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__TLKRichTextField_updateWithRichText___block_invoke;
  v6[3] = &unk_1E5FD3020;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TLKRichTextField *)self performBatchUpdates:v6];
}

void __39__TLKRichTextField_updateWithRichText___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) textLabel];
  [v3 setRichText:v2];

  uint64_t v4 = [*(id *)(a1 + 40) hasContent] ^ 1;
  id v5 = [*(id *)(a1 + 32) textLabel];
  [v5 setHidden:v4];

  v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) stars];
  [v6 updateStarRating:v7];

  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [*(id *)(a1 + 40) icons];
  [v8 updateIcons:v9];

  uint64_t v10 = *(void **)(a1 + 32);
  id v11 = [*(id *)(a1 + 40) inlineRoundedText];
  [v10 updateRoundedCornerLabels:v11];
}

- (UIFont)font
{
  uint64_t v2 = [(TLKRichTextField *)self textLabel];
  id v3 = [v2 font];

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  id v5 = [(TLKRichTextField *)self textLabel];
  [v5 setFont:v4];

  v6 = [(TLKRichTextField *)self starRatingView];
  [v6 setFont:v4];

  id v7 = [(TLKRichTextField *)self iconView];
  [v7 setSymbolFont:v4];

  [(TLKRichTextField *)self updateIconSizing];
}

- (void)setScaleIconsToFont:(BOOL)a3
{
  if (self->_scaleIconsToFont != a3)
  {
    self->_scaleIconsToFont = a3;
    [(TLKRichTextField *)self updateIconSizing];
  }
}

- (void)updateIconSizing
{
  if (![(TLKRichTextField *)self scaleIconsToFont]) {
    goto LABEL_7;
  }
  id v3 = [(TLKRichTextField *)self richText];
  id v4 = [v3 icons];
  id v5 = [v4 firstObject];
  v6 = [v5 image];
  [v6 size];
  double v8 = v7;
  double v10 = v9;
  double v11 = *MEMORY[0x1E4F1DB30];
  double v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);

  if (v8 == v11 && v10 == v12)
  {
LABEL_7:
    v20 = [(TLKRichTextField *)self iconView];
    objc_msgSend(v20, "setMinimumLayoutSize:", 0.0, 0.0);

    v18 = [(TLKRichTextField *)self iconView];
    id v21 = v18;
    double v19 = 1.79769313e308;
  }
  else
  {
    uint64_t v14 = [(TLKRichTextField *)self font];
    [v14 capHeight];
    double v16 = v15;

    uint64_t v17 = [(TLKRichTextField *)self iconView];
    objc_msgSend(v17, "setMinimumLayoutSize:", 0.0, v16);

    v18 = [(TLKRichTextField *)self iconView];
    id v21 = v18;
    double v19 = v16;
  }
  objc_msgSend(v18, "setMaximumLayoutSize:", 1.79769313e308, v19);
}

- (void)setRoundedCornerLabelSizeConfiguration:(unint64_t)a3
{
  self->_roundedCornerLabelSizeConfiguration = a3;
  id v4 = [(TLKRichTextField *)self roundedCornerLabels];
  [v4 setSizeConfiguration:a3];
}

- (unint64_t)prominence
{
  uint64_t v2 = [(TLKRichTextField *)self textLabel];
  unint64_t v3 = [v2 prominence];

  return v3;
}

- (void)setProminence:(unint64_t)a3
{
  id v5 = [(TLKRichTextField *)self textLabel];
  [v5 setProminence:a3];

  v6 = [(TLKRichTextField *)self iconView];
  [v6 setProminence:a3];

  id v7 = [(TLKRichTextField *)self roundedCornerLabels];
  [v7 setProminence:a3];
}

- (void)setUseCompactMode:(BOOL)a3
{
  BOOL v3 = a3;
  self->_useCompactMode = a3;
  id v4 = [(TLKRichTextField *)self starRatingView];
  [v4 setUseCompactMode:v3];
}

- (void)updateStarRating:(id)a3
{
  id v18 = a3;
  id v4 = [(TLKRichTextField *)self starRatingView];
  if (v18)
  {

    if (!v4)
    {
      id v5 = objc_opt_new();
      [(TLKRichTextField *)self setStarRatingView:v5];

      v6 = [(TLKRichTextField *)self font];
      id v7 = [(TLKRichTextField *)self starRatingView];
      [v7 setFont:v6];

      BOOL v8 = [(TLKRichTextField *)self useCompactMode];
      double v9 = [(TLKRichTextField *)self starRatingView];
      [v9 setUseCompactMode:v8];

      double v10 = [(TLKRichTextField *)self starRatingView];
      [(TLKRichTextField *)self insertArrangedSubview:v10 atIndex:0];

      double v11 = [(TLKRichTextField *)self starRatingView];
      -[TLKRichTextField setMinimumSpacing:adjacentToView:](self, "setMinimumSpacing:adjacentToView:", v11, 0.0, 0.0, 0.0, 5.5);
    }
    double v12 = [v18 firstObject];
    [v12 starRating];
    double v14 = v13;
    double v15 = [(TLKRichTextField *)self starRatingView];
    [v15 setStarRating:v14];

    double v16 = [(TLKRichTextField *)self starRatingView];
    id v4 = v16;
    uint64_t v17 = 0;
  }
  else
  {
    double v16 = v4;
    uint64_t v17 = 1;
  }
  [v16 setHidden:v17];
}

- (void)updateIcons:(id)a3
{
  id v17 = a3;
  id v4 = [(TLKRichTextField *)self iconView];
  if (v17)
  {

    if (!v4)
    {
      id v5 = objc_opt_new();
      [(TLKRichTextField *)self setIconView:v5];

      unint64_t v6 = [(TLKRichTextField *)self prominence];
      id v7 = [(TLKRichTextField *)self iconView];
      [v7 setProminence:v6];

      BOOL v8 = [(TLKRichTextField *)self font];
      double v9 = [(TLKRichTextField *)self iconView];
      [v9 setSymbolFont:v8];

      double v10 = [(TLKRichTextField *)self iconView];
      +[TLKLayoutUtilities requireIntrinsicSizeForView:v10];

      [(TLKRichTextField *)self updateIconSizing];
      double v11 = [(TLKRichTextField *)self iconView];
      double v12 = [(TLKRichTextField *)self arrangedSubviews];
      -[TLKRichTextField insertArrangedSubview:atIndex:](self, "insertArrangedSubview:atIndex:", v11, [v12 count] - 1);

      double v13 = [(TLKRichTextField *)self iconView];
      -[TLKRichTextField setMinimumSpacing:adjacentToView:](self, "setMinimumSpacing:adjacentToView:", v13, 0.0, 0.0, 0.0, 4.0);
    }
    double v14 = [(TLKRichTextField *)self iconView];
    [v14 updateIcons:v17];

    double v15 = [(TLKRichTextField *)self iconView];
    id v4 = v15;
    uint64_t v16 = 0;
  }
  else
  {
    double v15 = v4;
    uint64_t v16 = 1;
  }
  [v15 setHidden:v16];
}

- (void)updateRoundedCornerLabels:(id)a3
{
  id v17 = a3;
  id v4 = [(TLKRichTextField *)self roundedCornerLabels];
  if (v17)
  {

    if (!v4)
    {
      id v5 = objc_opt_new();
      [(TLKRichTextField *)self setRoundedCornerLabels:v5];

      unint64_t v6 = [(TLKRichTextField *)self prominence];
      id v7 = [(TLKRichTextField *)self roundedCornerLabels];
      [v7 setProminence:v6];

      unint64_t v8 = [(TLKRichTextField *)self roundedCornerLabelSizeConfiguration];
      double v9 = [(TLKRichTextField *)self roundedCornerLabels];
      [v9 setSizeConfiguration:v8];

      double v10 = [(TLKRichTextField *)self roundedCornerLabels];
      +[TLKLayoutUtilities requireIntrinsicSizeForView:v10];

      double v11 = [(TLKRichTextField *)self roundedCornerLabels];
      double v12 = [(TLKRichTextField *)self starRatingView];
      [(TLKRichTextField *)self insertArrangedSubview:v11 atIndex:v12 != 0];

      double v13 = [(TLKRichTextField *)self roundedCornerLabels];
      -[TLKRichTextField setMinimumSpacing:adjacentToView:](self, "setMinimumSpacing:adjacentToView:", v13, 0.0, 0.0, 0.0, 10.0);
    }
    double v14 = [(TLKRichTextField *)self roundedCornerLabels];
    [v14 updateRoundedText:v17];

    double v15 = [(TLKRichTextField *)self roundedCornerLabels];
    id v4 = v15;
    uint64_t v16 = 0;
  }
  else
  {
    double v15 = v4;
    uint64_t v16 = 1;
  }
  [v15 setHidden:v16];
}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v10 = a4;
  id v11 = [(TLKRichTextField *)self starRatingView];

  if (v11 == v10)
  {
    double v19 = (double)(TLKSnippetModernizationEnabled() ^ 1);
    goto LABEL_7;
  }
  id v12 = [(TLKRichTextField *)self roundedCornerLabels];

  if (v12 == v10)
  {
    double x = x + 1.0;
    goto LABEL_9;
  }
  id v13 = [(TLKRichTextField *)self iconView];

  if (v13 == v10)
  {
    double v14 = [(TLKRichTextField *)self iconView];
    double v15 = [v14 imageViews];
    uint64_t v16 = [v15 firstObject];
    [v16 intrinsicContentSize];
    double v18 = v17;

    if (v18 < 20.0)
    {
      +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:0.5];
LABEL_7:
      double y = y - v19;
    }
  }
LABEL_9:

  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (id)attributedString
{
  uint64_t v2 = [(TLKRichTextField *)self textLabel];
  BOOL v3 = [v2 attributedText];

  return v3;
}

- (NSString)description
{
  BOOL v3 = (void *)MEMORY[0x1E4F28E78];
  v9.receiver = self;
  v9.super_class = (Class)TLKRichTextField;
  id v4 = [(TLKRichTextField *)&v9 description];
  id v5 = [v3 stringWithString:v4];

  unint64_t v6 = [(TLKRichTextField *)self textLabel];
  id v7 = [v6 description];

  if (v7) {
    [v5 appendString:v7];
  }

  return (NSString *)v5;
}

- (TLKObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->observer);
  return (TLKObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (int64_t)batchUpdateCount
{
  return self->batchUpdateCount;
}

- (void)setBatchUpdateCount:(int64_t)a3
{
  self->batchUpdateCount = a3;
}

- (TLKRichText)richText
{
  return self->_richText;
}

- (unint64_t)roundedCornerLabelSizeConfiguration
{
  return self->_roundedCornerLabelSizeConfiguration;
}

- (BOOL)useCompactMode
{
  return self->_useCompactMode;
}

- (BOOL)scaleIconsToFont
{
  return self->_scaleIconsToFont;
}

- (TLKLabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (TLKRoundedCornerLabels)roundedCornerLabels
{
  return self->_roundedCornerLabels;
}

- (void)setRoundedCornerLabels:(id)a3
{
}

- (TLKStarsView)starRatingView
{
  return self->_starRatingView;
}

- (void)setStarRatingView:(id)a3
{
}

- (TLKIconsView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_starRatingView, 0);
  objc_storeStrong((id *)&self->_roundedCornerLabels, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_richText, 0);
  objc_destroyWeak((id *)&self->observer);
}

@end