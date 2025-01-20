@interface SBTraitsUserInterfaceStyleDefaultResolutionPolicySpecifier
- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4;
@end

@implementation SBTraitsUserInterfaceStyleDefaultResolutionPolicySpecifier

- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
        v10 = [v9 role];
        if (![v10 isEqualToString:@"SBTraitsParticipantRoleAXUIServer"])
        {
          v11 = 0;
          goto LABEL_12;
        }
        if (_AXSClassicInvertColorsEnabled())
        {

LABEL_11:
          id v13 = objc_alloc(MEMORY[0x1E4FAFFE0]);
          id v14 = objc_alloc(MEMORY[0x1E4FAFFC8]);
          v10 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.0];
          v15 = (void *)[v14 initWithAnimationSettings:v10 drawingFence:0];
          v11 = (void *)[v13 initWithActuationContext:v15];

LABEL_12:
          goto LABEL_13;
        }
        int v12 = _AXSInvertColorsEnabled();

        if (v12) {
          goto LABEL_11;
        }
        v11 = 0;
LABEL_13:
        [v9 setUserInterfaceStyleResolutionPolicyInfo:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v16 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v6 = v16;
    }
    while (v16);
  }
}

@end