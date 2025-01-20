@interface SBTraitsRoleActuatesWithCustomContext
- (NSString)role;
- (SBTraitsRoleActuatesWithCustomContext)initWithComponentOrder:(id)a3;
- (SBTraitsRoleActuatesWithCustomContext)initWithComponentOrder:(id)a3 actuationContext:(id)a4;
- (TRASettingsActuationContext)actuationContext;
- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4;
@end

@implementation SBTraitsRoleActuatesWithCustomContext

- (SBTraitsRoleActuatesWithCustomContext)initWithComponentOrder:(id)a3
{
  return [(SBTraitsRoleActuatesWithCustomContext *)self initWithComponentOrder:a3 actuationContext:0];
}

- (SBTraitsRoleActuatesWithCustomContext)initWithComponentOrder:(id)a3 actuationContext:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBTraitsRoleActuatesWithCustomContext;
  v7 = [(SBTraitsOrientationStageComponent *)&v14 initWithComponentOrder:a3];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(SBTraitsRoleActuatesWithCustomContext *)v7 role];
    role = v8->_role;
    v8->_role = (NSString *)v9;

    uint64_t v11 = [v6 copy];
    actuationContext = v8->_actuationContext;
    v8->_actuationContext = (TRASettingsActuationContext *)v11;
  }
  return v8;
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
        uint64_t v11 = objc_msgSend(v10, "role", (void)v14);
        int v12 = [v11 isEqualToString:self->_role];

        if (v12)
        {
          v13 = [v10 orientationResolutionPolicyInfo];
          [v13 setActuationContext:self->_actuationContext];

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

- (NSString)role
{
  return self->_role;
}

- (TRASettingsActuationContext)actuationContext
{
  return self->_actuationContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actuationContext, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

@end