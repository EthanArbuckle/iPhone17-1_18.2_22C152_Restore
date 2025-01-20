@interface SBSAPreferencesDidChangeAction
- (BOOL)isEqual:(id)a3;
- (NSArray)reasons;
- (NSString)description;
- (SBSAPreferencesDidChangeAction)initWithReasons:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation SBSAPreferencesDidChangeAction

- (SBSAPreferencesDidChangeAction)initWithReasons:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAPreferencesDidChangeAction;
  v5 = [(SBSAPreferencesDidChangeAction *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    reasons = v5->_reasons;
    v5->_reasons = (NSArray *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  reasons = self->_reasons;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__SBSAPreferencesDidChangeAction_isEqual___block_invoke;
  v11[3] = &unk_1E6AF9E90;
  id v12 = v4;
  id v7 = v4;
  v8 = [v5 appendObject:reasons counterpart:v11];
  char v9 = [v8 isEqual];

  return v9;
}

uint64_t __42__SBSAPreferencesDidChangeAction_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reasons];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendObject:self->_reasons];
  unint64_t v5 = [v4 hash];

  return v5;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; reasons: %@>",
                       objc_opt_class(),
                       self,
                       self->_reasons);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  reasons = self->_reasons;
  return (id)[v4 initWithReasons:reasons];
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (void).cxx_destruct
{
}

@end