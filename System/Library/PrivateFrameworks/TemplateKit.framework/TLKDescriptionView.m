@interface TLKDescriptionView
- (BOOL)moreButtonIsHidden;
- (BOOL)shouldHideMoreButtonForTextView:(id)a3;
- (CGSize)textSizeForTextView:(id)a3 width:(double)a4 lineCount:(unint64_t)a5;
- (NSString)footnoteButtonText;
- (NSString)moreButtonText;
- (NSString)trailingFootnoteButtonText;
- (NUIContainerBoxView)imageAndDescriptionBoxView;
- (TLKDescriptionViewDelegate)delegate;
- (TLKImage)image;
- (TLKImageView)imageView;
- (TLKLabel)titleLabel;
- (TLKMultilineText)text;
- (TLKMultilineText)title;
- (TLKStackView)footnoteButtonStackView;
- (TLKStackView)stackView;
- (TLKTextButton)footnoteButton;
- (TLKTextButton)moreButton;
- (TLKTextButton)trailingFootnoteButton;
- (TLKTextView)detailsTextView;
- (UIBezierPath)imageViewExclusionPath;
- (UIBezierPath)moreButtonExclusionPath;
- (UIEdgeInsets)defaultBaselineRelativeLayoutMargins;
- (UIView)footnoteButtonStackDummyView;
- (id)detailTextViewText;
- (id)exclusionPathsForTextView;
- (id)setupContentView;
- (id)viewForFirstBaselineLayout;
- (int64_t)numberOfLines;
- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5;
- (void)containerViewDidLayoutArrangedSubviews:(id)a3;
- (void)didMoveToWindow;
- (void)footnoteButtonPressed;
- (void)moreButtonPressed;
- (void)observedPropertiesChanged;
- (void)setDelegate:(id)a3;
- (void)setDetailsTextView:(id)a3;
- (void)setExclusionPathInContainer:(id)a3 includeMoreButton:(BOOL)a4;
- (void)setFootnoteButton:(id)a3;
- (void)setFootnoteButtonStackDummyView:(id)a3;
- (void)setFootnoteButtonStackView:(id)a3;
- (void)setFootnoteButtonText:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageAndDescriptionBoxView:(id)a3;
- (void)setImageView:(id)a3;
- (void)setImageViewExclusionPath:(id)a3;
- (void)setMoreButton:(id)a3;
- (void)setMoreButtonExclusionPath:(id)a3;
- (void)setMoreButtonText:(id)a3;
- (void)setStackView:(id)a3;
- (void)setText:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTrailingFootnoteButton:(id)a3;
- (void)setTrailingFootnoteButtonText:(id)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)trailingFootnoteButtonPressed:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TLKDescriptionView

- (id)setupContentView
{
  v23[3] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  v5 = +[TLKFontUtilities cachedFontForTextStyle:*MEMORY[0x1E4FB28C8] isShort:TLKSnippetModernizationEnabled() ^ 1 isBold:1];
  [v3 setFont:v5];

  +[TLKLayoutUtilities requireIntrinsicSizeForView:v3];
  v6 = objc_opt_new();
  if (!TLKSnippetModernizationEnabled()
    || +[TLKUtilities isIpad]
    || +[TLKUtilities isMacOS])
  {
    uint64_t v4 = *MEMORY[0x1E4FB2950];
  }
  v7 = +[TLKFontUtilities cachedFontForTextStyle:v4 isShort:0 isBold:0];
  [v6 setFont:v7];

  v8 = objc_opt_new();
  v9 = [v6 font];
  [v8 setFont:v9];

  [v8 addTarget:self action:sel_moreButtonPressed];
  v10 = objc_opt_new();
  +[TLKLayoutUtilities requireIntrinsicSizeForView:v10];
  v11 = [TLKDescriptionContainerBoxView alloc];
  v23[0] = v10;
  v23[1] = v6;
  v23[2] = v8;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  v13 = [(NUIContainerBoxView *)v11 initWithArrangedSubviews:v12];

  [(TLKDescriptionContainerBoxView *)v13 setViewForFirstAndLastBaseline:v6];
  [(NUIContainerBoxView *)v13 setHorizontalAlignment:1];
  [(NUIContainerBoxView *)v13 setVerticalAlignment:1];
  [(TLKDescriptionContainerBoxView *)v13 setDelegate:self];
  [(TLKDescriptionContainerBoxView *)v13 setAlignment:0 forView:v6 inAxis:0];
  [(TLKDescriptionContainerBoxView *)v13 setAlignment:4 forView:v8 inAxis:0];
  [(TLKDescriptionContainerBoxView *)v13 setAlignment:4 forView:v8 inAxis:1];
  +[TLKView makeContainerShadowCompatible:v13];
  [(TLKDescriptionView *)self setTitleLabel:v3];
  [(TLKDescriptionView *)self setDetailsTextView:v6];
  [(TLKDescriptionView *)self setMoreButton:v8];
  [(TLKDescriptionView *)self setImageAndDescriptionBoxView:v13];
  [(TLKDescriptionView *)self setImageView:v10];
  [(TLKDescriptionView *)self setImageViewExclusionPath:0];
  [(TLKDescriptionView *)self setMoreButtonExclusionPath:0];
  v14 = [TLKStackView alloc];
  v22[0] = v3;
  v22[1] = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v16 = [(NUIContainerStackView *)v14 initWithArrangedSubviews:v15];

  [(TLKStackView *)v16 setAxis:1];
  [(NUIContainerStackView *)v16 setSpacing:1.0];
  [(TLKStackView *)v16 setDelegate:self];
  [(TLKDescriptionView *)self setStackView:v16];
  v17 = [(TLKDescriptionView *)self imageAndDescriptionBoxView];
  [v17 effectiveBaselineOffsetFromBottom];
  double v19 = v18;

  v20 = [(TLKDescriptionView *)self imageView];
  objc_msgSend(v20, "setCustomAlignmentRectInsets:", 0.0, 0.0, -v19, 0.0);

  return v16;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLKDescriptionView;
  [(TLKDescriptionView *)&v9 traitCollectionDidChange:v4];
  v5 = [(TLKDescriptionView *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(UIView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  v6 = [(TLKDescriptionView *)self traitCollection];
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
  v3.super_class = (Class)TLKDescriptionView;
  [(TLKDescriptionView *)&v3 didMoveToWindow];
  [(UIView *)self tlk_updateWithCurrentAppearance];
}

- (void)tlk_updateForAppearance:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TLKDescriptionView;
  id v4 = a3;
  [(UIView *)&v10 tlk_updateForAppearance:v4];
  int v5 = objc_msgSend(v4, "isVibrant", v10.receiver, v10.super_class);

  if (v5) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  uint64_t v7 = [(TLKDescriptionView *)self moreButton];
  [v7 setProminence:v6];

  uint64_t v8 = [(TLKDescriptionView *)self footnoteButton];
  [v8 setProminence:3];

  objc_super v9 = [(TLKDescriptionView *)self trailingFootnoteButton];
  [v9 setProminence:3];
}

- (void)setText:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_text = &self->_text;
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_text setObserver:0];
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
      uint64_t v7 = *p_text;
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
  objc_storeStrong((id *)&self->_text, a3);
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_text setObserver:self];
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
      v13 = *p_text;
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
            double v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
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
            double v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
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

- (void)setMoreButtonText:(id)a3
{
  uint64_t v10 = (NSString *)a3;
  if (self->_moreButtonText != v10)
  {
    objc_storeStrong((id *)&self->_moreButtonText, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        uint64_t v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setFootnoteButtonText:(id)a3
{
  uint64_t v10 = (NSString *)a3;
  if (self->_footnoteButtonText != v10)
  {
    objc_storeStrong((id *)&self->_footnoteButtonText, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        uint64_t v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setTrailingFootnoteButtonText:(id)a3
{
  uint64_t v10 = (NSString *)a3;
  if (self->_trailingFootnoteButtonText != v10)
  {
    objc_storeStrong((id *)&self->_trailingFootnoteButtonText, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        uint64_t v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
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
      uint64_t v6 = (void *)v5;
      uint64_t v7 = [(TLKView *)self observer];
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
  v56[3] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(TLKDescriptionView *)self text];
  uint64_t v7 = [(TLKDescriptionView *)self detailsTextView];
  [v7 setMultilineText:v6];

  uint64_t v8 = [(TLKDescriptionView *)self footnoteButtonText];
  uint64_t v9 = [(TLKDescriptionView *)self trailingFootnoteButtonText];
  if (!(v8 | v9)) {
    goto LABEL_10;
  }
  uint64_t v10 = [(TLKDescriptionView *)self footnoteButtonStackView];

  if (!v10)
  {
    uint64_t v11 = +[TLKFontUtilities shortFootnoteFont];
    objc_super v3 = objc_opt_new();
    [v3 setFont:v11];
    [v3 setAlignment:4];
    LODWORD(v12) = 1148846080;
    [v3 setContentHuggingPriority:0 forAxis:v12];
    [v3 addTarget:self action:sel_footnoteButtonPressed];
    [(TLKDescriptionView *)self setFootnoteButton:v3];
    id v4 = objc_opt_new();
    [v4 setFont:v11];
    if (+[TLKLayoutUtilities isLTR]) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 0;
    }
    [v4 setAlignment:v13];
    LODWORD(v14) = 1148846080;
    [v4 setContentHuggingPriority:0 forAxis:v14];
    [v4 addTarget:self action:sel_trailingFootnoteButtonPressed_];
    [(TLKDescriptionView *)self setTrailingFootnoteButton:v4];
    uint64_t v15 = objc_opt_new();
    [(TLKDescriptionView *)self setFootnoteButtonStackDummyView:v15];

    uint64_t v16 = [TLKStackView alloc];
    uint64_t v17 = [(TLKDescriptionView *)self footnoteButtonStackDummyView];
    v56[1] = v17;
    v56[2] = v4;
    double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:3];
    uint64_t v19 = [(NUIContainerStackView *)v16 initWithArrangedSubviews:v18];
    [(TLKDescriptionView *)self setFootnoteButtonStackView:v19];

    v20 = [(TLKDescriptionView *)self footnoteButtonStackView];
    [v20 setFlipsToVerticalAxisForAccessibilityContentSizes:1];

    v21 = [(TLKDescriptionView *)self stackView];
    uint64_t v22 = [(TLKDescriptionView *)self footnoteButtonStackView];
    [v21 addArrangedSubview:v22];
  }
  v23 = [(TLKDescriptionView *)self footnoteButton];
  [v23 setTitle:v8];

  v2 = [(TLKDescriptionView *)self trailingFootnoteButton];
  [v2 setTitle:v9];

  if (v8)
  {
    v2 = [(TLKDescriptionView *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      objc_super v3 = [(TLKDescriptionView *)self delegate];
      id v4 = [(TLKDescriptionView *)self footnoteButton];
      uint64_t v24 = [v3 configureMenuForFootnoteButton:v4];
      int v25 = 1;
    }
    else
    {
      int v25 = 0;
      uint64_t v24 = 0;
    }
  }
  else
  {
LABEL_10:
    int v25 = 0;
    uint64_t v24 = 0;
  }
  long long v26 = [(TLKDescriptionView *)self footnoteButton];
  [v26 setShowsMenuAsPrimaryAction:v24];

  if (v25)
  {
  }
  if (v8) {

  }
  if (v9)
  {
    v2 = [(TLKDescriptionView *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      objc_super v3 = [(TLKDescriptionView *)self delegate];
      id v4 = [(TLKDescriptionView *)self trailingFootnoteButton];
      uint64_t v27 = [v3 configureMenuForTrailingFootnoteButton:v4];
      int v28 = 1;
    }
    else
    {
      int v28 = 0;
      uint64_t v27 = 0;
    }
  }
  else
  {
    int v28 = 0;
    uint64_t v27 = 0;
  }
  long long v29 = [(TLKDescriptionView *)self trailingFootnoteButton];
  [v29 setShowsMenuAsPrimaryAction:v27];

  if (v28)
  {
  }
  if (v9) {

  }
  uint64_t v30 = v8 == 0;
  long long v31 = [(TLKDescriptionView *)self footnoteButtonStackView];
  [v31 setHidden:(v8 | v9) == 0];

  long long v32 = [(TLKDescriptionView *)self footnoteButtonStackView];
  BOOL v33 = [v32 axis] == 1;
  v34 = [(TLKDescriptionView *)self footnoteButtonStackDummyView];
  [v34 setHidden:v33];

  uint64_t v35 = [(TLKDescriptionView *)self footnoteButton];
  [v35 setHidden:v30];

  v36 = [(TLKDescriptionView *)self trailingFootnoteButton];
  [v36 setHidden:v9 == 0];

  v37 = [(TLKDescriptionView *)self text];
  uint64_t v38 = [v37 maxLines];
  if (v38)
  {
    uint64_t v30 = [(TLKDescriptionView *)self moreButtonText];
    BOOL v39 = v30 == 0;
  }
  else
  {
    BOOL v39 = 1;
  }
  v40 = [(TLKDescriptionView *)self moreButton];
  [v40 setHidden:v39];

  if (v38) {
  v41 = [(TLKDescriptionView *)self moreButtonText];
  }
  v42 = [(TLKDescriptionView *)self moreButton];
  [v42 setTitle:v41];

  v43 = [(TLKDescriptionView *)self image];
  v44 = [(TLKDescriptionView *)self imageView];
  [v44 setHidden:v43 == 0];

  v45 = [(TLKDescriptionView *)self image];
  v46 = [(TLKDescriptionView *)self imageView];
  [v46 setTlkImage:v45];

  v47 = [(TLKDescriptionView *)self title];
  v48 = [(TLKDescriptionView *)self titleLabel];
  [v48 setHidden:v47 == 0];

  v49 = [(TLKDescriptionView *)self title];
  v50 = [v49 text];
  v51 = [(TLKDescriptionView *)self titleLabel];
  [v51 setText:v50];

  uint64_t v52 = [(TLKDescriptionView *)self imageViewExclusionPath];
  if (!v52
    || (v53 = (void *)v52,
        [(TLKDescriptionView *)self image],
        v54 = objc_claimAutoreleasedReturnValue(),
        v54,
        v53,
        !v54))
  {
    [(TLKDescriptionView *)self setImageViewExclusionPath:0];
  }
  v55 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(TLKDescriptionView *)self setMoreButtonExclusionPath:v55];

  [(UIView *)self tlk_updateWithCurrentAppearance];
}

- (id)viewForFirstBaselineLayout
{
  objc_super v3 = [(TLKDescriptionView *)self titleLabel];
  if ([v3 isHidden])
  {
    id v4 = [(TLKDescriptionView *)self imageAndDescriptionBoxView];
    uint64_t v5 = [v4 viewForFirstBaselineLayout];
  }
  else
  {
    uint64_t v5 = [(TLKDescriptionView *)self titleLabel];
  }

  return v5;
}

- (UIEdgeInsets)defaultBaselineRelativeLayoutMargins
{
  v23.receiver = self;
  v23.super_class = (Class)TLKDescriptionView;
  [(TLKView *)&v23 defaultBaselineRelativeLayoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(TLKDescriptionView *)self titleLabel];
  if ([v11 isHidden])
  {
    double v12 = [(TLKDescriptionView *)self imageView];
    char v13 = [v12 isHidden];

    if ((v13 & 1) == 0)
    {
      double v14 = [(TLKDescriptionView *)self detailsTextView];
      uint64_t v15 = [v14 font];
      [v15 ascender];
      +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self);
      double v17 = v16;

      [(id)objc_opt_class() defaultLayoutMargins];
      double v4 = v17 + v18;
    }
  }
  else
  {
  }
  double v19 = v4;
  double v20 = v6;
  double v21 = v8;
  double v22 = v10;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  CGFloat height = a4.height;
  double width = a4.width;
  id v9 = a3;
  double v10 = [(TLKDescriptionView *)self imageView];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __85__TLKDescriptionView_containerView_willMeasureArrangedSubviewsFittingSize_forReason___block_invoke;
  v32[3] = &unk_1E5FD3378;
  v32[4] = self;
  *(double *)&v32[5] = width;
  *(CGFloat *)&v32[6] = height;
  [v10 performBatchUpdates:v32];

  id v11 = [(TLKDescriptionView *)self imageAndDescriptionBoxView];

  if (!a5 && v11 == v9)
  {
    double v12 = [(TLKDescriptionView *)self image];

    if (v12)
    {
      char v13 = [(TLKDescriptionView *)self imageView];
      [v13 intrinsicContentSize];
      double v15 = v14;
      double v17 = v16;

      double v18 = [(TLKDescriptionView *)self detailsTextView];
      double v19 = [v18 font];

      double v21 = *MEMORY[0x1E4F1DB28];
      double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v22 = v15 + 10.0;
      +[TLKLayoutUtilities scaledValueForValue:v19 withFont:self view:16.0];
      double v24 = v17 + v23;
      [v19 capHeight];
      +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self);
      double v26 = v24 - v25;
      if (!+[TLKLayoutUtilities isLTR])
      {
        v33.origin.x = v21;
        v33.origin.y = v20;
        v33.size.double width = v22;
        v33.size.CGFloat height = v26;
        +[TLKLayoutUtilities ceilingValue:self inView:width - CGRectGetWidth(v33)];
        double v21 = v27;
      }
      int v28 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", v21, v20, v22, v26);
      [(TLKDescriptionView *)self setImageViewExclusionPath:v28];
    }
    long long v29 = [(TLKDescriptionView *)self detailsTextView];
    uint64_t v30 = [v29 textContainer];
    [(TLKDescriptionView *)self setExclusionPathInContainer:v30 includeMoreButton:0];

    long long v31 = [(TLKDescriptionView *)self detailsTextView];
    [v31 invalidateIntrinsicContentSize];

    [v9 invalidateIntrinsicContentSize];
  }
}

void __85__TLKDescriptionView_containerView_willMeasureArrangedSubviewsFittingSize_forReason___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40) * 0.5;
  id v2 = [*(id *)(a1 + 32) imageView];
  objc_msgSend(v2, "setMaximumLayoutSize:", v1, 1.79769313e308);
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  id v4 = a3;
  id v5 = [(TLKDescriptionView *)self imageAndDescriptionBoxView];

  if (v5 == v4)
  {
    double v6 = [(TLKDescriptionView *)self detailsTextView];
    double v7 = [(TLKDescriptionView *)self moreButtonText];

    if (v7)
    {
      BOOL v8 = [(TLKDescriptionView *)self shouldHideMoreButtonForTextView:v6];
      uint64_t v9 = [(TLKDescriptionView *)self moreButton];
      [(id)v9 setHidden:v8];

      double v10 = [(TLKDescriptionView *)self moreButton];
      LOBYTE(v9) = [v10 isHidden];

      if (v9)
      {
        id v11 = [v6 textContainer];
        [(TLKDescriptionView *)self setExclusionPathInContainer:v11 includeMoreButton:0];
      }
      else
      {
        id v11 = [v6 layoutManager];
        double v12 = [v6 textContainer];
        uint64_t v13 = [v11 glyphRangeForTextContainer:v12];
        uint64_t v15 = v14;

        uint64_t v63 = 0;
        v64 = (double *)&v63;
        uint64_t v65 = 0x2020000000;
        uint64_t v66 = 0;
        uint64_t v59 = 0;
        v60 = (double *)&v59;
        uint64_t v61 = 0x2020000000;
        uint64_t v62 = 0;
        uint64_t v55 = 0;
        v56 = (double *)&v55;
        uint64_t v57 = 0x2020000000;
        uint64_t v58 = 0;
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __61__TLKDescriptionView_containerViewDidLayoutArrangedSubviews___block_invoke;
        v54[3] = &unk_1E5FD33A0;
        v54[4] = &v63;
        v54[5] = &v59;
        v54[6] = &v55;
        objc_msgSend(v11, "enumerateLineFragmentsForGlyphRange:usingBlock:", v13, v15, v54);
        BOOL v16 = +[TLKLayoutUtilities isLTR];
        double v17 = [(TLKDescriptionView *)self moreButton];
        double v18 = [(TLKDescriptionView *)self moreButton];
        double v19 = [v18 titleLabel];
        [v19 frame];
        objc_msgSend(v17, "convertRect:toView:", v6);
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        uint64_t rect = v26;

        double v27 = -3.0;
        if (v16) {
          double v27 = 3.0;
        }
        int v28 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", v21 - v27, v64[3], v23 + 3.0, v25, rect);
        [(TLKDescriptionView *)self setMoreButtonExclusionPath:v28];

        long long v29 = [v6 textContainer];
        [(TLKDescriptionView *)self setExclusionPathInContainer:v29 includeMoreButton:1];

        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __61__TLKDescriptionView_containerViewDidLayoutArrangedSubviews___block_invoke_2;
        v53[3] = &unk_1E5FD33A0;
        v53[4] = &v63;
        v53[5] = &v59;
        v53[6] = &v55;
        objc_msgSend(v11, "enumerateLineFragmentsForGlyphRange:usingBlock:", v13, v15, v53);
        uint64_t v30 = [(TLKDescriptionView *)self moreButton];
        [v30 frame];
        CGFloat v32 = v31;
        CGFloat v34 = v33;
        double v36 = v35;
        double v38 = v37;

        double v39 = v64[3];
        v67.origin.x = v32;
        v67.origin.y = v34;
        v67.size.double width = v36;
        v67.size.CGFloat height = v38;
        double Height = CGRectGetHeight(v67);
        v68.origin.x = v21;
        v68.origin.y = recta;
        v68.size.double width = v23;
        v68.size.CGFloat height = v25;
        double v41 = CGRectGetHeight(v68);
        [v6 frame];
        double v43 = v42;
        if (v16)
        {
          double v44 = v60[3] + v56[3];
          double v45 = 3.0;
        }
        else
        {
          double v44 = v56[3] - v36;
          double v45 = -3.0;
        }
        +[TLKLayoutUtilities roundedValue:self inView:v44 + v45];
        double v47 = v46;
        +[TLKLayoutUtilities ceilingValue:self inView:v39 + (Height - v41) * -0.5 + v43];
        double v49 = v48;
        v50 = [(TLKDescriptionView *)self moreButton];
        objc_msgSend(v50, "setFrame:", v47, v49, v36, v38);

        _Block_object_dispose(&v55, 8);
        _Block_object_dispose(&v59, 8);
        _Block_object_dispose(&v63, 8);
      }
    }
  }
}

void *__61__TLKDescriptionView_containerViewDidLayoutArrangedSubviews___block_invoke(void *result, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  *(double *)(*(void *)(result[4] + 8) + 24) = a3;
  *(double *)(*(void *)(result[5] + 8) + 24) = a8;
  *(double *)(*(void *)(result[6] + 8) + 24) = a6;
  return result;
}

void *__61__TLKDescriptionView_containerViewDidLayoutArrangedSubviews___block_invoke_2(void *result, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  if (floor(a8) > 1.0)
  {
    *(double *)(*(void *)(result[4] + 8) + 24) = a3;
    *(double *)(*(void *)(result[5] + 8) + 24) = a8;
    *(double *)(*(void *)(result[6] + 8) + 24) = a6;
  }
  return result;
}

- (void)setExclusionPathInContainer:(id)a3 includeMoreButton:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  double v6 = [(TLKDescriptionView *)self imageViewExclusionPath];
  if (v4)
  {
    double v7 = [(TLKDescriptionView *)self moreButtonExclusionPath];
  }
  else
  {
    double v7 = 0;
  }
  id v8 = objc_alloc(MEMORY[0x1E4F1C978]);
  if (v6) {
    uint64_t v9 = objc_msgSend(v8, "initWithObjects:", v6, v7, 0);
  }
  else {
    uint64_t v9 = objc_msgSend(v8, "initWithObjects:", v7, 0, v11);
  }
  double v10 = (void *)v9;
  [v12 setExclusionPaths:v9];
}

- (CGSize)textSizeForTextView:(id)a3 width:(double)a4 lineCount:(unint64_t)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4FB13A8];
  id v9 = a3;
  id v10 = [v8 alloc];
  uint64_t v11 = [v9 attributedText];
  id v12 = (void *)[v10 initWithAttributedString:v11];

  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB13A0]), "initWithSize:", a4, 3.40282347e38);
  id v14 = objc_alloc_init(MEMORY[0x1E4FB1370]);
  [v14 addTextContainer:v13];
  [v12 addLayoutManager:v14];
  [v13 setMaximumNumberOfLines:a5];
  uint64_t v15 = [v9 textContainer];
  [v15 lineFragmentPadding];
  objc_msgSend(v13, "setLineFragmentPadding:");

  BOOL v16 = [v9 textContainer];
  objc_msgSend(v13, "setLineBreakMode:", objc_msgSend(v16, "lineBreakMode"));

  [(TLKDescriptionView *)self setExclusionPathInContainer:v13 includeMoreButton:0];
  [v14 ensureLayoutForTextContainer:v13];
  [v14 usedRectForTextContainer:v13];
  double v18 = v17;
  +[TLKLayoutUtilities flooredValue:v9 inView:v19];
  double v21 = v20;

  double v22 = v18;
  double v23 = v21;
  result.CGFloat height = v23;
  result.double width = v22;
  return result;
}

- (BOOL)shouldHideMoreButtonForTextView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 textContainer];
  uint64_t v6 = [v5 maximumNumberOfLines];

  if (v6 && ([v4 frame], v8 != 0.0))
  {
    [(TLKDescriptionView *)self textSizeForTextView:v4 width:0 lineCount:v7];
    double v11 = v10;
    [v4 frame];
    BOOL v9 = v11 <= v12;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)moreButtonPressed
{
  double v3 = [(TLKDescriptionView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(TLKDescriptionView *)self detailsTextView];
    uint64_t v6 = [v5 textContainer];
    [(TLKDescriptionView *)self setExclusionPathInContainer:v6 includeMoreButton:0];

    double v7 = [(TLKDescriptionView *)self text];
    [v7 setMaxLines:0];

    double v8 = [(TLKDescriptionView *)self detailsTextView];
    [v8 invalidateIntrinsicContentSize];

    id v9 = [(TLKDescriptionView *)self delegate];
    [v9 didPressMoreButton];
  }
}

- (void)footnoteButtonPressed
{
  double v3 = [(TLKDescriptionView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(TLKDescriptionView *)self delegate];
    [v5 didPressFootnoteButton];
  }
}

- (void)trailingFootnoteButtonPressed:(id)a3
{
  id v7 = a3;
  char v4 = [(TLKDescriptionView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(TLKDescriptionView *)self delegate];
    [v6 didPressTrailingFootnoteButton:v7];
  }
}

- (id)detailTextViewText
{
  id v2 = [(TLKDescriptionView *)self detailsTextView];
  double v3 = [v2 text];

  return v3;
}

- (int64_t)numberOfLines
{
  id v2 = [(TLKDescriptionView *)self detailsTextView];
  double v3 = [v2 textContainer];
  int64_t v4 = [v3 maximumNumberOfLines];

  return v4;
}

- (BOOL)moreButtonIsHidden
{
  id v2 = [(TLKDescriptionView *)self moreButton];
  char v3 = [v2 isHidden];

  return v3;
}

- (id)exclusionPathsForTextView
{
  id v2 = [(TLKDescriptionView *)self detailsTextView];
  char v3 = [v2 textContainer];
  int64_t v4 = [v3 exclusionPaths];

  return v4;
}

- (TLKImage)image
{
  return self->_image;
}

- (TLKMultilineText)text
{
  return self->_text;
}

- (TLKMultilineText)title
{
  return self->_title;
}

- (NSString)footnoteButtonText
{
  return self->_footnoteButtonText;
}

- (NSString)trailingFootnoteButtonText
{
  return self->_trailingFootnoteButtonText;
}

- (NSString)moreButtonText
{
  return self->_moreButtonText;
}

- (TLKDescriptionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TLKDescriptionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TLKStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (TLKLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (TLKTextView)detailsTextView
{
  return self->_detailsTextView;
}

- (void)setDetailsTextView:(id)a3
{
}

- (TLKTextButton)moreButton
{
  return self->_moreButton;
}

- (void)setMoreButton:(id)a3
{
}

- (TLKImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (NUIContainerBoxView)imageAndDescriptionBoxView
{
  return self->_imageAndDescriptionBoxView;
}

- (void)setImageAndDescriptionBoxView:(id)a3
{
}

- (UIBezierPath)imageViewExclusionPath
{
  return self->_imageViewExclusionPath;
}

- (void)setImageViewExclusionPath:(id)a3
{
}

- (UIBezierPath)moreButtonExclusionPath
{
  return self->_moreButtonExclusionPath;
}

- (void)setMoreButtonExclusionPath:(id)a3
{
}

- (TLKTextButton)footnoteButton
{
  return self->_footnoteButton;
}

- (void)setFootnoteButton:(id)a3
{
}

- (TLKTextButton)trailingFootnoteButton
{
  return self->_trailingFootnoteButton;
}

- (void)setTrailingFootnoteButton:(id)a3
{
}

- (TLKStackView)footnoteButtonStackView
{
  return self->_footnoteButtonStackView;
}

- (void)setFootnoteButtonStackView:(id)a3
{
}

- (UIView)footnoteButtonStackDummyView
{
  return self->_footnoteButtonStackDummyView;
}

- (void)setFootnoteButtonStackDummyView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnoteButtonStackDummyView, 0);
  objc_storeStrong((id *)&self->_footnoteButtonStackView, 0);
  objc_storeStrong((id *)&self->_trailingFootnoteButton, 0);
  objc_storeStrong((id *)&self->_footnoteButton, 0);
  objc_storeStrong((id *)&self->_moreButtonExclusionPath, 0);
  objc_storeStrong((id *)&self->_imageViewExclusionPath, 0);
  objc_storeStrong((id *)&self->_imageAndDescriptionBoxView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_detailsTextView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_moreButtonText, 0);
  objc_storeStrong((id *)&self->_trailingFootnoteButtonText, 0);
  objc_storeStrong((id *)&self->_footnoteButtonText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end