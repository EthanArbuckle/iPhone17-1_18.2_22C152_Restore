@interface UIFocusUpdateContext
+ (_UIDebugIssueReportFormatter)_defaultValidationReportFormatter;
- (BOOL)_focusRedirectedByGuide;
- (BOOL)_isDeferredUpdate;
- (BOOL)_isFilteredToGroup;
- (BOOL)_isInitialMovement;
- (BOOL)_isValidInFocusSystem:(id)a3;
- (BOOL)_validate;
- (CGVector)_focusVelocity;
- (NSArray)_regionMapSnapshots;
- (NSString)_nextFocusedGroupIdentifier;
- (NSString)_previouslyFocusedGroupIdentifier;
- (UIFocusEnvironment)_commonAncestorEnvironment;
- (UIFocusEnvironment)_initialDestinationEnvironment;
- (UIFocusGuide)_focusedGuide;
- (UIFocusHeading)focusHeading;
- (UIFocusUpdateContext)init;
- (UIImage)_regionMapSnapshotsVisualRepresentation;
- (UIView)nextFocusedView;
- (UIView)previouslyFocusedView;
- (_UIDebugIssueReport)_validationReport;
- (_UIDebugLogReport)_preferredFocusReport;
- (_UIDynamicFocusGroupMap)_focusGroupMap;
- (_UIFocusBehavior)focusBehavior;
- (_UIFocusEnvironmentScrollableContainerTuple)_commonEnvironmentScrollableContainer;
- (_UIFocusItemInfo)_destinationItemInfo;
- (_UIFocusItemInfo)_sourceItemInfo;
- (_UIFocusMapSearchInfo)_focusMapSearchInfo;
- (_UIFocusMovementInfo)_focusMovement;
- (_UIFocusUpdateRequesting)_request;
- (double)_destinationViewDistanceOffscreen;
- (id)_focusMapSnapshotDebugInfoArray;
- (id)_initWithContext:(id)a3;
- (id)_initWithFocusMovementRequest:(id)a3 nextFocusedItem:(id)a4;
- (id)_initWithFocusUpdateRequest:(id)a3;
- (id)_publicRegionMapSnapshots;
- (id)debugQuickLookObject;
- (id)description;
- (id)nextFocusedItem;
- (id)previouslyFocusedItem;
- (int64_t)_groupFilter;
- (void)_cacheFocusBehavior;
- (void)_didUpdateFocus;
- (void)_restoreRestrictedFocusMovementWithMovement:(id)a3;
- (void)_setCommonEnvironmentScrollableContainer:(id)a3;
- (void)_setDeferredUpdate:(BOOL)a3;
- (void)_setDestinationViewDistanceOffscreen:(double)a3;
- (void)_setFocusGroupMap:(id)a3;
- (void)_setFocusMapSearchInfo:(id)a3;
- (void)_setFocusRedirectedByGuide:(BOOL)a3;
- (void)_setFocusedGuide:(id)a3;
- (void)_setInitialDestinationEnvironment:(id)a3;
- (void)_setPreferredFocusReport:(id)a3;
- (void)_setRegionMapSnapshots:(id)a3;
- (void)_setSourceItemInfo:(id)a3;
- (void)_setValidationReport:(id)a3;
- (void)_updateDestinationItemIfNeeded;
- (void)_updateWithFocusGroupMap:(id)a3;
- (void)_willUpdateFocusFromFocusedItem:(id)a3;
@end

@implementation UIFocusUpdateContext

- (UIFocusUpdateContext)init
{
  if (os_variant_has_internal_diagnostics())
  {
    v9 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "-init is not a useful initializer for this class. Use one of the designated initializers instead.", buf, 2u);
    }
  }
  else
  {
    v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &init___s_category_0) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "-init is not a useful initializer for this class. Use one of the designated initializers instead.", v10, 2u);
    }
  }
  v4 = +[UIScreen mainScreen];
  v5 = +[UIFocusSystem focusSystemForEnvironment:v4];

  v6 = +[_UIFocusUpdateRequest requestForRemovingFocusInFocusSystem:v5];
  v7 = [(UIFocusUpdateContext *)self _initWithFocusUpdateRequest:v6];

  return v7;
}

- (id)_initWithFocusUpdateRequest:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"UIFocusUpdateContext.m", 68, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)UIFocusUpdateContext;
  v7 = [(UIFocusUpdateContext *)&v17 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_request, a3);
    v9 = [v6 focusSystem];
    v10 = [v9 focusedItem];
    uint64_t v11 = +[_UIFocusItemInfo infoWithItem:v10];
    sourceItemInfo = v8->_sourceItemInfo;
    v8->_sourceItemInfo = (_UIFocusItemInfo *)v11;

    if ([v6 isFocusRemovalRequest])
    {
      objc_storeWeak((id *)&v8->_initialDestinationEnvironment, 0);
    }
    else
    {
      v13 = [v6 destinationEnvironment];
      if (v13)
      {
        objc_storeWeak((id *)&v8->_initialDestinationEnvironment, v13);
      }
      else
      {
        v14 = [v6 environment];
        objc_storeWeak((id *)&v8->_initialDestinationEnvironment, v14);
      }
    }
    *(unsigned char *)&v8->_flags |= 4u;
    [v6 cacheCurrentFocusSystem];
    [(UIFocusUpdateContext *)v8 _cacheFocusBehavior];
  }

  return v8;
}

- (id)_initWithFocusMovementRequest:(id)a3 nextFocusedItem:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"UIFocusUpdateContext.m", 86, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)UIFocusUpdateContext;
  v10 = [(UIFocusUpdateContext *)&v19 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_request, a3);
    uint64_t v12 = [v8 movementInfo];
    focusMovement = v11->_focusMovement;
    v11->_focusMovement = (_UIFocusMovementInfo *)v12;

    uint64_t v14 = [v8 focusedItemInfo];
    sourceItemInfo = v11->_sourceItemInfo;
    v11->_sourceItemInfo = (_UIFocusItemInfo *)v14;

    objc_storeWeak((id *)&v11->_initialDestinationEnvironment, v9);
    *(unsigned char *)&v11->_flags |= 4u;
    v16 = [v8 movementInfo];
    *(unsigned char *)&v11->_flags = *(unsigned char *)&v11->_flags & 0xF7 | (8 * (([v16 heading] & 0x300) != 0));

    [(UIFocusUpdateContext *)v11 _cacheFocusBehavior];
  }

  return v11;
}

- (id)_initWithContext:(id)a3
{
  v4 = (id *)a3;
  v16.receiver = self;
  v16.super_class = (Class)UIFocusUpdateContext;
  v5 = [(UIFocusUpdateContext *)&v16 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_request, v4[9]);
    objc_storeStrong((id *)&v6->_sourceItemInfo, v4[10]);
    objc_storeStrong((id *)&v6->_destinationItemInfo, v4[2]);
    objc_storeStrong((id *)&v6->_focusMovement, v4[11]);
    id WeakRetained = objc_loadWeakRetained(v4 + 13);
    objc_storeWeak((id *)&v6->_initialDestinationEnvironment, WeakRetained);

    id v8 = objc_loadWeakRetained(v4 + 19);
    objc_storeWeak((id *)&v6->_focusedGuide, v8);

    v6->_focusRedirectedByGuide = *((unsigned char *)v4 + 13);
    objc_storeStrong((id *)&v6->_regionMapSnapshots, v4[16]);
    objc_storeStrong((id *)&v6->_regionMapSnapshotsVisualRepresentation, v4[6]);
    int v9 = *(unsigned char *)&v6->_flags & 0xFE | (_BYTE)v4[1] & 1;
    *(unsigned char *)&v6->_flags = v9;
    unsigned int v10 = v9 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)v4 + 8) >> 1) & 1));
    *(unsigned char *)&v6->_flags = v10;
    unsigned int v11 = v10 & 0xFFFFFFFB | (4 * ((*((unsigned __int8 *)v4 + 8) >> 2) & 1));
    *(unsigned char *)&v6->_flags = v11;
    *(unsigned char *)&v6->_flags = v11 & 0xF7 | (_BYTE)v4[1] & 8;
    id v12 = objc_loadWeakRetained(v4 + 3);
    objc_storeWeak((id *)&v6->_commonAncestorEnvironment, v12);

    *(unsigned char *)&v6->_flags = *(unsigned char *)&v6->_flags & 0xEF | (_BYTE)v4[1] & 0x10;
    uint64_t v13 = [v4 focusBehavior];
    focusBehavior = v6->_focusBehavior;
    v6->_focusBehavior = (_UIFocusBehavior *)v13;
  }
  return v6;
}

- (void)_cacheFocusBehavior
{
  v3 = [(UIFocusUpdateContext *)self _request];
  id v6 = [v3 focusSystem];

  v4 = [v6 behavior];
  focusBehavior = self->_focusBehavior;
  self->_focusBehavior = v4;
}

- (BOOL)_isValidInFocusSystem:(id)a3
{
  request = self->_request;
  id v5 = a3;
  id v6 = [(_UIFocusUpdateRequesting *)request focusSystem];

  if (v6 != v5) {
    return 0;
  }
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    char flags = *(unsigned char *)&self->_flags & 0xFC | [(UIFocusUpdateContext *)self _validate] | 2;
    *(unsigned char *)&self->_char flags = flags;
  }
  return flags & 1;
}

- (BOOL)_validate
{
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 1;
  v3 = [(UIFocusUpdateContext *)self previouslyFocusedItem];
  v4 = [(UIFocusUpdateContext *)self nextFocusedItem];
  id v5 = [(UIFocusUpdateContext *)self _request];
  id v6 = self->_validationReport;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__UIFocusUpdateContext__validate__block_invoke;
  aBlock[3] = &unk_1E52EE8A8;
  v43 = &v44;
  v7 = v6;
  v42 = v7;
  id v8 = (unsigned int (**)(void))_Block_copy(aBlock);
  if (v3 != v4) {
    goto LABEL_9;
  }
  if (([v5 allowsFocusingCurrentItem] & 1) == 0)
  {
    $7E0C05635123E2A0FF21903DA08D55EC flags = self->_flags;
    int v11 = (*(unsigned int *)&flags >> 3) & 1;
    *((unsigned char *)v45 + 24) = (*(unsigned char *)&flags & 8) != 0;
    if ((*(unsigned char *)&flags & 8) == 0)
    {
      BOOL v12 = [(UIFocusUpdateContext *)self _focusRedirectedByGuide];
      int v9 = v45 + 3;
      if (v12) {
        goto LABEL_4;
      }
      int v11 = *v9;
    }
    if (v11) {
      goto LABEL_9;
    }
    v31 = [(UIFocusUpdateContext *)self _focusMovement];
    if (!v31) {
      goto LABEL_9;
    }
    v32 = [(UIFocusUpdateContext *)self _initialDestinationEnvironment];

    if (v3 == v32) {
      goto LABEL_9;
    }
  }
  int v9 = v45 + 3;
LABEL_4:
  unsigned char *v9 = 1;
LABEL_9:
  if (v8[2](v8))
  {
    int v13 = [v5 requiresNextFocusedItem];
    int v14 = v4 ? 0 : v13;
    if (v14 == 1)
    {
      *((unsigned char *)v45 + 24) = 0;
      if (v7)
      {
        if (v3)
        {
          v15 = +[_UIDebugIssue issueWithDescription:@"There is no next focused item, but updating focus to nil is not allowed."];
          [(_UIDebugIssueReport *)v7 addIssue:v15];
        }
      }
    }
  }
  unsigned int v16 = v8[2](v8);
  if (v4) {
    unsigned int v17 = v16;
  }
  else {
    unsigned int v17 = 0;
  }
  if (v17 == 1)
  {
    v18 = [(_UIFocusUpdateRequesting *)self->_request focusSystem];
    objc_super v19 = +[UIFocusSystem focusSystemForEnvironment:v4];

    if (v18 != v19) {
      *((unsigned char *)v45 + 24) = 0;
    }
  }
  if (v8[2](v8) && [v5 requiresEnvironmentValidation])
  {
    if (v7)
    {
      v20 = +[_UIDebugIssue issueWithDescription:@"The following ancestor environments of the previously focused item prevented the focus update from occurring:"];
      v21 = +[_UIDebugIssue issueWithDescription:@"The following ancestor environments of the next focused item prevented the focus update from occurring:"];
    }
    else
    {
      v20 = 0;
      v21 = 0;
    }
    v22 = [v5 focusSystem];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __33__UIFocusUpdateContext__validate__block_invoke_2;
    v33[3] = &unk_1E52EE8D0;
    id v34 = v3;
    v40 = &v44;
    id v35 = v4;
    v36 = self;
    id v23 = v20;
    id v37 = v23;
    v39 = v8;
    id v24 = v21;
    id v38 = v24;
    [v22 _performWithoutFocusUpdates:v33];

    if (v7)
    {
      v25 = [v23 subissues];
      uint64_t v26 = [v25 count];

      if (v26) {
        [(_UIDebugIssueReport *)v7 addIssue:v23];
      }
      v27 = [v24 subissues];
      uint64_t v28 = [v27 count];

      if (v28) {
        [(_UIDebugIssueReport *)v7 addIssue:v24];
      }
    }
  }
  char v29 = *((unsigned char *)v45 + 24);

  _Block_object_dispose(&v44, 8);
  return v29;
}

BOOL __33__UIFocusUpdateContext__validate__block_invoke(uint64_t a1)
{
  return *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) || *(void *)(a1 + 32) != 0;
}

void __33__UIFocusUpdateContext__validate__block_invoke_2(uint64_t a1)
{
  _UIFocusEnvironmentFirstCommonAncestor(*(void **)(a1 + 32), *(void **)(a1 + 40));
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = v2;
    do
    {
      v4 = v3;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = _UIFocusEnvironmentShouldUpdateFocus(v3, *(void **)(a1 + 48));
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) && *(void *)(a1 + 56))
      {
        id v5 = NSString;
        id v6 = v3;
        v7 = (objc_class *)objc_opt_class();
        id v8 = NSStringFromClass(v7);
        int v9 = [v5 stringWithFormat:@"<%@: %p>", v8, v6];

        unsigned int v10 = +[_UIDebugIssue issueWithDescription:v9];

        [v10 setPrefix:&stru_1ED0E84C0];
        [*(id *)(a1 + 56) addIssue:v10];
      }
      _UIFocusEnvironmentParentEnvironment(v4);
      id v3 = (id)objc_claimAutoreleasedReturnValue();

      if ((*(unsigned int (**)(void))(*(void *)(a1 + 72) + 16))()) {
        BOOL v11 = v3 == 0;
      }
      else {
        BOOL v11 = 1;
      }
    }
    while (!v11);
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 72) + 16))())
  {
    BOOL v12 = *(void **)(a1 + 40);
    if (v12 != *(void **)(a1 + 32))
    {
      id v13 = v12;
      do
      {
        int v14 = v13;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = _UIFocusEnvironmentShouldUpdateFocus(v13, *(void **)(a1 + 48));
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) && *(void *)(a1 + 64))
        {
          id v15 = v13;
          if (v15)
          {
            unsigned int v16 = NSString;
            unsigned int v17 = (objc_class *)objc_opt_class();
            v18 = NSStringFromClass(v17);
            objc_super v19 = [v16 stringWithFormat:@"<%@: %p>", v18, v15];
          }
          else
          {
            objc_super v19 = @"(nil)";
          }

          v20 = +[_UIDebugIssue issueWithDescription:v19];

          [v20 setPrefix:&stru_1ED0E84C0];
          [*(id *)(a1 + 64) addIssue:v20];
        }
        _UIFocusEnvironmentParentEnvironment(v14);
        id v13 = (id)objc_claimAutoreleasedReturnValue();

        if ((*(unsigned int (**)(void))(*(void *)(a1 + 72) + 16))()) {
          BOOL v21 = v13 == 0;
        }
        else {
          BOOL v21 = 1;
        }
      }
      while (!v21 && v13 != v23);
    }
  }
}

- (id)previouslyFocusedItem
{
  v2 = [(UIFocusUpdateContext *)self _sourceItemInfo];
  id v3 = [v2 item];

  return v3;
}

- (id)nextFocusedItem
{
  v2 = [(UIFocusUpdateContext *)self _destinationItemInfo];
  id v3 = [v2 item];

  return v3;
}

- (void)_setSourceItemInfo:(id)a3
{
  if (self->_sourceItemInfo != a3)
  {
    v4 = (_UIFocusItemInfo *)[a3 copy];
    sourceItemInfo = self->_sourceItemInfo;
    self->_sourceItemInfo = v4;

    *(unsigned char *)&self->_flags &= ~2u;
  }
}

- (_UIFocusItemInfo)_destinationItemInfo
{
  [(UIFocusUpdateContext *)self _updateDestinationItemIfNeeded];
  destinationItemInfo = self->_destinationItemInfo;
  return destinationItemInfo;
}

- (UIView)previouslyFocusedView
{
  v2 = [(UIFocusUpdateContext *)self _sourceItemInfo];
  id v3 = [v2 containingView];

  return (UIView *)v3;
}

- (UIView)nextFocusedView
{
  v2 = [(UIFocusUpdateContext *)self _destinationItemInfo];
  id v3 = [v2 containingView];

  return (UIView *)v3;
}

- (void)_setInitialDestinationEnvironment:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_initialDestinationEnvironment);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_initialDestinationEnvironment, obj);
    id v5 = obj;
    *(unsigned char *)&self->_flags |= 4u;
  }
}

- (void)_updateDestinationItemIfNeeded
{
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(unsigned char *)&self->_flags &= ~4u;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_initialDestinationEnvironment);
    if (WeakRetained)
    {
      id v3 = objc_alloc_init(_UIDeepestPreferredEnvironmentSearch);
      v4 = [(UIFocusUpdateContext *)self _request];
      -[_UIDeepestPreferredEnvironmentSearch setAllowsOverridingPreferedFocusEnvironments:](v3, "setAllowsOverridingPreferedFocusEnvironments:", [v4 allowsOverridingPreferedFocusEnvironments]);

      if (self->_preferredFocusReport)
      {
        id v5 = +[_UIDebugLogNode rootNode];
        [(_UIDeepestPreferredEnvironmentSearch *)v3 setDebugLog:v5];
      }
      id v6 = [(UIFocusUpdateContext *)self _request];
      v7 = [(_UIDeepestPreferredEnvironmentSearch *)v3 deepestPreferredFocusableItemForEnvironment:WeakRetained withRequest:v6];

      id v8 = +[_UIFocusItemInfo infoWithItem:v7];
      destinationItemInfo = self->_destinationItemInfo;
      self->_destinationItemInfo = v8;

      preferredFocusReport = self->_preferredFocusReport;
      if (preferredFocusReport)
      {
        BOOL v11 = [(_UIDeepestPreferredEnvironmentSearch *)v3 debugLog];
        BOOL v12 = [v11 description];
        [(_UIDebugLogReport *)preferredFocusReport addMessage:v12];
      }
    }
    else
    {
      id v13 = +[_UIFocusItemInfo infoWithItem:0];
      id v3 = (_UIDeepestPreferredEnvironmentSearch *)self->_destinationItemInfo;
      self->_destinationItemInfo = v13;
    }
  }
}

- (UIFocusEnvironment)_commonAncestorEnvironment
{
  if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    id v3 = [(UIFocusUpdateContext *)self previouslyFocusedItem];
    v4 = [(UIFocusUpdateContext *)self nextFocusedItem];
    id v5 = _UIFocusEnvironmentFirstCommonAncestor(v3, v4);
    objc_storeWeak((id *)&self->_commonAncestorEnvironment, v5);

    *(unsigned char *)&self->_flags |= 0x10u;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commonAncestorEnvironment);
  return (UIFocusEnvironment *)WeakRetained;
}

- (UIFocusHeading)focusHeading
{
  v2 = [(UIFocusUpdateContext *)self _focusMovement];
  UIFocusHeading v3 = [v2 heading];

  return v3;
}

- (CGVector)_focusVelocity
{
  [(UIFocusUpdateContext *)self _destinationViewDistanceOffscreen];
  if (v3 == 0.0)
  {
    v4 = [(UIFocusUpdateContext *)self _focusMovement];
    [v4 _velocity];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
    double v6 = 0.0;
  }
  double v9 = v6;
  double v10 = v8;
  result.dy = v10;
  result.dx = v9;
  return result;
}

- (BOOL)_isInitialMovement
{
  v2 = [(UIFocusUpdateContext *)self _focusMovement];
  char v3 = [v2 _isInitialMovement];

  return v3;
}

- (void)_setFocusedGuide:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusedGuide);

  if (WeakRetained != obj) {
    objc_storeWeak((id *)&self->_focusedGuide, obj);
  }
  id v5 = objc_loadWeakRetained((id *)&self->_focusedGuide);
  [(UIFocusUpdateContext *)self _setFocusRedirectedByGuide:v5 != 0];
}

- (void)_setFocusRedirectedByGuide:(BOOL)a3
{
  self->_focusRedirectedByGuide = a3;
}

- (void)_setFocusMapSearchInfo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = (_UIFocusMapSearchInfo *)a3;
  p_focusMapSearchInfo = &self->_focusMapSearchInfo;
  if (self->_focusMapSearchInfo != v5)
  {
    objc_storeStrong((id *)&self->_focusMapSearchInfo, a3);
    double v7 = *p_focusMapSearchInfo;
    if (*p_focusMapSearchInfo)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      double v8 = [(_UIFocusMapSearchInfo *)v7 destinationRegions];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * v12++) _willParticipateAsDestinationRegionInFocusUpdate:self];
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v10);
      }
    }
  }
}

- (void)_willUpdateFocusFromFocusedItem:(id)a3
{
  id v7 = a3;
  id v4 = [(UIFocusUpdateContext *)self previouslyFocusedItem];

  id v5 = v7;
  if (v4 != v7)
  {
    double v6 = +[_UIFocusItemInfo infoWithItem:v7];
    [(UIFocusUpdateContext *)self _setSourceItemInfo:v6];

    id v5 = v7;
  }
}

- (void)_didUpdateFocus
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v3 = [(UIFocusUpdateContext *)self _focusMapSearchInfo];
  id v4 = [v3 destinationRegions];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) _didParticipateAsDestinationRegionInFocusUpdate:self];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  uint64_t v9 = [(UIFocusUpdateContext *)self _focusedGuide];
  [v9 _didUpdateFocusToPreferredFocusedView];
}

- (void)_restoreRestrictedFocusMovementWithMovement:(id)a3
{
}

- (void)_updateWithFocusGroupMap:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[_UIDynamicFocusGroupMap alloc] initWithBackingFocusGroupMap:v4];

  [(UIFocusUpdateContext *)self _setFocusGroupMap:v5];
  previouslyFocusedGroupIdentifier = self->_previouslyFocusedGroupIdentifier;
  self->_previouslyFocusedGroupIdentifier = 0;

  nextFocusedGroupIdentifier = self->_nextFocusedGroupIdentifier;
  self->_nextFocusedGroupIdentifier = 0;
}

- (_UIDynamicFocusGroupMap)_focusGroupMap
{
  if (!self->_focusGroupMap && [(UIFocusUpdateContext *)self _isFilteredToGroup])
  {
    char v3 = [_UIDynamicFocusGroupMap alloc];
    id v4 = [(UIFocusUpdateContext *)self _request];
    uint64_t v5 = [v4 focusSystem];
    uint64_t v6 = [v5 focusItemContainer];
    uint64_t v7 = [v6 coordinateSpace];
    uint64_t v8 = [(_UIDynamicFocusGroupMap *)v3 initWithCoordinateSpace:v7];
    focusGroupMap = self->_focusGroupMap;
    self->_focusGroupMap = v8;
  }
  long long v10 = self->_focusGroupMap;
  return v10;
}

- (NSString)_previouslyFocusedGroupIdentifier
{
  if (!self->_previouslyFocusedGroupIdentifier
    && [(UIFocusUpdateContext *)self _isFilteredToGroup])
  {
    char v3 = [(UIFocusUpdateContext *)self previouslyFocusedItem];
    if (v3)
    {
      id v4 = [(UIFocusUpdateContext *)self _focusGroupMap];
      uint64_t v5 = [v4 focusGroupIdentifierForItem:v3];
      previouslyFocusedGroupIdentifier = self->_previouslyFocusedGroupIdentifier;
      self->_previouslyFocusedGroupIdentifier = v5;
    }
  }
  uint64_t v7 = self->_previouslyFocusedGroupIdentifier;
  return v7;
}

- (NSString)_nextFocusedGroupIdentifier
{
  if (!self->_nextFocusedGroupIdentifier && [(UIFocusUpdateContext *)self _isFilteredToGroup])
  {
    char v3 = [(UIFocusUpdateContext *)self nextFocusedItem];
    if (v3)
    {
      id v4 = [(UIFocusUpdateContext *)self _focusGroupMap];
      uint64_t v5 = [v4 focusGroupIdentifierForItem:v3];
      nextFocusedGroupIdentifier = self->_nextFocusedGroupIdentifier;
      self->_nextFocusedGroupIdentifier = v5;
    }
  }
  uint64_t v7 = self->_nextFocusedGroupIdentifier;
  return v7;
}

- (int64_t)_groupFilter
{
  v2 = [(UIFocusUpdateContext *)self _focusMovement];
  int64_t v3 = [v2 _groupFilter];

  return v3;
}

- (BOOL)_isFilteredToGroup
{
  return [(UIFocusUpdateContext *)self _groupFilter] != 0;
}

+ (_UIDebugIssueReportFormatter)_defaultValidationReportFormatter
{
  v2 = objc_alloc_init(_UIDebugIssueReportFormatter);
  [(_UIDebugIssueReportFormatter *)v2 setHeader:@"The following issues were found that will prevent this focus update from being committed:"];
  [(_UIDebugIssueReportFormatter *)v2 setNoIssuesDescription:@"There are no issues that would prevent this focus update from occurring."];
  return v2;
}

- (NSArray)_regionMapSnapshots
{
  regionMapSnapshots = self->_regionMapSnapshots;
  if (!regionMapSnapshots)
  {
    id v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    uint64_t v5 = self->_regionMapSnapshots;
    self->_regionMapSnapshots = v4;

    regionMapSnapshots = self->_regionMapSnapshots;
  }
  return regionMapSnapshots;
}

- (id)_publicRegionMapSnapshots
{
  v2 = [(UIFocusUpdateContext *)self _regionMapSnapshots];
  int64_t v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_216];
  id v4 = [v2 filteredArrayUsingPredicate:v3];

  return v4;
}

uint64_t __49__UIFocusUpdateContext__publicRegionMapSnapshots__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPrivateSnapshot] ^ 1;
}

- (id)_focusMapSnapshotDebugInfoArray
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(UIFocusUpdateContext *)self _focusMapSearchInfo];

  if (v3)
  {
    id v4 = [(UIFocusUpdateContext *)self _focusMapSearchInfo];
    uint64_t v5 = [v4 snapshots];

    if (v5)
    {
      uint64_t v6 = objc_getAssociatedObject(self, sel__focusMapSnapshotDebugInfoArray);
      if (!v6)
      {
        uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v8 = v5;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v20;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v20 != v11) {
                objc_enumerationMutation(v8);
              }
              long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
              long long v14 = [(UIFocusUpdateContext *)self _focusMapSearchInfo];
              uint64_t v15 = [v13 _debugInfoWithFocusMapSearchInfo:v14];

              [v7 addObject:v15];
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v10);
        }

        uint64_t v6 = (void *)[v7 copy];
        objc_setAssociatedObject(self, sel__focusMapSnapshotDebugInfoArray, v6, (void *)1);
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (v6) {
    long long v16 = v6;
  }
  else {
    long long v16 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v17 = v16;

  return v17;
}

- (UIImage)_regionMapSnapshotsVisualRepresentation
{
  regionMapSnapshotsVisualRepresentation = self->_regionMapSnapshotsVisualRepresentation;
  if (!regionMapSnapshotsVisualRepresentation)
  {
    id v4 = [(UIFocusUpdateContext *)self _focusMapSnapshotDebugInfoArray];
    if (v4)
    {
      uint64_t v5 = [(UIFocusUpdateContext *)self _focusMovement];
      +[_UIFocusMapSnapshotDebugInfo _summaryImageForDebugInfoArray:v4 forFocusMovementWithInfo:v5 scaleFactor:1.0];
    }
    else
    {
      uint64_t v5 = [(UIFocusUpdateContext *)self _publicRegionMapSnapshots];
      +[_UIFocusRegionMapSnapshot combinedVisualRepresentationForSnapshots:v5 scaleFactor:1.0];
    }
    uint64_t v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = self->_regionMapSnapshotsVisualRepresentation;
    self->_regionMapSnapshotsVisualRepresentation = v6;

    regionMapSnapshotsVisualRepresentation = self->_regionMapSnapshotsVisualRepresentation;
  }
  return regionMapSnapshotsVisualRepresentation;
}

- (id)debugQuickLookObject
{
  int64_t v3 = [(UIFocusUpdateContext *)self _focusMovement];

  if (v3)
  {
    uint64_t v4 = [(UIFocusUpdateContext *)self _regionMapSnapshotsVisualRepresentation];
    uint64_t v5 = (void *)v4;
    uint64_t v6 = @"Quick Look is unavailable for this focus update.";
    if (v4) {
      uint64_t v6 = (__CFString *)v4;
    }
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = @"Quick Look is only available for focus updates that represent a user-initiated focus movement.";
  }
  return v7;
}

- (id)description
{
  int64_t v3 = +[UIDescriptionBuilder descriptionBuilderWithObject:self];
  uint64_t v4 = [(UIFocusUpdateContext *)self previouslyFocusedItem];
  id v5 = (id)[v3 appendName:@"previouslyFocusedItem" object:v4 usingLightweightDescription:1];

  uint64_t v6 = [(UIFocusUpdateContext *)self nextFocusedItem];
  id v7 = (id)[v3 appendName:@"nextFocusedItem" object:v6 usingLightweightDescription:1];

  id v8 = _UIStringFromFocusHeading([(UIFocusUpdateContext *)self focusHeading]);
  id v9 = (id)[v3 appendName:@"focusHeading" object:v8];

  if ([(UIFocusUpdateContext *)self _groupFilter])
  {
    uint64_t v10 = _UIStringFromGroupFilter([(UIFocusUpdateContext *)self _groupFilter]);
    id v11 = (id)[v3 appendName:@"groupFilter" object:v10];
  }
  uint64_t v12 = [v3 string];

  return v12;
}

- (void)_setFocusGroupMap:(id)a3
{
}

- (_UIFocusBehavior)focusBehavior
{
  return self->_focusBehavior;
}

- (_UIFocusUpdateRequesting)_request
{
  return self->_request;
}

- (_UIFocusItemInfo)_sourceItemInfo
{
  return self->_sourceItemInfo;
}

- (_UIFocusMovementInfo)_focusMovement
{
  return self->_focusMovement;
}

- (_UIFocusMapSearchInfo)_focusMapSearchInfo
{
  return self->_focusMapSearchInfo;
}

- (UIFocusEnvironment)_initialDestinationEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_initialDestinationEnvironment);
  return (UIFocusEnvironment *)WeakRetained;
}

- (_UIFocusEnvironmentScrollableContainerTuple)_commonEnvironmentScrollableContainer
{
  return self->_commonEnvironmentScrollableContainer;
}

- (void)_setCommonEnvironmentScrollableContainer:(id)a3
{
}

- (double)_destinationViewDistanceOffscreen
{
  return self->_destinationViewDistanceOffscreen;
}

- (void)_setDestinationViewDistanceOffscreen:(double)a3
{
  self->_destinationViewDistanceOffscreen = a3;
}

- (BOOL)_isDeferredUpdate
{
  return self->_deferredUpdate;
}

- (void)_setDeferredUpdate:(BOOL)a3
{
  self->_deferredUpdate = a3;
}

- (void)_setRegionMapSnapshots:(id)a3
{
}

- (_UIDebugLogReport)_preferredFocusReport
{
  return self->_preferredFocusReport;
}

- (void)_setPreferredFocusReport:(id)a3
{
}

- (_UIDebugIssueReport)_validationReport
{
  return self->_validationReport;
}

- (void)_setValidationReport:(id)a3
{
}

- (UIFocusGuide)_focusedGuide
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusedGuide);
  return (UIFocusGuide *)WeakRetained;
}

- (BOOL)_focusRedirectedByGuide
{
  return self->_focusRedirectedByGuide;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusedGuide);
  objc_storeStrong((id *)&self->_validationReport, 0);
  objc_storeStrong((id *)&self->_preferredFocusReport, 0);
  objc_storeStrong((id *)&self->_regionMapSnapshots, 0);
  objc_storeStrong((id *)&self->_commonEnvironmentScrollableContainer, 0);
  objc_destroyWeak((id *)&self->_initialDestinationEnvironment);
  objc_storeStrong((id *)&self->_focusMapSearchInfo, 0);
  objc_storeStrong((id *)&self->_focusMovement, 0);
  objc_storeStrong((id *)&self->_sourceItemInfo, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_focusBehavior, 0);
  objc_storeStrong((id *)&self->_focusGroupMap, 0);
  objc_storeStrong((id *)&self->_regionMapSnapshotsVisualRepresentation, 0);
  objc_storeStrong((id *)&self->_nextFocusedGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_previouslyFocusedGroupIdentifier, 0);
  objc_destroyWeak((id *)&self->_commonAncestorEnvironment);
  objc_storeStrong((id *)&self->_destinationItemInfo, 0);
}

@end