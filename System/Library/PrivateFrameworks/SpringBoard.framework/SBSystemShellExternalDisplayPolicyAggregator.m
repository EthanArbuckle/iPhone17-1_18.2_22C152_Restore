@interface SBSystemShellExternalDisplayPolicyAggregator
- (BOOL)allowsCapability:(int64_t)a3;
- (BOOL)allowsCapability:(int64_t)a3 explanation:(id *)a4;
- (BOOL)allowsTransitionRequest:(id)a3;
- (SBSystemShellExternalDisplayPolicyAggregator)initWithDefaults:(id)a3 displayIdentity:(id)a4 policyDataSource:(id)a5;
@end

@implementation SBSystemShellExternalDisplayPolicyAggregator

- (SBSystemShellExternalDisplayPolicyAggregator)initWithDefaults:(id)a3 displayIdentity:(id)a4 policyDataSource:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBSystemShellExternalDisplayPolicyAggregator;
  v12 = [(SBSystemShellExternalDisplayPolicyAggregator *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_defaults, a3);
    objc_storeStrong((id *)&v13->_displayIdentity, a4);
    objc_storeWeak((id *)&v13->_policyDataSource, v11);
  }

  return v13;
}

- (BOOL)allowsCapability:(int64_t)a3
{
  return [(SBSystemShellExternalDisplayPolicyAggregator *)self allowsCapability:a3 explanation:0];
}

- (BOOL)allowsCapability:(int64_t)a3 explanation:(id *)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_policyDataSource);
  LOBYTE(a4) = [WeakRetained allowsCapability:a3 explanation:a4];

  return (char)a4;
}

- (BOOL)allowsTransitionRequest:(id)a3
{
  p_policyDataSource = &self->_policyDataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_policyDataSource);
  char v6 = [WeakRetained allowsTransitionRequest:v4];

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_policyDataSource);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end