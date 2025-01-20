@interface SBSwitcherCoordinatedLayoutStateTransitionContext
+ (id)coordinatedLayoutStateTransitionContextForMovingDisplayItems:(id)a3 fromSwitcherController:(id)a4 fromAppLayout:(id)a5 toAppLayout:(id)a6 toSwitcherController:(id)a7 withApplicationController:(id)a8;
+ (id)coordinatedLayoutStateTransitionContextForMovingDisplayItems:(id)a3 toSwitcherController:(id)a4 toAppLayout:(id)a5 withApplicationController:(id)a6;
- (BOOL)hasTransitioningDisplayItemsForAppLayout:(id)a3;
- (BOOL)hasTransitioningDisplayItemsForSwitcherController:(id)a3;
- (BOOL)isDisplayItemTransitioning:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGRect)fromFrameInFromSwitcherForDisplayItem:(id)a3;
- (CGRect)fromFrameInToSwitcherForDisplayItem:(id)a3;
- (CGRect)toFrameInFromSwitcherForDisplayItem:(id)a3;
- (CGRect)toFrameInToSwitcherForDisplayItem:(id)a3;
- (NSSet)displayItems;
- (NSString)description;
- (SBAppLayout)fromAppLayout;
- (SBAppLayout)toAppLayout;
- (SBSwitcherController)fromSwitcherController;
- (SBSwitcherController)toSwitcherController;
- (SBSwitcherCoordinatedLayoutStateTransitionContext)initWithDisplayItems:(id)a3 fromSwitcherController:(id)a4 toSwitcherController:(id)a5 fromAppLayout:(id)a6 toAppLayout:(id)a7;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)fromCenterConfiguration;
- (int64_t)fromFloatingConfiguration;
- (unint64_t)hash;
@end

@implementation SBSwitcherCoordinatedLayoutStateTransitionContext

+ (id)coordinatedLayoutStateTransitionContextForMovingDisplayItems:(id)a3 toSwitcherController:(id)a4 toAppLayout:(id)a5 withApplicationController:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v11 switcherCoordinator];
  v15 = [v14 coordinatedSwitcherControllers];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __173__SBSwitcherCoordinatedLayoutStateTransitionContext_coordinatedLayoutStateTransitionContextForMovingDisplayItems_toSwitcherController_toAppLayout_withApplicationController___block_invoke;
  v26[3] = &unk_1E6AFC3C8;
  id v16 = v10;
  id v27 = v16;
  v17 = objc_msgSend(v15, "bs_firstObjectPassingTest:", v26);

  v18 = [v17 _currentMainAppLayout];
  v19 = [v17 _currentFloatingAppLayout];
  char v20 = [v18 containsAllItemsFromSet:v16];
  v21 = v18;
  if ((v20 & 1) != 0 || (int v22 = [v19 containsAllItemsFromSet:v16], v21 = v19, v22)) {
    id v23 = v21;
  }
  else {
    id v23 = 0;
  }
  v24 = [a1 coordinatedLayoutStateTransitionContextForMovingDisplayItems:v16 fromSwitcherController:v17 fromAppLayout:v23 toAppLayout:v12 toSwitcherController:v11 withApplicationController:v13];

  return v24;
}

uint64_t __173__SBSwitcherCoordinatedLayoutStateTransitionContext_coordinatedLayoutStateTransitionContextForMovingDisplayItems_toSwitcherController_toAppLayout_withApplicationController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 _currentMainAppLayout];
  if ([v4 containsAllItemsFromSet:*(void *)(a1 + 32)])
  {
    uint64_t v5 = 1;
  }
  else
  {
    v6 = [v3 _currentFloatingAppLayout];
    uint64_t v5 = [v6 containsAllItemsFromSet:*(void *)(a1 + 32)];
  }
  return v5;
}

+ (id)coordinatedLayoutStateTransitionContextForMovingDisplayItems:(id)a3 fromSwitcherController:(id)a4 fromAppLayout:(id)a5 toAppLayout:(id)a6 toSwitcherController:(id)a7 withApplicationController:(id)a8
{
  id v14 = a6;
  id v15 = a8;
  id v16 = a7;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  uint64_t v20 = [v16 windowManagementStyle];
  if (v20)
  {
    if (v20 == 1)
    {
      id v23 = [v14 appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController:v15 multitaskingSupported:1];
      if ([v23 count])
      {
        id v24 = [v23 firstObject];
      }
      else
      {
        id v24 = v14;
      }
      uint64_t v22 = (uint64_t)v24;
    }
    else
    {
      if (v20 != 2) {
        goto LABEL_11;
      }
      v21 = [v14 appLayoutByAdjustingFloatingItemsForChamois];

      uint64_t v22 = [v21 appLayoutByAdjustingCenterWindowItemsForChamois];
      id v14 = v21;
    }
  }
  else
  {
    uint64_t v22 = [v14 leafAppLayoutForRole:1];
  }

  id v14 = (id)v22;
LABEL_11:
  v25 = [v16 layoutState];
  v26 = objc_msgSend(v14, "appLayoutByModifyingPreferredDisplayOrdinal:", objc_msgSend(v25, "displayOrdinal"));

  id v27 = (void *)[objc_alloc((Class)a1) initWithDisplayItems:v19 fromSwitcherController:v18 toSwitcherController:v16 fromAppLayout:v17 toAppLayout:v26];
  return v27;
}

- (SBSwitcherCoordinatedLayoutStateTransitionContext)initWithDisplayItems:(id)a3 fromSwitcherController:(id)a4 toSwitcherController:(id)a5 fromAppLayout:(id)a6 toAppLayout:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id obj = a7;
  id v16 = a7;
  if ([v12 count])
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"SBSwitcherCoordinatedLayoutStateTransitionContext.m" lineNumber:82 description:@"displayItems must not be empty"];

    if (v13)
    {
LABEL_3:
      if (v14) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2 object:self file:@"SBSwitcherCoordinatedLayoutStateTransitionContext.m" lineNumber:83 description:@"fromSwitcherController must be non-nil"];

  if (v14)
  {
LABEL_4:
    if (v15) {
      goto LABEL_5;
    }
LABEL_12:
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"SBSwitcherCoordinatedLayoutStateTransitionContext.m" lineNumber:85 description:@"fromAppLayout must be non-nil"];

    if (v16) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_11:
  id v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2 object:self file:@"SBSwitcherCoordinatedLayoutStateTransitionContext.m" lineNumber:84 description:@"toSwitcherController must be non-nil"];

  if (!v15) {
    goto LABEL_12;
  }
LABEL_5:
  if (v16) {
    goto LABEL_6;
  }
LABEL_13:
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2 object:self file:@"SBSwitcherCoordinatedLayoutStateTransitionContext.m" lineNumber:86 description:@"toAppLayout must be non-nil"];

LABEL_6:
  v29.receiver = self;
  v29.super_class = (Class)SBSwitcherCoordinatedLayoutStateTransitionContext;
  id v17 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)&v29 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_displayItems, a3);
    objc_storeStrong((id *)&v18->_fromSwitcherController, a4);
    objc_storeStrong((id *)&v18->_toSwitcherController, a5);
    objc_storeStrong((id *)&v18->_fromAppLayout, a6);
    objc_storeStrong((id *)&v18->_toAppLayout, obj);
    id v19 = [v13 layoutState];
    v18->_fromFloatingConfiguration = [v19 floatingConfiguration];
    v18->_fromCenterConfiguration = [v19 centerConfiguration];
  }
  return v18;
}

- (BOOL)hasTransitioningDisplayItemsForAppLayout:(id)a3
{
  return [a3 containsAnyItemFromSet:self->_displayItems];
}

- (BOOL)hasTransitioningDisplayItemsForSwitcherController:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:self->_fromSwitcherController]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEqual:self->_toSwitcherController];
  }

  return v5;
}

- (BOOL)isDisplayItemTransitioning:(id)a3
{
  return [(NSSet *)self->_displayItems containsObject:a3];
}

- (CGRect)fromFrameInFromSwitcherForDisplayItem:(id)a3
{
  fromAppLayout = self->_fromAppLayout;
  id v5 = a3;
  uint64_t v6 = [(SBAppLayout *)fromAppLayout environment];
  uint64_t v7 = [(SBAppLayout *)self->_fromAppLayout layoutRoleForItem:v5];

  int64_t v8 = [(SBSwitcherController *)self->_fromSwitcherController interfaceOrientation];
  if (v6 == 3) {
    goto LABEL_9;
  }
  if (v6 == 2)
  {
LABEL_7:
    [(SBSwitcherController *)self->_fromSwitcherController frameForFloatingAppLayoutInInterfaceOrientation:v8 floatingConfiguration:self->_fromFloatingConfiguration];
    goto LABEL_11;
  }
  if (v6 != 1)
  {
LABEL_10:
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    goto LABEL_11;
  }
  if (!SBLayoutRoleIsValidForSplitView(v7))
  {
    if (v7 == 3) {
      goto LABEL_7;
    }
    if (v7 == 4)
    {
LABEL_9:
      [(SBSwitcherController *)self->_fromSwitcherController frameForCenterItemWithConfiguration:self->_fromCenterConfiguration interfaceOrientation:v8];
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  [(SBSwitcherController *)self->_fromSwitcherController frameForItemWithRole:v7 inMainAppLayout:self->_fromAppLayout interfaceOrientation:v8];
LABEL_11:
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)fromFrameInToSwitcherForDisplayItem:(id)a3
{
  fromSwitcherController = self->_fromSwitcherController;
  id v5 = a3;
  uint64_t v6 = [(SBSwitcherController *)fromSwitcherController windowScene];
  uint64_t v7 = [(SBSwitcherController *)self->_toSwitcherController windowScene];
  [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self fromFrameInFromSwitcherForDisplayItem:v5];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  objc_msgSend(v6, "convertRect:toNeighboringDisplayWindowScene:", v7, v9, v11, v13, v15);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)toFrameInFromSwitcherForDisplayItem:(id)a3
{
  fromSwitcherController = self->_fromSwitcherController;
  id v5 = a3;
  uint64_t v6 = [(SBSwitcherController *)fromSwitcherController windowScene];
  uint64_t v7 = [(SBSwitcherController *)self->_toSwitcherController windowScene];
  [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self toFrameInToSwitcherForDisplayItem:v5];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  objc_msgSend(v7, "convertRect:toNeighboringDisplayWindowScene:", v6, v9, v11, v13, v15);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)toFrameInToSwitcherForDisplayItem:(id)a3
{
  toSwitcherController = self->_toSwitcherController;
  int64_t v5 = [(SBAppLayout *)self->_toAppLayout layoutRoleForItem:a3];
  toAppLayout = self->_toAppLayout;
  int64_t v7 = [(SBSwitcherController *)self->_toSwitcherController interfaceOrientation];
  [(SBSwitcherController *)toSwitcherController frameForItemWithRole:v5 inMainAppLayout:toAppLayout interfaceOrientation:v7];
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (unint64_t)hash
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F4F758] builder];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = self->_displayItems;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (id)objc_msgSend(v3, "appendObject:", *(void *)(*((void *)&v16 + 1) + 8 * v8++), (void)v16);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  id v10 = (id)[v3 appendObject:self->_fromSwitcherController];
  id v11 = (id)[v3 appendObject:self->_toSwitcherController];
  id v12 = (id)[v3 appendObject:self->_fromAppLayout];
  id v13 = (id)[v3 appendObject:self->_toAppLayout];
  unint64_t v14 = [v3 hash];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 hash];
    BOOL v6 = v5 == [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self hash];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)[(SBSwitcherCoordinatedLayoutStateTransitionContext *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_displayItems withName:@"displayItems"];
  id v6 = (id)[v4 appendObject:self->_fromSwitcherController withName:@"fromSwitcherController"];
  id v7 = (id)[v4 appendObject:self->_toSwitcherController withName:@"toSwitcherController"];
  id v8 = (id)[v4 appendObject:self->_fromAppLayout withName:@"fromAppLayout"];
  id v9 = (id)[v4 appendObject:self->_toAppLayout withName:@"toAppLayout"];
  return v4;
}

- (NSSet)displayItems
{
  return self->_displayItems;
}

- (SBSwitcherController)fromSwitcherController
{
  return self->_fromSwitcherController;
}

- (SBSwitcherController)toSwitcherController
{
  return self->_toSwitcherController;
}

- (SBAppLayout)fromAppLayout
{
  return self->_fromAppLayout;
}

- (SBAppLayout)toAppLayout
{
  return self->_toAppLayout;
}

- (int64_t)fromFloatingConfiguration
{
  return self->_fromFloatingConfiguration;
}

- (int64_t)fromCenterConfiguration
{
  return self->_fromCenterConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_toSwitcherController, 0);
  objc_storeStrong((id *)&self->_fromSwitcherController, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);
}

@end