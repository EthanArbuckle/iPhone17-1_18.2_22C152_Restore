@interface SBTraitsRoleFollowsDeviceOrientationPolicySpecifier
- (NSArray)deviceOrientationStateTypes;
- (NSString)targetRole;
- (SBTraitsRoleFollowsDeviceOrientationPolicySpecifier)initWithComponentOrder:(id)a3;
- (void)setDeviceOrientationStateTypes:(id)a3;
- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4;
@end

@implementation SBTraitsRoleFollowsDeviceOrientationPolicySpecifier

- (SBTraitsRoleFollowsDeviceOrientationPolicySpecifier)initWithComponentOrder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBTraitsRoleFollowsDeviceOrientationPolicySpecifier;
  v3 = [(SBTraitsOrientationStageComponent *)&v8 initWithComponentOrder:a3];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(SBTraitsRoleFollowsDeviceOrientationPolicySpecifier *)v3 targetRole];
    targetRole = v4->_targetRole;
    v4->_targetRole = (NSString *)v5;

    [(SBTraitsRoleFollowsDeviceOrientationPolicySpecifier *)v4 setDeviceOrientationStateTypes:0];
  }
  return v4;
}

- (NSString)targetRole
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"SBTraitsOrientationStageComponents.m", 496, @"This class[%@] shouldn't be directly used, pick a subclass.", v6 object file lineNumber description];

  return 0;
}

- (void)setDeviceOrientationStateTypes:(id)a3
{
  v4 = (NSArray *)a3;
  uint64_t v5 = (NSArray *)&unk_1F3348540;
  if (v4) {
    uint64_t v5 = v4;
  }
  deviceOrientationStateTypes = self->_deviceOrientationStateTypes;
  self->_deviceOrientationStateTypes = v5;
}

- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "role", (void)v14);
        int v12 = [v11 isEqualToString:self->_targetRole];

        if (v12)
        {
          v13 = [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoDeviceOrientationWithStateTypes:self->_deviceOrientationStateTypes];
          [v10 setOrientationResolutionPolicyInfo:v13];

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (NSArray)deviceOrientationStateTypes
{
  return self->_deviceOrientationStateTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceOrientationStateTypes, 0);
  objc_storeStrong((id *)&self->_targetRole, 0);
}

@end