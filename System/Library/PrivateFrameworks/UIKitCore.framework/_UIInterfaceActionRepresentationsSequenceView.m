@interface _UIInterfaceActionRepresentationsSequenceView
- (BOOL)_isHorizontalLayout;
- (BOOL)visualCornerForcedOverride;
- (CGSize)_sizeByApplyingLayoutMarginsAsOutsetToSize:(CGSize)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (NSArray)arrangedActionRepresentationViews;
- (NSLayoutConstraint)minimumHeightConstraint;
- (UIInterfaceActionVisualStyle)visualStyle;
- (UIView)backgroundView;
- (_UIInterfaceActionRepresentationsSequenceView)initWithVisualStyle:(id)a3;
- (_UIInterfaceActionSeparatableSequenceView)separatedContentSequenceView;
- (double)_contentFitCanScrollThreshold;
- (double)_minimumNumberOfRowsRequiredVisible;
- (double)fittingWidthForLayoutAxis:(int64_t)a3;
- (id)_systemDefaultFocusGroupIdentifier;
- (int64_t)actionLayoutAxis;
- (unint64_t)visualCornerPosition;
- (void)_applyVisualStyleToSeparatedContentSequenceView;
- (void)_disableSeparatedContentSequenceViewToFit;
- (void)_enableSeparatedContentSequenceViewToFit;
- (void)_loadDefaultSizingConstraints;
- (void)_notifyDidScroll;
- (void)_temporarilySkipSizingSeparatedContentSequenceViewToFit;
- (void)_updateBackgroundView;
- (void)_updateMinimumHeightConstraint;
- (void)_updateSeparatedContentSequenceViewToFitSizeIfPossible;
- (void)layoutSubviews;
- (void)setActionLayoutAxis:(int64_t)a3;
- (void)setArrangedActionRepresentationViews:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setVisualCornerForcedOverride:(BOOL)a3;
- (void)setVisualCornerPosition:(unint64_t)a3;
- (void)setVisualStyle:(id)a3;
- (void)updateConstraints;
@end

@implementation _UIInterfaceActionRepresentationsSequenceView

- (_UIInterfaceActionRepresentationsSequenceView)initWithVisualStyle:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIInterfaceActionRepresentationsSequenceView;
  v6 = -[UIScrollView initWithFrame:](&v14, sel_initWithFrame_, 0.0, 0.0, 100.0, 100.0);
  v7 = v6;
  if (v6)
  {
    [(UIScrollView *)v6 setContentInsetAdjustmentBehavior:2];
    [(UIView *)v7 setEdgesInsettingLayoutMarginsFromSafeArea:0];
    v7->_sizingSeparatedContentSequenceViewToFitDisabledCount = 0;
    objc_storeStrong((id *)&v7->_visualStyle, a3);
    v7->_actionLayoutAxis = 1;
    arrangedActionRepresentationViews = v7->_arrangedActionRepresentationViews;
    v7->_arrangedActionRepresentationViews = (NSArray *)MEMORY[0x1E4F1CBF0];

    -[UIView setLayoutMargins:](v7, "setLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
    v9 = [_UIInterfaceActionSeparatableSequenceView alloc];
    v10 = [(_UIInterfaceActionRepresentationsSequenceView *)v7 visualStyle];
    uint64_t v11 = [(_UIInterfaceActionSeparatableSequenceView *)v9 initWithVisualStyle:v10];
    separatedContentSequenceView = v7->_separatedContentSequenceView;
    v7->_separatedContentSequenceView = (_UIInterfaceActionSeparatableSequenceView *)v11;

    [(_UIInterfaceActionSeparatableSequenceView *)v7->_separatedContentSequenceView _setLayoutDebuggingIdentifier:@"actions-separatableSequenceView"];
    [(_UIInterfaceActionSeparatableSequenceView *)v7->_separatedContentSequenceView setDistribution:1];
    [(_UIInterfaceActionSeparatableSequenceView *)v7->_separatedContentSequenceView setAxis:1];
    [(UIView *)v7 addSubview:v7->_separatedContentSequenceView];
    [(_UIInterfaceActionRepresentationsSequenceView *)v7 _loadDefaultSizingConstraints];
    [(_UIInterfaceActionRepresentationsSequenceView *)v7 reloadDisplayedContentVisualStyle];
  }

  return v7;
}

- (void)setVisualStyle:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_visualStyle] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_visualStyle, a3);
    [(_UIInterfaceActionRepresentationsSequenceView *)self reloadDisplayedContentVisualStyle];
  }
}

- (void)setActionLayoutAxis:(int64_t)a3
{
  if (self->_actionLayoutAxis != a3)
  {
    self->_actionLayoutAxis = a3;
    -[_UIInterfaceActionSeparatableSequenceView setAxis:](self->_separatedContentSequenceView, "setAxis:");
    [(UIView *)self setNeedsUpdateConstraints];
    [(UIView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setVisualCornerPosition:(unint64_t)a3
{
  if (self->_visualCornerPosition != a3)
  {
    self->_visualCornerPosition = a3;
    -[_UIInterfaceActionSeparatableSequenceView setVisualCornerPosition:](self->_separatedContentSequenceView, "setVisualCornerPosition:");
  }
}

- (void)setVisualCornerForcedOverride:(BOOL)a3
{
  if (self->_visualCornerForcedOverride != a3)
  {
    self->_visualCornerForcedOverride = a3;
    -[_UIInterfaceActionSeparatableSequenceView setVisualCornerForcedOverride:](self->_separatedContentSequenceView, "setVisualCornerForcedOverride:");
  }
}

- (void)setArrangedActionRepresentationViews:(id)a3
{
  p_arrangedActionRepresentationViews = &self->_arrangedActionRepresentationViews;
  id v6 = a3;
  if ((-[NSArray isEqual:](*p_arrangedActionRepresentationViews, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_arrangedActionRepresentationViews, a3);
    [(_UIInterfaceActionSeparatableSequenceView *)self->_separatedContentSequenceView setArrangedContentViews:*p_arrangedActionRepresentationViews];
    [(UIView *)self setNeedsUpdateConstraints];
    [(UIView *)self invalidateIntrinsicContentSize];
  }
}

- (double)fittingWidthForLayoutAxis:(int64_t)a3
{
  [(_UIInterfaceActionSeparatableSequenceView *)self->_separatedContentSequenceView fittingWidthForLayoutAxis:a3];
  return result;
}

- (double)_contentFitCanScrollThreshold
{
  return 0.5;
}

- (id)_systemDefaultFocusGroupIdentifier
{
  v3 = [(UIView *)self _focusBehavior];
  char v4 = [v3 focusGroupContainmentBehavior];

  if ((v4 & 0x10) != 0)
  {
    id v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIInterfaceActionRepresentationsSequenceView;
    id v5 = [(UIView *)&v7 _systemDefaultFocusGroupIdentifier];
  }
  return v5;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionRepresentationsSequenceView;
  [(UIScrollView *)&v3 layoutSubviews];
  [(_UIInterfaceActionRepresentationsSequenceView *)self _updateBackgroundView];
  [(_UIInterfaceActionRepresentationsSequenceView *)self _updateSeparatedContentSequenceViewToFitSizeIfPossible];
}

- (void)_notifyDidScroll
{
  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionRepresentationsSequenceView;
  [(UIScrollView *)&v3 _notifyDidScroll];
  [(_UIInterfaceActionRepresentationsSequenceView *)self _temporarilySkipSizingSeparatedContentSequenceViewToFit];
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionRepresentationsSequenceView;
  [(UIView *)&v3 updateConstraints];
  [(_UIInterfaceActionRepresentationsSequenceView *)self _updateMinimumHeightConstraint];
}

- (void)_loadDefaultSizingConstraints
{
  objc_super v3 = [(UIView *)self heightAnchor];
  char v4 = [v3 constraintGreaterThanOrEqualToConstant:0.0];
  minimumHeightConstraint = self->_minimumHeightConstraint;
  self->_minimumHeightConstraint = v4;

  id v6 = self->_minimumHeightConstraint;
  [(NSLayoutConstraint *)v6 setActive:1];
}

- (void)_updateMinimumHeightConstraint
{
  objc_super v3 = [(_UIInterfaceActionRepresentationsSequenceView *)self arrangedActionRepresentationViews];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(_UIInterfaceActionRepresentationsSequenceView *)self visualStyle];
    [v5 minimumActionContentSize];
    double v7 = v6;

    if (v7 <= 0.0)
    {
      v8 = [(_UIInterfaceActionRepresentationsSequenceView *)self arrangedActionRepresentationViews];
      v9 = [v8 firstObject];
      objc_msgSend(v9, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      double v7 = v10;
    }
    [(_UIInterfaceActionRepresentationsSequenceView *)self _minimumNumberOfRowsRequiredVisible];
    double v12 = v7 * v11;
  }
  else
  {
    double v12 = 0.0;
  }
  minimumHeightConstraint = self->_minimumHeightConstraint;
  [(NSLayoutConstraint *)minimumHeightConstraint setConstant:v12];
}

- (double)_minimumNumberOfRowsRequiredVisible
{
  BOOL v3 = [(_UIInterfaceActionRepresentationsSequenceView *)self _isHorizontalLayout];
  uint64_t v4 = [(_UIInterfaceActionRepresentationsSequenceView *)self arrangedActionRepresentationViews];
  id v5 = v4;
  if (v3)
  {
    if (v4) {
      double v6 = 1.0;
    }
    else {
      double v6 = 0.0;
    }
  }
  else
  {
    unint64_t v7 = [v4 count];

    return fmin((double)v7, 1.5);
  }
  return v6;
}

- (CGSize)_sizeByApplyingLayoutMarginsAsOutsetToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UIView *)self layoutMargins];
  double v7 = width + v5 + v6;
  double v10 = height + v8 + v9;
  double v11 = v7;
  result.double height = v10;
  result.double width = v11;
  return result;
}

- (CGSize)intrinsicContentSize
{
  -[_UIInterfaceActionSeparatableSequenceView systemLayoutSizeFittingSize:](self->_separatedContentSequenceView, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  [(_UIInterfaceActionRepresentationsSequenceView *)self _sizeByApplyingLayoutMarginsAsOutsetToSize:"_sizeByApplyingLayoutMarginsAsOutsetToSize:"];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  -[_UIInterfaceActionSeparatableSequenceView systemLayoutSizeFittingSize:](self->_separatedContentSequenceView, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  [(_UIInterfaceActionRepresentationsSequenceView *)self _sizeByApplyingLayoutMarginsAsOutsetToSize:"_sizeByApplyingLayoutMarginsAsOutsetToSize:"];
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (void)_updateSeparatedContentSequenceViewToFitSizeIfPossible
{
  if (self->_sizingSeparatedContentSequenceViewToFitDisabledCount < 1
    || ([(UIScrollView *)self contentSize], v4 == 0.0)
    || v3 == 0.0)
  {
    [(UIView *)self bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    double v10 = v9;
    CGFloat v12 = v11;
    [(UIView *)self layoutMargins];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    v29.origin.x = v6;
    v29.origin.y = v8;
    v29.size.double width = v10;
    v29.size.double height = v12;
    CGFloat v19 = CGRectGetWidth(v29) - (v16 + v18);
    -[_UIInterfaceActionRepresentationsSequenceView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", v10, 0.0);
    double v21 = v20;
    [(UIScrollView *)self accessoryInsets];
    double v24 = v19 - (v22 + v23);
    double v27 = v21 - (v25 + v26);
    -[UIView setFrame:](self->_separatedContentSequenceView, "setFrame:", v16 + v22, v14 + v25, v24, v27);
    -[UIScrollView setContentSize:](self, "setContentSize:", v24, v27);
  }
}

- (void)_temporarilySkipSizingSeparatedContentSequenceViewToFit
{
  [(_UIInterfaceActionRepresentationsSequenceView *)self _disableSeparatedContentSequenceViewToFit];
  dispatch_time_t v3 = dispatch_time(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104___UIInterfaceActionRepresentationsSequenceView__temporarilySkipSizingSeparatedContentSequenceViewToFit__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

- (void)_disableSeparatedContentSequenceViewToFit
{
}

- (void)_enableSeparatedContentSequenceViewToFit
{
}

- (void)_applyVisualStyleToSeparatedContentSequenceView
{
  dispatch_time_t v3 = [(_UIInterfaceActionRepresentationsSequenceView *)self visualStyle];
  [(_UIInterfaceActionSeparatableSequenceView *)self->_separatedContentSequenceView setVisualStyle:v3];

  [(UIView *)self invalidateIntrinsicContentSize];
}

- (BOOL)_isHorizontalLayout
{
  return self->_actionLayoutAxis == 0;
}

- (void)_updateBackgroundView
{
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  if (self->_backgroundView)
  {
    -[UIScrollView _moveContentSubview:toBack:](self, "_moveContentSubview:toBack:");
  }
}

- (void)setBackgroundView:(id)a3
{
  double v5 = (UIView *)a3;
  p_backgroundView = &self->_backgroundView;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    CGFloat v8 = v5;
    [(UIView *)backgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundView, a3);
    [(UIView *)self bounds];
    -[UIView setFrame:](*p_backgroundView, "setFrame:");
    [(UIScrollView *)self _addContentSubview:*p_backgroundView atBack:1];
    double v5 = v8;
  }
}

- (UIInterfaceActionVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (NSArray)arrangedActionRepresentationViews
{
  return self->_arrangedActionRepresentationViews;
}

- (int64_t)actionLayoutAxis
{
  return self->_actionLayoutAxis;
}

- (unint64_t)visualCornerPosition
{
  return self->_visualCornerPosition;
}

- (BOOL)visualCornerForcedOverride
{
  return self->_visualCornerForcedOverride;
}

- (NSLayoutConstraint)minimumHeightConstraint
{
  return self->_minimumHeightConstraint;
}

- (_UIInterfaceActionSeparatableSequenceView)separatedContentSequenceView
{
  return self->_separatedContentSequenceView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_separatedContentSequenceView, 0);
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_arrangedActionRepresentationViews, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
}

@end