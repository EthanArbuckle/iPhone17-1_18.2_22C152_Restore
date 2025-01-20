@interface SBAbstractTraitsSwitcherPolicySpecifier
- (SBAbstractTraitsSwitcherPolicySpecifier)initWithComponentOrder:(id)a3 arbiter:(id)a4;
- (id)_specifierDescription;
- (void)_updateAcquiredParticipantsPolicies:(id)a3 context:(id)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SBAbstractTraitsSwitcherPolicySpecifier

void __74__SBAbstractTraitsSwitcherPolicySpecifier_initWithComponentOrder_arbiter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _updateAcquiredParticipantsPolicies:v6 context:v5];
}

- (SBAbstractTraitsSwitcherPolicySpecifier)initWithComponentOrder:(id)a3 arbiter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBAbstractTraitsSwitcherPolicySpecifier;
  v8 = [(SBAbstractTraitsSwitcherPolicySpecifier *)&v16 init];
  if (v8)
  {
    objc_initWeak(&location, v8);
    v9 = [SBTraitsPipelineBlockBasedPolicySpecifier alloc];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__SBAbstractTraitsSwitcherPolicySpecifier_initWithComponentOrder_arbiter___block_invoke;
    v13[3] = &unk_1E6AFC590;
    objc_copyWeak(&v14, &location);
    uint64_t v10 = [(SBTraitsPipelineBlockBasedPolicySpecifier *)v9 initWithPolicySpecifierBlock:v13 specifierDescription:@"None" componentOrder:v6 arbiter:v7];
    blockBasedPolicySpecifier = v8->_blockBasedPolicySpecifier;
    v8->_blockBasedPolicySpecifier = (SBTraitsPipelineBlockBasedPolicySpecifier *)v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)dealloc
{
  [(SBTraitsPipelineBlockBasedPolicySpecifier *)self->_blockBasedPolicySpecifier invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBAbstractTraitsSwitcherPolicySpecifier;
  [(SBAbstractTraitsSwitcherPolicySpecifier *)&v3 dealloc];
}

- (void)invalidate
{
  [(SBTraitsPipelineBlockBasedPolicySpecifier *)self->_blockBasedPolicySpecifier invalidate];
  blockBasedPolicySpecifier = self->_blockBasedPolicySpecifier;
  self->_blockBasedPolicySpecifier = 0;
}

- (void).cxx_destruct
{
}

- (void)_updateAcquiredParticipantsPolicies:(id)a3 context:(id)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (id)_specifierDescription
{
  return 0;
}

@end