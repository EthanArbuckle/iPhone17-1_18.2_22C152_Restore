@interface UICollectionViewTableCell
- (BOOL)_beginReorderingForCell:(id)a3 touch:(id)a4;
- (BOOL)_canFocusCell:(id)a3;
- (BOOL)_canPerformAction:(SEL)a3 forCell:(id)a4 sender:(id)a5;
- (BOOL)_effectiveDefaultAllowsFocus;
- (BOOL)_isCellReorderable:(id)a3;
- (BOOL)_isEditingForSwipeDeletion;
- (BOOL)_isInModalViewController;
- (BOOL)_isInteractiveMoveShadowInstalled;
- (BOOL)_isReorderControlActiveForCell:(id)a3;
- (BOOL)_isShowingIndex;
- (BOOL)_sectionContentInsetFollowsLayoutMargins;
- (BOOL)_separatorInsetIsRelativeToCellEdges;
- (BOOL)_shouldDrawThickSeparators;
- (BOOL)_shouldHaveFooterViewForSection:(int64_t)a3;
- (BOOL)_shouldHaveHeaderViewForSection:(int64_t)a3;
- (BOOL)_shouldShowMenuForCell:(id)a3;
- (BOOL)_wasEditing;
- (BOOL)allowsMultipleSelection;
- (BOOL)allowsMultipleSelectionDuringEditing;
- (BOOL)borderShadowVisible;
- (BOOL)canBeEdited;
- (BOOL)cellLayoutMarginsFollowReadableWidth;
- (BOOL)insetsContentViewsToSafeArea;
- (BOOL)interactiveMoveEffectsVisible;
- (BOOL)isEditing;
- (BOOL)isHighlighted;
- (BOOL)isInTableLayout;
- (BOOL)isSelected;
- (BOOL)overlapsSectionHeaderViews;
- (BOOL)selectionFollowsFocus;
- (BOOL)shouldIndentWhileEditing;
- (BOOL)showingDeleteConfirmation;
- (BOOL)showsReorderControl;
- (BOOL)transitioningLayouts;
- (BOOL)usesVariableMargins;
- (CGRect)_calloutTargetRectForCell:(id)a3;
- (CGRect)_indexFrame;
- (UICollectionViewLayout)currentLayout;
- (UICollectionViewTableCell)initWithFrame:(CGRect)a3;
- (UICollectionViewTableLayout)_tableLayout;
- (UICollectionViewTableLayoutAttributes)_tableAttributes;
- (UIColor)_accessoryBaseColor;
- (UIColor)_multiselectCheckmarkColor;
- (UIEdgeInsets)_cellSafeAreaInsets;
- (UIEdgeInsets)_contentViewInset;
- (UIEdgeInsets)_rawSectionContentInset;
- (UIEdgeInsets)_rawSeparatorInset;
- (UIEdgeInsets)_sectionContentInset;
- (UIEdgeInsets)separatorInset;
- (UIImageView)imageView;
- (UILabel)detailTextLabel;
- (UILabel)textLabel;
- (UIScrollView)_scrollView;
- (UITableViewCell)_swipeToDeleteCell;
- (UITableViewCollectionCell)tableViewCell;
- (UIView)accessoryView;
- (UIView)editingAccessoryView;
- (UIView)multipleSelectionBackgroundView;
- (UIView)swipeableView;
- (double)_backgroundInset;
- (double)_bottomPadding;
- (double)_indexBarExtentFromEdge;
- (double)_offsetForRevealingDeleteConfirmationButton;
- (double)_rowSpacing;
- (double)_sectionCornerRadius;
- (double)_selectionAnimationDuration;
- (double)_topPadding;
- (double)estimatedRowHeight;
- (double)estimatedSectionFooterHeight;
- (double)estimatedSectionHeaderHeight;
- (double)indentationWidth;
- (double)rowHeight;
- (double)sectionFooterHeight;
- (double)sectionHeaderHeight;
- (id)_reorderingCell;
- (id)_titleForDeleteConfirmationButton:(id)a3;
- (id)backgroundColor;
- (id)backgroundView;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (id)selectedBackgroundView;
- (int64_t)_numberOfRowsInSection:(int64_t)a3;
- (int64_t)_numberOfSections;
- (int64_t)_popoverControllerStyle;
- (int64_t)_tableStyle;
- (int64_t)accessoryType;
- (int64_t)editingAccessoryType;
- (int64_t)editingStyle;
- (int64_t)focusStyle;
- (int64_t)indentationLevel;
- (int64_t)selectionStyle;
- (void)_accessoryButtonAction:(id)a3;
- (void)_animateDeletionOfRowAtIndexPath:(id)a3;
- (void)_animateDeletionOfRowWithCell:(id)a3;
- (void)_commonSetupTableCell;
- (void)_didInsertRowForTableCell:(id)a3;
- (void)_draggingReorderingCell:(id)a3 yDelta:(double)a4 touch:(id)a5;
- (void)_endReorderingForCell:(id)a3 wasCancelled:(BOOL)a4 animated:(BOOL)a5;
- (void)_insertInteractiveMoveShadowViews;
- (void)_layoutInteractiveMoveShadow;
- (void)_layoutTableViewCell;
- (void)_removeInteractiveMoveShadowViews;
- (void)_setOffsetForRevealingDeleteConfirmationButton:(double)a3;
- (void)_setSwipeToDeleteCell:(id)a3;
- (void)_setupForEditing:(BOOL)a3 atIndexPath:(id)a4 multiselect:(BOOL)a5 editingStyle:(int64_t)a6 shouldIndentWhileEditing:(BOOL)a7 showsReorderControl:(BOOL)a8 accessoryType:(int64_t)a9 updateSeparators:(BOOL)a10;
- (void)_swipeToDeleteCell:(id)a3;
- (void)_trackAnimator:(id)a3;
- (void)_updateCollectionViewInteractiveMovementTargetPositionForTouch:(id)a3;
- (void)_updateEditing;
- (void)_updateInternalCellForTableLayout:(BOOL)a3 animated:(BOOL)a4;
- (void)applyLayoutAttributes:(id)a3;
- (void)awakeFromNib;
- (void)didTransitionFromLayout:(id)a3 toLayout:(id)a4;
- (void)didTransitionToState:(unint64_t)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessoryType:(int64_t)a3;
- (void)setAccessoryView:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBorderShadowVisible:(BOOL)a3;
- (void)setCurrentLayout:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditingAccessoryType:(int64_t)a3;
- (void)setEditingAccessoryView:(id)a3;
- (void)setFocusStyle:(int64_t)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIndentationLevel:(int64_t)a3;
- (void)setIndentationWidth:(double)a3;
- (void)setInteractiveMoveEffectsVisible:(BOOL)a3;
- (void)setMultipleSelectionBackgroundView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedBackgroundView:(id)a3;
- (void)setSelectionStyle:(int64_t)a3;
- (void)setSeparatorInset:(UIEdgeInsets)a3;
- (void)setShouldIndentWhileEditing:(BOOL)a3;
- (void)setShowsReorderControl:(BOOL)a3;
- (void)setTableViewCell:(id)a3;
- (void)setTransitioningLayouts:(BOOL)a3;
- (void)willTransitionFromLayout:(id)a3 toLayout:(id)a4;
- (void)willTransitionToState:(unint64_t)a3;
@end

@implementation UICollectionViewTableCell

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._collectionView);
  uint64_t v6 = [WeakRetained collectionViewLayout];
  if (v6)
  {
    v7 = (void *)v6;
    id v8 = objc_loadWeakRetained((id *)&self->super.super._collectionView);
    v9 = [v8 collectionViewLayout];
    int v10 = [v9 _estimatesSizes];

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->super.super._collectionView);
      v12 = [v11 collectionViewLayout];
      int v13 = [v12 _cellsShouldConferWithAutolayoutEngineForSizingInfo];

      if (v13)
      {
        v14 = [(UICollectionViewTableCell *)self tableViewCell];
        _preferredAttributesFittingAttributesWithInnerView(self, v4, v14);
        id v15 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_7;
      }
    }
  }
  else
  {
  }
  id v15 = v4;
LABEL_7:

  return v15;
}

- (void)_commonSetupTableCell
{
  int v10 = [(UITableViewCell *)[UITableViewCollectionCell alloc] initWithStyle:0 reuseIdentifier:&stru_1ED0E84C0];
  [(UIView *)v10 setAutoresizingMask:18];
  [(UITableViewCell *)v10 _setTableView:self];
  [(UICollectionViewTableCell *)self setTableViewCell:v10];
  v3 = [(UICollectionViewCell *)self contentView];
  id v4 = [(UITableViewCell *)v10 contentView];
  v5 = [UIView alloc];
  [(UIView *)v10 bounds];
  uint64_t v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
  swipeableView = self->_swipeableView;
  self->_swipeableView = v6;

  [(UIView *)self->_swipeableView setAutoresizingMask:18];
  [(UIView *)self->_swipeableView setEdgesPreservingSuperviewLayoutMargins:10];
  [(UIView *)self->_swipeableView setEdgesInsettingLayoutMarginsFromSafeArea:[(UIView *)self->_swipeableView edgesInsettingLayoutMarginsFromSafeArea] & 0xA];
  [(UIView *)v10 addSubview:self->_swipeableView];
  [v4 removeFromSuperview];
  [(UIView *)self->_swipeableView addSubview:v4];
  id v8 = [v3 subviews];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    [v4 bounds];
    objc_msgSend(v3, "setFrame:");
    [v3 setAutoresizingMask:18];
    [v4 addSubview:v3];
  }
  else
  {
    [v3 removeFromSuperview];
  }
  [(UIView *)self setEdgesPreservingSuperviewLayoutMargins:10];
  [(UIView *)self setEdgesInsettingLayoutMarginsFromSafeArea:[(UIView *)self edgesInsettingLayoutMarginsFromSafeArea] & 0xA];
  [(UIView *)self addSubview:v10];
  [(UICollectionViewCell *)self _setContentView:v4 addToHierarchy:0];
}

- (UICollectionViewTableCell)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewTableCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UICollectionViewTableCell *)v3 _commonSetupTableCell];
  return v3;
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewTableCell;
  [&v3 awakeFromNib];
  [(UICollectionViewTableCell *)self _commonSetupTableCell];
}

- (UIView)swipeableView
{
  return self->_swipeableView;
}

- (UIEdgeInsets)_contentViewInset
{
  objc_super v3 = [(UICollectionViewTableCell *)self tableViewCell];
  uint64_t v4 = [v3 currentStateMask] & 1;
  objc_super v5 = [v3 layoutManager];
  [v5 contentEndingRectForCell:v3 forNewEditingState:v4];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v24.origin.x = v7;
  v24.origin.y = v9;
  v24.size.width = v11;
  v24.size.height = v13;
  CGFloat MinY = CGRectGetMinY(v24);
  v25.origin.x = v7;
  v25.origin.y = v9;
  v25.size.width = v11;
  v25.size.height = v13;
  CGFloat MinX = CGRectGetMinX(v25);
  [(UIView *)self bounds];
  double Height = CGRectGetHeight(v26);
  v27.origin.x = v7;
  v27.origin.y = v9;
  v27.size.width = v11;
  v27.size.height = v13;
  double v17 = Height - CGRectGetMaxY(v27);
  [(UIView *)self bounds];
  double Width = CGRectGetWidth(v28);
  v29.origin.x = v7;
  v29.origin.y = v9;
  v29.size.width = v11;
  v29.size.height = v13;
  double v19 = Width - CGRectGetMaxX(v29);

  double v20 = MinY;
  double v21 = MinX;
  double v22 = v17;
  double v23 = v19;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (void)_layoutTableViewCell
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(UICollectionViewTableCell *)self tableViewCell];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)_layoutInteractiveMoveShadow
{
  BOOL v3 = [(UICollectionViewTableCell *)self borderShadowVisible];
  if (v3 != [(UICollectionViewTableCell *)self _isInteractiveMoveShadowInstalled])
  {
    if (v3)
    {
      [(UICollectionViewTableCell *)self _insertInteractiveMoveShadowViews];
    }
    else
    {
      [(UICollectionViewTableCell *)self _removeInteractiveMoveShadowViews];
    }
  }
}

- (BOOL)_isInteractiveMoveShadowInstalled
{
  v2 = [(UIView *)self->_borderShadowTopView superview];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_insertInteractiveMoveShadowViews
{
  borderShadowTopView = self->_borderShadowTopView;
  if (!borderShadowTopView)
  {
    double v4 = [UIShadowView alloc];
    [(UIView *)self bounds];
    double v5 = -[UIShadowView initWithFrame:](v4, "initWithFrame:");
    double v6 = self->_borderShadowTopView;
    self->_borderShadowTopView = v5;

    double v7 = self->_borderShadowTopView;
    double v8 = +[UIShadowView topShadowImage];
    [(UIShadowView *)v7 setShadowImage:v8 forEdge:1 inside:0];

    borderShadowTopView = self->_borderShadowTopView;
  }
  double v9 = [(UICollectionViewTableCell *)self tableViewCell];
  [(UIView *)self insertSubview:borderShadowTopView belowSubview:v9];

  borderShadowBottomView = self->_borderShadowBottomView;
  if (!borderShadowBottomView)
  {
    id v11 = [UIShadowView alloc];
    [(UIView *)self bounds];
    double v12 = -[UIShadowView initWithFrame:](v11, "initWithFrame:");
    CGFloat v13 = self->_borderShadowBottomView;
    self->_borderShadowBottomView = v12;

    v14 = self->_borderShadowBottomView;
    id v15 = +[UIShadowView bottomShadowImage];
    [(UIShadowView *)v14 setShadowImage:v15 forEdge:4 inside:0];

    borderShadowBottomView = self->_borderShadowBottomView;
  }
  id v16 = [(UICollectionViewTableCell *)self tableViewCell];
  [(UIView *)self insertSubview:borderShadowBottomView belowSubview:v16];
}

- (void)_removeInteractiveMoveShadowViews
{
  [(UIView *)self->_borderShadowTopView removeFromSuperview];
  borderShadowTopView = self->_borderShadowTopView;
  self->_borderShadowTopView = 0;

  [(UIView *)self->_borderShadowBottomView removeFromSuperview];
  borderShadowBottomView = self->_borderShadowBottomView;
  self->_borderShadowBottomView = 0;
}

- (void)layoutSubviews
{
  [(UICollectionViewTableCell *)self _layoutTableViewCell];
  [(UICollectionViewTableCell *)self _layoutInteractiveMoveShadow];
  BOOL v3 = [(UICollectionViewTableCell *)self tableViewCell];
  [v3 layoutIfNeeded];

  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewTableCell;
  [(UICollectionViewCell *)&v4 layoutSubviews];
}

- (void)setInteractiveMoveEffectsVisible:(BOOL)a3
{
  if (self->_interactiveMoveEffectsVisible != a3)
  {
    self->_BOOL interactiveMoveEffectsVisible = a3;
    if (a3)
    {
      objc_super v4 = [(UICollectionViewTableCell *)self _tableLayout];
      double v5 = [v4 _constants];
      uint64_t v6 = [v5 reorderingCellWantsShadows];
    }
    else
    {
      uint64_t v6 = 0;
    }
    [(UICollectionViewTableCell *)self setBorderShadowVisible:v6];
    if (self->_interactiveMoveEffectsVisible) {
      double v7 = (UIView *)objc_opt_new();
    }
    else {
      double v7 = self->_selectedBackgroundViewToRestoreWhenInteractiveMoveEnds;
    }
    double v10 = v7;
    BOOL interactiveMoveEffectsVisible = self->_interactiveMoveEffectsVisible;
    if (self->_interactiveMoveEffectsVisible)
    {
      double v9 = [(UICollectionViewTableCell *)self selectedBackgroundView];
    }
    else
    {
      double v9 = 0;
    }
    objc_storeStrong((id *)&self->_selectedBackgroundViewToRestoreWhenInteractiveMoveEnds, v9);
    if (interactiveMoveEffectsVisible) {

    }
    [(UICollectionViewTableCell *)self setSelectedBackgroundView:v10];
  }
}

- (void)setBorderShadowVisible:(BOOL)a3
{
  if (self->_borderShadowVisible != a3)
  {
    self->_borderShadowVisible = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)UICollectionViewTableCell;
  [(UICollectionReusableView *)&v13 applyLayoutAttributes:a3];
  objc_super v4 = [(UICollectionViewTableCell *)self tableViewCell];
  double v5 = [(UICollectionViewTableCell *)self _tableAttributes];
  uint64_t v6 = [(UICollectionViewTableCell *)self currentLayout];

  if (!v6)
  {
    double v7 = [(UICollectionReusableView *)self _collectionView];
    double v8 = [v7 collectionViewLayout];
    [(UICollectionViewTableCell *)self setCurrentLayout:v8];

    [(UICollectionViewTableCell *)self _updateInternalCellForTableLayout:[(UICollectionViewTableCell *)self isInTableLayout] animated:0];
    [(UICollectionViewTableCell *)self updateCellForTableLayout:[(UICollectionViewTableCell *)self isInTableLayout]];
  }
  if (v5)
  {
    double v9 = objc_opt_class();
    objc_msgSend(v9, "applyValuesFromAttributes:toAttributes:valueOptions:", v5, v4, objc_msgSend((id)objc_opt_class(), "automaticValueOptionsForRepresentedElementCategory:", objc_msgSend(v5, "representedElementCategory")));
    double v10 = [(UICollectionViewTableCell *)self _tableLayout];
    id v11 = v10;
    if (v10)
    {
      double v12 = [v10 _constants];
      [v12 defaultLayoutMarginsForCell:v4 inTableView:v11];
      objc_msgSend(v4, "setLayoutMargins:");
    }
  }
  if (qword_1EB25D170 != -1) {
    dispatch_once(&qword_1EB25D170, &__block_literal_global_108);
  }
  if (!_MergedGlobals_9_0) {
    [(UICollectionViewTableCell *)self _updateEditing];
  }
  if ([(UICollectionViewTableCell *)self transitioningLayouts])
  {
    [(UICollectionViewTableCell *)self updateCellForTableLayout:[(UICollectionViewTableCell *)self isInTableLayout]];
    [(UIView *)self layoutIfNeeded];
  }
}

void __51__UICollectionViewTableCell_applyLayoutAttributes___block_invoke()
{
  _UIMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_9_0 = [v0 isEqualToString:@"com.apple.Music"];
}

- (void)_updateEditing
{
  id v7 = [(UICollectionViewTableCell *)self _tableAttributes];
  if (![(UICollectionViewTableCell *)self isInTableLayout]) {
    goto LABEL_7;
  }
  if (![(UICollectionViewTableCell *)self isEditing]
    && [(UICollectionViewTableCell *)self allowsMultipleSelection])
  {
    BOOL v3 = 1;
    goto LABEL_8;
  }
  if ([(UICollectionViewTableCell *)self isEditing]) {
    BOOL v3 = [(UICollectionViewTableCell *)self allowsMultipleSelectionDuringEditing];
  }
  else {
LABEL_7:
  }
    BOOL v3 = 0;
LABEL_8:
  BOOL v4 = [(UICollectionViewTableCell *)self isEditing];
  double v5 = [v7 indexPath];
  LOBYTE(v6) = 1;
  -[UICollectionViewTableCell _setupForEditing:atIndexPath:multiselect:editingStyle:shouldIndentWhileEditing:showsReorderControl:accessoryType:updateSeparators:](self, "_setupForEditing:atIndexPath:multiselect:editingStyle:shouldIndentWhileEditing:showsReorderControl:accessoryType:updateSeparators:", v4, v5, v3, [v7 editingStyle], objc_msgSend(v7, "shouldIndentWhileEditing"), objc_msgSend(v7, "showsReorderControl"), objc_msgSend(v7, "accessoryType"), v6);
}

- (void)_updateInternalCellForTableLayout:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v33[3] = *MEMORY[0x1E4F143B8];
  id v7 = [(UICollectionViewTableCell *)self tableViewCell];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v5)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __72__UICollectionViewTableCell__updateInternalCellForTableLayout_animated___block_invoke;
      aBlock[3] = &unk_1E52DE548;
      id v8 = v7;
      id v32 = v8;
      double v9 = _Block_copy(aBlock);
      v33[0] = v9;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __72__UICollectionViewTableCell__updateInternalCellForTableLayout_animated___block_invoke_2;
      v29[3] = &unk_1E52DE548;
      id v10 = v8;
      id v30 = v10;
      id v11 = _Block_copy(v29);
      v33[1] = v11;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __72__UICollectionViewTableCell__updateInternalCellForTableLayout_animated___block_invoke_3;
      v27[3] = &unk_1E52E4C48;
      id v12 = v10;
      id v28 = v12;
      objc_super v13 = _Block_copy(v27);
      v33[2] = v13;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];

      id v15 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:5 valueOptions:0];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __72__UICollectionViewTableCell__updateInternalCellForTableLayout_animated___block_invoke_4;
      v22[3] = &unk_1E52DD450;
      id v23 = v12;
      CGRect v24 = self;
      id v25 = v14;
      id v16 = v15;
      id v26 = v16;
      id v17 = v14;
      +[UIView performWithoutAnimation:v22];
      if (v4) {
        double v18 = 0.25;
      }
      else {
        double v18 = 0.0;
      }
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __72__UICollectionViewTableCell__updateInternalCellForTableLayout_animated___block_invoke_5;
      v20[3] = &unk_1E52D9F70;
      id v21 = v16;
      id v19 = v16;
      +[UIView animateWithDuration:v20 animations:v18];
    }
    else
    {
      [v7 setAccessoryType:0];
      [v7 _setSeparatorHidden:1];
      [v7 _setAccessoryViewsHidden:1];
    }
  }
}

uint64_t __72__UICollectionViewTableCell__updateInternalCellForTableLayout_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessoryView:0];
}

uint64_t __72__UICollectionViewTableCell__updateInternalCellForTableLayout_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _separatorView:0];
}

id __72__UICollectionViewTableCell__updateInternalCellForTableLayout_animated___block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) editingData:0];
  v2 = [v1 editControl:0];

  return v2;
}

void __72__UICollectionViewTableCell__updateInternalCellForTableLayout_animated___block_invoke_4(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setAccessoryType:*(void *)(*(void *)(a1 + 40) + 672)];
  [*(id *)(a1 + 32) _setSeparatorHidden:0];
  [*(id *)(a1 + 32) _setAccessoryViewsHidden:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v6));
        id v8 = v7;
        if (v7)
        {
          double v9 = *(void **)(a1 + 56);
          id v10 = NSNumber;
          objc_msgSend(v7, "alpha", (void)v12);
          id v11 = objc_msgSend(v10, "numberWithDouble:");
          [v9 setObject:v11 forKey:v8];
        }
        objc_msgSend(v8, "setAlpha:", 0.0, (void)v12);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

void __72__UICollectionViewTableCell__updateInternalCellForTableLayout_animated___block_invoke_5(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v8 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7, (void)v11);
        [v8 doubleValue];
        double v10 = v9;

        [v7 setAlpha:v10];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)willTransitionFromLayout:(id)a3 toLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UICollectionViewTableCell *)self tableViewCell];
  objc_opt_class();
  int v9 = objc_opt_isKindOfClass() & 1;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v9 != (isKindOfClass & 1))
  {
    char v11 = isKindOfClass;
    [v8 removeEditingData];
    [(UICollectionViewTableCell *)self setTransitioningLayouts:1];
    [(UICollectionViewTableCell *)self setCurrentLayout:v7];
    [(UICollectionViewTableCell *)self _updateEditing];
    if (v11)
    {
      [v8 _setAccessoryViewsHidden:1];
    }
    else
    {
      [(UICollectionViewTableCell *)self _updateInternalCellForTableLayout:0 animated:0];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __63__UICollectionViewTableCell_willTransitionFromLayout_toLayout___block_invoke;
      v12[3] = &unk_1E52D9F70;
      id v13 = v6;
      +[UIView performWithoutAnimation:v12];
    }
  }
}

uint64_t __63__UICollectionViewTableCell_willTransitionFromLayout_toLayout___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetSwipedRowWithCompletion:0];
}

- (void)didTransitionFromLayout:(id)a3 toLayout:(id)a4
{
  if ([(UICollectionViewTableCell *)self transitioningLayouts])
  {
    if ([(UICollectionViewTableCell *)self isInTableLayout]) {
      [(UICollectionViewTableCell *)self _updateInternalCellForTableLayout:1 animated:1];
    }
    [(UICollectionViewTableCell *)self setTransitioningLayouts:0];
  }
}

- (void)_trackAnimator:(id)a3
{
  id v4 = a3;
  trackedAnimators = self->_trackedAnimators;
  if (trackedAnimators)
  {
    [(NSMutableSet *)trackedAnimators addObject:v4];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA80] setWithObject:v4];
    id v7 = self->_trackedAnimators;
    self->_trackedAnimators = v6;
  }
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__UICollectionViewTableCell__trackAnimator___block_invoke;
  v8[3] = &unk_1E52DC2E0;
  objc_copyWeak(&v9, &location);
  objc_copyWeak(&v10, &from);
  [v4 addCompletion:v8];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __44__UICollectionViewTableCell__trackAnimator___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2) {
    [WeakRetained[85] removeObject:v2];
  }
}

- (void)prepareForReuse
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[(NSMutableSet *)self->_trackedAnimators copy];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        [v10 stopAnimation:0];
        if ([v10 state] == 5) {
          ++v7;
        }
        else {
          [v10 finishAnimationAtPosition:0];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v12 = [(NSMutableSet *)self->_trackedAnimators count];
  if (has_internal_diagnostics)
  {
    if (v12 != v7)
    {
      CGRect v24 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v24, OS_LOG_TYPE_FAULT, "Animations pending while being reused. This is a UIKit issue.", buf, 2u);
      }
    }
  }
  else if (v12 != v7)
  {
    id v25 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &prepareForReuse___s_category) + 8);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "Animations pending while being reused. This is a UIKit issue.", buf, 2u);
    }
  }
  id v13 = [(UICollectionViewTableCell *)self swipeableView];
  long long v14 = [v13 superview];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  id v23 = [(UICollectionViewTableCell *)self swipeableView];
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  [(UICollectionViewTableCell *)self _setOffsetForRevealingDeleteConfirmationButton:0.0];
  [(UITableViewCell *)self->_tableViewCell prepareForReuse];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __44__UICollectionViewTableCell_prepareForReuse__block_invoke;
  v28[3] = &unk_1E52D9F70;
  v28[4] = self;
  +[UIView performWithoutAnimation:v28];
  [(UICollectionViewTableCell *)self setCurrentLayout:0];
  v27.receiver = self;
  v27.super_class = (Class)UICollectionViewTableCell;
  [(UICollectionViewCell *)&v27 prepareForReuse];
}

uint64_t __44__UICollectionViewTableCell_prepareForReuse__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setLayoutAttributes:0];
}

- (BOOL)isInTableLayout
{
  id v2 = [(UICollectionViewTableCell *)self currentLayout];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)canBeEdited
{
  return 1;
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    [(UICollectionViewTableCell *)self _updateEditing];
  }
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)_setupForEditing:(BOOL)a3 atIndexPath:(id)a4 multiselect:(BOOL)a5 editingStyle:(int64_t)a6 shouldIndentWhileEditing:(BOOL)a7 showsReorderControl:(BOOL)a8 accessoryType:(int64_t)a9 updateSeparators:(BOOL)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  BOOL v13 = a5;
  BOOL v14 = a3;
  id v16 = [(UICollectionViewTableCell *)self tableViewCell];
  if (v14)
  {
    [v16 _setShowsReorderControl:v10];
    [v16 _setEditingStyle:a6];
    [v16 _setShouldIndentWhileEditing:v11];
    [v16 _setEditing:1 animated:1 cellOrAncestorViewForAnimatedLayout:self];
  }
  else
  {
    [v16 _setShowsReorderControl:0];
    [v16 _setEditing:0 animated:1 cellOrAncestorViewForAnimatedLayout:self];
    [v16 _setEditingStyle:0];
    [v16 _setShouldIndentWhileEditing:0];
    [v16 setWasSwiped:0];
    [v16 _setShowingDeleteConfirmation:0];
  }
  [v16 _setMultiselecting:v13];
}

- (double)_selectionAnimationDuration
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  [v2 selectionFadeDuration];
  double v4 = v3;

  return v4;
}

- (int64_t)_popoverControllerStyle
{
  return 0;
}

- (BOOL)_isInModalViewController
{
  return 0;
}

- (BOOL)_wasEditing
{
  return 0;
}

- (BOOL)_canFocusCell:(id)a3
{
  return 1;
}

- (BOOL)_shouldShowMenuForCell:(id)a3
{
  return 0;
}

- (BOOL)_canPerformAction:(SEL)a3 forCell:(id)a4 sender:(id)a5
{
  return 0;
}

- (CGRect)_calloutTargetRectForCell:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_swipeToDeleteCell:(id)a3
{
  id v4 = [(UICollectionViewTableCell *)self _tableLayout];
  [v4 _swipeToDeleteCell:self];
}

- (BOOL)_isEditingForSwipeDeletion
{
  return 0;
}

- (id)_reorderingCell
{
  return 0;
}

- (BOOL)_isCellReorderable:(id)a3
{
  return 0;
}

- (BOOL)_isReorderControlActiveForCell:(id)a3
{
  return 1;
}

- (BOOL)_beginReorderingForCell:(id)a3 touch:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  double v6 = [(UICollectionReusableView *)self _collectionView];
  uint64_t v7 = [(UICollectionReusableView *)self _layoutAttributes];
  uint64_t v8 = [v7 indexPath];
  int v9 = [v6 beginInteractiveMovementForItemAtIndexPath:v8];

  if (v9)
  {
    BOOL v10 = [(UICollectionReusableView *)self _layoutAttributes];
    [v10 center];
    self->_reorderingCenterX = v11;

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v21 = v5;
    uint64_t v12 = [v5 gestureRecognizers];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          double v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (_UISheetInteractionGestureIsForInteractiveDismiss(v17))
          {
            double v18 = (void *)UIApp;
            id v26 = v17;
            double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
            [v18 _cancelGestureRecognizers:v19];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v14);
    }

    [(UICollectionViewTableCell *)self setInteractiveMoveEffectsVisible:1];
    id v5 = v21;
    [(UICollectionViewTableCell *)self _updateCollectionViewInteractiveMovementTargetPositionForTouch:v21];
  }

  return v9;
}

- (void)_draggingReorderingCell:(id)a3 yDelta:(double)a4 touch:(id)a5
{
}

- (void)_updateCollectionViewInteractiveMovementTargetPositionForTouch:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = [(UICollectionReusableView *)self _collectionView];
    [v8 locationInView:v4];
  }
  else
  {
    id v4 = [(UICollectionReusableView *)self _layoutAttributes];
    [v4 center];
  }
  double v6 = v5;

  uint64_t v7 = [(UICollectionReusableView *)self _collectionView];
  objc_msgSend(v7, "updateInteractiveMovementTargetPosition:", self->_reorderingCenterX, v6);
}

- (void)_endReorderingForCell:(id)a3 wasCancelled:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a4;
  -[UICollectionViewTableCell setInteractiveMoveEffectsVisible:](self, "setInteractiveMoveEffectsVisible:", 0, a4, a5);
  uint64_t v7 = [(UICollectionReusableView *)self _collectionView];
  id v8 = v7;
  if (v5) {
    [v7 cancelInteractiveMovement];
  }
  else {
    [v7 endInteractiveMovement];
  }

  self->_reorderingCenterX = 0.0;
}

- (void)_didInsertRowForTableCell:(id)a3
{
  id v8 = [(UICollectionReusableView *)self _collectionView];
  id v4 = [v8 delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v5 = [(UICollectionViewTableCell *)self _tableLayout];
    double v6 = [(UICollectionReusableView *)self _layoutAttributes];
    uint64_t v7 = [v6 indexPath];
    [v4 collectionView:v8 tableLayout:v5 commitEditingStyle:2 forRowAtIndexPath:v7];
  }
}

- (id)_titleForDeleteConfirmationButton:(id)a3
{
  return 0;
}

- (void)_animateDeletionOfRowAtIndexPath:(id)a3
{
  id v7 = a3;
  id v4 = [(UICollectionReusableView *)self _collectionView];
  BOOL v5 = [v4 delegate];
  if (objc_opt_respondsToSelector())
  {
    double v6 = [(UICollectionViewTableCell *)self _tableLayout];
    [v5 collectionView:v4 tableLayout:v6 commitEditingStyle:1 forRowAtIndexPath:v7];
  }
}

- (void)_animateDeletionOfRowWithCell:(id)a3
{
  id v5 = [(UICollectionReusableView *)self _layoutAttributes];
  id v4 = [v5 indexPath];
  [(UICollectionViewTableCell *)self _animateDeletionOfRowAtIndexPath:v4];
}

- (void)_accessoryButtonAction:(id)a3
{
  id v4 = [(UICollectionReusableView *)self _layoutAttributes];
  id v6 = [v4 indexPath];

  id v5 = [(UICollectionViewTableCell *)self _tableLayout];
  [v5 _cellAccessoryButtonTappedAtIndexPath:v6];
}

- (BOOL)_shouldDrawThickSeparators
{
  id v2 = [(UICollectionViewTableCell *)self _tableLayout];
  char v3 = [v2 _shouldDrawThickSeparators];

  return v3;
}

- (BOOL)selectionFollowsFocus
{
  id v2 = [(UICollectionReusableView *)self _collectionView];
  char v3 = [v2 selectionFollowsFocus];

  return v3;
}

- (BOOL)_effectiveDefaultAllowsFocus
{
  id v2 = [(UICollectionReusableView *)self _collectionView];
  char v3 = [v2 _effectiveDefaultAllowsFocus];

  return v3;
}

- (UICollectionViewTableLayout)_tableLayout
{
  id v2 = [(UICollectionViewTableCell *)self currentLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (UICollectionViewTableLayout *)v3;
}

- (UICollectionViewTableLayoutAttributes)_tableAttributes
{
  id v2 = [(UICollectionReusableView *)self _layoutAttributes];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (UICollectionViewTableLayoutAttributes *)v3;
}

- (double)_rowSpacing
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    [v4 _rowSpacing];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (UIEdgeInsets)_rawSeparatorInset
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    [v4 _rawSeparatorInset];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v12 = 0.0;
    double v10 = 0.0;
    double v6 = 0.0;
    double v8 = 0.0;
  }

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (int64_t)_tableStyle
{
  return 0;
}

- (UIScrollView)_scrollView
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    double v5 = [v4 _scrollView];
  }
  else
  {
    double v5 = 0;
  }

  return (UIScrollView *)v5;
}

- (int64_t)_numberOfSections
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    int64_t v5 = [v4 _numberOfSections];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)allowsMultipleSelection
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    char v5 = [v4 allowsMultipleSelection];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)allowsMultipleSelectionDuringEditing
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    char v5 = [v4 allowsMultipleSelectionDuringEditing];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (double)rowHeight
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    [v4 rowHeight];
    double v6 = v5;
  }
  else
  {
    double v6 = 44.0;
  }

  return v6;
}

- (double)sectionHeaderHeight
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    [v4 sectionHeaderHeight];
    double v6 = v5;
  }
  else
  {
    double v6 = 44.0;
  }

  return v6;
}

- (double)sectionFooterHeight
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    [v4 sectionFooterHeight];
    double v6 = v5;
  }
  else
  {
    double v6 = 44.0;
  }

  return v6;
}

- (double)estimatedRowHeight
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    [v4 estimatedRowHeight];
    double v6 = v5;
  }
  else
  {
    double v6 = 44.0;
  }

  return v6;
}

- (double)estimatedSectionHeaderHeight
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    [v4 estimatedSectionHeaderHeight];
    double v6 = v5;
  }
  else
  {
    double v6 = 44.0;
  }

  return v6;
}

- (double)estimatedSectionFooterHeight
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    [v4 estimatedSectionFooterHeight];
    double v6 = v5;
  }
  else
  {
    double v6 = 44.0;
  }

  return v6;
}

- (BOOL)_separatorInsetIsRelativeToCellEdges
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    char v5 = [v4 _separatorInsetIsRelativeToCellEdges];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)usesVariableMargins
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    char v5 = [v4 usesVariableMargins];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)overlapsSectionHeaderViews
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    char v5 = [v4 overlapsSectionHeaderViews];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (double)_backgroundInset
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    [v4 _backgroundInset];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (UIEdgeInsets)_cellSafeAreaInsets
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    [v4 _cellSafeAreaInsets];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v12 = 0.0;
    double v10 = 0.0;
    double v6 = 0.0;
    double v8 = 0.0;
  }

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (BOOL)cellLayoutMarginsFollowReadableWidth
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    char v5 = [v4 cellLayoutMarginsFollowReadableWidth];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)insetsContentViewsToSafeArea
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    char v5 = [v4 insetsContentViewsToSafeArea];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (double)_topPadding
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    [v4 _topPadding];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (double)_bottomPadding
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    [v4 _bottomPadding];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (BOOL)_isShowingIndex
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    char v5 = [v4 _isShowingIndex];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (CGRect)_indexFrame
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    [v4 _indexFrame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (double)_indexBarExtentFromEdge
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    [v4 _indexBarExtentFromEdge];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (UIEdgeInsets)_sectionContentInset
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    [v4 _sectionContentInset];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v12 = 0.0;
    double v10 = 0.0;
    double v6 = 0.0;
    double v8 = 0.0;
  }

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (UIEdgeInsets)_rawSectionContentInset
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    [v4 _rawSectionContentInset];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v12 = 0.0;
    double v10 = 0.0;
    double v6 = 0.0;
    double v8 = 0.0;
  }

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (double)_sectionCornerRadius
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    [v4 _sectionCornerRadius];
    double v6 = v5;
  }
  else
  {
    double v6 = -1.0;
  }

  return v6;
}

- (BOOL)_sectionContentInsetFollowsLayoutMargins
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    char v5 = [v4 _sectionContentInsetFollowsLayoutMargins];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (UIColor)_accessoryBaseColor
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    char v5 = [v4 _accessoryBaseColor];
  }
  else
  {
    char v5 = 0;
  }

  return (UIColor *)v5;
}

- (UIColor)_multiselectCheckmarkColor
{
  id v3 = [(UICollectionViewTableCell *)self _tableLayout];
  if (v3)
  {
    id v4 = [(UICollectionViewTableCell *)self _tableLayout];
    char v5 = [v4 _multiselectCheckmarkColor];
  }
  else
  {
    char v5 = 0;
  }

  return (UIColor *)v5;
}

- (int64_t)_numberOfRowsInSection:(int64_t)a3
{
  id v4 = [(UICollectionViewTableCell *)self _tableLayout];
  int64_t v5 = [v4 _numberOfRowsInSection:a3];

  return v5;
}

- (BOOL)_shouldHaveHeaderViewForSection:(int64_t)a3
{
  id v4 = [(UICollectionViewTableCell *)self _tableLayout];
  LOBYTE(a3) = [v4 _shouldHaveHeaderViewForSection:a3];

  return a3;
}

- (BOOL)_shouldHaveFooterViewForSection:(int64_t)a3
{
  id v4 = [(UICollectionViewTableCell *)self _tableLayout];
  LOBYTE(a3) = [v4 _shouldHaveFooterViewForSection:a3];

  return a3;
}

- (UIImageView)imageView
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  id v3 = [v2 imageView];

  return (UIImageView *)v3;
}

- (UILabel)textLabel
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  id v3 = [v2 textLabel];

  return (UILabel *)v3;
}

- (UILabel)detailTextLabel
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  id v3 = [v2 detailTextLabel];

  return (UILabel *)v3;
}

- (id)backgroundView
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  id v3 = [v2 backgroundView];

  return v3;
}

- (void)setBackgroundView:(id)a3
{
  id v4 = a3;
  id v5 = [(UICollectionViewTableCell *)self tableViewCell];
  [v5 setBackgroundView:v4];
}

- (id)selectedBackgroundView
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  id v3 = [v2 selectedBackgroundView];

  return v3;
}

- (void)setSelectedBackgroundView:(id)a3
{
  id v4 = a3;
  id v5 = [(UICollectionViewTableCell *)self tableViewCell];
  [v5 setSelectedBackgroundView:v4];
}

- (UIView)multipleSelectionBackgroundView
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  id v3 = [v2 multipleSelectionBackgroundView];

  return (UIView *)v3;
}

- (void)setMultipleSelectionBackgroundView:(id)a3
{
  id v4 = a3;
  id v5 = [(UICollectionViewTableCell *)self tableViewCell];
  [v5 setMultipleSelectionBackgroundView:v4];
}

- (id)backgroundColor
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  id v3 = [v2 backgroundColor];

  return v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(UICollectionViewTableCell *)self tableViewCell];
  [v5 setBackgroundColor:v4];
}

- (int64_t)selectionStyle
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  int64_t v3 = [v2 selectionStyle];

  return v3;
}

- (void)setSelectionStyle:(int64_t)a3
{
  id v4 = [(UICollectionViewTableCell *)self tableViewCell];
  [v4 setSelectionStyle:a3];
}

- (BOOL)isSelected
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  char v3 = [v2 isSelected];

  return v3;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UICollectionViewTableCell *)self tableViewCell];
  objc_msgSend(v4, "setSelected:animated:", v3, +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"));
}

- (BOOL)isHighlighted
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  char v3 = [v2 isHighlighted];

  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UICollectionViewTableCell *)self tableViewCell];
  objc_msgSend(v4, "setHighlighted:animated:", v3, +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"));
}

- (int64_t)editingStyle
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  int64_t v3 = [v2 editingStyle];

  return v3;
}

- (BOOL)showsReorderControl
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  char v3 = [v2 showsReorderControl];

  return v3;
}

- (void)setShowsReorderControl:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UICollectionViewTableCell *)self tableViewCell];
  [v4 setShowsReorderControl:v3];
}

- (BOOL)shouldIndentWhileEditing
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  char v3 = [v2 shouldIndentWhileEditing];

  return v3;
}

- (void)setShouldIndentWhileEditing:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UICollectionViewTableCell *)self tableViewCell];
  [v4 setShouldIndentWhileEditing:v3];
}

- (int64_t)accessoryType
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  int64_t v3 = [v2 accessoryType];

  return v3;
}

- (void)setAccessoryType:(int64_t)a3
{
  self->_accessoryType = a3;
  if ([(UICollectionViewTableCell *)self isInTableLayout])
  {
    id v5 = [(UICollectionViewTableCell *)self tableViewCell];
    [v5 setAccessoryType:a3];
  }
}

- (UIView)accessoryView
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  int64_t v3 = [v2 accessoryView];

  return (UIView *)v3;
}

- (void)setAccessoryView:(id)a3
{
  id v4 = a3;
  id v5 = [(UICollectionViewTableCell *)self tableViewCell];
  [v5 setAccessoryView:v4];
}

- (int64_t)editingAccessoryType
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  int64_t v3 = [v2 editingAccessoryType];

  return v3;
}

- (void)setEditingAccessoryType:(int64_t)a3
{
  id v4 = [(UICollectionViewTableCell *)self tableViewCell];
  [v4 setEditingAccessoryType:a3];
}

- (UIView)editingAccessoryView
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  int64_t v3 = [v2 editingAccessoryView];

  return (UIView *)v3;
}

- (void)setEditingAccessoryView:(id)a3
{
  id v4 = a3;
  id v5 = [(UICollectionViewTableCell *)self tableViewCell];
  [v5 setEditingAccessoryView:v4];
}

- (int64_t)indentationLevel
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  int64_t v3 = [v2 indentationLevel];

  return v3;
}

- (void)setIndentationLevel:(int64_t)a3
{
  id v4 = [(UICollectionViewTableCell *)self tableViewCell];
  [v4 setIndentationLevel:a3];
}

- (double)indentationWidth
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  [v2 indentationWidth];
  double v4 = v3;

  return v4;
}

- (void)setIndentationWidth:(double)a3
{
  id v4 = [(UICollectionViewTableCell *)self tableViewCell];
  [v4 setIndentationWidth:a3];
}

- (UIEdgeInsets)separatorInset
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  [v2 separatorInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setSeparatorInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v7 = [(UICollectionViewTableCell *)self tableViewCell];
  objc_msgSend(v7, "setSeparatorInset:", top, left, bottom, right);
}

- (BOOL)showingDeleteConfirmation
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  char v3 = [v2 showingDeleteConfirmation];

  return v3;
}

- (int64_t)focusStyle
{
  id v2 = [(UICollectionViewTableCell *)self tableViewCell];
  int64_t v3 = [v2 focusStyle];

  return v3;
}

- (void)setFocusStyle:(int64_t)a3
{
  id v4 = [(UICollectionViewTableCell *)self tableViewCell];
  [v4 setFocusStyle:a3];
}

- (void)willTransitionToState:(unint64_t)a3
{
  id v4 = [(UICollectionViewTableCell *)self tableViewCell];
  [v4 willTransitionToState:a3];
}

- (void)didTransitionToState:(unint64_t)a3
{
  id v4 = [(UICollectionViewTableCell *)self tableViewCell];
  [v4 didTransitionToState:a3];
}

- (UITableViewCell)_swipeToDeleteCell
{
  return self->_swipeToDeleteCell;
}

- (void)_setSwipeToDeleteCell:(id)a3
{
}

- (UITableViewCollectionCell)tableViewCell
{
  return self->_tableViewCell;
}

- (void)setTableViewCell:(id)a3
{
}

- (BOOL)interactiveMoveEffectsVisible
{
  return self->_interactiveMoveEffectsVisible;
}

- (BOOL)borderShadowVisible
{
  return self->_borderShadowVisible;
}

- (BOOL)transitioningLayouts
{
  return self->_transitioningLayouts;
}

- (void)setTransitioningLayouts:(BOOL)a3
{
  self->_transitioningLayouts = a3;
}

- (UICollectionViewLayout)currentLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentLayout);
  return (UICollectionViewLayout *)WeakRetained;
}

- (void)setCurrentLayout:(id)a3
{
}

- (double)_offsetForRevealingDeleteConfirmationButton
{
  return self->_offsetForRevealingDeleteConfirmationButton;
}

- (void)_setOffsetForRevealingDeleteConfirmationButton:(double)a3
{
  self->_offsetForRevealingDeleteConfirmationButton = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentLayout);
  objc_storeStrong((id *)&self->_tableViewCell, 0);
  objc_storeStrong((id *)&self->_swipeToDeleteCell, 0);
  objc_storeStrong((id *)&self->_trackedAnimators, 0);
  objc_storeStrong((id *)&self->_selectedBackgroundViewToRestoreWhenInteractiveMoveEnds, 0);
  objc_storeStrong((id *)&self->_borderShadowBottomView, 0);
  objc_storeStrong((id *)&self->_borderShadowTopView, 0);
  objc_storeStrong((id *)&self->_swipeableView, 0);
}

@end