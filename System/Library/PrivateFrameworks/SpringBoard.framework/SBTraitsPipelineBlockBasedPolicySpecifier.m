@interface SBTraitsPipelineBlockBasedPolicySpecifier
- (NSNumber)componentOrder;
- (NSString)description;
- (NSString)specifierDescription;
- (SBTraitsPipelineBlockBasedPolicySpecifier)initWithPolicySpecifierBlock:(id)a3 specifierDescription:(id)a4 componentOrder:(id)a5 arbiter:(id)a6;
- (TRAArbiter)arbiter;
- (id)specifierBlock;
- (int64_t)preferencesType;
- (void)dealloc;
- (void)invalidate;
- (void)setSpecifierDescription:(id)a3;
- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4;
@end

@implementation SBTraitsPipelineBlockBasedPolicySpecifier

- (NSNumber)componentOrder
{
  return self->_componentOrder;
}

- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4
{
}

- (int64_t)preferencesType
{
  return 1;
}

- (void)invalidate
{
  if (self->_isValid)
  {
    self->_isValid = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    v3 = [WeakRetained orientationResolutionStage];
    [v3 removeResolutionPolicySpecifier:self];
  }
}

- (void)setSpecifierDescription:(id)a3
{
}

- (SBTraitsPipelineBlockBasedPolicySpecifier)initWithPolicySpecifierBlock:(id)a3 specifierDescription:(id)a4 componentOrder:(id)a5 arbiter:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v14)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"SBTraitsPipelineBlockBasedPolicySpecifier.m", 21, @"Invalid parameter not satisfying: %@", @"arbiter" object file lineNumber description];

    if (v11)
    {
LABEL_3:
      if (v13) {
        goto LABEL_4;
      }
LABEL_10:
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2, self, @"SBTraitsPipelineBlockBasedPolicySpecifier.m", 23, @"Invalid parameter not satisfying: %@", @"componentOrder" object file lineNumber description];

      if (v12) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"SBTraitsPipelineBlockBasedPolicySpecifier.m", 22, @"Invalid parameter not satisfying: %@", @"specifierBlock" object file lineNumber description];

  if (!v13) {
    goto LABEL_10;
  }
LABEL_4:
  if (v12) {
    goto LABEL_5;
  }
LABEL_11:
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"SBTraitsPipelineBlockBasedPolicySpecifier.m", 24, @"Invalid parameter not satisfying: %@", @"specifierDescription" object file lineNumber description];

LABEL_5:
  v29.receiver = self;
  v29.super_class = (Class)SBTraitsPipelineBlockBasedPolicySpecifier;
  v15 = [(SBTraitsPipelineBlockBasedPolicySpecifier *)&v29 init];
  v16 = v15;
  if (v15)
  {
    v15->_isValid = 1;
    objc_storeWeak((id *)&v15->_arbiter, v14);
    uint64_t v17 = [v11 copy];
    id specifierBlock = v16->_specifierBlock;
    v16->_id specifierBlock = (id)v17;

    uint64_t v19 = [v13 copy];
    componentOrder = v16->_componentOrder;
    v16->_componentOrder = (NSNumber *)v19;

    uint64_t v21 = [v12 copy];
    specifierDescription = v16->_specifierDescription;
    v16->_specifierDescription = (NSString *)v21;

    v23 = [v14 orientationResolutionStage];
    [v23 addResolutionPolicySpecifier:v16 update:0];
  }
  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifierDescription, 0);
  objc_destroyWeak((id *)&self->_arbiter);
  objc_storeStrong(&self->_specifierBlock, 0);
  objc_storeStrong((id *)&self->_componentOrder, 0);
}

- (void)dealloc
{
  if (self->_isValid)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"SBTraitsPipelineBlockBasedPolicySpecifier.m" lineNumber:38 description:@"SBTraitsPipelineBlockBasedPolicySpecifier was deallocated without being invalidated first."];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBTraitsPipelineBlockBasedPolicySpecifier;
  [(SBTraitsPipelineBlockBasedPolicySpecifier *)&v5 dealloc];
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v9.receiver = self;
  v9.super_class = (Class)SBTraitsPipelineBlockBasedPolicySpecifier;
  v4 = [(SBTraitsPipelineBlockBasedPolicySpecifier *)&v9 description];
  objc_super v5 = [v3 stringWithString:v4];

  specifierDescription = self->_specifierDescription;
  v7 = [(NSNumber *)self->_componentOrder stringValue];
  [v5 appendFormat:@" %@ order: %@", specifierDescription, v7];

  return (NSString *)v5;
}

- (id)specifierBlock
{
  return self->_specifierBlock;
}

- (TRAArbiter)arbiter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
  return (TRAArbiter *)WeakRetained;
}

- (NSString)specifierDescription
{
  return self->_specifierDescription;
}

@end