@interface SBSAContainerStaticTouchAction
- (BOOL)isEqual:(id)a3;
- (NSArray)reasons;
- (NSString)description;
- (NSUUID)associatedInterfaceElementIdentifier;
- (SBSAContainerStaticTouchAction)initWithAssociatedInterfaceElementIdentifier:(id)a3 reasons:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation SBSAContainerStaticTouchAction

- (SBSAContainerStaticTouchAction)initWithAssociatedInterfaceElementIdentifier:(id)a3 reasons:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBSAContainerStaticTouchAction;
  v8 = [(SBSAContainerStaticTouchAction *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    associatedInterfaceElementIdentifier = v8->_associatedInterfaceElementIdentifier;
    v8->_associatedInterfaceElementIdentifier = (NSUUID *)v9;

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
  associatedInterfaceElementIdentifier = self->_associatedInterfaceElementIdentifier;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __42__SBSAContainerStaticTouchAction_isEqual___block_invoke;
  v19[3] = &unk_1E6AF9E90;
  id v7 = v4;
  id v20 = v7;
  v8 = [v5 appendObject:associatedInterfaceElementIdentifier counterpart:v19];
  reasons = self->_reasons;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __42__SBSAContainerStaticTouchAction_isEqual___block_invoke_2;
  v17 = &unk_1E6AF9E90;
  id v18 = v7;
  id v10 = v7;
  uint64_t v11 = [v8 appendObject:reasons counterpart:&v14];
  char v12 = objc_msgSend(v11, "isEqual", v14, v15, v16, v17);

  return v12;
}

uint64_t __42__SBSAContainerStaticTouchAction_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) associatedInterfaceElementIdentifier];
}

uint64_t __42__SBSAContainerStaticTouchAction_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reason];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendObject:self->_associatedInterfaceElementIdentifier];
  v5 = [v4 appendObject:self->_reasons];
  unint64_t v6 = [v5 hash];

  return v6;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; associatedInterfaceElementIdentifier: %@; reasons: %@>",
                       objc_opt_class(),
                       self,
                       self->_associatedInterfaceElementIdentifier,
                       self->_reasons);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  reasons = self->_reasons;
  associatedInterfaceElementIdentifier = self->_associatedInterfaceElementIdentifier;
  return (id)[v4 initWithAssociatedInterfaceElementIdentifier:associatedInterfaceElementIdentifier reasons:reasons];
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (NSUUID)associatedInterfaceElementIdentifier
{
  return self->_associatedInterfaceElementIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedInterfaceElementIdentifier, 0);
  objc_storeStrong((id *)&self->_reasons, 0);
}

@end