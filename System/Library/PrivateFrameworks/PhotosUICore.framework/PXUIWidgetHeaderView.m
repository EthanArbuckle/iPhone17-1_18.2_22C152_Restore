@interface PXUIWidgetHeaderView
- (BOOL)_canComposeTitleWithSubtitle;
- (BOOL)_hasAccessibilityLargeText;
- (BOOL)_hasContent;
- (BOOL)_hasSubtitle;
- (BOOL)_needsUpdate;
- (BOOL)allowUserInteractionWithCaption;
- (BOOL)allowUserInteractionWithSubtitle;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)_constraints;
- (NSString)caption;
- (NSString)subtitle;
- (NSString)title;
- (PXUIWidgetHeaderViewDelegate)delegate;
- (UIButton)_captionButton;
- (UIButton)_subtitleButton;
- (UIColor)textColor;
- (UIEdgeInsets)contentInsets;
- (UIFont)primaryFont;
- (UIFont)secondaryFont;
- (UILabel)_captionLabel;
- (UILabel)_subtitleLabel;
- (UILabel)_titleLabel;
- (UIVisualEffectView)_visualEffectView;
- (double)_currentHeight;
- (double)distanceBetweenTitleBaselineAndSubtitleBaseline;
- (double)horizontalSpacingBetweenTitleAndSubtitle;
- (double)minimumDistanceBetweenLastBaselineAndBottom;
- (double)minimumDistanceBetweenTopAndFirstBaseline;
- (id)_captionButtonCreateIfNeeded:(BOOL)a3;
- (id)_captionLabelCreateIfNeeded:(BOOL)a3;
- (id)_subtitleButtonCreateIfNeeded:(BOOL)a3;
- (id)_subtitleLabelCreateIfNeeded:(BOOL)a3;
- (id)_titleLabelCreateIfNeeded:(BOOL)a3;
- (id)_visualEffectViewCreateIfNeeded:(BOOL)a3;
- (int64_t)layoutStyle;
- (void)_handleCaptionButton:(id)a3;
- (void)_handleSubtitleButton:(id)a3;
- (void)_invalidateCaption;
- (void)_invalidateHasContent;
- (void)_invalidateSubtitle;
- (void)_invalidateTitle;
- (void)_setConstraints:(id)a3;
- (void)_setCurrentHeight:(double)a3;
- (void)_setHasContent:(BOOL)a3;
- (void)_setNeedsUpdate;
- (void)_updateCaptionIfNeeded;
- (void)_updateHasContentIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateSubtitleIfNeeded;
- (void)_updateTitleIfNeeded;
- (void)layoutSubviews;
- (void)performChanges:(id)a3;
- (void)setAllowUserInteractionWithCaption:(BOOL)a3;
- (void)setAllowUserInteractionWithSubtitle:(BOOL)a3;
- (void)setCaption:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setDistanceBetweenTitleBaselineAndSubtitleBaseline:(double)a3;
- (void)setHorizontalSpacingBetweenTitleAndSubtitle:(double)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setMinimumDistanceBetweenLastBaselineAndBottom:(double)a3;
- (void)setMinimumDistanceBetweenTopAndFirstBaseline:(double)a3;
- (void)setPrimaryFont:(id)a3;
- (void)setSecondaryFont:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PXUIWidgetHeaderView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__visualEffectView, 0);
  objc_storeStrong((id *)&self->__captionButton, 0);
  objc_storeStrong((id *)&self->__captionLabel, 0);
  objc_storeStrong((id *)&self->__subtitleButton, 0);
  objc_storeStrong((id *)&self->__subtitleLabel, 0);
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_storeStrong((id *)&self->__constraints, 0);
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (UIVisualEffectView)_visualEffectView
{
  return self->__visualEffectView;
}

- (UIButton)_captionButton
{
  return self->__captionButton;
}

- (UILabel)_captionLabel
{
  return self->__captionLabel;
}

- (UIButton)_subtitleButton
{
  return self->__subtitleButton;
}

- (UILabel)_subtitleLabel
{
  return self->__subtitleLabel;
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (void)_setCurrentHeight:(double)a3
{
  self->__currentHeight = a3;
}

- (double)_currentHeight
{
  return self->__currentHeight;
}

- (NSArray)_constraints
{
  return self->__constraints;
}

- (BOOL)_hasContent
{
  return self->__hasContent;
}

- (double)minimumDistanceBetweenLastBaselineAndBottom
{
  return self->_minimumDistanceBetweenLastBaselineAndBottom;
}

- (double)horizontalSpacingBetweenTitleAndSubtitle
{
  return self->_horizontalSpacingBetweenTitleAndSubtitle;
}

- (double)distanceBetweenTitleBaselineAndSubtitleBaseline
{
  return self->_distanceBetweenTitleBaselineAndSubtitleBaseline;
}

- (double)minimumDistanceBetweenTopAndFirstBaseline
{
  return self->_minimumDistanceBetweenTopAndFirstBaseline;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (BOOL)allowUserInteractionWithCaption
{
  return self->_allowUserInteractionWithCaption;
}

- (BOOL)allowUserInteractionWithSubtitle
{
  return self->_allowUserInteractionWithSubtitle;
}

- (UIFont)secondaryFont
{
  return self->_secondaryFont;
}

- (UIFont)primaryFont
{
  return self->_primaryFont;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (NSString)caption
{
  return self->_caption;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (PXUIWidgetHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXUIWidgetHeaderViewDelegate *)WeakRetained;
}

- (void)_updateCaptionIfNeeded
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (self->_needsUpdateFlags.caption)
  {
    self->_needsUpdateFlags.caption = 0;
    v3 = [(PXUIWidgetHeaderView *)self caption];
    v4 = [(PXUIWidgetHeaderView *)self secondaryFont];
    v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    }
    v7 = v6;

    v8 = [(PXUIWidgetHeaderView *)self textColor];
    uint64_t v9 = [v3 length];
    BOOL v10 = [(PXUIWidgetHeaderView *)self allowUserInteractionWithCaption];
    if (v9) {
      BOOL v11 = !v10;
    }
    else {
      BOOL v11 = 0;
    }
    if (v9) {
      BOOL v12 = v10;
    }
    else {
      BOOL v12 = 0;
    }
    v13 = [(PXUIWidgetHeaderView *)self _captionLabelCreateIfNeeded:v11];
    v14 = [(PXUIWidgetHeaderView *)self _captionButtonCreateIfNeeded:v12];
    if (v11)
    {
      [v13 setText:v3];
      [v13 setFont:v7];
      [v13 setTextColor:v8];
    }
    if (v12)
    {
      if (v3)
      {
        id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
        uint64_t v22 = *MEMORY[0x1E4FB06F8];
        v23[0] = v7;
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
        v17 = (void *)[v15 initWithString:v3 attributes:v16];
      }
      else
      {
        v17 = 0;
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __46__PXUIWidgetHeaderView__updateCaptionIfNeeded__block_invoke;
      v19[3] = &unk_1E5DD32A8;
      id v20 = v14;
      id v21 = v17;
      id v18 = v17;
      objc_msgSend(v20, "px_updateTitleUsingBlock:", v19);
    }
    [v13 setHidden:v12];
    [v14 setHidden:v12 ^ 1];
    [(PXUIWidgetHeaderView *)self setNeedsLayout];
  }
}

void __46__PXUIWidgetHeaderView__updateCaptionIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAttributedTitle:*(void *)(a1 + 40) forState:0];
  [*(id *)(a1 + 32) setContentHorizontalAlignment:1];
  id v2 = [*(id *)(a1 + 32) titleLabel];
  [v2 setLineBreakMode:0];
}

- (void)_invalidateCaption
{
  self->_needsUpdateFlags.caption = 1;
  [(PXUIWidgetHeaderView *)self _setNeedsUpdate];
}

- (void)_updateSubtitleIfNeeded
{
  v25[1] = *MEMORY[0x1E4F143B8];
  if (self->_needsUpdateFlags.subtitle)
  {
    self->_needsUpdateFlags.subtitle = 0;
    v3 = [(PXUIWidgetHeaderView *)self subtitle];
    v4 = [(PXUIWidgetHeaderView *)self secondaryFont];
    v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    }
    v7 = v6;

    v8 = [(PXUIWidgetHeaderView *)self textColor];
    BOOL v9 = [(PXUIWidgetHeaderView *)self allowUserInteractionWithSubtitle];
    BOOL v10 = [(PXUIWidgetHeaderView *)self _canComposeTitleWithSubtitle];
    if (v10)
    {

      v3 = 0;
    }
    uint64_t v11 = [v3 length];
    if (v11) {
      BOOL v12 = !v9;
    }
    else {
      BOOL v12 = 0;
    }
    if (v11) {
      BOOL v13 = v9;
    }
    else {
      BOOL v13 = 0;
    }
    v14 = [(PXUIWidgetHeaderView *)self _subtitleLabelCreateIfNeeded:v12];
    id v15 = v14;
    if (v10) {
      [v14 setText:0];
    }
    v16 = [(PXUIWidgetHeaderView *)self _subtitleButtonCreateIfNeeded:v13];
    if (v12)
    {
      [v15 setText:v3];
      [v15 setFont:v7];
      [v15 setTextColor:v8];
    }
    if (v13)
    {
      if (v3)
      {
        id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
        uint64_t v24 = *MEMORY[0x1E4FB06F8];
        v25[0] = v7;
        id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
        v19 = (void *)[v17 initWithString:v3 attributes:v18];
      }
      else
      {
        v19 = 0;
      }
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __47__PXUIWidgetHeaderView__updateSubtitleIfNeeded__block_invoke;
      v21[3] = &unk_1E5DD32A8;
      id v22 = v16;
      id v23 = v19;
      id v20 = v19;
      objc_msgSend(v22, "px_updateTitleUsingBlock:", v21);
    }
    [v15 setHidden:v13];
    [v16 setHidden:v13 ^ 1];
    [(PXUIWidgetHeaderView *)self setNeedsLayout];
  }
}

void __47__PXUIWidgetHeaderView__updateSubtitleIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAttributedTitle:*(void *)(a1 + 40) forState:0];
  id v2 = *(void **)(a1 + 32);
  if (objc_msgSend(MEMORY[0x1E4F1CA20], "px_currentCharacterDirection") == 2) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [v2 setContentHorizontalAlignment:v3];
  id v4 = [*(id *)(a1 + 32) titleLabel];
  [v4 setLineBreakMode:0];
}

- (void)_invalidateSubtitle
{
  self->_needsUpdateFlags.subtitle = 1;
  [(PXUIWidgetHeaderView *)self _setNeedsUpdate];
}

- (void)_updateTitleIfNeeded
{
  if (self->_needsUpdateFlags.title)
  {
    self->_needsUpdateFlags.title = 0;
    id v15 = [(PXUIWidgetHeaderView *)self title];
    uint64_t v3 = [(PXUIWidgetHeaderView *)self primaryFont];
    id v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2998]];
    }
    id v6 = v5;

    v7 = [(PXUIWidgetHeaderView *)self textColor];
    uint64_t v8 = [v15 length];
    BOOL v9 = [(PXUIWidgetHeaderView *)self _titleLabelCreateIfNeeded:v8 != 0];
    if (v8 && [(PXUIWidgetHeaderView *)self _canComposeTitleWithSubtitle])
    {
      BOOL v10 = NSString;
      uint64_t v11 = [(PXUIWidgetHeaderView *)self subtitle];
      uint64_t v12 = [v10 stringWithFormat:@"%@ %@ %@", v15, @"·", v11];

      id v15 = (id)v12;
    }
    [v9 setText:v15];
    [v9 setHidden:v8 == 0];
    [v9 setFont:v6];
    [v9 setTextColor:v7];
    BOOL v13 = [(PXUIWidgetHeaderView *)self _hasAccessibilityLargeText];
    if (v13) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = 4;
    }
    [v9 setNumberOfLines:!v13];
    [v9 setLineBreakMode:v14];
    [(PXUIWidgetHeaderView *)self setNeedsLayout];
  }
}

- (void)_invalidateTitle
{
  self->_needsUpdateFlags.title = 1;
  [(PXUIWidgetHeaderView *)self _setNeedsUpdate];
}

- (void)_updateHasContentIfNeeded
{
  if (self->_needsUpdateFlags.hasContent)
  {
    self->_needsUpdateFlags.hasContent = 0;
    uint64_t v3 = [(PXUIWidgetHeaderView *)self title];
    uint64_t v4 = [v3 length];

    if (v4
      || ([(PXUIWidgetHeaderView *)self subtitle],
          id v5 = objc_claimAutoreleasedReturnValue(),
          uint64_t v6 = [v5 length],
          v5,
          v6))
    {
      BOOL v7 = 1;
    }
    else
    {
      uint64_t v8 = [(PXUIWidgetHeaderView *)self caption];
      BOOL v7 = [v8 length] != 0;
    }
    [(PXUIWidgetHeaderView *)self _setHasContent:v7];
  }
}

- (void)_invalidateHasContent
{
  self->_needsUpdateFlags.hasContent = 1;
  [(PXUIWidgetHeaderView *)self _setNeedsUpdate];
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PXUIWidgetHeaderView.m" lineNumber:544 description:@"not inside -performChanges: or _updateIfNeeded"];
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.hasContent
      || self->_needsUpdateFlags.title
      || self->_needsUpdateFlags.subtitle
      || self->_needsUpdateFlags.caption;
}

- (void)_updateIfNeeded
{
  if ([(PXUIWidgetHeaderView *)self _needsUpdate])
  {
    BOOL isPerformingUpdates = self->_isPerformingUpdates;
    self->_BOOL isPerformingUpdates = 1;
    [(PXUIWidgetHeaderView *)self _updateHasContentIfNeeded];
    [(PXUIWidgetHeaderView *)self _updateTitleIfNeeded];
    [(PXUIWidgetHeaderView *)self _updateSubtitleIfNeeded];
    [(PXUIWidgetHeaderView *)self _updateCaptionIfNeeded];
    self->_BOOL isPerformingUpdates = isPerformingUpdates;
    if ([(PXUIWidgetHeaderView *)self _needsUpdate])
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:self file:@"PXUIWidgetHeaderView.m" lineNumber:531 description:@"update still needed after update pass"];
    }
  }
}

- (void)performChanges:(id)a3
{
  id v4 = (void (**)(void))a3;
  BOOL isPerformingChanges = self->_isPerformingChanges;
  self->_BOOL isPerformingChanges = 1;
  uint64_t v6 = v4;
  if (v4)
  {
    v4[2](v4);
    id v4 = v6;
  }
  self->_BOOL isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
  {
    [(PXUIWidgetHeaderView *)self _updateIfNeeded];
    id v4 = v6;
  }
}

- (void)_handleCaptionButton:(id)a3
{
  if (self->_delegateRespondsTo.didSelectCaption)
  {
    id v4 = a3;
    id v5 = [(PXUIWidgetHeaderView *)self delegate];
    [v5 widgetHeaderView:self didSelectCaption:v4];
  }
}

- (void)_handleSubtitleButton:(id)a3
{
  if (self->_delegateRespondsTo.didSelectSubtitle)
  {
    id v4 = a3;
    id v5 = [(PXUIWidgetHeaderView *)self delegate];
    [v5 widgetHeaderView:self didSelectSubtitle:v4];
  }
}

- (BOOL)_canComposeTitleWithSubtitle
{
  if ([(PXUIWidgetHeaderView *)self layoutStyle] == 2)
  {
    BOOL v3 = [(PXUIWidgetHeaderView *)self _hasSubtitle];
    if (v3) {
      LOBYTE(v3) = ![(PXUIWidgetHeaderView *)self allowUserInteractionWithSubtitle];
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_hasSubtitle
{
  id v2 = [(PXUIWidgetHeaderView *)self subtitle];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (void)_setConstraints:(id)a3
{
  uint64_t v8 = (NSArray *)a3;
  id v4 = self->__constraints;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      if (self->__constraints) {
        objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
      }
      uint64_t v6 = (NSArray *)[(NSArray *)v8 copy];
      constraints = self->__constraints;
      self->__constraints = v6;

      if (self->__constraints) {
        objc_msgSend(MEMORY[0x1E4F28DC8], "activateConstraints:");
      }
    }
  }
}

- (void)_setHasContent:(BOOL)a3
{
  if (self->__hasContent != a3)
  {
    self->__hasContent = a3;
    [(PXUIWidgetHeaderView *)self setNeedsLayout];
  }
}

- (id)_captionButtonCreateIfNeeded:(BOOL)a3
{
  captionButton = self->__captionButton;
  if (!captionButton)
  {
    char v5 = +[PXUIButton buttonWithType:1];
    uint64_t v6 = self->__captionButton;
    self->__captionButton = v5;

    [(UIButton *)self->__captionButton addTarget:self action:sel__handleCaptionButton_ forControlEvents:0x2000];
    [(PXUIWidgetHeaderView *)self addSubview:self->__captionButton];
    captionButton = self->__captionButton;
  }
  return captionButton;
}

- (id)_captionLabelCreateIfNeeded:(BOOL)a3
{
  captionLabel = self->__captionLabel;
  if (captionLabel) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    uint64_t v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    BOOL v7 = self->__captionLabel;
    self->__captionLabel = v6;

    [(PXUIWidgetHeaderView *)self addSubview:self->__captionLabel];
    captionLabel = self->__captionLabel;
  }
  return captionLabel;
}

- (id)_subtitleButtonCreateIfNeeded:(BOOL)a3
{
  subtitleButton = self->__subtitleButton;
  if (subtitleButton) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    uint64_t v6 = +[PXUIButton buttonWithType:1];
    BOOL v7 = self->__subtitleButton;
    self->__subtitleButton = v6;

    [(UIButton *)self->__subtitleButton addTarget:self action:sel__handleSubtitleButton_ forControlEvents:0x2000];
    [(PXUIWidgetHeaderView *)self addSubview:self->__subtitleButton];
    subtitleButton = self->__subtitleButton;
  }
  return subtitleButton;
}

- (id)_subtitleLabelCreateIfNeeded:(BOOL)a3
{
  subtitleLabel = self->__subtitleLabel;
  if (subtitleLabel) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    uint64_t v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    BOOL v7 = self->__subtitleLabel;
    self->__subtitleLabel = v6;

    [(UILabel *)self->__subtitleLabel setNumberOfLines:0];
    visualEffectView = self->__visualEffectView;
    if (visualEffectView)
    {
      BOOL v9 = [(UIVisualEffectView *)visualEffectView contentView];
    }
    else
    {
      BOOL v9 = self;
    }
    BOOL v10 = v9;
    [(PXUIWidgetHeaderView *)v9 addSubview:self->__subtitleLabel];

    subtitleLabel = self->__subtitleLabel;
  }
  return subtitleLabel;
}

- (id)_titleLabelCreateIfNeeded:(BOOL)a3
{
  titleLabel = self->__titleLabel;
  if (titleLabel) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    uint64_t v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    BOOL v7 = self->__titleLabel;
    self->__titleLabel = v6;

    visualEffectView = self->__visualEffectView;
    if (visualEffectView)
    {
      BOOL v9 = [(UIVisualEffectView *)visualEffectView contentView];
    }
    else
    {
      BOOL v9 = self;
    }
    BOOL v10 = v9;
    [(PXUIWidgetHeaderView *)v9 addSubview:self->__titleLabel];

    titleLabel = self->__titleLabel;
  }
  return titleLabel;
}

- (id)_visualEffectViewCreateIfNeeded:(BOOL)a3
{
  visualEffectView = self->__visualEffectView;
  if (visualEffectView) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4FB14C8] effectWithStyle:4];
    BOOL v7 = [MEMORY[0x1E4FB1EA0] effectForBlurEffect:v6];
    uint64_t v8 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v7];
    BOOL v9 = self->__visualEffectView;
    self->__visualEffectView = v8;

    [(PXUIWidgetHeaderView *)self addSubview:self->__visualEffectView];
    visualEffectView = self->__visualEffectView;
  }
  return visualEffectView;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(PXUIWidgetHeaderView *)self layoutIfNeeded];
  [(PXUIWidgetHeaderView *)self _currentHeight];
  double v6 = v5;
  double v7 = width;
  result.height = v6;
  result.CGFloat width = v7;
  return result;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)PXUIWidgetHeaderView;
  [(PXUIWidgetHeaderView *)&v15 layoutSubviews];
  uint64_t v11 = 0;
  uint64_t v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  if ([(PXUIWidgetHeaderView *)self _hasContent])
  {
    int64_t v4 = [(PXUIWidgetHeaderView *)self layoutStyle];
    [(PXUIWidgetHeaderView *)self bounds];
    CGFloat x = v16.origin.x;
    CGFloat y = v16.origin.y;
    CGFloat width = v16.size.width;
    CGFloat height = v16.size.height;
    if (CGRectIsEmpty(v16))
    {
      BOOL v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v9 bounds];
      CGFloat width = CGRectGetWidth(v17);
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __38__PXUIWidgetHeaderView_layoutSubviews__block_invoke;
    v10[3] = &unk_1E5DCB4A8;
    *(CGFloat *)&v10[6] = x;
    *(CGFloat *)&v10[7] = y;
    *(CGFloat *)&v10[8] = width;
    *(CGFloat *)&v10[9] = height;
    v10[10] = v4;
    v10[11] = a2;
    v10[4] = self;
    v10[5] = &v11;
    +[PXViewLayoutHelper performLayoutWithinView:self usingBlock:v10];
  }
  [(PXUIWidgetHeaderView *)self _setCurrentHeight:v12[3]];
  _Block_object_dispose(&v11, 8);
}

void __38__PXUIWidgetHeaderView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) contentInsets];
  double v69 = v4;
  double v70 = v5;
  double v7 = v6;
  double v9 = v8;
  double MinX = CGRectGetMinX(*(CGRect *)(a1 + 48));
  double MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 48));
  double MinY = CGRectGetMinY(*(CGRect *)(a1 + 48));
  double v13 = CGRectGetMinY(*(CGRect *)(a1 + 48));
  [*(id *)(a1 + 32) minimumDistanceBetweenTopAndFirstBaseline];
  double v15 = v14;
  CGRect v16 = [*(id *)(a1 + 32) _visualEffectView];
  if (v16)
  {
    [*(id *)(a1 + 32) bounds];
    objc_msgSend(v16, "setFrame:");
  }
  double v17 = v7 + MinX;
  double v18 = MaxX - v9;
  double v19 = v13 + v15;
  id v20 = [*(id *)(a1 + 32) title];
  uint64_t v21 = [v20 length];

  if (v21)
  {
    id v22 = [*(id *)(a1 + 32) _titleLabel];
    if (v22)
    {
      int64x2_t v23 = vdupq_n_s64(0x7FF8000000000000uLL);
      v78.i64[1] = v23.i64[1];
      int64x2_t v79 = v23;
      int64x2_t v80 = v23;
      v81.i64[1] = v23.i64[1];
      uint64_t v83 = v23.i64[0];
      int64x2_t v85 = v23;
      *(double *)v78.i64 = v17;
      double v84 = v18;
      *(double *)v81.i64 = v13 + v15;
      int64x2_t v82 = vdupq_n_s64(0x7FF0000000000000uLL);
      [v3 layoutView:v22 withAttributes:&v78];
      [v3 lastBaselineOfView:v22];
      double v19 = v24;
      [v3 bottomOfView:v22];
      double MinY = v25;
    }
  }
  else
  {
    id v22 = 0;
  }
  v26 = [*(id *)(a1 + 32) caption];
  uint64_t v27 = [v26 length];

  if (v27)
  {
    char v28 = [*(id *)(a1 + 32) allowUserInteractionWithCaption];
    v29 = *(void **)(a1 + 32);
    if (v28) {
      [v29 _captionButton];
    }
    else {
    v30 = [v29 _captionLabel];
    }
    if (v30 && ([*(id *)(a1 + 32) _hasAccessibilityLargeText] & 1) == 0)
    {
      double MidX = CGRectGetMidX(*(CGRect *)(a1 + 48));
      if (v22)
      {
        [v3 trailingOfView:v22];
        if (MidX >= v32) {
          double MidX = v32;
        }
      }
      int64x2_t v78 = vdupq_n_s64(0x7FF8000000000000uLL);
      v79.i64[1] = v78.i64[1];
      int64x2_t v80 = v78;
      v81.i64[1] = v78.i64[1];
      double v84 = *(double *)&v78.i64[1];
      int64x2_t v85 = v78;
      uint64_t v83 = *(void *)&MidX;
      *(double *)v79.i64 = v18;
      *(double *)v81.i64 = v19;
      int64x2_t v82 = vdupq_n_s64(0x7FF0000000000000uLL);
      objc_msgSend(v3, "layoutView:withAttributes:", v30, &v78, *(_OWORD *)&v82, *(_OWORD *)&v78);
      [v3 leadingOfView:v30];
      double v18 = v33;
      if (v22)
      {
        v71.i64[1] = v68.i64[1];
        int64x2_t v72 = v68;
        int64x2_t v73 = v68;
        int64x2_t v74 = v68;
        v76.i64[0] = v68.i64[0];
        int64x2_t v77 = v68;
        v71.i64[0] = 0xFFF0000000000000;
        *(double *)&v76.i64[1] = v33;
        int64x2_t v75 = v67;
        [v3 layoutView:v22 withAttributes:&v71];
      }
      else
      {
        [v3 bottomOfView:v30];
        double MinY = v34;
      }
    }
  }
  else
  {
    v30 = 0;
  }
  v35 = [*(id *)(a1 + 32) title];
  uint64_t v36 = [v35 length];

  if (v36)
  {
    [*(id *)(a1 + 32) distanceBetweenTitleBaselineAndSubtitleBaseline];
    double v38 = v37;
    if (v37 <= 0.0)
    {
      v39 = [*(id *)(a1 + 32) secondaryFont];
      [v39 lineHeight];
      double v38 = v40;
    }
  }
  else
  {
    double v38 = 0.0;
  }
  v41 = [*(id *)(a1 + 32) subtitle];
  uint64_t v42 = [v41 length];

  if (!v42)
  {
    v45 = 0;
    goto LABEL_46;
  }
  char v43 = [*(id *)(a1 + 32) allowUserInteractionWithSubtitle];
  v44 = *(void **)(a1 + 32);
  if (v43) {
    [v44 _subtitleButton];
  }
  else {
  v45 = [v44 _subtitleLabel];
  }
  if (v45)
  {
    uint64_t v46 = *(void *)(a1 + 80);
    switch(v46)
    {
      case 1:
        int64x2_t v48 = vdupq_n_s64(0x7FF8000000000000uLL);
        v78.i64[1] = v48.i64[1];
        int64x2_t v79 = v48;
        int64x2_t v80 = v48;
        int64x2_t v81 = v48;
        uint64_t v83 = v48.i64[0];
        int64x2_t v85 = v48;
        *(double *)v78.i64 = v17;
        double v84 = v18;
        int64x2_t v82 = vdupq_n_s64(0x7FF0000000000000uLL);
        if (v22) {
          double v19 = v19 + v38;
        }
        else {
          *(double *)v85.i64 = v69 + CGRectGetMinY(*(CGRect *)(a1 + 48));
        }
        *(double *)v81.i64 = v19;
        [v3 layoutView:v45 withAttributes:&v78];
        [v3 lastBaselineOfView:v45];
        double v19 = v56;
        [v3 bottomOfView:v45];
        double MinY = v57;
        if (!v30 || ([*(id *)(a1 + 32) _hasAccessibilityLargeText] & 1) != 0) {
          goto LABEL_46;
        }
        int64x2_t v71 = vdupq_n_s64(0x7FF8000000000000uLL);
        int64x2_t v72 = v71;
        int64x2_t v73 = v71;
        v74.i64[1] = v71.i64[1];
        int64x2_t v75 = v71;
        int64x2_t v76 = v71;
        int64x2_t v77 = v71;
        *(double *)v74.i64 = v19;
        v53 = &v71;
        v54 = v3;
        v55 = v30;
        break;
      case 2:
        if (v22)
        {
          [v3 trailingOfView:v22];
          double v50 = v49;
          [*(id *)(a1 + 32) horizontalSpacingBetweenTitleAndSubtitle];
          double v17 = v50 + v51;
        }
        int64x2_t v52 = vdupq_n_s64(0x7FF8000000000000uLL);
        v78.i64[1] = v52.i64[1];
        int64x2_t v79 = v52;
        int64x2_t v80 = v52;
        int64x2_t v81 = v52;
        uint64_t v83 = v52.i64[0];
        int64x2_t v85 = v52;
        *(double *)v78.i64 = v17;
        double v84 = v18;
        int64x2_t v82 = vdupq_n_s64(0x7FF0000000000000uLL);
        if (!v22) {
          *(double *)v85.i64 = v69 + CGRectGetMinY(*(CGRect *)(a1 + 48));
        }
        *(double *)v81.i64 = v19;
        v53 = &v78;
        v54 = v3;
        v55 = v45;
        break;
      case 0:
        v47 = [MEMORY[0x1E4F28B00] currentHandler];
        [v47 handleFailureInMethod:*(void *)(a1 + 88) object:*(void *)(a1 + 32) file:@"PXUIWidgetHeaderView.m" lineNumber:307 description:@"Code which should be unreachable has been reached"];

        abort();
      default:
        goto LABEL_46;
    }
    [v54 layoutView:v55 withAttributes:v53];
  }
LABEL_46:
  int v58 = [*(id *)(a1 + 32) _hasAccessibilityLargeText];
  if (v30 && v58)
  {
    if (v38 <= 0.0)
    {
      v59 = [*(id *)(a1 + 32) secondaryFont];
      [v59 lineHeight];
      double v38 = v60;
    }
    int64x2_t v61 = vdupq_n_s64(0x7FF8000000000000uLL);
    v78.i64[1] = v61.i64[1];
    int64x2_t v79 = v61;
    int64x2_t v80 = v61;
    v81.i64[1] = v61.i64[1];
    uint64_t v83 = v61.i64[0];
    int64x2_t v85 = v61;
    *(double *)v78.i64 = v17;
    double v84 = v18;
    *(double *)v81.i64 = v19 + v38;
    int64x2_t v82 = vdupq_n_s64(0x7FF0000000000000uLL);
    [v3 layoutView:v30 withAttributes:&v78];
    [v3 lastBaselineOfView:v30];
    double v19 = v62;
    [v3 bottomOfView:v30];
    double MinY = v63;
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v70 + MinY;
  double v64 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  [*(id *)(a1 + 32) minimumDistanceBetweenLastBaselineAndBottom];
  double v66 = v19 + v65;
  if (v64 >= v66) {
    double v66 = v64;
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v66;
}

- (BOOL)_hasAccessibilityLargeText
{
  id v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3) {
    return 0;
  }
  double v5 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v5);

  return IsAccessibilityCategory;
}

- (void)setMinimumDistanceBetweenLastBaselineAndBottom:(double)a3
{
  if (self->_minimumDistanceBetweenLastBaselineAndBottom != a3)
  {
    self->_minimumDistanceBetweenLastBaselineAndBottom = a3;
    [(PXUIWidgetHeaderView *)self setNeedsLayout];
  }
}

- (void)setHorizontalSpacingBetweenTitleAndSubtitle:(double)a3
{
  if (self->_horizontalSpacingBetweenTitleAndSubtitle != a3)
  {
    self->_horizontalSpacingBetweenTitleAndSubtitle = a3;
    [(PXUIWidgetHeaderView *)self setNeedsLayout];
  }
}

- (void)setDistanceBetweenTitleBaselineAndSubtitleBaseline:(double)a3
{
  if (self->_distanceBetweenTitleBaselineAndSubtitleBaseline != a3)
  {
    self->_distanceBetweenTitleBaselineAndSubtitleBaseline = a3;
    [(PXUIWidgetHeaderView *)self setNeedsLayout];
  }
}

- (void)setMinimumDistanceBetweenTopAndFirstBaseline:(double)a3
{
  if (self->_minimumDistanceBetweenTopAndFirstBaseline != a3)
  {
    self->_minimumDistanceBetweenTopAndFirstBaseline = a3;
    [(PXUIWidgetHeaderView *)self setNeedsLayout];
  }
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInsets.left
    || a3.top != self->_contentInsets.top
    || a3.right != self->_contentInsets.right
    || a3.bottom != self->_contentInsets.bottom)
  {
    self->_contentInsets = a3;
    [(PXUIWidgetHeaderView *)self setNeedsLayout];
  }
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    [(PXUIWidgetHeaderView *)self setNeedsLayout];
  }
}

- (void)setAllowUserInteractionWithCaption:(BOOL)a3
{
  if (self->_allowUserInteractionWithCaption != a3)
  {
    self->_allowUserInteractionWithCaption = a3;
    [(PXUIWidgetHeaderView *)self setNeedsLayout];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __59__PXUIWidgetHeaderView_setAllowUserInteractionWithCaption___block_invoke;
    v4[3] = &unk_1E5DD36F8;
    v4[4] = self;
    [(PXUIWidgetHeaderView *)self performChanges:v4];
  }
}

uint64_t __59__PXUIWidgetHeaderView_setAllowUserInteractionWithCaption___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateCaption];
}

- (void)setAllowUserInteractionWithSubtitle:(BOOL)a3
{
  if (self->_allowUserInteractionWithSubtitle != a3)
  {
    self->_allowUserInteractionWithSubtitle = a3;
    [(PXUIWidgetHeaderView *)self setNeedsLayout];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __60__PXUIWidgetHeaderView_setAllowUserInteractionWithSubtitle___block_invoke;
    v4[3] = &unk_1E5DD36F8;
    v4[4] = self;
    [(PXUIWidgetHeaderView *)self performChanges:v4];
  }
}

uint64_t __60__PXUIWidgetHeaderView_setAllowUserInteractionWithSubtitle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateSubtitle];
}

- (void)setTextColor:(id)a3
{
  double v5 = (UIColor *)a3;
  double v6 = self->_textColor;
  if (v6 == v5)
  {
  }
  else
  {
    double v7 = v6;
    char v8 = [(UIColor *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_textColor, a3);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __37__PXUIWidgetHeaderView_setTextColor___block_invoke;
      v9[3] = &unk_1E5DD36F8;
      v9[4] = self;
      [(PXUIWidgetHeaderView *)self performChanges:v9];
    }
  }
}

uint64_t __37__PXUIWidgetHeaderView_setTextColor___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateTitle];
  [*(id *)(a1 + 32) _invalidateSubtitle];
  id v2 = *(void **)(a1 + 32);
  return [v2 _invalidateCaption];
}

- (void)setSecondaryFont:(id)a3
{
  double v5 = (UIFont *)a3;
  double v6 = self->_secondaryFont;
  if (v6 == v5)
  {
  }
  else
  {
    double v7 = v6;
    char v8 = [(UIFont *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_secondaryFont, a3);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __41__PXUIWidgetHeaderView_setSecondaryFont___block_invoke;
      v9[3] = &unk_1E5DD36F8;
      v9[4] = self;
      [(PXUIWidgetHeaderView *)self performChanges:v9];
    }
  }
}

uint64_t __41__PXUIWidgetHeaderView_setSecondaryFont___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateSubtitle];
  id v2 = *(void **)(a1 + 32);
  return [v2 _invalidateCaption];
}

- (void)setPrimaryFont:(id)a3
{
  double v5 = (UIFont *)a3;
  double v6 = self->_primaryFont;
  if (v6 == v5)
  {
  }
  else
  {
    double v7 = v6;
    char v8 = [(UIFont *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_primaryFont, a3);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __39__PXUIWidgetHeaderView_setPrimaryFont___block_invoke;
      v9[3] = &unk_1E5DD36F8;
      v9[4] = self;
      [(PXUIWidgetHeaderView *)self performChanges:v9];
    }
  }
}

uint64_t __39__PXUIWidgetHeaderView_setPrimaryFont___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateTitle];
}

- (void)setCaption:(id)a3
{
  double v4 = (NSString *)a3;
  double v5 = self->_caption;
  if (v5 == v4)
  {
  }
  else
  {
    double v6 = v5;
    char v7 = [(NSString *)v4 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      char v8 = (NSString *)[(NSString *)v4 copy];
      caption = self->_caption;
      self->_caption = v8;

      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __35__PXUIWidgetHeaderView_setCaption___block_invoke;
      v10[3] = &unk_1E5DD36F8;
      v10[4] = self;
      [(PXUIWidgetHeaderView *)self performChanges:v10];
    }
  }
}

uint64_t __35__PXUIWidgetHeaderView_setCaption___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateHasContent];
  id v2 = *(void **)(a1 + 32);
  return [v2 _invalidateCaption];
}

- (void)setSubtitle:(id)a3
{
  double v4 = (NSString *)a3;
  double v5 = self->_subtitle;
  if (v5 == v4)
  {
  }
  else
  {
    double v6 = v5;
    char v7 = [(NSString *)v4 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      BOOL v8 = [(PXUIWidgetHeaderView *)self _hasSubtitle];
      double v9 = (NSString *)[(NSString *)v4 copy];
      subtitle = self->_subtitle;
      self->_subtitle = v9;

      if (v8 != [(PXUIWidgetHeaderView *)self _hasSubtitle]) {
        [(PXUIWidgetHeaderView *)self setNeedsLayout];
      }
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __36__PXUIWidgetHeaderView_setSubtitle___block_invoke;
      v11[3] = &unk_1E5DD36F8;
      v11[4] = self;
      [(PXUIWidgetHeaderView *)self performChanges:v11];
    }
  }
}

uint64_t __36__PXUIWidgetHeaderView_setSubtitle___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateHasContent];
  id v2 = *(void **)(a1 + 32);
  return [v2 _invalidateSubtitle];
}

- (void)setTitle:(id)a3
{
  double v4 = (NSString *)a3;
  double v5 = self->_title;
  if (v5 == v4)
  {
  }
  else
  {
    double v6 = v5;
    char v7 = [(NSString *)v4 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      BOOL v8 = (NSString *)[(NSString *)v4 copy];
      title = self->_title;
      self->_title = v8;

      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __33__PXUIWidgetHeaderView_setTitle___block_invoke;
      v10[3] = &unk_1E5DD36F8;
      v10[4] = self;
      [(PXUIWidgetHeaderView *)self performChanges:v10];
    }
  }
}

uint64_t __33__PXUIWidgetHeaderView_setTitle___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateHasContent];
  id v2 = *(void **)(a1 + 32);
  return [v2 _invalidateTitle];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->didSelectSubtitle = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->didSelectCaption = objc_opt_respondsToSelector() & 1;
  }
}

@end