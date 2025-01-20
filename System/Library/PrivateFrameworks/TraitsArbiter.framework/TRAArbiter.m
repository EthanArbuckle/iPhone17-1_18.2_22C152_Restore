@interface TRAArbiter
- (NSString)debugDescription;
- (TRAArbiter)initWithRolesProvider:(id)a3 inputsDataSource:(id)a4 drawingDataSource:(id)a5;
- (TRAArbiterDrawingDataSource)drawingDataSource;
- (TRAArbiterInputsDataSource)inputsDataSource;
- (id)_defaultUpdateContextWithReason:(id)a3 animatable:(BOOL)a4;
- (id)_newOrderedPreferencesResolutionStagesWithRolesProvider:(id)a3;
- (id)_newUniqueIdentifierForRole:(id)a3;
- (id)_resolutionStageWithType:(int64_t)a3;
- (id)_setupStateDump;
- (id)acquireParticipantWithRole:(id)a3 delegate:(id)a4;
- (id)ambientPresentationResolutionStage;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)inputsValidationStage;
- (id)orientationResolutionStage;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)userInterfaceStyleResolutionStage;
- (id)zOrderResolutionStage;
- (void)_addOrientationResolutionPolicySpecifierForClientContext:(id)a3;
- (void)_inputsValidationStageDidUpdateValidators:(id)a3;
- (void)_invalidateParticipant:(id)a3;
- (void)_participantDidUpdatePreferences:(id)a3;
- (void)_participantDidUpdateSettings:(id)a3;
- (void)_preferencesResolutionStageDidUpdateComponents:(id)a3 animate:(BOOL)a4;
- (void)_removeForceResolutionSpecifier;
- (void)_setNeedsUpdateArbitrationWithClientContext:(id)a3 defaultContext:(id)a4;
- (void)_setNeedsUpdateArbitrationWithReason:(id)a3 animated:(BOOL)a4;
- (void)_updateArbitrationWithClientContext:(id)a3 defaultContext:(id)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)noteArbiterDidCompleteTransitionWithContext:(id)a3;
- (void)noteArbiterWillBeginTransitionWithContext:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setNeedsUpdateArbitrationWithContext:(id)a3;
@end

@implementation TRAArbiter

void __58__TRAArbiter_noteArbiterDidCompleteTransitionWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 arbiter:*(void *)(a1 + 32) didCompleteUpdateWithContext:*(void *)(a1 + 40)];
  }
}

void __56__TRAArbiter_noteArbiterWillBeginTransitionWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 arbiter:*(void *)(a1 + 32) willBeginUpdateWithContext:*(void *)(a1 + 40)];
  }
}

- (void)_participantDidUpdatePreferences:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRAArbiter.m", 321, @"Invalid parameter not satisfying: %@", @"participant" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableSet *)self->_updatedParticipants addObject:v5];
}

- (void)_participantDidUpdateSettings:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRAArbiter.m", 326, @"Invalid parameter not satisfying: %@", @"participant" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableSet *)self->_updatedParticipants addObject:v5];
}

- (id)acquireParticipantWithRole:(id)a3 delegate:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"TRAArbiter.m", 147, @"Invalid parameter not satisfying: %@", @"role" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v32 = [MEMORY[0x263F08690] currentHandler];
  [v32 handleFailureInMethod:a2, self, @"TRAArbiter.m", 147, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

LABEL_3:
  if (![(NSSet *)self->_allStagesRoles containsObject:v7])
  {
    v33 = (void *)MEMORY[0x263EFF940];
    v34 = NSString;
    v35 = (objc_class *)objc_opt_class();
    v36 = NSStringFromClass(v35);
    v37 = NSStringFromSelector(a2);
    v38 = [v34 stringWithFormat:@"*** -[%@ %@] called for unknown role: %@", v36, v37, v7];
    id v39 = [v33 exceptionWithName:@"TRAArbiterUnknownRoleException" reason:v38 userInfo:0];

    objc_exception_throw(v39);
  }
  v10 = [TRAParticipant alloc];
  id v11 = [(TRAArbiter *)self _newUniqueIdentifierForRole:v7];
  v40 = v9;
  v12 = [(TRAParticipant *)v10 initWithRole:v7 uniqueIdentifier:v11 delegate:v9 arbiter:self];

  liveRolesCounter = self->_liveRolesCounter;
  v14 = NSNumber;
  v15 = [(NSMutableDictionary *)liveRolesCounter objectForKeyedSubscript:v7];
  v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "unsignedIntegerValue") + 1);
  [(NSMutableDictionary *)liveRolesCounter setObject:v16 forKey:v7];

  acquiredParticipantsByUniqueIdentifier = self->_acquiredParticipantsByUniqueIdentifier;
  v18 = [(TRAParticipant *)v12 uniqueIdentifier];
  [(NSMutableDictionary *)acquiredParticipantsByUniqueIdentifier setObject:v12 forKey:v18];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v19 = self->_preferencesResolutionStages;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v42 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v25 = [v24 participantsRoles];
        int v26 = [v25 containsObject:v7];

        if (v26)
        {
          acquiredParticipantsByPreferencesType = self->_acquiredParticipantsByPreferencesType;
          v28 = TRAStringFromTraitsPreferencesType([v24 preferencesType]);
          v29 = [(NSMutableDictionary *)acquiredParticipantsByPreferencesType objectForKey:v28];

          [v29 addObject:v12];
        }
      }
      uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v21);
  }

  return v12;
}

- (void)_addOrientationResolutionPolicySpecifierForClientContext:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [v13 forceOrientationResolution];
  int v5 = [v13 _hasDefaultOrientationActuationContext];
  if (((v4 & 1) != 0 || !v5) && !self->_resolutionUpdateOrientationSpecifier)
  {
    v6 = [[TRAArbiterUpdateOrientationResolutionPolicySpecifier alloc] initWithComponentOrder:&unk_270BFE5D0];
    resolutionUpdateOrientationSpecifier = self->_resolutionUpdateOrientationSpecifier;
    self->_resolutionUpdateOrientationSpecifier = v6;

    [(TRAArbiterUpdateOrientationResolutionPolicySpecifier *)self->_resolutionUpdateOrientationSpecifier setForceResolution:v4];
    id v8 = self->_resolutionUpdateOrientationSpecifier;
    id v9 = [v13 orientationActuationContext];
    [(TRAArbiterUpdateOrientationResolutionPolicySpecifier *)v8 setActuationContext:v9];

    v10 = self->_resolutionUpdateOrientationSpecifier;
    id v11 = [v13 requestingParticipantsUniqueIdentifiers];
    [(TRAArbiterUpdateOrientationResolutionPolicySpecifier *)v10 setParticipantsUniqueIdentifiers:v11];

    v12 = [(TRAArbiter *)self orientationResolutionStage];
    [v12 addResolutionPolicySpecifier:self->_resolutionUpdateOrientationSpecifier update:0];
  }
}

- (void)setNeedsUpdateArbitrationWithContext:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_drawingDataSource);
  [v9 _setDrawingConfigurationProvider:WeakRetained];

  int v5 = [v9 requestingParticipantsUniqueIdentifiers];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = [v9 reason];
    id v8 = [(TRAArbiter *)self _defaultUpdateContextWithReason:v7 animatable:1];

    [(TRAArbiter *)self _setNeedsUpdateArbitrationWithClientContext:v9 defaultContext:v8];
  }
  else
  {
    [(NSMutableArray *)self->_arbiterNeedsUpdateReasons addObject:@"Broadcast update requested"];
    [(TRAArbiter *)self _setNeedsUpdateArbitrationWithClientContext:0 defaultContext:v9];
  }
}

- (void)_setNeedsUpdateArbitrationWithClientContext:(id)a3 defaultContext:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRAArbiter.m", 270, @"Invalid parameter not satisfying: %@", @"defaultContext" object file lineNumber description];
  }
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = v8;
  }
  id v22 = v9;
  v10 = [v22 requestingParticipantsUniqueIdentifiers];
  id v11 = v10;
  v23 = v8;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [(NSMutableDictionary *)self->_acquiredParticipantsByUniqueIdentifier allKeys];
  }
  id v13 = v12;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [(NSMutableDictionary *)self->_acquiredParticipantsByUniqueIdentifier objectForKey:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        if (v19)
        {
          [(NSMutableSet *)self->_participantsNeedingUpdate addObject:v19];
        }
        else
        {
          uint64_t v20 = TRALogCommon();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v29 = 0;
            __int16 v30 = 2114;
            id v31 = v7;
            _os_log_error_impl(&dword_2600B7000, v20, OS_LOG_TYPE_ERROR, "An update was requested for an unknown participant: %{public}@, with client context: %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v16);
  }

  if (v7
    && (![v7 _hasDefaultOrientationActuationContext]
     || [v7 forceOrientationResolution]))
  {
    [(TRAArbiter *)self _addOrientationResolutionPolicySpecifierForClientContext:v7];
  }
  [(TRAArbiter *)self _updateArbitrationWithClientContext:v7 defaultContext:v23];
  [(TRAArbiter *)self _removeForceResolutionSpecifier];
}

- (void)_removeForceResolutionSpecifier
{
  if (self->_resolutionUpdateOrientationSpecifier)
  {
    id v3 = [(TRAArbiter *)self orientationResolutionStage];
    [v3 removeResolutionPolicySpecifier:self->_resolutionUpdateOrientationSpecifier update:0];

    resolutionUpdateOrientationSpecifier = self->_resolutionUpdateOrientationSpecifier;
    self->_resolutionUpdateOrientationSpecifier = 0;
  }
}

- (id)orientationResolutionStage
{
  return [(TRAArbiter *)self _resolutionStageWithType:1];
}

- (id)_resolutionStageWithType:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_preferencesResolutionStages;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "preferencesType", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)_updateArbitrationWithClientContext:(id)a3 defaultContext:(id)a4
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v53 = [MEMORY[0x263F08690] currentHandler];
    [v53 handleFailureInMethod:a2, self, @"TRAArbiter.m", 382, @"Invalid parameter not satisfying: %@", @"defaultContext" object file lineNumber description];
  }
  if ([(NSMutableDictionary *)self->_acquiredParticipantsByPreferencesType count])
  {
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = v8;
    }
    id v10 = v9;
    [(TRAArbiter *)self noteArbiterWillBeginTransitionWithContext:v10];
    id v11 = TRALogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[TRAArbiter _updateArbitrationWithClientContext:defaultContext:]((uint64_t)self, (uint64_t)v10, v11);
    }

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v12 = self->_participantsNeedingUpdate;
    uint64_t v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v66 objects:v72 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v67 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          v18 = [v17 delegate];
          [v18 updatePreferencesForParticipant:v17 updater:v17];

          if ([v10 forceOrientationResolution]) {
            [(NSMutableSet *)self->_updatedParticipants addObject:v17];
          }
        }
        uint64_t v14 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v66 objects:v72 count:16];
      }
      while (v14);
    }
    v56 = v10;

    if ([(NSMutableSet *)self->_updatedParticipants count]
      || [(NSMutableArray *)self->_arbiterNeedsUpdateReasons count])
    {
      id v54 = v8;
      id v55 = v7;
      [(NSMutableSet *)self->_updatedParticipants removeAllObjects];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_inputsDataSource);
      uint64_t v20 = [WeakRetained inputs];
      lastRawInputs = self->_lastRawInputs;
      self->_lastRawInputs = v20;

      inputsValidationStage = self->_inputsValidationStage;
      v23 = self->_lastRawInputs;
      long long v24 = [TRAInputsValidationContext alloc];
      long long v25 = [(NSMutableDictionary *)self->_acquiredParticipantsByUniqueIdentifier allValues];
      long long v26 = [(TRAInputsValidationContext *)v24 initWithAcquiredParticipants:v25];
      long long v27 = [(TRAArbitrationInputsValidationStage *)inputsValidationStage validateInputs:v23 withContext:v26];
      lastValidatedInputs = self->_lastValidatedInputs;
      self->_lastValidatedInputs = v27;

      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      obuint64_t j = self->_preferencesResolutionStages;
      uint64_t v29 = [(NSArray *)obj countByEnumeratingWithState:&v62 objects:v71 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v63;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v63 != v31) {
              objc_enumerationMutation(obj);
            }
            uint64_t v33 = *(void **)(*((void *)&v62 + 1) + 8 * j);
            v34 = [v33 participantsRoles];
            acquiredParticipantsByPreferencesType = self->_acquiredParticipantsByPreferencesType;
            v36 = TRAStringFromTraitsPreferencesType([v33 preferencesType]);
            v37 = [(NSMutableDictionary *)acquiredParticipantsByPreferencesType objectForKey:v36];

            v38 = [TRAPreferencesResolutionContext alloc];
            id v39 = [v37 allObjects];
            v40 = [(TRAPreferencesResolutionContext *)v38 initWithAcquiredParticipants:v39 stageParticipantsRoles:v34 validatedInputs:self->_lastValidatedInputs rawInputs:self->_lastRawInputs];

            [v33 updateResolutionWithContext:v40];
          }
          uint64_t v30 = [(NSArray *)obj countByEnumeratingWithState:&v62 objects:v71 count:16];
        }
        while (v30);
      }

      long long v41 = TRALogCommon();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        -[TRAArbiter _updateArbitrationWithClientContext:defaultContext:](self, v41);
      }

      id v8 = v54;
      id v7 = v55;
    }
    long long v42 = (void *)[(NSMutableSet *)self->_updatedParticipants copy];
    [(NSMutableSet *)self->_updatedParticipants removeAllObjects];
    [(NSMutableSet *)self->_participantsNeedingUpdate removeAllObjects];
    [(NSMutableArray *)self->_arbiterNeedsUpdateReasons removeAllObjects];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v43 = v42;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v58 objects:v70 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v59;
      do
      {
        for (uint64_t k = 0; k != v45; ++k)
        {
          if (*(void *)v59 != v46) {
            objc_enumerationMutation(v43);
          }
          v48 = *(void **)(*((void *)&v58 + 1) + 8 * k);
          if ([v48 hasAnyActuationContext]) {
            v49 = v48;
          }
          else {
            v49 = v8;
          }
          id v50 = v49;
          v51 = [v48 delegate];
          [v51 didChangeSettingsForParticipant:v48 context:v50];
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v58 objects:v70 count:16];
      }
      while (v45);
    }

    [(TRAArbiter *)self noteArbiterDidCompleteTransitionWithContext:v56];
    v52 = TRALogCommon();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
      -[TRAArbiter _updateArbitrationWithClientContext:defaultContext:]((uint64_t)self, (uint64_t)v56, v52);
    }
  }
}

- (void)noteArbiterDidCompleteTransitionWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSHashTable *)self->_observers allObjects];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__TRAArbiter_noteArbiterDidCompleteTransitionWithContext___block_invoke;
  v7[3] = &unk_265543E40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (void)noteArbiterWillBeginTransitionWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSHashTable *)self->_observers allObjects];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__TRAArbiter_noteArbiterWillBeginTransitionWithContext___block_invoke;
  v7[3] = &unk_265543E40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (id)_defaultUpdateContextWithReason:(id)a3 animatable:(BOOL)a4
{
  id v7 = a3;
  if (!v7)
  {
    long long v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRAArbiter.m", 370, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  id v8 = [TRAArbiterUpdateContext alloc];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__TRAArbiter__defaultUpdateContextWithReason_animatable___block_invoke;
  v13[3] = &unk_265543E68;
  BOOL v15 = a4;
  v13[4] = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = [(TRAArbiterUpdateContext *)v8 initWithBuilder:v13];

  return v10;
}

void __57__TRAArbiter__defaultUpdateContextWithReason_animatable___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 160));
    id v4 = [WeakRetained defaultOrientationAnimationSettingsAnimatable:1];
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = [[TRASettingsActuationContext alloc] initWithAnimationSettings:v4 drawingFence:0];
  [v6 setReason:*(void *)(a1 + 40)];
  [v6 setRequestingParticipantsUniqueIdentifiers:MEMORY[0x263EFFA68]];
  [v6 setOrientationActuationContext:v5];
}

- (void)_preferencesResolutionStageDidUpdateComponents:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v12 = v7;
  if (!v7)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRAArbiter.m", 338, @"Invalid parameter not satisfying: %@", @"preferencesResolutionStage" object file lineNumber description];

    id v7 = 0;
  }
  id v8 = NSString;
  id v9 = [v7 succinctDescription];
  id v10 = [v8 stringWithFormat:@"Stage[%@] did update specifiers.", v9];

  [(NSMutableArray *)self->_arbiterNeedsUpdateReasons addObject:v10];
  [(TRAArbiter *)self _setNeedsUpdateArbitrationWithReason:v10 animated:v4];
}

- (void)_setNeedsUpdateArbitrationWithReason:(id)a3 animated:(BOOL)a4
{
  id v5 = [(TRAArbiter *)self _defaultUpdateContextWithReason:a3 animatable:a4];
  [(TRAArbiter *)self _setNeedsUpdateArbitrationWithClientContext:0 defaultContext:v5];
}

- (id)_newUniqueIdentifierForRole:(id)a3
{
  uint64_t v5 = 0;
  id v6 = &stru_270BF7BE8;
  do
  {
    id v7 = v6;
    id v6 = [NSString stringWithFormat:@"%@-%ld", a3, v5];

    ++v5;
    id v8 = [(NSMutableDictionary *)self->_acquiredParticipantsByUniqueIdentifier objectForKey:v6];
  }
  while (v8);
  return v6;
}

- (TRAArbiter)initWithRolesProvider:(id)a3 inputsDataSource:(id)a4 drawingDataSource:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)TRAArbiter;
  id v11 = [(TRAArbiter *)&v31 init];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:20];
    acquiredParticipantsByUniqueIdentifier = v11->_acquiredParticipantsByUniqueIdentifier;
    v11->_acquiredParticipantsByUniqueIdentifier = (NSMutableDictionary *)v12;

    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    acquiredParticipantsByPreferencesType = v11->_acquiredParticipantsByPreferencesType;
    v11->_acquiredParticipantsByPreferencesType = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:20];
    liveRolesCounter = v11->_liveRolesCounter;
    v11->_liveRolesCounter = (NSMutableDictionary *)v16;

    uint64_t v18 = [MEMORY[0x263EFF9C0] setWithCapacity:2];
    participantsNeedingUpdate = v11->_participantsNeedingUpdate;
    v11->_participantsNeedingUpdate = (NSMutableSet *)v18;

    uint64_t v20 = [MEMORY[0x263EFF9C0] setWithCapacity:2];
    updatedParticipants = v11->_updatedParticipants;
    v11->_updatedParticipants = (NSMutableSet *)v20;

    uint64_t v22 = [MEMORY[0x263EFF980] array];
    arbiterNeedsUpdateReasons = v11->_arbiterNeedsUpdateReasons;
    v11->_arbiterNeedsUpdateReasons = (NSMutableArray *)v22;

    objc_storeWeak((id *)&v11->_drawingDataSource, v10);
    objc_storeWeak((id *)&v11->_inputsDataSource, v9);
    long long v24 = [[TRAArbitrationInputsValidationStage alloc] initWithValidators:0 arbiter:v11];
    inputsValidationStage = v11->_inputsValidationStage;
    v11->_inputsValidationStage = v24;

    uint64_t v26 = [(TRAArbiter *)v11 _newOrderedPreferencesResolutionStagesWithRolesProvider:v8];
    preferencesResolutionStages = v11->_preferencesResolutionStages;
    v11->_preferencesResolutionStages = (NSArray *)v26;

    uint64_t v28 = [(TRAArbiter *)v11 _setupStateDump];
    stateDumpHandle = v11->_stateDumpHandle;
    v11->_stateDumpHandle = (BSInvalidatable *)v28;
  }
  return v11;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(BSInvalidatable *)self->_stateDumpHandle invalidate];
  v4.receiver = self;
  v4.super_class = (Class)TRAArbiter;
  [(TRAArbiter *)&v4 dealloc];
}

- (id)_newOrderedPreferencesResolutionStagesWithRolesProvider:(id)a3
{
  v43[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 zOrderStageRoles];
  zOrderStageRoles = self->_zOrderStageRoles;
  self->_zOrderStageRoles = v5;

  id v7 = [v4 orientationStageRoles];
  orientationStageRoles = self->_orientationStageRoles;
  self->_orientationStageRoles = v7;

  id v9 = [v4 ambientPresentationStageRoles];
  ambientPresentationStageRoles = self->_ambientPresentationStageRoles;
  self->_ambientPresentationStageRoles = v9;

  id v11 = [v4 userInterfaceStyleStageRoles];

  userInterfaceStyleStageRoles = self->_userInterfaceStyleStageRoles;
  self->_userInterfaceStyleStageRoles = v11;

  uint64_t v13 = [TRAArbitrationPreferencesResolutionStage alloc];
  uint64_t v14 = [(NSSet *)self->_zOrderStageRoles allObjects];
  BOOL v15 = [(TRAArbitrationPreferencesResolutionStage *)v13 initWithParticipantsRoles:v14 preferencesType:0 arbiter:self];

  uint64_t v16 = [TRAArbitrationPreferencesResolutionStage alloc];
  uint64_t v17 = [(NSSet *)self->_orientationStageRoles allObjects];
  uint64_t v18 = [(TRAArbitrationPreferencesResolutionStage *)v16 initWithParticipantsRoles:v17 preferencesType:1 arbiter:self];

  v19 = [TRAArbitrationPreferencesResolutionStage alloc];
  uint64_t v20 = [(NSSet *)self->_ambientPresentationStageRoles allObjects];
  uint64_t v21 = [(TRAArbitrationPreferencesResolutionStage *)v19 initWithParticipantsRoles:v20 preferencesType:2 arbiter:self];

  uint64_t v22 = [TRAArbitrationPreferencesResolutionStage alloc];
  v23 = [(NSSet *)self->_ambientPresentationStageRoles allObjects];
  long long v24 = [(TRAArbitrationPreferencesResolutionStage *)v22 initWithParticipantsRoles:v23 preferencesType:3 arbiter:self];

  acquiredParticipantsByPreferencesType = self->_acquiredParticipantsByPreferencesType;
  uint64_t v26 = [MEMORY[0x263EFF9C0] set];
  long long v27 = TRAStringFromTraitsPreferencesType(0);
  [(NSMutableDictionary *)acquiredParticipantsByPreferencesType setObject:v26 forKey:v27];

  uint64_t v28 = self->_acquiredParticipantsByPreferencesType;
  uint64_t v29 = [MEMORY[0x263EFF9C0] set];
  uint64_t v30 = TRAStringFromTraitsPreferencesType(1uLL);
  [(NSMutableDictionary *)v28 setObject:v29 forKey:v30];

  objc_super v31 = self->_acquiredParticipantsByPreferencesType;
  v32 = [MEMORY[0x263EFF9C0] set];
  uint64_t v33 = TRAStringFromTraitsPreferencesType(2uLL);
  [(NSMutableDictionary *)v31 setObject:v32 forKey:v33];

  v34 = self->_acquiredParticipantsByPreferencesType;
  v35 = [MEMORY[0x263EFF9C0] set];
  v36 = TRAStringFromTraitsPreferencesType(3uLL);
  [(NSMutableDictionary *)v34 setObject:v35 forKey:v36];

  v37 = [(NSSet *)self->_zOrderStageRoles setByAddingObjectsFromSet:self->_ambientPresentationStageRoles];
  v38 = [v37 setByAddingObjectsFromSet:self->_userInterfaceStyleStageRoles];
  id v39 = [v38 setByAddingObjectsFromSet:self->_orientationStageRoles];
  allStagesRoles = self->_allStagesRoles;
  self->_allStagesRoles = v39;

  v43[0] = v15;
  v43[1] = v18;
  v43[2] = v21;
  v43[3] = v24;
  long long v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:4];

  return v41;
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"TRAArbiter.m", 196, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];

    id v5 = 0;
  }
  observers = self->_observers;
  if (!observers)
  {
    id v7 = (NSHashTable *)[objc_alloc(MEMORY[0x263F088B0]) initWithOptions:5 capacity:2];
    id v8 = self->_observers;
    self->_observers = v7;

    id v5 = v10;
    observers = self->_observers;
  }
  if (![(NSHashTable *)observers containsObject:v5]) {
    [(NSHashTable *)self->_observers addObject:v10];
  }
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRAArbiter.m", 206, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];

    id v5 = 0;
  }
  if ([(NSHashTable *)self->_observers containsObject:v5]) {
    [(NSHashTable *)self->_observers removeObject:v7];
  }
}

- (id)inputsValidationStage
{
  return self->_inputsValidationStage;
}

- (id)zOrderResolutionStage
{
  return [(TRAArbiter *)self _resolutionStageWithType:0];
}

- (id)ambientPresentationResolutionStage
{
  return [(TRAArbiter *)self _resolutionStageWithType:2];
}

- (id)userInterfaceStyleResolutionStage
{
  return [(TRAArbiter *)self _resolutionStageWithType:3];
}

- (void)_invalidateParticipant:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRAArbiter.m", 292, @"Invalid parameter not satisfying: %@", @"participant" object file lineNumber description];
  }
  id v6 = [v5 delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 participantWillInvalidate:v5];
  }
  id v7 = [v5 role];
  acquiredParticipantsByUniqueIdentifier = self->_acquiredParticipantsByUniqueIdentifier;
  id v9 = [v5 uniqueIdentifier];
  [(NSMutableDictionary *)acquiredParticipantsByUniqueIdentifier removeObjectForKey:v9];

  [(NSMutableSet *)self->_participantsNeedingUpdate removeObject:v5];
  [(NSMutableSet *)self->_updatedParticipants removeObject:v5];
  id v10 = [(NSMutableDictionary *)self->_liveRolesCounter objectForKeyedSubscript:v7];
  uint64_t v11 = [v10 unsignedIntegerValue] - 1;

  liveRolesCounter = self->_liveRolesCounter;
  if (v11)
  {
    uint64_t v13 = [NSNumber numberWithUnsignedInteger:v11];
    [(NSMutableDictionary *)liveRolesCounter setObject:v13 forKey:v7];
  }
  else
  {
    [(NSMutableDictionary *)self->_liveRolesCounter removeObjectForKey:v7];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v14 = [(NSMutableDictionary *)self->_acquiredParticipantsByPreferencesType allKeys];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [(NSMutableDictionary *)self->_acquiredParticipantsByPreferencesType objectForKey:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        [v19 removeObject:v5];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [NSString stringWithFormat:@"Participant(%p) with role %@ was invalidated", v5, v7];
  [(NSMutableArray *)self->_arbiterNeedsUpdateReasons addObject:v20];
  [(TRAArbiter *)self _setNeedsUpdateArbitrationWithReason:v20 animated:1];
}

- (void)_inputsValidationStageDidUpdateValidators:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"TRAArbiter.m", 331, @"Invalid parameter not satisfying: %@", @"inputsValidationStage" object file lineNumber description];

    id v5 = 0;
  }
  id v6 = NSString;
  id v7 = [v5 succinctDescription];
  id v8 = [v6 stringWithFormat:@"Stage[%@] did update specifiers.", v7];

  [(NSMutableArray *)self->_arbiterNeedsUpdateReasons addObject:v8];
  [(TRAArbiter *)self _setNeedsUpdateArbitrationWithReason:v8 animated:1];
}

- (NSString)debugDescription
{
  return (NSString *)[(TRAArbiter *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(TRAArbiter *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x263F29C40] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(TRAArbiter *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = [(TRAArbiter *)self succinctDescriptionBuilder];
  id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableDictionary count](self->_acquiredParticipantsByUniqueIdentifier, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = [(NSMutableDictionary *)self->_acquiredParticipantsByUniqueIdentifier allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v28 + 1) + 8 * v10) succinctDescription];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v8);
  }

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke;
  v24[3] = &unk_265543D90;
  id v12 = v4;
  id v25 = v12;
  id v26 = v5;
  uint64_t v27 = self;
  id v13 = v5;
  [v12 appendBodySectionWithName:@"Acquired Participants" multilinePrefix:0 block:v24];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v21[3] = &unk_265543D20;
  id v14 = v12;
  id v22 = v14;
  long long v23 = self;
  [v14 appendBodySectionWithName:@"Inputs" multilinePrefix:0 block:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_5;
  v19[3] = &unk_265543D20;
  v19[4] = self;
  id v15 = v14;
  id v20 = v15;
  [v15 appendBodySectionWithName:@"Preferences Resolution Stages" multilinePrefix:0 block:v19];
  uint64_t v16 = v20;
  id v17 = v15;

  return v17;
}

uint64_t __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendArraySection:*(void *)(a1 + 40) withName:0 skipIfEmpty:0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 48);
  return [v2 appendDictionarySection:v3 withName:@"Acquired Participants by Roles Counter" skipIfEmpty:0];
}

void __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 112) withName:@"validation stage" skipIfNil:0];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [v3 activeMultilinePrefix];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v14[3] = &unk_265543D20;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v15 = v5;
  uint64_t v16 = v6;
  [v3 appendBodySectionWithName:@"last raw" multilinePrefix:v4 block:v14];

  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v7 activeMultilinePrefix];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_4;
  v11[3] = &unk_265543D20;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v12 = v9;
  uint64_t v13 = v10;
  [v7 appendBodySectionWithName:@"last validated" multilinePrefix:v8 block:v11];
}

id __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 128) withName:0 skipIfNil:0];
}

id __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 136) withName:0 skipIfNil:0];
}

void __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_5(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obuint64_t j = *(id *)(*(void *)(a1 + 32) + 120);
  uint64_t v2 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v7 = *(void **)(a1 + 40);
        uint64_t v8 = TRAStringFromTraitsPreferencesType([v6 preferencesType]);
        id v9 = [*(id *)(a1 + 40) activeMultilinePrefix];
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_6;
        v11[3] = &unk_265543D20;
        id v12 = *(id *)(a1 + 40);
        uint64_t v13 = v6;
        [v7 appendBodySectionWithName:v8 multilinePrefix:v9 block:v11];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }
}

void __52__TRAArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_6(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) debugDescription];
  [v1 appendString:v2 withName:0];
}

- (id)_setupStateDump
{
  objc_initWeak(&location, self);
  id v2 = MEMORY[0x263EF83A0];
  uint64_t v3 = NSString;
  id v4 = objc_loadWeakRetained(&location);
  id v5 = objc_msgSend(v3, "stringWithFormat:", @"TraitsArbiter - %p - Arbiter", v4);
  objc_copyWeak(&v8, &location);
  uint64_t v6 = BSLogAddStateCaptureBlockWithTitle();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v6;
}

__CFString *__29__TRAArbiter__setupStateDump__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained debugDescription];
  }
  else
  {
    uint64_t v3 = &stru_270BF7BE8;
  }

  return v3;
}

- (TRAArbiterInputsDataSource)inputsDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputsDataSource);
  return (TRAArbiterInputsDataSource *)WeakRetained;
}

- (TRAArbiterDrawingDataSource)drawingDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_drawingDataSource);
  return (TRAArbiterDrawingDataSource *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_drawingDataSource);
  objc_destroyWeak((id *)&self->_inputsDataSource);
  objc_storeStrong((id *)&self->_stateDumpHandle, 0);
  objc_storeStrong((id *)&self->_lastValidatedInputs, 0);
  objc_storeStrong((id *)&self->_lastRawInputs, 0);
  objc_storeStrong((id *)&self->_preferencesResolutionStages, 0);
  objc_storeStrong((id *)&self->_inputsValidationStage, 0);
  objc_storeStrong((id *)&self->_resolutionUpdateOrientationSpecifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_updatedParticipants, 0);
  objc_storeStrong((id *)&self->_arbiterNeedsUpdateReasons, 0);
  objc_storeStrong((id *)&self->_participantsNeedingUpdate, 0);
  objc_storeStrong((id *)&self->_acquiredParticipantsByPreferencesType, 0);
  objc_storeStrong((id *)&self->_acquiredParticipantsByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_liveRolesCounter, 0);
  objc_storeStrong((id *)&self->_allStagesRoles, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleStageRoles, 0);
  objc_storeStrong((id *)&self->_ambientPresentationStageRoles, 0);
  objc_storeStrong((id *)&self->_orientationStageRoles, 0);
  objc_storeStrong((id *)&self->_zOrderStageRoles, 0);
}

- (void)_updateArbitrationWithClientContext:(NSObject *)a3 defaultContext:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 134218240;
  *(void *)((char *)&v3 + 4) = a1;
  WORD6(v3) = 2048;
  HIWORD(v3) = a2;
  OUTLINED_FUNCTION_0(&dword_2600B7000, a2, a3, "Arbiter[%p] did update with context: %p.", (const void *)v3, *((const void **)&v3 + 1));
}

- (void)_updateArbitrationWithClientContext:(void *)a1 defaultContext:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  long long v3 = [a1 debugDescription];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_debug_impl(&dword_2600B7000, a2, OS_LOG_TYPE_DEBUG, "current resolution:\n%{public}@", (uint8_t *)&v4, 0xCu);
}

- (void)_updateArbitrationWithClientContext:(NSObject *)a3 defaultContext:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)long long v3 = 134218242;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_2600B7000, a2, a3, "Arbiter[%p] will update with context: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end