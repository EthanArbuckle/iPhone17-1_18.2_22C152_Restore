@interface TRAArbiterUpdateOrientationResolutionPolicySpecifier
- (BOOL)forceResolution;
- (NSArray)participantsUniqueIdentifiers;
- (NSNumber)componentOrder;
- (TRAArbiterUpdateOrientationResolutionPolicySpecifier)initWithComponentOrder:(id)a3;
- (TRASettingsActuationContext)actuationContext;
- (int64_t)preferencesType;
- (void)setActuationContext:(id)a3;
- (void)setForceResolution:(BOOL)a3;
- (void)setParticipantsUniqueIdentifiers:(id)a3;
- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4;
@end

@implementation TRAArbiterUpdateOrientationResolutionPolicySpecifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actuationContext, 0);
  objc_destroyWeak((id *)&self->_participantsUniqueIdentifiers);
  objc_storeStrong((id *)&self->_componentOrder, 0);
}

- (NSNumber)componentOrder
{
  return self->_componentOrder;
}

- (void)setParticipantsUniqueIdentifiers:(id)a3
{
}

- (void)setForceResolution:(BOOL)a3
{
  self->_forceResolution = a3;
}

- (void)setActuationContext:(id)a3
{
}

- (int64_t)preferencesType
{
  return 1;
}

- (TRAArbiterUpdateOrientationResolutionPolicySpecifier)initWithComponentOrder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRAArbiterUpdateOrientationResolutionPolicySpecifier;
  v5 = [(TRAArbiterUpdateOrientationResolutionPolicySpecifier *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    componentOrder = v5->_componentOrder;
    v5->_componentOrder = (NSNumber *)v6;
  }
  return v5;
}

- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_participantsUniqueIdentifiers);
        v12 = [v10 uniqueIdentifier];
        int v13 = [WeakRetained containsObject:v12];

        if (v13)
        {
          v14 = [v10 orientationResolutionPolicyInfo];
          [v14 setForceResolution:self->_forceResolution];
          [v14 setActuationContext:self->_actuationContext];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (NSArray)participantsUniqueIdentifiers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_participantsUniqueIdentifiers);
  return (NSArray *)WeakRetained;
}

- (BOOL)forceResolution
{
  return self->_forceResolution;
}

- (TRASettingsActuationContext)actuationContext
{
  return self->_actuationContext;
}

@end