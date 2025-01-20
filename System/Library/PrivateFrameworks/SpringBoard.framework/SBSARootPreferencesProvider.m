@interface SBSARootPreferencesProvider
- (BOOL)_handleBounceRequest:(id)a3;
- (BOOL)_handleEjectRequest:(id)a3;
- (BOOL)_handlePulseRequest:(id)a3;
- (BOOL)_handleShakeRequest:(id)a3;
- (SBSARootPreferencesProvider)initWithParentProvider:(id)a3;
- (id)preferencesFromContext:(id)a3;
- (void)_handleRequests:(id)a3;
- (void)_updateDynamicsSessionProviders:(id)a3;
- (void)removeFromParentProvider;
@end

@implementation SBSARootPreferencesProvider

void __54__SBSARootPreferencesProvider_preferencesFromContext___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v15 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  v4 = self;
  id v5 = v15;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  id v3 = v15;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = a1[6];
    uint64_t v10 = a1[4];
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSARootPreferencesProvider.m", 87, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

    id v3 = v15;
LABEL_9:
    id v7 = 0;
  }

  v14 = [[SBSAElementLayoutTransition alloc] initWithInitialElementContexts:*(void *)(a1[4] + 40) targetElementContext:a1[5]];
  [v7 setElementLayoutTransition:v14];
  if ([(SBSAElementLayoutTransition *)v14 isLayoutChange]) {
    objc_storeStrong((id *)(a1[4] + 48), v14);
  }
  [v7 setLastChangingElementLayoutTransition:*(void *)(a1[4] + 48)];
}

- (id)preferencesFromContext:(id)a3
{
  v50[11] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (!self->_configuredInitialStack)
  {
    id v39 = v5;
    v40 = a2;
    v38 = self;
    v50[0] = v38;
    v37 = self;
    v50[1] = v37;
    v36 = self;
    v50[2] = v36;
    id v7 = self;
    v50[3] = v7;
    v8 = self;
    v50[4] = v8;
    uint64_t v9 = self;
    v50[5] = v9;
    uint64_t v10 = self;
    v50[6] = v10;
    Class v11 = self;
    v50[7] = v11;
    v12 = self;
    v50[8] = v12;
    v13 = self;
    v50[9] = v13;
    v14 = self;
    v50[10] = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:11];

    v16 = self;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v46;
      do
      {
        uint64_t v21 = 0;
        v22 = v16;
        do
        {
          if (*(void *)v46 != v20) {
            objc_enumerationMutation(v17);
          }
          v16 = (SBSARootPreferencesProvider *)[objc_alloc(*(Class *)(*((void *)&v45 + 1) + 8 * v21)) initWithParentProvider:v22];

          ++v21;
          v22 = v16;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v19);
    }

    self->_configuredInitialStack = 1;
    v6 = v39;
    a2 = v40;
  }
  uint64_t v23 = objc_opt_class();
  id v24 = v6;
  if (v23)
  {
    if (objc_opt_isKindOfClass()) {
      v25 = v24;
    }
    else {
      v25 = 0;
    }
  }
  else
  {
    v25 = 0;
  }
  id v26 = v25;

  if (v26)
  {
    v27 = [v26 elementContexts];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __54__SBSARootPreferencesProvider_preferencesFromContext___block_invoke;
    v42[3] = &unk_1E6AF9DA0;
    SEL v44 = a2;
    v42[4] = self;
    v28 = v27;
    v43 = v28;
    v29 = +[SBSAPreferences instanceWithBlock:v42];
    v30 = (void *)[v26 copyByUpdatingPreferences:v29];

    previouslyVisibleElements = self->_previouslyVisibleElements;
    self->_previouslyVisibleElements = v28;
    v32 = v28;

    [(SBSARootPreferencesProvider *)self _updateDynamicsSessionProviders:v32];
    v33 = [v30 requests];
    [(SBSARootPreferencesProvider *)self _handleRequests:v33];
  }
  else
  {
    v30 = 0;
  }
  v41.receiver = self;
  v41.super_class = (Class)SBSARootPreferencesProvider;
  v34 = [(SBSABasePreferencesProvider *)&v41 preferencesFromContext:v30];
  [v34 finalizePreferencesForApplication:v30];

  return v34;
}

- (void)_updateDynamicsSessionProviders:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    char v9 = 0;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v12 activeDynamicAnimation] == 1) {
          char v9 = 1;
        }
        else {
          v8 |= [v12 activeDynamicAnimation] == 2;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v7);
    if (v9)
    {
      v13 = self;
      v14 = [(SBSABasePreferencesProvider *)self firstChildPreferenceProviderOfClass:v13];

      if (!v14)
      {
        id v15 = self;
        v16 = [(SBSABasePreferencesProvider *)self firstChildPreferenceProviderOfClass:v15];
        id v17 = [v16 parentProvider];

        if (!v17)
        {
          v25 = [MEMORY[0x1E4F28B00] currentHandler];
          [v25 handleFailureInMethod:a2 object:self file:@"SBSARootPreferencesProvider.m" lineNumber:190 description:@"Couldn't find parent of pruning provider while attempting to add dynamics provider."];
        }
        uint64_t v18 = objc_alloc_init(SBSAContainerDynamicsBumpAnimationProvider);
        [v17 setChildProvider:v18];
      }
    }
    if (v8)
    {
      uint64_t v19 = self;
      uint64_t v20 = [(SBSABasePreferencesProvider *)self firstChildPreferenceProviderOfClass:v19];

      if (!v20)
      {
        uint64_t v21 = self;
        v22 = [(SBSABasePreferencesProvider *)self firstChildPreferenceProviderOfClass:v21];
        uint64_t v23 = [v22 parentProvider];

        if (!v23)
        {
          id v26 = [MEMORY[0x1E4F28B00] currentHandler];
          [v26 handleFailureInMethod:a2 object:self file:@"SBSARootPreferencesProvider.m" lineNumber:195 description:@"Couldn't find parent of pruning provider while attempting to add dynamics provider."];
        }
        id v24 = objc_alloc_init(SBSAContainerDynamicsInflateAnimationProvider);
        [v23 setChildProvider:v24];
      }
    }
  }
}

- (void)_handleRequests:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v29 + 1) + 8 * v8);
        uint64_t v10 = objc_opt_class();
        id v11 = v9;
        if (v10)
        {
          if (objc_opt_isKindOfClass()) {
            v12 = v11;
          }
          else {
            v12 = 0;
          }
        }
        else
        {
          v12 = 0;
        }
        id v13 = v12;

        BOOL v14 = [(SBSARootPreferencesProvider *)self _handleShakeRequest:v13];
        if (!v14)
        {
          uint64_t v15 = objc_opt_class();
          id v16 = v11;
          if (v15) {
            id v17 = (objc_opt_isKindOfClass() & 1) != 0 ? v16 : 0;
          }
          else {
            id v17 = 0;
          }
          id v18 = v17;

          BOOL v19 = [(SBSARootPreferencesProvider *)self _handleBounceRequest:v18];
          if (!v19)
          {
            uint64_t v20 = objc_opt_class();
            id v21 = v16;
            if (v20) {
              id v22 = (objc_opt_isKindOfClass() & 1) != 0 ? v21 : 0;
            }
            else {
              id v22 = 0;
            }
            id v23 = v22;

            BOOL v24 = [(SBSARootPreferencesProvider *)self _handleEjectRequest:v23];
            if (!v24)
            {
              uint64_t v25 = objc_opt_class();
              id v26 = v21;
              if (v25)
              {
                if (objc_opt_isKindOfClass()) {
                  long long v27 = v26;
                }
                else {
                  long long v27 = 0;
                }
              }
              else
              {
                long long v27 = 0;
              }
              id v28 = v27;

              [(SBSARootPreferencesProvider *)self _handlePulseRequest:v28];
            }
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v6);
  }
}

- (SBSARootPreferencesProvider)initWithParentProvider:(id)a3
{
  if (a3)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBSARootPreferencesProvider.m" lineNumber:51 description:@"This is a root provider class"];
  }
  v7.receiver = self;
  v7.super_class = (Class)SBSARootPreferencesProvider;
  return [(SBSABasePreferencesProvider *)&v7 initWithParentProvider:0];
}

- (void)removeFromParentProvider
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBSARootPreferencesProvider.m" lineNumber:58 description:@"This is a root provider class"];
}

- (BOOL)_handleShakeRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = self;
    uint64_t v6 = [(SBSABasePreferencesProvider *)self firstChildPreferenceProviderOfClass:v5];

    if (!v6)
    {
      objc_super v7 = [SBSAShakeBehaviorProvider alloc];
      uint64_t v8 = [v4 participantIdentifier];
      char v9 = [(SBSASequencedBehaviorProvider *)v7 initWithParticipantIdentifier:v8];

      [(SBSABasePreferencesProvider *)self setChildProvider:v9];
    }
  }

  return v4 != 0;
}

- (BOOL)_handleBounceRequest:(id)a3
{
  if (a3)
  {
    id v6 = a3;
    objc_super v7 = [SBSAAcceptanceBounceBehaviorProvider alloc];
    uint64_t v8 = [v6 style];
    char v9 = [v6 triggeredBlock];

    uint64_t v10 = [(SBSAAcceptanceBounceBehaviorProvider *)v7 initWithParticipantIdentifier:0 style:v8 triggeredBlock:v9];
    id v11 = self;
    v12 = [(SBSABasePreferencesProvider *)self firstChildPreferenceProviderOfClass:v11];

    if (!v12)
    {
      BOOL v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"SBSARootPreferencesProvider.m" lineNumber:125 description:@"Couldn't find default container layout provider"];
    }
    [v12 setChildProvider:v10];
  }
  return a3 != 0;
}

- (BOOL)_handleEjectRequest:(id)a3
{
  if (a3)
  {
    id v6 = objc_alloc_init(SBSAEjectStretchBehaviorProvider);
    objc_super v7 = self;
    uint64_t v8 = [(SBSABasePreferencesProvider *)self firstChildPreferenceProviderOfClass:v7];

    if (!v8)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"SBSARootPreferencesProvider.m" lineNumber:137 description:@"Couldn't find default container layout provider"];
    }
    [v8 setChildProvider:v6];
  }
  return a3 != 0;
}

- (BOOL)_handlePulseRequest:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = self;
    objc_super v7 = [(SBSABasePreferencesProvider *)self firstChildPreferenceProviderOfClass:v6];

    if (v7)
    {
      [v7 didRequestAdditionalPulse:v5];
    }
    else
    {
      uint64_t v8 = [SBSAContainerDynamicsPulseAnimationProvider alloc];
      char v9 = [v5 participantIdentifier];
      uint64_t v10 = -[SBSAContainerDynamicsPulseAnimationProvider initWithElementIdentity:pulseStyle:](v8, "initWithElementIdentity:pulseStyle:", v9, [v5 pulseStyle]);

      id v11 = self;
      v12 = [(SBSABasePreferencesProvider *)self firstChildPreferenceProviderOfClass:v11];

      if (!v12)
      {
        BOOL v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2 object:self file:@"SBSARootPreferencesProvider.m" lineNumber:153 description:@"Couldn't find default container layout provider"];
      }
      [v12 setChildProvider:v10];
    }
  }

  return v5 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastChangingElementLayoutTransition, 0);
  objc_storeStrong((id *)&self->_previouslyVisibleElements, 0);
}

@end