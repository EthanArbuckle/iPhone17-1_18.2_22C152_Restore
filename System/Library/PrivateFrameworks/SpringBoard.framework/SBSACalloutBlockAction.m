@interface SBSACalloutBlockAction
- (BOOL)isEqual:(id)a3;
- (NSArray)reasons;
- (NSString)description;
- (SBSACalloutBlockAction)initWithCalloutBlock:(id)a3 reasons:(id)a4;
- (id)calloutBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation SBSACalloutBlockAction

- (SBSACalloutBlockAction)initWithCalloutBlock:(id)a3 reasons:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBSACalloutBlockAction;
  v8 = [(SBSACalloutBlockAction *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    id calloutBlock = v8->_calloutBlock;
    v8->_id calloutBlock = (id)v9;

    uint64_t v11 = [v7 copy];
    reasons = v8->_reasons;
    v8->_reasons = (NSArray *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = (void *)MEMORY[0x1D948C7A0](self->_calloutBlock);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __34__SBSACalloutBlockAction_isEqual___block_invoke;
  v19[3] = &unk_1E6AF9E90;
  id v7 = v4;
  id v20 = v7;
  v8 = [v5 appendObject:v6 counterpart:v19];
  reasons = self->_reasons;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __34__SBSACalloutBlockAction_isEqual___block_invoke_2;
  v17 = &unk_1E6AF9E90;
  id v18 = v7;
  id v10 = v7;
  uint64_t v11 = [v8 appendObject:reasons counterpart:&v14];
  char v12 = objc_msgSend(v11, "isEqual", v14, v15, v16, v17);

  return v12;
}

uint64_t __34__SBSACalloutBlockAction_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) calloutBlock];
}

uint64_t __34__SBSACalloutBlockAction_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reasons];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (void *)MEMORY[0x1D948C7A0](self->_calloutBlock);
  v5 = [v3 appendObject:v4];
  id v6 = [v5 appendObject:self->_reasons];
  unint64_t v7 = [v6 hash];

  return v7;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x1D948C7A0](self->_calloutBlock);
  id v6 = [v3 stringWithFormat:@"<%@: %p; calloutBlock: %@; reasons: %@>", v4, self, v5, self->_reasons];

  return (NSString *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  reasons = self->_reasons;
  id calloutBlock = self->_calloutBlock;
  return (id)[v4 initWithCalloutBlock:calloutBlock reasons:reasons];
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (id)calloutBlock
{
  return self->_calloutBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_calloutBlock, 0);
  objc_storeStrong((id *)&self->_reasons, 0);
}

@end