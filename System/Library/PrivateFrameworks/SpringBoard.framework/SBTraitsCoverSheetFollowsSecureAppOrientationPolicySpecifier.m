@interface SBTraitsCoverSheetFollowsSecureAppOrientationPolicySpecifier
- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4;
@end

@implementation SBTraitsCoverSheetFollowsSecureAppOrientationPolicySpecifier

- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4
{
  v5 = @"SBTraitsParticipantRoleSecureApp";
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __114__SBTraitsCoverSheetFollowsSecureAppOrientationPolicySpecifier_updateStageParticipantsResolutionPolicies_context___block_invoke;
  v10[3] = &unk_1E6AFCB70;
  v11 = v5;
  id v6 = a3;
  int v7 = objc_msgSend(v6, "bs_containsObjectPassingTest:", v10);
  v8 = objc_msgSend(v6, "bs_firstObjectPassingTest:", &__block_literal_global_90);

  if (v8 && v7)
  {
    v9 = [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoForAssociatedParticipantWithRole:v5];
    [v8 setOrientationResolutionPolicyInfo:v9];
  }
}

uint64_t __114__SBTraitsCoverSheetFollowsSecureAppOrientationPolicySpecifier_updateStageParticipantsResolutionPolicies_context___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 role];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __114__SBTraitsCoverSheetFollowsSecureAppOrientationPolicySpecifier_updateStageParticipantsResolutionPolicies_context___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 role];
  uint64_t v3 = [v2 isEqualToString:@"SBTraitsParticipantRoleCoverSheet"];

  return v3;
}

@end