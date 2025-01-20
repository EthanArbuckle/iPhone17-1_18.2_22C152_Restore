@interface SBLayoutStateManager
+ (Class)_layoutStateClass;
- (id)_layoutStateForApplicationTransitionContext:(id)a3;
- (id)layoutStateForApplicationTransitionContext:(id)a3;
@end

@implementation SBLayoutStateManager

void __67__SBLayoutStateManager_layoutStateForApplicationTransitionContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [v3 entityForLayoutRole:a2];
  [v3 _setRequestedWorkspaceEntity:v4 forLayoutRole:a2];
}

void __67__SBLayoutStateManager_layoutStateForApplicationTransitionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  id v10 = [*(id *)(a1 + 32) previousEntityForLayoutRole:a2];
  id v4 = [*(id *)(a1 + 40) elementWithRole:a2];
  if (v4
    && ([v10 uniqueIdentifier],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v4 uniqueIdentifier],
        v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v5 isEqualToString:v6],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    uint64_t v9 = [v4 workspaceEntity];

    uint64_t v8 = v9;
    if (v9) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v8 = (uint64_t)v10;
    if (v10) {
      goto LABEL_9;
    }
  }
  if (a2 == 1)
  {
    uint64_t v8 = +[SBWorkspaceEntity entity];
  }
  else
  {
    uint64_t v8 = 0;
  }
LABEL_9:
  id v11 = (id)v8;
  [*(id *)(a1 + 32) setPreviousEntity:v8 forLayoutRole:a2];
}

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 previousLayoutState];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__SBLayoutStateManager_layoutStateForApplicationTransitionContext___block_invoke;
  v14[3] = &unk_1E6B002B8;
  id v6 = v4;
  id v15 = v6;
  id v7 = v5;
  id v16 = v7;
  SBLayoutRoleEnumerateValidRoles(v14);
  if (([v6 _alreadyPopulatedRequestedWorkspaceEntities] & 1) == 0)
  {
    uint64_t v8 = [v6 activatingEntity];
    [v6 _setRequestedActivatingWorkspaceEntity:v8];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__SBLayoutStateManager_layoutStateForApplicationTransitionContext___block_invoke_2;
    v12[3] = &unk_1E6AF8788;
    id v9 = v6;
    id v13 = v9;
    SBLayoutRoleEnumerateValidRoles(v12);
    [v9 _setAlreadyPopulatedRequestedWorkspaceEntities:1];
  }
  id v10 = [(SBLayoutStateManager *)self _layoutStateForApplicationTransitionContext:v6];

  return v10;
}

+ (Class)_layoutStateClass
{
  return (Class)objc_opt_class();
}

- (id)_layoutStateForApplicationTransitionContext:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 previousLayoutState];
  if ([v5 isBackground])
  {
    id v7 = v6;
    goto LABEL_37;
  }
  uint64_t v8 = [v5 activatingEntity];
  id v9 = [v5 entityForLayoutRole:1];
  id v10 = [v5 previousEntityForLayoutRole:1];
  uint64_t v11 = [v6 interfaceOrientation];
  if (!v9)
  {
    id v9 = v8;
    if (!v9)
    {
      id v9 = +[SBWorkspaceEntity entity];
      if (!v9)
      {
        v32 = [MEMORY[0x1E4F28B00] currentHandler];
        [v32 handleFailureInMethod:a2 object:self file:@"SBLayoutStateManager.m" lineNumber:95 description:@"Primary workspace entity may not be nil at this point!"];
      }
    }
  }
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __68__SBLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke;
  v44[3] = &unk_1E6B048F8;
  id v12 = v10;
  id v45 = v12;
  uint64_t v13 = MEMORY[0x1D948C7A0](v44);
  v39 = v12;
  if ([v9 isPreviousWorkspaceEntity])
  {
    uint64_t v14 = (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v9, v12);

    id v9 = (id)v14;
  }
  if ([v9 isEmptyWorkspaceEntity])
  {

LABEL_12:
    id v9 = +[SBWorkspaceEntity entity];
    goto LABEL_13;
  }
  if (!v9) {
    goto LABEL_12;
  }
LABEL_13:
  if ([v9 isPreviousWorkspaceEntity])
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"SBLayoutStateManager.m" lineNumber:139 description:@"Primary workspace entity may not be previous entity at this point!"];
  }
  if ([v9 isEmptyWorkspaceEntity])
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"SBLayoutStateManager.m" lineNumber:141 description:@"Primary workspace entity may not be empty entity at this point!"];
  }
  [v5 setActivatingEntity:0];
  [v5 setEntity:v9 forLayoutRole:1];
  [v5 setEntity:0 forLayoutRole:2];
  [v5 setEntity:0 forLayoutRole:3];
  [v5 setEntity:0 forLayoutRole:4];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v16 = v15;
  if (v9)
  {
    v17 = __68__SBLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_2((uint64_t)v15, v9);
    if (v17) {
      [v16 addObject:v17];
    }
  }
  v38 = (void *)v13;
  if ([v16 count]) {
    v18 = v16;
  }
  else {
    v18 = 0;
  }
  id v19 = v18;
  uint64_t v20 = [v5 interfaceOrientation];
  if (v20) {
    uint64_t v11 = v20;
  }
  if ([v19 count])
  {
    v34 = v16;
    v35 = v8;
    v36 = v6;
    id v37 = v5;
    v21 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v33 = v19;
    id v22 = v19;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v41 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          v28 = objc_msgSend(NSNumber, "numberWithInteger:", v11, v33);
          [v21 setObject:v28 forKey:v27];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v24);
    }

    id v6 = v36;
    id v5 = v37;
    uint64_t v8 = v35;
    id v19 = v33;
    id v16 = v34;
  }
  else
  {
    v21 = 0;
  }
  id v7 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_layoutStateClass")), "_initWithLayoutElements:interfaceOrientation:interfaceOrientationByLayoutElement:", v19, v11, v21);

LABEL_37:
  return v7;
}

id __68__SBLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (![v5 isPreviousWorkspaceEntity]) {
    goto LABEL_7;
  }
  uint64_t v7 = [v5 previousLayoutRole];
  uint64_t v8 = v6;
  if (v7)
  {
    if (v7 != 1) {
      goto LABEL_7;
    }
    uint64_t v8 = *(void **)(a1 + 32);
  }
  id v9 = (void *)[v8 copy];
  if (v9)
  {
    id v10 = v9;
    [v9 clearActivationSettings];
    uint64_t v11 = [v5 activationSettings];
    [v10 applyActivationSettings:v11];

    [v10 clearDeactivationSettings];
    id v12 = [v5 deactivationSettings];
    [v10 applyDeactivationSettings:v12];

    goto LABEL_8;
  }
LABEL_7:
  id v10 = +[SBWorkspaceEntity entity];
LABEL_8:

  return v10;
}

id __68__SBLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isHomeScreenEntity])
  {
    v3 = 0;
  }
  else
  {
    v3 = +[SBLayoutElement elementWithDescriptor:v2];
  }

  return v3;
}

@end