@interface PXActionMenuController
- (BOOL)actionsAreExcludedWhenCustomized;
- (BOOL)enableSectionedMenus;
- (BOOL)sectionDisplaysInline:(int64_t)a3;
- (BOOL)shouldAllowPerformanceOfActionType:(id)a3;
- (NSArray)actionManagers;
- (NSArray)actions;
- (NSArray)activityActions;
- (NSArray)availableActionTypes;
- (NSArray)availableDestructiveActionTypes;
- (NSArray)availableHeaderActionTypes;
- (NSArray)availableInternalActionTypes;
- (NSOrderedSet)defaultActivityTypeOrder;
- (NSSet)disabledActionTypes;
- (NSSet)excludedActionTypes;
- (PXActionMenuController)init;
- (PXActionMenuController)initWithActionManagers:(id)a3;
- (UIAlertController)alertController;
- (id)_actionableActionManagerForActionType:(id)a3;
- (id)_menuElementsForSection:(int64_t)a3;
- (id)availableActionTypesInSection:(int64_t)a3;
- (id)iconForSection:(int64_t)a3;
- (id)titleForSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)_updateActionsIfNeeded;
- (void)_updateActionsUsingActivityTypeOrder;
- (void)_updateSectionedActions;
- (void)invalidateActions;
- (void)setDefaultActivityTypeOrder:(id)a3;
- (void)setDisabledActionTypes:(id)a3;
- (void)setExcludedActionTypes:(id)a3;
- (void)updateActions;
@end

@implementation PXActionMenuController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionManagers, 0);
  objc_storeStrong((id *)&self->_availableDestructiveActionTypes, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_excludedActionTypes, 0);
  objc_storeStrong((id *)&self->_disabledActionTypes, 0);
  objc_storeStrong((id *)&self->_defaultActivityTypeOrder, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_activityActions, 0);
}

- (BOOL)actionsAreExcludedWhenCustomized
{
  return self->_actionsAreExcludedWhenCustomized;
}

- (NSArray)actionManagers
{
  return self->_actionManagers;
}

- (NSArray)availableDestructiveActionTypes
{
  return self->_availableDestructiveActionTypes;
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (NSSet)excludedActionTypes
{
  return self->_excludedActionTypes;
}

- (NSSet)disabledActionTypes
{
  return self->_disabledActionTypes;
}

- (NSOrderedSet)defaultActivityTypeOrder
{
  return self->_defaultActivityTypeOrder;
}

- (void)invalidateActions
{
  self->_actionsNeedsUpdate = 1;
}

- (id)_menuElementsForSection:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = [(PXActionMenuController *)self availableActionTypesInSection:a3];
  v5 = [(PXActionMenuController *)self disabledActionTypes];
  v6 = [(PXActionMenuController *)self excludedActionTypes];
  v7 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v13, (void)v18) & 1) == 0
          && ([v5 containsObject:v13] & 1) == 0
          && [(PXActionMenuController *)self shouldAllowPerformanceOfActionType:v13])
        {
          v14 = [(PXActionMenuController *)self _actionableActionManagerForActionType:v13];
          v15 = v14;
          if (v14)
          {
            v16 = [v14 standardActionForActionType:v13];
            [v7 addObject:v16];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)_updateSectionedActions
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PXActionMenuController *)self numberOfSections];
  v4 = [MEMORY[0x1E4F1CA48] array];
  if (v3 >= 1)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0x1E4FB1000uLL;
    uint64_t v21 = v3;
    do
    {
      v7 = [(PXActionMenuController *)self _menuElementsForSection:v5];
      if ([v7 count])
      {
        id v8 = [(PXActionMenuController *)self titleForSection:v5];
        uint64_t v9 = [(PXActionMenuController *)self iconForSection:v5];
        BOOL v10 = [(PXActionMenuController *)self sectionDisplaysInline:v5];
        uint64_t v11 = *(void **)(v6 + 2416);
        if (v10)
        {
          v12 = [v11 menuWithTitle:v8 image:v9 identifier:0 options:1 children:v7];
        }
        else
        {
          uint64_t v13 = [v11 menuWithTitle:v8 image:v9 identifier:0 options:0 children:v7];
          v14 = *(void **)(v6 + 2416);
          v22[0] = v13;
          [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
          v15 = v4;
          v17 = unint64_t v16 = v6;
          v12 = [v14 menuWithTitle:&stru_1F00B0030 image:0 identifier:0 options:1 children:v17];

          unint64_t v6 = v16;
          v4 = v15;
          uint64_t v3 = v21;
        }
        [v4 addObject:v12];
      }
      ++v5;
    }
    while (v3 != v5);
  }
  activityActions = self->_activityActions;
  self->_activityActions = (NSArray *)MEMORY[0x1E4F1CBF0];

  long long v19 = (NSArray *)[v4 copy];
  actions = self->_actions;
  self->_actions = v19;
}

- (void)_updateActionsUsingActivityTypeOrder
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PXActionMenuController *)self availableActionTypes];
  v4 = [(PXActionMenuController *)self availableInternalActionTypes];
  uint64_t v5 = [(PXActionMenuController *)self availableHeaderActionTypes];
  unint64_t v6 = [(PXActionMenuController *)self availableDestructiveActionTypes];
  v71 = [(PXActionMenuController *)self disabledActionTypes];
  if ([(PXActionMenuController *)self actionsAreExcludedWhenCustomized])
  {
    v69 = 0;
  }
  else
  {
    v69 = [(PXActionMenuController *)self excludedActionTypes];
  }
  v63 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v73 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  BOOL v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
  uint64_t v11 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PXActionMenuController__updateActionsUsingActivityTypeOrder__block_invoke;
  aBlock[3] = &unk_1E5DBCBF8;
  aBlock[4] = self;
  id v12 = v11;
  id v112 = v12;
  SEL v113 = a2;
  v76 = (void (**)(void *, void *))_Block_copy(aBlock);
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __62__PXActionMenuController__updateActionsUsingActivityTypeOrder__block_invoke_3;
  v97[3] = &unk_1E5DBCC20;
  id v66 = v69;
  v67 = self;
  id v98 = v66;
  v99 = self;
  id v65 = v71;
  id v100 = v65;
  id v64 = v63;
  id v101 = v64;
  id v62 = v12;
  id v102 = v62;
  id v70 = v8;
  id v103 = v70;
  id v13 = v10;
  id v104 = v13;
  id v14 = v4;
  id v105 = v14;
  id v61 = v7;
  id v106 = v61;
  id v15 = v5;
  id v107 = v15;
  id v16 = v6;
  id v108 = v16;
  id v72 = v9;
  id v109 = v72;
  id v74 = v73;
  id v110 = v74;
  v17 = (void (**)(void *, void))_Block_copy(v97);
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v18 = v3;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v93 objects:v119 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v94;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v94 != v21) {
          objc_enumerationMutation(v18);
        }
        v17[2](v17, *(void *)(*((void *)&v93 + 1) + 8 * i));
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v93 objects:v119 count:16];
    }
    while (v20);
  }

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v23 = v14;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v89 objects:v118 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v90;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v90 != v26) {
          objc_enumerationMutation(v23);
        }
        v17[2](v17, *(void *)(*((void *)&v89 + 1) + 8 * j));
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v89 objects:v118 count:16];
    }
    while (v25);
  }

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v28 = v15;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v85 objects:v117 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v86;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v86 != v31) {
          objc_enumerationMutation(v28);
        }
        v17[2](v17, *(void *)(*((void *)&v85 + 1) + 8 * k));
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v85 objects:v117 count:16];
    }
    while (v30);
  }

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v33 = v16;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v81 objects:v116 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v82;
    do
    {
      for (uint64_t m = 0; m != v35; ++m)
      {
        if (*(void *)v82 != v36) {
          objc_enumerationMutation(v33);
        }
        v17[2](v17, *(void *)(*((void *)&v81 + 1) + 8 * m));
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v81 objects:v116 count:16];
    }
    while (v35);
  }

  v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v18, "count"));
  v39 = v67;
  v40 = [(PXActionMenuController *)v67 defaultActivityTypeOrder];
  uint64_t v41 = [v40 count];

  if (v41)
  {
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v42 = [(PXActionMenuController *)v67 defaultActivityTypeOrder];
    uint64_t v43 = [v42 countByEnumeratingWithState:&v77 objects:v115 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v78;
      do
      {
        for (uint64_t n = 0; n != v44; ++n)
        {
          if (*(void *)v78 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v77 + 1) + 8 * n)];
          if (v47) {
            [v38 addObject:v47];
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v77 objects:v115 count:16];
      }
      while (v44);
      v39 = v67;
    }
  }
  else
  {
    v42 = objc_msgSend(v13, "allValues", v23, v18);
    [v38 addObjectsFromArray:v42];
  }

  [v38 addObjectsFromArray:v74];
  v76[2](v76, v38);
  v48 = v70;
  if ([v70 count])
  {
    v49 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F00B0030 image:0 identifier:0 options:1 children:v70];
    [v38 insertObject:v49 atIndex:0];
  }
  if ([v72 count])
  {
    v50 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F00B0030 image:0 identifier:0 options:1 children:v72];
    [v38 addObject:v50];
  }
  if ([v61 count])
  {
    v68 = [MEMORY[0x1E4FB1818] systemImageNamed:@"apple.logo"];
    v51 = [MEMORY[0x1E4FB1970] menuWithTitle:@"Internal" image:v68 identifier:0 options:0 children:v61];
    v52 = (void *)MEMORY[0x1E4FB1970];
    v114 = v51;
    v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v114 count:1];
    v54 = [v52 menuWithTitle:&stru_1F00B0030 image:0 identifier:0 options:1 children:v53];
    [v38 addObject:v54];

    v48 = v70;
  }
  uint64_t v55 = [v64 copy];
  activityActions = v39->_activityActions;
  v39->_activityActions = (NSArray *)v55;

  uint64_t v57 = [v38 copy];
  actions = v39->_actions;
  v39->_actions = (NSArray *)v57;
}

void __62__PXActionMenuController__updateActionsUsingActivityTypeOrder__block_invoke(uint64_t a1, uint64_t a2)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__PXActionMenuController__updateActionsUsingActivityTypeOrder__block_invoke_2;
  v8[3] = &unk_1E5DBCBD0;
  v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v7;
  uint64_t v11 = v6;
  [v4 customizeActions:a2 withActionTypes:v8];
}

void __62__PXActionMenuController__updateActionsUsingActivityTypeOrder__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0
    && [*(id *)(a1 + 40) shouldAllowPerformanceOfActionType:v3])
  {
    v4 = [*(id *)(a1 + 40) _actionableActionManagerForActionType:v3];
    if (!v4 || ([*(id *)(a1 + 48) containsObject:v3] & 1) != 0) {
      goto LABEL_22;
    }
    id v5 = [v4 activityForActionType:v3];
    uint64_t v6 = [v5 activityType];
    if (v5) {
      [*(id *)(a1 + 56) addObject:v5];
    }
    uint64_t v7 = [v4 standardActionForActionType:v3];
    if (!v7)
    {
LABEL_21:

LABEL_22:
      goto LABEL_23;
    }
    [*(id *)(a1 + 64) setObject:v3 forKey:v7];
    id v8 = PLUIActionsGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138412802;
      id v13 = v3;
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      v17 = v7;
      _os_log_debug_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "actionType:%@ activityType:%@ action:%@", (uint8_t *)&v12, 0x20u);
    }

    if (v6 != @"PXActivityTypeSetAllLibrariesFilter"
      && v6 != @"PXActivityTypeSetPersonalLibraryFilter"
      && v6 != @"PXActivityTypeSetSharedLibraryFilter")
    {
      if (v6)
      {
        id v9 = [*(id *)(a1 + 40) defaultActivityTypeOrder];
        int v10 = [v9 containsObject:v6];

        if (v10)
        {
          [*(id *)(a1 + 80) setObject:v7 forKeyedSubscript:v6];
          goto LABEL_21;
        }
      }
      if ([*(id *)(a1 + 88) containsObject:v3])
      {
        uint64_t v11 = *(void **)(a1 + 96);
LABEL_20:
        [v11 addObject:v7];
        goto LABEL_21;
      }
      if (![*(id *)(a1 + 104) containsObject:v3])
      {
        if ([*(id *)(a1 + 112) containsObject:v3]) {
          uint64_t v11 = *(void **)(a1 + 120);
        }
        else {
          uint64_t v11 = *(void **)(a1 + 128);
        }
        goto LABEL_20;
      }
    }
    uint64_t v11 = *(void **)(a1 + 72);
    goto LABEL_20;
  }
LABEL_23:
}

id __62__PXActionMenuController__updateActionsUsingActivityTypeOrder__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) objectForKey:v3];
  if (!v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 40), @"PXActionMenuController.m", 180, @"couldn't determine action type for %@", v3 object file lineNumber description];
  }
  return v4;
}

- (void)_updateActionsIfNeeded
{
  if (self->_actionsNeedsUpdate)
  {
    self->_actionsNeedsUpdate = 0;
    [(PXActionMenuController *)self updateActions];
  }
}

- (id)_actionableActionManagerForActionType:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(PXActionMenuController *)self actionManagers];
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 canPerformActionType:v4])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)updateActions
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = PLUIActionsGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    id v5 = "-[PXActionMenuController updateActions]";
    _os_log_debug_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "=== %s ===", (uint8_t *)&v4, 0xCu);
  }

  if ([(PXActionMenuController *)self enableSectionedMenus]) {
    [(PXActionMenuController *)self _updateSectionedActions];
  }
  else {
    [(PXActionMenuController *)self _updateActionsUsingActivityTypeOrder];
  }
}

- (BOOL)sectionDisplaysInline:(int64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXActionMenuController.m", 122, @"Method %s is a responsibility of subclass %@", "-[PXActionMenuController sectionDisplaysInline:]", v7 object file lineNumber description];

  abort();
}

- (id)iconForSection:(int64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXActionMenuController.m", 118, @"Method %s is a responsibility of subclass %@", "-[PXActionMenuController iconForSection:]", v7 object file lineNumber description];

  abort();
}

- (id)titleForSection:(int64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXActionMenuController.m", 114, @"Method %s is a responsibility of subclass %@", "-[PXActionMenuController titleForSection:]", v7 object file lineNumber description];

  abort();
}

- (id)availableActionTypesInSection:(int64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXActionMenuController.m", 110, @"Method %s is a responsibility of subclass %@", "-[PXActionMenuController availableActionTypesInSection:]", v7 object file lineNumber description];

  abort();
}

- (int64_t)numberOfSections
{
  int v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXActionMenuController.m", 106, @"Method %s is a responsibility of subclass %@", "-[PXActionMenuController numberOfSections]", v6 object file lineNumber description];

  abort();
}

- (BOOL)enableSectionedMenus
{
  return 0;
}

- (BOOL)shouldAllowPerformanceOfActionType:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXActionMenuController.m", 98, @"Method %s is a responsibility of subclass %@", "-[PXActionMenuController shouldAllowPerformanceOfActionType:]", v8 object file lineNumber description];

  abort();
}

- (NSArray)availableHeaderActionTypes
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)availableInternalActionTypes
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)availableActionTypes
{
  int v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXActionMenuController.m", 86, @"Method %s is a responsibility of subclass %@", "-[PXActionMenuController availableActionTypes]", v6 object file lineNumber description];

  abort();
}

- (NSArray)actions
{
  [(PXActionMenuController *)self _updateActionsIfNeeded];
  actions = self->_actions;
  return actions;
}

- (NSArray)activityActions
{
  [(PXActionMenuController *)self _updateActionsIfNeeded];
  activityActions = self->_activityActions;
  return activityActions;
}

- (void)setExcludedActionTypes:(id)a3
{
  if (self->_excludedActionTypes != a3)
  {
    int v4 = (NSSet *)[a3 copy];
    excludedActionTypes = self->_excludedActionTypes;
    self->_excludedActionTypes = v4;

    [(PXActionMenuController *)self invalidateActions];
  }
}

- (void)setDisabledActionTypes:(id)a3
{
  if (self->_disabledActionTypes != a3)
  {
    int v4 = (NSSet *)[a3 copy];
    disabledActionTypes = self->_disabledActionTypes;
    self->_disabledActionTypes = v4;

    [(PXActionMenuController *)self invalidateActions];
  }
}

- (void)setDefaultActivityTypeOrder:(id)a3
{
  if (self->_defaultActivityTypeOrder != a3)
  {
    int v4 = (NSOrderedSet *)[a3 copy];
    defaultActivityTypeOrder = self->_defaultActivityTypeOrder;
    self->_defaultActivityTypeOrder = v4;

    [(PXActionMenuController *)self invalidateActions];
  }
}

- (PXActionMenuController)initWithActionManagers:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXActionMenuController;
  uint64_t v6 = [(PXActionMenuController *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_actionManagers, a3);
    [(PXActionMenuController *)v7 invalidateActions];
  }

  return v7;
}

- (PXActionMenuController)init
{
  int v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXActionMenuController.m", 34, @"%s is not available as initializer", "-[PXActionMenuController init]");

  abort();
}

@end