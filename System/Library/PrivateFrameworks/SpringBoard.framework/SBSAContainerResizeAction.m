@interface SBSAContainerResizeAction
- (BOOL)isEqual:(id)a3;
- (NSArray)reasons;
- (NSString)description;
- (NSUUID)associatedInterfaceElementIdentifier;
- (SBSAContainerResizeAction)initWithResult:(int64_t)a3 associatedInterfaceElementIdentifier:(id)a4 reasons:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)resizeActionResult;
- (unint64_t)hash;
@end

@implementation SBSAContainerResizeAction

- (SBSAContainerResizeAction)initWithResult:(int64_t)a3 associatedInterfaceElementIdentifier:(id)a4 reasons:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBSAContainerResizeAction;
  v10 = [(SBSAContainerResizeAction *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_resizeActionResult = a3;
    uint64_t v12 = [v8 copy];
    associatedInterfaceElementIdentifier = v11->_associatedInterfaceElementIdentifier;
    v11->_associatedInterfaceElementIdentifier = (NSUUID *)v12;

    uint64_t v14 = [v9 copy];
    reasons = v11->_reasons;
    v11->_reasons = (NSArray *)v14;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  int64_t resizeActionResult = self->_resizeActionResult;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __37__SBSAContainerResizeAction_isEqual___block_invoke;
  v21[3] = &unk_1E6AF9660;
  id v7 = v4;
  id v22 = v7;
  id v8 = [v5 appendInteger:resizeActionResult counterpart:v21];
  associatedInterfaceElementIdentifier = self->_associatedInterfaceElementIdentifier;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __37__SBSAContainerResizeAction_isEqual___block_invoke_2;
  v19[3] = &unk_1E6AF9E90;
  id v10 = v7;
  id v20 = v10;
  v11 = [v8 appendObject:associatedInterfaceElementIdentifier counterpart:v19];
  reasons = self->_reasons;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __37__SBSAContainerResizeAction_isEqual___block_invoke_3;
  v17[3] = &unk_1E6AF9E90;
  id v18 = v10;
  id v13 = v10;
  uint64_t v14 = [v11 appendObject:reasons counterpart:v17];
  char v15 = [v14 isEqual];

  return v15;
}

uint64_t __37__SBSAContainerResizeAction_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resizeActionResult];
}

uint64_t __37__SBSAContainerResizeAction_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) associatedInterfaceElementIdentifier];
}

uint64_t __37__SBSAContainerResizeAction_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) reasons];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendInteger:self->_resizeActionResult];
  v5 = [v4 appendObject:self->_associatedInterfaceElementIdentifier];
  v6 = [v5 appendObject:self->_reasons];
  unint64_t v7 = [v6 hash];

  return v7;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = self->_resizeActionResult + 1;
  if (v5 > 2) {
    v6 = @"[invalid]";
  }
  else {
    v6 = off_1E6AFC8C8[v5];
  }
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; resizeActionResult: %@; associatedInterfaceElementIdentifier: %@; reasons: %@>",
                       v4,
                       self,
                       v6,
                       self->_associatedInterfaceElementIdentifier,
                       self->_reasons);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t resizeActionResult = self->_resizeActionResult;
  associatedInterfaceElementIdentifier = self->_associatedInterfaceElementIdentifier;
  reasons = self->_reasons;
  return (id)[v4 initWithResult:resizeActionResult associatedInterfaceElementIdentifier:associatedInterfaceElementIdentifier reasons:reasons];
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (int64_t)resizeActionResult
{
  return self->_resizeActionResult;
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