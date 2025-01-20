@interface _UIInterfaceActionSeparatableSequenceView
- (BOOL)_isVerticalLayout;
- (BOOL)visualCornerForcedOverride;
- (CGRect)_stackViewFrameForViewBounds:(CGRect)a3;
- (CGRect)_viewBoundsForStackViewFrame:(CGRect)a3;
- (CGSize)_systemLayoutSizeFittingStackView:(CGSize)a3;
- (CGSize)intrinsicContentSize;
- (NSArray)arrangedContentSeparatorViews;
- (NSArray)arrangedContentViews;
- (NSArray)arrangedContentViewsDistributionConstraints;
- (UIInterfaceActionVisualStyle)visualStyle;
- (UIStackView)stackView;
- (_UIInterfaceActionSeparatableSequenceView)initWithVisualStyle:(id)a3;
- (double)fittingWidthForLayoutAxis:(int64_t)a3;
- (int64_t)_dimensionAttributeToConstrainEqual;
- (int64_t)_separatorConstantSizedAxis;
- (int64_t)axis;
- (int64_t)distribution;
- (unint64_t)visualCornerPosition;
- (void)_addSeparatorToStackAndMutableArray:(id)a3 preferSectionStyle:(BOOL)a4;
- (void)_markRoundedCornerPositionOnAllCornersOfView:(id)a3;
- (void)_markRoundedCornerPositionOnLeadingEdgeOfView:(id)a3;
- (void)_markRoundedCornerPositionOnNoCornersOfView:(id)a3;
- (void)_markRoundedCornerPositionOnTrailingEdgeOfView:(id)a3;
- (void)_reloadContentDistributionConstraintsForArrangedContentViews;
- (void)_reloadStackViewArrangement;
- (void)_setLayoutDebuggingIdentifier:(id)a3;
- (void)_setRoundedCornersOfView:(id)a3 toCornerPosition:(unint64_t)a4;
- (void)_updateActionRepresentationViewsCanRemoveContentFromHierarchyWhenNotVisibleSetting;
- (void)_updateActionSpacing;
- (void)_updateLayoutWithStackFrameForActionSequenceEdgeInsets;
- (void)_updateRoundedCornerPositionForActionRepViews;
- (void)_updateSeparatorConstantSizedAxis;
- (void)_withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:(id)a3;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)reloadDisplayedContentVisualStyle;
- (void)setArrangedContentViews:(id)a3;
- (void)setAxis:(int64_t)a3;
- (void)setDistribution:(int64_t)a3;
- (void)setVisualCornerForcedOverride:(BOOL)a3;
- (void)setVisualCornerPosition:(unint64_t)a3;
- (void)setVisualStyle:(id)a3;
- (void)updateConstraints;
@end

@implementation _UIInterfaceActionSeparatableSequenceView

- (_UIInterfaceActionSeparatableSequenceView)initWithVisualStyle:(id)a3
{
  id v5 = a3;
  v6 = +[UIScreen mainScreen];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v25.receiver = self;
  v25.super_class = (Class)_UIInterfaceActionSeparatableSequenceView;
  v15 = -[UIView initWithFrame:](&v25, sel_initWithFrame_, v8, v10, v12, v14);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_visualStyle, a3);
    arrangedContentViews = v16->_arrangedContentViews;
    v18 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v16->_arrangedContentViews = (NSArray *)MEMORY[0x1E4F1CBF0];

    arrangedContentSeparatorViews = v16->_arrangedContentSeparatorViews;
    v16->_arrangedContentSeparatorViews = v18;

    arrangedContentViewsDistributionConstraints = v16->_arrangedContentViewsDistributionConstraints;
    v16->_arrangedContentViewsDistributionConstraints = v18;

    v16->_axis = 1;
    v21 = [UIStackView alloc];
    [(UIView *)v16 bounds];
    uint64_t v22 = -[UIStackView initWithFrame:](v21, "initWithFrame:");
    stackView = v16->_stackView;
    v16->_stackView = (UIStackView *)v22;

    [(UIStackView *)v16->_stackView setAxis:v16->_axis];
    [(UIStackView *)v16->_stackView setDistribution:0];
    [(UIStackView *)v16->_stackView setAlignment:0];
    [(UIView *)v16 addSubview:v16->_stackView];
    [(_UIInterfaceActionSeparatableSequenceView *)v16 reloadDisplayedContentVisualStyle];
  }

  return v16;
}

- (void)setVisualStyle:(id)a3
{
  p_visualStyle = &self->_visualStyle;
  id v12 = a3;
  if (([v12 isEqual:*p_visualStyle] & 1) == 0)
  {
    v6 = [(UIInterfaceActionVisualStyle *)*p_visualStyle visualStyleOverride];
    double v7 = [v6 customSeparatorAttributes];

    objc_storeStrong((id *)&self->_visualStyle, a3);
    [(_UIInterfaceActionSeparatableSequenceView *)self reloadDisplayedContentVisualStyle];
    double v8 = [(UIInterfaceActionVisualStyle *)*p_visualStyle visualStyleOverride];
    double v9 = [v8 customSeparatorAttributes];

    double v10 = [(_UIInterfaceActionSeparatableSequenceView *)self arrangedContentViews];
    if (![v10 count] || v7 == v9)
    {
    }
    else
    {
      char v11 = [v7 isEqual:v9];

      if ((v11 & 1) == 0) {
        [(_UIInterfaceActionSeparatableSequenceView *)self _reloadStackViewArrangement];
      }
    }
  }
}

- (void)setAxis:(int64_t)a3
{
  if ([(_UIInterfaceActionSeparatableSequenceView *)self axis] != a3)
  {
    self->_axis = a3;
    [(UIStackView *)self->_stackView setAxis:a3];
    [(_UIInterfaceActionSeparatableSequenceView *)self _updateActionSpacing];
    [(_UIInterfaceActionSeparatableSequenceView *)self _updateSeparatorConstantSizedAxis];
    [(_UIInterfaceActionSeparatableSequenceView *)self _reloadStackViewArrangement];
  }
}

- (void)setDistribution:(int64_t)a3
{
  if (self->_distribution != a3)
  {
    self->_distribution = a3;
    [(UIView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setVisualCornerPosition:(unint64_t)a3
{
  if (self->_visualCornerPosition != a3)
  {
    self->_visualCornerPosition = a3;
    [(_UIInterfaceActionSeparatableSequenceView *)self _updateRoundedCornerPositionForActionRepViews];
  }
}

- (void)setVisualCornerForcedOverride:(BOOL)a3
{
  if (self->_visualCornerForcedOverride != a3)
  {
    self->_visualCornerForcedOverride = a3;
    [(_UIInterfaceActionSeparatableSequenceView *)self _updateRoundedCornerPositionForActionRepViews];
  }
}

- (void)setArrangedContentViews:(id)a3
{
  id v5 = a3;
  if ((-[NSArray isEqual:](self->_arrangedContentViews, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_arrangedContentViews, a3);
    [(_UIInterfaceActionSeparatableSequenceView *)self _updateActionRepresentationViewsCanRemoveContentFromHierarchyWhenNotVisibleSetting];
    [(_UIInterfaceActionSeparatableSequenceView *)self _reloadStackViewArrangement];
  }
}

- (void)_updateActionRepresentationViewsCanRemoveContentFromHierarchyWhenNotVisibleSetting
{
  if ([(_UIInterfaceActionSeparatableSequenceView *)self _isVerticalLayout])
  {
    v3 = [(_UIInterfaceActionSeparatableSequenceView *)self arrangedContentViews];
    unint64_t v4 = [v3 count];

    if (v4 < 6)
    {
      uint64_t v6 = 0;
    }
    else
    {
      id v5 = [(NSArray *)self->_arrangedContentViews firstObject];
      if ([(NSArray *)self->_arrangedContentViews count] >= 2)
      {
        unint64_t v7 = 1;
        do
        {
          double v8 = [(NSArray *)self->_arrangedContentViews objectAtIndexedSubscript:v7];
          uint64_t v6 = [v5 hasLayoutHeightConstraintsIdenticalToRepresentationView:v8];

          if ((v6 & 1) == 0) {
            break;
          }
          ++v7;
        }
        while (v7 < [(NSArray *)self->_arrangedContentViews count]);
      }
      else
      {
        uint64_t v6 = 1;
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  double v9 = [(NSArray *)self->_arrangedContentViews firstObject];
  [v9 setCanRemoveContentFromHierarchyWhenNotVisible:0];

  if ([(NSArray *)self->_arrangedContentViews count] >= 2)
  {
    unint64_t v10 = 1;
    do
    {
      char v11 = [(NSArray *)self->_arrangedContentViews objectAtIndexedSubscript:v10];
      [v11 setCanRemoveContentFromHierarchyWhenNotVisible:v6];

      ++v10;
    }
    while (v10 < [(NSArray *)self->_arrangedContentViews count]);
  }
}

- (double)fittingWidthForLayoutAxis:(int64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  double v5 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  unint64_t v7 = self->_arrangedContentViews;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  double v9 = v6;
  double v10 = v5;
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v30;
    double v9 = v6;
    double v10 = v5;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v13), "systemLayoutSizeFittingSize:", v5, v6, (void)v29);
        if (v10 < v14) {
          double v10 = v14;
        }
        if (v9 < v15) {
          double v9 = v15;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v11);
  }

  if ([(NSArray *)self->_arrangedContentSeparatorViews count])
  {
    v16 = [(_UIInterfaceActionSeparatableSequenceView *)self visualStyle];
    v17 = [v16 groupViewState];
    v18 = (void *)[v16 newActionSeparatorViewForGroupViewState:v17];
    objc_msgSend(v18, "setConstantSizedAxis:", -[_UIInterfaceActionSeparatableSequenceView _separatorConstantSizedAxis](self, "_separatorConstantSizedAxis"));
    [v18 setNeedsUpdateConstraints];
    [v18 updateConstraintsIfNeeded];
    objc_msgSend(v18, "systemLayoutSizeFittingSize:", v5, v6);
    double v20 = v19;
    double v22 = v21;
    unint64_t v23 = [(NSArray *)self->_arrangedContentSeparatorViews count];
    if (a3) {
      double v24 = v22;
    }
    else {
      double v24 = v20;
    }
    double v25 = v24 * (double)v23;
  }
  else
  {
    double v25 = 0.0;
  }
  unint64_t v26 = [(NSArray *)self->_arrangedContentViews count];
  if (a3) {
    double v27 = v9;
  }
  else {
    double v27 = v10;
  }
  return v25 + v27 * (double)v26;
}

- (void)reloadDisplayedContentVisualStyle
{
  [(_UIInterfaceActionSeparatableSequenceView *)self _updateActionSpacing];
  [(_UIInterfaceActionSeparatableSequenceView *)self _updateLayoutWithStackFrameForActionSequenceEdgeInsets];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (void)_updateLayoutWithStackFrameForActionSequenceEdgeInsets
{
  [(UIView *)self bounds];
  -[_UIInterfaceActionSeparatableSequenceView _stackViewFrameForViewBounds:](self, "_stackViewFrameForViewBounds:");
  stackView = self->_stackView;
  -[UIView setFrame:](stackView, "setFrame:");
}

- (CGRect)_viewBoundsForStackViewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unint64_t v7 = [(_UIInterfaceActionSeparatableSequenceView *)self visualStyle];
  [v7 actionSequenceEdgeInsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = x - v11;
  double v17 = width - (-v11 - v15);
  double v18 = y - v9;
  double v19 = height - (-v13 - v9);
  result.size.double height = v19;
  result.size.double width = v17;
  result.origin.double y = v18;
  result.origin.double x = v16;
  return result;
}

- (CGRect)_stackViewFrameForViewBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unint64_t v7 = [(_UIInterfaceActionSeparatableSequenceView *)self visualStyle];
  [v7 actionSequenceEdgeInsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = x + v11;
  double v17 = width - (v15 + v11);
  double v18 = y + v9;
  double v19 = height - (v9 + v13);
  result.size.double height = v19;
  result.size.double width = v17;
  result.origin.double y = v18;
  result.origin.double x = v16;
  return result;
}

- (void)_setLayoutDebuggingIdentifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIInterfaceActionSeparatableSequenceView;
  [(UIView *)&v7 _setLayoutDebuggingIdentifier:a3];
  stackView = self->_stackView;
  double v5 = [(UIView *)self _layoutDebuggingIdentifier];
  double v6 = [v5 stringByAppendingString:@".stack"];
  [(UIView *)stackView _setLayoutDebuggingIdentifier:v6];
}

- (void)_withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __113___UIInterfaceActionSeparatableSequenceView__withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists___block_invoke;
  v7[3] = &unk_1E52DA160;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)_UIInterfaceActionSeparatableSequenceView;
  id v5 = v4;
  [(UIView *)&v6 _withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:v7];
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionSeparatableSequenceView;
  [(UIView *)&v3 updateConstraints];
  [(_UIInterfaceActionSeparatableSequenceView *)self _reloadContentDistributionConstraintsForArrangedContentViews];
}

- (void)layoutSublayersOfLayer:(id)a3
{
  [(_UIInterfaceActionSeparatableSequenceView *)self _updateLayoutWithStackFrameForActionSequenceEdgeInsets];
  v5.receiver = self;
  v5.super_class = (Class)_UIInterfaceActionSeparatableSequenceView;
  [(UIView *)&v5 layoutSublayersOfLayer:a3];
}

- (CGSize)intrinsicContentSize
{
  -[_UIInterfaceActionSeparatableSequenceView _systemLayoutSizeFittingStackView:](self, "_systemLayoutSizeFittingStackView:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGSize)_systemLayoutSizeFittingStackView:(CGSize)a3
{
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_stackView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
  double v5 = v4;
  double v7 = v6;
  if (v6 <= 0.0)
  {
    [(UIStackView *)self->_stackView _calculatedIntrinsicHeight];
    double v7 = v8;
  }
  -[_UIInterfaceActionSeparatableSequenceView _viewBoundsForStackViewFrame:](self, "_viewBoundsForStackViewFrame:", 0.0, 0.0, v5, v7);
  double v10 = v9;
  double v12 = v11;
  result.double height = v12;
  result.double width = v10;
  return result;
}

- (void)_reloadContentDistributionConstraintsForArrangedContentViews
{
  [MEMORY[0x1E4F5B268] deactivateConstraints:self->_arrangedContentViewsDistributionConstraints];
  arrangedContentViewsDistributionConstraints = self->_arrangedContentViewsDistributionConstraints;
  self->_arrangedContentViewsDistributionConstraints = (NSArray *)MEMORY[0x1E4F1CBF0];

  id v14 = [MEMORY[0x1E4F1CA48] array];
  int64_t v4 = [(_UIInterfaceActionSeparatableSequenceView *)self _dimensionAttributeToConstrainEqual];
  if (v4)
  {
    int64_t v6 = v4;
    double v7 = [(NSArray *)self->_arrangedContentViews firstObject];
    if ([(NSArray *)self->_arrangedContentViews count] >= 2)
    {
      unint64_t v8 = 1;
      do
      {
        double v9 = (void *)MEMORY[0x1E4F5B268];
        double v10 = [(NSArray *)self->_arrangedContentViews objectAtIndexedSubscript:v8];
        double v11 = [v9 constraintWithItem:v10 attribute:v6 relatedBy:0 toItem:v7 attribute:v6];
        [v14 addObject:v11];

        ++v8;
      }
      while (v8 < [(NSArray *)self->_arrangedContentViews count]);
    }
  }
  _UIConstraintsBySortingConstraintsForInsertionPerformance(v14, v5);
  double v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  double v13 = self->_arrangedContentViewsDistributionConstraints;
  self->_arrangedContentViewsDistributionConstraints = v12;

  [MEMORY[0x1E4F5B268] activateConstraints:self->_arrangedContentViewsDistributionConstraints];
}

- (int64_t)_dimensionAttributeToConstrainEqual
{
  int64_t distribution = self->_distribution;
  BOOL v4 = [(_UIInterfaceActionSeparatableSequenceView *)self _isVerticalLayout];
  if (distribution == 1)
  {
    if (v4)
    {
      double v5 = [(_UIInterfaceActionSeparatableSequenceView *)self visualStyle];
      [v5 minimumActionContentSize];
      int64_t v7 = 8 * (v6 <= 0.0);
    }
    else
    {
      return 7;
    }
  }
  else if (v4)
  {
    return 8;
  }
  else
  {
    return 7;
  }
  return v7;
}

- (void)_reloadStackViewArrangement
{
  double v3 = (void *)[(NSArray *)self->_arrangedContentViews copy];
  BOOL v4 = [(UIStackView *)self->_stackView arrangedSubviews];
  double v5 = (void *)[v4 mutableCopy];

  [v5 removeObjectsInArray:v3];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __72___UIInterfaceActionSeparatableSequenceView__reloadStackViewArrangement__block_invoke;
  v21[3] = &unk_1E52DA8E8;
  v21[4] = self;
  [v5 enumerateObjectsUsingBlock:v21];
  double v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [v3 count];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__7;
  v19[4] = __Block_byref_object_dispose__7;
  id v20 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  double v12 = __72___UIInterfaceActionSeparatableSequenceView__reloadStackViewArrangement__block_invoke_14;
  double v13 = &unk_1E52DA910;
  id v14 = self;
  uint64_t v18 = v7;
  id v8 = v3;
  id v15 = v8;
  id v9 = v6;
  id v16 = v9;
  double v17 = v19;
  [v8 enumerateObjectsWithOptions:0 usingBlock:&v10];
  [(_UIInterfaceActionSeparatableSequenceView *)self _updateRoundedCornerPositionForActionRepViews];
  objc_storeStrong((id *)&self->_arrangedContentSeparatorViews, v6);
  [(UIView *)self setNeedsUpdateConstraints];
  [(UIView *)self invalidateIntrinsicContentSize];

  _Block_object_dispose(v19, 8);
}

- (void)_addSeparatorToStackAndMutableArray:(id)a3 preferSectionStyle:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  double v6 = [(_UIInterfaceActionSeparatableSequenceView *)self visualStyle];
  uint64_t v7 = [v6 groupViewState];
  if (v4 && (id v8 = (void *)[v6 newSectionSeparatorViewForGroupViewState:v7]) != 0
    || (id v8 = (void *)[v6 newActionSeparatorViewForGroupViewState:v7]) != 0)
  {
    objc_msgSend(v8, "setConstantSizedAxis:", -[_UIInterfaceActionSeparatableSequenceView _separatorConstantSizedAxis](self, "_separatorConstantSizedAxis"));
    [(UIStackView *)self->_stackView addArrangedSubview:v8];
    [v9 addObject:v8];
  }
}

- (void)_updateActionSpacing
{
  id v4 = [(_UIInterfaceActionSeparatableSequenceView *)self visualStyle];
  double v3 = [v4 groupViewState];
  [v4 actionSpacingForGroupViewState:v3];
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:");
}

- (int64_t)_separatorConstantSizedAxis
{
  return [(_UIInterfaceActionSeparatableSequenceView *)self _isVerticalLayout];
}

- (void)_updateSeparatorConstantSizedAxis
{
  int64_t v3 = [(_UIInterfaceActionSeparatableSequenceView *)self _separatorConstantSizedAxis];
  arrangedContentSeparatorViews = self->_arrangedContentSeparatorViews;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78___UIInterfaceActionSeparatableSequenceView__updateSeparatorConstantSizedAxis__block_invoke;
  v5[3] = &__block_descriptor_40_e46_v32__0__UIView_UISeparatorDisplaying__8Q16_B24l;
  v5[4] = v3;
  [(NSArray *)arrangedContentSeparatorViews enumerateObjectsUsingBlock:v5];
}

- (void)_updateRoundedCornerPositionForActionRepViews
{
  int64_t v3 = self->_arrangedContentViews;
  if ([(NSArray *)v3 count] <= 1)
  {
    id v4 = [(NSArray *)v3 firstObject];
    [(_UIInterfaceActionSeparatableSequenceView *)self _markRoundedCornerPositionOnAllCornersOfView:v4];
LABEL_6:

    goto LABEL_7;
  }
  if (!self->_visualCornerForcedOverride)
  {
    double v5 = [(NSArray *)v3 firstObject];
    [(_UIInterfaceActionSeparatableSequenceView *)self _markRoundedCornerPositionOnLeadingEdgeOfView:v5];

    double v6 = -[NSArray subarrayWithRange:](v3, "subarrayWithRange:", 1, [(NSArray *)v3 count] - 2);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __90___UIInterfaceActionSeparatableSequenceView__updateRoundedCornerPositionForActionRepViews__block_invoke_2;
    v7[3] = &unk_1E52DA5E8;
    v7[4] = self;
    [v6 enumerateObjectsUsingBlock:v7];

    id v4 = [(NSArray *)v3 lastObject];
    [(_UIInterfaceActionSeparatableSequenceView *)self _markRoundedCornerPositionOnTrailingEdgeOfView:v4];
    goto LABEL_6;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90___UIInterfaceActionSeparatableSequenceView__updateRoundedCornerPositionForActionRepViews__block_invoke;
  v8[3] = &unk_1E52DA5E8;
  v8[4] = self;
  [(NSArray *)v3 enumerateObjectsUsingBlock:v8];
LABEL_7:
}

- (void)_markRoundedCornerPositionOnLeadingEdgeOfView:(id)a3
{
  id v5 = a3;
  if ([(_UIInterfaceActionSeparatableSequenceView *)self _isVerticalLayout]) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 5;
  }
  [(_UIInterfaceActionSeparatableSequenceView *)self _setRoundedCornersOfView:v5 toCornerPosition:v4];
}

- (void)_markRoundedCornerPositionOnTrailingEdgeOfView:(id)a3
{
  id v5 = a3;
  if ([(_UIInterfaceActionSeparatableSequenceView *)self _isVerticalLayout]) {
    uint64_t v4 = 12;
  }
  else {
    uint64_t v4 = 10;
  }
  [(_UIInterfaceActionSeparatableSequenceView *)self _setRoundedCornersOfView:v5 toCornerPosition:v4];
}

- (void)_markRoundedCornerPositionOnAllCornersOfView:(id)a3
{
}

- (void)_markRoundedCornerPositionOnNoCornersOfView:(id)a3
{
}

- (void)_setRoundedCornersOfView:(id)a3 toCornerPosition:(unint64_t)a4
{
  id v6 = a3;
  objc_msgSend(v6, "setVisualCornerPosition:", -[_UIInterfaceActionSeparatableSequenceView visualCornerPosition](self, "visualCornerPosition") & a4);
}

- (BOOL)_isVerticalLayout
{
  return [(_UIInterfaceActionSeparatableSequenceView *)self axis] == 1;
}

- (UIInterfaceActionVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (int64_t)axis
{
  return self->_axis;
}

- (int64_t)distribution
{
  return self->_distribution;
}

- (NSArray)arrangedContentViews
{
  return self->_arrangedContentViews;
}

- (unint64_t)visualCornerPosition
{
  return self->_visualCornerPosition;
}

- (BOOL)visualCornerForcedOverride
{
  return self->_visualCornerForcedOverride;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (NSArray)arrangedContentSeparatorViews
{
  return self->_arrangedContentSeparatorViews;
}

- (NSArray)arrangedContentViewsDistributionConstraints
{
  return self->_arrangedContentViewsDistributionConstraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrangedContentViewsDistributionConstraints, 0);
  objc_storeStrong((id *)&self->_arrangedContentSeparatorViews, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_arrangedContentViews, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
}

@end