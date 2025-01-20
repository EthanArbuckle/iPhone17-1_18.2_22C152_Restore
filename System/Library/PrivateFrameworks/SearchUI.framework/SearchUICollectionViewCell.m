@interface SearchUICollectionViewCell
- (BOOL)_appliesLayoutAttributesMaskingToReusableView;
- (BOOL)_disableRasterizeInAnimations;
- (BOOL)highlightFrameMatchesHighlightView;
- (BOOL)isExpandable;
- (BOOL)needsInternalFocus;
- (BOOL)setupManualFocus;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)useSystemSizing;
- (CALayer)linkLayer;
- (CGRect)highlightFrame;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSArray)visibleResults;
- (NSDirectionalEdgeInsets)_preferredSeparatorInsetsForProposedInsets:(NSDirectionalEdgeInsets)a3;
- (SearchUIBackgroundColorView)backgroundPlatterView;
- (SearchUICollectionViewCell)initWithFrame:(CGRect)a3;
- (SearchUIDragSource)dragSource;
- (SearchUIFeedbackDelegateInternal)delegate;
- (SearchUIRowModel)rowModel;
- (UIView)dummyBackgroundView;
- (UIView)leadingTextView;
- (UIView)leadingView;
- (UIView)selectedOverlayView;
- (UIView)sizingView;
- (UIView)viewForForcedFocus;
- (UIViewController)embeddedViewController;
- (UIViewPropertyAnimator)selectionAnimator;
- (_UIConstraintBasedLayoutHostingView)hostedSnippetUIView;
- (double)highlightFrameCornerRadius;
- (id)focusEffect;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (int)sfSeparatorStyle;
- (int64_t)focusItemDeferralMode;
- (int64_t)resolvedFocusStyle;
- (int64_t)sectionBackgroundStyle;
- (unint64_t)maskedCorners;
- (void)addLinkLayer:(id)a3;
- (void)animateFocusScaleDownEffectIsHighlighted:(BOOL)a3 isSelected:(BOOL)a4 appearance:(id)a5;
- (void)applyLayoutAttributes:(id)a3;
- (void)didMoveToWindow;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundPlatterView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDragSource:(id)a3;
- (void)setDummyBackgroundView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHostedSnippetUIView:(id)a3;
- (void)setLinkLayer:(id)a3;
- (void)setMaskedCorners:(unint64_t)a3;
- (void)setResolvedFocusStyle:(int64_t)a3;
- (void)setRowModel:(id)a3;
- (void)setSearchui_focusStyle:(int64_t)a3;
- (void)setSectionBackgroundStyle:(int64_t)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedOverlayView:(id)a3;
- (void)setSelectionAnimator:(id)a3;
- (void)setSfSeparatorStyle:(int)a3;
- (void)setUseSystemSizing:(BOOL)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateCornerMasks;
- (void)updateCornerRadius:(double)a3;
- (void)updateFocusStyleWithAppearance:(id)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUICollectionViewCell

- (void)tlk_updateForAppearance:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)SearchUICollectionViewCell;
  [(SearchUICollectionViewCell *)&v51 tlk_updateForAppearance:v4];
  int64_t v5 = [(SearchUICollectionViewCell *)self sectionBackgroundStyle];
  v6 = [(SearchUICollectionViewCell *)self rowModel];
  uint64_t v7 = [v6 sectionType];

  v8 = [(SearchUICollectionViewCell *)self rowModel];
  int v9 = [v8 fillsBackgroundWithContent];

  if (v5 != 5)
  {
    int v50 = v9;
    v16 = [(SearchUICollectionViewCell *)self rowModel];
    v17 = [v16 backgroundColor];
    int64_t v18 = [(SearchUICollectionViewCell *)self sectionBackgroundStyle];
    int64_t v19 = v18;
    BOOL v23 = ((unint64_t)(v5 - 1) < 2 || v18 == 3 || v17 != 0) && v5 != 4;
    v24 = [(SearchUICollectionViewCell *)self backgroundPlatterView];
    [v24 setColor:v17];

    v25 = [v16 backgroundImage];
    v26 = [(SearchUICollectionViewCell *)self backgroundPlatterView];
    [v26 setBackgroundImage:v25];

    if (v23) {
      [(SearchUICollectionViewCell *)self backgroundPlatterView];
    }
    else {
    v30 = [(SearchUICollectionViewCell *)self dummyBackgroundView];
    }
    [(SearchUICollectionViewCell *)self setBackgroundView:v30];

    if (v5 == 2) {
      double v31 = 0.0;
    }
    else {
      double v31 = 1.0;
    }
    v32 = [(SearchUICollectionViewCell *)self backgroundView];
    [v32 setAlpha:v31];

    v33 = [v16 cardSection];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v34 = TLKSnippetModernizationEnabled();

      if (v34)
      {
        v35 = &SearchUIHeroCardSectionViewCornerRadiusForLeadingTrailingView;
        if (v7 != 3) {
          v35 = &SearchUIHeroCardSectionViewCornerRadius;
        }
        double v15 = *(double *)v35;
        goto LABEL_44;
      }
    }
    else
    {
    }
    v36 = [v16 identifyingResult];
    v37 = [v36 identifier];
    int v38 = [v37 isEqualToString:@"com.apple.other:show_more"];

    if (v38)
    {
      if ([MEMORY[0x1E4FAE198] isLargePhone]) {
        double v39 = 13.5;
      }
      else {
        double v39 = 12.2778;
      }
      v40 = (void *)MEMORY[0x1E4FAE100];
      v41 = [(SearchUICollectionViewCell *)self contentView];
      [v40 deviceScaledRoundedValue:v41 forView:v39];
      double v15 = v42;

      goto LABEL_44;
    }
    if (v19 == 3)
    {
      +[SearchUIAutoLayout roundedItemCornerRadius];
    }
    else
    {
      if (((v23 | v50) & 1) == 0)
      {
        v44 = [(SearchUICollectionViewCell *)self rowModel];
        if (([v44 hasCustomCornerRounding] & 1) == 0)
        {

          double v15 = 0.0;
          goto LABEL_44;
        }
        int64_t v45 = [(SearchUICollectionViewCell *)self sectionBackgroundStyle];

        double v15 = 0.0;
        if (v45 != 4)
        {
LABEL_44:

          goto LABEL_45;
        }
      }
      +[SearchUIAutoLayout sectionCornerRadius];
    }
    double v15 = v43;
    goto LABEL_44;
  }
  v10 = [(SearchUICollectionViewCell *)self dummyBackgroundView];
  [(SearchUICollectionViewCell *)self setBackgroundView:v10];

  v11 = [(SearchUICollectionViewCell *)self rowModel];
  v12 = [v11 cardSection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && v7 == 3)
  {
    +[SearchUIAutoLayout sectionCornerRadius];
    double v15 = v14;
  }
  else
  {
    v27 = [(SearchUICollectionViewCell *)self rowModel];
    v28 = [v27 cardSection];
    objc_opt_class();
    unsigned __int8 v29 = objc_opt_isKindOfClass();

    if ((v29 & (v7 == 1)) != 0) {
      double v15 = 20.0;
    }
    else {
      double v15 = 4.0;
    }
  }
LABEL_45:
  [(SearchUICollectionViewCell *)self updateCornerRadius:v15];
  v46 = [(SearchUICollectionViewCell *)self rowModel];
  if ([v46 hasCustomCornerRounding])
  {
    v47 = [(SearchUICollectionViewCell *)self rowModel];
    -[SearchUICollectionViewCell setMaskedCorners:](self, "setMaskedCorners:", [v47 cornerMask]);
  }
  else
  {
    [(SearchUICollectionViewCell *)self setMaskedCorners:SearchUIDefaultCornerMask];
  }

  v48 = [(SearchUICollectionViewCell *)self traitCollection];
  uint64_t v49 = [v48 userInterfaceIdiom];

  if (v49 == 3) {
    [(SearchUICollectionViewCell *)self setMaskedCorners:SearchUIDefaultCornerMask];
  }
  [(SearchUICollectionViewCell *)self updateFocusStyleWithAppearance:v4];
}

- (SearchUIRowModel)rowModel
{
  return self->_rowModel;
}

- (SearchUIBackgroundColorView)backgroundPlatterView
{
  backgroundPlatterView = self->_backgroundPlatterView;
  if (!backgroundPlatterView)
  {
    id v4 = (SearchUIBackgroundColorView *)objc_opt_new();
    [(SearchUIBackgroundColorView *)v4 setDelegate:self];
    int64_t v5 = self->_backgroundPlatterView;
    self->_backgroundPlatterView = v4;

    backgroundPlatterView = self->_backgroundPlatterView;
  }
  return backgroundPlatterView;
}

- (void)updateCornerMasks
{
  unint64_t v3 = [(SearchUICollectionViewCell *)self maskedCorners];
  id v4 = [(SearchUICollectionViewCell *)self layer];
  [v4 setMaskedCorners:v3];

  unint64_t v5 = [(SearchUICollectionViewCell *)self maskedCorners];
  v6 = [(SearchUICollectionViewCell *)self contentView];
  uint64_t v7 = [v6 layer];
  [v7 setMaskedCorners:v5];

  unint64_t v8 = [(SearchUICollectionViewCell *)self maskedCorners];
  int v9 = [(SearchUICollectionViewCell *)self backgroundView];
  v10 = [v9 layer];
  [v10 setMaskedCorners:v8];

  unint64_t v11 = [(SearchUICollectionViewCell *)self maskedCorners];
  v12 = [(SearchUICollectionViewCell *)self dummyBackgroundView];
  v13 = [v12 layer];
  [v13 setMaskedCorners:v11];

  unint64_t v14 = [(SearchUICollectionViewCell *)self maskedCorners];
  double v15 = [(SearchUICollectionViewCell *)self selectedBackgroundView];
  v16 = [v15 layer];
  [v16 setMaskedCorners:v14];

  unint64_t v17 = [(SearchUICollectionViewCell *)self maskedCorners];
  id v18 = [(SearchUICollectionViewCell *)self backgroundPlatterView];
  [v18 setMaskedCorners:v17];
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (UIView)dummyBackgroundView
{
  dummyBackgroundView = self->_dummyBackgroundView;
  if (!dummyBackgroundView)
  {
    id v4 = (UIView *)objc_opt_new();
    unint64_t v5 = self->_dummyBackgroundView;
    self->_dummyBackgroundView = v4;

    dummyBackgroundView = self->_dummyBackgroundView;
  }
  return dummyBackgroundView;
}

- (int64_t)sectionBackgroundStyle
{
  return self->_sectionBackgroundStyle;
}

- (void)updateFocusStyleWithAppearance:(id)a3
{
  id v65 = a3;
  id v4 = [(SearchUICollectionViewCell *)self backgroundView];
  [v4 frame];
  double x = v5;
  double y = v7;
  double width = v9;
  double height = v11;

  switch([(SearchUICollectionViewCell *)self resolvedFocusStyle])
  {
    case 3:
      +[SearchUIFocusStyleUtilities secondaryHaloProminence];
      +[SearchUIAutoLayout selectionBorderWidth];
      double v14 = v13;
      uint64_t v15 = [(SearchUICollectionViewCell *)self highlightReferenceView];
      v16 = (void *)v15;
      if (v15) {
        unint64_t v17 = (SearchUICollectionViewCell *)v15;
      }
      else {
        unint64_t v17 = self;
      }
      id v18 = v17;

      if ([(SearchUICollectionViewCell *)self highlightFrameMatchesHighlightView])
      {
        [(SearchUICollectionViewCell *)v18 bounds];
        -[SearchUICollectionViewCell convertRect:toView:](v18, "convertRect:toView:", self);
      }
      else
      {
        [(SearchUICollectionViewCell *)self highlightFrame];
      }
      CGFloat v33 = v19;
      CGFloat v34 = v20;
      CGFloat v35 = v21;
      CGFloat v36 = v22;
      if (CGRectEqualToRect(*(CGRect *)&v19, *MEMORY[0x1E4F1DB28]))
      {
        [(SearchUICollectionViewCell *)self bounds];
        CGFloat v33 = v37;
        CGFloat v34 = v38;
        CGFloat v35 = v39;
        CGFloat v36 = v40;
      }
      v67.origin.double x = v33;
      v67.origin.double y = v34;
      v67.size.double width = v35;
      v67.size.double height = v36;
      CGRect v68 = CGRectInset(v67, -v14, -v14);
      double x = v68.origin.x;
      double y = v68.origin.y;
      double width = v68.size.width;
      double height = v68.size.height;
      [(SearchUICollectionViewCell *)self highlightFrameCornerRadius];
      double v42 = v41;
      double v43 = [(SearchUICollectionViewCell *)v18 layer];
      [v43 cornerRadius];
      double v45 = v44;

      if (v42 >= v45) {
        double v46 = v42;
      }
      else {
        double v46 = v45;
      }
      double v47 = v14 + v46;
      v48 = [(SearchUICollectionViewCell *)self selectedBackgroundView];
      uint64_t v49 = [v48 layer];
      [v49 setCornerRadius:v47];

      int v50 = [(SearchUICollectionViewCell *)v18 layer];
      objc_super v51 = [v50 cornerCurve];
      v52 = [(SearchUICollectionViewCell *)self selectedBackgroundView];
      v53 = [v52 layer];
      [v53 setCornerCurve:v51];

      v54 = [(SearchUICollectionViewCell *)v18 layer];
      uint64_t v55 = [v54 maskedCorners];
      v56 = [(SearchUICollectionViewCell *)self selectedBackgroundView];
      v57 = [v56 layer];
      [v57 setMaskedCorners:v55];

      uint64_t v24 = 0;
      int v23 = 1;
      break;
    case 4:
      v25 = [(SearchUICollectionViewCell *)self rowModel];
      uint64_t v24 = [v25 isTappable] ^ 1;

      if (height * 0.5 <= 36.0) {
        double v26 = height * 0.5;
      }
      else {
        double v26 = 36.0;
      }
      v27 = [(SearchUICollectionViewCell *)self selectedBackgroundView];
      [v27 _setContinuousCornerRadius:v26];

      v28 = [MEMORY[0x1E4FB1618] colorWithWhite:0.921568627 alpha:1.0];
      unsigned __int8 v29 = [(SearchUICollectionViewCell *)self selectedBackgroundView];
      [v29 setBackgroundColor:v28];

      [(SearchUICollectionViewCell *)self setMaskedCorners:SearchUIDefaultCornerMask];
      if ([(SearchUICollectionViewCell *)self isSelected]
        && ([(SearchUICollectionViewCell *)self rowModel],
            v30 = objc_claimAutoreleasedReturnValue(),
            int v31 = [v30 isTappable],
            v30,
            v31))
      {
        v32 = objc_msgSend(MEMORY[0x1E4FAE060], "appearanceWithVibrancyEnabled:isDark:", objc_msgSend(v65, "isVibrant"), 0);
        [v32 overrideAppearanceForView:self];
      }
      else
      {
        [MEMORY[0x1E4FAE060] disableAppearanceOverrideForView:self];
      }
      goto LABEL_17;
    case 5:
    case 6:
      goto LABEL_8;
    case 7:
      [(SearchUICollectionViewCell *)self animateFocusScaleDownEffectIsHighlighted:[(SearchUICollectionViewCell *)self isHighlighted] isSelected:[(SearchUICollectionViewCell *)self isSelected] appearance:v65];
LABEL_8:
      int v23 = 0;
      uint64_t v24 = 1;
      break;
    default:
      uint64_t v24 = 0;
LABEL_17:
      int v23 = 0;
      break;
  }
  v58 = [(SearchUICollectionViewCell *)self selectedBackgroundView];
  objc_msgSend(v58, "setFrame:", x, y, width, height);

  v59 = [(SearchUICollectionViewCell *)self selectedBackgroundView];
  [v59 setHidden:v24];

  unint64_t v60 = +[SearchUIFocusStyleUtilities secondaryHaloProminence];
  v61 = [(SearchUICollectionViewCell *)self selectedBackgroundView];
  [v61 setProminence:v60];

  double v62 = 0.0;
  if (v23)
  {
    +[SearchUIAutoLayout selectionBorderWidth];
    double v62 = v63;
  }
  v64 = [(SearchUICollectionViewCell *)self selectedBackgroundView];
  [v64 setBorderWidth:v62];
}

- (int64_t)resolvedFocusStyle
{
  return self->_resolvedFocusStyle;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  self->_maskedCorners = a3;
  [(SearchUICollectionViewCell *)self updateCornerMasks];
}

- (void)updateCornerRadius:(double)a3
{
  -[SearchUICollectionViewCell _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  double v5 = [(SearchUICollectionViewCell *)self contentView];
  [v5 _setContinuousCornerRadius:a3];

  v6 = [(SearchUICollectionViewCell *)self backgroundPlatterView];
  [v6 _setContinuousCornerRadius:a3];

  double v7 = [(SearchUICollectionViewCell *)self dummyBackgroundView];
  [v7 _setContinuousCornerRadius:a3];

  unint64_t v8 = [(SearchUICollectionViewCell *)self selectedBackgroundView];
  [v8 borderWidth];
  double v10 = v9 + a3;
  double v11 = [(SearchUICollectionViewCell *)self selectedBackgroundView];
  [v11 _setContinuousCornerRadius:v10];

  [(SearchUICollectionViewCell *)self updateCornerMasks];
}

- (BOOL)_appliesLayoutAttributesMaskingToReusableView
{
  v2 = [(SearchUICollectionViewCell *)self rowModel];
  unint64_t v3 = [v2 cardSection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isForcingHeight];
  [v4 frame];
  v8.receiver = self;
  v8.super_class = (Class)SearchUICollectionViewCell;
  v6 = [(SearchUICollectionViewCell *)&v8 preferredLayoutAttributesFittingAttributes:v4];

  if (v5)
  {
    [v6 frame];
    objc_msgSend(v6, "setFrame:");
  }
  return v6;
}

- (void)applyLayoutAttributes:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUICollectionViewCell;
  [(SearchUICollectionViewCell *)&v5 applyLayoutAttributes:a3];
  id v4 = [MEMORY[0x1E4FAE060] bestAppearanceForView:self];
  [(SearchUICollectionViewCell *)self updateFocusStyleWithAppearance:v4];
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (SearchUICollectionViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SearchUICollectionViewCell;
  unint64_t v3 = -[SearchUICollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    objc_super v5 = [(SearchUICollectionViewCell *)v3 layer];
    [v5 setAllowsGroupOpacity:0];

    v6 = objc_opt_new();
    [(SearchUICollectionViewCell *)v4 setSelectedBackgroundView:v6];

    [(SearchUICollectionViewCell *)v4 setMaskedCorners:SearchUIDefaultCornerMask];
    [(SearchUICollectionViewCell *)v4 setSearchui_focusStyle:0];
  }
  return v4;
}

- (void)setSearchui_focusStyle:(int64_t)a3
{
  int64_t v5 = [(SearchUICollectionViewCell *)self resolvedFocusStyle];
  if (!a3 || v5 != a3)
  {
    if (!a3) {
      a3 = +[SearchUIFocusStyleUtilities bestFocusStyleForCell:self];
    }
    [(SearchUICollectionViewCell *)self setResolvedFocusStyle:a3];
    [(SearchUICollectionViewCell *)self tlk_updateWithCurrentAppearance];
  }
}

- (void)setResolvedFocusStyle:(int64_t)a3
{
  self->_resolvedFocusStyle = a3;
}

- (void)updateWithRowModel:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SearchUICollectionViewCell *)self dragSource];

  if (v5)
  {
    v6 = [(SearchUICollectionViewCell *)self dragSource];
    [v6 setDragObject:v4];
  }
  else
  {
    v6 = [(SearchUICollectionViewCell *)self delegate];
    double v7 = +[SearchUIDragSource dragSourceForView:self dragObject:v4 feedbackDelegate:v6];
    [(SearchUICollectionViewCell *)self setDragSource:v7];
  }
  [(SearchUICollectionViewCell *)self setBackgroundConfiguration:0];
  [(SearchUICollectionViewCell *)self setRowModel:v4];
  [(SearchUICollectionViewCell *)self tlk_updateWithCurrentAppearance];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SearchUICollectionViewCell_updateWithRowModel___block_invoke;
  block[3] = &unk_1E6E72730;
  block[4] = self;
  if (updateWithRowModel__onceToken != -1) {
    dispatch_once(&updateWithRowModel__onceToken, block);
  }
  if (updateWithRowModel__safeToUpdateMasking)
  {
    objc_super v8 = [(SearchUICollectionViewCell *)self _layoutAttributes];
    [(SearchUICollectionViewCell *)self _updateMaskingUsingAttributes:v8];
  }
  [(SearchUICollectionViewCell *)self tlk_updateWithCurrentAppearance];
}

- (void)setSfSeparatorStyle:(int)a3
{
  self->_sfSeparatorStyle = a3;
}

- (void)setSectionBackgroundStyle:(int64_t)a3
{
  if (self->_sectionBackgroundStyle != a3)
  {
    self->_sectionBackgroundStyle = a3;
    [(SearchUICollectionViewCell *)self tlk_updateWithCurrentAppearance];
  }
}

- (void)setRowModel:(id)a3
{
}

- (void)setDragSource:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SearchUICollectionViewCell;
  [(SearchUICollectionViewCell *)&v13 layoutSubviews];
  unint64_t v3 = [(SearchUICollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(SearchUICollectionViewCell *)self sizingView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  [(SearchUICollectionViewCell *)self bounds];
  -[CALayer setFrame:](self->_linkLayer, "setFrame:");
}

- (UIView)sizingView
{
  return self->_sizingView;
}

- (SearchUIDragSource)dragSource
{
  return self->_dragSource;
}

- (SearchUIFeedbackDelegateInternal)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SearchUIFeedbackDelegateInternal *)WeakRetained;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUICollectionViewCell;
  [(SearchUICollectionViewCell *)&v3 didMoveToWindow];
  [(SearchUICollectionViewCell *)self tlk_updateWithCurrentAppearance];
}

- (UIViewController)embeddedViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 936, 1);
}

uint64_t __49__SearchUICollectionViewCell_updateWithRowModel___block_invoke()
{
  if (objc_opt_respondsToSelector()) {
    uint64_t result = objc_opt_respondsToSelector();
  }
  else {
    uint64_t result = 0;
  }
  updateWithRowModel__safeToUpdateMasking = result & 1;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  if ([(SearchUICollectionViewCell *)self useSystemSizing])
  {
    v20.receiver = self;
    v20.super_class = (Class)SearchUICollectionViewCell;
    *(float *)&double v10 = a4;
    *(float *)&double v11 = a5;
    -[SearchUICollectionViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v20, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v10, v11);
    double width = v13;
  }
  else
  {
    double v14 = [(SearchUICollectionViewCell *)self sizingView];
    uint64_t v15 = v14;
    if (a4 == 1000.0)
    {
      objc_msgSend(v14, "effectiveLayoutSizeFittingSize:", width, 0.0);
    }
    else
    {
      objc_msgSend(v14, "effectiveLayoutSizeFittingSize:", 1000.0, 1000.0);
      double width = v17;
    }
    double v18 = v16;

    if (v18 == 0.0) {
      double v12 = 1.0;
    }
    else {
      double v12 = v18;
    }
  }
  double v19 = width;
  result.double height = v12;
  result.double width = v19;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUICollectionViewCell;
  [(SearchUICollectionViewCell *)&v9 traitCollectionDidChange:v4];
  double v5 = [(SearchUICollectionViewCell *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(SearchUICollectionViewCell *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  double v6 = [(SearchUICollectionViewCell *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)setHighlighted:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUICollectionViewCell;
  [(SearchUICollectionViewCell *)&v5 setHighlighted:a3];
  id v4 = [MEMORY[0x1E4FAE060] bestAppearanceForView:self];
  [(SearchUICollectionViewCell *)self updateFocusStyleWithAppearance:v4];
}

- (void)setSelected:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUICollectionViewCell;
  [(SearchUICollectionViewCell *)&v5 setSelected:a3];
  id v4 = [MEMORY[0x1E4FAE060] bestAppearanceForView:self];
  [(SearchUICollectionViewCell *)self updateFocusStyleWithAppearance:v4];
}

- (void)animateFocusScaleDownEffectIsHighlighted:(BOOL)a3 isSelected:(BOOL)a4 appearance:(id)a5
{
  BOOL v5 = a4;
  int v6 = a3;
  id v8 = a5;
  uint64_t v9 = [(SearchUICollectionViewCell *)self highlightReferenceView];
  double v10 = (void *)v9;
  if (v9) {
    double v11 = (SearchUICollectionViewCell *)v9;
  }
  else {
    double v11 = self;
  }
  double v12 = v11;

  int v13 = v6 | v5;
  if ((v6 | v5) == 1)
  {
    double v14 = [(SearchUICollectionViewCell *)self selectedOverlayView];

    if (!v14)
    {
      uint64_t v15 = objc_opt_new();
      [(SearchUICollectionViewCell *)self setSelectedOverlayView:v15];

      double v16 = [(SearchUICollectionViewCell *)self selectedOverlayView];
      [v16 setHidden:1];
    }
  }
  if (v12) {
    [(SearchUICollectionViewCell *)v12 transform];
  }
  else {
    memset(&v75, 0, sizeof(v75));
  }
  int v17 = CGAffineTransformIsIdentity(&v75) ^ v6;
  double v18 = [(SearchUICollectionViewCell *)self selectedOverlayView];
  if (v18)
  {
    double v19 = [(SearchUICollectionViewCell *)self selectedOverlayView];
    int v20 = v13 ^ [v19 isHidden];
  }
  else
  {
    int v20 = v13 ^ 1;
  }

  if ((v17 & v20 & 1) == 0)
  {
    v66 = v8;
    double v21 = [(SearchUICollectionViewCell *)self selectedOverlayView];
    double v22 = [v21 superview];

    if (v22 != v12)
    {
      int v23 = [(SearchUICollectionViewCell *)self selectedOverlayView];
      [v23 removeFromSuperview];

      uint64_t v24 = [(SearchUICollectionViewCell *)self selectedOverlayView];
      [(SearchUICollectionViewCell *)v12 addSubview:v24];
    }
    [(SearchUICollectionViewCell *)v12 bounds];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    CGFloat v33 = [(SearchUICollectionViewCell *)self selectedOverlayView];
    objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

    CGFloat v34 = [(SearchUICollectionViewCell *)v12 layer];
    [v34 cornerRadius];
    double v36 = v35;
    double v37 = [(SearchUICollectionViewCell *)self selectedOverlayView];
    double v38 = [v37 layer];
    [v38 setCornerRadius:v36];

    double v39 = [(SearchUICollectionViewCell *)v12 layer];
    double v40 = [v39 cornerCurve];
    double v41 = [(SearchUICollectionViewCell *)self selectedOverlayView];
    double v42 = [v41 layer];
    [v42 setCornerCurve:v40];

    double v43 = [(SearchUICollectionViewCell *)v12 layer];
    uint64_t v44 = [v43 maskedCorners];
    double v45 = [(SearchUICollectionViewCell *)self selectedOverlayView];
    uint64_t v46 = [v45 layer];
    [(id)v46 setMaskedCorners:v44];

    double v47 = [v66 colorForProminence:3];
    v48 = [(SearchUICollectionViewCell *)self rowModel];
    uint64_t v49 = [v48 cardSection];
    objc_opt_class();
    LOBYTE(v46) = objc_opt_isKindOfClass();

    if (v46)
    {
      int v50 = [(SearchUICollectionViewCell *)self rowModel];
      objc_super v51 = [v50 cardSection];

      if ([v51 useAppIconMetrics])
      {
        v52 = [v51 thumbnail];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          v54 = [MEMORY[0x1E4FB1618] blackColor];
          uint64_t v55 = [v54 colorWithAlphaComponent:0.25];

          double v47 = (void *)v55;
        }
      }
    }
    id v8 = v66;
    v56 = [(SearchUICollectionViewCell *)self selectedOverlayView];
    [v56 setBackgroundColor:v47];

    if (v13)
    {
      v57 = [(SearchUICollectionViewCell *)self selectedOverlayView];
      int v58 = [v57 isHidden];

      if (v58)
      {
        v59 = [(SearchUICollectionViewCell *)self selectedOverlayView];
        [v59 setHidden:0];

        unint64_t v60 = [(SearchUICollectionViewCell *)self selectedOverlayView];
        [v60 setAlpha:0.0];

        v61 = [(SearchUICollectionViewCell *)self selectedOverlayView];
        [(SearchUICollectionViewCell *)self bringSubviewToFront:v61];
      }
    }
    double v62 = 0.25;
    double v63 = (void *)[objc_alloc(MEMORY[0x1E4FB1C58]) initWithDuration:0.25 bounce:0.35];
    if (((v20 | v17 ^ 1) & ~v6) == 0) {
      double v62 = 0.0;
    }
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __93__SearchUICollectionViewCell_animateFocusScaleDownEffectIsHighlighted_isSelected_appearance___block_invoke;
    v73[3] = &unk_1E6E72758;
    v73[4] = self;
    char v74 = v13;
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __93__SearchUICollectionViewCell_animateFocusScaleDownEffectIsHighlighted_isSelected_appearance___block_invoke_2;
    v71[3] = &unk_1E6E72780;
    v71[4] = self;
    char v72 = v13;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v73 options:v71 animations:0.2 completion:v62];
    if ((v17 & 1) == 0)
    {
      memset(&v70, 0, sizeof(v70));
      if (v6)
      {
        CGAffineTransformMakeScale(&v70, 0.9, 0.9);
      }
      else
      {
        long long v64 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v70.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v70.c = v64;
        *(_OWORD *)&v70.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      }
      id v65 = (void *)[objc_alloc(MEMORY[0x1E4FB1ED8]) initWithDuration:v63 timingParameters:0.0];
      [(SearchUICollectionViewCell *)self setSelectionAnimator:v65];
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __93__SearchUICollectionViewCell_animateFocusScaleDownEffectIsHighlighted_isSelected_appearance___block_invoke_3;
      v67[3] = &unk_1E6E727A8;
      CGRect v68 = v12;
      CGAffineTransform v69 = v70;
      [v65 addAnimations:v67];
      [v65 startAnimationAfterDelay:v62];
    }
  }
}

void __93__SearchUICollectionViewCell_animateFocusScaleDownEffectIsHighlighted_isSelected_appearance___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  else {
    double v1 = 0.0;
  }
  id v2 = [*(id *)(a1 + 32) selectedOverlayView];
  [v2 setAlpha:v1];
}

void __93__SearchUICollectionViewCell_animateFocusScaleDownEffectIsHighlighted_isSelected_appearance___block_invoke_2(uint64_t a1)
{
  BOOL v1 = *(unsigned char *)(a1 + 40) == 0;
  id v2 = [*(id *)(a1 + 32) selectedOverlayView];
  [v2 setHidden:v1];
}

uint64_t __93__SearchUICollectionViewCell_animateFocusScaleDownEffectIsHighlighted_isSelected_appearance___block_invoke_3(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  v3[2] = *(_OWORD *)(a1 + 72);
  return [*(id *)(a1 + 32) setTransform:v3];
}

- (id)focusEffect
{
  if ([(SearchUICollectionViewCell *)self resolvedFocusStyle] == 2)
  {
    objc_super v3 = [MEMORY[0x1E4FB1788] effect];
    [v3 setContainerView:self];
  }
  else
  {
    objc_super v3 = 0;
  }
  return v3;
}

- (NSDirectionalEdgeInsets)_preferredSeparatorInsetsForProposedInsets:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double leading = a3.leading;
  double top = a3.top;
  if ([(SearchUICollectionViewCell *)self useSystemSizing]
    && ([(SearchUICollectionViewCell *)self rowModel],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 cardSection],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        BOOL v10 = +[SnippetUIUtilities supportsConfigurationForCardSection:v9], v9, v8, !v10))
  {
    v36.receiver = self;
    v36.super_class = (Class)SearchUICollectionViewCell;
    -[SearchUICollectionViewCell _preferredSeparatorInsetsForProposedInsets:](&v36, sel__preferredSeparatorInsetsForProposedInsets_, top, leading, bottom, trailing);
    double top = v28;
    double leading = v29;
    double bottom = v30;
    double trailing = v31;
  }
  else
  {
    uint64_t v11 = [(SearchUICollectionViewCell *)self sfSeparatorStyle];
    if (v11 != 1)
    {
      uint64_t v12 = v11;
      int v13 = [(SearchUICollectionViewCell *)self contentView];
      [v13 bounds];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v22 = [(SearchUICollectionViewCell *)self sizingView];
      objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

      int v23 = [(SearchUICollectionViewCell *)self sizingView];
      [v23 layoutIfNeeded];

      uint64_t v24 = [(SearchUICollectionViewCell *)self leadingView];
      double v25 = [(SearchUICollectionViewCell *)self leadingTextView];
      +[SearchUICardSectionView separatorInsetsForStyle:v12 cellView:self leadingView:v24 leadingTextView:v25];
      double leading = v26;
      double trailing = v27;

      [(SearchUICollectionViewCell *)self setNeedsLayout];
    }
  }
  double v32 = top;
  double v33 = leading;
  double v34 = bottom;
  double v35 = trailing;
  result.double trailing = v35;
  result.double bottom = v34;
  result.double leading = v33;
  result.double top = v32;
  return result;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SearchUICollectionViewCell;
  [(SearchUICollectionViewCell *)&v21 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  uint64_t v7 = [(SearchUICollectionViewCell *)self focusEffect];

  id v8 = [(SearchUICollectionViewCell *)self rowModel];
  uint64_t v9 = [v8 cardSection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (!v7)
  {
    uint64_t v11 = [v6 nextFocusedView];

    if (v11 == self)
    {
      if ((isKindOfClass & 1) == 0) {
        [(SearchUICollectionViewCell *)self setSelected:1];
      }
      [(SearchUICollectionViewCell *)self tlk_updateWithCurrentAppearance];
      uint64_t v12 = [(SearchUICollectionViewCell *)self delegate];
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        double v14 = [(SearchUICollectionViewCell *)self delegate];
        double v15 = [(SearchUICollectionViewCell *)self rowModel];
        double v16 = [v15 identifyingResult];
        double v17 = [(SearchUICollectionViewCell *)self rowModel];
        double v18 = [v17 cardSection];
        [v14 didUpdateKeyboardFocusToResult:v16 cardSection:v18];
      }
    }
    else
    {
      [(SearchUICollectionViewCell *)self setSelected:0];
    }
  }
  if (isKindOfClass)
  {
    [(SearchUICollectionViewCell *)self setHighlighted:0];
    double v19 = [v6 nextFocusedView];
    double v20 = [(SearchUICollectionViewCell *)self viewForForcedFocus];

    if (v19 == v20) {
      [(SearchUICollectionViewCell *)self setupManualFocus];
    }
    else {
      [(SearchUICollectionViewCell *)self removeManualFocus];
    }
  }
}

- (BOOL)isExpandable
{
  return 0;
}

- (BOOL)needsInternalFocus
{
  return 0;
}

- (BOOL)setupManualFocus
{
  return 0;
}

- (void)addLinkLayer:(id)a3
{
  id v8 = a3;
  id v4 = [(SearchUICollectionViewCell *)self linkLayer];

  BOOL v5 = [(SearchUICollectionViewCell *)self layer];
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = [(SearchUICollectionViewCell *)self linkLayer];
    [v6 replaceSublayer:v7 with:v8];
  }
  else
  {
    [v5 addSublayer:v8];
  }

  [(SearchUICollectionViewCell *)self setLinkLayer:v8];
}

- (int64_t)focusItemDeferralMode
{
  return 2;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 nextFocusedItem];
  id v6 = [v4 previouslyFocusedItem];

  if (v5 == v6)
  {
    id v8 = [(SearchUICollectionViewCell *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      BOOL v10 = [(SearchUICollectionViewCell *)self delegate];
      [v10 didUpdateKeyboardFocusToResult:0 cardSection:0];
    }
    BOOL v7 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SearchUICollectionViewCell;
    BOOL v7 = [(SearchUICollectionViewCell *)&v12 shouldUpdateFocusInContext:v4];
  }

  return v7;
}

- (NSArray)visibleResults
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(SearchUICollectionViewCell *)self rowModel];
  objc_super v3 = [v2 identifyingResult];

  if (v3)
  {
    v6[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

- (BOOL)highlightFrameMatchesHighlightView
{
  return 1;
}

- (CGRect)highlightFrame
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (double)highlightFrameCornerRadius
{
  return -1.0;
}

- (void)prepareForReuse
{
  v13.receiver = self;
  v13.super_class = (Class)SearchUICollectionViewCell;
  [(SearchUICollectionViewCell *)&v13 prepareForReuse];
  double v3 = [(SearchUICollectionViewCell *)self selectionAnimator];

  if (v3)
  {
    double v4 = [(SearchUICollectionViewCell *)self selectionAnimator];
    [v4 stopAnimation:1];

    double v5 = [(SearchUICollectionViewCell *)self selectionAnimator];
    [v5 finishAnimationAtPosition:2];

    [(SearchUICollectionViewCell *)self setSelectionAnimator:0];
  }
  [(SearchUICollectionViewCell *)self _removeAllAnimations:1];
  uint64_t v6 = [(SearchUICollectionViewCell *)self highlightReferenceView];
  BOOL v7 = (void *)v6;
  if (v6) {
    id v8 = (SearchUICollectionViewCell *)v6;
  }
  else {
    id v8 = self;
  }
  char v9 = v8;

  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v12[0] = *MEMORY[0x1E4F1DAB8];
  v12[1] = v10;
  v12[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(SearchUICollectionViewCell *)v9 setTransform:v12];
  uint64_t v11 = [(SearchUICollectionViewCell *)self selectedOverlayView];
  [v11 setHidden:1];

  +[SearchUIAppEntityAnnotator resetAnnotationForView:self];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = objc_msgSend(MEMORY[0x1E4FAE100], "tappableControlViewForPoint:inView:withEvent:", self, v7, x, y);
  char v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SearchUICollectionViewCell;
    -[SearchUICollectionViewCell hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v11 = v10;

  return v11;
}

- (BOOL)useSystemSizing
{
  return self->_useSystemSizing;
}

- (void)setUseSystemSizing:(BOOL)a3
{
  self->_useSystemSizing = a3;
}

- (UIView)leadingView
{
  return self->_leadingView;
}

- (UIView)leadingTextView
{
  return self->_leadingTextView;
}

- (int)sfSeparatorStyle
{
  return self->_sfSeparatorStyle;
}

- (CALayer)linkLayer
{
  return self->_linkLayer;
}

- (void)setLinkLayer:(id)a3
{
  self->_linkLayer = (CALayer *)a3;
}

- (_UIConstraintBasedLayoutHostingView)hostedSnippetUIView
{
  return self->_hostedSnippetUIView;
}

- (void)setHostedSnippetUIView:(id)a3
{
}

- (UIView)viewForForcedFocus
{
  return (UIView *)objc_getProperty(self, a2, 944, 1);
}

- (void)setDummyBackgroundView:(id)a3
{
}

- (void)setBackgroundPlatterView:(id)a3
{
}

- (UIView)selectedOverlayView
{
  return self->_selectedOverlayView;
}

- (void)setSelectedOverlayView:(id)a3
{
}

- (UIViewPropertyAnimator)selectionAnimator
{
  return self->_selectionAnimator;
}

- (void)setSelectionAnimator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragSource, 0);
  objc_storeStrong((id *)&self->_selectionAnimator, 0);
  objc_storeStrong((id *)&self->_selectedOverlayView, 0);
  objc_storeStrong((id *)&self->_backgroundPlatterView, 0);
  objc_storeStrong((id *)&self->_dummyBackgroundView, 0);
  objc_storeStrong((id *)&self->_viewForForcedFocus, 0);
  objc_storeStrong((id *)&self->_embeddedViewController, 0);
  objc_storeStrong((id *)&self->_hostedSnippetUIView, 0);
  objc_storeStrong((id *)&self->_leadingTextView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sizingView, 0);
  objc_storeStrong((id *)&self->_rowModel, 0);
}

@end