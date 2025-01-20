@interface SBAudioCategoryZStackPolicyAssistant
- (id)observedSceneSettings;
- (int64_t)resolveProposedPoliciesForForegroundScenes:(id)a3;
- (uint64_t)audioCategoriesDisablingVolumeHUD;
@end

@implementation SBAudioCategoryZStackPolicyAssistant

- (uint64_t)audioCategoriesDisablingVolumeHUD
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (int64_t)resolveProposedPoliciesForForegroundScenes:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      v9 = v6;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v3);
        }
        v10 = [*(id *)(*((void *)&v20 + 1) + 8 * v8) clientSettings];
        v11 = self;
        id v12 = v10;
        if (v11)
        {
          if (objc_opt_isKindOfClass()) {
            v13 = v12;
          }
          else {
            v13 = 0;
          }
        }
        else
        {
          v13 = 0;
        }
        id v14 = v13;

        v15 = [v14 audioCategoriesDisablingVolumeHUD];

        if (v15)
        {
          v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
        }
        else
        {
          v16 = 0;
        }
        v6 = SBFAudioCategoriesDisablingVolumeHUDUnion();

        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  if (BSEqualSets())
  {
    int64_t v17 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, v6);
    int64_t v17 = 1;
  }

  return v17;
}

- (id)observedSceneSettings
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29238] valueWithPointer:NSSelectorFromString(&cfstr_Audiocategorie.isa)];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (void).cxx_destruct
{
}

@end