@interface SBSwitcherWindowReplacementResult
+ (id)defaultWindowReplacementResult;
+ (id)windowReplacementResultByRemovingLayoutElements:(id)a3 fromLayoutState:(id)a4 withPrecedingLayoutState:(id)a5 recentAppLayouts:(id)a6;
- (SBLayoutElement)primaryElement;
- (SBLayoutElement)sideElement;
- (SBSwitcherWindowReplacementResult)initWithPrimaryElement:(id)a3 sideElement:(id)a4 activatingEntity:(id)a5 requestedUnlockedEnvironmentMode:(int64_t)a6;
- (SBWorkspaceEntity)activatingEntity;
- (int64_t)requestedUnlockedEnvironmentMode;
@end

@implementation SBSwitcherWindowReplacementResult

+ (id)defaultWindowReplacementResult
{
  v2 = (void *)[objc_alloc((Class)a1) initWithPrimaryElement:0 sideElement:0 activatingEntity:0 requestedUnlockedEnvironmentMode:0];
  return v2;
}

+ (id)windowReplacementResultByRemovingLayoutElements:(id)a3 fromLayoutState:(id)a4 withPrecedingLayoutState:(id)a5 recentAppLayouts:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __143__SBSwitcherWindowReplacementResult_windowReplacementResultByRemovingLayoutElements_fromLayoutState_withPrecedingLayoutState_recentAppLayouts___block_invoke;
  v70[3] = &unk_1E6AF8260;
  id v14 = v13;
  id v71 = v14;
  v15 = (uint64_t (**)(void, void))MEMORY[0x1D948C7A0](v70);
  if ([v10 count] != 1)
  {
    uint64_t v23 = 0;
    v24 = 0;
    id v22 = 0;
    id v21 = 0;
    goto LABEL_44;
  }
  v16 = [v10 firstObject];
  v17 = [v11 elements];
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __143__SBSwitcherWindowReplacementResult_windowReplacementResultByRemovingLayoutElements_fromLayoutState_withPrecedingLayoutState_recentAppLayouts___block_invoke_2;
  v68[3] = &unk_1E6AF8260;
  id v18 = v16;
  id v69 = v18;
  v19 = objc_msgSend(v17, "bs_filter:", v68);

  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __143__SBSwitcherWindowReplacementResult_windowReplacementResultByRemovingLayoutElements_fromLayoutState_withPrecedingLayoutState_recentAppLayouts___block_invoke_3;
  v66[3] = &unk_1E6B0AF10;
  id v20 = v11;
  id v67 = v20;
  v64 = v19;
  v65 = v18;
  if (!objc_msgSend(v10, "bs_containsObjectPassingTest:", v66))
  {
    if ([v19 count])
    {
      if ([v19 count] != 1)
      {
        uint64_t v23 = 0;
        v24 = 0;
        id v22 = 0;
        id v21 = 0;
        goto LABEL_43;
      }
      id v62 = a1;
      v25 = [v18 uniqueIdentifier];
      v26 = [v20 elementWithIdentifier:v25];

      if (!v26)
      {
        id v22 = 0;
        id v21 = 0;
LABEL_40:

        uint64_t v23 = 0;
        v24 = 0;
        a1 = v62;
        goto LABEL_43;
      }
      v58 = [v20 elementWithRole:1];
      v56 = [v20 elementWithRole:2];
      v27 = [v12 elementWithRole:1];
      v60 = [v12 elementWithRole:2];
      uint64_t v28 = [v26 layoutRole];
      if (v28 == 1)
      {
        v53 = v26;
        uint64_t v29 = [v27 uniqueIdentifier];
        [v18 uniqueIdentifier];
        v31 = v30 = v27;
        v32 = (void *)v29;
        int v33 = [v31 isEqualToString:v29];

        v54 = v30;
        int v34 = ((uint64_t (**)(void, void *))v15)[2](v15, v30);
        id v21 = v56;
        id v22 = 0;
        if (![v56 isEqual:v60] || v33)
        {
          v35 = v56;
        }
        else
        {
          v35 = v56;
          if (v34)
          {
            id v21 = v54;
            id v22 = v56;
          }
        }
        id v48 = v35;
      }
      else
      {
        if (v28 != 2)
        {
          if (v28 == 4)
          {
            id v21 = v58;
            v35 = v56;
            id v22 = v56;
          }
          else
          {
            id v22 = 0;
            id v21 = 0;
            v35 = v56;
          }
          goto LABEL_39;
        }
        v53 = v26;
        uint64_t v43 = [v60 uniqueIdentifier];
        [v18 uniqueIdentifier];
        v45 = v44 = v27;
        v52 = (void *)v43;
        int v51 = [v45 isEqualToString:v43];

        int v46 = ((uint64_t (**)(void, void *))v15)[2](v15, v60);
        v54 = v44;
        LODWORD(v44) = [v58 isEqual:v44];
        id v21 = v58;
        id v22 = 0;
        if (!v44 || v51)
        {
          v35 = v56;
        }
        else
        {
          v35 = v56;
          if (v46) {
            id v22 = v60;
          }
        }
      }
      v26 = v53;
      v27 = v54;
LABEL_39:

      goto LABEL_40;
    }
    if (_os_feature_enabled_impl() || [v12 unlockedEnvironmentMode] != 3)
    {
      v24 = +[SBWorkspaceEntity entity];
      id v22 = 0;
      id v21 = 0;
      uint64_t v23 = 1;
      goto LABEL_43;
    }
    v63 = [v12 elementWithRole:1];
    v61 = [v12 elementWithRole:2];
    uint64_t v36 = [v63 uniqueIdentifier];
    uint64_t v37 = [v61 uniqueIdentifier];
    v38 = [v18 uniqueIdentifier];
    v59 = (void *)v36;
    int v57 = [v38 isEqualToString:v36];

    uint64_t v39 = [v18 uniqueIdentifier];
    v55 = (void *)v37;
    LODWORD(v36) = [(id)v39 isEqualToString:v37];

    LODWORD(v39) = ((uint64_t (**)(void, void *))v15)[2](v15, v63);
    int v40 = ((uint64_t (**)(void, void *))v15)[2](v15, v61);
    int v41 = v39 & ~v57;
    int v42 = v40 & ~v36;
    if (v41 == 1 && v42)
    {
      id v21 = v63;
      id v22 = v61;
      uint64_t v23 = 0;
      v24 = 0;
    }
    else
    {
      if (v41)
      {
        id v47 = v63;
      }
      else
      {
        if (!v42)
        {
          v24 = +[SBWorkspaceEntity entity];
          id v22 = 0;
          id v21 = 0;
          uint64_t v23 = 1;
          goto LABEL_42;
        }
        id v47 = v61;
      }
      id v21 = v47;
      uint64_t v23 = 0;
      v24 = 0;
      id v22 = 0;
    }
LABEL_42:

    goto LABEL_43;
  }
  id v21 = [v20 elementWithRole:1];
  id v22 = [v20 elementWithRole:2];
  uint64_t v23 = 0;
  v24 = 0;
LABEL_43:

LABEL_44:
  v49 = (void *)[objc_alloc((Class)a1) initWithPrimaryElement:v21 sideElement:v22 activatingEntity:v24 requestedUnlockedEnvironmentMode:v23];

  return v49;
}

uint64_t __143__SBSwitcherWindowReplacementResult_windowReplacementResultByRemovingLayoutElements_fromLayoutState_withPrecedingLayoutState_recentAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 workspaceEntity];
  if ([v3 isApplicationSceneEntity])
  {
    v4 = [v3 displayItemRepresentation];
    v5 = *(void **)(a1 + 32);
    v6 = [v4 bundleIdentifier];
    v7 = [v5 recentDisplayItemsForBundleIdentifier:v6 includingHiddenAppLayouts:0];
    uint64_t v8 = [v7 containsObject:v4];
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

uint64_t __143__SBSwitcherWindowReplacementResult_windowReplacementResultByRemovingLayoutElements_fromLayoutState_withPrecedingLayoutState_recentAppLayouts___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (SBLayoutRoleIsValidForSplitView([v3 layoutRole])) {
    uint64_t v4 = [v3 representsSameLayoutElementAsDescriptor:*(void *)(a1 + 32)] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __143__SBSwitcherWindowReplacementResult_windowReplacementResultByRemovingLayoutElements_fromLayoutState_withPrecedingLayoutState_recentAppLayouts___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) elementWithRole:4];
  v5 = [v4 uniqueIdentifier];
  uint64_t v6 = BSEqualStrings();

  return v6;
}

- (SBSwitcherWindowReplacementResult)initWithPrimaryElement:(id)a3 sideElement:(id)a4 activatingEntity:(id)a5 requestedUnlockedEnvironmentMode:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBSwitcherWindowReplacementResult;
  id v14 = [(SBSwitcherWindowReplacementResult *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_primaryElement, a3);
    objc_storeStrong((id *)&v15->_sideElement, a4);
    objc_storeStrong((id *)&v15->_activatingEntity, a5);
    v15->_requestedUnlockedEnvironmentMode = a6;
  }

  return v15;
}

- (SBLayoutElement)primaryElement
{
  return self->_primaryElement;
}

- (SBLayoutElement)sideElement
{
  return self->_sideElement;
}

- (SBWorkspaceEntity)activatingEntity
{
  return self->_activatingEntity;
}

- (int64_t)requestedUnlockedEnvironmentMode
{
  return self->_requestedUnlockedEnvironmentMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activatingEntity, 0);
  objc_storeStrong((id *)&self->_sideElement, 0);
  objc_storeStrong((id *)&self->_primaryElement, 0);
}

@end