@interface SBTraitsOrientationDefaultTreeResolver
- (BOOL)_node:(id)a3 validatesNewSettings:(id)a4;
- (SBTraitsOrientationDefaultTreeResolver)initWithComponentOrder:(id)a3;
- (id)_mapResolverForTargetOrientation:(int64_t)a3 currentOrientation:(int64_t)a4;
- (int64_t)_targetOrientationForResolutionInfo:(id)a3 validatedInputs:(id)a4 rawInputs:(id)a5 participant:(id)a6 parent:(id)a7;
- (void)resolveStagePreferencesWithContext:(id)a3 preferencesTree:(id)a4;
@end

@implementation SBTraitsOrientationDefaultTreeResolver

- (void)resolveStagePreferencesWithContext:(id)a3 preferencesTree:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v5 = a4;
  if (!v5) {
    -[SBTraitsOrientationDefaultTreeResolver resolveStagePreferencesWithContext:preferencesTree:]();
  }
  v37 = v5;
  [v5 topologicalSort];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v41)
  {
    uint64_t v40 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v55 != v40) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v8 = [v7 participant];
        v9 = [v8 orientationPreferences];
        if (v9)
        {
          v10 = [v8 currentSettings];
          v11 = [v10 orientationSettings];
          v49 = [v11 orientationMapResolver];

          v47 = v7;
          v12 = [v7 parent];
          v50 = [v12 participant];

          v13 = [v39 rawInputs];
          uint64_t v14 = [v13 deviceOrientationInputs];

          v15 = [v39 validatedInputs];
          uint64_t v16 = [v15 deviceOrientationInputs];

          uint64_t v17 = [v8 orientationResolutionPolicyInfo];
          uint64_t v45 = [v9 preferredOrientation];
          v18 = [v8 currentSettings];
          v19 = [v18 orientationSettings];
          uint64_t v20 = [v19 orientation];

          v48 = v9;
          uint64_t v21 = [v9 supportedOrientations];
          v44 = (void *)v17;
          int64_t v22 = [(SBTraitsOrientationDefaultTreeResolver *)self _targetOrientationForResolutionInfo:v17 validatedInputs:v16 rawInputs:v14 participant:v8 parent:v50];
          v43 = [(SBTraitsOrientationDefaultTreeResolver *)self _mapResolverForTargetOrientation:v22 currentOrientation:v20];
          v23 = (void *)v16;
          uint64_t v24 = [v43 interfaceOrientationForSupportedOrientations:v21 preferredOrientation:v45];
          v25 = [(SBTraitsOrientationDefaultTreeResolver *)self _mapResolverForTargetOrientation:v22 currentOrientation:v24];
          v46 = (void *)v14;
          v26 = (void *)[objc_alloc(MEMORY[0x1E4FAFFD0]) initWithOrientation:v24 orientationMapResolver:v25 validatedOrientationInputs:v23 rawOrientationInputs:v14];
          if (v20 == [v26 orientation]
            && ([v26 orientationMapResolver],
                v27 = objc_claimAutoreleasedReturnValue(),
                char v28 = [v49 isEqual:v27],
                v27,
                (v28 & 1) != 0))
          {
            BOOL v29 = 0;
            v30 = v47;
            v31 = v44;
          }
          else
          {
            v32 = [v50 orientationResolutionPolicyInfo];
            v30 = v47;
            BOOL v33 = [(SBTraitsOrientationDefaultTreeResolver *)self _node:v47 validatesNewSettings:v26];
            BOOL v29 = v33;
            v31 = v44;
            if (v33)
            {
              v34 = [v44 actuationContext];
              if (!v34)
              {
                if ([v44 resolutionPolicy] == 3)
                {
                  v34 = [v32 actuationContext];
                }
                else
                {
                  v34 = 0;
                }
              }
              [v44 setActuationContext:v34];
            }
          }
          v35 = [v30 settingsUpdater];
          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v51[2] = __93__SBTraitsOrientationDefaultTreeResolver_resolveStagePreferencesWithContext_preferencesTree___block_invoke;
          v51[3] = &unk_1E6B0AAA0;
          BOOL v53 = v29;
          id v52 = v26;
          id v36 = v26;
          [v35 updateOrientationSettingsWithBlock:v51];

          v9 = v48;
        }
        else
        {
          v25 = SBLogTraitsArbiter();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            [(SBTraitsOrientationDefaultTreeResolver *)v58 resolveStagePreferencesWithContext:&v59 preferencesTree:v25];
          }
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v41);
  }
}

- (id)_mapResolverForTargetOrientation:(int64_t)a3 currentOrientation:(int64_t)a4
{
  v7 = [NSNumber numberWithInt:(a4 + 32 * a3)];
  v8 = [(NSMutableDictionary *)self->_mapResolverCache objectForKey:v7];
  if (!v8)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F4F6D8]) initWithTargetOrientation:a3 currentOrientation:a4];
    [(NSMutableDictionary *)self->_mapResolverCache setObject:v8 forKey:v7];
  }

  return v8;
}

- (int64_t)_targetOrientationForResolutionInfo:(id)a3 validatedInputs:(id)a4 rawInputs:(id)a5 participant:(id)a6 parent:(id)a7
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (a7)
  {
    v15 = [a7 currentSettings];
    uint64_t v16 = [v15 orientationSettings];
    int64_t v17 = [v16 orientation];
  }
  else if ([v11 resolutionPolicy] == 1)
  {
    id v18 = v14;
    id v19 = v11;
    id v40 = v12;
    id v20 = v13;
    id v21 = [v19 associatedDeviceOrientationStateTypes];
    if ([v19 resolutionPolicy] == 1 && objc_msgSend(v21, "count"))
    {
      id v37 = v19;
      uint64_t v22 = [v19 associatedDeviceOrientationStateTypesBySupportedOrientationMask];
      id v36 = (void *)v22;
      if (v22)
      {
        v23 = (void *)v22;
        uint64_t v24 = NSNumber;
        v38 = objc_msgSend(v18, "orientationPreferences", v22);
        v25 = objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v38, "supportedOrientations"));
        v26 = [v23 objectForKey:v25];

        if (v26)
        {
          id v27 = v26;

          id v21 = v27;
        }
      }
      id v39 = v18;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v21 = v21;
      uint64_t v28 = [v21 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v42;
LABEL_12:
        uint64_t v31 = 0;
        while (2)
        {
          if (*(void *)v42 != v30) {
            objc_enumerationMutation(v21);
          }
          switch(objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * v31), "integerValue", v36))
          {
            case 0:
              v32 = v40;
              goto LABEL_19;
            case 1:
              BOOL v33 = v40;
              goto LABEL_21;
            case 2:
              v32 = v20;
LABEL_19:
              uint64_t v34 = [v32 currentDeviceOrientation];
              goto LABEL_22;
            case 3:
              BOOL v33 = v20;
LABEL_21:
              uint64_t v34 = [v33 nonFlatDeviceOrientation];
LABEL_22:
              int64_t v17 = v34;
              if ((unint64_t)(v34 - 1) >= 4) {
                goto LABEL_23;
              }
              goto LABEL_26;
            default:
LABEL_23:
              if (v29 != ++v31) {
                continue;
              }
              uint64_t v29 = [v21 countByEnumeratingWithState:&v41 objects:v45 count:16];
              if (!v29) {
                goto LABEL_25;
              }
              goto LABEL_12;
          }
        }
      }
LABEL_25:
      int64_t v17 = 0;
LABEL_26:

      id v19 = v37;
      id v18 = v39;
    }
    else
    {
      int64_t v17 = 0;
    }
  }
  else
  {
    int64_t v17 = 0;
  }

  return v17;
}

void __93__SBTraitsOrientationDefaultTreeResolver_resolveStagePreferencesWithContext_preferencesTree___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    objc_msgSend(v6, "setOrientation:", objc_msgSend(*(id *)(a1 + 32), "orientation"));
    v3 = [*(id *)(a1 + 32) orientationMapResolver];
    [v6 setOrientationMapResolver:v3];
  }
  v4 = [*(id *)(a1 + 32) rawOrientationInputs];
  [v6 setRawOrientationInputs:v4];

  id v5 = [*(id *)(a1 + 32) validatedOrientationInputs];
  [v6 setValidatedOrientationInputs:v5];
}

- (BOOL)_node:(id)a3 validatesNewSettings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 participant];
  v9 = [v8 delegate];
  if (objc_opt_respondsToSelector())
  {
    [(TRASettingsValidator *)self->_settingsValidator setOrientationSettings:v6];
    [v9 validateSettingsForParticipant:v8 validator:self->_settingsValidator];
    uint64_t v10 = [(TRASettingsValidator *)self->_settingsValidator didValidateOrientationSettings];
  }
  else
  {
    uint64_t v10 = 1;
  }
  [v7 setDebugLastSettingsWereValidated:v10];
  id v11 = [(TRASettingsValidator *)self->_settingsValidator orientationSettingsValidatedReason];
  [v7 setDebugLastOrientationSettingsValidationFailureReason:v11];

  return v10;
}

- (SBTraitsOrientationDefaultTreeResolver)initWithComponentOrder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBTraitsOrientationDefaultTreeResolver;
  v3 = [(SBTraitsOrientationStageComponent *)&v9 initWithComponentOrder:a3];
  if (v3)
  {
    v4 = (TRASettingsValidator *)objc_alloc_init(MEMORY[0x1E4FAFFD8]);
    settingsValidator = v3->_settingsValidator;
    v3->_settingsValidator = v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:25];
    mapResolverCache = v3->_mapResolverCache;
    v3->_mapResolverCache = (NSMutableDictionary *)v6;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapResolverCache, 0);
  objc_storeStrong((id *)&self->_settingsValidator, 0);
}

- (void)resolveStagePreferencesWithContext:preferencesTree:.cold.1()
{
}

- (void)resolveStagePreferencesWithContext:(void *)a3 preferencesTree:(NSObject *)a4 .cold.2(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = [a2 uniqueIdentifier];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_1D85BA000, a4, OS_LOG_TYPE_ERROR, "Orientation trait participant[%{public}@] is not providing orientation preferences.", a1, 0xCu);
}

@end