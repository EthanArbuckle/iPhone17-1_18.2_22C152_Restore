@interface SBShelfSwitcherModifier
+ (unint64_t)contentOptionsForTransitionEvent:(id)a3 context:(id)a4;
- (CGRect)frameForShelf:(id)a3;
- (SBShelfSwitcherModifier)initWithShelf:(id)a3 contentOptions:(unint64_t)a4 activeFullScreenAppLayout:(id)a5 activeFloatingAppLayout:(id)a6 presentationTargetFrame:(CGRect)a7 presentedFromAppLayout:(id)a8;
- (SBSwitcherShelf)shelf;
- (SBSwitcherShelfPresentationAttributes)presentationAttributesForShelf:(SEL)a3;
- (id)_responseForDismissingIfNeededGestureInitiated:(BOOL)a3;
- (id)containerLeafAppLayoutForShelf:(id)a3;
- (id)focusedAppLayoutForShelf:(id)a3;
- (id)handleGestureEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)homeAffordanceLayoutElementToPortalIntoShelf:(id)a3;
- (id)ignoredDisplayItemsForShelf:(id)a3;
- (id)topMostLayoutElements;
- (id)visibleShelves;
@end

@implementation SBShelfSwitcherModifier

+ (unint64_t)contentOptionsForTransitionEvent:(id)a3 context:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v49 = [v5 fromEnvironmentMode] == 3;
  uint64_t v50 = [v5 toEnvironmentMode];
  v52 = [v5 fromAppLayout];
  v51 = [v5 toAppLayout];
  int v48 = [v5 isQuickActionTransition];
  uint64_t v7 = [v5 fromWindowPickerRole];
  if (v7 != [v5 toWindowPickerRole] && objc_msgSend(v5, "toWindowPickerRole"))
  {
    if ([v5 toWindowPickerRole] == 3)
    {
      v22 = [v5 toFloatingAppLayout];
      v23 = v22;
      uint64_t v24 = 1;
    }
    else
    {
      v23 = [v5 toAppLayout];
      uint64_t v24 = [v5 toWindowPickerRole];
      v22 = v23;
    }
    v25 = [v22 itemForLayoutRole:v24];
    v13 = [v25 bundleIdentifier];

    if ([v5 isExitingSplitViewPeekEvent])
    {

      v52 = 0;
      BOOL v49 = 0;
    }
    if (!v13) {
      goto LABEL_62;
    }
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v14 = [v6 appLayouts];
    uint64_t v26 = [v14 countByEnumeratingWithState:&v60 objects:v69 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      id v46 = v6;
      id v47 = v5;
      unint64_t v28 = 0;
      uint64_t v29 = *(void *)v61;
      uint64_t v53 = *(void *)v61;
      v54 = v14;
LABEL_28:
      uint64_t v30 = 0;
      uint64_t v55 = v27;
      while (1)
      {
        if (*(void *)v61 != v29) {
          objc_enumerationMutation(v14);
        }
        v31 = *(void **)(*((void *)&v60 + 1) + 8 * v30);
        if ([v31 environment] != 3
          && [v31 containsItemWithBundleIdentifier:v13])
        {
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          v32 = [v31 allItems];
          uint64_t v33 = [v32 countByEnumeratingWithState:&v56 objects:v68 count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = 0;
            uint64_t v36 = *(void *)v57;
            do
            {
              for (uint64_t i = 0; i != v34; ++i)
              {
                if (*(void *)v57 != v36) {
                  objc_enumerationMutation(v32);
                }
                v38 = [*(id *)(*((void *)&v56 + 1) + 8 * i) bundleIdentifier];
                unsigned int v39 = BSEqualStrings();

                v35 += v39;
              }
              uint64_t v34 = [v32 countByEnumeratingWithState:&v56 objects:v68 count:16];
            }
            while (v34);
          }
          else
          {
            uint64_t v35 = 0;
          }

          v28 += v35;
          uint64_t v29 = v53;
          v14 = v54;
          uint64_t v27 = v55;
          if (v28 > 1) {
            break;
          }
        }
        if (++v30 == v27)
        {
          uint64_t v27 = [v14 countByEnumeratingWithState:&v60 objects:v69 count:16];
          if (v27) {
            goto LABEL_28;
          }
          break;
        }
      }
      id v6 = v46;
      id v5 = v47;
    }
LABEL_46:

    uint64_t v40 = 5;
    if (v50 == 3) {
      uint64_t v41 = 7;
    }
    else {
      uint64_t v41 = 5;
    }
    BOOL v42 = v50 == 3 && v49;
    if (!v49) {
      uint64_t v40 = v41;
    }
    int v43 = !v42;
    int v44 = v48;
    if (v52 == v51)
    {
      int v44 = 1;
      int v43 = 1;
    }
    if ((v42 & v44) != 0) {
      uint64_t v40 = 7;
    }
    if (v43) {
      unint64_t v11 = v40;
    }
    else {
      unint64_t v11 = 7;
    }

    goto LABEL_63;
  }
  v8 = [v5 fromAppExposeBundleID];
  v9 = [v5 toAppExposeBundleID];
  if (BSEqualStrings())
  {

LABEL_62:
    unint64_t v11 = 0;
    goto LABEL_63;
  }
  v10 = [v5 toAppExposeBundleID];

  unint64_t v11 = 0;
  if (v10 && v50 == 3)
  {
    uint64_t v12 = [v5 toAppExposeBundleID];
    if (!v12) {
      goto LABEL_62;
    }
    v13 = (void *)v12;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v14 = [v6 appLayouts];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v64 objects:v70 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      id v17 = v6;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v65;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v65 != v19) {
            objc_enumerationMutation(v14);
          }
          v21 = *(void **)(*((void *)&v64 + 1) + 8 * j);
          if ([v21 environment] != 3
            && [v21 containsItemWithBundleIdentifier:v13])
          {
            if (v18 == 1) {
              goto LABEL_19;
            }
            uint64_t v18 = 1;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v64 objects:v70 count:16];
      }
      while (v16);
LABEL_19:
      id v6 = v17;
    }
    goto LABEL_46;
  }
LABEL_63:

  return v11;
}

- (SBShelfSwitcherModifier)initWithShelf:(id)a3 contentOptions:(unint64_t)a4 activeFullScreenAppLayout:(id)a5 activeFloatingAppLayout:(id)a6 presentationTargetFrame:(CGRect)a7 presentedFromAppLayout:(id)a8
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  v25.receiver = self;
  v25.super_class = (Class)SBShelfSwitcherModifier;
  v22 = [(SBSwitcherModifier *)&v25 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_shelf, a3);
    v23->_layoutRole = [v18 layoutRole];
    v23->_contentOptions = a4;
    objc_storeStrong((id *)&v23->_activeFullScreenAppLayout, a5);
    objc_storeStrong((id *)&v23->_activeFloatingAppLayout, a6);
    v23->_presentationTargetFrame.origin.CGFloat x = x;
    v23->_presentationTargetFrame.origin.CGFloat y = y;
    v23->_presentationTargetFrame.size.CGFloat width = width;
    v23->_presentationTargetFrame.size.CGFloat height = height;
    objc_storeStrong((id *)&v23->_presentedFromAppLayout, a8);
  }

  return v23;
}

- (id)visibleShelves
{
  v3 = [(SBSwitcherShelf *)self->_shelf bundleIdentifier];
  if (-[SBShelfSwitcherModifier isShieldingApplicationWithBundleIdentifier:](self, "isShieldingApplicationWithBundleIdentifier:", v3))[MEMORY[0x1E4F1CAD0] set]; {
  else
  }
  v4 = [MEMORY[0x1E4F1CAD0] setWithObject:self->_shelf];

  return v4;
}

- (SBSwitcherShelfPresentationAttributes)presentationAttributesForShelf:(SEL)a3
{
  id v6 = a4;
  if ([(SBSwitcherShelf *)self->_shelf isEqual:v6])
  {
    BOOL isPendingDismissal = self->_isPendingDismissal;
    BOOL IsNull = CGRectIsNull(self->_presentationTargetFrame);
    if (isPendingDismissal)
    {
      if (!IsNull
        && !self->_isPendingDismissalFromGesture
        && self->_activeFullScreenAppLayout
        && ([(SBShelfSwitcherModifier *)self isFloatingDockFullyPresented] & 1) == 0)
      {
        uint64_t v9 = 1;
LABEL_13:
        SBSwitcherShelfPresentationAttributesMake(!isPendingDismissal, v9, self->_contentOptions, (uint64_t)retstr, self->_presentationTargetFrame.origin.x, self->_presentationTargetFrame.origin.y, self->_presentationTargetFrame.size.width, self->_presentationTargetFrame.size.height);
        goto LABEL_14;
      }
    }
    else if (!IsNull)
    {
      presentedFromAppLayout = self->_presentedFromAppLayout;
      if (presentedFromAppLayout)
      {
        unint64_t v11 = [(SBSwitcherShelf *)self->_shelf bundleIdentifier];
        BOOL v12 = [(SBAppLayout *)presentedFromAppLayout containsItemWithBundleIdentifier:v11];

        uint64_t v9 = v12;
        goto LABEL_13;
      }
    }
    uint64_t v9 = 0;
    goto LABEL_13;
  }
  v14.receiver = self;
  v14.super_class = (Class)SBShelfSwitcherModifier;
  [(SBSwitcherShelfPresentationAttributes *)&v14 presentationAttributesForShelf:v6];
LABEL_14:

  return result;
}

- (id)containerLeafAppLayoutForShelf:(id)a3
{
  id v4 = a3;
  if ([(SBSwitcherShelf *)self->_shelf isEqual:v4])
  {
    int64_t layoutRole = self->_layoutRole;
    if (!layoutRole)
    {
      id v6 = 0;
      goto LABEL_9;
    }
    if (layoutRole == 3)
    {
      uint64_t v7 = self->_activeFloatingAppLayout;
    }
    else
    {
      uint64_t v7 = [(SBAppLayout *)self->_activeFullScreenAppLayout leafAppLayoutForRole:"leafAppLayoutForRole:"];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBShelfSwitcherModifier;
    uint64_t v7 = [(SBShelfSwitcherModifier *)&v9 containerLeafAppLayoutForShelf:v4];
  }
  id v6 = v7;
LABEL_9:

  return v6;
}

- (CGRect)frameForShelf:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:self->_shelf])
  {
    int64_t layoutRole = self->_layoutRole;
    if (layoutRole)
    {
      if (layoutRole == 3)
      {
        [(SBShelfSwitcherModifier *)self floatingApplicationFrameInInterfaceOrientation:[(SBShelfSwitcherModifier *)self switcherInterfaceOrientation] floatingConfiguration:2];
        double v7 = v17;
        double v9 = v18;
        double v10 = 0.0;
      }
      else
      {
        activeFullScreenAppLayout = self->_activeFullScreenAppLayout;
        [(SBShelfSwitcherModifier *)self containerViewBounds];
        -[SBShelfSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", layoutRole, activeFullScreenAppLayout);
        double v10 = v20;
        double v7 = v21;
        double v9 = v22;
      }
    }
    else
    {
      [(SBShelfSwitcherModifier *)self containerViewBounds];
      double v7 = v6;
      double v9 = v8;
      double v10 = *MEMORY[0x1E4F1DAD8];
    }
    v23 = [(SBShelfSwitcherModifier *)self medusaSettings];
    [v23 switcherShelfCardScale];
    double v25 = v24;
    [v23 switcherShelfBottomSpacing];
    double v16 = v26 + v25 * v9;
    double v13 = v9 - v16;
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)SBShelfSwitcherModifier;
    [(SBShelfSwitcherModifier *)&v31 frameForShelf:v4];
    double v10 = v11;
    double v13 = v12;
    double v7 = v14;
    double v16 = v15;
  }

  double v27 = v10;
  double v28 = v13;
  double v29 = v7;
  double v30 = v16;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (id)focusedAppLayoutForShelf:(id)a3
{
  id v4 = a3;
  if (![v4 isEqual:self->_shelf])
  {
    v10.receiver = self;
    v10.super_class = (Class)SBShelfSwitcherModifier;
    id v7 = [(SBShelfSwitcherModifier *)&v10 focusedAppLayoutForShelf:v4];
    goto LABEL_9;
  }
  int64_t layoutRole = self->_layoutRole;
  if (!layoutRole)
  {
    uint64_t v6 = 104;
LABEL_7:
    id v7 = *(id *)((char *)&self->super.super.super.isa + v6);
    goto LABEL_9;
  }
  if (layoutRole == 3)
  {
    uint64_t v6 = 112;
    goto LABEL_7;
  }
  id v7 = [(SBAppLayout *)self->_activeFullScreenAppLayout leafAppLayoutForRole:"leafAppLayoutForRole:"];
LABEL_9:
  double v8 = v7;

  return v8;
}

- (id)ignoredDisplayItemsForShelf:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:self->_shelf])
  {
    id v5 = [(SBAppLayout *)self->_activeFullScreenAppLayout allItems];
    uint64_t v6 = [(SBAppLayout *)self->_activeFloatingAppLayout allItems];
    id v7 = [v5 arrayByAddingObjectsFromArray:v6];

    double v8 = (void *)[v7 mutableCopy];
    double v9 = [(SBShelfSwitcherModifier *)self focusedAppLayoutForShelf:v4];
    objc_super v10 = [v9 allItems];
    [v8 removeObjectsInArray:v10];

    double v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBShelfSwitcherModifier;
    double v11 = [(SBShelfSwitcherModifier *)&v13 ignoredDisplayItemsForShelf:v4];
  }

  return v11;
}

- (id)topMostLayoutElements
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)SBShelfSwitcherModifier;
  v3 = [(SBShelfSwitcherModifier *)&v8 topMostLayoutElements];
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)[v3 mutableCopy];
    uint64_t v6 = [v5 indexOfObject:self->_shelf];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
      [v5 removeObjectAtIndex:v6];
    }
    [v5 insertObject:self->_shelf atIndex:0];
  }
  else
  {
    v9[0] = self->_shelf;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }

  return v5;
}

- (id)homeAffordanceLayoutElementToPortalIntoShelf:(id)a3
{
  id v4 = a3;
  if ([(SBSwitcherShelf *)self->_shelf isEqual:v4]
    && (![(SBSwitcherShelf *)self->_shelf displayMode]
     || SBLayoutRoleIsValidForSplitView(self->_layoutRole)
     || self->_layoutRole == 3))
  {
    v9.receiver = self;
    v9.super_class = (Class)SBShelfSwitcherModifier;
    id v5 = [(SBShelfSwitcherModifier *)&v9 visibleHomeAffordanceLayoutElements];
    uint64_t v6 = [v5 anyObject];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBShelfSwitcherModifier;
    uint64_t v6 = [(SBShelfSwitcherModifier *)&v8 homeAffordanceLayoutElementToPortalIntoShelf:v4];
  }

  return v6;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBShelfSwitcherModifier;
  id v5 = [(SBSwitcherModifier *)&v16 handleTransitionEvent:v4];
  uint64_t v6 = [v4 toAppLayout];
  activeFullScreenAppLayout = self->_activeFullScreenAppLayout;
  self->_activeFullScreenAppLayout = v6;

  objc_super v8 = [v4 toFloatingAppLayout];
  activeFloatingAppLayout = self->_activeFloatingAppLayout;
  self->_activeFloatingAppLayout = v8;

  uint64_t v10 = [v4 phase];
  if ([(SBSwitcherShelf *)self->_shelf displayMode]
    || ([v4 toAppExposeBundleID],
        double v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    if ([(SBSwitcherShelf *)self->_shelf displayMode] != 1) {
      goto LABEL_13;
    }
    if ([v4 toWindowPickerRole] == self->_layoutRole || v10 == 0) {
      goto LABEL_13;
    }
  }
  else if (!v10)
  {
    goto LABEL_13;
  }
  if (v10 == 1)
  {
    objc_super v13 = [(SBShelfSwitcherModifier *)self _responseForDismissingIfNeededGestureInitiated:0];
    uint64_t v14 = SBAppendSwitcherModifierResponse(v13, v5);

    id v5 = (void *)v14;
  }
  else
  {
    [(SBChainableModifier *)self setState:1];
  }
LABEL_13:

  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBShelfSwitcherModifier;
  id v4 = [(SBSwitcherModifier *)&v8 handleGestureEvent:a3];
  id v5 = [(SBShelfSwitcherModifier *)self _responseForDismissingIfNeededGestureInitiated:1];
  uint64_t v6 = SBAppendSwitcherModifierResponse(v5, v4);

  return v6;
}

- (id)_responseForDismissingIfNeededGestureInitiated:(BOOL)a3
{
  if (self->_isPendingDismissal)
  {
    v3 = 0;
  }
  else
  {
    self->_BOOL isPendingDismissal = 1;
    self->_isPendingDismissalFromGesture = a3;
    v3 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:8 updateMode:3];
  }
  return v3;
}

- (SBSwitcherShelf)shelf
{
  return self->_shelf;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shelf, 0);
  objc_storeStrong((id *)&self->_presentedFromAppLayout, 0);
  objc_storeStrong((id *)&self->_activeFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_activeFullScreenAppLayout, 0);
}

@end