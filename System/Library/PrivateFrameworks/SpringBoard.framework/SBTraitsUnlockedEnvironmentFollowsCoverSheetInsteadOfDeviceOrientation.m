@interface SBTraitsUnlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation
- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4;
@end

@implementation SBTraitsUnlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation

- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend(v4, "bs_containsObjectPassingTest:", &__block_literal_global_80_0))
  {
    v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_83];
    v6 = [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoForAssociatedParticipantWithRole:@"SBTraitsParticipantRoleCoverSheet"];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v7 = objc_msgSend(v5, "reverseObjectEnumerator", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      char v10 = 0;
      uint64_t v11 = *(void *)v22;
      double v12 = *MEMORY[0x1E4F43CF8] + -15.0;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v7);
          }
          v14 = *(void **)(*((void *)&v21 + 1) + 8 * v13);
          if (v10) {
            goto LABEL_9;
          }
          v15 = [*(id *)(*((void *)&v21 + 1) + 8 * v13) currentSettings];
          v16 = [v15 zOrderLevelSettings];
          [v16 zOrderLevel];
          double v18 = v17;

          if (v18 < v12)
          {
LABEL_9:
            v19 = [v14 orientationResolutionPolicyInfo];
            uint64_t v20 = [v19 resolutionPolicy];

            if (v20 == 1) {
              [v14 setOrientationResolutionPolicyInfo:v6];
            }
            char v10 = 1;
          }
          else
          {
            char v10 = 0;
          }
          ++v13;
        }
        while (v9 != v13);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }
  }
}

uint64_t __124__SBTraitsUnlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation_updateStageParticipantsResolutionPolicies_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 role];
  uint64_t v3 = [v2 isEqualToString:@"SBTraitsParticipantRoleCoverSheet"];

  return v3;
}

uint64_t __124__SBTraitsUnlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation_updateStageParticipantsResolutionPolicies_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 currentZOrderLevel];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  v7 = NSNumber;
  [v5 currentZOrderLevel];
  double v9 = v8;

  char v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

@end