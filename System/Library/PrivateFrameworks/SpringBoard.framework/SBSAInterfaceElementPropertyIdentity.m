@interface SBSAInterfaceElementPropertyIdentity
- (BOOL)isBoundsProperty;
- (BOOL)isContentBoundsProperty;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)interfaceElementProperty;
- (NSUUID)associatedInterfaceElementIdentifier;
- (SBSAInterfaceElementPropertyIdentity)initWithAssociatedInterfaceElementIdentifier:(id)a3 andProperty:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation SBSAInterfaceElementPropertyIdentity

uint64_t __48__SBSAInterfaceElementPropertyIdentity_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) associatedInterfaceElementIdentifier];
}

uint64_t __48__SBSAInterfaceElementPropertyIdentity_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) interfaceElementProperty];
}

- (BOOL)isContentBoundsProperty
{
  return BSEqualStrings();
}

- (NSString)interfaceElementProperty
{
  return self->_interfaceElementProperty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceElementProperty, 0);
  objc_storeStrong((id *)&self->_associatedInterfaceElementIdentifier, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  associatedInterfaceElementIdentifier = self->_associatedInterfaceElementIdentifier;
  interfaceElementProperty = self->_interfaceElementProperty;
  return (id)[v4 initWithAssociatedInterfaceElementIdentifier:associatedInterfaceElementIdentifier andProperty:interfaceElementProperty];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  associatedInterfaceElementIdentifier = self->_associatedInterfaceElementIdentifier;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __48__SBSAInterfaceElementPropertyIdentity_isEqual___block_invoke;
  v19[3] = &unk_1E6AF9E90;
  id v7 = v4;
  id v20 = v7;
  v8 = [v5 appendObject:associatedInterfaceElementIdentifier counterpart:v19];
  interfaceElementProperty = self->_interfaceElementProperty;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __48__SBSAInterfaceElementPropertyIdentity_isEqual___block_invoke_2;
  v17 = &unk_1E6AFD560;
  id v18 = v7;
  id v10 = v7;
  v11 = [v8 appendString:interfaceElementProperty counterpart:&v14];
  char v12 = objc_msgSend(v11, "isEqual", v14, v15, v16, v17);

  return v12;
}

- (NSUUID)associatedInterfaceElementIdentifier
{
  return self->_associatedInterfaceElementIdentifier;
}

- (SBSAInterfaceElementPropertyIdentity)initWithAssociatedInterfaceElementIdentifier:(id)a3 andProperty:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7 || ![v8 length])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBSAViewDescription.m", 236, @"Invalid parameter not satisfying: %@", @"(associatedInterfaceElementIdentifier != nil) && ([property length] > 0)" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)SBSAInterfaceElementPropertyIdentity;
  id v10 = [(SBSAInterfaceElementPropertyIdentity *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    associatedInterfaceElementIdentifier = v10->_associatedInterfaceElementIdentifier;
    v10->_associatedInterfaceElementIdentifier = (NSUUID *)v11;

    uint64_t v13 = [v9 copy];
    interfaceElementProperty = v10->_interfaceElementProperty;
    v10->_interfaceElementProperty = (NSString *)v13;
  }
  return v10;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendObject:self->_associatedInterfaceElementIdentifier];
  v5 = [v4 appendString:self->_interfaceElementProperty];
  unint64_t v6 = [v5 hash];

  return v6;
}

- (BOOL)isBoundsProperty
{
  return BSEqualStrings();
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; associatedInterfaceElementIdentifier: %@; interfaceElementProperty: %@>",
                       objc_opt_class(),
                       self,
                       self->_associatedInterfaceElementIdentifier,
                       self->_interfaceElementProperty);
}

@end