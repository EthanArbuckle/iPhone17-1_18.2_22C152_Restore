@interface PXPhotosSectionHeaderView
+ (BOOL)_hasAccessibilityLargeText;
+ (BOOL)shouldUseAccessibilityLargeTextLayoutWithTraitCollecton:(id)a3;
+ (BOOL)shouldUsePhoneLayoutWithTraitCollection:(id)a3;
- (BOOL)_disableRasterizeInAnimations;
- (BOOL)_usingDateAsTitle;
- (BOOL)allowLocationTapForTouch:(id)a3;
- (BOOL)allowsPhotosDetailsInteraction;
- (BOOL)showsActionButton;
- (BOOL)useYearOnlyForDefaultTitle;
- (BOOL)wantsBackground;
- (CGRect)clippingRect;
- (NSArray)sectionLocations;
- (NSCopying)userData;
- (NSDate)sectionEndDate;
- (NSDate)sectionStartDate;
- (NSString)actionButtonTitle;
- (NSString)backdropViewGroupName;
- (NSString)sectionTitle;
- (NSString)synthesizedSectionTitle;
- (PXCuratedLibrarySectionHeaderLayoutSpec)buttonSpec;
- (PXPhotosSectionHeaderView)initWithFrame:(CGRect)a3;
- (PXPhotosSectionHeaderViewDelegate)delegate;
- (UIEdgeInsets)contentInsets;
- (UIEdgeInsets)highlightInsets;
- (UIImage)backgroundImage;
- (double)backgroundImageAlpha;
- (double)backgroundImageOverhang;
- (double)baselineToBottomSpacing;
- (id)_dateRangeCompactFormatter;
- (id)_dateRangeLongFormatter;
- (id)_dateRangeYearFormatter;
- (int64_t)sectionIndex;
- (int64_t)style;
- (unint64_t)backgroundStyle;
- (void)_contentSizeCategoryDidChangeNotification:(id)a3;
- (void)_handleActionButton:(id)a3;
- (void)_hideHighlightView;
- (void)_layoutSubviewsForCurentStyle;
- (void)_setHighlightViewVisible:(BOOL)a3;
- (void)_updateActionButton;
- (void)_updateBackdropViewGroupName;
- (void)_updateBackgroundAnimated:(BOOL)a3;
- (void)_updateDateDependentLabels;
- (void)_updateDateLabel;
- (void)_updateDisclosureIcon;
- (void)_updateHighlightView;
- (void)_updateLabelsForTextStyle;
- (void)_updateLocationsLabelVisibility;
- (void)_updateTitleLabel;
- (void)applyLayoutAttributes:(id)a3;
- (void)didEndDisplaying;
- (void)didTransitionFromLayout:(id)a3 toLayout:(id)a4;
- (void)layoutSubviews;
- (void)performBatchUpdateOfDateDependentPropertiesWithBlock:(id)a3;
- (void)prepareForReuse;
- (void)setActionButtonTitle:(id)a3;
- (void)setAllowsPhotosDetailsInteraction:(BOOL)a3;
- (void)setBackdropViewGroupName:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setBackgroundImageAlpha:(double)a3;
- (void)setBackgroundImageOverhang:(double)a3;
- (void)setBackgroundStyle:(unint64_t)a3;
- (void)setButtonSpec:(id)a3;
- (void)setClippingRect:(CGRect)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlightInsets:(UIEdgeInsets)a3;
- (void)setSectionIndex:(int64_t)a3;
- (void)setSectionLocations:(id)a3;
- (void)setSectionStartDate:(id)a3 endDate:(id)a4;
- (void)setSectionTitle:(id)a3;
- (void)setShowsActionButton:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setUseYearOnlyForDefaultTitle:(BOOL)a3;
- (void)setUserData:(id)a3;
- (void)setWantsBackground:(BOOL)a3;
- (void)setWantsBackground:(BOOL)a3 animated:(BOOL)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)willTransitionFromLayout:(id)a3 toLayout:(id)a4;
@end

@implementation PXPhotosSectionHeaderView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonSpec, 0);
  objc_storeStrong((id *)&self->_actionButtonTitle, 0);
  objc_storeStrong((id *)&self->_sectionEndDate, 0);
  objc_storeStrong((id *)&self->_sectionStartDate, 0);
  objc_storeStrong((id *)&self->_sectionLocations, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backdropViewGroupName, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_disclosureIconView, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_separatorLabel, 0);
  objc_storeStrong((id *)&self->_locationsLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (BOOL)allowsPhotosDetailsInteraction
{
  return self->_allowsPhotosDetailsInteraction;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)buttonSpec
{
  return self->_buttonSpec;
}

- (NSString)actionButtonTitle
{
  return self->_actionButtonTitle;
}

- (BOOL)showsActionButton
{
  return self->_showsActionButton;
}

- (NSDate)sectionEndDate
{
  return self->_sectionEndDate;
}

- (NSDate)sectionStartDate
{
  return self->_sectionStartDate;
}

- (NSArray)sectionLocations
{
  return self->_sectionLocations;
}

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (UIEdgeInsets)highlightInsets
{
  double top = self->_highlightInsets.top;
  double left = self->_highlightInsets.left;
  double bottom = self->_highlightInsets.bottom;
  double right = self->_highlightInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
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

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndex = a3;
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (double)backgroundImageAlpha
{
  return self->_backgroundImageAlpha;
}

- (double)backgroundImageOverhang
{
  return self->_backgroundImageOverhang;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (BOOL)wantsBackground
{
  return self->_wantsBackground;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setDelegate:(id)a3
{
}

- (PXPhotosSectionHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotosSectionHeaderViewDelegate *)WeakRetained;
}

- (NSString)backdropViewGroupName
{
  return self->_backdropViewGroupName;
}

- (void)_hideHighlightView
{
}

- (void)_updateHighlightView
{
  BOOL highlightViewVisible = self->_highlightViewVisible;
  highlightView = self->_highlightView;
  if (highlightViewVisible)
  {
    if (highlightView) {
      goto LABEL_10;
    }
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v6 = self->_highlightView;
    self->_highlightView = v5;

    v7 = self->_highlightView;
    if (self->_visualEffectView)
    {
      -[PXPhotosSectionHeaderView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v7);
    }
    else
    {
      [(PXPhotosSectionHeaderView *)self addSubview:v7];
      [(PXPhotosSectionHeaderView *)self sendSubviewToBack:self->_highlightView];
    }
    [(UIView *)self->_highlightView setAutoresizingMask:18];
    v9 = self->_highlightView;
    v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.150000006];
    [(UIView *)v9 setBackgroundColor:v8];
  }
  else
  {
    if (!highlightView) {
      goto LABEL_10;
    }
    [(UIView *)highlightView removeFromSuperview];
    v8 = self->_highlightView;
    self->_highlightView = 0;
  }

LABEL_10:
  [(PXPhotosSectionHeaderView *)self setNeedsLayout];
}

- (void)_setHighlightViewVisible:(BOOL)a3
{
  if (self->_highlightViewVisible != a3)
  {
    self->_BOOL highlightViewVisible = a3;
    [(PXPhotosSectionHeaderView *)self _updateHighlightView];
  }
}

- (BOOL)allowLocationTapForTouch:(id)a3
{
  id v4 = a3;
  if ([(PXPhotosSectionHeaderView *)self allowsPhotosDetailsInteraction]
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        char v6 = objc_opt_respondsToSelector(),
        WeakRetained,
        (v6 & 1) != 0))
  {
    if (([(PXCuratedLibraryOverlayButton *)self->_actionButton isHidden] & 1) != 0
      || ([(PXCuratedLibraryOverlayButton *)self->_actionButton frame], CGRectIsEmpty(v20))
      || ([(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory],
          v7 = (NSString *)objc_claimAutoreleasedReturnValue(),
          BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7),
          v7,
          IsAccessibilityCategory))
    {
      BOOL v9 = 1;
    }
    else
    {
      int v11 = [(PXPhotosSectionHeaderView *)self _shouldReverseLayoutDirection];
      [(PXCuratedLibraryOverlayButton *)self->_actionButton frame];
      if (v11)
      {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v12);
        double v17 = 16.0;
      }
      else
      {
        double MaxX = CGRectGetMinX(*(CGRect *)&v12);
        double v17 = -16.0;
      }
      double v18 = MaxX + v17;
      [v4 locationInView:self];
      if (v11) {
        BOOL v9 = v19 >= v18;
      }
      else {
        BOOL v9 = v19 <= v18;
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderView;
  [(PXPhotosSectionHeaderView *)&v3 prepareForReuse];
  if (self->_visualEffectView) {
    [(PXPhotosSectionHeaderView *)self _updateBackdropViewGroupName];
  }
  self->_useYearOnlyForDefaultTitle = 0;
}

- (void)didEndDisplaying
{
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (void)_layoutSubviewsForCurentStyle
{
  locationsLabel = self->_locationsLabel;
  if (locationsLabel && ([(UILabel *)locationsLabel isHidden] & 1) == 0) {
    [(NSArray *)self->_sectionLocations count];
  }
  actionButton = self->_actionButton;
  if (actionButton) {
    [(PXCuratedLibraryOverlayButton *)actionButton isHidden];
  }
  disclosureIconView = self->_disclosureIconView;
  if (disclosureIconView) {
    [(UIImageView *)disclosureIconView isHidden];
  }
  dateLabel = self->_dateLabel;
  if (dateLabel) {
    [(UILabel *)dateLabel isHidden];
  }
  [(id)objc_opt_class() _hasAccessibilityLargeText];
  [(PXPhotosSectionHeaderView *)self _updateLabelsForTextStyle];
  int64_t v7 = [(PXPhotosSectionHeaderView *)self style];
  [(PXPhotosSectionHeaderView *)self contentInsets];
  [(PXPhotosSectionHeaderView *)self safeAreaInsets];
  UIEdgeInsetsMax();
  [(PXPhotosSectionHeaderView *)self bounds];
  v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v8 scale];

  [(PXPhotosSectionHeaderView *)self bounds];
  [(PXPhotosSectionHeaderView *)self bounds];
  [(PXPhotosSectionHeaderView *)self backgroundImageOverhang];
  int v11 = [(UILabel *)self->_titleLabel font];
  BOOL v9 = self->_dateLabel;
  if (!v9) {
    BOOL v9 = self->_locationsLabel;
  }
  [(UILabel *)v9 font];
  objc_claimAutoreleasedReturnValue();
  double v10 = 26.0;
  if (v7 == 1) {
    double v10 = 30.0;
  }
  [v11 _scaledValueForValue:v10];
  PXFloatRoundToPixel();
}

uint64_t __58__PXPhotosSectionHeaderView__layoutSubviewsForCurentStyle__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 496) setText:a2];
  objc_super v3 = *(void **)(*(void *)(a1 + 32) + 496);
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  return objc_msgSend(v3, "sizeThatFits:", v4, v5);
}

- (void)layoutSubviews
{
  [(PXPhotosSectionHeaderView *)self _layoutSubviewsForCurentStyle];
  if (self->_highlightView)
  {
    [(PXPhotosSectionHeaderView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    visualEffectView = self->_visualEffectView;
    if (!visualEffectView || [(UIVisualEffectView *)visualEffectView isHidden])
    {
      [(PXPhotosSectionHeaderView *)self highlightInsets];
      double v4 = v4 + v12;
      double v6 = v6 + v13;
      double v8 = v8 - (v12 + v14);
      double v10 = v10 - (v13 + v15);
    }
    highlightView = self->_highlightView;
    -[UIView setFrame:](highlightView, "setFrame:", v4, v6, v8, v10);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v13 = a3;
  double v5 = [v13 anyObject];
  [v5 locationInView:self];
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  [(PXPhotosSectionHeaderView *)self bounds];
  v15.x = v7;
  v15.y = v9;
  if (CGRectContainsPoint(v16, v15)
    && ([v13 anyObject],
        double v10 = objc_claimAutoreleasedReturnValue(),
        BOOL v11 = [(PXPhotosSectionHeaderView *)self allowLocationTapForTouch:v10],
        v10,
        v11))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained didTapHeaderView:self];

    [(PXPhotosSectionHeaderView *)self performSelector:sel__hideHighlightView withObject:0 afterDelay:1.0];
  }
  else
  {
    [(PXPhotosSectionHeaderView *)self _hideHighlightView];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  double v5 = [a3 anyObject];
  BOOL v6 = [(PXPhotosSectionHeaderView *)self allowLocationTapForTouch:v5];

  if (v6)
  {
    [(PXPhotosSectionHeaderView *)self _setHighlightViewVisible:1];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXPhotosSectionHeaderView;
  id v4 = a3;
  [(PXPhotosSectionHeaderView *)&v8 traitCollectionDidChange:v4];
  uint64_t v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  BOOL v6 = [(PXPhotosSectionHeaderView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7 && [(PXPhotosSectionHeaderView *)self style] != -1)
  {
    [(PXPhotosSectionHeaderView *)self _updateDisclosureIcon];
    [(PXPhotosSectionHeaderView *)self _updateLocationsLabelVisibility];
    [(PXPhotosSectionHeaderView *)self _updateDateLabel];
    [(PXPhotosSectionHeaderView *)self _updateActionButton];
  }
}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  int64_t v4 = [(PXPhotosSectionHeaderView *)self style];
  _PXPhotoCollectionHeaderTitleLabelFontForStyle(v4);
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = _PXPhotoCollectionHeaderSubtitleFontForStyle(v4);
  titleLabel = self->_titleLabel;
  if (titleLabel
    && ([(UILabel *)titleLabel font],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqual:v25],
        v7,
        (v8 & 1) == 0))
  {
    [(UILabel *)self->_titleLabel setFont:v25];
    int v9 = 1;
  }
  else
  {
    int v9 = 0;
  }
  dateLabel = self->_dateLabel;
  if (dateLabel)
  {
    BOOL v11 = [(UILabel *)dateLabel font];
    char v12 = [v11 isEqual:v5];

    if ((v12 & 1) == 0)
    {
      [(UILabel *)self->_dateLabel setFont:v5];
      int v9 = 1;
    }
  }
  locationsLabel = self->_locationsLabel;
  if (locationsLabel)
  {
    double v14 = [(UILabel *)locationsLabel font];
    char v15 = [v14 isEqual:v5];

    if ((v15 & 1) == 0)
    {
      [(UILabel *)self->_locationsLabel setFont:v5];
      int v9 = 1;
    }
  }
  separatorLabel = self->_separatorLabel;
  if (separatorLabel)
  {
    double v17 = [(UILabel *)separatorLabel font];
    char v18 = [v17 isEqual:v5];

    if ((v18 & 1) == 0)
    {
      [(UILabel *)self->_separatorLabel setFont:v5];
      int v9 = 1;
    }
  }
  if (!self->_actionButton)
  {
    p_disclosureIconView = &self->_disclosureIconView;
    disclosureIconView = self->_disclosureIconView;
    if (!disclosureIconView)
    {
      if (!v9) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  [(PXPhotosSectionHeaderView *)self _updateActionButton];
  p_disclosureIconView = &self->_disclosureIconView;
  disclosureIconView = self->_disclosureIconView;
  if (disclosureIconView)
  {
LABEL_18:
    [(UIImageView *)disclosureIconView removeFromSuperview];
    v21 = *p_disclosureIconView;
    *p_disclosureIconView = 0;

    [(PXPhotosSectionHeaderView *)self _updateDisclosureIcon];
  }
LABEL_19:
  [(PXPhotosSectionHeaderView *)self setNeedsLayout];
  v22 = [(PXPhotosSectionHeaderView *)self delegate];
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    v24 = [(PXPhotosSectionHeaderView *)self delegate];
    [v24 textSizeDidChangeForHeaderView:self];
  }
LABEL_21:
}

- (id)_dateRangeYearFormatter
{
  double v3 = (void *)_dateRangeYearFormatter_yearDateFormatter;
  if (!_dateRangeYearFormatter_yearDateFormatter)
  {
    uint64_t v4 = [MEMORY[0x1E4F8A798] autoupdatingFormatterWithPreset:4];
    uint64_t v5 = (void *)_dateRangeYearFormatter_yearDateFormatter;
    _dateRangeYearFormatter_yearDateFormatter = v4;

    BOOL v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel__dateRangeFormatterChanged_ name:*MEMORY[0x1E4F8AD80] object:_dateRangeYearFormatter_yearDateFormatter];

    double v3 = (void *)_dateRangeYearFormatter_yearDateFormatter;
  }
  return v3;
}

- (id)_dateRangeLongFormatter
{
  double v3 = (void *)_dateRangeLongFormatter_dateRangeFormatter;
  if (!_dateRangeLongFormatter_dateRangeFormatter)
  {
    uint64_t v4 = [MEMORY[0x1E4F8A798] autoupdatingFormatterWithPreset:2];
    uint64_t v5 = (void *)_dateRangeLongFormatter_dateRangeFormatter;
    _dateRangeLongFormatter_dateRangeFormatter = v4;

    BOOL v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel__dateRangeFormatterChanged_ name:*MEMORY[0x1E4F8AD80] object:_dateRangeLongFormatter_dateRangeFormatter];

    double v3 = (void *)_dateRangeLongFormatter_dateRangeFormatter;
  }
  return v3;
}

- (id)_dateRangeCompactFormatter
{
  double v3 = (void *)_dateRangeCompactFormatter_dateRangeFormatter;
  if (!_dateRangeCompactFormatter_dateRangeFormatter)
  {
    uint64_t v4 = [MEMORY[0x1E4F8A798] autoupdatingFormatterWithPreset:0];
    uint64_t v5 = (void *)_dateRangeCompactFormatter_dateRangeFormatter;
    _dateRangeCompactFormatter_dateRangeFormatter = v4;

    BOOL v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel__dateRangeFormatterChanged_ name:*MEMORY[0x1E4F8AD80] object:_dateRangeCompactFormatter_dateRangeFormatter];

    double v3 = (void *)_dateRangeCompactFormatter_dateRangeFormatter;
  }
  return v3;
}

- (void)_updateBackdropViewGroupName
{
  if (self->_inLayoutTransition || ![(PXPhotosSectionHeaderView *)self wantsBackground])
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(PXPhotosSectionHeaderView *)self backdropViewGroupName];
  }
  id v4 = (id)v3;
  [(UIVisualEffectView *)self->_visualEffectView _setGroupName:v3];
}

- (void)_updateBackgroundAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXPhotosSectionHeaderView *)self backgroundStyle]) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = [(PXPhotosSectionHeaderView *)self wantsBackground];
  }
  if ([(PXPhotosSectionHeaderView *)self backgroundStyle] == 1)
  {
    BOOL v6 = [(PXPhotosSectionHeaderView *)self backgroundImage];
    if (v6) {
      BOOL v7 = [(PXPhotosSectionHeaderView *)self wantsBackground];
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  uint64_t v8 = 544;
  visualEffectView = self->_visualEffectView;
  if (v5)
  {
    if (!visualEffectView)
    {
      double v10 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
      BOOL v11 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v10];
      char v12 = self->_visualEffectView;
      self->_visualEffectView = v11;

      visualEffectView = self->_visualEffectView;
    }
    id v13 = [(UIVisualEffectView *)visualEffectView superview];

    if (v13 != self)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __55__PXPhotosSectionHeaderView__updateBackgroundAnimated___block_invoke;
      v25[3] = &unk_1E5DD36F8;
      v25[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v25];
    }
    [(UIVisualEffectView *)self->_visualEffectView setHidden:0];
    [(PXPhotosSectionHeaderView *)self _updateBackdropViewGroupName];
  }
  else
  {
    [(UIVisualEffectView *)visualEffectView setHidden:1];
  }
  backgroundImageView = self->_backgroundImageView;
  if (v7)
  {
    if (!backgroundImageView)
    {
      id v15 = objc_alloc(MEMORY[0x1E4FB1838]);
      CGRect v16 = (UIImageView *)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      double v17 = self->_backgroundImageView;
      self->_backgroundImageView = v16;

      backgroundImageView = self->_backgroundImageView;
    }
    char v18 = [(UIImageView *)backgroundImageView superview];

    if (v18 != self)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __55__PXPhotosSectionHeaderView__updateBackgroundAnimated___block_invoke_2;
      v24[3] = &unk_1E5DD36F8;
      v24[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v24];
    }
    [(UIImageView *)self->_backgroundImageView setHidden:0];
    double v19 = [(PXPhotosSectionHeaderView *)self backgroundImage];
    [(UIImageView *)self->_backgroundImageView setImage:v19];

    if (v3)
    {
      [(UIImageView *)self->_backgroundImageView setAlpha:0.0];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __55__PXPhotosSectionHeaderView__updateBackgroundAnimated___block_invoke_3;
      v23[3] = &unk_1E5DD36F8;
      v23[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v23 animations:0.3];
    }
    else
    {
      [(PXPhotosSectionHeaderView *)self backgroundImageAlpha];
      -[UIImageView setAlpha:](self->_backgroundImageView, "setAlpha:");
    }
  }
  else
  {
    [(UIImageView *)backgroundImageView setHidden:1];
  }
  unint64_t v20 = [(PXPhotosSectionHeaderView *)self backgroundStyle];
  switch(v20)
  {
    case 0uLL:
      goto LABEL_31;
    case 2uLL:
      [(UIVisualEffectView *)self->_visualEffectView removeFromSuperview];
      v21 = self->_visualEffectView;
      self->_visualEffectView = 0;

LABEL_31:
      uint64_t v8 = 552;
      goto LABEL_32;
    case 1uLL:
LABEL_32:
      [*(id *)((char *)&self->super.super.super.super.isa + v8) removeFromSuperview];
      v22 = *(Class *)((char *)&self->super.super.super.super.isa + v8);
      *(Class *)((char *)&self->super.super.super.super.isa + v8) = 0;

      break;
  }
}

uint64_t __55__PXPhotosSectionHeaderView__updateBackgroundAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 544)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[68];
  return [v2 sendSubviewToBack:v3];
}

uint64_t __55__PXPhotosSectionHeaderView__updateBackgroundAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 552)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[69];
  return [v2 sendSubviewToBack:v3];
}

uint64_t __55__PXPhotosSectionHeaderView__updateBackgroundAnimated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) backgroundImageAlpha];
  v2 = *(void **)(*(void *)(a1 + 32) + 552);
  return objc_msgSend(v2, "setAlpha:");
}

- (void)_updateActionButton
{
  if (!self->_showsActionButton)
  {
    [(PXCuratedLibraryOverlayButton *)self->_actionButton removeFromSuperview];
    actionButton = self->_actionButton;
    self->_actionButton = 0;
LABEL_15:

    goto LABEL_16;
  }
  if ([(PXPhotosSectionHeaderView *)self style] == -1)
  {
    double v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PXPhotosSectionHeaderView.m" lineNumber:617 description:@"Invalid header style."];
  }
  if (!self->_actionButton)
  {
    id v4 = objc_alloc_init(PXCuratedLibraryOverlayButton);
    BOOL v5 = self->_actionButton;
    self->_actionButton = v4;

    [(PXCuratedLibraryOverlayButton *)self->_actionButton addTarget:self action:sel__handleActionButton_ forControlEvents:64];
    [(PXPhotosSectionHeaderView *)self addSubview:self->_actionButton];
  }
  uint64_t v6 = [(PXPhotosSectionHeaderView *)self actionButtonTitle];
  if (v6)
  {
    BOOL v7 = (void *)v6;
    uint64_t v8 = [(PXPhotosSectionHeaderView *)self buttonSpec];

    if (v8)
    {
      int v9 = [(PXPhotosSectionHeaderView *)self actionButtonTitle];
      double v10 = [(PXPhotosSectionHeaderView *)self buttonSpec];
      actionButton = +[PXCuratedLibraryOverlayButtonConfiguration configurationWithTitle:v9 spec:v10];

      [actionButton setActionHandler:&__block_literal_global_117719];
      char v12 = [(PXPhotosSectionHeaderView *)self traitCollection];
      uint64_t v13 = [v12 userInterfaceStyle];

      if (([(PXPhotosSectionHeaderView *)self wantsBackground] || v13 == 2)
        && [(PXPhotosSectionHeaderView *)self backgroundStyle])
      {
        double v14 = [MEMORY[0x1E4FB1618] systemWhiteColor];
        uint64_t v15 = 0;
      }
      else
      {
        double v14 = [(PXPhotosSectionHeaderView *)self tintColor];
        uint64_t v15 = 14;
      }
      [actionButton setTintColor:v14];

      [actionButton setStyle:v15];
      CGRect v16 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
      [actionButton setBackgroundColor:v16];

      [(PXCuratedLibraryOverlayButton *)self->_actionButton setUserData:actionButton];
      goto LABEL_15;
    }
  }
LABEL_16:
  [(PXPhotosSectionHeaderView *)self setNeedsLayout];
}

- (void)_updateDateLabel
{
  if (self->_sectionStartDate && ![(PXPhotosSectionHeaderView *)self _usingDateAsTitle])
  {
    if ([(PXPhotosSectionHeaderView *)self style] == -1)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"PXPhotosSectionHeaderView.m" lineNumber:582 description:@"Invalid header style."];
    }
    if (!self->_dateLabel)
    {
      id v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      dateLabel = self->_dateLabel;
      self->_dateLabel = v4;

      if ([(PXPhotosSectionHeaderView *)self _shouldReverseLayoutDirection])uint64_t v6 = 0; {
      else
      }
        uint64_t v6 = 2;
      [(UILabel *)self->_dateLabel setTextAlignment:v6];
      [(UILabel *)self->_dateLabel setUserInteractionEnabled:0];
      _PXConfigurePhotoCollectionHeaderDateLabel(self->_dateLabel, [(PXPhotosSectionHeaderView *)self style]);
      [(PXPhotosSectionHeaderView *)self addSubview:self->_dateLabel];
    }
    BOOL v7 = [(PXPhotosSectionHeaderView *)self traitCollection];
    uint64_t v8 = [v7 userInterfaceStyle];

    if (([(PXPhotosSectionHeaderView *)self wantsBackground] || v8 == 2)
      && [(PXPhotosSectionHeaderView *)self backgroundStyle])
    {
      uint64_t v9 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4FB1618] systemGrayColor];
    }
    double v10 = (void *)v9;
    [(UILabel *)self->_dateLabel setTextColor:v9];

    BOOL v11 = [(PXPhotosSectionHeaderView *)self _dateRangeCompactFormatter];
    char v12 = [v11 stringFromDate:self->_sectionStartDate toDate:self->_sectionEndDate];

    [(UILabel *)self->_dateLabel setHidden:0];
    [(UILabel *)self->_dateLabel setText:v12];
  }
  else
  {
    [(UILabel *)self->_dateLabel setText:0];
    [(UILabel *)self->_dateLabel setHidden:1];
  }
  [(PXPhotosSectionHeaderView *)self setNeedsLayout];
}

- (void)_updateLocationsLabelVisibility
{
  NSUInteger v4 = [(NSArray *)self->_sectionLocations count];
  if (v4)
  {
    if ([(PXPhotosSectionHeaderView *)self style] == -1)
    {
      CGRect v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"PXPhotosSectionHeaderView.m" lineNumber:538 description:@"Invalid header style."];
    }
    p_locationsLabel = &self->_locationsLabel;
    if (!self->_locationsLabel)
    {
      uint64_t v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      BOOL v7 = *p_locationsLabel;
      *p_locationsLabel = v6;

      [(PXPhotosSectionHeaderView *)self addSubview:*p_locationsLabel];
      [(UILabel *)*p_locationsLabel setUserInteractionEnabled:0];
      _PXConfigurePhotoCollectionHeaderLocationsLabel(*p_locationsLabel, [(PXPhotosSectionHeaderView *)self style]);
    }
    if (!self->_separatorLabel)
    {
      uint64_t v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      separatorLabel = self->_separatorLabel;
      self->_separatorLabel = v8;

      [(PXPhotosSectionHeaderView *)self addSubview:self->_separatorLabel];
      [(UILabel *)self->_separatorLabel setUserInteractionEnabled:0];
      [(UILabel *)self->_separatorLabel setText:@"·"];
      _PXConfigurePhotoCollectionHeaderLocationsLabel(self->_separatorLabel, [(PXPhotosSectionHeaderView *)self style]);
    }
    double v10 = [(PXPhotosSectionHeaderView *)self traitCollection];
    uint64_t v11 = [v10 userInterfaceStyle];

    if (([(PXPhotosSectionHeaderView *)self wantsBackground] || v11 == 2)
      && [(PXPhotosSectionHeaderView *)self backgroundStyle])
    {
      char v12 = [MEMORY[0x1E4FB1618] systemWhiteColor];
      [(UILabel *)*p_locationsLabel setTextColor:v12];

      uint64_t v13 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    }
    else
    {
      double v14 = [MEMORY[0x1E4FB1618] systemGrayColor];
      [(UILabel *)*p_locationsLabel setTextColor:v14];

      uint64_t v13 = [MEMORY[0x1E4FB1618] systemGrayColor];
    }
    uint64_t v15 = (void *)v13;
    [(UILabel *)self->_separatorLabel setTextColor:v13];
  }
  else
  {
    [(UILabel *)self->_locationsLabel setText:0];
    [(UILabel *)self->_locationsLabel setHidden:1];
    p_locationsLabel = &self->_separatorLabel;
  }
  [(UILabel *)*p_locationsLabel setHidden:v4 == 0];
  [(PXPhotosSectionHeaderView *)self setNeedsLayout];
}

- (void)_updateDisclosureIcon
{
  BOOL v3 = [(PXPhotosSectionHeaderView *)self allowsPhotosDetailsInteraction];
  disclosureIconView = self->_disclosureIconView;
  if (v3)
  {
    if (!disclosureIconView)
    {
      BOOL v5 = _PXPhotoCollectionHeaderDisclosureIconForStyle([(PXPhotosSectionHeaderView *)self style]);
      if (v5)
      {
        uint64_t v6 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v5];
        BOOL v7 = self->_disclosureIconView;
        self->_disclosureIconView = v6;

        [(PXPhotosSectionHeaderView *)self addSubview:self->_disclosureIconView];
      }

      disclosureIconView = self->_disclosureIconView;
    }
    [(UIImageView *)disclosureIconView setHidden:0];
    uint64_t v8 = [(PXPhotosSectionHeaderView *)self traitCollection];
    uint64_t v9 = [v8 userInterfaceStyle];

    if (([(PXPhotosSectionHeaderView *)self wantsBackground] || v9 == 2)
      && [(PXPhotosSectionHeaderView *)self backgroundStyle])
    {
      uint64_t v10 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4FB1618] systemGrayColor];
    }
    uint64_t v11 = (void *)v10;
    [(UIImageView *)self->_disclosureIconView setTintColor:v10];
  }
  else
  {
    [(UIImageView *)disclosureIconView setHidden:1];
  }
  [(PXPhotosSectionHeaderView *)self setNeedsLayout];
}

- (void)_updateTitleLabel
{
  id v12 = [(PXPhotosSectionHeaderView *)self synthesizedSectionTitle];
  if (v12)
  {
    if ([(PXPhotosSectionHeaderView *)self style] == -1)
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PXPhotosSectionHeaderView.m" lineNumber:480 description:@"Invalid header style."];
    }
    p_titleLabel = (id *)&self->_titleLabel;
    if (!self->_titleLabel)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4FB1930]);
      id v6 = *p_titleLabel;
      id *p_titleLabel = v5;

      [*p_titleLabel setUserInteractionEnabled:0];
      _PXConfigurePhotoCollectionHeaderTitleLabel(*p_titleLabel, [(PXPhotosSectionHeaderView *)self style]);
      [(PXPhotosSectionHeaderView *)self addSubview:*p_titleLabel];
    }
    if ([(PXPhotosSectionHeaderView *)self wantsBackground]
      && [(PXPhotosSectionHeaderView *)self backgroundStyle])
    {
      uint64_t v7 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4FB1618] labelColor];
    }
    uint64_t v8 = (void *)v7;
    [*p_titleLabel setTextColor:v7];

    titleLabel = *p_titleLabel;
    id v10 = v12;
  }
  else
  {
    p_titleLabel = (id *)&self->_titleLabel;
    titleLabel = self->_titleLabel;
    id v10 = 0;
  }
  [titleLabel setText:v10];
  [*p_titleLabel setHidden:v12 == 0];
  [(PXPhotosSectionHeaderView *)self setNeedsLayout];
}

- (void)_updateDateDependentLabels
{
  [(PXPhotosSectionHeaderView *)self _updateTitleLabel];
  [(PXPhotosSectionHeaderView *)self _updateDateLabel];
}

- (void)_handleActionButton:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 headerView:self actionButtonPressed:v7];
  }
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)didTransitionFromLayout:(id)a3 toLayout:(id)a4
{
  self->_inLayoutTransition = 0;
  [(PXPhotosSectionHeaderView *)self _updateBackdropViewGroupName];
}

- (void)willTransitionFromLayout:(id)a3 toLayout:(id)a4
{
  self->_inLayoutTransition = 1;
  [(PXPhotosSectionHeaderView *)self _updateBackdropViewGroupName];
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    -[PXPhotosSectionHeaderView setWantsBackground:](self, "setWantsBackground:", [v4 floating]);
  }
}

- (void)_updateLabelsForTextStyle
{
  int v3 = [(id)objc_opt_class() _hasAccessibilityLargeText];
  titleLabel = self->_titleLabel;
  if (v3)
  {
    [(UILabel *)titleLabel setNumberOfLines:2];
    [(UILabel *)self->_dateLabel setNumberOfLines:2];
    [(UILabel *)self->_locationsLabel setNumberOfLines:2];
    [(UILabel *)self->_dateLabel setTextAlignment:4];
    [(UILabel *)self->_titleLabel setLineBreakMode:0];
    locationsLabel = self->_locationsLabel;
    [(UILabel *)locationsLabel setLineBreakMode:4];
  }
  else
  {
    [(UILabel *)titleLabel setNumberOfLines:1];
    [(UILabel *)self->_dateLabel setNumberOfLines:1];
    [(UILabel *)self->_locationsLabel setNumberOfLines:1];
    [(UILabel *)self->_titleLabel setLineBreakMode:4];
    [(UILabel *)self->_locationsLabel setLineBreakMode:5];
    if ([(PXPhotosSectionHeaderView *)self _shouldReverseLayoutDirection]) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = 2;
    }
    dateLabel = self->_dateLabel;
    [(UILabel *)dateLabel setTextAlignment:v6];
  }
}

- (double)baselineToBottomSpacing
{
  int v3 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v3)) {
    double v4 = 8.0;
  }
  else {
    double v4 = 14.0;
  }

  char v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 scale];

  [(UILabel *)self->_titleLabel font];
  if (objc_claimAutoreleasedReturnValue())
  {
    [(UILabel *)self->_titleLabel font];
    [(id)objc_claimAutoreleasedReturnValue() _scaledValueForValue:v4];
    PXFloatRoundToPixel();
  }

  return v4;
}

- (void)setHighlightInsets:(UIEdgeInsets)a3
{
  self->_highlightInsets = a3;
  [(PXPhotosSectionHeaderView *)self _updateHighlightView];
}

- (void)setBackdropViewGroupName:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToString:self->_backdropViewGroupName] & 1) == 0)
  {
    double v4 = (NSString *)[v6 copy];
    backdropViewGroupName = self->_backdropViewGroupName;
    self->_backdropViewGroupName = v4;

    [(PXPhotosSectionHeaderView *)self _updateBackdropViewGroupName];
  }
}

- (void)setAllowsPhotosDetailsInteraction:(BOOL)a3
{
  if (self->_allowsPhotosDetailsInteraction != a3)
  {
    self->_allowsPhotosDetailsInteraction = a3;
    [(PXPhotosSectionHeaderView *)self _updateDisclosureIcon];
  }
}

- (void)setActionButtonTitle:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  double v4 = self->_actionButtonTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      id v6 = (NSString *)[(NSString *)v8 copy];
      actionButtonTitle = self->_actionButtonTitle;
      self->_actionButtonTitle = v6;

      [(PXPhotosSectionHeaderView *)self _updateActionButton];
    }
  }
}

- (void)setShowsActionButton:(BOOL)a3
{
  if (self->_showsActionButton != a3)
  {
    self->_showsActionButton = a3;
    [(PXPhotosSectionHeaderView *)self _updateActionButton];
  }
}

- (void)setSectionStartDate:(id)a3 endDate:(id)a4
{
  id v6 = (NSDate *)a3;
  id v7 = (NSDate *)a4;
  uint64_t v8 = self->_sectionStartDate;
  if (v8 == v6)
  {
  }
  else
  {
    uint64_t v9 = v8;
    int v10 = [(NSDate *)v6 isEqual:v8];

    if (!v10)
    {
LABEL_7:
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __57__PXPhotosSectionHeaderView_setSectionStartDate_endDate___block_invoke;
      v15[3] = &unk_1E5DD0F30;
      v15[4] = self;
      CGRect v16 = v6;
      double v17 = v7;
      [(PXPhotosSectionHeaderView *)self performBatchUpdateOfDateDependentPropertiesWithBlock:v15];

      goto LABEL_9;
    }
  }
  uint64_t v11 = self->_sectionEndDate;
  if (v11 == v7)
  {

    goto LABEL_9;
  }
  id v12 = v11;
  uint64_t v13 = v7;
  char v14 = [(NSDate *)v13 isEqual:v12];

  if ((v14 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_9:
}

void __57__PXPhotosSectionHeaderView_setSectionStartDate_endDate___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 539) = 1;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 656), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  int v3 = (id *)(*(void *)(a1 + 32) + 664);
  objc_storeStrong(v3, v2);
}

- (void)setSectionLocations:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  double v4 = (NSArray *)a3;
  BOOL v5 = +[PXGridSettings sharedInstance];
  uint64_t v6 = [v5 simulatedNumberOfLocations];

  if (v6 < 1)
  {
    id v7 = v4;
  }
  else
  {
    id v7 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = +[PXGridSettings sharedInstance];
    uint64_t v9 = [v8 simulatedNumberOfLocations];

    if (v9 >= 1)
    {
      uint64_t v10 = 0;
      do
      {
        uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Fake Location %li", ++v10);
        [(NSArray *)v7 addObject:v11];
      }
      while (v9 != v10);
    }
  }
  id v12 = +[PXGridSettings sharedInstance];
  int v13 = [v12 simulateLongTitles];

  if (v13)
  {
    char v14 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v15 = v7;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v21 = 10;
          do
          {
            [(NSArray *)v14 addObject:v20];
            --v21;
          }
          while (v21);
        }
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }
  }
  else
  {
    char v14 = v7;
  }
  if (v14 != self->_sectionLocations) {
    objc_storeStrong((id *)&self->_sectionLocations, v14);
  }
  [(PXPhotosSectionHeaderView *)self _updateLocationsLabelVisibility];
}

- (void)setUseYearOnlyForDefaultTitle:(BOOL)a3
{
  if (self->_useYearOnlyForDefaultTitle != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __59__PXPhotosSectionHeaderView_setUseYearOnlyForDefaultTitle___block_invoke;
    v3[3] = &unk_1E5DCFE98;
    v3[4] = self;
    BOOL v4 = a3;
    [(PXPhotosSectionHeaderView *)self performBatchUpdateOfDateDependentPropertiesWithBlock:v3];
  }
}

uint64_t __59__PXPhotosSectionHeaderView_setUseYearOnlyForDefaultTitle___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 568) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)useYearOnlyForDefaultTitle
{
  return self->_useYearOnlyForDefaultTitle;
}

- (void)performBatchUpdateOfDateDependentPropertiesWithBlock:(id)a3
{
  if (self->_performingBatchDateDependentUpdate)
  {
    self->_performingBatchDateDependentUpdate = 1;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    self->_performingBatchDateDependentUpdate = 1;
  }
  else
  {
    self->_dateDependentPropertiesDidChange = 0;
    self->_performingBatchDateDependentUpdate = 1;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    self->_performingBatchDateDependentUpdate = 0;
    if (self->_dateDependentPropertiesDidChange)
    {
      [(PXPhotosSectionHeaderView *)self _updateDateDependentLabels];
    }
  }
}

- (BOOL)_usingDateAsTitle
{
  return [(NSString *)self->_sectionTitle length] == 0;
}

- (NSString)synthesizedSectionTitle
{
  int v3 = self->_sectionTitle;
  if ([(PXPhotosSectionHeaderView *)self _usingDateAsTitle])
  {
    if (self->_useYearOnlyForDefaultTitle) {
      [(PXPhotosSectionHeaderView *)self _dateRangeYearFormatter];
    }
    else {
    BOOL v4 = [(PXPhotosSectionHeaderView *)self _dateRangeLongFormatter];
    }
    BOOL v5 = [(PXPhotosSectionHeaderView *)self sectionStartDate];
    if (v5)
    {
      uint64_t v6 = [(PXPhotosSectionHeaderView *)self sectionEndDate];
      uint64_t v7 = [v4 stringFromDate:v5 toDate:v6];

      int v3 = (NSString *)v7;
    }
  }
  return v3;
}

- (void)setSectionTitle:(id)a3
{
  BOOL v4 = (NSString *)a3;
  BOOL v5 = +[PXGridSettings sharedInstance];
  int v6 = [v5 simulateLongTitles];

  if (v6)
  {
    uint64_t v7 = [(NSString *)v4 px_stringByRepeating:10];

    BOOL v4 = (NSString *)v7;
  }
  uint64_t v8 = self->_sectionTitle;
  if (v4 == v8)
  {
  }
  else
  {
    uint64_t v9 = v8;
    uint64_t v10 = v4;
    BOOL v11 = [(NSString *)v10 isEqualToString:v9];

    if (!v11)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __45__PXPhotosSectionHeaderView_setSectionTitle___block_invoke;
      v12[3] = &unk_1E5DD32A8;
      v12[4] = self;
      int v13 = v10;
      [(PXPhotosSectionHeaderView *)self performBatchUpdateOfDateDependentPropertiesWithBlock:v12];
    }
  }
}

void __45__PXPhotosSectionHeaderView_setSectionTitle___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 539) = 1;
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 640);
  *(void *)(v3 + 640) = v2;
}

- (void)setWantsBackground:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_wantsBackground != a3)
  {
    self->_wantsBackground = a3;
    [(PXPhotosSectionHeaderView *)self _updateBackgroundAnimated:a4];
    [(PXPhotosSectionHeaderView *)self _updateTitleLabel];
    [(PXPhotosSectionHeaderView *)self _updateLocationsLabelVisibility];
    [(PXPhotosSectionHeaderView *)self _updateDateLabel];
    [(PXPhotosSectionHeaderView *)self _updateDisclosureIcon];
    [(PXPhotosSectionHeaderView *)self _updateActionButton];
  }
}

- (void)setWantsBackground:(BOOL)a3
{
}

- (void)setButtonSpec:(id)a3
{
  BOOL v5 = (PXCuratedLibrarySectionHeaderLayoutSpec *)a3;
  if (self->_buttonSpec != v5)
  {
    int v6 = v5;
    objc_storeStrong((id *)&self->_buttonSpec, a3);
    [(PXPhotosSectionHeaderView *)self _updateActionButton];
    BOOL v5 = v6;
  }
}

- (void)setBackgroundImageAlpha:(double)a3
{
  if (self->_backgroundImageAlpha != a3)
  {
    self->_backgroundImageAlpha = a3;
    [(PXPhotosSectionHeaderView *)self _updateBackgroundAnimated:0];
  }
}

- (void)setBackgroundImageOverhang:(double)a3
{
  if (self->_backgroundImageOverhang != a3)
  {
    self->_backgroundImageOverhang = a3;
    [(PXPhotosSectionHeaderView *)self setNeedsLayout];
  }
}

- (void)setBackgroundImage:(id)a3
{
  BOOL v5 = (UIImage *)a3;
  if (self->_backgroundImage != v5)
  {
    int v6 = v5;
    objc_storeStrong((id *)&self->_backgroundImage, a3);
    [(PXPhotosSectionHeaderView *)self _updateBackgroundAnimated:0];
    BOOL v5 = v6;
  }
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    [(PXPhotosSectionHeaderView *)self _updateBackgroundAnimated:0];
    [(PXPhotosSectionHeaderView *)self _updateTitleLabel];
    [(PXPhotosSectionHeaderView *)self _updateLocationsLabelVisibility];
    [(PXPhotosSectionHeaderView *)self _updateDateLabel];
    [(PXPhotosSectionHeaderView *)self _updateDisclosureIcon];
    [(PXPhotosSectionHeaderView *)self _updateActionButton];
  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(UILabel *)self->_titleLabel removeFromSuperview];
    titleLabel = self->_titleLabel;
    self->_titleLabel = 0;

    [(UILabel *)self->_locationsLabel removeFromSuperview];
    locationsLabel = self->_locationsLabel;
    self->_locationsLabel = 0;

    [(UILabel *)self->_dateLabel removeFromSuperview];
    dateLabel = self->_dateLabel;
    self->_dateLabel = 0;

    [(PXPhotosSectionHeaderView *)self _updateDisclosureIcon];
    [(PXPhotosSectionHeaderView *)self setNeedsLayout];
  }
}

- (PXPhotosSectionHeaderView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXPhotosSectionHeaderView;
  uint64_t v3 = -[PXPhotosSectionHeaderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BOOL v4 = v3;
  if (v3)
  {
    v3->_style = 0;
    v3->_allowsPhotosDetailsInteraction = 1;
    v3->_backgroundStyle = 0;
    [(PXPhotosSectionHeaderView *)v3 _updateBackgroundAnimated:0];
    BOOL v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(PXPhotosSectionHeaderView *)v4 setBackgroundColor:v5];

    [(PXPhotosSectionHeaderView *)v4 setOpaque:0];
    int v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v4 selector:sel__contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];

    uint64_t v7 = [(PXPhotosSectionHeaderView *)v4 layer];
    [v7 setAllowsGroupOpacity:0];
  }
  return v4;
}

+ (BOOL)_hasAccessibilityLargeText
{
  uint64_t v3 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  LOBYTE(a1) = [a1 shouldUseAccessibilityLargeTextLayoutWithTraitCollecton:v3];

  return (char)a1;
}

+ (BOOL)shouldUseAccessibilityLargeTextLayoutWithTraitCollecton:(id)a3
{
  BOOL v4 = (void *)*MEMORY[0x1E4FB2608];
  id v5 = a3;
  int v6 = [v4 preferredContentSizeCategory];
  int v7 = [a1 shouldUsePhoneLayoutWithTraitCollection:v5];

  if (v7) {
    LOBYTE(v7) = UIContentSizeCategoryIsAccessibilityCategory(v6);
  }

  return v7;
}

+ (BOOL)shouldUsePhoneLayoutWithTraitCollection:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 horizontalSizeClass] == 1 || objc_msgSend(v3, "verticalSizeClass") == 1;

  return v4;
}

- (NSCopying)userData
{
  return (NSCopying *)objc_getAssociatedObject(self, (const void *)UserDataAssociationKey_279839);
}

- (void)setUserData:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v17 = (objc_class *)objc_opt_class();
      uint64_t v18 = NSStringFromClass(v17);
      double v19 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
      [v16 handleFailureInMethod:a2, self, @"PXAlbumSectionHeaderLayoutProvider+iOS.m", 445, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"userData", v18, v19 object file lineNumber description];
    }
  }
  objc_getAssociatedObject(self, (const void *)UserDataAssociationKey_279839);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 != v5)
  {
    objc_setAssociatedObject(self, (const void *)UserDataAssociationKey_279839, v5, (void *)3);
    int v7 = [v5 weakLayout];
    [(PXPhotosSectionHeaderView *)self setDelegate:v7];
    -[PXPhotosSectionHeaderView setStyle:](self, "setStyle:", [v5 headerStyle]);
    uint64_t v8 = +[PXPhotosGridSettings sharedInstance];
    -[PXPhotosSectionHeaderView setBackgroundStyle:](self, "setBackgroundStyle:", [v8 useGradientSectionHeaders]);

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __58__PXPhotosSectionHeaderView_PXGReusableView__setUserData___block_invoke;
    v20[3] = &unk_1E5DD32A8;
    v20[4] = self;
    id v9 = v5;
    id v21 = v9;
    [(PXPhotosSectionHeaderView *)self performBatchUpdateOfDateDependentPropertiesWithBlock:v20];
    uint64_t v10 = [v9 locationNames];
    [(PXPhotosSectionHeaderView *)self setSectionLocations:v10];

    -[PXPhotosSectionHeaderView setContentInsets:](self, "setContentInsets:", 0.0, 20.0, 0.0, 20.0);
    -[PXPhotosSectionHeaderView setHighlightInsets:](self, "setHighlightInsets:", -7.5, 0.0, 2.0, 0.0);
    unint64_t v11 = [v9 actionType] - 1;
    if (v11 > 3)
    {
      id v12 = 0;
    }
    else
    {
      id v12 = PXLocalizedStringFromTable(off_1E5DCFEB8[v11], @"PhotosUICore");
    }
    [(PXPhotosSectionHeaderView *)self setShowsActionButton:v12 != 0];
    [(PXPhotosSectionHeaderView *)self setActionButtonTitle:v12];
    -[PXPhotosSectionHeaderView setAllowsPhotosDetailsInteraction:](self, "setAllowsPhotosDetailsInteraction:", [v9 allowsPhotosDetailsInteraction]);
    int v13 = [v9 backdropViewGroupName];
    [(PXPhotosSectionHeaderView *)self setBackdropViewGroupName:v13];

    char v14 = [v9 gradientImage];
    [(PXPhotosSectionHeaderView *)self setBackgroundImage:v14];

    [v9 gradientAlpha];
    -[PXPhotosSectionHeaderView setBackgroundImageAlpha:](self, "setBackgroundImageAlpha:");
    [v9 gradientOverhang];
    -[PXPhotosSectionHeaderView setBackgroundImageOverhang:](self, "setBackgroundImageOverhang:");
    uint64_t v15 = [v9 buttonSpec];
    [(PXPhotosSectionHeaderView *)self setButtonSpec:v15];

    -[PXPhotosSectionHeaderView setBackgroundStyle:](self, "setBackgroundStyle:", [v9 backgroundStyle]);
    -[PXPhotosSectionHeaderView setWantsBackground:animated:](self, "setWantsBackground:animated:", [v7 wantsBackground], objc_msgSend(v7, "scrollSpeedRegime") < 2);
  }
}

void __58__PXPhotosSectionHeaderView_PXGReusableView__setUserData___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) title];
  [*(id *)(a1 + 32) setSectionTitle:v2];

  id v3 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) startDate];
  BOOL v4 = [*(id *)(a1 + 40) endDate];
  [v3 setSectionStartDate:v5 endDate:v4];
}

- (CGRect)clippingRect
{
  double v2 = *MEMORY[0x1E4F1DB10];
  double v3 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  if (!CGRectEqualToRect(a3, *MEMORY[0x1E4F1DB10]))
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PXAlbumSectionHeaderLayoutProvider+iOS.m" lineNumber:437 description:@"Clipping isn't supported"];
  }
}

@end