@interface _UIInterfaceActionSystemRepresentationView
- (BOOL)_displayedViewsConstraintsNeedsLoading;
- (BOOL)_hasLoadedContents;
- (BOOL)_isDisplayingLeadingImageView;
- (BOOL)_isDisplayingTrailingImageView;
- (NSArray)displayedViewsPositioningConstraints;
- (NSArray)displayedViewsSpacingConstraints;
- (NSSet)displayedViews;
- (NSSet)viewsToDisplayWhenContentsVisible;
- (_UIInterfaceActionImagePropertyView)leadingImageView;
- (_UIInterfaceActionImagePropertyView)trailingImageView;
- (_UIInterfaceActionLabelsPropertyView)labelsView;
- (_UIInterfaceActionSystemRepresentationView)initWithAction:(id)a3;
- (id)_constraintForBaselineAligningOrVerticallyCenteringImageViewToLabelsView:(id)a3;
- (id)_constraintForVerticallyCenteringLabelsView;
- (id)_constraintsForHorizontallyCenteringLabelsView;
- (id)_constraintsForInsettingImageViewsLeadingAndTrailingEdge;
- (id)_constraintsForInsettingLabelsViewLeadingAndTrailing;
- (id)_constraintsForInsettingLabelsViewLeadingAndTrailingHorizontalEdgeReferenceExact:(BOOL)a3;
- (id)_constraintsForInsettingLabelsViewLeadingAndTrailingToImageViewsExact:(BOOL)a3;
- (id)_constraintsToEnsureContainerHeightTallEnoughForViews:(id)a3;
- (void)_activateDisplayedViewsConstraints;
- (void)_applyVisualStyle;
- (void)_arrangeDisplayedViews;
- (void)_invalidateDisplayedViewsConstraints;
- (void)_loadConstraintsForDisplayedViews;
- (void)_loadConstraintsForLabelsAndImagesDisplay;
- (void)_loadConstraintsForLabelsOnlyDisplay;
- (void)_reloadHierarchyWithViewsToDisplayWhenContentsVisible;
- (void)_reloadViewsToDisplayWhenContentsVisible;
- (void)_removeAllDisplayedViews;
- (void)_updateDisplayedViewsConstraintsVisualStyleConstants;
- (void)interfaceAction:(id)a3 reloadDisplayedContentActionProperties:(id)a4;
- (void)interfaceAction:(id)a3 reloadDisplayedContentVisualStyle:(id)a4;
- (void)loadContents;
- (void)setDisplayedViews:(id)a3;
- (void)setViewsToDisplayWhenContentsVisible:(id)a3;
- (void)updateConstraints;
@end

@implementation _UIInterfaceActionSystemRepresentationView

- (_UIInterfaceActionSystemRepresentationView)initWithAction:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIInterfaceActionSystemRepresentationView;
  v3 = [(UIInterfaceActionRepresentationView *)&v9 initWithAction:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] set];
    viewsToDisplayWhenContentsVisible = v3->_viewsToDisplayWhenContentsVisible;
    v3->_viewsToDisplayWhenContentsVisible = (NSSet *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CAD0] set];
    displayedViews = v3->_displayedViews;
    v3->_displayedViews = (NSSet *)v6;

    [(UIView *)v3 setTranslatesAutoresizingMaskIntoConstraints:1];
    [(_UIInterfaceActionSystemRepresentationView *)v3 _invalidateDisplayedViewsConstraints];
    [(_UIInterfaceActionSystemRepresentationView *)v3 _reloadViewsToDisplayWhenContentsVisible];
  }
  return v3;
}

- (void)setViewsToDisplayWhenContentsVisible:(id)a3
{
  id v5 = a3;
  if ((-[NSSet isEqual:](self->_viewsToDisplayWhenContentsVisible, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewsToDisplayWhenContentsVisible, a3);
    [(_UIInterfaceActionSystemRepresentationView *)self _arrangeDisplayedViews];
  }
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionSystemRepresentationView;
  [(UIInterfaceActionRepresentationView *)&v3 updateConstraints];
  [(_UIInterfaceActionSystemRepresentationView *)self _loadConstraintsForDisplayedViews];
}

- (void)loadContents
{
  objc_super v3 = [_UIInterfaceActionImagePropertyView alloc];
  uint64_t v4 = [(UIInterfaceActionRepresentationView *)self action];
  id v5 = [(_UIInterfaceActionImagePropertyView *)v3 initWithAction:v4 imageProperty:0x1ED0EA320];
  leadingImageView = self->_leadingImageView;
  self->_leadingImageView = v5;

  [(UIView *)self->_leadingImageView _setLayoutDebuggingIdentifier:@"actionRep.leadingImageView"];
  v7 = [_UIInterfaceActionImagePropertyView alloc];
  v8 = [(UIInterfaceActionRepresentationView *)self action];
  objc_super v9 = [(_UIInterfaceActionImagePropertyView *)v7 initWithAction:v8 imageProperty:0x1ED0EA360];
  trailingImageView = self->_trailingImageView;
  self->_trailingImageView = v9;

  [(UIView *)self->_trailingImageView _setLayoutDebuggingIdentifier:@"actionRep.trailingImageView"];
  v11 = [_UIInterfaceActionLabelsPropertyView alloc];
  v12 = [(UIInterfaceActionRepresentationView *)self action];
  v13 = [(_UIInterfaceActionLabelsPropertyView *)v11 initWithAction:v12];
  labelsView = self->_labelsView;
  self->_labelsView = v13;

  [(UIView *)self->_labelsView _setLayoutDebuggingIdentifier:@"actionRep.labelsView"];
  [(_UIInterfaceActionSystemRepresentationView *)self _reloadViewsToDisplayWhenContentsVisible];
  [(_UIInterfaceActionSystemRepresentationView *)self _applyVisualStyleToDisplayedViews];
  [(_UIInterfaceActionSystemRepresentationView *)self _arrangeDisplayedViews];
}

- (BOOL)_hasLoadedContents
{
  return self->_labelsView != 0;
}

- (void)interfaceAction:(id)a3 reloadDisplayedContentActionProperties:(id)a4
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)_UIInterfaceActionSystemRepresentationView;
  id v6 = a4;
  [(UIInterfaceActionRepresentationView *)&v8 interfaceAction:a3 reloadDisplayedContentActionProperties:v6];
  v9[0] = 0x1ED0EA320;
  v9[1] = 0x1ED0EA340;
  v9[2] = 0x1ED0EA360;
  v9[3] = 0x1ED0EA380;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  LODWORD(a3) = +[UIInterfaceAction changedProperties:v6 containsAny:v7];

  if (a3) {
    [(_UIInterfaceActionSystemRepresentationView *)self _reloadViewsToDisplayWhenContentsVisible];
  }
}

- (void)interfaceAction:(id)a3 reloadDisplayedContentVisualStyle:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)_UIInterfaceActionSystemRepresentationView;
  [(UIInterfaceActionRepresentationView *)&v4 interfaceAction:a3 reloadDisplayedContentVisualStyle:a4];
}

- (void)_applyVisualStyle
{
  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionSystemRepresentationView;
  [(UIInterfaceActionRepresentationView *)&v3 _applyVisualStyle];
  [(_UIInterfaceActionSystemRepresentationView *)self _applyVisualStyleToDisplayedViews];
}

- (void)_reloadViewsToDisplayWhenContentsVisible
{
  if ([(_UIInterfaceActionSystemRepresentationView *)self _hasLoadedContents])
  {
    id v3 = [MEMORY[0x1E4F1CA80] set];
    if ([(_UIInterfaceActionImagePropertyView *)self->_leadingImageView isUsedToOccupySpaceIfNoImage])
    {
      [v3 addObject:self->_leadingImageView];
    }
    [v3 addObject:self->_labelsView];
    if ([(_UIInterfaceActionImagePropertyView *)self->_trailingImageView isUsedToOccupySpaceIfNoImage])
    {
      [v3 addObject:self->_trailingImageView];
    }
    [(_UIInterfaceActionSystemRepresentationView *)self setViewsToDisplayWhenContentsVisible:v3];
  }
}

- (void)_arrangeDisplayedViews
{
  [(_UIInterfaceActionSystemRepresentationView *)self _invalidateDisplayedViewsConstraints];
  if ([(UIInterfaceActionRepresentationView *)self _contentsInsertedIntoViewHierarchy])
  {
    [(_UIInterfaceActionSystemRepresentationView *)self _reloadHierarchyWithViewsToDisplayWhenContentsVisible];
  }
  else
  {
    [(_UIInterfaceActionSystemRepresentationView *)self _removeAllDisplayedViews];
  }
}

- (void)_removeAllDisplayedViews
{
  [(NSSet *)self->_displayedViews enumerateObjectsUsingBlock:&__block_literal_global_11];
  id v3 = [MEMORY[0x1E4F1CAD0] set];
  displayedViews = self->_displayedViews;
  self->_displayedViews = v3;
}

- (void)_reloadHierarchyWithViewsToDisplayWhenContentsVisible
{
  id v3 = (NSSet *)[(NSSet *)self->_viewsToDisplayWhenContentsVisible copy];
  objc_super v4 = (void *)[(NSSet *)self->_displayedViews mutableCopy];
  [v4 minusSet:v3];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_22];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99___UIInterfaceActionSystemRepresentationView__reloadHierarchyWithViewsToDisplayWhenContentsVisible__block_invoke_2;
  v7[3] = &unk_1E52DA828;
  v7[4] = self;
  [(NSSet *)v3 enumerateObjectsWithOptions:2 usingBlock:v7];
  displayedViews = self->_displayedViews;
  self->_displayedViews = v3;
  id v6 = v3;
}

- (void)_loadConstraintsForDisplayedViews
{
  if ([(NSSet *)self->_displayedViews count] == 1)
  {
    [(_UIInterfaceActionSystemRepresentationView *)self _loadConstraintsForLabelsOnlyDisplay];
  }
  else if ([(NSSet *)self->_displayedViews count] >= 2)
  {
    [(_UIInterfaceActionSystemRepresentationView *)self _loadConstraintsForLabelsAndImagesDisplay];
  }
  [(_UIInterfaceActionSystemRepresentationView *)self _updateDisplayedViewsConstraintsVisualStyleConstants];
  [(_UIInterfaceActionSystemRepresentationView *)self _activateDisplayedViewsConstraints];
}

- (void)_loadConstraintsForLabelsOnlyDisplay
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82___UIInterfaceActionSystemRepresentationView__loadConstraintsForLabelsOnlyDisplay__block_invoke;
  v8[3] = &unk_1E52DA850;
  v8[4] = self;
  id v3 = [MEMORY[0x1E4F1CA48] array];
  __82___UIInterfaceActionSystemRepresentationView__loadConstraintsForLabelsOnlyDisplay__block_invoke((uint64_t)v8, v3);
  _UIConstraintsBySortingConstraintsForInsertionPerformance(v3, v4);
  id v5 = (NSArray *)objc_claimAutoreleasedReturnValue();

  displayedViewsPositioningConstraints = self->_displayedViewsPositioningConstraints;
  self->_displayedViewsPositioningConstraints = v5;

  displayedViewsSpacingConstraints = self->_displayedViewsSpacingConstraints;
  self->_displayedViewsSpacingConstraints = (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)_loadConstraintsForLabelsAndImagesDisplay
{
  id v3 = [(UIInterfaceActionRepresentationView *)self action];
  BOOL v4 = [v3 titleAlignment] == 1;

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v19 = __87___UIInterfaceActionSystemRepresentationView__loadConstraintsForLabelsAndImagesDisplay__block_invoke;
  v20 = &unk_1E52DA878;
  v21 = self;
  BOOL v22 = v4;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  v19((uint64_t)v18, v5);
  _UIConstraintsBySortingConstraintsForInsertionPerformance(v5, v6);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();

  displayedViewsPositioningConstraints = self->_displayedViewsPositioningConstraints;
  self->_displayedViewsPositioningConstraints = v7;

  v14 = __87___UIInterfaceActionSystemRepresentationView__loadConstraintsForLabelsAndImagesDisplay__block_invoke_2;
  v15 = &unk_1E52DA878;
  v16 = self;
  BOOL v17 = v4;
  objc_super v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", MEMORY[0x1E4F143A8], 3221225472);
  v14((uint64_t)&v13, v9);
  _UIConstraintsBySortingConstraintsForInsertionPerformance(v9, v10);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();

  displayedViewsSpacingConstraints = self->_displayedViewsSpacingConstraints;
  self->_displayedViewsSpacingConstraints = v11;
}

- (id)_constraintForVerticallyCenteringLabelsView
{
  id v3 = [(UIView *)self->_labelsView centerYAnchor];
  BOOL v4 = [(UIView *)self centerYAnchor];
  id v5 = [v3 constraintEqualToAnchor:v4];

  return v5;
}

- (id)_constraintForBaselineAligningOrVerticallyCenteringImageViewToLabelsView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 image];
  int v6 = [v5 hasBaseline];

  if (v6)
  {
    v7 = [v4 lastBaselineAnchor];

    [(UIView *)self->_labelsView lastBaselineAnchor];
  }
  else
  {
    v7 = [v4 centerYAnchor];

    [(UIView *)self->_labelsView centerYAnchor];
  objc_super v8 = };
  objc_super v9 = [v7 constraintEqualToAnchor:v8];

  return v9;
}

- (id)_constraintsToEnsureContainerHeightTallEnoughForViews:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[2] = __100___UIInterfaceActionSystemRepresentationView__constraintsToEnsureContainerHeightTallEnoughForViews___block_invoke;
  v11[3] = &unk_1E52DA8A0;
  id v12 = v4;
  uint64_t v13 = self;
  id v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = v4;
  v7 = objc_msgSend(v5, "array", v11[0], 3221225472);
  __100___UIInterfaceActionSystemRepresentationView__constraintsToEnsureContainerHeightTallEnoughForViews___block_invoke((uint64_t)v11, v7);
  objc_super v9 = _UIConstraintsBySortingConstraintsForInsertionPerformance(v7, v8);

  return v9;
}

- (id)_constraintsForInsettingLabelsViewLeadingAndTrailing
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __98___UIInterfaceActionSystemRepresentationView__constraintsForInsettingLabelsViewLeadingAndTrailing__block_invoke;
  v6[3] = &unk_1E52DA850;
  v6[4] = self;
  v2 = [MEMORY[0x1E4F1CA48] array];
  __98___UIInterfaceActionSystemRepresentationView__constraintsForInsettingLabelsViewLeadingAndTrailing__block_invoke((uint64_t)v6, v2);
  id v4 = _UIConstraintsBySortingConstraintsForInsertionPerformance(v2, v3);

  return v4;
}

- (id)_constraintsForInsettingLabelsViewLeadingAndTrailingToImageViewsExact:(BOOL)a3
{
  v7[2] = __116___UIInterfaceActionSystemRepresentationView__constraintsForInsettingLabelsViewLeadingAndTrailingToImageViewsExact___block_invoke;
  v7[3] = &unk_1E52DA878;
  BOOL v8 = a3;
  v7[4] = self;
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", MEMORY[0x1E4F143A8], 3221225472);
  __116___UIInterfaceActionSystemRepresentationView__constraintsForInsettingLabelsViewLeadingAndTrailingToImageViewsExact___block_invoke((uint64_t)v7, v3);
  id v5 = _UIConstraintsBySortingConstraintsForInsertionPerformance(v3, v4);

  return v5;
}

- (id)_constraintsForInsettingLabelsViewLeadingAndTrailingHorizontalEdgeReferenceExact:(BOOL)a3
{
  v7[2] = __127___UIInterfaceActionSystemRepresentationView__constraintsForInsettingLabelsViewLeadingAndTrailingHorizontalEdgeReferenceExact___block_invoke;
  v7[3] = &unk_1E52DA878;
  BOOL v8 = a3;
  v7[4] = self;
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", MEMORY[0x1E4F143A8], 3221225472);
  __127___UIInterfaceActionSystemRepresentationView__constraintsForInsettingLabelsViewLeadingAndTrailingHorizontalEdgeReferenceExact___block_invoke((uint64_t)v7, v3);
  id v5 = _UIConstraintsBySortingConstraintsForInsertionPerformance(v3, v4);

  return v5;
}

- (id)_constraintsForInsettingImageViewsLeadingAndTrailingEdge
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __102___UIInterfaceActionSystemRepresentationView__constraintsForInsettingImageViewsLeadingAndTrailingEdge__block_invoke;
  v6[3] = &unk_1E52DA850;
  v6[4] = self;
  v2 = [MEMORY[0x1E4F1CA48] array];
  __102___UIInterfaceActionSystemRepresentationView__constraintsForInsettingImageViewsLeadingAndTrailingEdge__block_invoke((uint64_t)v6, v2);
  id v4 = _UIConstraintsBySortingConstraintsForInsertionPerformance(v2, v3);

  return v4;
}

- (id)_constraintsForHorizontallyCenteringLabelsView
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(UIView *)self->_labelsView centerXAnchor];
  id v4 = [(_UIInterfaceActionSystemRepresentationView *)self _horizontalEdgeReference];
  id v5 = [v4 centerXAnchor];
  id v6 = [v3 constraintEqualToAnchor:v5];
  v9[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v7;
}

- (void)_updateDisplayedViewsConstraintsVisualStyleConstants
{
  id v3 = [(UIInterfaceActionRepresentationView *)self visualStyle];
  [v3 horizontalImageContentSpacing];
  displayedViewsSpacingConstraints = self->_displayedViewsSpacingConstraints;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __98___UIInterfaceActionSystemRepresentationView__updateDisplayedViewsConstraintsVisualStyleConstants__block_invoke;
  v6[3] = &__block_descriptor_40_e35_v32__0__NSLayoutConstraint_8Q16_B24l;
  v6[4] = v5;
  [(NSArray *)displayedViewsSpacingConstraints enumerateObjectsUsingBlock:v6];
}

- (void)_invalidateDisplayedViewsConstraints
{
  [MEMORY[0x1E4F5B268] deactivateConstraints:self->_displayedViewsSpacingConstraints];
  displayedViewsSpacingConstraints = self->_displayedViewsSpacingConstraints;
  self->_displayedViewsSpacingConstraints = 0;

  [MEMORY[0x1E4F5B268] deactivateConstraints:self->_displayedViewsPositioningConstraints];
  displayedViewsPositioningConstraints = self->_displayedViewsPositioningConstraints;
  self->_displayedViewsPositioningConstraints = 0;

  [(UIView *)self setNeedsUpdateConstraints];
}

- (void)_activateDisplayedViewsConstraints
{
  v2 = (void *)MEMORY[0x1E4F5B268];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80___UIInterfaceActionSystemRepresentationView__activateDisplayedViewsConstraints__block_invoke;
  v6[3] = &unk_1E52DA850;
  v6[4] = self;
  id v3 = [MEMORY[0x1E4F1CA48] array];
  __80___UIInterfaceActionSystemRepresentationView__activateDisplayedViewsConstraints__block_invoke((uint64_t)v6, v3);
  uint64_t v5 = _UIConstraintsBySortingConstraintsForInsertionPerformance(v3, v4);

  [v2 activateConstraints:v5];
}

- (BOOL)_displayedViewsConstraintsNeedsLoading
{
  return [(NSArray *)self->_displayedViewsPositioningConstraints count] == 0;
}

- (BOOL)_isDisplayingLeadingImageView
{
  return [(NSSet *)self->_displayedViews containsObject:self->_leadingImageView];
}

- (BOOL)_isDisplayingTrailingImageView
{
  return [(NSSet *)self->_displayedViews containsObject:self->_trailingImageView];
}

- (_UIInterfaceActionImagePropertyView)leadingImageView
{
  return self->_leadingImageView;
}

- (_UIInterfaceActionImagePropertyView)trailingImageView
{
  return self->_trailingImageView;
}

- (_UIInterfaceActionLabelsPropertyView)labelsView
{
  return self->_labelsView;
}

- (NSSet)viewsToDisplayWhenContentsVisible
{
  return self->_viewsToDisplayWhenContentsVisible;
}

- (NSSet)displayedViews
{
  return self->_displayedViews;
}

- (void)setDisplayedViews:(id)a3
{
}

- (NSArray)displayedViewsSpacingConstraints
{
  return self->_displayedViewsSpacingConstraints;
}

- (NSArray)displayedViewsPositioningConstraints
{
  return self->_displayedViewsPositioningConstraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedViewsPositioningConstraints, 0);
  objc_storeStrong((id *)&self->_displayedViewsSpacingConstraints, 0);
  objc_storeStrong((id *)&self->_displayedViews, 0);
  objc_storeStrong((id *)&self->_viewsToDisplayWhenContentsVisible, 0);
  objc_storeStrong((id *)&self->_labelsView, 0);
  objc_storeStrong((id *)&self->_trailingImageView, 0);
  objc_storeStrong((id *)&self->_leadingImageView, 0);
}

@end