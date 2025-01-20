@interface UIInterfaceActionSystemRepresentationView
@end

@implementation UIInterfaceActionSystemRepresentationView

uint64_t __70___UIInterfaceActionSystemRepresentationView__removeAllDisplayedViews__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

uint64_t __99___UIInterfaceActionSystemRepresentationView__reloadHierarchyWithViewsToDisplayWhenContentsVisible__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

void __99___UIInterfaceActionSystemRepresentationView__reloadHierarchyWithViewsToDisplayWhenContentsVisible__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)(a1 + 32) insertSubview:v3 atIndex:0];
}

void __82___UIInterfaceActionSystemRepresentationView__loadConstraintsForLabelsOnlyDisplay__block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 _constraintForVerticallyCenteringLabelsView];
  [v4 addObject:v5];

  v6 = *(void **)(a1 + 32);
  v10[0] = v6[64];
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v8 = [v6 _constraintsToEnsureContainerHeightTallEnoughForViews:v7];
  [v4 addObjectsFromArray:v8];

  v9 = [*(id *)(a1 + 32) _constraintsForInsettingLabelsViewLeadingAndTrailing];
  [v4 addObjectsFromArray:v9];
}

void __87___UIInterfaceActionSystemRepresentationView__loadConstraintsForLabelsAndImagesDisplay__block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [*(id *)(a1 + 32) _constraintForVerticallyCenteringLabelsView];
  [v13 addObject:v3];

  if ([*(id *)(a1 + 32) _isDisplayingLeadingImageView])
  {
    id v4 = [*(id *)(a1 + 32) _constraintForBaselineAligningOrVerticallyCenteringImageViewToLabelsView:*(void *)(*(void *)(a1 + 32) + 496)];
    [v13 addObject:v4];
  }
  if ([*(id *)(a1 + 32) _isDisplayingTrailingImageView])
  {
    v5 = [*(id *)(a1 + 32) _constraintForBaselineAligningOrVerticallyCenteringImageViewToLabelsView:*(void *)(*(void *)(a1 + 32) + 504)];
    [v13 addObject:v5];
  }
  v6 = *(id **)(a1 + 32);
  v7 = [v6[66] allObjects];
  v8 = [v6 _constraintsToEnsureContainerHeightTallEnoughForViews:v7];
  [v13 addObjectsFromArray:v8];

  v9 = [*(id *)(a1 + 32) _constraintsForInsettingImageViewsLeadingAndTrailingEdge];
  [v13 addObjectsFromArray:v9];

  if (*(unsigned char *)(a1 + 40))
  {
    v10 = [*(id *)(a1 + 32) _constraintsForHorizontallyCenteringLabelsView];
    [v13 addObjectsFromArray:v10];

    BOOL v11 = *(unsigned char *)(a1 + 40) == 0;
  }
  else
  {
    BOOL v11 = 1;
  }
  v12 = [*(id *)(a1 + 32) _constraintsForInsettingLabelsViewLeadingAndTrailingHorizontalEdgeReferenceExact:v11];
  [v13 addObjectsFromArray:v12];
}

void __87___UIInterfaceActionSystemRepresentationView__loadConstraintsForLabelsAndImagesDisplay__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = *(unsigned char *)(a1 + 40) == 0;
  id v4 = a2;
  id v5 = [v2 _constraintsForInsettingLabelsViewLeadingAndTrailingToImageViewsExact:v3];
  [v4 addObjectsFromArray:v5];
}

void __100___UIInterfaceActionSystemRepresentationView__constraintsToEnsureContainerHeightTallEnoughForViews___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        v9 = [*(id *)(a1 + 40) topAnchor];
        v10 = [v8 topAnchor];
        BOOL v11 = [v9 constraintLessThanOrEqualToAnchor:v10];

        v12 = [*(id *)(a1 + 40) bottomAnchor];
        id v13 = [v8 bottomAnchor];
        v14 = [v12 constraintGreaterThanOrEqualToAnchor:v13];

        v21[0] = v11;
        v21[1] = v14;
        v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
        [v3 addObjectsFromArray:v15];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }
}

void __98___UIInterfaceActionSystemRepresentationView__constraintsForInsettingLabelsViewLeadingAndTrailing__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  char v5 = [v3 _isDisplayingLeadingImageView];
  uint64_t v6 = *(id **)(a1 + 32);
  if (v5)
  {
    id v16 = [v6[62] trailingAnchor];
  }
  else
  {
    uint64_t v7 = [v6 _horizontalEdgeReference];
    id v16 = [v7 leadingAnchor];
  }
  char v8 = [*(id *)(a1 + 32) _isDisplayingTrailingImageView];
  v9 = *(id **)(a1 + 32);
  if (v8)
  {
    v10 = [v9[63] leadingAnchor];
  }
  else
  {
    BOOL v11 = [v9 _horizontalEdgeReference];
    v10 = [v11 trailingAnchor];
  }
  v12 = [*(id *)(*(void *)(a1 + 32) + 512) leadingAnchor];
  id v13 = constraintWithAnchorRelatedToAnchor(v12, 0, v16);
  [v4 addObject:v13];

  v14 = [*(id *)(*(void *)(a1 + 32) + 512) trailingAnchor];
  v15 = constraintWithAnchorRelatedToAnchor(v10, 0, v14);
  [v4 addObject:v15];
}

void __116___UIInterfaceActionSystemRepresentationView__constraintsForInsettingLabelsViewLeadingAndTrailingToImageViewsExact___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  BOOL v3 = *(unsigned char *)(a1 + 40) == 0;
  if ([*(id *)(a1 + 32) _isDisplayingLeadingImageView])
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 512) leadingAnchor];
    char v5 = [*(id *)(*(void *)(a1 + 32) + 496) trailingAnchor];
    uint64_t v6 = constraintWithAnchorRelatedToAnchor(v4, v3, v5);
    [v10 addObject:v6];
  }
  if ([*(id *)(a1 + 32) _isDisplayingTrailingImageView])
  {
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 504) leadingAnchor];
    char v8 = [*(id *)(*(void *)(a1 + 32) + 512) trailingAnchor];
    v9 = constraintWithAnchorRelatedToAnchor(v7, v3, v8);
    [v10 addObject:v9];
  }
}

void __127___UIInterfaceActionSystemRepresentationView__constraintsForInsettingLabelsViewLeadingAndTrailingHorizontalEdgeReferenceExact___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  BOOL v3 = *(unsigned char *)(a1 + 40) == 0;
  if (([*(id *)(a1 + 32) _isDisplayingLeadingImageView] & 1) == 0)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 512) leadingAnchor];
    char v5 = [*(id *)(a1 + 32) _horizontalEdgeReference];
    uint64_t v6 = [v5 leadingAnchor];
    uint64_t v7 = constraintWithAnchorRelatedToAnchor(v4, v3, v6);
    [v12 addObject:v7];
  }
  if (([*(id *)(a1 + 32) _isDisplayingTrailingImageView] & 1) == 0)
  {
    char v8 = [*(id *)(a1 + 32) _horizontalEdgeReference];
    v9 = [v8 trailingAnchor];
    id v10 = [*(id *)(*(void *)(a1 + 32) + 512) trailingAnchor];
    BOOL v11 = constraintWithAnchorRelatedToAnchor(v9, v3, v10);
    [v12 addObject:v11];
  }
}

void __102___UIInterfaceActionSystemRepresentationView__constraintsForInsettingImageViewsLeadingAndTrailingEdge__block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  if ([*(id *)(a1 + 32) _isDisplayingLeadingImageView])
  {
    BOOL v3 = [*(id *)(a1 + 32) action];
    id v4 = [*(id *)(*(void *)(a1 + 32) + 496) imageProperty];
    [v3 _layoutSizeForImageProperty:v4];
    double v6 = v5;

    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 496) centerXAnchor];
    char v8 = [*(id *)(a1 + 32) _horizontalEdgeReference];
    v9 = [v8 leadingAnchor];
    id v10 = [v7 constraintEqualToAnchor:v9 constant:v6 * 0.5];
    [v19 addObject:v10];
  }
  if ([*(id *)(a1 + 32) _isDisplayingTrailingImageView])
  {
    BOOL v11 = [*(id *)(a1 + 32) action];
    id v12 = [*(id *)(*(void *)(a1 + 32) + 504) imageProperty];
    [v11 _layoutSizeForImageProperty:v12];
    double v14 = v13;

    v15 = [*(id *)(*(void *)(a1 + 32) + 504) centerXAnchor];
    id v16 = [*(id *)(a1 + 32) _horizontalEdgeReference];
    long long v17 = [v16 trailingAnchor];
    long long v18 = [v15 constraintEqualToAnchor:v17 constant:v14 * -0.5];
    [v19 addObject:v18];
  }
}

uint64_t __98___UIInterfaceActionSystemRepresentationView__updateDisplayedViewsConstraintsVisualStyleConstants__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setConstant:*(double *)(a1 + 32)];
}

void __80___UIInterfaceActionSystemRepresentationView__activateDisplayedViewsConstraints__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 536) count]) {
    [v3 addObjectsFromArray:*(void *)(*(void *)(a1 + 32) + 536)];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 544) count]) {
    [v3 addObjectsFromArray:*(void *)(*(void *)(a1 + 32) + 544)];
  }
}

@end