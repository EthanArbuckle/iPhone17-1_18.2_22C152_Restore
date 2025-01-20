@interface SBTraitsUserInterfaceStyleDefaultResolver
- (void)resolveStagePreferencesWithContext:(id)a3 preferencesTree:(id)a4;
@end

@implementation SBTraitsUserInterfaceStyleDefaultResolver

void __96__SBTraitsUserInterfaceStyleDefaultResolver_resolveStagePreferencesWithContext_preferencesTree___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 validatedInputs];
  v4 = [v5 userInterfaceStyleInputs];
  [v3 setUserInterfaceStyleInputs:v4];
}

- (void)resolveStagePreferencesWithContext:(id)a3 preferencesTree:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 acquiredParticipants];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __96__SBTraitsUserInterfaceStyleDefaultResolver_resolveStagePreferencesWithContext_preferencesTree___block_invoke;
        v11[3] = &unk_1E6AFB428;
        id v12 = v4;
        [v10 updateUserInterfaceOrientationSettingsWithBlock:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

@end