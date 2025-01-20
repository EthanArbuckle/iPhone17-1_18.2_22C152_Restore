@interface _UISearchBarSearchContainerLayout
- (BOOL)allowSearchFieldShrinkage;
- (BOOL)drawsSearchIconOnly;
- (BOOL)hasCancelButton;
- (BOOL)hasDeleteButton;
- (BOOL)hasFloatingSearchIconBackgroundView;
- (BOOL)hasLeftButton;
- (BOOL)isHostedInlineByNavigationBar;
- (BOOL)isTextFieldManagedInNSToolbar;
- (BOOL)searchFieldEffectivelySupportsDynamicType;
- (BOOL)searchFieldRespectsReadableWidth;
- (BOOL)searchFieldUsesCustomBackgroundImage;
- (BOOL)searchFieldWidthIsReduced;
- (CGRect)cancelButtonLayoutFrame;
- (CGRect)deleteButtonLayoutFrame;
- (CGRect)floatingSearchIconBackgroundLayoutFrame;
- (CGRect)floatingSearchIconLayoutFrame;
- (CGRect)leftButtonLayoutFrame;
- (CGRect)searchFieldLayoutFrame;
- (CGRect)visibleCancelButtonSearchFieldLayoutFrame;
- (UIBarButtonItem)searchIconBarButtonItem;
- (UIImageView)floatingSearchIconView;
- (UIOffset)searchFieldBackgroundPositionAdjustment;
- (UISearchBarTextField)searchField;
- (UIView)cancelButton;
- (UIView)deleteButton;
- (UIView)floatingSearchIconBackgroundView;
- (UIView)leftButton;
- (_UISearchBarContainerSublayoutDelegate)delegate;
- (double)_effectiveActiveWidth;
- (double)_effectiveInactiveWidth;
- (double)additionalPaddingForCancelButtonAtLeadingEdge;
- (double)additionalPaddingForSearchFieldAtLeadingEdge;
- (double)defaultActiveWidth;
- (double)defaultInactiveWidth;
- (double)floatingSearchIconAlpha;
- (double)floatingSearchIconBackgroundAlpha;
- (double)mainContentAlpha;
- (double)naturalContainerHeight;
- (double)naturalSearchFieldHeight;
- (double)overrideActiveWidth;
- (double)overrideInactiveWidth;
- (double)prescribedWidth;
- (double)searchBarFieldHeight;
- (double)searchBarReadableWidth;
- (double)searchFieldHeightUpdatingShrinkageAndFadeAlphas;
- (id)copyWithZone:(_NSZone *)a3;
- (id)delegateSearchFieldFrameForProposedFrame;
- (id)description;
- (id)layoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback;
- (int64_t)representedLayoutState;
- (void)applyLayout;
- (void)sendWillLayoutSubviewsForSearchFieldContainerView:(id)a3;
- (void)setAdditionalPaddingForCancelButtonAtLeadingEdge:(double)a3;
- (void)setAdditionalPaddingForSearchFieldAtLeadingEdge:(double)a3;
- (void)setAllowSearchFieldShrinkage:(BOOL)a3;
- (void)setCancelButton:(id)a3;
- (void)setDefaultActiveWidth:(double)a3;
- (void)setDefaultInactiveWidth:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateSearchFieldFrameForProposedFrame:(id)a3;
- (void)setDeleteButton:(id)a3;
- (void)setDrawsSearchIconOnly:(BOOL)a3;
- (void)setFloatingSearchIconBackgroundView:(id)a3;
- (void)setFloatingSearchIconView:(id)a3;
- (void)setHasCancelButton:(BOOL)a3;
- (void)setHasDeleteButton:(BOOL)a3;
- (void)setHasFloatingSearchIconBackgroundView:(BOOL)a3;
- (void)setHasLeftButton:(BOOL)a3;
- (void)setHostedInlineByNavigationBar:(BOOL)a3;
- (void)setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:(id)a3;
- (void)setLeftButton:(id)a3;
- (void)setOverrideActiveWidth:(double)a3;
- (void)setOverrideInactiveWidth:(double)a3;
- (void)setRepresentedLayoutState:(int64_t)a3;
- (void)setSearchBarFieldHeight:(double)a3;
- (void)setSearchBarReadableWidth:(double)a3;
- (void)setSearchField:(id)a3;
- (void)setSearchFieldBackgroundPositionAdjustment:(UIOffset)a3;
- (void)setSearchFieldEffectivelySupportsDynamicType:(BOOL)a3;
- (void)setSearchFieldRespectsReadableWidth:(BOOL)a3;
- (void)setSearchFieldUsesCustomBackgroundImage:(BOOL)a3;
- (void)setSearchIconBarButtonItem:(id)a3;
- (void)setTextFieldManagedInNSToolbar:(BOOL)a3;
- (void)updateLayout;
@end

@implementation _UISearchBarSearchContainerLayout

- (UISearchBarTextField)searchField
{
  return self->_searchField;
}

- (void)setSearchBarFieldHeight:(double)a3
{
  self->_searchBarFieldHeight = a3;
}

- (void)setOverrideInactiveWidth:(double)a3
{
  self->_overrideInactiveWidth = a3;
}

- (void)setOverrideActiveWidth:(double)a3
{
  self->_overrideActiveWidth = a3;
}

- (void)setDefaultInactiveWidth:(double)a3
{
  self->_defaultInactiveWidth = a3;
}

- (void)setDefaultActiveWidth:(double)a3
{
  self->_defaultActiveWidth = a3;
}

- (void)setSearchIconBarButtonItem:(id)a3
{
}

- (void)setSearchField:(id)a3
{
}

- (void)setLeftButton:(id)a3
{
}

- (void)setFloatingSearchIconView:(id)a3
{
}

- (void)setDeleteButton:(id)a3
{
}

- (void)setCancelButton:(id)a3
{
}

- (void)setTextFieldManagedInNSToolbar:(BOOL)a3
{
  __int16 searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 0x20) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 32;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFFDF | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setSearchFieldUsesCustomBackgroundImage:(BOOL)a3
{
  __int16 searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 0x100) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 256;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFEFF | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setSearchFieldRespectsReadableWidth:(BOOL)a3
{
  __int16 searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 0x400) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 1024;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFBFF | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setSearchFieldEffectivelySupportsDynamicType:(BOOL)a3
{
  __int16 searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 0x200) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 512;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFDFF | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setSearchFieldBackgroundPositionAdjustment:(UIOffset)a3
{
  if (a3.horizontal != self->_searchFieldBackgroundPositionAdjustment.horizontal
    || a3.vertical != self->_searchFieldBackgroundPositionAdjustment.vertical)
  {
    self->_searchFieldBackgroundPositionAdjustment = a3;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setSearchBarReadableWidth:(double)a3
{
  double searchBarReadableWidth = self->_searchBarReadableWidth;
  if (searchBarReadableWidth != a3)
  {
    if (searchBarReadableWidth > a3 || (*(_WORD *)&self->_searchContainerLayoutFlags & 0x800) != 0) {
      [(_UISearchBarLayoutBase *)self invalidateLayout];
    }
    self->_double searchBarReadableWidth = a3;
  }
}

- (void)setRepresentedLayoutState:(int64_t)a3
{
  self->_representedLayoutState = a3;
}

- (void)setHostedInlineByNavigationBar:(BOOL)a3
{
  __int16 searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 16;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFFEF | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setHasLeftButton:(BOOL)a3
{
  __int16 searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 4;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFFFB | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setHasFloatingSearchIconBackgroundView:(BOOL)a3
{
  __int16 searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 8;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFFF7 | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setHasDeleteButton:(BOOL)a3
{
  __int16 searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 2;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFFFD | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setHasCancelButton:(BOOL)a3
{
  __int16 searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 1) == 0) ^ a3) & 1) == 0)
  {
    *(_WORD *)&self->___int16 searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFFFE | a3;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setDrawsSearchIconOnly:(BOOL)a3
{
  __int16 searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 0x40) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 64;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFFBF | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setAllowSearchFieldShrinkage:(BOOL)a3
{
  __int16 searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 0x80) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 128;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFF7F | v4;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (double)naturalContainerHeight
{
  [(_UISearchBarLayoutBase *)self contentInset];
  double v5 = v4;
  double v7 = v6;
  [(_UISearchBarLayoutBase *)self barMetrics];
  [(_UISearchBarSearchContainerLayout *)self searchBarFieldHeight];
  double v9 = v8;
  if (v8 == 0.0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"_UISearchBarSearchContainerLayout.m" lineNumber:170 description:@"searchBarFieldHeight is unexpectedly 0.0 in naturalContainerHeight"];
  }
  if ((*(_WORD *)&self->_searchContainerLayoutFlags & 0x200) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained layout:self fontScaledValueForValue:v9];
    double v9 = v11;
  }
  return v5 + v7 + v9;
}

- (double)searchBarFieldHeight
{
  return self->_searchBarFieldHeight;
}

- (void)setDelegate:(id)a3
{
}

- (void)sendWillLayoutSubviewsForSearchFieldContainerView:(id)a3
{
  id v4 = a3;
  layoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback = (void (**)(id, id, double, double, double, double, double, double, double, double))self->_layoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback;
  if (layoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback
    && (*(_WORD *)&self->_searchContainerLayoutFlags & 0x10) == 0)
  {
    id v18 = v4;
    [(_UISearchBarSearchContainerLayout *)self searchFieldLayoutFrame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [(_UISearchBarSearchContainerLayout *)self cancelButtonLayoutFrame];
    layoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback[2](layoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback, v18, v7, v9, v11, v13, v14, v15, v16, v17);
    id v4 = v18;
  }
}

- (_UISearchBarContainerSublayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UISearchBarContainerSublayoutDelegate *)WeakRetained;
}

- (void)applyLayout
{
  [(_UISearchBarLayoutBase *)self updateLayoutIfNeeded];
  if ((*(_WORD *)&self->_searchContainerLayoutFlags & 0x20) == 0)
  {
    [(_UISearchBarSearchContainerLayout *)self searchFieldLayoutFrame];
    -[UITextField setFrame:](self->_searchField, "setFrame:");
    [(_UISearchBarSearchContainerLayout *)self floatingSearchIconAlpha];
    -[UIView setAlpha:](self->_floatingSearchIconView, "setAlpha:");
    [(_UISearchBarSearchContainerLayout *)self floatingSearchIconLayoutFrame];
    -[UIImageView setFrame:](self->_floatingSearchIconView, "setFrame:");
    [(_UISearchBarSearchContainerLayout *)self floatingSearchIconBackgroundAlpha];
    -[UIView setAlpha:](self->_floatingSearchIconBackgroundView, "setAlpha:");
    [(_UISearchBarSearchContainerLayout *)self floatingSearchIconBackgroundLayoutFrame];
    -[UIView setFrame:](self->_floatingSearchIconBackgroundView, "setFrame:");
    [(UITextField *)self->_searchField _setForegroundViewsAlpha:self->_searchFieldForegroundFadeAlpha];
    [(UISearchTextField *)self->_searchField _setBackgroundViewsAlpha:self->_searchFieldBackgroundFadeAlpha];
    [(_UISearchBarSearchContainerLayout *)self mainContentAlpha];
    -[UIView setAlpha:](self->_searchField, "setAlpha:");
    [(_UISearchBarSearchContainerLayout *)self leftButtonLayoutFrame];
    -[UIView setFrame:](self->_leftButton, "setFrame:");
    uint64_t v3 = 12;
    if ((*(_WORD *)&self->_searchContainerLayoutFlags & 2) == 0) {
      uint64_t v3 = 11;
    }
    id v4 = objc_retain(*(id *)((char *)&self->super.super.isa
                           + OBJC_IVAR____UISearchBarSearchContainerLayout__searchFieldLayoutFrame[v3]));
    if ((*(_WORD *)&self->_searchContainerLayoutFlags & 2) != 0) {
      [(_UISearchBarSearchContainerLayout *)self deleteButtonLayoutFrame];
    }
    else {
      [(_UISearchBarSearchContainerLayout *)self cancelButtonLayoutFrame];
    }
    double v9 = v5;
    double v10 = v6;
    double v11 = v7;
    double v12 = v8;
    int v13 = *(_WORD *)&self->_searchContainerLayoutFlags & 3;
    double v14 = [v4 subviews];
    uint64_t v15 = [v14 count];

    if (v15
      || !+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      objc_msgSend(v4, "setFrame:", v9, v10, v11, v12);
      if (v13) {
        double v16 = 1.0;
      }
      else {
        double v16 = 0.0;
      }
      [(_UISearchBarSearchContainerLayout *)self mainContentAlpha];
      [v4 setAlpha:v16 * v17];
    }
    else
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __48___UISearchBarSearchContainerLayout_applyLayout__block_invoke;
      v18[3] = &unk_1E52DF1E0;
      double v21 = v9;
      double v22 = v10;
      double v23 = v11;
      double v24 = v12;
      BOOL v25 = v13 != 0;
      id v19 = v4;
      v20 = self;
      +[UIView performWithoutAnimation:v18];
    }
  }
}

- (double)mainContentAlpha
{
  return self->_mainContentAlpha;
}

- (CGRect)searchFieldLayoutFrame
{
  [(_UISearchBarLayoutBase *)self updateLayoutIfNeeded];
  double x = self->_searchFieldLayoutFrame.origin.x;
  double y = self->_searchFieldLayoutFrame.origin.y;
  double width = self->_searchFieldLayoutFrame.size.width;
  double height = self->_searchFieldLayoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)leftButtonLayoutFrame
{
  [(_UISearchBarLayoutBase *)self updateLayoutIfNeeded];
  double x = self->_leftButtonLayoutFrame.origin.x;
  double y = self->_leftButtonLayoutFrame.origin.y;
  double width = self->_leftButtonLayoutFrame.size.width;
  double height = self->_leftButtonLayoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)floatingSearchIconLayoutFrame
{
  double x = self->_floatingSearchIconLayoutFrame.origin.x;
  double y = self->_floatingSearchIconLayoutFrame.origin.y;
  double width = self->_floatingSearchIconLayoutFrame.size.width;
  double height = self->_floatingSearchIconLayoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)floatingSearchIconBackgroundLayoutFrame
{
  double x = self->_floatingSearchIconBackgroundLayoutFrame.origin.x;
  double y = self->_floatingSearchIconBackgroundLayoutFrame.origin.y;
  double width = self->_floatingSearchIconBackgroundLayoutFrame.size.width;
  double height = self->_floatingSearchIconBackgroundLayoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)floatingSearchIconBackgroundAlpha
{
  return self->_floatingSearchIconBackgroundAlpha;
}

- (double)floatingSearchIconAlpha
{
  return self->_floatingSearchIconAlpha;
}

- (CGRect)cancelButtonLayoutFrame
{
  [(_UISearchBarLayoutBase *)self updateLayoutIfNeeded];
  double x = self->_cancelButtonLayoutFrame.origin.x;
  double y = self->_cancelButtonLayoutFrame.origin.y;
  double width = self->_cancelButtonLayoutFrame.size.width;
  double height = self->_cancelButtonLayoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)updateLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained containerLayoutWillUpdateLayout:self];

  if ((*(_WORD *)&self->_searchContainerLayoutFlags & 0x20) == 0)
  {
    [(_UISearchBarLayoutBase *)self contentInset];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [(_UISearchBarLayoutBase *)self layoutSize];
    double v13 = v12;
    double v15 = v14;
    double v16 = (double *)MEMORY[0x1E4F1DB28];
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    BOOL v19 = [(_UISearchBarLayoutBase *)self isLayoutRTL];
    double v20 = 1.0;
    if ((*(_WORD *)&self->_searchContainerLayoutFlags & 0x40) == 0) {
      double v20 = 0.0;
    }
    cancelButton = self->_cancelButton;
    double v132 = v20;
    if (cancelButton || (cancelButton = self->_deleteButton, rect = v18, CGFloat v149 = v17, cancelButton))
    {
      -[UIView sizeThatFits:](cancelButton, "sizeThatFits:", v13, v15);
      CGFloat v149 = v22;
      double rect = v23;
    }
    -[UIView sizeThatFits:](self->_leftButton, "sizeThatFits:", v13, v15);
    CGFloat v136 = v25;
    CGFloat v137 = v24;
    [(_UISearchBarSearchContainerLayout *)self searchFieldHeightUpdatingShrinkageAndFadeAlphas];
    p_visibleCancelButtonSearchFieldLayoutFrame = &self->_visibleCancelButtonSearchFieldLayoutFrame;
    self->_visibleCancelButtonSearchFieldLayoutFrame.origin.double y = 0.0;
    self->_visibleCancelButtonSearchFieldLayoutFrame.size.double width = 0.0;
    self->_visibleCancelButtonSearchFieldLayoutFrame.origin.double x = 0.0;
    double v153 = v27;
    self->_visibleCancelButtonSearchFieldLayoutFrame.size.double height = v27;
    __int16 searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
    double v131 = v17;
    CGFloat v139 = v18;
    if ((searchContainerLayoutFlags & 0x10) != 0)
    {
      double v144 = 11.0;
    }
    else
    {
      [(_UISearchBarSearchContainerLayout *)self additionalPaddingForCancelButtonAtLeadingEdge];
      double v144 = v29 + 11.0;
      __int16 searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
    }
    double v30 = v13 - v7;
    double v146 = v5;
    double v31 = v15 - v5;
    double v32 = v16[1];
    double v150 = *v16;
    double v33 = 0.0;
    double v34 = 0.0;
    CGFloat v142 = v32;
    if ((searchContainerLayoutFlags & 0x10) == 0)
    {
      [(_UISearchBarSearchContainerLayout *)self additionalPaddingForSearchFieldAtLeadingEdge];
      double v32 = v142;
      double v34 = v35;
    }
    double v36 = v30 - v11;
    double v37 = v31 - v9;
    CGFloat v38 = v149;
    double v39 = v150;
    CGFloat v40 = v32;
    double v41 = rect;
    double v140 = v144 + CGRectGetWidth(*(CGRect *)(&v32 - 1));
    if (self->_leftButton)
    {
      v158.origin.double x = v150;
      v158.origin.double y = v40;
      v158.size.double height = v136;
      v158.size.double width = v137;
      double v33 = CGRectGetWidth(v158) + 11.0;
    }
    __int16 v42 = (__int16)self->_searchContainerLayoutFlags;
    double v43 = 0.0;
    if ((v42 & 4) != 0) {
      double v44 = v33;
    }
    else {
      double v44 = 0.0;
    }
    int v45 = v42 & 3;
    if ((v42 & 3) != 0) {
      double v46 = v140;
    }
    else {
      double v46 = 0.0;
    }
    if ((v42 & 3) != 0) {
      double v43 = v34;
    }
    double v47 = v44 + v43;
    CGFloat v148 = v146;
    v159.origin.double x = v7;
    v159.origin.double y = v146;
    v159.size.double width = v36;
    v159.size.double height = v37;
    double v48 = CGRectGetWidth(v159) - v46 - v47;
    v160.origin.double x = v7;
    v160.origin.double y = v146;
    v160.size.double width = v36;
    v160.size.double height = v37;
    self->_visibleCancelButtonSearchFieldLayoutFrame.size.double width = CGRectGetWidth(v160) - v140 - v33;
    v161.origin.double x = v7;
    v161.origin.double y = v146;
    v161.size.double width = v36;
    v161.size.double height = v37;
    double v49 = CGRectGetMinX(v161) + v47;
    CGFloat v50 = v48;
    v162.origin.double x = v7;
    v162.origin.double y = v146;
    v162.size.double width = v36;
    v162.size.double height = v37;
    p_visibleCancelButtonSearchFieldLayoutFrame->origin.double x = v33 + CGRectGetMinX(v162);
    __int16 v51 = (__int16)self->_searchContainerLayoutFlags;
    if ((v51 & 0x400) != 0
      && (double searchBarReadableWidth = self->_searchBarReadableWidth,
          v163.origin.double y = 0.0,
          v163.origin.double x = v49,
          v163.size.double width = v48,
          v163.size.double height = v153,
          CGFloat Width = CGRectGetWidth(v163),
          __int16 v51 = (__int16)self->_searchContainerLayoutFlags,
          searchBarReadableWidth < Width))
    {
      *(_WORD *)&self->___int16 searchContainerLayoutFlags = v51 | 0x800;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __49___UISearchBarSearchContainerLayout_updateLayout__block_invoke;
      aBlock[3] = &unk_1E52DF1B8;
      aBlock[4] = self;
      *(double *)&aBlock[5] = v7;
      *(double *)&aBlock[6] = v146;
      *(double *)&aBlock[7] = v36;
      *(double *)&aBlock[8] = v37;
      BOOL v157 = v19;
      v54 = (double (**)(double, double, double, double))_Block_copy(aBlock);
      double v49 = v54[2](v49, 0.0, v48, v153);
      CGFloat v56 = v55;
      CGFloat v50 = v57;
      double v153 = v58;
      self->_visibleCancelButtonSearchFieldLayoutFrame.origin.double x = ((double (*)(double (**)(double, double, double, double), CGFloat, CGFloat, CGFloat, CGFloat))v54[2])(v54, self->_visibleCancelButtonSearchFieldLayoutFrame.origin.x, self->_visibleCancelButtonSearchFieldLayoutFrame.origin.y, self->_visibleCancelButtonSearchFieldLayoutFrame.size.width, self->_visibleCancelButtonSearchFieldLayoutFrame.size.height);
      self->_visibleCancelButtonSearchFieldLayoutFrame.origin.double y = v59;
      self->_visibleCancelButtonSearchFieldLayoutFrame.size.double width = v60;
      self->_visibleCancelButtonSearchFieldLayoutFrame.size.double height = v61;
    }
    else
    {
      *(_WORD *)&self->___int16 searchContainerLayoutFlags = v51 & 0xF7FF;
      CGFloat v56 = 0.0;
    }
    double v151 = v50;
    v164.origin.double x = v7;
    v164.origin.double y = v146;
    v164.size.double width = v36;
    v164.size.double height = v37;
    double MinX = CGRectGetMinX(v164);
    v165.origin.double x = v7;
    v165.origin.double y = v146;
    v165.size.double width = v36;
    v165.size.double height = v37;
    double MaxX = CGRectGetMaxX(v165);
    v166.size.double width = v149;
    v166.origin.double x = v150;
    v166.origin.double y = v142;
    v166.size.double height = rect;
    double v63 = MaxX - CGRectGetWidth(v166);
    v167.origin.double x = v49;
    v167.origin.double y = v56;
    v167.size.double width = v50;
    v167.size.double height = v153;
    double v64 = fmax(v63, v144 + CGRectGetMaxX(v167));
    if (v45) {
      double v64 = v63;
    }
    CGFloat v135 = v36;
    if (v19)
    {
      double v145 = v63;
      v168.origin.double x = v7;
      v168.origin.double y = v146;
      v168.size.double width = v36;
      v168.size.double height = v37;
      double v65 = CGRectGetMinX(v168);
      v169.origin.double x = v7;
      v169.origin.double y = v146;
      v169.size.double width = v36;
      double v66 = v37;
      v169.size.double height = v37;
      double v67 = v65 + CGRectGetMaxX(v169);
      v170.origin.double x = v49;
      v170.origin.double y = v56;
      v170.size.double width = v50;
      v170.size.double height = v153;
      double v68 = v67 - CGRectGetMaxX(v170);
      p_visibleCancelButtonSearchFieldLayoutFrame->origin.double x = fmax(v68, v140 + MinX);
      double v49 = v68;
      if (v45)
      {
        double v141 = MinX;
      }
      else
      {
        CGFloat v69 = v56;
        CGFloat v70 = v50;
        double v71 = v153;
        double v141 = fmin(MinX, CGRectGetMinX(*(CGRect *)&v68) - v140);
      }
    }
    else
    {
      double v141 = v64;
      double v66 = v37;
      double v145 = MinX;
    }
    double v72 = v146;
    CGFloat v73 = v66;
    if (![(_UISearchBarLayoutBase *)self isHostedByNavigationBar])
    {
      v171.origin.double x = v7;
      v171.origin.double y = v146;
      v171.size.double width = v36;
      v171.size.double height = v66;
      double Height = CGRectGetHeight(v171);
      v172.origin.double x = v49;
      v172.origin.double y = v56;
      v172.size.double width = v151;
      v172.size.double height = v153;
      double v75 = v146 + (Height - CGRectGetHeight(v172)) * 0.5;
      v76 = +[UIDevice currentDevice];
      uint64_t v77 = [v76 userInterfaceIdiom];
      double v78 = ceil(v75);
      double v79 = floor(v75);
      if (v77 == 1) {
        double v72 = v78;
      }
      else {
        double v72 = v79;
      }
    }
    if (self->_searchFieldBackgroundPositionAdjustment.horizontal != 0.0
      || self->_searchFieldBackgroundPositionAdjustment.vertical != 0.0)
    {
      UIOffset searchFieldBackgroundPositionAdjustment = self->_searchFieldBackgroundPositionAdjustment;
      v80 = [MEMORY[0x1E4F29238] valueWithBytes:&searchFieldBackgroundPositionAdjustment objCType:"{UIOffset=dd}"];
      v81 = v80;
      if (v80)
      {
        [v80 UIOffsetValue];
        if (v19) {
          double v82 = -v82;
        }
        double v49 = v49 + v82;
        double v72 = v72 + v83;
      }
    }
    self->_visibleCancelButtonSearchFieldLayoutFrame.origin.double y = v72;
    delegateSearchFieldFrameForProposedFrame = (double (**)(double, double, double, double))self->_delegateSearchFieldFrameForProposedFrame;
    __int16 v85 = (__int16)self->_searchContainerLayoutFlags;
    if (!delegateSearchFieldFrameForProposedFrame || (v85 & 0x10) != 0)
    {
      double v86 = v153;
    }
    else
    {
      double v49 = delegateSearchFieldFrameForProposedFrame[2](v49, v72, v151, v153);
      double v72 = v87;
      double v151 = v88;
      __int16 v85 = (__int16)self->_searchContainerLayoutFlags;
    }
    double v89 = round(v146 + v66 * 0.5 - rect * 0.5);
    double v90 = -1.0;
    CGFloat v147 = v49;
    CGFloat v154 = v86;
    if ((v85 & 0x40) != 0)
    {
      double v134 = v89;
      v102 = [(UIBarButtonItem *)self->_searchIconBarButtonItem view];
      [v102 imageViewSize];
      CGFloat v101 = v103;
      double v105 = v104;

      v173.origin.double x = v7;
      CGFloat v106 = v148;
      v173.origin.double y = v148;
      v173.size.double width = v36;
      v173.size.double height = v73;
      CGRectGetWidth(v173);
      UIRoundToViewScale(self->_floatingSearchIconView);
      double v108 = v107;
      v174.origin.double x = v7;
      v174.origin.double y = v148;
      v174.size.double width = v36;
      v174.size.double height = v73;
      double v129 = v108 + CGRectGetMinX(v174);
      v175.origin.double x = v7;
      v175.origin.double y = v148;
      v175.size.double width = v36;
      v175.size.double height = v73;
      CGRectGetHeight(v175);
      double v130 = v105;
      UIRoundToViewScale(self->_floatingSearchIconView);
      double v110 = v109;
      v176.origin.double x = v7;
      v176.origin.double y = v148;
      v176.size.double width = v36;
      v176.size.double height = v73;
      double MinY = CGRectGetMinY(v176);
      double v96 = v110 + MinY;
      if ((*(_WORD *)&self->_searchContainerLayoutFlags & 8) == 0)
      {
        CGFloat v97 = v131;
        double v98 = v132;
        double v100 = v142;
        CGFloat v99 = v145;
        double v89 = v134;
LABEL_57:
        double v90 = -1.0;
        double v95 = v129;
        CGFloat v92 = v130;
LABEL_58:
        double v126 = v89 + v90;
        self->_searchFieldLayoutFrame.origin.double x = v147;
        self->_searchFieldLayoutFrame.origin.double y = v72;
        self->_searchFieldLayoutFrame.size.double width = v151;
        self->_searchFieldLayoutFrame.size.double height = v154;
        self->_floatingSearchIconLayoutFrame.origin.double x = v95;
        self->_floatingSearchIconLayoutFrame.origin.double y = v96;
        self->_floatingSearchIconLayoutFrame.size.double width = v101;
        self->_floatingSearchIconLayoutFrame.size.double height = v92;
        self->_floatingSearchIconAlpha = v98;
        self->_floatingSearchIconBackgroundLayoutFrame.origin.double x = v150;
        self->_floatingSearchIconBackgroundLayoutFrame.origin.double y = v100;
        self->_floatingSearchIconBackgroundLayoutFrame.size.double width = v97;
        self->_floatingSearchIconBackgroundLayoutFrame.size.double height = v139;
        self->_floatingSearchIconBackgroundAlpha = v98;
        self->_mainContentAlpha = 1.0 - v98;
        if (self->_cancelButton)
        {
          v127 = &OBJC_IVAR____UISearchBarSearchContainerLayout__cancelButtonLayoutFrame;
        }
        else
        {
          v127 = &OBJC_IVAR____UISearchBarSearchContainerLayout__deleteButtonLayoutFrame;
          if (!self->_deleteButton) {
            goto LABEL_62;
          }
        }
        v128 = (double *)((char *)self + *v127);
        double *v128 = v141;
        v128[1] = v126;
        v128[2] = v149;
        v128[3] = rect;
LABEL_62:
        if (self->_leftButton)
        {
          self->_leftButtonLayoutFrame.origin.double x = v99;
          self->_leftButtonLayoutFrame.origin.double y = v126;
          self->_leftButtonLayoutFrame.size.double width = v137;
          self->_leftButtonLayoutFrame.size.double height = v136;
        }
        return;
      }
      double v143 = v110 + MinY;
      v117 = [(UIBarButtonItem *)self->_searchIconBarButtonItem view];
      [v117 backgroundSize];
      double v119 = v118;
      double v121 = v120;

      v179.origin.double x = v7;
      v179.origin.double y = v148;
      v179.size.double width = v135;
      v179.size.double height = v73;
      CGRectGetWidth(v179);
      CGFloat v97 = v119;
      p_floatingSearchIconBackgroundView = (void **)&self->_floatingSearchIconBackgroundView;
      UIRoundToViewScale(self->_floatingSearchIconBackgroundView);
      double v123 = v122;
      v180.origin.double x = v7;
      v180.origin.double y = v148;
      v180.size.double width = v135;
      v180.size.double height = v73;
      double v150 = v123 + CGRectGetMinX(v180);
      v181.origin.double x = v7;
      v181.origin.double y = v148;
      v181.size.double width = v135;
      v181.size.double height = v73;
      CGRectGetHeight(v181);
      CGFloat v139 = v121;
      double v36 = v135;
    }
    else
    {
      -[UISearchTextField _searchIconViewRectForBounds:](self->_searchField, "_searchIconViewRectForBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v151);
      double v138 = v93;
      double v95 = v49 + v94;
      double v96 = v72 + v91;
      CGFloat v97 = v131;
      if ((*(_WORD *)&self->_searchContainerLayoutFlags & 8) == 0)
      {
        double v98 = v132;
        double v100 = v142;
        CGFloat v99 = v145;
        CGFloat v101 = v138;
        goto LABEL_58;
      }
      double v143 = v72 + v91;
      double v129 = v95;
      double v130 = v92;
      double v134 = v89;
      v112 = [(UIBarButtonItem *)self->_searchIconBarButtonItem view];
      [v112 backgroundSize];
      CGFloat v97 = v113;
      double v115 = v114;

      v177.origin.double x = v7;
      CGFloat v106 = v148;
      v177.origin.double y = v148;
      v177.size.double width = v36;
      v177.size.double height = v66;
      double v150 = CGRectGetMinX(v177);
      v178.origin.double x = v7;
      v178.origin.double y = v148;
      v178.size.double width = v36;
      v178.size.double height = v66;
      CGRectGetHeight(v178);
      CGFloat v139 = v115;
      p_floatingSearchIconBackgroundView = (void **)&self->_floatingSearchIconBackgroundView;
      CGFloat v101 = v138;
    }
    UIRoundToViewScale(*p_floatingSearchIconBackgroundView);
    double v125 = v124;
    v182.origin.double x = v7;
    v182.origin.double y = v106;
    v182.size.double width = v36;
    v182.size.double height = v73;
    double v100 = v125 + CGRectGetMinY(v182);
    double v98 = v132;
    double v89 = v134;
    double v96 = v143;
    CGFloat v99 = v145;
    goto LABEL_57;
  }
}

- (double)searchFieldHeightUpdatingShrinkageAndFadeAlphas
{
  [(_UISearchBarSearchContainerLayout *)self naturalSearchFieldHeight];
  double v4 = v3;
  if ((*(_WORD *)&self->_searchContainerLayoutFlags & 0x80) != 0)
  {
    [(_UISearchBarLayoutBase *)self layoutSize];
    double v8 = v7;
    [(_UISearchBarSearchContainerLayout *)self naturalContainerHeight];
    double v10 = fmax(v9 - v8, 0.0);
    if (v4 <= v10) {
      double v10 = v4;
    }
    double v11 = v10 / v4;
    double v4 = v4 - v10;
    double v12 = fmax(v11 / 0.2, 0.0);
    if (v12 >= 1.0) {
      double v13 = 0.0;
    }
    else {
      double v13 = 1.0 - v12;
    }
    double v5 = &OBJC_IVAR____UISearchBarSearchContainerLayout__searchFieldBackgroundFadeAlpha;
    self->_searchFieldForegroundFadeAlpha = v13;
    double v14 = fmax((v11 + -0.8) / 0.15, 0.0);
    if (v14 >= 1.0) {
      double v6 = 0.0;
    }
    else {
      double v6 = 1.0 - v14;
    }
  }
  else
  {
    double v5 = &OBJC_IVAR____UISearchBarSearchContainerLayout__searchFieldForegroundFadeAlpha;
    self->_searchFieldBackgroundFadeAlpha = 1.0;
    double v6 = 1.0;
  }
  *(double *)((char *)&self->super.super.isa + *v5) = v6;
  return v4;
}

- (double)naturalSearchFieldHeight
{
  if ((*(_WORD *)&self->_searchContainerLayoutFlags & 0x100) == 0
    || ([(UITextField *)self->_searchField background],
        double v4 = objc_claimAutoreleasedReturnValue(),
        [v4 size],
        double v6 = v5,
        v4,
        v6 == 0.0))
  {
    [(_UISearchBarSearchContainerLayout *)self searchBarFieldHeight];
    double v6 = v7;
    if (v7 == 0.0)
    {
      double v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"_UISearchBarSearchContainerLayout.m" lineNumber:201 description:@"searchBarFieldHeight is unexpectedly 0.0 in naturalContainerHeight"];
    }
  }
  if ((*(_WORD *)&self->_searchContainerLayoutFlags & 0x200) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained layout:self fontScaledValueForValue:v6];
    double v6 = v9;
  }
  return v6;
}

- (double)additionalPaddingForSearchFieldAtLeadingEdge
{
  return self->_additionalPaddingForSearchFieldAtLeadingEdge;
}

- (double)additionalPaddingForCancelButtonAtLeadingEdge
{
  return self->_additionalPaddingForCancelButtonAtLeadingEdge;
}

- (void)setDelegateSearchFieldFrameForProposedFrame:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_layoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback, 0);
  objc_storeStrong(&self->_delegateSearchFieldFrameForProposedFrame, 0);
  objc_storeStrong((id *)&self->_searchIconBarButtonItem, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_floatingSearchIconBackgroundView, 0);
  objc_storeStrong((id *)&self->_floatingSearchIconView, 0);
  objc_storeStrong((id *)&self->_searchField, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (CGRect)deleteButtonLayoutFrame
{
  [(_UISearchBarLayoutBase *)self updateLayoutIfNeeded];
  double x = self->_deleteButtonLayoutFrame.origin.x;
  double y = self->_deleteButtonLayoutFrame.origin.y;
  double width = self->_deleteButtonLayoutFrame.size.width;
  double height = self->_deleteButtonLayoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)visibleCancelButtonSearchFieldLayoutFrame
{
  [(_UISearchBarLayoutBase *)self updateLayoutIfNeeded];
  double x = self->_visibleCancelButtonSearchFieldLayoutFrame.origin.x;
  double y = self->_visibleCancelButtonSearchFieldLayoutFrame.origin.y;
  double width = self->_visibleCancelButtonSearchFieldLayoutFrame.size.width;
  double height = self->_visibleCancelButtonSearchFieldLayoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)searchFieldWidthIsReduced
{
  return (*(_WORD *)&self->_searchContainerLayoutFlags >> 11) & 1;
}

- (BOOL)isHostedInlineByNavigationBar
{
  return (*(_WORD *)&self->_searchContainerLayoutFlags >> 4) & 1;
}

- (BOOL)isTextFieldManagedInNSToolbar
{
  return (*(_WORD *)&self->_searchContainerLayoutFlags >> 5) & 1;
}

- (BOOL)drawsSearchIconOnly
{
  return (*(_WORD *)&self->_searchContainerLayoutFlags >> 6) & 1;
}

- (BOOL)hasCancelButton
{
  return *(_WORD *)&self->_searchContainerLayoutFlags & 1;
}

- (BOOL)hasDeleteButton
{
  return (*(_WORD *)&self->_searchContainerLayoutFlags >> 1) & 1;
}

- (BOOL)hasLeftButton
{
  return (*(_WORD *)&self->_searchContainerLayoutFlags >> 2) & 1;
}

- (BOOL)hasFloatingSearchIconBackgroundView
{
  return (*(_WORD *)&self->_searchContainerLayoutFlags >> 3) & 1;
}

- (BOOL)allowSearchFieldShrinkage
{
  return (*(_WORD *)&self->_searchContainerLayoutFlags >> 7) & 1;
}

- (BOOL)searchFieldUsesCustomBackgroundImage
{
  return HIBYTE(*(_WORD *)&self->_searchContainerLayoutFlags) & 1;
}

- (BOOL)searchFieldEffectivelySupportsDynamicType
{
  return (*(_WORD *)&self->_searchContainerLayoutFlags >> 9) & 1;
}

- (BOOL)searchFieldRespectsReadableWidth
{
  return (*(_WORD *)&self->_searchContainerLayoutFlags >> 10) & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_UISearchBarSearchContainerLayout;
  double v4 = [(_UISearchBarLayoutBase *)&v12 copyWithZone:a3];
  double v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 17, self->_searchField);
    objc_storeStrong(v5 + 18, self->_floatingSearchIconView);
    objc_storeStrong(v5 + 19, self->_floatingSearchIconBackgroundView);
    objc_storeStrong(v5 + 20, self->_cancelButton);
    objc_storeStrong(v5 + 21, self->_deleteButton);
    objc_storeStrong(v5 + 22, self->_leftButton);
    v5[9] = *(id *)&self->_searchContainerLayoutFlags;
    v5[23] = *(id *)&self->_searchBarReadableWidth;
    *((_OWORD *)v5 + 17) = self->_searchFieldBackgroundPositionAdjustment;
    v5[32] = *(id *)&self->_additionalPaddingForCancelButtonAtLeadingEdge;
    v5[33] = *(id *)&self->_additionalPaddingForSearchFieldAtLeadingEdge;
    v5[26] = *(id *)&self->_searchBarFieldHeight;
    CGSize size = self->_searchFieldLayoutFrame.size;
    *((_OWORD *)v5 + 18) = self->_searchFieldLayoutFrame.origin;
    *((CGSize *)v5 + 19) = size;
    CGSize v7 = self->_cancelButtonLayoutFrame.size;
    *((_OWORD *)v5 + 20) = self->_cancelButtonLayoutFrame.origin;
    *((CGSize *)v5 + 21) = v7;
    CGSize v8 = self->_deleteButtonLayoutFrame.size;
    *((_OWORD *)v5 + 22) = self->_deleteButtonLayoutFrame.origin;
    *((CGSize *)v5 + 23) = v8;
    CGSize v9 = self->_leftButtonLayoutFrame.size;
    *((_OWORD *)v5 + 24) = self->_leftButtonLayoutFrame.origin;
    *((CGSize *)v5 + 25) = v9;
    CGSize v10 = self->_visibleCancelButtonSearchFieldLayoutFrame.size;
    *((_OWORD *)v5 + 26) = self->_visibleCancelButtonSearchFieldLayoutFrame.origin;
    *((CGSize *)v5 + 27) = v10;
    v5[10] = *(id *)&self->_searchFieldForegroundFadeAlpha;
    v5[11] = *(id *)&self->_searchFieldBackgroundFadeAlpha;
    [v5 setDelegateSearchFieldFrameForProposedFrame:self->_delegateSearchFieldFrameForProposedFrame];
    [v5 setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:self->_layoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback];
  }
  return v5;
}

- (double)_effectiveInactiveWidth
{
  [(_UISearchBarSearchContainerLayout *)self overrideInactiveWidth];
  if (v3 <= 0.0)
  {
    [(_UISearchBarSearchContainerLayout *)self defaultInactiveWidth];
  }
  else
  {
    [(_UISearchBarSearchContainerLayout *)self overrideInactiveWidth];
  }
  return result;
}

- (double)_effectiveActiveWidth
{
  [(_UISearchBarSearchContainerLayout *)self overrideActiveWidth];
  if (v3 <= 0.0)
  {
    [(_UISearchBarSearchContainerLayout *)self defaultActiveWidth];
  }
  else
  {
    [(_UISearchBarSearchContainerLayout *)self overrideActiveWidth];
  }
  return result;
}

- (double)prescribedWidth
{
  double v3 = 0.0;
  if ([(_UISearchBarSearchContainerLayout *)self isHostedInlineByNavigationBar])
  {
    if ([(_UISearchBarSearchContainerLayout *)self drawsSearchIconOnly])
    {
      double v4 = [(UIBarButtonItem *)self->_searchIconBarButtonItem view];
      objc_msgSend(v4, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      double v3 = v5;
    }
    else
    {
      if (self->_representedLayoutState == 3) {
        [(_UISearchBarSearchContainerLayout *)self _effectiveActiveWidth];
      }
      else {
        [(_UISearchBarSearchContainerLayout *)self _effectiveInactiveWidth];
      }
      double v7 = v6;
      [(_UISearchBarLayoutBase *)self contentInset];
      double v9 = v7 + v8;
      [(_UISearchBarLayoutBase *)self contentInset];
      double v3 = v9 + v10;
      if ([(_UISearchBarSearchContainerLayout *)self hasCancelButton])
      {
        -[UIView sizeThatFits:](self->_cancelButton, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
        return v3 + v11 + 11.0;
      }
    }
  }
  return v3;
}

- (id)description
{
  v25.receiver = self;
  v25.super_class = (Class)_UISearchBarSearchContainerLayout;
  double v3 = [(_UISearchBarLayoutBase *)&v25 description];
  if (!os_variant_has_internal_diagnostics()) {
    goto LABEL_2;
  }
  [(_UISearchBarSearchContainerLayout *)self naturalContainerHeight];
  uint64_t v6 = v5;
  [(_UISearchBarSearchContainerLayout *)self naturalSearchFieldHeight];
  double v8 = objc_msgSend(v3, "stringByAppendingFormat:", @" naturalContainerHeight=%g naturalSearchFieldHeight=%g", v6, v7);

  if (self->_leftButton)
  {
    uint64_t v9 = objc_msgSend(v8, "stringByAppendingFormat:", @" leftButton=%p", self->_leftButton);

    double v8 = (void *)v9;
  }
  if (self->_cancelButton)
  {
    uint64_t v10 = objc_msgSend(v8, "stringByAppendingFormat:", @" cancelButton=%p", self->_cancelButton);

    double v8 = (void *)v10;
  }
  if (self->_deleteButton)
  {
    uint64_t v11 = objc_msgSend(v8, "stringByAppendingFormat:", @" deleteButton=%p", self->_deleteButton);

    double v8 = (void *)v11;
  }
  if (self->_searchField)
  {
    uint64_t v12 = objc_msgSend(v8, "stringByAppendingFormat:", @" searchField=%p", self->_searchField);

    double v8 = (void *)v12;
  }
  if (self->_floatingSearchIconView)
  {
    uint64_t v13 = objc_msgSend(v8, "stringByAppendingFormat:", @" searchIconView=%p", self->_floatingSearchIconView);

    double v8 = (void *)v13;
  }
  __int16 searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if ((searchContainerLayoutFlags & 0x80) != 0)
  {
    uint64_t v22 = [v8 stringByAppendingString:@" allowSearchFieldShrinkage"];

    __int16 searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
    double v8 = (void *)v22;
    if ((searchContainerLayoutFlags & 0x100) == 0)
    {
LABEL_17:
      if ((searchContainerLayoutFlags & 0x200) == 0) {
        goto LABEL_18;
      }
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&self->_searchContainerLayoutFlags & 0x100) == 0)
  {
    goto LABEL_17;
  }
  uint64_t v23 = [v8 stringByAppendingString:@" searchFieldUsesCustomBackgroundImage"];

  __int16 searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  double v8 = (void *)v23;
  if ((searchContainerLayoutFlags & 0x200) == 0)
  {
LABEL_18:
    if ((searchContainerLayoutFlags & 0x400) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_33:
  uint64_t v24 = [v8 stringByAppendingString:@" supportsDynamicType"];

  double v8 = (void *)v24;
  if ((*(_WORD *)&self->_searchContainerLayoutFlags & 0x400) != 0)
  {
LABEL_19:
    uint64_t v15 = objc_msgSend(v8, "stringByAppendingFormat:", @" readableWidth=%g", *(void *)&self->_searchBarReadableWidth);

    double v8 = (void *)v15;
  }
LABEL_20:
  double vertical = self->_searchFieldBackgroundPositionAdjustment.vertical;
  if (self->_searchFieldBackgroundPositionAdjustment.horizontal != 0.0 || vertical != 0.0)
  {
    uint64_t v17 = objc_msgSend(v8, "stringByAppendingFormat:", @" searchFieldBackgroundPositionAdjustment=(%g,%g)", *(void *)&self->_searchFieldBackgroundPositionAdjustment.horizontal, *(void *)&vertical);

    double v8 = (void *)v17;
  }
  if ([(_UISearchBarLayoutBase *)self isLayoutValid])
  {
    double v18 = [v8 stringByAppendingString:@" layoutFrames:"];

    if (self->_leftButton)
    {
      objc_msgSend(v18, "stringByAppendingFormat:", @" leftButton=(%g, %g; %g, %g)",
        *(void *)&self->_leftButtonLayoutFrame.origin.x,
        *(void *)&self->_leftButtonLayoutFrame.origin.y,
        *(void *)&self->_leftButtonLayoutFrame.size.width,
      uint64_t v19 = *(void *)&self->_leftButtonLayoutFrame.size.height);

      double v18 = (void *)v19;
    }
    if (self->_cancelButton)
    {
      objc_msgSend(v18, "stringByAppendingFormat:", @" cancelButton=(%g, %g; %g, %g)",
        *(void *)&self->_cancelButtonLayoutFrame.origin.x,
        *(void *)&self->_cancelButtonLayoutFrame.origin.y,
        *(void *)&self->_cancelButtonLayoutFrame.size.width,
      uint64_t v20 = *(void *)&self->_cancelButtonLayoutFrame.size.height);

      double v18 = (void *)v20;
    }
    if (self->_deleteButton)
    {
      objc_msgSend(v18, "stringByAppendingFormat:", @" deleteButton=(%g, %g; %g, %g)",
        *(void *)&self->_deleteButtonLayoutFrame.origin.x,
        *(void *)&self->_deleteButtonLayoutFrame.origin.y,
        *(void *)&self->_deleteButtonLayoutFrame.size.width,
      uint64_t v21 = *(void *)&self->_deleteButtonLayoutFrame.size.height);

      double v18 = (void *)v21;
    }
    objc_msgSend(v18, "stringByAppendingFormat:", @" searchField=(%g, %g; %g, %g)",
      *(void *)&self->_searchFieldLayoutFrame.origin.x,
      *(void *)&self->_searchFieldLayoutFrame.origin.y,
      *(void *)&self->_searchFieldLayoutFrame.size.width,
    double v3 = *(void *)&self->_searchFieldLayoutFrame.size.height);
  }
  else
  {
    double v3 = v8;
  }
LABEL_2:
  return v3;
}

- (double)defaultInactiveWidth
{
  return self->_defaultInactiveWidth;
}

- (double)defaultActiveWidth
{
  return self->_defaultActiveWidth;
}

- (double)overrideInactiveWidth
{
  return self->_overrideInactiveWidth;
}

- (double)overrideActiveWidth
{
  return self->_overrideActiveWidth;
}

- (UIImageView)floatingSearchIconView
{
  return self->_floatingSearchIconView;
}

- (UIView)floatingSearchIconBackgroundView
{
  return self->_floatingSearchIconBackgroundView;
}

- (void)setFloatingSearchIconBackgroundView:(id)a3
{
}

- (UIView)cancelButton
{
  return self->_cancelButton;
}

- (UIView)deleteButton
{
  return self->_deleteButton;
}

- (UIView)leftButton
{
  return self->_leftButton;
}

- (double)searchBarReadableWidth
{
  return self->_searchBarReadableWidth;
}

- (UIOffset)searchFieldBackgroundPositionAdjustment
{
  double horizontal = self->_searchFieldBackgroundPositionAdjustment.horizontal;
  double vertical = self->_searchFieldBackgroundPositionAdjustment.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (UIBarButtonItem)searchIconBarButtonItem
{
  return self->_searchIconBarButtonItem;
}

- (int64_t)representedLayoutState
{
  return self->_representedLayoutState;
}

- (id)delegateSearchFieldFrameForProposedFrame
{
  return self->_delegateSearchFieldFrameForProposedFrame;
}

- (id)layoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback
{
  return self->_layoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback;
}

- (void)setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:(id)a3
{
}

- (void)setAdditionalPaddingForCancelButtonAtLeadingEdge:(double)a3
{
  self->_additionalPaddingForCancelButtonAtLeadingEdge = a3;
}

- (void)setAdditionalPaddingForSearchFieldAtLeadingEdge:(double)a3
{
  self->_additionalPaddingForSearchFieldAtLeadingEdge = a3;
}

@end