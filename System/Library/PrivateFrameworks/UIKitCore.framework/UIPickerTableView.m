@interface UIPickerTableView
+ (BOOL)_isInternalTableView;
- (BOOL)_beginTrackingWithEvent:(id)a3;
- (BOOL)_playsFeedback;
- (BOOL)_scrollRowAtIndexPathToSelectionBar:(id)a3 animated:(BOOL)a4;
- (BOOL)_shouldWrapCells;
- (BOOL)didSelectDisabled:(BOOL)a3;
- (BOOL)generatorActivated;
- (BOOL)isRowChecked:(int64_t)a3;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (BOOL)selectRow:(int64_t)a3 animated:(BOOL)a4 notify:(BOOL)a5;
- (BOOL)selectRow:(int64_t)a3 animated:(BOOL)a4 notify:(BOOL)a5 updateChecked:(BOOL)a6;
- (CATransform3D)_transformForCellAtY:(SEL)a3;
- (CGPoint)contentOffsetForRowAtIndexPath:(id)a3;
- (CGRect)_selectionBarRectForBounds:(CGRect)a3;
- (CGRect)_visibleBounds;
- (CGRect)selectionBarRect;
- (UIColor)_textColor;
- (UIPickerTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4 visibleRect:(CGRect)a5;
- (id)_anyDateLabel;
- (id)_checkedRows;
- (id)_containerView;
- (id)_pickerView;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)_contentInsetAdjustmentBehavior;
- (int64_t)lastSelectedRow;
- (int64_t)selectionBarRow;
- (void)_deactivateFeedbackGeneratorIfNeeded;
- (void)_notifyContentOffsetChange;
- (void)_playClickIfNecessary;
- (void)_rectChangedWithNewSize:(CGSize)a3 oldSize:(CGSize)a4;
- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4;
- (void)_scrollingFinished;
- (void)_setContentOffset:(CGPoint)a3 notify:(BOOL)a4;
- (void)_setPlaysFeedback:(BOOL)a3;
- (void)_setSelectionBarRow:(int64_t)a3;
- (void)_setTextColor:(id)a3;
- (void)_updateContentInsets;
- (void)dealloc;
- (void)layoutSubviews;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setBounds:(CGRect)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGeneratorActivated:(BOOL)a3;
- (void)setLastSelectedRow:(int64_t)a3;
- (void)setSelectionBarRect:(CGRect)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation UIPickerTableView

+ (BOOL)_isInternalTableView
{
  return 1;
}

- (UIPickerTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4 visibleRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)UIPickerTableView;
  v9 = -[UITableView initWithFrame:style:](&v20, sel_initWithFrame_style_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = v9;
  if (v9)
  {
    v9->_selectionBarRow = -1;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __53__UIPickerTableView_initWithFrame_style_visibleRect___block_invoke;
    v18[3] = &unk_1E52D9F70;
    v11 = v9;
    v19 = v11;
    +[UIView _performForcedAppearanceModifications:v18];
    v11->_lastClickedOffset = 2.22507386e-308;
    uint64_t v12 = +[UIColor labelColor];
    textColor = v11->_textColor;
    v11->_textColor = (UIColor *)v12;

    v11->_lastSelectedRow = 0;
    v11->_visibleRect.origin.CGFloat x = x;
    v11->_visibleRect.origin.CGFloat y = y;
    v11->_visibleRect.size.CGFloat width = width;
    v11->_visibleRect.size.CGFloat height = height;
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    referencingCells = v11->_referencingCells;
    v11->_referencingCells = v14;

    [(UIScrollView *)v11 _setShouldScrollAncestors:0];
    [(UITableView *)v11 setEstimatedRowHeight:0.0];
    [(UITableView *)v11 setEstimatedSectionHeaderHeight:0.0];
    [(UITableView *)v11 setEstimatedSectionFooterHeight:0.0];
    [(UITableView *)v11 setPrefetchingEnabled:0];
    v16 = [(UITableView *)v11 _scrollView];
    [v16 _setSupportsPointerDragScrolling:1];
  }
  return v10;
}

uint64_t __53__UIPickerTableView_initWithFrame_style_visibleRect___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSeparatorStyle:0];
  [*(id *)(a1 + 32) setOpaque:0];
  [*(id *)(a1 + 32) setBackgroundColor:0];
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) setScrollsToTop:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setAllowsSelection:0];
}

- (CGRect)_visibleBounds
{
  CGFloat x = self->_visibleRect.origin.x;
  double y = self->_visibleRect.origin.y;
  CGFloat height = self->_visibleRect.size.height;
  [(UIScrollView *)self contentOffset];
  double v7 = y + v6;
  v12.receiver = self;
  v12.super_class = (Class)UIPickerTableView;
  [(UITableView *)&v12 _visibleBounds];
  double v9 = x;
  double v10 = v7;
  double v11 = height;
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v8;
  result.origin.double y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (id)_pickerView
{
  v2 = [(UIView *)self superview];
  if (v2)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 superview];

      v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_referencingCells;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) setPickerTable:0];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)UIPickerTableView;
  [(UITableView *)&v8 dealloc];
}

- (void)setSelectionBarRect:(CGRect)a3
{
  self->_selectionBarRect = a3;
  [(UIPickerTableView *)self _updateContentInsets];
}

- (CGRect)_selectionBarRectForBounds:(CGRect)a3
{
  p_selectionBarRect = &self->_selectionBarRect;
  CGFloat MinY = CGRectGetMinY(a3);
  CGFloat x = p_selectionBarRect->origin.x;
  CGFloat y = p_selectionBarRect->origin.y;
  CGFloat width = p_selectionBarRect->size.width;
  CGFloat height = p_selectionBarRect->size.height;
  return CGRectOffset(*(CGRect *)&x, 0.0, MinY);
}

- (BOOL)_scrollRowAtIndexPathToSelectionBar:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 row];
  if (v7 >= [(UITableView *)self numberOfRowsInSection:0])
  {
    BOOL v14 = 0;
  }
  else
  {
    -[UIPickerTableView _setSelectionBarRow:](self, "_setSelectionBarRow:", [v6 row]);
    *(unsigned char *)&self->_pickerTableFlags |= 0x40u;
    [(UIScrollView *)self stopScrollingAndZooming];
    *(unsigned char *)&self->_pickerTableFlags &= ~0x40u;
    [(UIPickerTableView *)self contentOffsetForRowAtIndexPath:v6];
    double v9 = v8;
    double v11 = v10;
    [(UIScrollView *)self contentOffset];
    BOOL v14 = v11 != v13 || v9 != v12;
    -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", v4, v9, v11);
    [(UIPickerTableView *)self _notifyContentOffsetChange];
  }

  return v14;
}

- (id)_checkedRows
{
  checkedRows = self->_checkedRows;
  if (!checkedRows)
  {
    BOOL v4 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    uint64_t v5 = self->_checkedRows;
    self->_checkedRows = v4;

    checkedRows = self->_checkedRows;
  }
  return checkedRows;
}

- (BOOL)selectRow:(int64_t)a3 animated:(BOOL)a4 notify:(BOOL)a5
{
  return [(UIPickerTableView *)self selectRow:a3 animated:a4 notify:a5 updateChecked:1];
}

- (BOOL)selectRow:(int64_t)a3 animated:(BOOL)a4 notify:(BOOL)a5 updateChecked:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  double v11 = [(UIPickerTableView *)self _checkedRows];
  double v12 = [(UIPickerTableView *)self _pickerView];
  BOOL v13 = [(UITableView *)self allowsMultipleSelection];
  BOOL v14 = v13;
  if (v6)
  {
    if (!v13)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __61__UIPickerTableView_selectRow_animated_notify_updateChecked___block_invoke;
      v34[3] = &unk_1E52E34A0;
      int64_t v36 = a3;
      v34[4] = self;
      id v35 = v12;
      [v11 enumerateIndexesUsingBlock:v34];
      [v11 removeAllIndexes];
    }
    [v11 addIndex:a3];
  }
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__162;
  v32 = __Block_byref_object_dispose__162;
  id v33 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __61__UIPickerTableView_selectRow_animated_notify_updateChecked___block_invoke_99;
  v27[3] = &unk_1E5301058;
  v27[4] = self;
  v27[5] = &v28;
  v27[6] = a3;
  +[UIView performWithoutAnimation:v27];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & v6) == 1)
  {
    v15 = [(id)v29[5] wrappedView];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v14 && ([v15 isChecked] & 1) != 0)
      {
        if ([v15 isChecked]) {
          [v11 removeIndex:a3];
        }
        uint64_t v16 = 0;
        int v17 = 0;
      }
      else
      {
        int v17 = [v15 isChecked] ^ 1;
        uint64_t v16 = 1;
      }
      [v15 setChecked:v16];
      [v12 _sendCheckedRow:a3 inTableView:self checked:v16];
    }
    else
    {
      int v17 = 0;
    }
  }
  else
  {
    int v17 = 0;
  }
  if (v7) {
    char v18 = 16;
  }
  else {
    char v18 = 24;
  }
  *(unsigned char *)&self->_char pickerTableFlags = *(unsigned char *)&self->_pickerTableFlags & 0xE7 | v18;
  v19 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
  BOOL v20 = [(UIPickerTableView *)self _scrollRowAtIndexPathToSelectionBar:v19 animated:v8]&& v8;

  char pickerTableFlags = (char)self->_pickerTableFlags;
  if (!v20)
  {
    pickerTableFlags &= ~0x10u;
    *(unsigned char *)&self->_char pickerTableFlags = pickerTableFlags;
  }
  if (v20) {
    char v22 = -33;
  }
  else {
    char v22 = -41;
  }
  char v23 = pickerTableFlags & v22;
  if (v20) {
    char v24 = 32;
  }
  else {
    char v24 = 0;
  }
  *(unsigned char *)&self->_char pickerTableFlags = v23 | v24;
  if (!v20 && (v17 & [v12 _usesCheckSelection]) == 1)
  {
    v25 = [(UIPickerTableView *)self _pickerView];
    [v25 _sendSelectionChangedFromTable:self notify:1];
  }
  _Block_object_dispose(&v28, 8);

  return v20;
}

void __61__UIPickerTableView_selectRow_animated_notify_updateChecked___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 48) != a2)
  {
    BOOL v4 = *(void **)(a1 + 32);
    uint64_t v5 = [MEMORY[0x1E4F28D58] indexPathForRow:a2 inSection:0];
    double v9 = [v4 cellForRowAtIndexPath:v5];

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    BOOL v7 = v9;
    if (isKindOfClass)
    {
      BOOL v8 = [v9 wrappedView];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 setChecked:0];
        [*(id *)(a1 + 40) _sendCheckedRow:a2 inTableView:*(void *)(a1 + 32) checked:0];
      }

      BOOL v7 = v9;
    }
  }
}

void __61__UIPickerTableView_selectRow_animated_notify_updateChecked___block_invoke_99(void *a1)
{
  v2 = (void *)a1[4];
  id v6 = [MEMORY[0x1E4F28D58] indexPathForRow:a1[6] inSection:0];
  uint64_t v3 = [v2 cellForRowAtIndexPath:v6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)didSelectDisabled:(BOOL)a3
{
  $5D92890A3DCAD6948D9D9D8590CBAACA pickerTableFlags = self->_pickerTableFlags;
  if (a3) {
    *(unsigned char *)&self->_$5D92890A3DCAD6948D9D9D8590CBAACA pickerTableFlags = *(unsigned char *)&pickerTableFlags & 0xF7;
  }
  return (*(unsigned int *)&pickerTableFlags >> 3) & 1;
}

- (void)_rectChangedWithNewSize:(CGSize)a3 oldSize:(CGSize)a4
{
  v5.receiver = self;
  v5.super_class = (Class)UIPickerTableView;
  -[UITableView _rectChangedWithNewSize:oldSize:](&v5, sel__rectChangedWithNewSize_oldSize_, a3.width, a3.height, a4.width, a4.height);
  [(UIPickerTableView *)self _updateContentInsets];
}

- (void)_updateContentInsets
{
  p_selectionBarRect = &self->_selectionBarRect;
  double MinY = CGRectGetMinY(self->_selectionBarRect);
  [(UIView *)self frame];
  double Height = CGRectGetHeight(v15);
  double v6 = Height - CGRectGetMaxY(*p_selectionBarRect);
  [(UIScrollView *)self contentInset];
  BOOL v11 = v10 == 0.0 && MinY == v7;
  if (!v11 || v9 != 0.0 || v6 != v8)
  {
    int64_t v12 = [(UIPickerTableView *)self selectionBarRow];
    *(unsigned char *)&self->_pickerTableFlags |= 0x80u;
    -[UITableView setContentInset:](self, "setContentInset:", MinY, 0.0, v6, 0.0);
    *(unsigned char *)&self->_pickerTableFlags &= ~0x80u;
    if (v12 != -1)
    {
      objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", -[UIPickerTableView selectionBarRow](self, "selectionBarRow"), 0);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      [(UIPickerTableView *)self _scrollRowAtIndexPathToSelectionBar:v13 animated:0];
    }
  }
}

- (int64_t)_contentInsetAdjustmentBehavior
{
  return 2;
}

- (CATransform3D)_transformForCellAtY:(SEL)a3
{
  double v7 = [(UIView *)self traitCollection];
  +[UIPickerView _styleForIdiom:](UIPickerView, "_styleForIdiom:", [v7 userInterfaceIdiom]);
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(UITableView *)self rowHeight];
  int v17 = v19;
  if (v19)
  {
    objc_msgSend(v19, "transformForCellAtY:inBounds:rowHeight:selectionBarRect:", a4, v9, v11, v13, v15, v16, *(void *)&self->_selectionBarRect.origin.x, *(void *)&self->_selectionBarRect.origin.y, *(void *)&self->_selectionBarRect.size.width, *(void *)&self->_selectionBarRect.size.height);
    int v17 = v19;
  }
  else
  {
    *(_OWORD *)&retstr->m41 = 0u;
    *(_OWORD *)&retstr->m43 = 0u;
    *(_OWORD *)&retstr->m31 = 0u;
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m21 = 0u;
    *(_OWORD *)&retstr->m23 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m13 = 0u;
  }

  return result;
}

- (void)_notifyContentOffsetChange
{
  id v3 = [(UIPickerTableView *)self _containerView];
  if (objc_opt_respondsToSelector()) {
    [v3 _pickerTableViewDidChangeContentOffset:self];
  }
}

- (void)_setContentOffset:(CGPoint)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  [(UIScrollView *)self contentOffset];
  double v9 = v8;
  v26.receiver = self;
  v26.super_class = (Class)UIPickerTableView;
  -[UITableView setContentOffset:](&v26, sel_setContentOffset_, x, y);
  if (![(UIScrollView *)self isScrollAnimating] && *(unsigned char *)&self->_pickerTableFlags <= 0x3Fu)
  {
    if (v9 >= y)
    {
      if (v9 <= y) {
        goto LABEL_21;
      }
      int v19 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
      [(UITableView *)self _sectionContentInset];
      if ((*(void *)&v19 & 0x80000) != 0) {
        double v22 = v21;
      }
      else {
        double v22 = v20;
      }
      char v23 = -[UITableView indexPathForRowAtPoint:](self, "indexPathForRowAtPoint:", v22, y + CGRectGetMaxY(self->_selectionBarRect) + -1.0);
      double v15 = v23;
      if (!v23) {
        goto LABEL_20;
      }
      int64_t v24 = [v23 row];
      int64_t v17 = v24;
      if ((*(unsigned char *)&self->_pickerTableFlags & 6) == 2 && v24 >= self->_selectionBarRow) {
        goto LABEL_20;
      }
      char v18 = 4;
    }
    else
    {
      int v10 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
      [(UITableView *)self _sectionContentInset];
      if ((*(void *)&v10 & 0x80000) != 0) {
        double v13 = v12;
      }
      else {
        double v13 = v11;
      }
      double v14 = -[UITableView indexPathForRowAtPoint:](self, "indexPathForRowAtPoint:", v13, y + CGRectGetMinY(self->_selectionBarRect) + 1.0);
      double v15 = v14;
      if (!v14) {
        goto LABEL_20;
      }
      int64_t v16 = [v14 row];
      int64_t v17 = v16;
      if ((*(unsigned char *)&self->_pickerTableFlags & 6) == 4 && v16 <= self->_selectionBarRow) {
        goto LABEL_20;
      }
      char v18 = 2;
    }
    [(UIPickerTableView *)self _setSelectionBarRow:v17];
    *(unsigned char *)&self->_$5D92890A3DCAD6948D9D9D8590CBAACA pickerTableFlags = *(unsigned char *)&self->_pickerTableFlags & 0xF9 | v18;
LABEL_20:
  }
LABEL_21:
  v25 = [(UIView *)self window];

  if (v25)
  {
    if (v4) {
      [(UIPickerTableView *)self _notifyContentOffsetChange];
    }
  }
}

- (void)setContentOffset:(CGPoint)a3
{
}

- (void)layoutSubviews
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __35__UIPickerTableView_layoutSubviews__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

void __35__UIPickerTableView_layoutSubviews__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v28.receiver = *(id *)(a1 + 32);
  v28.super_class = (Class)UIPickerTableView;
  objc_msgSendSuper2(&v28, sel_layoutSubviews);
  [*(id *)(a1 + 32) contentOffset];
  double v3 = v2;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  BOOL v4 = [*(id *)(a1 + 32) visibleCells];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v9 center];
        double v11 = v10 - v3;
        if (v10 - v3 >= 0.0 && ([*(id *)(a1 + 32) bounds], v11 <= v12))
        {
          double v14 = [v9 layer];
          double v15 = *(void **)(a1 + 32);
          if (v15)
          {
            [v15 _transformForCellAtY:v11];
          }
          else
          {
            long long v22 = 0u;
            long long v23 = 0u;
            long long v20 = 0u;
            long long v21 = 0u;
            long long v18 = 0u;
            long long v19 = 0u;
            long long v16 = 0u;
            long long v17 = 0u;
          }
          [v14 setTransform:&v16];

          uint64_t v13 = 0;
        }
        else
        {
          uint64_t v13 = 1;
        }
        objc_msgSend(v9, "setHidden:", v13, v16, v17, v18, v19, v20, v21, v22, v23);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }
}

- (id)_anyDateLabel
{
  double v2 = [(UITableView *)self visibleCells];
  if ([v2 count])
  {
    double v3 = [v2 lastObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v4 = [v3 _anyDateLabel];
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)UIPickerTableView;
  [(UITableView *)&v5 _scrollViewAnimationEnded:a3 finished:a4];
  *(unsigned char *)&self->_pickerTableFlags &= 0xF9u;
}

- (id)_containerView
{
  double v2 = [(UIView *)self superview];
  if (v2)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 superview];

      double v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (void)_playClickIfNecessary
{
  if (self->_playsFeedback && (*(unsigned char *)&self->_pickerTableFlags & 0x10) == 0)
  {
    uint64_t v3 = [(UIView *)self window];
    if (v3)
    {
      BOOL v4 = (void *)v3;
      objc_super v5 = [(UIPickerTableView *)self _pickerView];
      int v6 = [v5 _soundsEnabled];

      if (v6)
      {
        [(UIScrollView *)self contentOffset];
        double v8 = v7;
        double v9 = self->_lastClickedOffset - v7;
        double v10 = v9 >= 0.0 ? self->_lastClickedOffset - v7 : -v9;
        [(UITableView *)self rowHeight];
        if (v10 >= v11 * 0.5)
        {
          double v12 = [(UIPickerTableView *)self _pickerView];
          [v12 _willPlayClickSound];

          uint64_t v13 = [(UIPickerTableView *)self _pickerView];
          id v19 = [v13 _selectionFeedbackGenerator];

          if (self->_generatorActivated)
          {
            double v14 = [(UIPickerTableView *)self _containerView];
            [v14 center];
            double v16 = v15;
            double v18 = v17;

            objc_msgSend(v19, "selectionChangedAtLocation:", v16, v18);
          }
          self->_lastClickedOffset = v8;
        }
      }
    }
  }
}

- (void)_setSelectionBarRow:(int64_t)a3
{
  int64_t selectionBarRow = self->_selectionBarRow;
  if (selectionBarRow != a3)
  {
    self->_int64_t selectionBarRow = a3;
    id v5 = [(UIPickerTableView *)self _containerView];
    if (objc_opt_respondsToSelector()) {
      [v5 pickerTableView:self didChangeSelectionBarRowFrom:selectionBarRow to:self->_selectionBarRow];
    }
    [(UIPickerTableView *)self _playClickIfNecessary];
  }
}

- (int64_t)selectionBarRow
{
  return self->_selectionBarRow & ~(self->_selectionBarRow >> 63);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  double v9 = v8;
  double v11 = v10;
  int64_t v12 = [(UIPickerTableView *)self selectionBarRow];
  v15.receiver = self;
  v15.super_class = (Class)UIPickerTableView;
  -[UITableView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height)
  {
    double v14 = [MEMORY[0x1E4F28D58] indexPathForRow:v12 inSection:0];
    [(UIPickerTableView *)self _scrollRowAtIndexPathToSelectionBar:v14 animated:0];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  int64_t v12 = [(UIPickerTableView *)self selectionBarRow];
  v15.receiver = self;
  v15.super_class = (Class)UIPickerTableView;
  -[UITableView setBounds:](&v15, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height)
  {
    double v14 = [MEMORY[0x1E4F28D58] indexPathForRow:v12 inSection:0];
    [(UIPickerTableView *)self _scrollRowAtIndexPathToSelectionBar:v14 animated:0];
  }
}

- (BOOL)isRowChecked:(int64_t)a3
{
  return [(NSMutableIndexSet *)self->_checkedRows containsIndex:a3];
}

- (BOOL)_beginTrackingWithEvent:(id)a3
{
  *(unsigned char *)&self->_pickerTableFlags |= 0x40u;
  v5.receiver = self;
  v5.super_class = (Class)UIPickerTableView;
  BOOL result = [(UITableView *)&v5 _beginTrackingWithEvent:a3];
  *(unsigned char *)&self->_pickerTableFlags &= ~0x40u;
  return result;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a5->y;
  [(UIPickerTableView *)self selectionBarRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(UIPickerTableView *)self selectionBarRect];
  double v15 = y + v14;
  -[UITableView indexPathsForRowsInRect:](self, "indexPathsForRowsInRect:", v9, v15, v11, v13);
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  [(UIPickerTableView *)self selectionBarRect];
  double v17 = v16;
  uint64_t v18 = [v38 count];
  if (v18 != 2)
  {
    if (v18)
    {
      uint64_t v22 = [v38 objectAtIndex:0];
    }
    else
    {
      uint64_t v19 = [(UITableView *)self numberOfRowsInSection:0];
      uint64_t v20 = v19 - 1;
      if (v19 < 1)
      {
        double v26 = *MEMORY[0x1E4F1DAD8];
        double v28 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        goto LABEL_13;
      }
      [(UIView *)self bounds];
      if (CGRectGetMinY(v40) >= 0.0) {
        uint64_t v21 = v20;
      }
      else {
        uint64_t v21 = 0;
      }
      uint64_t v22 = [MEMORY[0x1E4F28D58] indexPathForRow:v21 inSection:0];
    }
    id v35 = (void *)v22;
    [(UIPickerTableView *)self contentOffsetForRowAtIndexPath:v22];
    double v26 = v36;
    double v28 = v37;

LABEL_13:
    v34 = v38;
    goto LABEL_14;
  }
  double v23 = v15 - v17;
  long long v24 = [v38 objectAtIndex:0];
  [(UIPickerTableView *)self contentOffsetForRowAtIndexPath:v24];
  double v26 = v25;
  double v28 = v27;

  v29 = [v38 objectAtIndex:1];
  [(UIPickerTableView *)self contentOffsetForRowAtIndexPath:v29];
  double v31 = v30;
  double v33 = v32;

  v34 = v38;
  if (vabdd_f64(v23, v28) >= vabdd_f64(v23, v33))
  {
    double v28 = v33;
    double v26 = v31;
  }
LABEL_14:
  a5->double x = v26;
  a5->double y = v28;
}

- (CGPoint)contentOffsetForRowAtIndexPath:(id)a3
{
  [(UITableView *)self rectForRowAtIndexPath:a3];
  CGFloat x = v9.origin.x;
  double MinY = CGRectGetMinY(v9);
  [(UIPickerTableView *)self selectionBarRect];
  double v6 = MinY - CGRectGetMinY(v10);
  double v7 = x;
  result.double y = v6;
  result.CGFloat x = v7;
  return result;
}

- (void)_scrollingFinished
{
  if ((*(unsigned char *)&self->_pickerTableFlags & 0x40) == 0)
  {
    if ([(UIPickerTableView *)self didSelectDisabled:1])
    {
      uint64_t v3 = 0;
    }
    else if ((*(unsigned char *)&self->_pickerTableFlags & 0x20) != 0)
    {
      uint64_t v3 = 1;
    }
    else
    {
      BOOL v4 = [(UIPickerTableView *)self _pickerView];
      uint64_t v3 = [v4 _usesCheckSelection] ^ 1;
    }
    objc_super v5 = [(UIPickerTableView *)self _pickerView];
    [v5 _sendSelectionChangedFromTable:self notify:v3];

    char pickerTableFlags = (char)self->_pickerTableFlags;
    *(unsigned char *)&self->_char pickerTableFlags = pickerTableFlags & 0xDF;
    if ((pickerTableFlags & 0x10) != 0)
    {
      *(unsigned char *)&self->_char pickerTableFlags = pickerTableFlags & 0xCF;
      [(UIPickerTableView *)self _playClickIfNecessary];
    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  if ((*(unsigned char *)&self->_pickerTableFlags & 8) != 0) {
    *(unsigned char *)&self->_pickerTableFlags &= ~8u;
  }
  if (!self->_generatorActivated)
  {
    BOOL v4 = [(UIPickerTableView *)self _pickerView];
    objc_super v5 = [v4 _selectionFeedbackGenerator];
    [v5 activateWithCompletionBlock:0];

    self->_generatorActivated = 1;
  }
  id v7 = [(UIView *)self window];
  double v6 = [v7 windowScene];
  [v6 _setReachabilitySupported:0 forReason:@"UIPickerTableView scrollViewWillBeginDragging"];
}

- (void)_deactivateFeedbackGeneratorIfNeeded
{
  uint64_t v3 = [(UIPickerTableView *)self _pickerView];
  id v4 = [v3 _selectionFeedbackGenerator];

  if (self->_generatorActivated)
  {
    [v4 deactivate];
    self->_generatorActivated = 0;
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    [(UIPickerTableView *)self _scrollingFinished];
    [(UIPickerTableView *)self _deactivateFeedbackGeneratorIfNeeded];
  }
  id v6 = [(UIView *)self window];
  objc_super v5 = [v6 windowScene];
  [v5 _setReachabilitySupported:1 forReason:@"UIPickerTableView scrollViewDidEndDragging"];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  [(UIPickerTableView *)self _scrollingFinished];
  [(UIPickerTableView *)self _deactivateFeedbackGeneratorIfNeeded];
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  [(UITableView *)self deselectRowAtIndexPath:v5 animated:1];
  uint64_t v6 = [v5 row];

  [(UIPickerTableView *)self selectRow:v6 animated:1 notify:1];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(UIPickerTableView *)self _pickerView];
  if ([v6 _usesCheckedSelection])
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v5, "row"), objc_msgSend(v5, "section"));
    double v8 = [(UITableView *)self cellForRowAtIndexPath:v7];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGRect v9 = [v8 wrappedView];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v9 _isSelectable]) {
          CGRect v10 = v5;
        }
        else {
          CGRect v10 = 0;
        }
        id v11 = v10;

        goto LABEL_11;
      }
    }
  }
  id v11 = v5;
LABEL_11:

  return v11;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a4;
  uint64_t v6 = +[UIColor clearColor];
  [v7 setBackgroundColor:v6];

  [v7 setPickerTable:self];
  [(NSMutableArray *)self->_referencingCells addObject:v7];
}

- (void)_setTextColor:(id)a3
{
  p_textColor = &self->_textColor;
  id v5 = a3;
  if (([v5 isEqual:*p_textColor] & 1) == 0) {
    objc_storeStrong((id *)p_textColor, a3);
  }
}

- (UIColor)_textColor
{
  return self->_textColor;
}

- (BOOL)_shouldWrapCells
{
  return 0;
}

- (CGRect)selectionBarRect
{
  double x = self->_selectionBarRect.origin.x;
  double y = self->_selectionBarRect.origin.y;
  double width = self->_selectionBarRect.size.width;
  double height = self->_selectionBarRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)lastSelectedRow
{
  return self->_lastSelectedRow;
}

- (void)setLastSelectedRow:(int64_t)a3
{
  self->_lastSelectedRow = a3;
}

- (BOOL)_playsFeedback
{
  return self->_playsFeedback;
}

- (void)_setPlaysFeedback:(BOOL)a3
{
  self->_playsFeedback = a3;
}

- (BOOL)generatorActivated
{
  return self->_generatorActivated;
}

- (void)setGeneratorActivated:(BOOL)a3
{
  self->_generatorActivated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referencingCells, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_checkedRows, 0);
}

@end