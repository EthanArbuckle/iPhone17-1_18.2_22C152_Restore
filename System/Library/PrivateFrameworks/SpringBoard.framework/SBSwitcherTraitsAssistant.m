@interface SBSwitcherTraitsAssistant
- (BOOL)_isContentContainerAspectRatioPortrait;
- (BOOL)_updateGuidingSpecifiersIfNeededForParticipants:(id)a3 sceneHandleProviderBlock:(id)a4;
- (SBSwitcherTraitsAssistant)initWithTraitsArbiter:(id)a3 switcherParticipant:(id)a4 delegate:(id)a5;
- (SBSwitcherTraitsAssistantDelegate)delegate;
- (TRAArbiter)traitsArbiter;
- (TRAParticipant)switcherParticipant;
- (id)_guidingLandscapeOnlyLiveOverlay;
- (id)_guidingPortraitOnlyLiveOverlay;
- (id)_guidingSceneOrientationRequestParticipantWithMask:(unint64_t)a3;
- (id)_stateCaptureDescription;
- (void)_addGuidingParticipantsIdentifiersToArray:(id)a3;
- (void)_addGuidingSpecifierIfNeeded;
- (void)_evaluateIfGuidingSpecifierIsSillNeeded;
- (void)_handleUpdateRequest:(id)a3;
- (void)_setupGuidingRelationshipIfNeededForParticipant:(id)a3 withSceneHandle:(id)a4;
- (void)_setupPolicySpecifierIfNeeded;
- (void)_setupStateCapture;
- (void)_updateAcquiredParticipantsPolicies:(id)a3;
- (void)_updateArbitrationForElementsParticipants:(id)a3 sceneHandleProviderBlock:(id)a4 forceResolution:(BOOL)a5 reason:(id)a6;
- (void)createTraitsParticipantsForLayoutElements:(id)a3 outParticipantsByElementIdentifier:(id *)a4 outDelegatesByParticipant:(id *)a5 outPrimaryDelegate:(id *)a6;
- (void)dealloc;
- (void)updateAllParticipants:(id)a3 withPrimaryDelegate:(id)a4 nonPrimaryPolicy:(int64_t)a5 primaryPolicy:(int64_t)a6 ownPolicy:(int64_t)a7;
- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4;
@end

@implementation SBSwitcherTraitsAssistant

- (void)_setupGuidingRelationshipIfNeededForParticipant:(id)a3 withSceneHandle:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  if (!v6) {
    goto LABEL_28;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = [v6 application];
  int v9 = [WeakRetained isChamoisUIEnabled];
  if ([v8 isMedusaCapable] & 1) != 0 || (objc_msgSend(v8, "isSetup")) {
    goto LABEL_11;
  }
  if ([v8 classicAppPhoneAppRunningOnPad])
  {
    v10 = [(SBSwitcherTraitsAssistant *)self _guidingPortraitOnlyLiveOverlay];
    if ([v6 _classicAppPhoneOnPadSupportsOldStyleMixedOrientation]
      && [v6 _classicAppPhoneOnPadPrefersLandscape])
    {
      uint64_t v11 = [(SBSwitcherTraitsAssistant *)self _guidingLandscapeOnlyLiveOverlay];

      v10 = (void *)v11;
    }
    goto LABEL_12;
  }
  if (![WeakRetained isOnExtendedDisplay])
  {
LABEL_11:
    v10 = 0;
  }
  else
  {
    if ([(SBSwitcherTraitsAssistant *)self _isContentContainerAspectRatioPortrait])
    {
      [(SBSwitcherTraitsAssistant *)self _guidingPortraitOnlyLiveOverlay];
    }
    else
    {
      [(SBSwitcherTraitsAssistant *)self _guidingLandscapeOnlyLiveOverlay];
    v10 = };
  }
LABEL_12:
  uint64_t v12 = [v6 _supportedInterfaceOrientationsFromSceneOrientationRequestSetup];
  if (v12)
  {
    uint64_t v13 = [(SBSwitcherTraitsAssistant *)self _guidingSceneOrientationRequestParticipantWithMask:v12];

    v10 = (void *)v13;
  }
  v14 = [v6 application];
  if ([v14 isMedusaCapable])
  {
  }
  else
  {
    char v15 = [v8 isSetup];

    if ((v15 & 1) == 0)
    {
      if (v9)
      {
        uint64_t v16 = [v6 _interfaceOrientationFromUserResizing];
        if (v16)
        {
          if ((unint64_t)(v16 - 3) >= 2) {
            [(SBSwitcherTraitsAssistant *)self _guidingPortraitOnlyLiveOverlay];
          }
          else {
          uint64_t v17 = [(SBSwitcherTraitsAssistant *)self _guidingLandscapeOnlyLiveOverlay];
          }

          v10 = (void *)v17;
        }
      }
      else
      {
        objc_msgSend(v6, "_setInterfaceOrientationFromUserResizing:", objc_msgSend(v21, "sbf_currentOrientation"));
      }
    }
  }
  participantUniqueIDToAssociatedParticipantMap = self->_participantUniqueIDToAssociatedParticipantMap;
  if (v10)
  {
    v19 = [v10 uniqueIdentifier];
    v20 = [v21 uniqueIdentifier];
    [(NSMutableDictionary *)participantUniqueIDToAssociatedParticipantMap setObject:v19 forKey:v20];
  }
  else
  {
    v19 = [v21 uniqueIdentifier];
    [(NSMutableDictionary *)participantUniqueIDToAssociatedParticipantMap removeObjectForKey:v19];
  }

LABEL_28:
}

void __151__SBSwitcherTraitsAssistant_createTraitsParticipantsForLayoutElements_outParticipantsByElementIdentifier_outDelegatesByParticipant_outPrimaryDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = v6;
  if (WeakRetained && v6)
  {
    if ((a3 & 2) != 0)
    {
      if ((a3 & 1) == 0 || [v6 needsActuationForUpdateReasons:a3])
      {
        id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
        [v8 actuateOrientationForTraitsDelegate:v7 withContext:v9 reasons:a3];
      }
    }
    else
    {
      [v6 actuateOrientationSettingsWithContext:0];
    }
  }
}

- (void)updateAllParticipants:(id)a3 withPrimaryDelegate:(id)a4 nonPrimaryPolicy:(int64_t)a5 primaryPolicy:(int64_t)a6 ownPolicy:(int64_t)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  liveOverlaysPolicySpecifier = self->_liveOverlaysPolicySpecifier;
  id v14 = a4;
  uint64_t v15 = [(SBTraitsSwitcherLiveOverlayPolicySpecifier *)liveOverlaysPolicySpecifier primaryElementResolutionPolicy];
  int64_t v16 = [(SBTraitsSwitcherLiveOverlayPolicySpecifier *)self->_liveOverlaysPolicySpecifier primaryElementResolutionPolicy];
  int64_t v17 = [(SBTraitsSwitcherPolicySpecifier *)self->_switcherPolicySpecifier resolutionPolicy];
  BOOL v20 = v15 != a6 || v16 != a5 || v17 != a7;
  id v21 = [v14 participant];

  v22 = [v21 uniqueIdentifier];

  [(SBTraitsSwitcherPolicySpecifier *)self->_switcherPolicySpecifier setResolutionPolicy:a7];
  [(SBTraitsSwitcherPolicySpecifier *)self->_switcherPolicySpecifier setPrimaryElementParticipantIdentifier:v22];
  [(SBTraitsSwitcherLiveOverlayPolicySpecifier *)self->_liveOverlaysPolicySpecifier setPrimaryElementResolutionPolicy:a6];
  [(SBTraitsSwitcherLiveOverlayPolicySpecifier *)self->_liveOverlaysPolicySpecifier setPrimaryElementParticipantIdentifier:v22];
  [(SBTraitsSwitcherLiveOverlayPolicySpecifier *)self->_liveOverlaysPolicySpecifier setNonPrimaryResolutionPolicy:a5];
  v23 = [v12 allKeys];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __112__SBSwitcherTraitsAssistant_updateAllParticipants_withPrimaryDelegate_nonPrimaryPolicy_primaryPolicy_ownPolicy___block_invoke;
  v28[3] = &unk_1E6AFC520;
  id v29 = v12;
  id v24 = v12;
  [(SBSwitcherTraitsAssistant *)self _updateArbitrationForElementsParticipants:v23 sceneHandleProviderBlock:v28 forceResolution:v20 reason:@"Layout State update"];

  v25 = SBLogCommon();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = SBStringFromSwitcherOrientationPolicy(a7);
    v27 = SBStringFromSwitcherLiveOverlayOrientationPolicy(a5);
    *(_DWORD *)buf = 138412546;
    v31 = v26;
    __int16 v32 = 2112;
    v33 = v27;
    _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "[SwitcherOrientation] _updateParticipantsAndPoliciesWithSwitcherPolicy:[%@] nonPrimaryOverlayPolicy:[%@]", buf, 0x16u);
  }
}

- (void)_updateArbitrationForElementsParticipants:(id)a3 sceneHandleProviderBlock:(id)a4 forceResolution:(BOOL)a5 reason:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  LOBYTE(a4) = [(SBSwitcherTraitsAssistant *)self _updateGuidingSpecifiersIfNeededForParticipants:v10 sceneHandleProviderBlock:a4];
  [(SBSwitcherTraitsAssistant *)self _addGuidingSpecifierIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherParticipant);
  id v13 = objc_loadWeakRetained((id *)&self->_traitsArbiter);
  id v14 = objc_alloc(MEMORY[0x1E4FAFF78]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __119__SBSwitcherTraitsAssistant__updateArbitrationForElementsParticipants_sceneHandleProviderBlock_forceResolution_reason___block_invoke;
  v19[3] = &unk_1E6AFC5B8;
  id v20 = v10;
  id v21 = WeakRetained;
  v22 = self;
  id v23 = v11;
  BOOL v24 = a5;
  char v25 = (char)a4;
  id v15 = v11;
  id v16 = WeakRetained;
  id v17 = v10;
  v18 = (void *)[v14 initWithBuilder:v19];
  [v13 setNeedsUpdateArbitrationWithContext:v18];

  [(SBSwitcherTraitsAssistant *)self _evaluateIfGuidingSpecifierIsSillNeeded];
}

- (BOOL)_updateGuidingSpecifiersIfNeededForParticipants:(id)a3 sceneHandleProviderBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_participantUniqueIDToAssociatedParticipantMap count];
  [(NSMutableDictionary *)self->_participantUniqueIDToAssociatedParticipantMap removeAllObjects];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
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
        id v15 = v7[2](v7, v14);
        -[SBSwitcherTraitsAssistant _setupGuidingRelationshipIfNeededForParticipant:withSceneHandle:](self, "_setupGuidingRelationshipIfNeededForParticipant:withSceneHandle:", v14, v15, (void)v18);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  BOOL v16 = ([(NSMutableDictionary *)self->_participantUniqueIDToAssociatedParticipantMap count] | v8) != 0;
  return v16;
}

- (void)_evaluateIfGuidingSpecifierIsSillNeeded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableDictionary *)self->_participantUniqueIDToAssociatedParticipantMap count])
  {
    blockBasedPolicySpecifier = self->_blockBasedPolicySpecifier;
    if (blockBasedPolicySpecifier)
    {
      [(SBTraitsPipelineBlockBasedPolicySpecifier *)blockBasedPolicySpecifier invalidate];
      [(TRAParticipant *)self->_guidingPortraitOnlyParticipant invalidate];
      [(TRAParticipant *)self->_guidingLandscapeOnlyParticipant invalidate];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      v4 = [(NSMutableDictionary *)self->_guidingSceneOrientationRequestParticipantsMap allValues];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
            [*(id *)(*((void *)&v13 + 1) + 8 * v8++) invalidate];
          }
          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v6);
      }

      id v9 = self->_blockBasedPolicySpecifier;
      self->_blockBasedPolicySpecifier = 0;

      guidingPortraitOnlyParticipant = self->_guidingPortraitOnlyParticipant;
      self->_guidingPortraitOnlyParticipant = 0;

      guidingLandscapeOnlyParticipant = self->_guidingLandscapeOnlyParticipant;
      self->_guidingLandscapeOnlyParticipant = 0;

      guidingSceneOrientationRequestParticipantsMap = self->_guidingSceneOrientationRequestParticipantsMap;
      self->_guidingSceneOrientationRequestParticipantsMap = 0;
    }
  }
}

- (void)_addGuidingSpecifierIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traitsArbiter);
  if (WeakRetained && !self->_blockBasedPolicySpecifier)
  {
    objc_initWeak(&location, self);
    v4 = [SBTraitsPipelineBlockBasedPolicySpecifier alloc];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__SBSwitcherTraitsAssistant__addGuidingSpecifierIfNeeded__block_invoke;
    v7[3] = &unk_1E6AFC590;
    objc_copyWeak(&v8, &location);
    uint64_t v5 = [(SBTraitsPipelineBlockBasedPolicySpecifier *)v4 initWithPolicySpecifierBlock:v7 specifierDescription:@"Switcher Traits Assistant" componentOrder:&unk_1F3349C80 arbiter:WeakRetained];
    blockBasedPolicySpecifier = self->_blockBasedPolicySpecifier;
    self->_blockBasedPolicySpecifier = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)createTraitsParticipantsForLayoutElements:(id)a3 outParticipantsByElementIdentifier:(id *)a4 outDelegatesByParticipant:(id *)a5 outPrimaryDelegate:(id *)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  char v25 = a5;
  v26 = a4;
  *a4 = 0;
  *a5 = 0;
  id v21 = v9;
  uint64_t v10 = [v9 count];
  if (v10)
  {
    uint64_t v11 = v10;
    *a4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v10];
    id *v25 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v11];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v21;
    uint64_t v27 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v27)
    {
      uint64_t v24 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v34 != v24) {
            objc_enumerationMutation(obj);
          }
          long long v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v14 = [v13 layoutRole];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_traitsArbiter);
          long long v16 = [v13 uniqueIdentifier];
          id v17 = objc_loadWeakRetained((id *)&self->_delegate);
          uint64_t v18 = [v17 sceneHandleForLayoutElement:v13];

          long long v19 = [[SBTraitsSceneParticipantDelegate alloc] initWithSceneHandle:v18];
          long long v20 = [WeakRetained acquireParticipantWithRole:@"SBTraitsParticipantRoleSwitcherLiveOverlay" delegate:v19];
          [(SBTraitsSceneParticipantDelegate *)v19 setArbiter:WeakRetained];
          [(SBTraitsSceneParticipantDelegate *)v19 setParticipant:v20];
          [(SBTraitsSceneParticipantDelegate *)v19 setOrientationActuationEnabled:0];
          objc_initWeak(&from, self);
          objc_initWeak(&v31, v19);
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __151__SBSwitcherTraitsAssistant_createTraitsParticipantsForLayoutElements_outParticipantsByElementIdentifier_outDelegatesByParticipant_outPrimaryDelegate___block_invoke;
          v28[3] = &unk_1E6AFC4F8;
          objc_copyWeak(&v29, &from);
          objc_copyWeak(&v30, &v31);
          void v28[4] = self;
          [(SBTraitsSceneParticipantDelegate *)v19 setActuateOrientationAlongsideBlock:v28];
          [*v26 setObject:v20 forKey:v16];
          [*v25 setObject:v19 forKey:v20];
          if (v14 == 1) {
            *a6 = v19;
          }
          objc_destroyWeak(&v30);
          objc_destroyWeak(&v29);
          objc_destroyWeak(&v31);
          objc_destroyWeak(&from);
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v27);
    }
  }
}

id __112__SBSwitcherTraitsAssistant_updateAllParticipants_withPrimaryDelegate_nonPrimaryPolicy_primaryPolicy_ownPolicy___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [*(id *)(a1 + 32) objectForKey:v3];

  uint64_t v6 = [v5 sceneHandle];
  uint64_t v7 = SBSafeCast(v4, v6);

  return v7;
}

void __119__SBSwitcherTraitsAssistant__updateArbitrationForElementsParticipants_sceneHandleProviderBlock_forceResolution_reason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "uniqueIdentifier", (void)v14);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v11 = *(void **)(a1 + 40);
  if (v11)
  {
    uint64_t v12 = [v11 uniqueIdentifier];
    [v4 addObject:v12];
  }
  objc_msgSend(*(id *)(a1 + 48), "_addGuidingParticipantsIdentifiersToArray:", v4, (void)v14);
  [v3 setReason:*(void *)(a1 + 56)];
  [v3 setRequestingParticipantsUniqueIdentifiers:v4];
  if (*(unsigned char *)(a1 + 64)) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = *(unsigned char *)(a1 + 65) != 0;
  }
  [v3 setForceOrientationResolution:v13];
}

- (void)_addGuidingParticipantsIdentifiersToArray:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  guidingPortraitOnlyParticipant = self->_guidingPortraitOnlyParticipant;
  if (guidingPortraitOnlyParticipant)
  {
    uint64_t v6 = [(TRAParticipant *)guidingPortraitOnlyParticipant uniqueIdentifier];
    [v4 addObject:v6];
  }
  guidingLandscapeOnlyParticipant = self->_guidingLandscapeOnlyParticipant;
  if (guidingLandscapeOnlyParticipant)
  {
    uint64_t v8 = [(TRAParticipant *)guidingLandscapeOnlyParticipant uniqueIdentifier];
    [v4 addObject:v8];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = [(NSMutableDictionary *)self->_guidingSceneOrientationRequestParticipantsMap allValues];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = [*(id *)(*((void *)&v15 + 1) + 8 * v13) uniqueIdentifier];
        [v4 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

void __57__SBSwitcherTraitsAssistant__addGuidingSpecifierIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateAcquiredParticipantsPolicies:v3];
}

- (void)_updateAcquiredParticipantsPolicies:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        participantUniqueIDToAssociatedParticipantMap = self->_participantUniqueIDToAssociatedParticipantMap;
        uint64_t v11 = [v9 uniqueIdentifier];
        uint64_t v12 = [(NSMutableDictionary *)participantUniqueIDToAssociatedParticipantMap objectForKey:v11];

        if (v12)
        {
          uint64_t v13 = [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoForAssociatedParticipantWithUniqueID:v12];
          [v9 setOrientationResolutionPolicyInfo:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (SBSwitcherTraitsAssistant)initWithTraitsArbiter:(id)a3 switcherParticipant:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)SBSwitcherTraitsAssistant;
  uint64_t v11 = [(SBSwitcherTraitsAssistant *)&v28 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeWeak((id *)&v12->_traitsArbiter, v8);
    objc_storeWeak((id *)&v12->_switcherParticipant, v9);
    uint64_t v13 = [SBTraitsSwitcherPolicySpecifier alloc];
    long long v14 = NSNumber;
    [v9 currentZOrderLevel];
    long long v15 = objc_msgSend(v14, "numberWithDouble:");
    uint64_t v16 = [(SBTraitsSwitcherPolicySpecifier *)v13 initWithComponentOrder:v15 arbiter:v8];
    switcherPolicySpecifier = v12->_switcherPolicySpecifier;
    v12->_switcherPolicySpecifier = (SBTraitsSwitcherPolicySpecifier *)v16;

    long long v18 = [SBTraitsSwitcherLiveOverlayPolicySpecifier alloc];
    uint64_t v19 = NSNumber;
    [v9 currentZOrderLevel];
    uint64_t v20 = objc_msgSend(v19, "numberWithDouble:");
    uint64_t v21 = [(SBTraitsSwitcherLiveOverlayPolicySpecifier *)v18 initWithComponentOrder:v20 arbiter:v8];
    liveOverlaysPolicySpecifier = v12->_liveOverlaysPolicySpecifier;
    v12->_liveOverlaysPolicySpecifier = (SBTraitsSwitcherLiveOverlayPolicySpecifier *)v21;

    uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
    participantUniqueIDToAssociatedParticipantMap = v12->_participantUniqueIDToAssociatedParticipantMap;
    v12->_participantUniqueIDToAssociatedParticipantMap = (NSMutableDictionary *)v23;

    char v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v12 selector:sel__handleUpdateRequest_ name:@"SBClassicPhoneSceneOrientationPreferenceChanged" object:0];

    v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v26 addObserver:v12 selector:sel__handleUpdateRequest_ name:@"SBSceneGeometryOrientationRequestChanged" object:0];

    [(SBSwitcherTraitsAssistant *)v12 _setupStateCapture];
  }

  return v12;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(SBTraitsPipelineBlockBasedPolicySpecifier *)self->_blockBasedPolicySpecifier invalidate];
  [(SBAbstractTraitsSwitcherPolicySpecifier *)self->_switcherPolicySpecifier invalidate];
  [(SBAbstractTraitsSwitcherPolicySpecifier *)self->_liveOverlaysPolicySpecifier invalidate];
  v4.receiver = self;
  v4.super_class = (Class)SBSwitcherTraitsAssistant;
  [(SBSwitcherTraitsAssistant *)&v4 dealloc];
}

- (void)_setupStateCapture
{
  id v3 = NSString;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v5 = [WeakRetained stateCaptureTitlePreamble];
  uint64_t v6 = [v3 stringWithFormat:@"%@ - SBSwitcherTraitsAssistant", v5];

  objc_initWeak(&location, self);
  id v7 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v10, &location);
  BSLogAddStateCaptureBlockWithTitle();
  id v8 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  stateCaptureInvalidatable = self->_stateCaptureInvalidatable;
  self->_stateCaptureInvalidatable = v8;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

id __47__SBSwitcherTraitsAssistant__setupStateCapture__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _stateCaptureDescription];

  return v2;
}

- (id)_stateCaptureDescription
{
  v14[6] = *MEMORY[0x1E4F143B8];
  v13[0] = @"Switcher orientation policy";
  id v3 = SBStringFromSwitcherOrientationPolicy([(SBTraitsSwitcherPolicySpecifier *)self->_switcherPolicySpecifier resolutionPolicy]);
  v14[0] = v3;
  v13[1] = @"Switcher live overlays orientation policy";
  objc_super v4 = SBStringFromSwitcherLiveOverlayOrientationPolicy([(SBTraitsSwitcherLiveOverlayPolicySpecifier *)self->_liveOverlaysPolicySpecifier primaryElementResolutionPolicy]);
  guidingSceneOrientationRequestParticipantsMap = self->_guidingSceneOrientationRequestParticipantsMap;
  participantUniqueIDToAssociatedParticipantMap = self->_participantUniqueIDToAssociatedParticipantMap;
  v14[1] = v4;
  v14[2] = participantUniqueIDToAssociatedParticipantMap;
  v13[2] = @"Participants UniqueID association to guiding ones";
  v13[3] = @"Guiding Landscape participant";
  id v7 = @"None";
  guidingPortraitOnlyParticipant = self->_guidingPortraitOnlyParticipant;
  guidingLandscapeOnlyParticipant = self->_guidingLandscapeOnlyParticipant;
  if (!guidingLandscapeOnlyParticipant) {
    guidingLandscapeOnlyParticipant = (TRAParticipant *)@"None";
  }
  if (!guidingPortraitOnlyParticipant) {
    guidingPortraitOnlyParticipant = (TRAParticipant *)@"None";
  }
  v14[3] = guidingLandscapeOnlyParticipant;
  v14[4] = guidingPortraitOnlyParticipant;
  v13[4] = @"Guiding Portrait participant";
  v13[5] = @"Guiding Scene Geometry Orientation Request participants";
  if (guidingSceneOrientationRequestParticipantsMap) {
    id v7 = (__CFString *)guidingSceneOrientationRequestParticipantsMap;
  }
  v14[5] = v7;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:6];
  uint64_t v11 = [v10 description];

  return v11;
}

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (TRAParticipant *)a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_guidingLandscapeOnlyParticipant == v6)
  {
    uint64_t v16 = &__block_literal_global_86;
LABEL_16:
    [v7 updateOrientationPreferencesWithBlock:v16];
    goto LABEL_17;
  }
  if (self->_guidingPortraitOnlyParticipant == v6)
  {
    uint64_t v16 = &__block_literal_global_48_0;
    goto LABEL_16;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = [(NSMutableDictionary *)self->_guidingSceneOrientationRequestParticipantsMap allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        long long v15 = [(NSMutableDictionary *)self->_guidingSceneOrientationRequestParticipantsMap objectForKey:v14];
        if (v15 == v6)
        {
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __69__SBSwitcherTraitsAssistant_updatePreferencesForParticipant_updater___block_invoke_3;
          v17[3] = &unk_1E6AFC568;
          v17[4] = v14;
          [v8 updateOrientationPreferencesWithBlock:v17];

          goto LABEL_14;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_14:

LABEL_17:
}

uint64_t __69__SBSwitcherTraitsAssistant_updatePreferencesForParticipant_updater___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSupportedOrientations:24];
}

uint64_t __69__SBSwitcherTraitsAssistant_updatePreferencesForParticipant_updater___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSupportedOrientations:6];
}

void __69__SBSwitcherTraitsAssistant_updatePreferencesForParticipant_updater___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setSupportedOrientations:", objc_msgSend(v2, "unsignedIntValue"));
}

- (BOOL)_isContentContainerAspectRatioPortrait
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained contentContainerAspectRatio];
  char v3 = BSFloatLessThanOrEqualToFloat();

  return v3;
}

- (id)_guidingLandscapeOnlyLiveOverlay
{
  guidingLandscapeOnlyParticipant = self->_guidingLandscapeOnlyParticipant;
  if (!guidingLandscapeOnlyParticipant)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_traitsArbiter);
    uint64_t v5 = [WeakRetained acquireParticipantWithRole:@"SBTraitsParticipantRoleSwitcherLiveOverlay" delegate:self];
    uint64_t v6 = self->_guidingLandscapeOnlyParticipant;
    self->_guidingLandscapeOnlyParticipant = v5;

    guidingLandscapeOnlyParticipant = self->_guidingLandscapeOnlyParticipant;
  }
  return guidingLandscapeOnlyParticipant;
}

- (id)_guidingPortraitOnlyLiveOverlay
{
  guidingPortraitOnlyParticipant = self->_guidingPortraitOnlyParticipant;
  if (!guidingPortraitOnlyParticipant)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_traitsArbiter);
    uint64_t v5 = [WeakRetained acquireParticipantWithRole:@"SBTraitsParticipantRoleSwitcherLiveOverlay" delegate:self];
    uint64_t v6 = self->_guidingPortraitOnlyParticipant;
    self->_guidingPortraitOnlyParticipant = v5;

    guidingPortraitOnlyParticipant = self->_guidingPortraitOnlyParticipant;
  }
  return guidingPortraitOnlyParticipant;
}

- (id)_guidingSceneOrientationRequestParticipantWithMask:(unint64_t)a3
{
  guidingSceneOrientationRequestParticipantsMap = self->_guidingSceneOrientationRequestParticipantsMap;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v7 = [(NSMutableDictionary *)guidingSceneOrientationRequestParticipantsMap objectForKey:v6];

  if (!v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_traitsArbiter);
    id v7 = [WeakRetained acquireParticipantWithRole:@"SBTraitsParticipantRoleSwitcherLiveOverlay" delegate:self];

    if (v7)
    {
      id v9 = self->_guidingSceneOrientationRequestParticipantsMap;
      if (!v9)
      {
        uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v11 = self->_guidingSceneOrientationRequestParticipantsMap;
        self->_guidingSceneOrientationRequestParticipantsMap = v10;

        id v9 = self->_guidingSceneOrientationRequestParticipantsMap;
      }
      uint64_t v12 = [NSNumber numberWithUnsignedInteger:a3];
      [(NSMutableDictionary *)v9 setObject:v7 forKey:v12];
    }
  }
  return v7;
}

- (void)_handleUpdateRequest:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v5 = [WeakRetained currentElementsParticipants];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SBSwitcherTraitsAssistant__handleUpdateRequest___block_invoke;
  v7[3] = &unk_1E6AFC520;
  id v8 = WeakRetained;
  id v6 = WeakRetained;
  [(SBSwitcherTraitsAssistant *)self _updateArbitrationForElementsParticipants:v5 sceneHandleProviderBlock:v7 forceResolution:1 reason:@"TraitsAssistantHandleUpdateRequest"];
}

uint64_t __50__SBSwitcherTraitsAssistant__handleUpdateRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sceneHandleForTraitsParticipant:a2];
}

- (void)_setupPolicySpecifierIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traitsArbiter);
  if (WeakRetained && !self->_blockBasedPolicySpecifier)
  {
    objc_initWeak(&location, self);
    objc_super v4 = [SBTraitsPipelineBlockBasedPolicySpecifier alloc];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__SBSwitcherTraitsAssistant__setupPolicySpecifierIfNeeded__block_invoke;
    v7[3] = &unk_1E6AFC590;
    objc_copyWeak(&v8, &location);
    uint64_t v5 = [(SBTraitsPipelineBlockBasedPolicySpecifier *)v4 initWithPolicySpecifierBlock:v7 specifierDescription:@"Switcher Traits Assistant" componentOrder:&unk_1F3349C80 arbiter:WeakRetained];
    blockBasedPolicySpecifier = self->_blockBasedPolicySpecifier;
    self->_blockBasedPolicySpecifier = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __58__SBSwitcherTraitsAssistant__setupPolicySpecifierIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateAcquiredParticipantsPolicies:v3];
}

- (TRAArbiter)traitsArbiter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traitsArbiter);
  return (TRAArbiter *)WeakRetained;
}

- (TRAParticipant)switcherParticipant
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherParticipant);
  return (TRAParticipant *)WeakRetained;
}

- (SBSwitcherTraitsAssistantDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSwitcherTraitsAssistantDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_switcherParticipant);
  objc_destroyWeak((id *)&self->_traitsArbiter);
  objc_storeStrong((id *)&self->_blockBasedPolicySpecifier, 0);
  objc_storeStrong((id *)&self->_participantUniqueIDToAssociatedParticipantMap, 0);
  objc_storeStrong((id *)&self->_guidingSceneOrientationRequestParticipantsMap, 0);
  objc_storeStrong((id *)&self->_guidingLandscapeOnlyParticipant, 0);
  objc_storeStrong((id *)&self->_guidingPortraitOnlyParticipant, 0);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_liveOverlaysPolicySpecifier, 0);
  objc_storeStrong((id *)&self->_switcherPolicySpecifier, 0);
}

@end