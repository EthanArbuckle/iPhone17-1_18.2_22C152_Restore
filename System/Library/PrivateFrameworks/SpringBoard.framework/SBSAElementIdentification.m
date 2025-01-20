@interface SBSAElementIdentification
- (BOOL)isEqual:(id)a3;
- (NSString)clientIdentifier;
- (NSString)description;
- (NSString)elementIdentifier;
- (SBSAElementIdentification)initWithClientIdentifier:(id)a3 elementIdentifier:(id)a4;
- (SBSAElementIdentification)initWithElementIdentification:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation SBSAElementIdentification

- (SBSAElementIdentification)initWithClientIdentifier:(id)a3 elementIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBSAElementIdentification;
  v8 = [(SBSAElementIdentification *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    clientIdentifier = v8->_clientIdentifier;
    v8->_clientIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    elementIdentifier = v8->_elementIdentifier;
    v8->_elementIdentifier = (NSString *)v11;
  }
  return v8;
}

- (SBSAElementIdentification)initWithElementIdentification:(id)a3
{
  id v4 = a3;
  v5 = [v4 clientIdentifier];
  id v6 = [v4 elementIdentifier];

  id v7 = [(SBSAElementIdentification *)self initWithClientIdentifier:v5 elementIdentifier:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  clientIdentifier = self->_clientIdentifier;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __37__SBSAElementIdentification_isEqual___block_invoke;
  v19[3] = &unk_1E6AFD560;
  id v7 = v4;
  id v20 = v7;
  v8 = [v5 appendString:clientIdentifier counterpart:v19];
  elementIdentifier = self->_elementIdentifier;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __37__SBSAElementIdentification_isEqual___block_invoke_2;
  v17 = &unk_1E6AFD560;
  id v18 = v7;
  id v10 = v7;
  uint64_t v11 = [v8 appendString:elementIdentifier counterpart:&v14];
  char v12 = objc_msgSend(v11, "isEqual", v14, v15, v16, v17);

  return v12;
}

uint64_t __37__SBSAElementIdentification_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) clientIdentifier];
}

uint64_t __37__SBSAElementIdentification_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) elementIdentifier];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendString:self->_clientIdentifier];
  v5 = [v4 appendString:self->_elementIdentifier];
  unint64_t v6 = [v5 hash];

  return v6;
}

- (NSString)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"<%@: %p; clientIdentifier: %@; elementIdentifier: %@>",
                 objc_opt_class(),
                 self,
                 self->_clientIdentifier,
                 self->_elementIdentifier);
  return (NSString *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  clientIdentifier = self->_clientIdentifier;
  elementIdentifier = self->_elementIdentifier;
  return (id)[v4 initWithClientIdentifier:clientIdentifier elementIdentifier:elementIdentifier];
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end