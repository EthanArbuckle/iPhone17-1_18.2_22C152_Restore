@interface SearchUITableViewCell
+ (BOOL)canCellExpandWithResults:(id)a3;
+ (double)distanceToTopOfAppIconsForMultiResultCell;
+ (id)cellViewForRowModel:(id)a3 feedbackDelegate:(id)a4;
+ (id)reuseIdentifierForResult:(id)a3;
- (BOOL)canSetupKeyboardHandler;
- (BOOL)isExpandable;
- (BOOL)isExpanded;
- (BOOL)navigateKeyboardDown;
- (BOOL)navigateKeyboardLeft;
- (BOOL)navigateKeyboardRight;
- (BOOL)navigateKeyboardUp;
- (BOOL)supportsRecycling;
- (CGSize)_customInsetSize;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSArray)visibleResults;
- (SearchUIDragSource)dragSource;
- (SearchUIFeedbackDelegateInternal)delegate;
- (SearchUIRowModel)rowModel;
- (SearchUITableViewCell)init;
- (SearchUITableViewCell)initWithRowModel:(id)a3 feedbackDelegate:(id)a4;
- (UIEdgeInsets)customEdgeInsets;
- (UIView)leadingTextView;
- (UIView)leadingView;
- (UIView)platterView;
- (UIView)sizingContainer;
- (id)commandHandler;
- (id)contextMenuActionProvider;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)keyboardCardSectionForFocus;
- (id)keyboardResultForFocus;
- (int)sfSeparatorStyle;
- (void)_setAnimating:(BOOL)a3 clippingAdjacentCells:(BOOL)a4;
- (void)didMoveToWindow;
- (void)executeCommandWithTriggerEvent:(unint64_t)a3;
- (void)layoutSubviews;
- (void)setCustomEdgeInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setDragSource:(id)a3;
- (void)setIsExpanded:(BOOL)a3;
- (void)setPlatterView:(id)a3;
- (void)setRowModel:(id)a3;
- (void)setSfSeparatorStyle:(int)a3;
- (void)setSizingContainer:(id)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateWithResult:(id)a3;
- (void)updateWithResults:(id)a3;
- (void)updateWithRowModel:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation SearchUITableViewCell

+ (BOOL)canCellExpandWithResults:(id)a3
{
  return 0;
}

+ (double)distanceToTopOfAppIconsForMultiResultCell
{
  BOOL v2 = +[SearchUIUtilities isWideScreen];
  double result = 8.0;
  if (v2) {
    return 16.0;
  }
  return result;
}

+ (id)cellViewForRowModel:(id)a3 feedbackDelegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)objc_msgSend(v6, "cellViewClass")), "initWithRowModel:feedbackDelegate:", v6, v5);

  return v7;
}

+ (id)reuseIdentifierForResult:(id)a3
{
  v3 = +[SearchUITableModel tableModelWithResult:a3];
  v4 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  id v5 = [v3 rowModelForIndexPath:v4];

  id v6 = 0;
  if ([v3 numberOfRowsForSection:0] == 1)
  {
    id v6 = [v5 reuseIdentifier];
  }

  return v6;
}

- (SearchUITableViewCell)init
{
  return [(SearchUITableViewCell *)self initWithRowModel:0 feedbackDelegate:0];
}

- (SearchUITableViewCell)initWithRowModel:(id)a3 feedbackDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 reuseIdentifier];
  v13.receiver = self;
  v13.super_class = (Class)SearchUITableViewCell;
  v9 = [(SearchUITableViewCell *)&v13 initWithStyle:0 reuseIdentifier:v8];

  if (v9)
  {
    [(SearchUITableViewCell *)v9 setDelegate:v7];
    [(SearchUITableViewCell *)v9 setPreservesSuperviewLayoutMargins:0];
    -[SearchUITableViewCell setLayoutMargins:](v9, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    v10 = [MEMORY[0x1E4FAE120] viewWithProminence:3];
    [(SearchUITableViewCell *)v9 setSelectedBackgroundView:v10];

    [(SearchUITableViewCell *)v9 setBackgroundColor:0];
    v11 = +[SearchUIDragSource dragSourceForView:v9 dragObject:v6 feedbackDelegate:v7];
    [(SearchUITableViewCell *)v9 setDragSource:v11];

    [(SearchUITableViewCell *)v9 updateWithRowModel:v6];
  }

  return v9;
}

- (id)contextMenuActionProvider
{
  BOOL v2 = [(SearchUITableViewCell *)self commandHandler];
  v3 = [v2 actionProvider];

  return v3;
}

- (void)executeCommandWithTriggerEvent:(unint64_t)a3
{
  id v4 = [(SearchUITableViewCell *)self commandHandler];
  [v4 executeWithTriggerEvent:a3];
}

- (id)commandHandler
{
  v3 = objc_opt_new();
  id v4 = [(SearchUITableViewCell *)self delegate];
  [v3 setFeedbackDelegate:v4];

  [v3 setSourceView:self];
  [v3 setThreeDTouchEnabled:1];
  id v5 = [(SearchUITableViewCell *)self rowModel];
  id v6 = +[SearchUICommandHandler handlerForRowModel:v5 environment:v3];

  return v6;
}

- (void)updateWithResult:(id)a3
{
  id v6 = +[SearchUITableModel tableModelWithResult:a3];
  id v4 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  id v5 = [v6 rowModelForIndexPath:v4];
  [(SearchUITableViewCell *)self updateWithRowModel:v5];
}

- (void)updateWithRowModel:(id)a3
{
  id v4 = a3;
  [(SearchUITableViewCell *)self setRowModel:v4];
  id v5 = [(SearchUITableViewCell *)self dragSource];
  [v5 setDragObject:v4];

  [(SearchUITableViewCell *)self tlk_updateWithCurrentAppearance];
}

- (NSArray)visibleResults
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SearchUITableViewCell *)self rowModel];
  id v4 = [v3 identifyingResult];
  if (v4)
  {
    id v5 = [(SearchUITableViewCell *)self rowModel];
    id v6 = [v5 identifyingResult];
    v9[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v7;
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUITableViewCell;
  -[SearchUITableViewCell willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (!a3) {
    [(SearchUITableViewCell *)self removeKeyboardHandler];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUITableViewCell;
  [(SearchUITableViewCell *)&v9 traitCollectionDidChange:v4];
  objc_super v5 = [(SearchUITableViewCell *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(SearchUITableViewCell *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  id v6 = [(SearchUITableViewCell *)self traitCollection];
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
  v3.super_class = (Class)SearchUITableViewCell;
  [(SearchUITableViewCell *)&v3 didMoveToWindow];
  [(SearchUITableViewCell *)self tlk_updateWithCurrentAppearance];
}

- (void)tlk_updateForAppearance:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SearchUITableViewCell;
  [(SearchUITableViewCell *)&v11 tlk_updateForAppearance:a3];
  id v4 = [(SearchUITableViewCell *)self rowModel];
  objc_super v5 = [v4 backgroundColor];

  if (v5)
  {
    id v6 = [(SearchUITableViewCell *)self backgroundView];

    if (!v6)
    {
      uint64_t v7 = objc_opt_new();
      [v7 setDelegate:self];
      [(SearchUITableViewCell *)self setBackgroundView:v7];
    }
  }
  uint64_t v8 = [(SearchUITableViewCell *)self backgroundView];
  [v8 setColor:v5];
  objc_super v9 = [(SearchUITableViewCell *)self rowModel];
  v10 = [v9 backgroundImage];
  [v8 setBackgroundImage:v10];

  [v8 setHidden:v5 == 0];
}

- (void)_setAnimating:(BOOL)a3 clippingAdjacentCells:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = [(SearchUITableViewCell *)self layer];
  uint64_t v8 = [v7 allowsGroupBlending];

  if (_setAnimating_clippingAdjacentCells__onceToken != -1) {
    dispatch_once(&_setAnimating_clippingAdjacentCells__onceToken, &__block_literal_global_9);
  }
  if (_setAnimating_clippingAdjacentCells__respondsToSelector)
  {
    v10.receiver = self;
    v10.super_class = (Class)SearchUITableViewCell;
    [(SearchUITableViewCell *)&v10 _setAnimating:v5 clippingAdjacentCells:v4];
  }
  objc_super v9 = [(SearchUITableViewCell *)self layer];
  [v9 setAllowsGroupBlending:v8];
}

uint64_t __61__SearchUITableViewCell__setAnimating_clippingAdjacentCells___block_invoke()
{
  uint64_t result = [MEMORY[0x1E4FB1D08] instancesRespondToSelector:sel__setAnimating_clippingAdjacentCells_];
  _setAnimating_clippingAdjacentCells__respondsToSelector = result;
  return result;
}

- (void)updateWithResults:(id)a3
{
  id v4 = [a3 firstObject];
  [(SearchUITableViewCell *)self updateWithResult:v4];
}

- (BOOL)supportsRecycling
{
  return 1;
}

- (BOOL)isExpandable
{
  return 0;
}

- (void)setCustomEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  p_customEdgeInsets = &self->_customEdgeInsets;
  if (a3.left != self->_customEdgeInsets.left
    || a3.top != self->_customEdgeInsets.top
    || a3.right != self->_customEdgeInsets.right
    || a3.bottom != self->_customEdgeInsets.bottom)
  {
    v12 = [(SearchUITableViewCell *)self dragSource];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v14 = [(SearchUITableViewCell *)self dragSource];
      objc_msgSend(v14, "setCustomEdgeInsets:", top, left, bottom, right);
    }
    p_customEdgeInsets->double top = top;
    p_customEdgeInsets->double left = left;
    p_customEdgeInsets->double bottom = bottom;
    p_customEdgeInsets->double right = right;
    [(SearchUITableViewCell *)self invalidateIntrinsicContentSize];
  }
}

- (CGSize)intrinsicContentSize
{
  objc_super v3 = [(SearchUITableViewCell *)self sizingContainer];
  if (v3)
  {
    -[SearchUITableViewCell sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SearchUITableViewCell;
    [(SearchUITableViewCell *)&v10 intrinsicContentSize];
  }
  double v6 = v4;
  double v7 = v5;

  double v8 = v6;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)_customInsetSize
{
  double v2 = self->_customEdgeInsets.left + self->_customEdgeInsets.right;
  double v3 = self->_customEdgeInsets.top + self->_customEdgeInsets.bottom;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  [(SearchUITableViewCell *)self _customInsetSize];
  double v11 = width - v10;
  if (v11 >= 0.0) {
    double v12 = v11;
  }
  else {
    double v12 = 0.0;
  }
  objc_super v13 = [(SearchUITableViewCell *)self sizingContainer];
  if (v13)
  {
    v16 = [(SearchUITableViewCell *)self sizingContainer];
    *(float *)&double v17 = a4;
    *(float *)&double v18 = a5;
    objc_msgSend(v16, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v12, height, v17, v18);
    double v20 = v19;
    double v22 = v21;
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)SearchUITableViewCell;
    *(float *)&double v14 = a4;
    *(float *)&double v15 = a5;
    -[SearchUITableViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v30, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, v12, height, v14, v15);
    double v20 = v23;
    double v22 = v24;
  }

  [(SearchUITableViewCell *)self _customInsetSize];
  double v26 = v20 + v25;
  [(SearchUITableViewCell *)self _customInsetSize];
  double v28 = v22 + v27;
  double v29 = v26;
  result.double height = v28;
  result.double width = v29;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SearchUITableViewCell *)self _customInsetSize];
  double v7 = width - v6;
  double v8 = [(SearchUITableViewCell *)self sizingContainer];
  if (v8)
  {
    double v9 = [(SearchUITableViewCell *)self sizingContainer];
    objc_msgSend(v9, "sizeThatFits:", v7, height);
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)SearchUITableViewCell;
    -[SearchUITableViewCell sizeThatFits:](&v21, sel_sizeThatFits_, v7, height);
    double v11 = v14;
    double v13 = v15;
  }

  [(SearchUITableViewCell *)self _customInsetSize];
  double v17 = v11 + v16;
  [(SearchUITableViewCell *)self _customInsetSize];
  double v19 = v13 + v18;
  double v20 = v17;
  result.double height = v19;
  result.double width = v20;
  return result;
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)SearchUITableViewCell;
  [(SearchUITableViewCell *)&v36 layoutSubviews];
  double v3 = [(SearchUITableViewCell *)self contentView];
  [v3 frame];
  double top = self->_customEdgeInsets.top;
  double left = self->_customEdgeInsets.left;
  double v7 = v6 + left;
  double v9 = v8 + top;
  double v11 = v10 - (left + self->_customEdgeInsets.right);
  double v13 = v12 - (top + self->_customEdgeInsets.bottom);
  double v14 = [(SearchUITableViewCell *)self contentView];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  double v15 = [(SearchUITableViewCell *)self contentView];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v24 = [(SearchUITableViewCell *)self sizingContainer];
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

  uint64_t v25 = [(SearchUITableViewCell *)self sfSeparatorStyle];
  if (v25 != 1)
  {
    uint64_t v26 = v25;
    double v27 = [(SearchUITableViewCell *)self sizingContainer];
    [v27 layoutIfNeeded];

    double v28 = [(SearchUITableViewCell *)self leadingView];
    double v29 = [(SearchUITableViewCell *)self leadingTextView];
    +[SearchUICardSectionView separatorInsetsForStyle:v26 cellView:self leadingView:v28 leadingTextView:v29];
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;

    -[SearchUITableViewCell setSeparatorInset:](self, "setSeparatorInset:", v31, v33, v35, 16.0);
  }
}

- (BOOL)canSetupKeyboardHandler
{
  return 0;
}

- (BOOL)navigateKeyboardLeft
{
  return 0;
}

- (BOOL)navigateKeyboardRight
{
  return 0;
}

- (BOOL)navigateKeyboardUp
{
  return 0;
}

- (BOOL)navigateKeyboardDown
{
  return 0;
}

- (id)keyboardResultForFocus
{
  double v2 = [(SearchUITableViewCell *)self rowModel];
  double v3 = [v2 identifyingResult];

  return v3;
}

- (id)keyboardCardSectionForFocus
{
  double v2 = [(SearchUITableViewCell *)self rowModel];
  double v3 = [v2 cardSection];

  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = objc_msgSend(MEMORY[0x1E4FAE100], "tappableControlViewForPoint:inView:withEvent:", self, v7, x, y);
  double v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SearchUITableViewCell;
    -[SearchUITableViewCell hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v11 = v10;

  return v11;
}

- (UIEdgeInsets)customEdgeInsets
{
  double top = self->_customEdgeInsets.top;
  double left = self->_customEdgeInsets.left;
  double bottom = self->_customEdgeInsets.bottom;
  double right = self->_customEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (SearchUIRowModel)rowModel
{
  return self->_rowModel;
}

- (void)setRowModel:(id)a3
{
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (SearchUIFeedbackDelegateInternal)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SearchUIFeedbackDelegateInternal *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)sizingContainer
{
  return self->_sizingContainer;
}

- (void)setSizingContainer:(id)a3
{
}

- (SearchUIDragSource)dragSource
{
  return self->_dragSource;
}

- (void)setDragSource:(id)a3
{
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

- (void)setSfSeparatorStyle:(int)a3
{
  self->_sfSeparatorStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingTextView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_dragSource, 0);
  objc_storeStrong((id *)&self->_sizingContainer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_rowModel, 0);
}

@end