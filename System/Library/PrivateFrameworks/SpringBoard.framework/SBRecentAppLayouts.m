@interface SBRecentAppLayouts
+ (id)allowedHiddenApplicationBundleIdentifiers;
- (BOOL)_ignoresAppHiddenForDisplayItem:(id)a3;
- (BOOL)_isApplicationSupported:(id)a3;
- (BOOL)_isDisplayItemRestrictedOrUnsupported:(id)a3;
- (BOOL)_isExistingSceneIdentifierValidForClaimedMultiwindowSupportInDisplayItem:(id)a3;
- (BOOL)_loadStashedModelAtPath:(id)a3;
- (BOOL)_stashModelToPath:(id)a3;
- (BOOL)_transitionContextRepresentsAmbiguousLaunch:(id)a3 forApplicationSceneEntity:(id)a4;
- (SBRecentAppLayouts)init;
- (SBRecentAppLayouts)initWithUserDefaults:(id)a3 persister:(id)a4 iconController:(id)a5 applicationController:(id)a6 placeholderController:(id)a7 sceneManager:(id)a8;
- (SBRecentAppLayoutsDelegate)delegate;
- (id)_acquireAllowHiddenAppAssertionForBundleIdentifier:(id)a3 reason:(id)a4;
- (id)_changeDescriptionForFilteringAppLayouts:(id)a3 withDisplayItemTest:(id)a4;
- (id)_changeDescriptionForFilteringRestrictedOrUnsupportedAppsFromAppLayouts:(id)a3;
- (id)_changeDescriptionForFilteringRestrictedUnsupportedAndInvalidAppsFromAppLayouts:(id)a3;
- (id)_displayItemLayoutRolesFromLegacyPrefsForLoadedDisplayItems:(id)a3;
- (id)_legacyAppLayoutForItem:(id)a3 layoutRole:(int64_t)a4;
- (id)_legacyAppLayoutsForDisplayItems:(id)a3 layoutRolesMapping:(id)a4;
- (id)_migrateDisplayItemIfNeeded:(id)a3;
- (id)_nonPreferredDisplayItemLayoutAttributesMapForAppLayout:(id)a3;
- (id)_ppt_currentModel;
- (id)_ppt_loadStashedModel;
- (id)_recentDisplayItemsFromLegacyPrefs;
- (id)_recentsFromPrefs;
- (id)bestLastDisplayItemLayoutAttributesMapForAppLayout:(id)a3 displayOrdinal:(int64_t)a4;
- (id)mostRecentAppLayoutIncludingHiddenAppLayouts:(BOOL)a3 passingTest:(id)a4;
- (id)recentDisplayItemsForBundleIdentifier:(id)a3 includingHiddenAppLayouts:(BOOL)a4;
- (id)recentsForBundleIdentifier:(id)a3 includingHiddenAppLayouts:(BOOL)a4;
- (id)recentsIncludingHiddenAppLayouts:(BOOL)a3;
- (int64_t)_lastInteractionTime;
- (int64_t)_nextInteractionTime;
- (int64_t)_nonPreferredDisplayOrdinalForAppLayout:(id)a3;
- (void)_addAllAppsToModel;
- (void)_addAllowHiddenAppAssertionForBundleIdentifier:(id)a3 requestIdentifier:(id)a4;
- (void)_filterRestrictedOrUnsupportedAppsFromRecents;
- (void)_filterRestrictedUnsupportedAndInvalidAppsFromRecents;
- (void)_initializeRecents;
- (void)_persistSoon;
- (void)_persistSynchronously;
- (void)_ppt_setModel:(id)a3;
- (void)_removeAllowHiddenAppAssertionForBundleIdentifier:(id)a3 requestIdentifier:(id)a4;
- (void)_saveRecents;
- (void)_setRecents:(id)a3 notifyForChangeDescription:(id)a4;
- (void)_setUpStashedModelSettingsOutlets;
- (void)_validateAndUpdateRecents:(id)a3;
- (void)addAppLayout:(id)a3 afterAppLayout:(id)a4;
- (void)addAppLayout:(id)a3 atIndex:(unint64_t)a4;
- (void)addToFront:(id)a3;
- (void)dealloc;
- (void)hide:(id)a3;
- (void)noteDisplayItemLayoutAttributesMapChangedForAppLayout:(id)a3 displayOrdinal:(int64_t)a4;
- (void)remove:(id)a3;
- (void)removeAppLayouts:(id)a3;
- (void)replaceAppLayout:(id)a3 withAppLayout:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SBRecentAppLayouts

BOOL __34__SBRecentAppLayouts__saveRecents__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type]) {
    BOOL v3 = [v2 type] == 5;
  }
  else {
    BOOL v3 = 1;
  }

  return v3;
}

void __43__SBRecentAppLayouts_addAppLayout_atIndex___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([v5 type] && objc_msgSend(v5, "type") != 5)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"SBRecentAppLayouts.m" lineNumber:405 description:@"Only Apps may be added to app switcher model"];
  }
}

uint64_t __83__SBRecentAppLayouts__changeDescriptionForFilteringAppLayouts_withDisplayItemTest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

uint64_t __43__SBRecentAppLayouts_addAppLayout_atIndex___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) environment] == 1 && objc_msgSend(*(id *)(a1 + 40), "count") == 1)
  {
    int v7 = [*(id *)(a1 + 40) containsObject:v5];
    if (([v6 isHidden] & 1) == 0)
    {
      uint64_t v8 = [*(id *)(a1 + 32) environment];
      if (v8 != [v6 environment]) {
        int v7 = 0;
      }
    }
  }
  else
  {
    int v7 = [*(id *)(a1 + 40) containsObject:v5];
  }

  return v7 ^ 1u;
}

- (BOOL)_transitionContextRepresentsAmbiguousLaunch:(id)a3 forApplicationSceneEntity:(id)a4
{
  id v6 = a4;
  int v7 = [a3 request];
  uint64_t v8 = [v7 source];

  v9 = [v6 actions];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    BOOL v11 = 0;
    goto LABEL_20;
  }
  if ((unint64_t)(v8 - 3) >= 0x33)
  {
    BOOL v11 = 0;
    if (!v6) {
      goto LABEL_20;
    }
  }
  else
  {
    BOOL v11 = 0;
    if (((0x5040100000301uLL >> (v8 - 3)) & 1) != 0 || !v6) {
      goto LABEL_20;
    }
  }
  if (v8 != 52)
  {
    v12 = [v6 application];
    if (([v12 isWebApplication] & 1) != 0
      || ([v12 info],
          v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = [v13 supportsMultiwindow],
          v13,
          !v14))
    {
      BOOL v11 = 0;
    }
    else
    {
      v15 = [v12 bundleIdentifier];
      v16 = [(SBRecentAppLayouts *)self recentDisplayItemsForBundleIdentifier:v15 includingHiddenAppLayouts:0];
      unint64_t v17 = [v16 count];

      v18 = [(SBRecentAppLayouts *)self recentsForBundleIdentifier:v15 includingHiddenAppLayouts:0];
      unint64_t v19 = [v18 count];

      BOOL v11 = v17 > 1 && v19 > 1;
    }
  }
LABEL_20:

  return v11;
}

- (id)recentDisplayItemsForBundleIdentifier:(id)a3 includingHiddenAppLayouts:(BOOL)a4
{
  uint64_t v4 = 48;
  if (a4) {
    uint64_t v4 = 40;
  }
  return (id)[*(id *)((char *)&self->super.isa + v4) objectForKey:a3];
}

- (id)recentsForBundleIdentifier:(id)a3 includingHiddenAppLayouts:(BOOL)a4
{
  uint64_t v4 = 32;
  if (a4) {
    uint64_t v4 = 24;
  }
  return (id)[*(id *)((char *)&self->super.isa + v4) objectForKey:a3];
}

- (id)recentsIncludingHiddenAppLayouts:(BOOL)a3
{
  uint64_t v3 = 16;
  if (a3) {
    uint64_t v3 = 8;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

uint64_t __43__SBRecentAppLayouts_addAppLayout_atIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isDisplayItemRestrictedOrUnsupported:a2] ^ 1;
}

- (BOOL)_isDisplayItemRestrictedOrUnsupported:(id)a3
{
  id v4 = a3;
  if (![v4 type])
  {
    id v6 = [v4 bundleIdentifier];
    if (!v6)
    {
      char v5 = 0;
LABEL_18:

      goto LABEL_19;
    }
    int v7 = [(SBIconController *)self->_iconController model];
    uint64_t v8 = [v7 expectedIconForDisplayIdentifier:v6];
    BOOL v9 = [(SBRecentAppLayouts *)self _isApplicationSupported:v6];
    if (([v7 isIconVisible:v8] & 1) == 0)
    {
      uint64_t v10 = [v8 application];
      if (v10)
      {
        BOOL v11 = v10;
        v12 = [v10 info];
        char v13 = [v12 isAppClip];

        if ((v13 & 1) == 0)
        {
LABEL_13:
          BOOL v18 = [(SBRecentAppLayouts *)self _ignoresAppHiddenForDisplayItem:v4];
          goto LABEL_14;
        }
      }
      else
      {
        placeholderController = self->_placeholderController;
        v15 = [v4 bundleIdentifier];
        v16 = [(SBApplicationPlaceholderController *)placeholderController placeholderForDisplayID:v15];

        if (!v16) {
          goto LABEL_13;
        }
        char v17 = [v16 isAppClip];

        if ((v17 & 1) == 0) {
          goto LABEL_13;
        }
        BOOL v9 = 1;
      }
    }
    BOOL v18 = 1;
LABEL_14:
    unint64_t v19 = [(SBApplicationController *)self->_applicationController restrictionController];
    char v20 = [v19 isApplicationIdentifierRestricted:v6];

    if (v18) {
      char v5 = v20 | !v9;
    }
    else {
      char v5 = 1;
    }

    goto LABEL_18;
  }
  char v5 = 0;
LABEL_19:

  return v5;
}

- (BOOL)_isApplicationSupported:(id)a3
{
  uint64_t v3 = [(SBApplicationController *)self->_applicationController applicationWithBundleIdentifier:a3];
  id v4 = v3;
  if (v3)
  {
    char v5 = [v3 info];
    char v6 = [v5 supports64Bit];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)addToFront:(id)a3
{
}

- (id)mostRecentAppLayoutIncludingHiddenAppLayouts:(BOOL)a3 passingTest:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = __Block_byref_object_copy__130;
  BOOL v18 = __Block_byref_object_dispose__130;
  id v19 = 0;
  int v7 = [(SBRecentAppLayouts *)self recentsIncludingHiddenAppLayouts:v4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__SBRecentAppLayouts_mostRecentAppLayoutIncludingHiddenAppLayouts_passingTest___block_invoke;
  v11[3] = &unk_1E6B0EAB8;
  id v8 = v6;
  id v12 = v8;
  char v13 = &v14;
  [v7 enumerateObjectsUsingBlock:v11];

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __42__SBRecentAppLayouts__lastInteractionTime__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "layoutAttributesForItem:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 lastInteractionTime];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  if (v2 > v4) {
    uint64_t v4 = v2;
  }
  *(void *)(v3 + 24) = v4;
}

- (int64_t)_nextInteractionTime
{
  return [(SBRecentAppLayouts *)self _lastInteractionTime] + 1;
}

- (int64_t)_lastInteractionTime
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  uint64_t v2 = [(SBRecentAppLayouts *)self recentsIncludingHiddenAppLayouts:1];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__SBRecentAppLayouts__lastInteractionTime__block_invoke;
  v5[3] = &unk_1E6AFB450;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __42__SBRecentAppLayouts__lastInteractionTime__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__SBRecentAppLayouts__lastInteractionTime__block_invoke_2;
  v6[3] = &unk_1E6AFD168;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  [v5 enumerate:v6];
}

void __79__SBRecentAppLayouts_mostRecentAppLayoutIncludingHiddenAppLayouts_passingTest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __83__SBRecentAppLayouts__changeDescriptionForFilteringAppLayouts_withDisplayItemTest___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  char v13 = __83__SBRecentAppLayouts__changeDescriptionForFilteringAppLayouts_withDisplayItemTest___block_invoke_2;
  uint64_t v14 = &unk_1E6B0EA18;
  id v16 = *(id *)(a1 + 64);
  id v6 = v5;
  id v15 = v6;
  id v7 = [v6 appLayoutWithItemsPassingTest:&v11];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  if (WeakRetained) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    if (objc_msgSend(v7, "isEqual:", v6, v11, v12, v13, v14)) {
      goto LABEL_8;
    }
    uint64_t v10 = [WeakRetained recentAppLayouts:*(void *)(a1 + 32) willReplaceAppLayout:v6 proposedReplacementAppLayout:v7];

    id v7 = (void *)v10;
  }
  if (!v7)
  {
    [*(id *)(a1 + 40) addIndex:a3];
    goto LABEL_11;
  }
LABEL_8:
  if ((objc_msgSend(v6, "isEqual:", v7, v11, v12, v13, v14) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "addIndex:", a3 - objc_msgSend(*(id *)(a1 + 40), "count"));
    [*(id *)(a1 + 56) replaceObjectAtIndex:a3 withObject:v7];
  }
LABEL_11:
}

- (void)_saveRecents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_allRecents;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "appLayoutWithItemsPassingTest:", &__block_literal_global_418, (void)v12);
        if (v10)
        {
          uint64_t v11 = [(SBRecentAppLayouts *)self _nonPreferredDisplayItemLayoutAttributesMapForAppLayout:v10];
          [v10 setCachedDisplayItemLayoutAttributesForNonPreferredDisplay:v11];
          [v3 addObject:v10];
          if (v7) {
            char v7 = 1;
          }
          else {
            char v7 = [v10 isHidden] ^ 1;
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }

  [(SBRecentAppLayoutsPersister *)self->_persister setRecents:v3];
  if ((v7 & 1) == 0) {
    [(SBRecentAppLayoutsPersister *)self->_persister syncToDiskSoonIfDirty];
  }
}

- (void)addAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  v47[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"SBRecentAppLayouts.m", 386, @"Invalid parameter not satisfying: %@", @"inAppLayout != nil" object file lineNumber description];
  }
  if ([v7 type])
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"SBRecentAppLayouts.m" lineNumber:387 description:@"Only Apps may be added to app switcher model"];
  }
  uint64_t v8 = self->_allRecents;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __43__SBRecentAppLayouts_addAppLayout_atIndex___block_invoke;
  v45[3] = &unk_1E6AF4B38;
  v45[4] = self;
  id v9 = [v7 appLayoutWithItemsPassingTest:v45];
  if (a4
    || ([(NSMutableArray *)v8 firstObject],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isEqual:v9],
        v10,
        (v11 & 1) == 0))
  {
    if (v9)
    {
      long long v12 = [(SBRecentAppLayouts *)self delegate];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __43__SBRecentAppLayouts_addAppLayout_atIndex___block_invoke_2;
      v44[3] = &unk_1E6AFA8B0;
      v44[4] = self;
      v44[5] = a2;
      [v9 enumerate:v44];
      id v13 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      id v38 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      id v36 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      long long v14 = (void *)[(NSMutableArray *)v8 mutableCopy];
      unint64_t v15 = [v14 count];
      if (v15 >= 0x64)
      {
        unint64_t v16 = v15 - 1;
        do
        {
          uint64_t v17 = [v14 objectAtIndex:v16];
          [v12 recentAppLayouts:self didRemoveAppLayoutForFallingOffList:v17];
          [v14 removeObjectAtIndex:v16];
          [v13 addIndex:v16];

          --v16;
        }
        while (v16 > 0x62);
      }
      BOOL v18 = [v9 allItems];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __43__SBRecentAppLayouts_addAppLayout_atIndex___block_invoke_3;
      v41[3] = &unk_1E6B0EA68;
      id v9 = v9;
      id v42 = v9;
      id v35 = v18;
      id v43 = v35;
      v37 = [(SBRecentAppLayouts *)self _changeDescriptionForFilteringAppLayouts:v14 withDisplayItemTest:v41];
      id v19 = [v37 objectForKeyedSubscript:@"SBRecentAppLayoutsDidRemoveAtIndexesKey"];
      if (v19)
      {
        [v13 addIndexes:v19];
      }
      else
      {
        char v20 = [MEMORY[0x1E4F28D60] indexSet];
        [v13 addIndexes:v20];
      }
      v21 = [v37 objectForKeyedSubscript:@"SBRecentAppLayoutsDidModifyAtIndexesKey"];
      if (v21)
      {
        [v38 addIndexes:v21];
      }
      else
      {
        v22 = [MEMORY[0x1E4F28D60] indexSet];
        [v38 addIndexes:v22];
      }
      if (v12)
      {
        id v23 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        v24 = [v14 objectsAtIndexes:v38];
        v25 = (void *)[v23 initWithArray:v24];

        id v26 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        v34 = v8;
        v27 = [(NSMutableArray *)v8 objectsAtIndexes:v13];
        v28 = (void *)[v26 initWithArray:v27];

        if ([v28 containsObject:v9])
        {
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __43__SBRecentAppLayouts_addAppLayout_atIndex___block_invoke_4;
          v39[3] = &unk_1E6AF4B60;
          id v40 = v9;
          uint64_t v29 = objc_msgSend(v28, "bs_filter:", v39);

          v28 = (void *)v29;
        }
        uint64_t v30 = [v12 recentAppLayouts:self willAddAppLayout:v9 replacingAppLayouts:v25 removingAppLayouts:v28];

        id v9 = (id)v30;
        uint64_t v8 = v34;
      }
      [v14 insertObject:v9 atIndex:a4];
      [v36 addIndex:a4];
      [v38 shiftIndexesStartingAtIndex:a4 by:1];
      v46[0] = @"SBRecentAppLayoutsDidInsertAtIndexesKey";
      v46[1] = @"SBRecentAppLayoutsDidModifyAtIndexesKey";
      v47[0] = v36;
      v47[1] = v38;
      v46[2] = @"SBRecentAppLayoutsDidRemoveAtIndexesKey";
      v47[2] = v13;
      v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:3];
      [(SBRecentAppLayouts *)self _setRecents:v14 notifyForChangeDescription:v31];
    }
  }
}

- (id)_nonPreferredDisplayItemLayoutAttributesMapForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[_SBDisplayItemLayoutAttributesMapKey alloc] initWithAppLayout:v4 displayOrdinal:[(SBRecentAppLayouts *)self _nonPreferredDisplayOrdinalForAppLayout:v4]];

  uint64_t v6 = [(NSMapTable *)self->_layoutAttributesMapsByKey objectForKey:v5];

  return v6;
}

- (void)noteDisplayItemLayoutAttributesMapChangedForAppLayout:(id)a3 displayOrdinal:(int64_t)a4
{
  id v11 = a3;
  if (!v11)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBRecentAppLayouts.m", 546, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];
  }
  id v7 = [[_SBDisplayItemLayoutAttributesMapKey alloc] initWithAppLayout:v11 displayOrdinal:a4];
  layoutAttributesMapsByKey = self->_layoutAttributesMapsByKey;
  id v9 = [v11 itemsToLayoutAttributesMap];
  [(NSMapTable *)layoutAttributesMapsByKey setObject:v9 forKey:v7];
}

- (int64_t)_nonPreferredDisplayOrdinalForAppLayout:(id)a3
{
  return [a3 preferredDisplayOrdinal] == 0;
}

- (SBRecentAppLayoutsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBRecentAppLayoutsDelegate *)WeakRetained;
}

- (void)_setRecents:(id)a3 notifyForChangeDescription:(id)a4
{
  id v20 = a3;
  id v17 = a4;
  objc_storeStrong((id *)&self->_allRecents, a3);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  allRecents = self->_allRecents;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__SBRecentAppLayouts__setRecents_notifyForChangeDescription___block_invoke;
  v21[3] = &unk_1E6B0E9F0;
  id v19 = v7;
  id v22 = v19;
  id v18 = v10;
  id v23 = v18;
  id v13 = v11;
  id v24 = v13;
  id v14 = v8;
  id v25 = v14;
  id v15 = v9;
  id v26 = v15;
  v27 = self;
  [(NSMutableArray *)allRecents enumerateObjectsUsingBlock:v21];
  objc_storeStrong((id *)&self->_unhiddenRecents, v7);
  objc_storeStrong((id *)&self->_allRecentsForBundleIdentifiers, v8);
  objc_storeStrong((id *)&self->_unhiddenRecentsForBundleIdentifiers, v9);
  objc_storeStrong((id *)&self->_allRecentDisplayItemsForBundleIdentifiers, v10);
  objc_storeStrong((id *)&self->_unhiddenRecentDisplayItemsForBundleIdentifiers, v11);
  [(SBRecentAppLayouts *)self _saveRecents];
  if (v17)
  {
    unint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 postNotificationName:@"SBRecentAppLayoutsDidChangeNotification" object:self userInfo:v17];
  }
}

- (id)_changeDescriptionForFilteringAppLayouts:(id)a3 withDisplayItemTest:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __83__SBRecentAppLayouts__changeDescriptionForFilteringAppLayouts_withDisplayItemTest___block_invoke;
  id v19 = &unk_1E6B0EA40;
  id v23 = v6;
  id v24 = v7;
  id v20 = self;
  id v21 = v8;
  id v22 = v9;
  id v10 = v6;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  [v10 enumerateObjectsUsingBlock:&v16];
  objc_msgSend(v10, "removeObjectsAtIndexes:", v12, v16, v17, v18, v19, v20);
  v25[0] = @"SBRecentAppLayoutsDidModifyAtIndexesKey";
  v25[1] = @"SBRecentAppLayoutsDidRemoveAtIndexesKey";
  v26[0] = v11;
  v26[1] = v12;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

  return v14;
}

void __61__SBRecentAppLayouts__setRecents_notifyForChangeDescription___block_invoke(id *a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 isHidden] & 1) == 0) {
    [a1[4] addObject:v3];
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = [v3 allItems];
  uint64_t v5 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v10 = [v9 bundleIdentifier];
        [v4 addObject:v10];
        id v11 = [a1[5] objectForKey:v10];
        id v12 = [a1[6] objectForKey:v10];
        if (!v11)
        {
          id v11 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
          [a1[5] setObject:v11 forKey:v10];
        }
        [v11 addObject:v9];
        if (([v3 isHidden] & 1) == 0)
        {
          if (!v12)
          {
            id v12 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
            [a1[6] setObject:v12 forKey:v10];
          }
          [v12 addObject:v9];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v6);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * j);
        id v19 = [a1[7] objectForKey:v18];
        id v20 = [a1[8] objectForKey:v18];
        if (!v19)
        {
          id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [a1[7] setObject:v19 forKey:v18];
        }
        [v19 addObject:v3];
        if (([v3 isHidden] & 1) == 0)
        {
          if (!v20)
          {
            id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [a1[8] setObject:v20 forKey:v18];
          }
          [v20 addObject:v3];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v15);
  }

  id v21 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v22 = [v21 userInterfaceIdiom];

  if ((v22 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v23 = -[_SBDisplayItemLayoutAttributesMapKey initWithAppLayout:displayOrdinal:]([_SBDisplayItemLayoutAttributesMapKey alloc], "initWithAppLayout:displayOrdinal:", v3, [v3 preferredDisplayOrdinal]);
    id v24 = [*((id *)a1[9] + 8) objectForKey:v23];
    if (!v24)
    {
      id v25 = (void *)*((void *)a1[9] + 8);
      id v26 = [v3 itemsToLayoutAttributesMap];
      [v25 setObject:v26 forKey:v23];
    }
    v27 = [v3 cachedDisplayItemLayoutAttributesForNonPreferredDisplay];
    if (v27)
    {
      v28 = -[_SBDisplayItemLayoutAttributesMapKey initWithAppLayout:displayOrdinal:]([_SBDisplayItemLayoutAttributesMapKey alloc], "initWithAppLayout:displayOrdinal:", v3, [a1[9] _nonPreferredDisplayOrdinalForAppLayout:v3]);

      uint64_t v29 = [*((id *)a1[9] + 8) objectForKey:v28];

      if (!v29) {
        [*((id *)a1[9] + 8) setObject:v27 forKey:v28];
      }
      [v3 setCachedDisplayItemLayoutAttributesForNonPreferredDisplay:0];
      id v24 = (void *)v29;
    }
    else
    {
      v28 = v23;
    }
  }
}

- (SBRecentAppLayouts)initWithUserDefaults:(id)a3 persister:(id)a4 iconController:(id)a5 applicationController:(id)a6 placeholderController:(id)a7 sceneManager:(id)a8
{
  id v16 = a3;
  id v35 = a4;
  id v34 = a5;
  id v33 = a6;
  id v32 = a7;
  id v17 = a8;
  v38.receiver = self;
  v38.super_class = (Class)SBRecentAppLayouts;
  uint64_t v18 = [(SBRecentAppLayouts *)&v38 init];
  if (v18)
  {
    kdebug_trace();
    if (!v16)
    {
      long long v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2, v18, @"SBRecentAppLayouts.m", 144, @"Invalid parameter not satisfying: %@", @"defaults" object file lineNumber description];
    }
    objc_storeStrong((id *)&v18->_defaults, a3);
    objc_storeStrong((id *)&v18->_iconController, a5);
    objc_storeStrong((id *)&v18->_applicationController, a6);
    objc_storeStrong((id *)&v18->_placeholderController, a7);
    objc_storeStrong((id *)&v18->_sceneManager, a8);
    objc_storeStrong((id *)&v18->_persister, a4);
    id v19 = (NSMapTable *)objc_alloc_init(MEMORY[0x1E4F28E10]);
    layoutAttributesMapsByKey = v18->_layoutAttributesMapsByKey;
    v18->_layoutAttributesMapsByKey = v19;

    [(SBRecentAppLayouts *)v18 _initializeRecents];
    id v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v22 = *MEMORY[0x1E4FA66F8];
    id v23 = [(SBIconController *)v18->_iconController model];
    [v21 addObserver:v18 selector:sel__iconVisibilityDidChange_ name:v22 object:v23];

    id v24 = [(SBApplicationController *)v18->_applicationController restrictionController];
    [v24 addObserver:v18];

    id v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v18 selector:sel__installedApplicationsDidChange_ name:@"SBInstalledApplicationsDidChangeNotification" object:v18->_applicationController];

    [(SBAppSwitcherDefaults *)v18->_defaults clearLegacyDefaults];
    [(SBRecentAppLayouts *)v18 _setUpStashedModelSettingsOutlets];
    objc_initWeak(&location, v18);
    id v26 = MEMORY[0x1E4F14428];
    v27 = [NSString stringWithFormat:@"SpringBoard - SBRecentAppLayouts - %@", v18];
    objc_copyWeak(&v36, &location);
    uint64_t v28 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureInvalidatable = v18->_stateCaptureInvalidatable;
    v18->_stateCaptureInvalidatable = (BSInvalidatable *)v28;

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

  return v18;
}

id __125__SBRecentAppLayouts_initWithUserDefaults_persister_iconController_applicationController_placeholderController_sceneManager___block_invoke(uint64_t a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (__CFString **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[1];
    if (!v3) {
      id v3 = @"<nil>";
    }
    v8[0] = @"recents";
    v8[1] = @"recents by bundle IDs";
    id v4 = WeakRetained[3];
    if (!v4) {
      id v4 = @"<nil>";
    }
    v9[0] = v3;
    v9[1] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
    uint64_t v6 = [v5 debugDescription];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (SBRecentAppLayouts)init
{
  id v3 = +[SBDefaults localDefaults];
  id v4 = [v3 appSwitcherDefaults];
  uint64_t v5 = [SBRecentAppLayoutsPersister alloc];
  if (SBRecentAppLayoutsPersistenceURL___onceToken != -1) {
    dispatch_once(&SBRecentAppLayoutsPersistenceURL___onceToken, &__block_literal_global_288);
  }
  uint64_t v6 = [(SBRecentAppLayoutsPersister *)v5 initWithPersistenceURL:SBRecentAppLayoutsPersistenceURL___persistenceURL];
  uint64_t v7 = +[SBIconController sharedInstance];
  id v8 = +[SBApplicationController sharedInstance];
  id v9 = +[SBApplicationPlaceholderController sharedInstance];
  id v10 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v11 = [(SBRecentAppLayouts *)self initWithUserDefaults:v4 persister:v6 iconController:v7 applicationController:v8 placeholderController:v9 sceneManager:v10];

  return v11;
}

- (void)dealloc
{
  id v3 = [(SBApplicationController *)self->_applicationController restrictionController];
  [v3 removeObserver:self];

  [(BSInvalidatable *)self->_stateCaptureInvalidatable invalidate];
  v4.receiver = self;
  v4.super_class = (Class)SBRecentAppLayouts;
  [(SBRecentAppLayouts *)&v4 dealloc];
}

- (void)_initializeRecents
{
  if ([(SBRecentAppLayoutsPersister *)self->_persister initializedNewStoreOnDisk]) {
    [(SBRecentAppLayouts *)self _recentsFromPrefs];
  }
  else {
  id v3 = [(SBRecentAppLayoutsPersister *)self->_persister recents];
  }
  id v5 = (id)[v3 mutableCopy];

  [(SBRecentAppLayouts *)self _validateAndUpdateRecents:v5];
  id v4 = [(SBRecentAppLayouts *)self _changeDescriptionForFilteringRestrictedOrUnsupportedAppsFromAppLayouts:v5];
  [(SBRecentAppLayouts *)self _setRecents:v5 notifyForChangeDescription:0];
}

- (void)_persistSoon
{
}

- (void)_persistSynchronously
{
}

uint64_t __43__SBRecentAppLayouts_addAppLayout_atIndex___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)] ^ 1;
}

- (void)addAppLayout:(id)a3 afterAppLayout:(id)a4
{
  id v9 = a3;
  uint64_t v7 = [(NSMutableArray *)self->_allRecents indexOfObject:a4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBRecentAppLayouts.m" lineNumber:480 description:@"App layout not found"];
  }
  [(SBRecentAppLayouts *)self addAppLayout:v9 atIndex:v7 + 1];
}

- (void)replaceAppLayout:(id)a3 withAppLayout:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBRecentAppLayouts.m", 485, @"Invalid parameter not satisfying: %@", @"inNewAppLayout != nil" object file lineNumber description];
  }
  if ([v8 type])
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"SBRecentAppLayouts.m" lineNumber:486 description:@"Only Apps may be added to app switcher model"];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __53__SBRecentAppLayouts_replaceAppLayout_withAppLayout___block_invoke;
  v19[3] = &unk_1E6AF4B38;
  v19[4] = self;
  id v9 = [v8 appLayoutWithItemsPassingTest:v19];
  id v10 = self->_allRecents;
  id v11 = v10;
  if (v10)
  {
    uint64_t v12 = [(NSMutableArray *)v10 indexOfObject:v7];
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = v12;
      uint64_t v14 = (void *)[(NSMutableArray *)v11 mutableCopy];
      [v14 replaceObjectAtIndex:v13 withObject:v9];
      id v20 = @"SBRecentAppLayoutsDidModifyAtIndexesKey";
      uint64_t v15 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v13];
      v21[0] = v15;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      [(SBRecentAppLayouts *)self _setRecents:v14 notifyForChangeDescription:v16];
    }
  }
}

uint64_t __53__SBRecentAppLayouts_replaceAppLayout_withAppLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isDisplayItemRestrictedOrUnsupported:a2] ^ 1;
}

- (void)remove:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v7 count:1];

  -[SBRecentAppLayouts removeAppLayouts:](self, "removeAppLayouts:", v6, v7, v8);
}

- (void)removeAppLayouts:(id)a3
{
  allRecents = self->_allRecents;
  id v5 = a3;
  uint64_t v6 = (void *)[(NSMutableArray *)allRecents mutableCopy];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __39__SBRecentAppLayouts_removeAppLayouts___block_invoke;
  v16[3] = &unk_1E6AFD538;
  id v8 = v7;
  id v17 = v8;
  [v5 enumerateObjectsUsingBlock:v16];

  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __39__SBRecentAppLayouts_removeAppLayouts___block_invoke_2;
  uint64_t v14 = &unk_1E6B0EA90;
  id v15 = v8;
  id v9 = v8;
  id v10 = [(SBRecentAppLayouts *)self _changeDescriptionForFilteringAppLayouts:v6 withDisplayItemTest:&v11];
  -[SBRecentAppLayouts _setRecents:notifyForChangeDescription:](self, "_setRecents:notifyForChangeDescription:", v6, v10, v11, v12, v13, v14);
}

void __39__SBRecentAppLayouts_removeAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 allItems];
  [v2 addObjectsFromArray:v3];
}

uint64_t __39__SBRecentAppLayouts_removeAppLayouts___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (void)hide:(id)a3
{
  id v4 = a3;
  id v5 = [v4 appLayoutByModifyingHiddenState:1];
  [(SBRecentAppLayouts *)self remove:v4];

  [(SBRecentAppLayouts *)self addToFront:v5];
}

- (id)bestLastDisplayItemLayoutAttributesMapForAppLayout:(id)a3 displayOrdinal:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBRecentAppLayouts.m", 552, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];
  }
  id v8 = [[_SBDisplayItemLayoutAttributesMapKey alloc] initWithAppLayout:v7 displayOrdinal:a4];
  id v9 = [(NSMapTable *)self->_layoutAttributesMapsByKey objectForKey:v8];
  if (!v9)
  {
    id v9 = [v7 itemsToLayoutAttributesMap];
  }

  return v9;
}

- (id)_legacyAppLayoutForItem:(id)a3 layoutRole:(int64_t)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [SBAppLayout alloc];
  id v7 = [NSNumber numberWithInteger:a4];
  uint64_t v11 = v7;
  v12[0] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  id v9 = [(SBAppLayout *)v6 initWithItemsForLayoutRoles:v8 configuration:1 environment:1 preferredDisplayOrdinal:0];
  return v9;
}

- (id)_legacyAppLayoutsForDisplayItems:(id)a3 layoutRolesMapping:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__SBRecentAppLayouts__legacyAppLayoutsForDisplayItems_layoutRolesMapping___block_invoke;
  v10[3] = &unk_1E6B0C040;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(a3, "bs_map:", v10);

  return v8;
}

id __74__SBRecentAppLayouts__legacyAppLayoutsForDisplayItems_layoutRolesMapping___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];
  id v6 = objc_msgSend(v2, "_legacyAppLayoutForItem:layoutRole:", v4, objc_msgSend(v5, "unsignedIntegerValue"));

  return v6;
}

- (id)_recentsFromPrefs
{
  id v3 = [(SBAppSwitcherDefaults *)self->_defaults recentsPlistRepresentation];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = objc_msgSend(v7, "bs_map:", &__block_literal_global_91_2);

  if (!v8
    || ([MEMORY[0x1E4F1CA98] null],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v8 containsObject:v9],
        v9,
        v10))
  {
    id v11 = [(SBRecentAppLayouts *)self _recentDisplayItemsFromLegacyPrefs];
    uint64_t v12 = [(SBRecentAppLayouts *)self _displayItemLayoutRolesFromLegacyPrefsForLoadedDisplayItems:v11];
    uint64_t v13 = [(SBRecentAppLayouts *)self _legacyAppLayoutsForDisplayItems:v11 layoutRolesMapping:v12];

    id v8 = (void *)v13;
  }
  return v8;
}

SBAppLayout *__39__SBRecentAppLayouts__recentsFromPrefs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[SBAppLayout alloc] initWithPlistRepresentation:v2];

  return v3;
}

- (id)_recentDisplayItemsFromLegacyPrefs
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(SBAppSwitcherDefaults *)self->_defaults legacyRecentDisplayItems];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        int v10 = [[SBDisplayItem alloc] initWithLegacyPlistRepresentation:v9];
        if (v10)
        {
          [v3 addObject:v10];
        }
        else
        {
          id v11 = SBLogCommon();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v18 = v9;
            _os_log_error_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_ERROR, "bad app layout found in persistent storage, item=%{public}@", buf, 0xCu);
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_displayItemLayoutRolesFromLegacyPrefsForLoadedDisplayItems:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBAppSwitcherDefaults *)self->_defaults legacyRecentDisplayItemRoles];
  uint64_t v6 = objc_msgSend(v5, "bs_map:", &__block_literal_global_95_0);

  uint64_t v7 = [v6 count];
  if (v7 == [v4 count])
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithObjects:v6 forKeys:v4];
  }
  else
  {
    id v17 = v6;
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          long long v15 = [NSNumber numberWithInteger:1];
          [v8 setObject:v15 forKey:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    uint64_t v6 = v17;
  }

  return v8;
}

uint64_t __82__SBRecentAppLayouts__displayItemLayoutRolesFromLegacyPrefsForLoadedDisplayItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 integerValue];
  id v4 = &SBLayoutRolePrimary;
  uint64_t v5 = &SBLayoutRoleSide;
  if (v3 != 3) {
    uint64_t v5 = &SBLayoutRoleUndefined;
  }
  if (v3 != 2) {
    id v4 = v5;
  }
  uint64_t v6 = *v4;
  return [v2 numberWithInteger:v6];
}

- (void)_validateAndUpdateRecents:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__130;
  v43[4] = __Block_byref_object_dispose__130;
  id v44 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v37 = 0;
  objc_super v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__130;
  uint64_t v41 = __Block_byref_object_dispose__130;
  id v42 = 0;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__130;
  id v35 = __Block_byref_object_dispose__130;
  id v36 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__130;
  uint64_t v29 = __Block_byref_object_dispose__130;
  id v30 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke;
  v24[3] = &unk_1E6B0EB28;
  v24[4] = self;
  v24[5] = v43;
  v24[6] = &v37;
  v24[7] = &v31;
  v24[8] = &v25;
  uint64_t v14 = [v4 indexesOfObjectsPassingTest:v24];
  if ([(id)v38[5] count]) {
    [v4 replaceObjectsAtIndexes:v38[5] withObjects:v32[5]];
  }
  if ([v14 count]) {
    [v4 removeObjectsAtIndexes:v14];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = (id)v26[5];
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v46 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v9 = [v4 indexOfObject:v8];
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          [v4 removeObject:v8];
          long long v18 = 0u;
          long long v19 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          uint64_t v10 = [(id)v26[5] objectForKey:v8];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v45 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v17;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v17 != v12) {
                  objc_enumerationMutation(v10);
                }
                [v4 insertObject:*(void *)(*((void *)&v16 + 1) + 8 * j) atIndex:v9 + j];
              }
              uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v45 count:16];
              v9 += j;
            }
            while (v11);
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v46 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(v43, 8);
}

BOOL __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x3032000000;
  id v44 = __Block_byref_object_copy__130;
  v45 = __Block_byref_object_dispose__130;
  id v46 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = [v5 itemForLayoutRole:2];
  if (v6)
  {
    uint64_t v7 = [v5 itemForLayoutRole:1];

    if (!v7) {
      *((unsigned char *)v52 + 24) = 1;
    }
  }
  uint64_t v8 = [v5 allItems];
  if ([v8 count] == 1)
  {
    uint64_t v9 = [v5 configuration];

    uint64_t v10 = v52;
    if (v9 != 1) {
      *((unsigned char *)v52 + 24) = 1;
    }
  }
  else
  {

    uint64_t v10 = v52;
  }
  if (*((unsigned char *)v10 + 24))
  {
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    uint64_t v33 = __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2;
    id v34 = &unk_1E6B0EB00;
    uint64_t v35 = a1[4];
    uint64_t v37 = &v51;
    id v12 = v5;
    uint64_t v13 = a1[5];
    id v36 = v12;
    uint64_t v38 = v13;
    uint64_t v39 = &v47;
    id v40 = &v41;
    [v12 enumerate:&v31];
    uint64_t v14 = (SBAppLayout *)v12;
    long long v15 = v14;
    if (*((unsigned char *)v48 + 24))
    {
      long long v16 = [SBAppLayout alloc];
      long long v17 = [(SBAppLayout *)v16 initWithItemsForLayoutRoles:v42[5] configuration:[(SBAppLayout *)v15 configuration] environment:[(SBAppLayout *)v15 environment] preferredDisplayOrdinal:[(SBAppLayout *)v15 preferredDisplayOrdinal]];

      long long v18 = *(void **)(*(void *)(a1[6] + 8) + 40);
      if (v18)
      {
        [v18 addIndex:a3];
        [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:v17];
      }
      else
      {
        uint64_t v19 = [MEMORY[0x1E4F28E60] indexSetWithIndex:a3];
        uint64_t v20 = *(void *)(a1[6] + 8);
        long long v21 = *(void **)(v20 + 40);
        *(void *)(v20 + 40) = v19;

        uint64_t v22 = [MEMORY[0x1E4F1CA48] arrayWithObject:v17];
        uint64_t v23 = *(void *)(a1[7] + 8);
        id v24 = *(void **)(v23 + 40);
        *(void *)(v23 + 40) = v22;
      }
    }
    else
    {
      long long v17 = v14;
    }
    if (!*((unsigned char *)v52 + 24) && (SBFIsChamoisWindowingUIAvailable() & 1) == 0)
    {
      uint64_t v25 = -[SBAppLayout appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController:multitaskingSupported:](v17, "appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController:multitaskingSupported:", *(void *)(a1[4] + 88), [*(id *)(a1[4] + 72) medusaMultitaskingEnabled]);
      if (v25)
      {
        id v26 = *(void **)(*(void *)(a1[8] + 8) + 40);
        if (!v26)
        {
          uint64_t v27 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
          uint64_t v28 = *(void *)(a1[8] + 8);
          uint64_t v29 = *(void **)(v28 + 40);
          *(void *)(v28 + 40) = v27;

          id v26 = *(void **)(*(void *)(a1[8] + 8) + 40);
        }
        objc_msgSend(v26, "setObject:forKey:", v25, v17, v31, v32, v33, v34, v35);
      }
    }
    BOOL v11 = *((unsigned char *)v52 + 24) != 0;
  }
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  return v11;
}

void __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  uint64_t v8 = [v7 bundleIdentifier];
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 88) applicationWithBundleIdentifier:v8];
  if (!v9)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
    uint64_t v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2_cold_5();
    }
  }
  BOOL v11 = [v9 info];
  char v12 = [v11 isSignatureVersionSupported];

  if ((v12 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
    uint64_t v13 = SBLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2_cold_4();
    }
  }
  uint64_t v14 = *(void *)(a1 + 48);
  if (!*(unsigned char *)(*(void *)(v14 + 8) + 24))
  {
    BOOL IsValid = SBLayoutRoleIsValid(a2);
    uint64_t v14 = *(void *)(a1 + 48);
    if (!IsValid || a2 == 3)
    {
      *(unsigned char *)(*(void *)(v14 + 8) + 24) = 1;
      long long v16 = SBLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2_cold_3();
      }

      *a4 = 1;
      uint64_t v14 = *(void *)(a1 + 48);
    }
  }
  if (!*(unsigned char *)(*(void *)(v14 + 8) + 24))
  {
    id v17 = v9;
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
LABEL_18:
        long long v18 = [v17 bundleIdentifier];
        char v19 = [v18 isEqualToString:@"com.apple.webapp"];
LABEL_21:
        char v22 = v19;

        if ((v22 & 1) == 0)
        {
          if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) containsObject:v8])
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
            *a4 = 1;
            uint64_t v23 = SBLogCommon();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2_cold_2();
            }
          }
          else
          {
            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v8];
          }
        }
        char v24 = [*(id *)(a1 + 32) _isExistingSceneIdentifierValidForClaimedMultiwindowSupportInDisplayItem:v7];
        uint64_t v14 = *(void *)(a1 + 48);
        if ((v24 & 1) == 0)
        {
          *(unsigned char *)(*(void *)(v14 + 8) + 24) = 1;
          *a4 = 1;
          uint64_t v25 = SBLogCommon();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2_cold_1();
          }

          uint64_t v14 = *(void *)(a1 + 48);
        }
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v20 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v21 = [v20 userInterfaceIdiom];

      if (v21 != 1) {
        goto LABEL_18;
      }
    }
    long long v18 = [v17 info];
    char v19 = [v18 supportsMultiwindow];
    goto LABEL_21;
  }
LABEL_31:
  if (!*(unsigned char *)(*(void *)(v14 + 8) + 24))
  {
    id v26 = [*(id *)(a1 + 32) _migrateDisplayItemIfNeeded:v7];
    if (v26)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      uint64_t v27 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      uint64_t v28 = [NSNumber numberWithInteger:a2];
      uint64_t v29 = v27;
      id v30 = v26;
    }
    else
    {
      uint64_t v31 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      uint64_t v28 = [NSNumber numberWithInteger:a2];
      uint64_t v29 = v31;
      id v30 = v7;
    }
    [v29 setObject:v30 forKey:v28];
  }
}

- (BOOL)_isExistingSceneIdentifierValidForClaimedMultiwindowSupportInDisplayItem:(id)a3
{
  applicationController = self->_applicationController;
  id v4 = a3;
  id v5 = [v4 bundleIdentifier];
  uint64_t v6 = [(SBApplicationController *)applicationController applicationWithBundleIdentifier:v5];

  id v7 = [v4 uniqueIdentifier];

  if (v7 && (unint64_t v8 = [v7 length], v8 >= objc_msgSend(@"default", "length")))
  {
    uint64_t v10 = [v6 info];
    int v11 = [v10 supportsMultiwindow];

    int v9 = v11 ^ [v7 hasSuffix:@"default"];
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (void)_setUpStashedModelSettingsOutlets
{
  uint64_t v3 = +[SBAppSwitcherDomain rootSettings];
  id v4 = [v3 clearModelOutlet];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55__SBRecentAppLayouts__setUpStashedModelSettingsOutlets__block_invoke;
  v18[3] = &unk_1E6AF4AC0;
  v18[4] = self;
  id v5 = (id)[v4 addAction:v18];

  uint64_t v6 = [v3 stashModelOutlet];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__SBRecentAppLayouts__setUpStashedModelSettingsOutlets__block_invoke_2;
  v17[3] = &unk_1E6AF4AC0;
  v17[4] = self;
  id v7 = (id)[v6 addAction:v17];

  unint64_t v8 = [v3 loadModelOutlet];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__SBRecentAppLayouts__setUpStashedModelSettingsOutlets__block_invoke_3;
  v16[3] = &unk_1E6AF4AC0;
  void v16[4] = self;
  id v9 = (id)[v8 addAction:v16];

  uint64_t v10 = [v3 addAppsToModelOutlet];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__SBRecentAppLayouts__setUpStashedModelSettingsOutlets__block_invoke_4;
  v15[3] = &unk_1E6AF4AC0;
  v15[4] = self;
  id v11 = (id)[v10 addAction:v15];

  char v12 = [v3 addPPTAppsToModelOutlet];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__SBRecentAppLayouts__setUpStashedModelSettingsOutlets__block_invoke_5;
  v14[3] = &unk_1E6AF4AC0;
  v14[4] = self;
  id v13 = (id)[v12 addAction:v14];
}

uint64_t __55__SBRecentAppLayouts__setUpStashedModelSettingsOutlets__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAppLayouts:*(void *)(*(void *)(a1 + 32) + 8)];
}

void __55__SBRecentAppLayouts__setUpStashedModelSettingsOutlets__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  SBStashedModelPath();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _stashModelToPath:v2];
}

void __55__SBRecentAppLayouts__setUpStashedModelSettingsOutlets__block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  SBStashedModelPath();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _loadStashedModelAtPath:v2];
}

uint64_t __55__SBRecentAppLayouts__setUpStashedModelSettingsOutlets__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addAllAppsToModel];
}

id __55__SBRecentAppLayouts__setUpStashedModelSettingsOutlets__block_invoke_5(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_ppt_loadStashedModel");
}

- (BOOL)_stashModelToPath:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_allRecents;
  uint64_t v6 = [(NSMutableArray *)v5 bs_map:&__block_literal_global_101_0];
  id v7 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:100 options:0 error:0];
  id v14 = 0;
  char v8 = [v7 writeToFile:v4 options:1 error:&v14];
  id v9 = v14;
  if ((v8 & 1) == 0)
  {
    uint64_t v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [v7 length];
      id v13 = [v9 localizedDescription];
      *(_DWORD *)buf = 134218498;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      _os_log_error_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_ERROR, "Error writing data (len=%lu) to %@: %@", buf, 0x20u);
    }
  }

  return v8;
}

uint64_t __40__SBRecentAppLayouts__stashModelToPath___block_invoke(uint64_t a1, void *a2)
{
  return [a2 plistRepresentation];
}

- (BOOL)_loadStashedModelAtPath:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:a3];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:0];
    uint64_t v6 = v5;
    if (v5
      && (objc_msgSend(v5, "bs_map:", &__block_literal_global_106_1), (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      char v8 = (void *)v7;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v9 = (void *)[(NSMutableArray *)self->_allRecents copy];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v26 != v12) {
              objc_enumerationMutation(v9);
            }
            [(SBRecentAppLayouts *)self remove:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v11);
      }

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v14 = objc_msgSend(v8, "reverseObjectEnumerator", 0);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v22;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v22 != v17) {
              objc_enumerationMutation(v14);
            }
            [(SBRecentAppLayouts *)self addToFront:*(void *)(*((void *)&v21 + 1) + 8 * j)];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }
        while (v16);
      }

      BOOL v19 = 1;
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

SBAppLayout *__46__SBRecentAppLayouts__loadStashedModelAtPath___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[SBAppLayout alloc] initWithPlistRepresentation:v2];

  return v3;
}

- (void)_addAllAppsToModel
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  +[SBApplicationController sharedInstance];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v12 = long long v17 = 0u;
  obuint64_t j = [v12 allBundleIdentifiers];
  uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = +[SBDisplayItem displayItemWithType:0 bundleIdentifier:*(void *)(*((void *)&v14 + 1) + 8 * v6) uniqueIdentifier:0];
        char v8 = [SBAppLayout alloc];
        id v9 = [NSNumber numberWithInteger:1];
        id v18 = v9;
        BOOL v19 = v7;
        uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
        uint64_t v11 = [(SBAppLayout *)v8 initWithItemsForLayoutRoles:v10 configuration:1 environment:1 preferredDisplayOrdinal:0];

        [(SBRecentAppLayouts *)self addToFront:v11];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v4);
  }
}

- (id)_ppt_loadStashedModel
{
  uint64_t v3 = [(SBRecentAppLayouts *)self _ppt_currentModel];
  if (__sb__runningInSpringBoard())
  {
    int v4 = SBFEffectiveDeviceClass();
    uint64_t v5 = @"_internal_iPhonePPTSwitcherModel";
    if (v4 == 2) {
      uint64_t v5 = @"_internal_iPadPPTSwitcherModel";
    }
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];
    id v9 = @"_internal_iPhonePPTSwitcherModel";
    if (v8 == 1) {
      id v9 = @"_internal_iPadPPTSwitcherModel";
    }
    uint64_t v6 = v9;
  }
  uint64_t v10 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v11 = [v10 pathForResource:v6 ofType:@"plist"];

  [(SBRecentAppLayouts *)self _loadStashedModelAtPath:v11];
  return v3;
}

- (id)_ppt_currentModel
{
  id v2 = (void *)[(NSMutableArray *)self->_allRecents copy];
  return v2;
}

- (void)_ppt_setModel:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v5 = [(SBRecentAppLayouts *)self _ppt_currentModel];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          [(SBRecentAppLayouts *)self remove:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v7);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v10 = objc_msgSend(v4, "reverseObjectEnumerator", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          [(SBRecentAppLayouts *)self addToFront:*(void *)(*((void *)&v15 + 1) + 8 * v14++)];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v12);
    }
  }
}

- (id)_acquireAllowHiddenAppAssertionForBundleIdentifier:(id)a3 reason:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v9 = [v8 UUIDString];

  uint64_t v10 = SBLogAppSwitcher();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v24 = v6;
    __int16 v25 = 2114;
    id v26 = v7;
    __int16 v27 = 2114;
    long long v28 = v9;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Acquiring visibility assertion of %{public}@ for %{public}@ identifier %{public}@", buf, 0x20u);
  }

  id v11 = objc_alloc(MEMORY[0x1E4F4F838]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__SBRecentAppLayouts__acquireAllowHiddenAppAssertionForBundleIdentifier_reason___block_invoke;
  v17[3] = &unk_1E6B04EE0;
  objc_copyWeak(&v21, &location);
  id v12 = v6;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  id v14 = v7;
  id v20 = v14;
  long long v15 = (void *)[v11 initWithIdentifier:v13 forReason:v14 invalidationBlock:v17];
  [(SBRecentAppLayouts *)self _addAllowHiddenAppAssertionForBundleIdentifier:v12 requestIdentifier:v13];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v15;
}

void __80__SBRecentAppLayouts__acquireAllowHiddenAppAssertionForBundleIdentifier_reason___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _removeAllowHiddenAppAssertionForBundleIdentifier:*(void *)(a1 + 32) requestIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = SBLogAppSwitcher();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543874;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Invalidated visibility assertion of %{public}@ for %{public}@ identifier %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)_addAllowHiddenAppAssertionForBundleIdentifier:(id)a3 requestIdentifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  allowHiddenAppAssertions = self->_allowHiddenAppAssertions;
  if (!allowHiddenAppAssertions)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    __int16 v9 = self->_allowHiddenAppAssertions;
    self->_allowHiddenAppAssertions = v8;

    allowHiddenAppAssertions = self->_allowHiddenAppAssertions;
  }
  uint64_t v10 = [(NSMutableDictionary *)allowHiddenAppAssertions objectForKey:v11];
  if (!v10)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    [(NSMutableDictionary *)self->_allowHiddenAppAssertions setObject:v10 forKey:v11];
  }
  [v10 addObject:v6];
  [(SBRecentAppLayouts *)self _filterRestrictedOrUnsupportedAppsFromRecents];
}

- (void)_removeAllowHiddenAppAssertionForBundleIdentifier:(id)a3 requestIdentifier:(id)a4
{
  allowHiddenAppAssertions = self->_allowHiddenAppAssertions;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)allowHiddenAppAssertions objectForKey:a3];
  [v8 removeObject:v7];

  [(SBRecentAppLayouts *)self _filterRestrictedOrUnsupportedAppsFromRecents];
}

- (BOOL)_ignoresAppHiddenForDisplayItem:(id)a3
{
  id v4 = a3;
  allowHiddenAppAssertions = self->_allowHiddenAppAssertions;
  id v6 = [v4 bundleIdentifier];
  id v7 = [(NSMutableDictionary *)allowHiddenAppAssertions objectForKey:v6];
  if ([v7 count])
  {
    char v8 = 1;
  }
  else
  {
    __int16 v9 = [(id)objc_opt_class() allowedHiddenApplicationBundleIdentifiers];
    uint64_t v10 = [v4 bundleIdentifier];
    char v8 = [v9 containsObject:v10];
  }
  return v8;
}

- (id)_changeDescriptionForFilteringRestrictedOrUnsupportedAppsFromAppLayouts:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __94__SBRecentAppLayouts__changeDescriptionForFilteringRestrictedOrUnsupportedAppsFromAppLayouts___block_invoke;
  v5[3] = &unk_1E6B0EA90;
  v5[4] = self;
  uint64_t v3 = [(SBRecentAppLayouts *)self _changeDescriptionForFilteringAppLayouts:a3 withDisplayItemTest:v5];
  return v3;
}

uint64_t __94__SBRecentAppLayouts__changeDescriptionForFilteringRestrictedOrUnsupportedAppsFromAppLayouts___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isDisplayItemRestrictedOrUnsupported:a2] ^ 1;
}

- (void)_filterRestrictedOrUnsupportedAppsFromRecents
{
  id v4 = (id)[(NSMutableArray *)self->_allRecents mutableCopy];
  uint64_t v3 = [(SBRecentAppLayouts *)self _changeDescriptionForFilteringRestrictedOrUnsupportedAppsFromAppLayouts:v4];
  [(SBRecentAppLayouts *)self _setRecents:v4 notifyForChangeDescription:v3];
}

- (id)_changeDescriptionForFilteringRestrictedUnsupportedAndInvalidAppsFromAppLayouts:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __102__SBRecentAppLayouts__changeDescriptionForFilteringRestrictedUnsupportedAndInvalidAppsFromAppLayouts___block_invoke;
  v5[3] = &unk_1E6B0EA90;
  v5[4] = self;
  uint64_t v3 = [(SBRecentAppLayouts *)self _changeDescriptionForFilteringAppLayouts:a3 withDisplayItemTest:v5];
  return v3;
}

uint64_t __102__SBRecentAppLayouts__changeDescriptionForFilteringRestrictedUnsupportedAndInvalidAppsFromAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _isDisplayItemRestrictedOrUnsupported:v3]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [*(id *)(a1 + 32) _isExistingSceneIdentifierValidForClaimedMultiwindowSupportInDisplayItem:v3];
  }

  return v4;
}

- (void)_filterRestrictedUnsupportedAndInvalidAppsFromRecents
{
  id v3 = [(SBRecentAppLayouts *)self recentsIncludingHiddenAppLayouts:1];
  id v5 = (id)[v3 mutableCopy];

  uint64_t v4 = [(SBRecentAppLayouts *)self _changeDescriptionForFilteringRestrictedUnsupportedAndInvalidAppsFromAppLayouts:v5];
  [(SBRecentAppLayouts *)self _setRecents:v5 notifyForChangeDescription:v4];
}

+ (id)allowedHiddenApplicationBundleIdentifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.BarcodeScanner";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)_migrateDisplayItemIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueIdentifier];
  if ([v4 type] && objc_msgSend(v4, "type") != 5
    || ([v5 hasPrefix:@"sceneID"] & 1) != 0)
  {
    id v6 = 0;
  }
  else
  {
    applicationController = self->_applicationController;
    char v8 = [v4 bundleIdentifier];
    __int16 v9 = [(SBApplicationController *)applicationController applicationWithBundleIdentifier:v8];

    uint64_t v10 = [v9 _dataStore];
    id v11 = [(SBSceneManager *)self->_sceneManager newSceneIdentityForApplication:v9];
    uint64_t v12 = [v11 identifier];

    uint64_t v13 = [v10 sceneStoreForIdentifier:v12 creatingIfNecessary:1];
    id v14 = [v10 sceneStoreForIdentifier:v5 creatingIfNecessary:0];
    long long v15 = [v14 _data];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __50__SBRecentAppLayouts__migrateDisplayItemIfNeeded___block_invoke;
    v21[3] = &unk_1E6AF8E28;
    id v22 = v13;
    id v16 = v13;
    [v15 enumerateKeysAndObjectsUsingBlock:v21];

    [v16 setObject:v5 forKey:@"persistenceIdentifier"];
    [v10 removeSceneStoreForIdentifier:v5];
    long long v17 = [SBDisplayItem alloc];
    uint64_t v18 = [v4 type];
    id v19 = [v4 bundleIdentifier];
    id v6 = [(SBDisplayItem *)v17 initWithType:v18 bundleIdentifier:v19 uniqueIdentifier:v12];
  }
  return v6;
}

uint64_t __50__SBRecentAppLayouts__migrateDisplayItemIfNeeded___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_persister, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_placeholderController, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_iconController, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_layoutAttributesMapsByKey, 0);
  objc_storeStrong((id *)&self->_allowHiddenAppAssertions, 0);
  objc_storeStrong((id *)&self->_unhiddenRecentDisplayItemsForBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_allRecentDisplayItemsForBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_unhiddenRecentsForBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_allRecentsForBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_unhiddenRecents, 0);
  objc_storeStrong((id *)&self->_allRecents, 0);
}

void __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_34(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "bad app layout found in persistent storage, appLayout=%{public}@", v2, v3, v4, v5, v6);
}

void __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_34(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "duplicate app layout for single window app found in persistent storage, appLayout=%{public}@", v2, v3, v4, v5, v6);
}

void __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_1_34(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "bad app layout found reading from SBRecentAppLayout's persistent storage. One of the roles is not recognized. appLayout=%{public}@", v2, v3, v4, v5, v6);
}

void __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2_cold_4()
{
  OUTLINED_FUNCTION_1_34(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "application signature version was no longer supported.  appLayout=%{public}@", v2, v3, v4, v5, v6);
}

void __48__SBRecentAppLayouts__validateAndUpdateRecents___block_invoke_2_cold_5()
{
  OUTLINED_FUNCTION_1_34(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "bad app layout found in persistent storage. one of the referenced apps is not installed. appLayout=%{public}@", v2, v3, v4, v5, v6);
}

@end