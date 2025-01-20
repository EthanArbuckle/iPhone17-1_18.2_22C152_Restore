@interface SBTraitsZOrderDefaultResolver
- (void)resolveStagePreferencesWithContext:(id)a3 preferencesTree:(id)a4;
@end

@implementation SBTraitsZOrderDefaultResolver

- (void)resolveStagePreferencesWithContext:(id)a3 preferencesTree:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v4 = [a3 acquiredParticipants];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v10 = [v9 zOrderLevelPreferences];
        [v10 preferredZOrderLevel];
        double v12 = v11;

        uint64_t v13 = [v9 zOrderLevelPreferences];
        if (v13)
        {
          v14 = (void *)v13;
          [v9 currentZOrderLevel];
          double v16 = v15;

          if (v16 != v12)
          {
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __84__SBTraitsZOrderDefaultResolver_resolveStagePreferencesWithContext_preferencesTree___block_invoke;
            v17[3] = &__block_descriptor_40_e39_v16__0__TRAMutableSettingsZOrderLevel_8l;
            *(double *)&v17[4] = v12;
            [v9 updateZOrderLevelSettingsWithBlock:v17];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
}

uint64_t __84__SBTraitsZOrderDefaultResolver_resolveStagePreferencesWithContext_preferencesTree___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setZOrderLevel:*(double *)(a1 + 32)];
}

@end