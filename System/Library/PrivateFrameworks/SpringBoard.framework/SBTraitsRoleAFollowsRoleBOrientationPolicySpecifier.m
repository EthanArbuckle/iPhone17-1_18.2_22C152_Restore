@interface SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier
- (BOOL)animate;
- (BOOL)force;
- (NSString)roleA;
- (NSString)roleB;
- (SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier)initWithComponentOrder:(id)a3;
- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4;
@end

@implementation SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier

- (SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier)initWithComponentOrder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier;
  v3 = [(SBTraitsOrientationStageComponent *)&v10 initWithComponentOrder:a3];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier *)v3 roleA];
    roleA = v4->_roleA;
    v4->_roleA = (NSString *)v5;

    uint64_t v7 = [(SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier *)v4 roleB];
    roleB = v4->_roleB;
    v4->_roleB = (NSString *)v7;

    v4->_force = [(SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier *)v4 force];
    v4->_animate = [(SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier *)v4 animate];
  }
  return v4;
}

- (BOOL)force
{
  return 0;
}

- (BOOL)animate
{
  return 1;
}

- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "role", (void)v15);
        int v12 = [v11 isEqualToString:self->_roleA];

        if (v12)
        {
          v13 = [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoForAssociatedParticipantWithRole:self->_roleB];
          [v13 setForceResolution:self->_force];
          if (self->_animate)
          {
            [v13 setActuationContext:0];
          }
          else
          {
            v14 = (void *)[objc_alloc(MEMORY[0x1E4FAFFC8]) initWithAnimationSettings:0 drawingFence:0];
            [v13 setActuationContext:v14];
          }
          [v10 setOrientationResolutionPolicyInfo:v13];

          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roleB, 0);
  objc_storeStrong((id *)&self->_roleA, 0);
}

- (NSString)roleA
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"SBTraitsOrientationStageComponents.m", 451, @"This class[%@] shouldn't be directly used, pick a subclass.", v6 object file lineNumber description];

  return 0;
}

- (NSString)roleB
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"SBTraitsOrientationStageComponents.m", 456, @"This class[%@] shouldn't be directly used, pick a subclass.", v6 object file lineNumber description];

  return 0;
}

@end