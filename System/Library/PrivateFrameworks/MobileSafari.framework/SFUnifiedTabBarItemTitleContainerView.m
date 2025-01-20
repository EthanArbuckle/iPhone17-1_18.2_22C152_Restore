@interface SFUnifiedTabBarItemTitleContainerView
- (BOOL)_iconIsSymbol;
- (BOOL)_shouldShowAvailabilityLabel;
- (BOOL)_shouldSlideArrangedViewForSearchField:(id)a3;
- (BOOL)_showsFakeClearButton;
- (BOOL)_showsPlaceholder;
- (BOOL)_showsView:(id)a3;
- (BOOL)_viewCollapsesWhenHidden:(id)a3;
- (BOOL)animateLockViewPosition;
- (BOOL)dimsText;
- (BOOL)hasFocusedSensitiveInputField;
- (BOOL)hidesIconForHover;
- (BOOL)isAnimatingResize;
- (BOOL)isCollapsed;
- (BOOL)isNarrow;
- (BOOL)leadingAlignsIcon;
- (BOOL)requiresTruncationToDisplayAvailabilityLabel:(id)a3;
- (BOOL)showsIcon;
- (BOOL)showsLockIcon;
- (BOOL)showsPrivateAnnotation;
- (BOOL)showsSearchField;
- (BOOL)showsSearchIcon;
- (BOOL)showsSquishedAccessoryViews;
- (BOOL)suppressesText;
- (BOOL)usesInsetFromLayoutMargins;
- (CGRect)_searchFieldFrame;
- (CGRect)iconFrame;
- (CGRect)titleRect;
- (CGSize)_preferredSizeForView:(id)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)lockSize;
- (CGSize)urlSize;
- (NSArray)_arrangedViews;
- (NSArray)_arrangedViewsByContentCompressionResistancePriority;
- (NSArray)squishedAccessoryViews;
- (NSDirectionalEdgeInsets)_effectiveDirectionalLayoutMargins;
- (NSString)placeholder;
- (NSString)textWhenExpanded;
- (NSString)title;
- (NSString)titleTextStyle;
- (NSString)titleWhenCollapsed;
- (SFUnifiedTabBarItemTitleContainerView)initWithAlignment:(int64_t)a3;
- (SFUnifiedTabBarItemTitleContainerViewTheme)theme;
- (UIEdgeInsets)_effectiveLayoutMargins;
- (UIFont)placeholderFont;
- (UIImage)icon;
- (UITextField)searchField;
- (double)_alphaForView:(id)a3;
- (double)_collapsedWidthForView:(id)a3;
- (double)_iconSize;
- (double)_spacingBetweenView:(id)a3 nextView:(id)a4;
- (double)contentOffset;
- (double)iconAlpha;
- (double)leadingIconOffset;
- (double)maximumIconWidth;
- (double)minimumWidthToShowTitle;
- (double)spacing;
- (double)titleToSearchIconSpacing;
- (double)urlBaselineToBottomBoundsDistanceForHeight:(double)a3;
- (double)urlCapHeightToTopBoundsDistanceForHeight:(double)a3;
- (id)_lastVisibleViewInViews:(id)a3;
- (id)_placeholderText;
- (id)_squishedAccessorySymbolConfiguration;
- (id)_squishedIconView;
- (id)_squishedLockView;
- (id)_titleFontWithTraitCollection:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)alignment;
- (int64_t)lockIconEdge;
- (int64_t)securityAnnotation;
- (unint64_t)startIndexOfTitleInTextWhenExpanded;
- (void)_layOutFakeClearButtonUsingPresentationFrame:(BOOL)a3;
- (void)_layOutSearchField;
- (void)_layoutArrangedViews;
- (void)_layoutSquishedAccessoryView:(id)a3 forView:(id)a4;
- (void)_layoutSquishedAccessoryViews;
- (void)_leadingAlignCenteredIconIfNeeded;
- (void)_setShowsFakeClearButton:(BOOL)a3;
- (void)_slideArrangedViewsForSearchField:(double)a3;
- (void)_updateAlignmentForAvailabilityLabel:(id)a3;
- (void)_updateIcon;
- (void)_updateIconSpacing;
- (void)_updateOffsetOfTitleInSearchField;
- (void)_updateSearchFieldColor;
- (void)_updateSecurityAnnotation;
- (void)_updateSecurityAnnotationAnimated:(BOOL)a3;
- (void)_updateSquishedAccessorySymbolConfigurations;
- (void)_updateTitle;
- (void)_updateTitleColor;
- (void)_updateTitleFont;
- (void)beginTitleTextStyleAnimation;
- (void)beginTransitioningSearchField;
- (void)dismissAvailabilityLabelAnimated:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)endTitleTextStyleAnimation;
- (void)endTransitioningSearchField;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)presentAvailabilityLabelWithText:(id)a3;
- (void)setAlignment:(int64_t)a3;
- (void)setAnimateLockViewPosition:(BOOL)a3;
- (void)setAnimatingResize:(BOOL)a3;
- (void)setCollapsed:(BOOL)a3;
- (void)setContentOffset:(double)a3;
- (void)setDimsText:(BOOL)a3;
- (void)setHasFocusedSensitiveInputField:(BOOL)a3;
- (void)setHidesIconForHover:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIconAlpha:(double)a3;
- (void)setLeadingAlignsIcon:(BOOL)a3;
- (void)setLockIconEdge:(int64_t)a3;
- (void)setPlaceholder:(id)a3;
- (void)setPlaceholderFont:(id)a3;
- (void)setSearchField:(id)a3;
- (void)setSecurityAnnotation:(int64_t)a3;
- (void)setShowsIcon:(BOOL)a3;
- (void)setShowsLockIcon:(BOOL)a3;
- (void)setShowsPrivateAnnotation:(BOOL)a3;
- (void)setShowsSearchField:(BOOL)a3;
- (void)setShowsSearchIcon:(BOOL)a3;
- (void)setShowsSquishedAccessoryViews:(BOOL)a3;
- (void)setSpacing:(double)a3;
- (void)setStartIndexOfTitleInTextWhenExpanded:(unint64_t)a3;
- (void)setSuppressesText:(BOOL)a3;
- (void)setTextWhenExpanded:(id)a3;
- (void)setTheme:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleTextStyle:(id)a3;
- (void)setTitleToSearchIconSpacing:(double)a3;
- (void)setTitleWhenCollapsed:(id)a3;
- (void)setUsesInsetFromLayoutMargins:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SFUnifiedTabBarItemTitleContainerView

uint64_t __61__SFUnifiedTabBarItemTitleContainerView_intrinsicContentSize__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _showsView:a2];
}

- (BOOL)_showsPlaceholder
{
  return !self->_collapsed && [(NSString *)self->_title length] == 0;
}

- (void)_layoutArrangedViews
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  [(SFUnifiedTabBarItemTitleContainerView *)self bounds];
  CGFloat x = v63.origin.x;
  CGFloat y = v63.origin.y;
  CGFloat width = v63.size.width;
  CGFloat height = v63.size.height;
  double v7 = CGRectGetWidth(v63);
  v64.origin.CGFloat x = x;
  v64.origin.CGFloat y = y;
  v64.size.CGFloat width = width;
  v64.size.CGFloat height = height;
  CGFloat v36 = CGRectGetHeight(v64);
  BOOL v37 = [(UIView *)self _sf_usesLeftToRightLayout];
  [(SFUnifiedTabBarItemTitleContainerView *)self _effectiveDirectionalLayoutMargins];
  double v38 = v8;
  double v10 = v9;
  v40 = [(SFUnifiedTabBarItemTitleContainerView *)self _arrangedViews];
  v39 = [(SFUnifiedTabBarItemTitleContainerView *)self _lastVisibleViewInViews:v40];
  if (v39)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke;
    aBlock[3] = &unk_1E54EBDB8;
    aBlock[4] = self;
    v11 = (void (**)(void *, uint64_t, void *))_Block_copy(aBlock);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v12 = [(SFUnifiedTabBarItemTitleContainerView *)self _arrangedViewsByContentCompressionResistancePriority];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v56 objects:v61 count:16];
    double v35 = v38 + v10;
    double v14 = v7 - (v38 + v10);
    if (v13)
    {
      uint64_t v15 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v57 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(SFURLLabel **)(*((void *)&v56 + 1) + 8 * i);
          BOOL v18 = [(SFUnifiedTabBarItemTitleContainerView *)self _showsView:v17];
          [(SFUnifiedTabBarItemTitleContainerView *)self _preferredSizeForView:v17];
          double v20 = v19;
          double v22 = v21;
          if (v18)
          {
            [(SFUnifiedTabBarItemTitleContainerView *)self _collapsedWidthForView:v17];
            double v24 = fmax(fmin(v20, v14), v23);
            BOOL v25 = v24 + 15.0 > v14 && v17 == self->_leadingAnnotationLabel;
            double v20 = v25 ? v14 + -15.0 : v24;
            double v14 = v14 - v20;
            if (v17 != v39)
            {
              v26 = v11[2](v11, [v40 indexOfObject:v17], v40);
              [(SFUnifiedTabBarItemTitleContainerView *)self _spacingBetweenView:v17 nextView:v26];
              double v28 = v27;

              double v14 = v14 - v28;
            }
          }
          if (v17 != (SFURLLabel *)self->_iconView)
          {
            v65.origin.CGFloat x = x;
            v65.origin.CGFloat y = y;
            v65.size.CGFloat width = width;
            v65.size.CGFloat height = height;
            double v22 = CGRectGetHeight(v65);
          }
          -[SFURLLabel setBounds:](v17, "setBounds:", 0.0, 0.0, v20, v22);
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v13);
    }

    uint64_t v52 = 0;
    v53 = (double *)&v52;
    double v29 = v38;
    uint64_t v54 = 0x2020000000;
    double v55 = v38;
    if (self->_narrow || self->_alignment == 1)
    {
      double v30 = _SFRoundFloatToPixels((v35 + v14) * 0.5);
      v31 = v53;
      double v29 = fmax(v38, fmin(v38 + v14, v30));
      v53[3] = v29;
      v32 = v31 + 3;
    }
    else
    {
      v32 = &v55;
    }
    double *v32 = self->_contentOffset + v29;
    BOOL v33 = self->_showsSearchField || self->_suppressesText;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke_2;
    v41[3] = &unk_1E54EBE30;
    v41[4] = self;
    CGFloat v45 = v36;
    v34 = v11;
    v43 = v34;
    BOOL v50 = v33;
    id v42 = v40;
    v44 = &v52;
    CGFloat v46 = x;
    CGFloat v47 = y;
    CGFloat v48 = width;
    CGFloat v49 = height;
    BOOL v51 = v37;
    [v42 enumerateObjectsUsingBlock:v41];
    [(SFUnifiedTabBarItemTitleContainerView *)self _leadingAlignCenteredIconIfNeeded];

    _Block_object_dispose(&v52, 8);
  }
}

- (CGSize)_preferredSizeForView:(id)a3
{
  if (self->_iconView == a3)
  {
    [(SFUnifiedTabBarItemTitleContainerView *)self _iconSize];
    if (self->_showsSearchIcon && !self->_collapsed)
    {
      iconView = self->_iconView;
      [(SFFaviconView *)iconView intrinsicContentSize];
    }
    else
    {
      double v6 = v5;
    }
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB30];
    double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    objc_msgSend(a3, "sizeThatFits:", v3, v4);
  }
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

void __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) _showsView:v3];
  [v3 bounds];
  double v6 = v5;
  double v8 = v7;
  if ((v4 & 1) == 0 && [*(id *)(a1 + 32) _viewCollapsesWhenHidden:v3])
  {
    [*(id *)(a1 + 32) _collapsedWidthForView:v3];
    double v6 = v9;
  }
  double v10 = _SFRoundFloatToPixels((*(double *)(a1 + 64) - v8) * 0.5);
  v11 = *(void **)(a1 + 32);
  v12 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [v11 _spacingBetweenView:v3 nextView:v12];
  double v14 = v13;

  uint64_t v15 = *(void *)(a1 + 32);
  BOOL v16 = *(id *)(v15 + 456) != v3 || *(unsigned char *)(v15 + 523) == 0;
  id v17 = *(id *)(v15 + 416);
  BOOL v18 = v17 == v3 && *(unsigned char *)(v15 + 520) != 0;
  uint64_t v19 = *(void *)(v15 + 472);
  if (v19)
  {
    LODWORD(v19) = *(unsigned char *)(v15 + 523) == 0;
    if (v17 == v3 && *(unsigned char *)(v15 + 523) == 0) {
      LODWORD(v19) = *(void *)(v15 + 408) == 1;
    }
  }
  if (*(unsigned char *)(a1 + 104)) {
    int v21 = 1;
  }
  else {
    int v21 = v18 | v19;
  }
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke_4;
  v50[3] = &unk_1E54EBDE0;
  id v22 = v3;
  char v53 = v4;
  char v54 = v21;
  double v23 = *(void **)(a1 + 32);
  id v51 = v22;
  uint64_t v52 = v23;
  if (v16)
  {
    double v24 = 0.0;
    id v25 = v22;
    if (((v4 ^ 1 | v21) & 1) == 0)
    {
      objc_msgSend(v23, "_alphaForView:", v22, 0.0);
      id v25 = v51;
    }
    [v25 setAlpha:v24];
  }
  else
  {
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v50];
  }
  uint64_t v26 = *(void *)(a1 + 32);
  if (*(id *)(v26 + 424) != v22 || *(unsigned char *)(v26 + 523) || *(unsigned char *)(v26 + 518)) {
    int v27 = 1;
  }
  else {
    int v27 = [v22 isAnimatingTextSize];
  }
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke_5;
  v46[3] = &unk_1E54EAAC0;
  id v28 = v22;
  double v29 = v28;
  id v47 = v28;
  double v48 = v6;
  double v49 = v8;
  if (v27)
  {
    objc_msgSend(v28, "setBounds:", 0.0, 0.0, v6, v8);
    [v47 layoutIfNeeded];
  }
  else
  {
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v46];
  }
  uint64_t v30 = *(void *)(a1 + 32);
  BOOL v31 = *(void **)(v30 + 456) != v29
     || *(unsigned char *)(v30 + 527)
     || *(unsigned char *)(v30 + 518)
     || *(void *)(v30 + 408) == 1
     || *(void *)(v30 + 640) != 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke_6;
  v34[3] = &unk_1E54EBE08;
  uint64_t v37 = *(void *)(a1 + 56);
  double v38 = v10;
  double v39 = v6;
  double v40 = v8;
  id v32 = v29;
  uint64_t v33 = *(void *)(a1 + 32);
  id v35 = v32;
  uint64_t v36 = v33;
  char v44 = v4;
  double v41 = v14;
  long long v42 = *(_OWORD *)(a1 + 72);
  long long v43 = *(_OWORD *)(a1 + 88);
  char v45 = *(unsigned char *)(a1 + 105);
  if (v31)
  {
    __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke_6((uint64_t)v34);
    if (!v4) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v34];
  if (v4) {
LABEL_41:
  }
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6
                                                                + v14
                                                                + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24);
LABEL_42:
}

- (double)_spacingBetweenView:(id)a3 nextView:(id)a4
{
  double v6 = (SFFaviconView *)a3;
  id v7 = a4;
  double v8 = v7;
  double iconSpacing = 0.0;
  if (v6 && v7)
  {
    if (self->_iconView == v6)
    {
      double iconSpacing = self->_iconSpacing;
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __70__SFUnifiedTabBarItemTitleContainerView__spacingBetweenView_nextView___block_invoke;
      v12[3] = &unk_1E54EBE58;
      double v13 = v6;
      id v14 = v8;
      double v10 = (unsigned int (**)(void *, SFFaviconView *))_Block_copy(v12);
      if (v10[2](v10, self->_iconView) && v10[2](v10, (SFFaviconView *)self->_lockView) && self->_showsSearchIcon)
      {
        double iconSpacing = self->_iconSpacing;
      }
      else if (self->_spacing == 0.0)
      {
        double iconSpacing = 4.0;
      }
      else
      {
        double iconSpacing = self->_spacing;
      }
    }
  }

  return iconSpacing;
}

id __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  double v6 = v5;
  for (unint64_t i = a2 + 1; i < [v5 count]; ++i)
  {
    double v8 = [v6 objectAtIndexedSubscript:i];
    if ([*(id *)(a1 + 32) _showsView:v8]) {
      goto LABEL_6;
    }

    id v5 = v6;
  }
  double v8 = 0;
LABEL_6:

  return v8;
}

- (BOOL)_showsView:(id)a3
{
  int v4 = (SFFaviconView *)a3;
  id v5 = v4;
  if (self->_narrow && self->_iconView != v4) {
    goto LABEL_6;
  }
  iconView = self->_iconView;
  if (self->_collapsed)
  {
    if (iconView == v4)
    {
LABEL_12:
      if (self->_alignment == 1 && !self->_leadingAlignsIcon)
      {
        double v9 = [(SFFaviconView *)v4 icon];

        if (!v9) {
          goto LABEL_6;
        }
      }
      if (!self->_showsIcon)
      {
        uint64_t v8 = 514;
        goto LABEL_19;
      }
LABEL_16:
      BOOL v7 = 1;
      goto LABEL_23;
    }
    if ((SFFaviconView *)self->_titleLabel != v4)
    {
LABEL_6:
      BOOL v7 = 0;
      goto LABEL_23;
    }
  }
  if (iconView == v4) {
    goto LABEL_12;
  }
  if ((SFFaviconView *)self->_lockView == v4)
  {
    uint64_t v8 = 528;
    goto LABEL_19;
  }
  if ((SFFaviconView *)self->_leadingAnnotationLabel != v4)
  {
    if ((SFFaviconView *)self->_trailingAnnotationLabel == v4)
    {
      uint64_t v8 = 515;
LABEL_19:
      BOOL v10 = *((unsigned char *)&self->super.super.super.isa + v8) == 0;
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  BOOL v10 = self->_securityAnnotation == 0;
LABEL_20:
  BOOL v7 = !v10;
LABEL_23:

  return v7;
}

uint64_t __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  double v4 = *(double *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5 == *(void *)(v2 + 416) && !*(unsigned char *)(a1 + 120)) {
    double v3 = v3 - (v4 + *(double *)(a1 + 80));
  }
  double v6 = *(double *)(a1 + 56);
  CGFloat v7 = *(double *)(a1 + 72);
  if (v5 == *(void *)(v2 + 456)) {
    double v6 = v6 - _SFOnePixel();
  }
  _SFFlipRectInCoordinateSpace(*(unsigned char *)(a1 + 121) == 0, v3, v6, v4, v7, *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 104), *(CGFloat *)(a1 + 112));
  UIRectGetCenter();
  uint64_t v8 = *(void **)(a1 + 32);

  return objc_msgSend(v8, "setCenter:");
}

- (BOOL)_viewCollapsesWhenHidden:(id)a3
{
  return self->_leadingAnnotationLabel == a3 || self->_titleLabel == a3;
}

BOOL __70__SFUnifiedTabBarItemTitleContainerView__spacingBetweenView_nextView___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2 || *(void *)(a1 + 40) == a2;
}

- (double)_collapsedWidthForView:(id)a3
{
  double result = 0.0;
  if (self->_titleLabel == a3) {
    return 15.0;
  }
  return result;
}

- (NSArray)_arrangedViews
{
  v11[5] = *MEMORY[0x1E4F143B8];
  if (self->_lockIconEdge == 1)
  {
    uint64_t v2 = &OBJC_IVAR___SFUnifiedTabBarItemTitleContainerView__lockView;
    v11[0] = self->_iconView;
    double v3 = &OBJC_IVAR___SFUnifiedTabBarItemTitleContainerView__titleLabel;
    double v4 = &OBJC_IVAR___SFUnifiedTabBarItemTitleContainerView__leadingAnnotationLabel;
    p_leadingAnnotationLabel = (SFURLLabel **)v11;
  }
  else
  {
    uint64_t v2 = &OBJC_IVAR___SFUnifiedTabBarItemTitleContainerView__titleLabel;
    leadingAnnotationLabel = self->_leadingAnnotationLabel;
    double v3 = &OBJC_IVAR___SFUnifiedTabBarItemTitleContainerView__iconView;
    double v4 = &OBJC_IVAR___SFUnifiedTabBarItemTitleContainerView__lockView;
    p_leadingAnnotationLabel = &leadingAnnotationLabel;
  }
  double v6 = *(SFURLLabel **)((char *)&self->super.super.super.isa + *v3);
  p_leadingAnnotationLabel[1] = *(SFURLLabel **)((char *)&self->super.super.super.isa + *v4);
  p_leadingAnnotationLabel[2] = v6;
  trailingAnnotationLabel = self->_trailingAnnotationLabel;
  p_leadingAnnotationLabel[3] = *(SFURLLabel **)((char *)&self->super.super.super.isa + *v2);
  p_leadingAnnotationLabel[4] = (SFURLLabel *)trailingAnnotationLabel;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");

  return (NSArray *)v8;
}

- (double)_alphaForView:(id)a3
{
  if (self->_iconView == a3 && !self->_showsSearchIcon) {
    return self->_iconAlpha;
  }
  double result = 0.85;
  if (!self->_dimsText) {
    return 1.0;
  }
  return result;
}

- (double)_iconSize
{
  return 18.0;
}

- (void)_leadingAlignCenteredIconIfNeeded
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (self->_alignment == 1
    && self->_leadingAlignsIcon
    && [(SFUnifiedTabBarItemTitleContainerView *)self _showsView:self->_iconView])
  {
    [(SFUnifiedTabBarItemTitleContainerView *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    [(SFUnifiedTabBarItemTitleContainerView *)self _iconSize];
    double v12 = v11;
    BOOL v13 = [(UIView *)self _sf_usesLeftToRightLayout];
    [(SFUnifiedTabBarItemTitleContainerView *)self directionalLayoutMargins];
    CGFloat v15 = v14;
    v39.origin.CGFloat x = v4;
    v39.origin.CGFloat y = v6;
    v39.size.CGFloat width = v8;
    v39.size.CGFloat height = v10;
    CGFloat Height = CGRectGetHeight(v39);
    double v17 = _SFFlipRectInCoordinateSpace(!v13, v15, (Height - v12) * 0.5, v12, v12, v4, v6, v8, v10);
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    [(SFFaviconView *)self->_iconView frame];
    double MinX = CGRectGetMinX(v40);
    v41.origin.CGFloat x = v17;
    v41.origin.CGFloat y = v19;
    v41.size.CGFloat width = v21;
    v41.size.CGFloat height = v23;
    double v25 = fmin(vabdd_f64(MinX, CGRectGetMinX(v41)), (v12 + self->_iconSpacing) * 0.5);
    long long v33 = 0u;
    long long v34 = 0u;
    if (v13) {
      double v26 = -v25;
    }
    else {
      double v26 = v25;
    }
    long long v35 = 0uLL;
    long long v36 = 0uLL;
    int v27 = [(SFUnifiedTabBarItemTitleContainerView *)self _arrangedViews];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v34 != v30) {
            objc_enumerationMutation(v27);
          }
          id v32 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          [v32 frame];
          CGRect v43 = CGRectOffset(v42, v26, 0.0);
          objc_msgSend(v32, "setFrame:", v43.origin.x, v43.origin.y, v43.size.width, v43.size.height);
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v29);
    }

    -[SFFaviconView setFrame:](self->_iconView, "setFrame:", v17, v19, v21, v23);
  }
}

- (id)_lastVisibleViewInViews:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  CGFloat v4 = objc_msgSend(a3, "reverseObjectEnumerator", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([(SFUnifiedTabBarItemTitleContainerView *)self _showsView:v9])
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (NSDirectionalEdgeInsets)_effectiveDirectionalLayoutMargins
{
  if (self->_usesInsetFromLayoutMargins && !self->_narrow)
  {
    [(SFUnifiedTabBarItemTitleContainerView *)self directionalLayoutMargins];
  }
  else
  {
    double v2 = *MEMORY[0x1E4FB12A8];
    double v3 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
    double v4 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
    double v5 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
  }
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (NSArray)_arrangedViewsByContentCompressionResistancePriority
{
  v6[5] = *MEMORY[0x1E4F143B8];
  lockView = self->_lockView;
  v6[0] = self->_iconView;
  v6[1] = lockView;
  leadingAnnotationLabel = self->_leadingAnnotationLabel;
  v6[2] = self->_trailingAnnotationLabel;
  v6[3] = leadingAnnotationLabel;
  v6[4] = self->_titleLabel;
  double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];

  return (NSArray *)v4;
}

uint64_t __54__SFUnifiedTabBarItemTitleContainerView_setCollapsed___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_updateIconSpacing
{
  int64_t alignment = self->_alignment;
  if (alignment == 1)
  {
    [(SFFaviconView *)self->_iconView trailingInset];
    double titleToSearchIconSpacing = fmax(6.0 - v5, 0.0);
  }
  else
  {
    double titleToSearchIconSpacing = 0.0;
    if (!alignment) {
      double titleToSearchIconSpacing = 6.0;
    }
  }
  if (self->_showsSearchIcon && ![(SFUnifiedTabBarItemTitleContainerView *)self _showsPlaceholder]) {
    double titleToSearchIconSpacing = self->_titleToSearchIconSpacing;
  }
  if (self->_iconSpacing != titleToSearchIconSpacing)
  {
    self->_double iconSpacing = titleToSearchIconSpacing;
    [(SFUnifiedTabBarItemTitleContainerView *)self setNeedsLayout];
  }
}

- (void)setUsesInsetFromLayoutMargins:(BOOL)a3
{
  self->_usesInsetFromLayoutMargins = a3;
}

- (void)setTitleToSearchIconSpacing:(double)a3
{
  if (self->_titleToSearchIconSpacing != a3)
  {
    self->_double titleToSearchIconSpacing = a3;
    [(SFUnifiedTabBarItemTitleContainerView *)self _updateIconSpacing];
  }
}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    [(SFUnifiedTabBarItemTitleContainerView *)self _updateIcon];
    [(SFUnifiedTabBarItemTitleContainerView *)self _updateTitle];
    [(SFUnifiedTabBarItemTitleContainerView *)self setNeedsLayout];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __54__SFUnifiedTabBarItemTitleContainerView_setCollapsed___block_invoke;
    v4[3] = &unk_1E54E9858;
    v4[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v4];
  }
}

- (void)_updateIcon
{
  if (self->_showsSearchIcon && !self->_collapsed)
  {
    [(SFFaviconView *)self->_iconView setIconContentMode:4];
    if ([(SFUnifiedTabBarItemTitleContainerView *)self _showsPlaceholder])
    {
      uint64_t v5 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:self->_titleTextStyle scale:2];
    }
    else
    {
      uint64_t v5 = 0;
    }
    id v7 = (id)v5;
    uint64_t v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"magnifyingglass" withConfiguration:v5];
    [(SFFaviconView *)self->_iconView setIcon:v6];
  }
  else
  {
    [(SFFaviconView *)self->_iconView setIconContentMode:1];
    icon = self->_icon;
    iconView = self->_iconView;
    [(SFFaviconView *)iconView setIcon:icon];
  }
}

- (void)setAnimateLockViewPosition:(BOOL)a3
{
  self->_animateLockViewPosition = a3;
}

- (SFUnifiedTabBarItemTitleContainerView)initWithAlignment:(int64_t)a3
{
  v30.receiver = self;
  v30.super_class = (Class)SFUnifiedTabBarItemTitleContainerView;
  double v4 = -[SFUnifiedTabBarItemTitleContainerView initWithFrame:](&v30, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_int64_t alignment = a3;
    v4->_collapsed = 1;
    uint64_t v6 = _WBSLocalizedString();
    placeholder = v5->_placeholder;
    v5->_placeholder = (NSString *)v6;

    v5->_double iconSpacing = 6.0;
    objc_storeStrong((id *)&v5->_titleTextStyle, (id)*MEMORY[0x1E4FB28C8]);
    v5->_usesInsetFromLayoutMargins = 1;
    v5->_double titleToSearchIconSpacing = 6.0;
    CGFloat v8 = [[SFURLLabel alloc] initWithFadeOutDistance:9.5];
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v8;

    [(SFURLLabel *)v5->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(SFUnifiedTabBarItemTitleContainerView *)v5 addSubview:v5->_titleLabel];
    id v10 = objc_alloc_init(SFFaviconView);
    iconView = v5->_iconView;
    v5->_iconView = v10;

    long long v12 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:v5->_titleTextStyle scale:1];
    [(SFFaviconView *)v5->_iconView setPreferredSymbolConfiguration:v12];
    [(SFUnifiedTabBarItemTitleContainerView *)v5 addSubview:v5->_iconView];
    id v13 = objc_alloc(MEMORY[0x1E4FB1838]);
    long long v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"lock.fill"];
    uint64_t v15 = [v13 initWithImage:v14];
    lockView = v5->_lockView;
    v5->_lockView = (UIImageView *)v15;

    [(UIImageView *)v5->_lockView setPreferredSymbolConfiguration:v12];
    [(UIImageView *)v5->_lockView setContentMode:4];
    [(SFUnifiedTabBarItemTitleContainerView *)v5 addSubview:v5->_lockView];
    uint64_t v17 = [[SFURLLabel alloc] initWithFadeOutDistance:9.5];
    leadingAnnotationLabel = v5->_leadingAnnotationLabel;
    v5->_leadingAnnotationLabel = v17;

    [(SFURLLabel *)v5->_leadingAnnotationLabel setTextAlignmentEdge:0];
    [(SFURLLabel *)v5->_leadingAnnotationLabel setFadeOutEdge:1];
    [(SFURLLabel *)v5->_leadingAnnotationLabel setAdjustsFontForContentSizeCategory:1];
    [(SFURLLabel *)v5->_leadingAnnotationLabel setClipsToBounds:1];
    double v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(SFURLLabel *)v5->_leadingAnnotationLabel setTextColor:v19];

    [(SFUnifiedTabBarItemTitleContainerView *)v5 addSubview:v5->_leadingAnnotationLabel];
    double v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    trailingAnnotationLabel = v5->_trailingAnnotationLabel;
    v5->_trailingAnnotationLabel = v20;

    [(UILabel *)v5->_trailingAnnotationLabel setAdjustsFontForContentSizeCategory:1];
    double v22 = _WBSLocalizedString();
    [(UILabel *)v5->_trailingAnnotationLabel setText:v22];

    double v23 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v5->_trailingAnnotationLabel setTextColor:v23];

    [(SFUnifiedTabBarItemTitleContainerView *)v5 addSubview:v5->_trailingAnnotationLabel];
    [(SFUnifiedTabBarItemTitleContainerView *)v5 setAccessibilityIdentifier:@"TabBarItemTitleContainer"];
    double v24 = objc_alloc_init(SFUnifiedTabBarItemTitleContainerViewTheme);
    [(SFUnifiedTabBarItemTitleContainerView *)v5 setTheme:v24];

    objc_initWeak(&location, v5);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __59__SFUnifiedTabBarItemTitleContainerView_initWithAlignment___block_invoke;
    v27[3] = &unk_1E54EA1B8;
    objc_copyWeak(&v28, &location);
    [(SFFaviconView *)v5->_iconView setTrailingInsetChangeHandler:v27];
    double v25 = v5;
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)SFUnifiedTabBarItemTitleContainerView;
  [(SFUnifiedTabBarItemTitleContainerView *)&v8 layoutSubviews];
  BOOL v3 = (self->_showsSearchIcon
     || self->_collapsed
     || [(SFUnifiedTabBarItemTitleContainerView *)self _showsPlaceholder])
    && !self->_titleLanguageIsRightToLeft;
  [(SFURLLabel *)self->_titleLabel setTextAlignmentEdge:!v3];
  [(SFURLLabel *)self->_titleLabel setFadeOutEdge:v3];
  [(SFURLLabel *)self->_availabilityLabel setAlpha:(double)[(SFUnifiedTabBarItemTitleContainerView *)self _shouldShowAvailabilityLabel]];
  [(SFUnifiedTabBarItemTitleContainerView *)self bounds];
  double Width = CGRectGetWidth(v9);
  if (Width != 0.0)
  {
    BOOL collapsed = self->_collapsed;
    if (collapsed)
    {
      double v6 = Width;
      [(SFUnifiedTabBarItemTitleContainerView *)self minimumWidthToShowTitle];
      BOOL collapsed = v6 < v7;
    }
    self->_narrow = collapsed;
    [(SFUnifiedTabBarItemTitleContainerView *)self _layoutArrangedViews];
    [(SFUnifiedTabBarItemTitleContainerView *)self _layOutSearchField];
    [(SFUnifiedTabBarItemTitleContainerView *)self _layoutSquishedAccessoryViews];
  }
}

- (BOOL)_shouldShowAvailabilityLabel
{
  return self->_availabilityLabel && !self->_collapsed && !self->_showsSearchField;
}

- (void)_updateTitleColor
{
  BOOL v3 = [(SFUnifiedTabBarItemTitleContainerView *)self _showsPlaceholder];
  theme = self->_theme;
  if (v3) {
    [(SFUnifiedTabBarItemTitleContainerViewTheme *)theme placeholderTextColor];
  }
  else {
  id v5 = [(SFUnifiedTabBarItemTitleContainerViewTheme *)theme primaryTextColor];
  }
  [(SFFaviconView *)self->_iconView setTintColor:v5];
  [(SFURLLabel *)self->_titleLabel setTextColor:v5];
}

- (void)_layoutSquishedAccessoryViews
{
  [(SFUnifiedTabBarItemTitleContainerView *)self _layoutSquishedAccessoryView:self->_squishedIconView forView:self->_iconView];
  squishedLockView = self->_squishedLockView;
  lockView = self->_lockView;

  [(SFUnifiedTabBarItemTitleContainerView *)self _layoutSquishedAccessoryView:squishedLockView forView:lockView];
}

- (void)_layoutSquishedAccessoryView:(id)a3 forView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = v7;
  if (v6)
  {
    [v7 setHidden:self->_showsSquishedAccessoryViews];
    objc_msgSend(v6, "setHidden:", -[SFUnifiedTabBarItemTitleContainerView _showsView:](self, "_showsView:", v8) ^ 1);
    if (self->_showsSquishedAccessoryViews)
    {
      [v6 sizeToFit];
      CGRect v9 = [v8 superview];
      [v8 center];
      double v11 = v10;
      double v13 = v12;
      long long v14 = [v6 superview];
      objc_msgSend(v9, "convertPoint:toView:", v14, v11, v13);
      double v16 = v15;
      double v18 = v17;

      if (_SFPointIsInvalid())
      {
        double v19 = WBS_LOG_CHANNEL_PREFIXTabBar();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
          -[SFUnifiedTabBarItemTitleContainerView _layoutSquishedAccessoryView:forView:](v19, v6, (uint64_t)v8);
        }
      }
      else
      {
        objc_msgSend(v6, "setCenter:", v16, v18);
        [v6 frame];
        [v6 setFrame:_SFRoundRectToPixels(v20)];
        [v8 alpha];
        objc_msgSend(v6, "setAlpha:");
      }
    }
  }
}

- (void)_layOutSearchField
{
  if (self->_searchField)
  {
    if (([MEMORY[0x1E4FB1EB0] areAnimationsEnabled] & 1) == 0)
    {
      BOOL v3 = [(UITextField *)self->_searchField layer];
      [v3 removeAllAnimations];
    }
    [(SFUnifiedTabBarItemTitleContainerView *)self _updateOffsetOfTitleInSearchField];
    [(SFUnifiedTabBarItemTitleContainerView *)self _searchFieldFrame];
    double v8 = v5;
    double v9 = v6;
    double v10 = v7;
    if (self->_showsSearchField)
    {
      double v11 = v4;
      CGFloat v12 = CGRectGetMinX(*(CGRect *)&v4) + self->_offsetOfTitleInSearchField;
      [(SFURLLabel *)self->_titleLabel frame];
      [(SFUnifiedTabBarItemTitleContainerView *)self _slideArrangedViewsForSearchField:v12 - CGRectGetMinX(v16)];
    }
    else
    {
      [(SFURLLabel *)self->_titleLabel frame];
      double v11 = CGRectGetMinX(v17) - self->_offsetOfTitleInSearchField;
    }
    -[UITextField setFrame:](self->_searchField, "setFrame:", v11, v8, v9, v10);
    LOBYTE(v13) = self->_showsSearchField;
    [(UITextField *)self->_searchField setAlpha:(double)v13];
    long long v14 = [(SFUnifiedTabBarItemTitleContainerView *)self _placeholderText];
    [(UITextField *)self->_searchField setPlaceholder:v14];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__SFUnifiedTabBarItemTitleContainerView__layOutSearchField__block_invoke;
    v15[3] = &unk_1E54E9858;
    v15[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v15];
    [(SFUnifiedTabBarItemTitleContainerView *)self _layOutFakeClearButtonUsingPresentationFrame:0];
  }
}

- (void)_updateTitleFont
{
  double v5 = [(SFUnifiedTabBarItemTitleContainerView *)self _titleFontWithTraitCollection:0];
  if (![(SFUnifiedTabBarItemTitleContainerView *)self _showsPlaceholder]
    || (placeholderFont = self->_placeholderFont) == 0)
  {
    placeholderFont = v5;
  }
  [(SFURLLabel *)self->_titleLabel setFont:placeholderFont];
  [(SFURLLabel *)self->_leadingAnnotationLabel setFont:v5];
  [(UILabel *)self->_trailingAnnotationLabel setFont:v5];
  double v4 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:self->_titleTextStyle scale:1];
  [(SFFaviconView *)self->_iconView setPreferredSymbolConfiguration:v4];
  [(UIImageView *)self->_lockView setPreferredSymbolConfiguration:v4];
}

- (id)_titleFontWithTraitCollection:(id)a3
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:self->_titleTextStyle compatibleWithTraitCollection:a3];
}

- (void)setTheme:(id)a3
{
  objc_storeStrong((id *)&self->_theme, a3);
  id v5 = a3;
  double v6 = [v5 secondaryTextColor];
  [(SFURLLabel *)self->_leadingAnnotationLabel setTextColor:v6];

  double v7 = [v5 secondaryTextColor];
  [(UILabel *)self->_trailingAnnotationLabel setTextColor:v7];

  double v8 = [v5 primaryTextColor];
  [(SFURLLabel *)self->_availabilityLabel setTextColor:v8];

  double v9 = [v5 primaryTextColor];
  [(UIImageView *)self->_squishedIconView setTintColor:v9];

  double v10 = [v5 themeColor];
  [(SFFaviconView *)self->_iconView setThemeColor:v10];

  double v11 = [v5 secondaryTextColor];
  [(UIImageView *)self->_squishedLockView setTintColor:v11];

  CGFloat v12 = [v5 secondaryTextColor];
  [(UIImageView *)self->_lockView setTintColor:v12];

  [(SFUnifiedTabBarItemTitleContainerView *)self _updateTitleColor];
  [(SFUnifiedTabBarItemTitleContainerView *)self _updateSecurityAnnotation];

  [(SFUnifiedTabBarItemTitleContainerView *)self _updateSearchFieldColor];
}

- (void)_updateSecurityAnnotation
{
  v22[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = _WBSLocalizedString();
  theme = self->_theme;
  if (theme)
  {
    id v5 = [(SFUnifiedTabBarItemTitleContainerViewTheme *)theme overrideTintColor];
    double v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [MEMORY[0x1E4FB1618] systemRedColor];
    }
    double v8 = v7;

    if (self->_hasFocusedSensitiveInputField)
    {
      id v9 = v8;
    }
    else
    {
      id v9 = [(SFUnifiedTabBarItemTitleContainerViewTheme *)self->_theme secondaryTextColor];
    }
    double v10 = v9;
    id v11 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint64_t v21 = *MEMORY[0x1E4FB0700];
    uint64_t v12 = v21;
    v22[0] = v10;
    unint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    long long v14 = (void *)[v11 initWithString:v3 attributes:v13];

    id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v19 = v12;
    CGRect v16 = [(SFUnifiedTabBarItemTitleContainerViewTheme *)self->_theme secondaryTextColor];
    double v20 = v16;
    CGRect v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    double v18 = (void *)[v15 initWithString:@" —" attributes:v17];

    [v14 appendAttributedString:v18];
    [(SFURLLabel *)self->_leadingAnnotationLabel setAttributedText:v14];
  }
  else
  {
    double v8 = [v3 stringByAppendingString:@" —"];
    [(SFURLLabel *)self->_leadingAnnotationLabel setText:v8];
  }
}

- (void)_updateSearchFieldColor
{
  BOOL v3 = [(SFUnifiedTabBarItemTitleContainerViewTheme *)self->_theme primaryTextColor];
  [(UITextField *)self->_searchField setTextColor:v3];

  id v5 = [(SFUnifiedTabBarItemTitleContainerViewTheme *)self->_theme placeholderTextColor];
  double v4 = [(UITextField *)self->_searchField _placeholderLabel];
  [v4 setTextColor:v5];
}

- (void)setTitleTextStyle:(id)a3
{
  id v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleTextStyle, a3);
    [(SFUnifiedTabBarItemTitleContainerView *)self _updateTitle];
  }
}

- (void)setHasFocusedSensitiveInputField:(BOOL)a3
{
  if (self->_hasFocusedSensitiveInputField != a3)
  {
    self->_hasFocusedSensitiveInputField = a3;
    [(SFUnifiedTabBarItemTitleContainerView *)self _updateSecurityAnnotation];
  }
}

void __61__SFUnifiedTabBarItemTitleContainerView_intrinsicContentSize__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  [*(id *)(a1 + 32) _preferredSizeForView:v11];
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = v5
                                                              + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 32);
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = fmax(*(double *)(*(void *)(*(void *)(a1 + 48) + 8)+ 40), v6);
  id v7 = [*(id *)(a1 + 40) lastObject];

  if (v7 != v11)
  {
    double v8 = *(void **)(a1 + 32);
    id v9 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3 + 1];
    [v8 _spacingBetweenView:v11 nextView:v9];
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = v10
                                                                + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 32);
  }
}

- (void)setShowsSearchIcon:(BOOL)a3
{
  if (self->_showsSearchIcon != a3)
  {
    self->_showsSearchIcon = a3;
    [(SFUnifiedTabBarItemTitleContainerView *)self _updateIcon];
    [(SFUnifiedTabBarItemTitleContainerView *)self _updateIconSpacing];
    [(SFUnifiedTabBarItemTitleContainerView *)self invalidateIntrinsicContentSize];
    [(SFUnifiedTabBarItemTitleContainerView *)self setNeedsLayout];
  }
}

- (NSString)titleTextStyle
{
  return self->_titleTextStyle;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    if ([(SFUnifiedTabBarItemTitleContainerView *)self showsSearchIcon])
    {
      int v5 = [(NSString *)self->_title length] == 0;
      int v6 = [v4 length] == 0;
      id v7 = (NSString *)[v4 copy];
      title = self->_title;
      self->_title = v7;

      [(SFUnifiedTabBarItemTitleContainerView *)self _updateTitle];
      if (v5 != v6)
      {
        [(SFUnifiedTabBarItemTitleContainerView *)self _updateIcon];
        [(SFUnifiedTabBarItemTitleContainerView *)self _updateIconSpacing];
      }
    }
    else
    {
      id v9 = (NSString *)[v4 copy];
      double v10 = self->_title;
      self->_title = v9;

      [(SFUnifiedTabBarItemTitleContainerView *)self _updateTitle];
    }
    if (!self->_collapsed && self->_alignment == 1)
    {
      id v11 = [(SFUnifiedTabBarItemTitleContainerView *)self window];

      if (v11)
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __50__SFUnifiedTabBarItemTitleContainerView_setTitle___block_invoke;
        v12[3] = &unk_1E54E9858;
        void v12[4] = self;
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v12];
      }
    }
  }
}

- (void)setShowsLockIcon:(BOOL)a3
{
  if (self->_showsLockIcon != a3)
  {
    BOOL v3 = a3;
    self->_showsLockIcon = a3;
    [(SFUnifiedTabBarItemTitleContainerView *)self setNeedsLayout];
    [(SFUnifiedTabBarItemTitleContainerView *)self invalidateIntrinsicContentSize];
    if (v3 && !self->_collapsed)
    {
      int v5 = [(SFUnifiedTabBarItemTitleContainerView *)self window];

      if (v5)
      {
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 3221225472;
        v6[2] = __58__SFUnifiedTabBarItemTitleContainerView_setShowsLockIcon___block_invoke;
        v6[3] = &unk_1E54E9858;
        v6[4] = self;
        [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v6 completion:0];
      }
    }
  }
}

- (void)setSecurityAnnotation:(int64_t)a3
{
  if (self->_securityAnnotation != a3)
  {
    [(SFUnifiedTabBarItemTitleContainerView *)self setNeedsLayout];
    [(SFUnifiedTabBarItemTitleContainerView *)self invalidateIntrinsicContentSize];
    self->_securityAnnotation = a3;
    if (self->_collapsed)
    {
      [(SFUnifiedTabBarItemTitleContainerView *)self _updateSecurityAnnotationAnimated:0];
    }
    else
    {
      id v5 = [(SFUnifiedTabBarItemTitleContainerView *)self window];
      [(SFUnifiedTabBarItemTitleContainerView *)self _updateSecurityAnnotationAnimated:v5 != 0];
    }
  }
}

- (void)setPlaceholder:(id)a3
{
  id v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    id v4 = (NSString *)[v6 copy];
    placeholder = self->_placeholder;
    self->_placeholder = v4;

    [(SFUnifiedTabBarItemTitleContainerView *)self _updateTitle];
  }
}

- (UIFont)placeholderFont
{
  return self->_placeholderFont;
}

- (NSString)title
{
  return self->_title;
}

- (SFUnifiedTabBarItemTitleContainerViewTheme)theme
{
  return self->_theme;
}

- (void)setShowsPrivateAnnotation:(BOOL)a3
{
  self->_showsPrivateAnnotation = a3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SFUnifiedTabBarItemTitleContainerView;
  id v4 = a3;
  [(SFUnifiedTabBarItemTitleContainerView *)&v9 traitCollectionDidChange:v4];
  id v5 = objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class);

  id v6 = [(SFUnifiedTabBarItemTitleContainerView *)self traitCollection];
  id v7 = [v6 preferredContentSizeCategory];
  char v8 = [v5 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    [(SFUnifiedTabBarItemTitleContainerView *)self _updateSquishedAccessorySymbolConfigurations];
    [(SFUnifiedTabBarItemTitleContainerView *)self invalidateIntrinsicContentSize];
    [(SFUnifiedTabBarItemTitleContainerView *)self setNeedsLayout];
  }
}

- (void)_updateTitle
{
  [(SFUnifiedTabBarItemTitleContainerView *)self _updateTitleColor];
  [(SFUnifiedTabBarItemTitleContainerView *)self _updateTitleFont];
  [(SFUnifiedTabBarItemTitleContainerView *)self invalidateIntrinsicContentSize];
  [(SFUnifiedTabBarItemTitleContainerView *)self setNeedsLayout];
  if (self->_collapsed)
  {
    titleWhenCollapsed = self->_titleWhenCollapsed;
LABEL_5:
    id v4 = titleWhenCollapsed;
    goto LABEL_6;
  }
  if ([(NSString *)self->_title length])
  {
    titleWhenCollapsed = self->_title;
    goto LABEL_5;
  }
  id v4 = [(SFUnifiedTabBarItemTitleContainerView *)self _placeholderText];
LABEL_6:
  char v8 = v4;
  id v5 = [(SFURLLabel *)self->_titleLabel text];
  char v6 = WBSIsEqual();

  if ((v6 & 1) == 0)
  {
    [(SFURLLabel *)self->_titleLabel setText:v8];
    if (v8)
    {
      id v7 = (const void *)CTLineCreateWithString();
      self->_titleLanguageIsRightToLeft = CTLineIsRightToLeft();
      CFRelease(v7);
    }
    else
    {
      self->_titleLanguageIsRightToLeft = 0;
    }
  }
}

- (id)_placeholderText
{
  if (self->_suppressesText) {
    return &stru_1EDA07C28;
  }
  else {
    return self->_placeholder;
  }
}

uint64_t __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (CGSize)intrinsicContentSize
{
  uint64_t v23 = 0;
  double v24 = (double *)&v23;
  uint64_t v25 = 0x3010000000;
  double v26 = &unk_18C77CCCE;
  long long v27 = *MEMORY[0x1E4F1DB30];
  BOOL v3 = [(SFUnifiedTabBarItemTitleContainerView *)self _arrangedViews];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = __61__SFUnifiedTabBarItemTitleContainerView_intrinsicContentSize__block_invoke;
  v22[3] = &unk_1E54EBE80;
  v22[4] = self;
  id v4 = objc_msgSend(v3, "safari_filterObjectsUsingBlock:", v22);

  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  CGRect v17 = __61__SFUnifiedTabBarItemTitleContainerView_intrinsicContentSize__block_invoke_2;
  double v18 = &unk_1E54EBEA8;
  uint64_t v19 = self;
  uint64_t v21 = &v23;
  id v5 = v4;
  id v20 = v5;
  [v5 enumerateObjectsUsingBlock:&v15];
  double v6 = v24[4];
  double v7 = v24[5];
  if (v6 != 0.0 && v7 != 0.0)
  {
    [(SFUnifiedTabBarItemTitleContainerView *)self _effectiveLayoutMargins];
    double v10 = v24;
    double v6 = v8 + v9 + v24[4];
    double v7 = v11 + v12 + v24[5];
    v24[4] = v6;
    v10[5] = v7;
  }

  _Block_object_dispose(&v23, 8);
  double v13 = v6;
  double v14 = v7;
  result.CGFloat height = v14;
  result.CGFloat width = v13;
  return result;
}

- (UIEdgeInsets)_effectiveLayoutMargins
{
  if (self->_usesInsetFromLayoutMargins)
  {
    [(SFUnifiedTabBarItemTitleContainerView *)self layoutMargins];
  }
  else
  {
    double v2 = *MEMORY[0x1E4FB2848];
    double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __59__SFUnifiedTabBarItemTitleContainerView_initWithAlignment___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateIconSpacing];
    id WeakRetained = v2;
  }
}

- (void)setAlignment:(int64_t)a3
{
  if (self->_alignment != a3)
  {
    self->_int64_t alignment = a3;
    [(SFUnifiedTabBarItemTitleContainerView *)self _updateAlignmentForAvailabilityLabel:self->_availabilityLabel];
    [(SFUnifiedTabBarItemTitleContainerView *)self _updateIconSpacing];
    [(SFUnifiedTabBarItemTitleContainerView *)self setNeedsLayout];
  }
}

- (void)setLeadingAlignsIcon:(BOOL)a3
{
  if (self->_leadingAlignsIcon != a3)
  {
    self->_leadingAlignsIcon = a3;
    [(SFUnifiedTabBarItemTitleContainerView *)self setNeedsLayout];
  }
}

- (void)setIcon:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_icon != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_icon, a3);
    [(SFUnifiedTabBarItemTitleContainerView *)self _updateIcon];
    [(SFUnifiedTabBarItemTitleContainerView *)self setNeedsLayout];
    [(SFUnifiedTabBarItemTitleContainerView *)self invalidateIntrinsicContentSize];
    double v5 = v6;
  }
}

- (void)setTitleWhenCollapsed:(id)a3
{
  id v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    double v4 = (NSString *)[v6 copy];
    titleWhenCollapsed = self->_titleWhenCollapsed;
    self->_titleWhenCollapsed = v4;

    [(SFUnifiedTabBarItemTitleContainerView *)self _updateTitle];
  }
}

uint64_t __50__SFUnifiedTabBarItemTitleContainerView_setTitle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setPlaceholderFont:(id)a3
{
  id v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_placeholderFont, a3);
    [(SFUnifiedTabBarItemTitleContainerView *)self _updateTitleFont];
  }
}

- (void)setShowsIcon:(BOOL)a3
{
  if (self->_showsIcon != a3)
  {
    self->_showsIcon = a3;
    [(SFUnifiedTabBarItemTitleContainerView *)self setNeedsLayout];
    [(SFUnifiedTabBarItemTitleContainerView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setIconAlpha:(double)a3
{
  if (self->_iconAlpha != a3)
  {
    self->_iconAlpha = a3;
    [(SFUnifiedTabBarItemTitleContainerView *)self setNeedsLayout];
  }
}

uint64_t __58__SFUnifiedTabBarItemTitleContainerView_setShowsLockIcon___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setLockIconEdge:(int64_t)a3
{
  if (self->_lockIconEdge != a3)
  {
    self->_lockIconEdge = a3;
    [(SFUnifiedTabBarItemTitleContainerView *)self setNeedsLayout];
  }
}

- (void)_updateSecurityAnnotationAnimated:(BOOL)a3
{
  if (self->_securityAnnotation)
  {
    BOOL v3 = a3;
    [(SFUnifiedTabBarItemTitleContainerView *)self _updateSecurityAnnotation];
    if (v3)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __75__SFUnifiedTabBarItemTitleContainerView__updateSecurityAnnotationAnimated___block_invoke;
      v5[3] = &unk_1E54E9858;
      v5[4] = self;
      [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v5 completion:0];
    }
  }
}

uint64_t __75__SFUnifiedTabBarItemTitleContainerView__updateSecurityAnnotationAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setSearchField:(id)a3
{
  id v5 = (UITextField *)a3;
  searchField = self->_searchField;
  if (searchField != v5)
  {
    double v7 = [(UITextField *)searchField superview];

    if (v7 == self) {
      [(UITextField *)self->_searchField removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_searchField, a3);
    if (v5)
    {
      double v8 = (void *)MEMORY[0x1E4FB1EB0];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __56__SFUnifiedTabBarItemTitleContainerView_setSearchField___block_invoke;
      v9[3] = &unk_1E54E9A60;
      v9[4] = self;
      double v10 = v5;
      [v8 performWithoutAnimation:v9];
    }
    else
    {
      self->_showsSearchField = 0;
    }
  }
}

uint64_t __56__SFUnifiedTabBarItemTitleContainerView_setSearchField___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addSubview:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 522)) {
    BOOL v3 = &stru_1EDA07C28;
  }
  else {
    BOOL v3 = *(__CFString **)(v2 + 568);
  }
  [*(id *)(a1 + 40) setText:v3];
  double v4 = [*(id *)(a1 + 32) _titleFontWithTraitCollection:0];
  [*(id *)(a1 + 40) setFont:v4];

  [*(id *)(a1 + 32) _updateSearchFieldColor];
  [*(id *)(a1 + 32) setNeedsLayout];
  id v5 = *(void **)(a1 + 32);

  return [v5 layoutIfNeeded];
}

- (void)setShowsSearchField:(BOOL)a3
{
  if (self->_showsSearchField != a3)
  {
    self->_showsSearchField = a3;
    [(SFUnifiedTabBarItemTitleContainerView *)self setNeedsLayout];
  }
}

- (void)setSuppressesText:(BOOL)a3
{
  if (self->_suppressesText != a3)
  {
    self->_suppressesText = a3;
    [(SFUnifiedTabBarItemTitleContainerView *)self setNeedsLayout];
  }
}

- (void)setHidesIconForHover:(BOOL)a3
{
  if (self->_hidesIconForHover != a3)
  {
    self->_hidesIconForHover = a3;
    [(SFUnifiedTabBarItemTitleContainerView *)self _layoutArrangedViews];
  }
}

- (CGRect)iconFrame
{
  [(SFFaviconView *)self->_iconView frame];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setDimsText:(BOOL)a3
{
  if (self->_dimsText != a3)
  {
    self->_dimsText = a3;
    [(SFUnifiedTabBarItemTitleContainerView *)self setNeedsLayout];
  }
}

- (BOOL)_iconIsSymbol
{
  return [(UIImage *)self->_icon isSymbolImage]
      || [(UIImage *)self->_icon sf_isMonogram]
      || [(UIImage *)self->_icon renderingMode] == UIImageRenderingModeAlwaysTemplate;
}

- (double)leadingIconOffset
{
  return 0.0;
}

- (double)minimumWidthToShowTitle
{
  [(SFUnifiedTabBarItemTitleContainerView *)self _effectiveLayoutMargins];
  double v4 = v3;
  [(SFUnifiedTabBarItemTitleContainerView *)self _iconSize];
  return v4 + v5 + self->_iconSpacing + 15.0;
}

uint64_t __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke_4(uint64_t a1)
{
  double v2 = 0.0;
  if (*(unsigned char *)(a1 + 48) && !*(unsigned char *)(a1 + 49)) {
    objc_msgSend(*(id *)(a1 + 40), "_alphaForView:", *(void *)(a1 + 32), 0.0);
  }
  double v3 = *(void **)(a1 + 32);

  return [v3 setAlpha:v2];
}

uint64_t __59__SFUnifiedTabBarItemTitleContainerView__layOutSearchField__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 640) layoutIfNeeded];
}

- (void)_layOutFakeClearButtonUsingPresentationFrame:(BOOL)a3
{
  if (self->_fakeClearButton)
  {
    BOOL v3 = a3;
    searchField = self->_searchField;
    [(SFUnifiedTabBarItemTitleContainerView *)self _searchFieldFrame];
    -[UITextField clearButtonRectForBounds:](searchField, "clearButtonRectForBounds:");
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    if (v3)
    {
      double v14 = [(SFUnifiedTabBarItemTitleContainerView *)self layer];
      uint64_t v15 = [v14 presentationLayer];
      [v15 frame];
      double MaxX = CGRectGetMaxX(v22);
      [(SFUnifiedTabBarItemTitleContainerView *)self frame];
      double v7 = v7 + MaxX - CGRectGetMaxX(v23);
    }
    fakeClearButton = self->_fakeClearButton;
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v21[0] = *MEMORY[0x1E4F1DAB8];
    v21[1] = v18;
    v21[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(UIButton *)fakeClearButton setTransform:v21];
    -[UIButton setFrame:](self->_fakeClearButton, "setFrame:", v7, v9, v11, v13);
    double v19 = 0.0;
    if (self->_showsSearchField) {
      double v19 = 0.1;
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __86__SFUnifiedTabBarItemTitleContainerView__layOutFakeClearButtonUsingPresentationFrame___block_invoke;
    v20[3] = &unk_1E54E9858;
    v20[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:50659424 delay:v20 options:0 animations:0.2 completion:v19];
  }
}

uint64_t __86__SFUnifiedTabBarItemTitleContainerView__layOutFakeClearButtonUsingPresentationFrame___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = 0.8;
  if (*(unsigned char *)(v2 + 521)) {
    double v3 = 1.0;
  }
  CGAffineTransformMakeScale(&v9, v3, v3);
  double v4 = *(void **)(v2 + 496);
  CGAffineTransform v8 = v9;
  [v4 setTransform:&v8];
  uint64_t v5 = *(void *)(a1 + 32);
  LOBYTE(v6) = *(unsigned char *)(v5 + 521);
  return [*(id *)(v5 + 496) setAlpha:(double)v6];
}

- (CGRect)_searchFieldFrame
{
  [(SFUnifiedTabBarItemTitleContainerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SFUnifiedTabBarItemTitleContainerView *)self _effectiveLayoutMargins];
  double v12 = v6 + v11;
  double v15 = v8 - (v13 + v14);
  double v17 = v10 - (v11 + v16);
  double v18 = v4 + v13;
  double v19 = v12;
  double v20 = v15;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (void)_slideArrangedViewsForSearchField:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v5 = [(SFUnifiedTabBarItemTitleContainerView *)self _arrangedViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([(SFUnifiedTabBarItemTitleContainerView *)self _shouldSlideArrangedViewForSearchField:v10])
        {
          [v10 frame];
          CGRect v18 = CGRectOffset(v17, a3, 0.0);
          objc_msgSend(v10, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (BOOL)_shouldSlideArrangedViewForSearchField:(id)a3
{
  return self->_iconView != a3 || self->_alignment == 1;
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SFUnifiedTabBarItemTitleContainerView;
  [(SFUnifiedTabBarItemTitleContainerView *)&v3 layoutMarginsDidChange];
  [(SFUnifiedTabBarItemTitleContainerView *)self setNeedsLayout];
}

- (CGSize)lockSize
{
  if (self->_showsLockIcon)
  {
    [(SFUnifiedTabBarItemTitleContainerView *)self _preferredSizeForView:self->_lockView];
  }
  else
  {
    double v2 = *MEMORY[0x1E4F1DB30];
    double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (double)maximumIconWidth
{
  [(SFUnifiedTabBarItemTitleContainerView *)self _preferredSizeForView:self->_iconView];
  return v2 + 6.0;
}

- (CGRect)titleRect
{
  [(SFURLLabel *)self->_titleLabel frame];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (CGSize)urlSize
{
  [(SFURLLabel *)self->_titleLabel urlSize];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (double)urlBaselineToBottomBoundsDistanceForHeight:(double)a3
{
  [(SFURLLabel *)self->_titleLabel urlSize];
  double v6 = (a3 - v5) * 0.5;
  [(SFURLLabel *)self->_titleLabel baselineOffsetFromBottom];
  return v7 + v6;
}

- (double)urlCapHeightToTopBoundsDistanceForHeight:(double)a3
{
  [(SFURLLabel *)self->_titleLabel urlSize];
  double v6 = (a3 - v5) * 0.5;
  [(SFURLLabel *)self->_titleLabel labelCapHeightInsetFromTop];
  return v7 + v6;
}

- (void)beginTitleTextStyleAnimation
{
}

- (void)endTitleTextStyleAnimation
{
}

- (void)beginTransitioningSearchField
{
  id v3 = [(UITextField *)self->_searchField text];
  -[SFUnifiedTabBarItemTitleContainerView _setShowsFakeClearButton:](self, "_setShowsFakeClearButton:", [v3 length] != 0);
}

- (void)endTransitioningSearchField
{
}

- (BOOL)_showsFakeClearButton
{
  return self->_fakeClearButton != 0;
}

- (void)_setShowsFakeClearButton:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SFUnifiedTabBarItemTitleContainerView *)self _showsFakeClearButton] != a3)
  {
    double v5 = [(UITextField *)self->_searchField _clearButton];
    [v5 setHidden:v3];

    if (v3)
    {
      double v6 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
      fakeClearButton = self->_fakeClearButton;
      self->_fakeClearButton = v6;

      uint64_t v8 = self->_fakeClearButton;
      double v9 = [(UITextField *)self->_searchField _clearButton];
      double v10 = [v9 imageForState:0];
      [(UIButton *)v8 setImage:v10 forState:0];

      [(SFUnifiedTabBarItemTitleContainerView *)self addSubview:self->_fakeClearButton];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __66__SFUnifiedTabBarItemTitleContainerView__setShowsFakeClearButton___block_invoke;
      v12[3] = &unk_1E54E9858;
      void v12[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v12];
    }
    else
    {
      [(UIButton *)self->_fakeClearButton removeFromSuperview];
      long long v11 = self->_fakeClearButton;
      self->_fakeClearButton = 0;
    }
  }
}

uint64_t __66__SFUnifiedTabBarItemTitleContainerView__setShowsFakeClearButton___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layOutFakeClearButtonUsingPresentationFrame:1];
}

- (void)_updateOffsetOfTitleInSearchField
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_title length]
    && [(NSString *)self->_textWhenExpanded length]
    && ((unint64_t v3 = self->_startIndexOfTitleInTextWhenExpanded, v3 != 0x7FFFFFFFFFFFFFFFLL) ? (v4 = v3 == 0) : (v4 = 1), !v4))
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
    textWhenExpanded = self->_textWhenExpanded;
    uint64_t v13 = *MEMORY[0x1E4FB06F8];
    double v7 = [(SFUnifiedTabBarItemTitleContainerView *)self traitCollection];
    uint64_t v8 = [(SFUnifiedTabBarItemTitleContainerView *)self _titleFontWithTraitCollection:v7];
    v14[0] = v8;
    double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    CFAttributedStringRef v10 = (const __CFAttributedString *)[v5 initWithString:textWhenExpanded attributes:v9];

    CFIndex startIndexOfTitleInTextWhenExpanded = self->_startIndexOfTitleInTextWhenExpanded;
    if ([(NSString *)self->_title characterAtIndex:0] == 8206) {
      ++startIndexOfTitleInTextWhenExpanded;
    }
    long long v12 = CTLineCreateWithAttributedString(v10);
    self->_offsetOfTitleInSearchField = CTLineGetOffsetForStringIndex(v12, startIndexOfTitleInTextWhenExpanded, 0);
    CFRelease(v12);
  }
  else
  {
    self->_offsetOfTitleInSearchField = 0.0;
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SFUnifiedTabBarItemTitleContainerView;
  id v5 = -[SFUnifiedTabBarItemTitleContainerView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v6 = v5;
  if (self->_showsSearchField && [v5 isDescendantOfView:self->_searchField]) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (NSArray)squishedAccessoryViews
{
  v7[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(SFUnifiedTabBarItemTitleContainerView *)self _squishedIconView];
  v7[0] = v3;
  BOOL v4 = [(SFUnifiedTabBarItemTitleContainerView *)self _squishedLockView];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return (NSArray *)v5;
}

- (void)setShowsSquishedAccessoryViews:(BOOL)a3
{
  if (self->_showsSquishedAccessoryViews != a3)
  {
    self->_showsSquishedAccessoryViews = a3;
    [(SFUnifiedTabBarItemTitleContainerView *)self setNeedsLayout];
  }
}

- (id)_squishedIconView
{
  squishedIconView = self->_squishedIconView;
  if (!squishedIconView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
    id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"magnifyingglass"];
    double v6 = (UIImageView *)[v4 initWithImage:v5];
    id v7 = self->_squishedIconView;
    self->_squishedIconView = v6;

    uint64_t v8 = [(SFUnifiedTabBarItemTitleContainerView *)self _squishedAccessorySymbolConfiguration];
    [(UIImageView *)self->_squishedIconView setPreferredSymbolConfiguration:v8];

    objc_super v9 = [(SFUnifiedTabBarItemTitleContainerViewTheme *)self->_theme primaryTextColor];
    [(UIImageView *)self->_squishedIconView setTintColor:v9];

    squishedIconView = self->_squishedIconView;
  }
  CFAttributedStringRef v10 = squishedIconView;

  return v10;
}

- (id)_squishedLockView
{
  squishedLockView = self->_squishedLockView;
  if (!squishedLockView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
    id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"lock.fill"];
    double v6 = (UIImageView *)[v4 initWithImage:v5];
    id v7 = self->_squishedLockView;
    self->_squishedLockView = v6;

    uint64_t v8 = [(SFUnifiedTabBarItemTitleContainerView *)self _squishedAccessorySymbolConfiguration];
    [(UIImageView *)self->_squishedLockView setPreferredSymbolConfiguration:v8];

    objc_super v9 = [(SFUnifiedTabBarItemTitleContainerViewTheme *)self->_theme secondaryTextColor];
    [(UIImageView *)self->_squishedLockView setTintColor:v9];

    squishedLockView = self->_squishedLockView;
  }
  CFAttributedStringRef v10 = squishedLockView;

  return v10;
}

- (id)_squishedAccessorySymbolConfiguration
{
  titleTextStyle = self->_titleTextStyle;
  id v4 = (void *)MEMORY[0x1E4FB08E0];
  id v5 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27D0]];
  double v6 = [v4 preferredFontForTextStyle:titleTextStyle compatibleWithTraitCollection:v5];

  +[SFUnifiedBarMetrics minimumSquishScale];
  double v8 = v7;
  [v6 pointSize];
  double v10 = ceil(v8 * v9);
  long long v11 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:self->_titleTextStyle];
  long long v12 = [(SFUnifiedTabBarItemTitleContainerView *)self traitCollection];
  [v11 scaledValueForValue:v12 compatibleWithTraitCollection:v10];
  double v14 = v13;

  double v15 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:1 scale:v14];

  return v15;
}

- (void)_updateSquishedAccessorySymbolConfigurations
{
  id v3 = [(SFUnifiedTabBarItemTitleContainerView *)self _squishedAccessorySymbolConfiguration];
  [(UIImageView *)self->_squishedIconView setPreferredSymbolConfiguration:v3];
  [(UIImageView *)self->_squishedLockView setPreferredSymbolConfiguration:v3];
}

- (void)presentAvailabilityLabelWithText:(id)a3
{
  v37[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v30 = self->_availabilityLabel;
  if (v30)
  {
    availabilityLabelAlignmentConstraint = self->_availabilityLabelAlignmentConstraint;
    self->_availabilityLabelAlignmentConstraint = 0;
  }
  double v6 = objc_alloc_init(SFURLLabel);
  [(SFURLLabel *)v6 setAdjustsFontForContentSizeCategory:1];
  [(SFURLLabel *)v6 setFadeOutEdge:1];
  double v7 = [(SFUnifiedTabBarItemTitleContainerView *)self _titleFontWithTraitCollection:0];
  [(SFURLLabel *)v6 setFont:v7];

  double v8 = [(SFUnifiedTabBarItemTitleContainerViewTheme *)self->_theme primaryTextColor];
  [(SFURLLabel *)v6 setTextColor:v8];

  [(SFURLLabel *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SFURLLabel *)v6 setText:v4];
  [(SFUnifiedTabBarItemTitleContainerView *)self addSubview:v6];
  double v9 = [(SFUnifiedTabBarItemTitleContainerView *)self layoutMarginsGuide];
  CGRect v22 = (void *)MEMORY[0x1E4F28DC8];
  long long v27 = [(SFURLLabel *)v6 leadingAnchor];
  id v28 = v9;
  double v26 = [v9 leadingAnchor];
  uint64_t v25 = [v27 constraintGreaterThanOrEqualToAnchor:v26];
  v37[0] = v25;
  double v24 = [(SFURLLabel *)v6 topAnchor];
  CGRect v23 = [(SFUnifiedTabBarItemTitleContainerView *)self topAnchor];
  double v10 = [v24 constraintEqualToAnchor:v23];
  v37[1] = v10;
  long long v11 = [v9 trailingAnchor];
  [(SFURLLabel *)v6 trailingAnchor];
  v12 = uint64_t v29 = v4;
  double v13 = [v11 constraintGreaterThanOrEqualToAnchor:v12];
  v37[2] = v13;
  double v14 = [(SFUnifiedTabBarItemTitleContainerView *)self bottomAnchor];
  double v15 = [(SFURLLabel *)v6 bottomAnchor];
  uint64_t v16 = [v14 constraintEqualToAnchor:v15];
  v37[3] = v16;
  CGRect v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
  [v22 activateConstraints:v17];

  [(SFUnifiedTabBarItemTitleContainerView *)self _updateAlignmentForAvailabilityLabel:v6];
  [(SFUnifiedTabBarItemTitleContainerView *)self layoutIfNeeded];
  availabilityLabel = self->_availabilityLabel;
  self->_availabilityLabel = v6;
  double v19 = v6;

  double v20 = (void *)MEMORY[0x1E4FB1EB0];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __74__SFUnifiedTabBarItemTitleContainerView_presentAvailabilityLabelWithText___block_invoke;
  v34[3] = &unk_1E54E9A60;
  long long v35 = v30;
  long long v36 = self;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __74__SFUnifiedTabBarItemTitleContainerView_presentAvailabilityLabelWithText___block_invoke_2;
  v32[3] = &unk_1E54E9998;
  long long v33 = v35;
  uint64_t v21 = v35;
  [v20 animateWithDuration:50331648 delay:v34 options:v32 animations:0.2 completion:0.0];
  [(SFURLLabel *)self->_availabilityLabel setAlpha:0.0];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __74__SFUnifiedTabBarItemTitleContainerView_presentAvailabilityLabelWithText___block_invoke_3;
  v31[3] = &unk_1E54E9858;
  v31[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:50331648 delay:v31 options:0 animations:0.5 completion:0.06];
}

uint64_t __74__SFUnifiedTabBarItemTitleContainerView_presentAvailabilityLabelWithText___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  double v2 = *(void **)(a1 + 40);

  return [v2 _layoutArrangedViews];
}

uint64_t __74__SFUnifiedTabBarItemTitleContainerView_presentAvailabilityLabelWithText___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __74__SFUnifiedTabBarItemTitleContainerView_presentAvailabilityLabelWithText___block_invoke_3(uint64_t a1)
{
  double v2 = (double)[*(id *)(a1 + 32) _shouldShowAvailabilityLabel];
  id v3 = *(void **)(*(void *)(a1 + 32) + 472);

  return [v3 setAlpha:v2];
}

- (void)dismissAvailabilityLabelAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  double v26 = __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke;
  long long v27 = &unk_1E54EB568;
  id v7 = v6;
  id v28 = v7;
  double v8 = _Block_copy(&aBlock);
  double v9 = v8;
  availabilityLabel = self->_availabilityLabel;
  if (availabilityLabel)
  {
    long long v11 = availabilityLabel;
    long long v12 = self->_availabilityLabel;
    self->_availabilityLabel = 0;

    availabilityLabelAlignmentConstraint = self->_availabilityLabelAlignmentConstraint;
    self->_availabilityLabelAlignmentConstraint = 0;

    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    double v19 = __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke_2;
    double v20 = &unk_1E54E9A88;
    uint64_t v21 = v11;
    CGRect v22 = self;
    id v23 = v9;
    double v14 = v11;
    double v15 = _Block_copy(&v17);
    uint64_t v16 = v15;
    if (v4) {
      (*((void (**)(void *))v15 + 2))(v15);
    }
    else {
      objc_msgSend(MEMORY[0x1E4FB1EB0], "performWithoutAnimation:", v15, v17, v18, v19, v20, v21, v22, v23, aBlock, v25, v26, v27);
    }
  }
  else
  {
    (*((void (**)(void *))v8 + 2))(v8);
  }
}

uint64_t __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4FB1EB0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke_3;
  v9[3] = &unk_1E54E9858;
  id v10 = *(id *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke_4;
  void v7[3] = &unk_1E54E9998;
  id v8 = *(id *)(a1 + 32);
  [v2 animateWithDuration:50331648 delay:v9 options:v7 animations:0.2 completion:0.0];
  id v3 = (void *)MEMORY[0x1E4FB1EB0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke_5;
  v6[3] = &unk_1E54E9858;
  v6[4] = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke_6;
  v4[3] = &unk_1E54E9D78;
  id v5 = *(id *)(a1 + 48);
  [v3 animateWithDuration:50331648 delay:v6 options:v4 animations:0.5 completion:0.06];
}

uint64_t __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) _layoutArrangedViews];
  double v2 = *(void **)(a1 + 32);

  return [v2 _layoutSquishedAccessoryViews];
}

uint64_t __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateAlignmentForAvailabilityLabel:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v12 = v4;
    [(NSLayoutConstraint *)self->_availabilityLabelAlignmentConstraint setActive:0];
    int64_t alignment = self->_alignment;
    if (alignment == 1)
    {
      id v6 = [v12 centerXAnchor];
      id v7 = [(SFUnifiedTabBarItemTitleContainerView *)self centerXAnchor];
      id v8 = [v6 constraintEqualToAnchor:v7];
    }
    else
    {
      if (alignment)
      {
LABEL_10:
        [(NSLayoutConstraint *)self->_availabilityLabelAlignmentConstraint setActive:1];
        id v4 = v12;
        goto LABEL_11;
      }
      if (!self->_showsIcon && !self->_showsSearchIcon)
      {
        id v6 = [v12 leadingAnchor];
        id v7 = [(SFUnifiedTabBarItemTitleContainerView *)self layoutMarginsGuide];
        double v9 = [v7 leadingAnchor];
        id v10 = [v6 constraintEqualToAnchor:v9];
        availabilityLabelAlignmentConstraint = self->_availabilityLabelAlignmentConstraint;
        self->_availabilityLabelAlignmentConstraint = v10;

        goto LABEL_9;
      }
      id v6 = [v12 leadingAnchor];
      id v7 = [(SFFaviconView *)self->_iconView trailingAnchor];
      id v8 = [v6 constraintEqualToAnchor:v7 constant:self->_iconSpacing];
    }
    double v9 = self->_availabilityLabelAlignmentConstraint;
    self->_availabilityLabelAlignmentConstraint = v8;
LABEL_9:

    goto LABEL_10;
  }
LABEL_11:
}

- (BOOL)requiresTruncationToDisplayAvailabilityLabel:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v17 = *MEMORY[0x1E4FB06F8];
  id v4 = a3;
  id v5 = [(SFUnifiedTabBarItemTitleContainerView *)self traitCollection];
  id v6 = [(SFUnifiedTabBarItemTitleContainerView *)self _titleFontWithTraitCollection:v5];
  v18[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];

  CFAttributedStringRef v8 = (const __CFAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4 attributes:v7];
  double v9 = CTLineCreateWithAttributedString(v8);
  CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v9, 0);
  CGFloat x = BoundsWithOptions.origin.x;
  CGFloat y = BoundsWithOptions.origin.y;
  CGFloat width = BoundsWithOptions.size.width;
  CGFloat height = BoundsWithOptions.size.height;
  CFRelease(v9);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double v14 = CGRectGetWidth(v20);
  double v15 = [(SFUnifiedTabBarItemTitleContainerView *)self layoutMarginsGuide];
  [v15 layoutFrame];
  LOBYTE(self) = v14 > CGRectGetWidth(v21);

  return (char)self;
}

- (UIImage)icon
{
  return self->_icon;
}

- (BOOL)showsIcon
{
  return self->_showsIcon;
}

- (double)iconAlpha
{
  return self->_iconAlpha;
}

- (NSString)titleWhenCollapsed
{
  return self->_titleWhenCollapsed;
}

- (NSString)textWhenExpanded
{
  return self->_textWhenExpanded;
}

- (void)setTextWhenExpanded:(id)a3
{
}

- (unint64_t)startIndexOfTitleInTextWhenExpanded
{
  return self->_startIndexOfTitleInTextWhenExpanded;
}

- (void)setStartIndexOfTitleInTextWhenExpanded:(unint64_t)a3
{
  self->_CFIndex startIndexOfTitleInTextWhenExpanded = a3;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (BOOL)showsSearchIcon
{
  return self->_showsSearchIcon;
}

- (BOOL)showsPrivateAnnotation
{
  return self->_showsPrivateAnnotation;
}

- (BOOL)hasFocusedSensitiveInputField
{
  return self->_hasFocusedSensitiveInputField;
}

- (int64_t)securityAnnotation
{
  return self->_securityAnnotation;
}

- (BOOL)usesInsetFromLayoutMargins
{
  return self->_usesInsetFromLayoutMargins;
}

- (BOOL)isAnimatingResize
{
  return self->_animatingResize;
}

- (void)setAnimatingResize:(BOOL)a3
{
  self->_animatingResize = a3;
}

- (BOOL)isNarrow
{
  return self->_narrow;
}

- (double)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

- (double)titleToSearchIconSpacing
{
  return self->_titleToSearchIconSpacing;
}

- (double)contentOffset
{
  return self->_contentOffset;
}

- (void)setContentOffset:(double)a3
{
  self->_contentOffset = a3;
}

- (BOOL)hidesIconForHover
{
  return self->_hidesIconForHover;
}

- (UITextField)searchField
{
  return self->_searchField;
}

- (BOOL)showsSearchField
{
  return self->_showsSearchField;
}

- (BOOL)suppressesText
{
  return self->_suppressesText;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (BOOL)dimsText
{
  return self->_dimsText;
}

- (BOOL)showsSquishedAccessoryViews
{
  return self->_showsSquishedAccessoryViews;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (BOOL)leadingAlignsIcon
{
  return self->_leadingAlignsIcon;
}

- (BOOL)animateLockViewPosition
{
  return self->_animateLockViewPosition;
}

- (int64_t)lockIconEdge
{
  return self->_lockIconEdge;
}

- (BOOL)showsLockIcon
{
  return self->_showsLockIcon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_searchField, 0);
  objc_storeStrong((id *)&self->_placeholderFont, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_titleTextStyle, 0);
  objc_storeStrong((id *)&self->_textWhenExpanded, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_titleWhenCollapsed, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_fakeClearButton, 0);
  objc_storeStrong((id *)&self->_availabilityLabelAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_availabilityLabel, 0);
  objc_storeStrong((id *)&self->_squishedLockView, 0);
  objc_storeStrong((id *)&self->_lockView, 0);
  objc_storeStrong((id *)&self->_trailingAnnotationLabel, 0);
  objc_storeStrong((id *)&self->_leadingAnnotationLabel, 0);
  objc_storeStrong((id *)&self->_squishedIconView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_iconView, 0);
}

- (void)_layoutSquishedAccessoryView:(uint64_t)a3 forView:.cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = objc_msgSend(a2, "sf_commonAncestrySummaryWithView:", a3);
  int v7 = 138412290;
  CFAttributedStringRef v8 = v6;
  _os_log_fault_impl(&dword_18C354000, v5, OS_LOG_TYPE_FAULT, "Invalid center for squished accessory view:\n%@", (uint8_t *)&v7, 0xCu);
}

@end