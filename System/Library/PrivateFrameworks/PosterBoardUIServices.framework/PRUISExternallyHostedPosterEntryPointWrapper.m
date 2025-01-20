@interface PRUISExternallyHostedPosterEntryPointWrapper
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)wrapperWithEntryPoint:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSUUID)requestUUID;
- (PRUISExternallyHostedPosterEntryPointWrapper)initWithBSXPCCoder:(id)a3;
- (PRUISModalEntryPoint)entryPoint;
- (id)_entryPointClassForTypeString:(uint64_t)a1;
- (id)_entryPointTypeStringForEntryPoint:(void *)a1;
- (id)_initWithEntryPoint:(id)a3 requestUUID:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation PRUISExternallyHostedPosterEntryPointWrapper

- (id)_initWithEntryPoint:(id)a3 requestUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PRUISExternallyHostedPosterEntryPointWrapper;
  v8 = [(PRUISExternallyHostedPosterEntryPointWrapper *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copyWithZone:0];
    entryPoint = v8->_entryPoint;
    v8->_entryPoint = (PRUISModalEntryPoint *)v9;

    objc_storeStrong((id *)&v8->_requestUUID, a4);
  }

  return v8;
}

+ (id)wrapperWithEntryPoint:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [MEMORY[0x263F08C38] UUID];
  id v7 = (void *)[v5 _initWithEntryPoint:v4 requestUUID:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = v4;
  entryPoint = self->_entryPoint;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __56__PRUISExternallyHostedPosterEntryPointWrapper_isEqual___block_invoke;
  v19[3] = &unk_26546B0E0;
  id v8 = v6;
  id v20 = v8;
  id v9 = (id)[v5 appendObject:entryPoint counterpart:v19];
  requestUUID = self->_requestUUID;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __56__PRUISExternallyHostedPosterEntryPointWrapper_isEqual___block_invoke_2;
  v17 = &unk_26546B108;
  id v18 = v8;
  id v11 = v8;
  id v12 = (id)[v5 appendObject:requestUUID counterpart:&v14];
  LOBYTE(requestUUID) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return (char)requestUUID;
}

uint64_t __56__PRUISExternallyHostedPosterEntryPointWrapper_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) entryPoint];
}

uint64_t __56__PRUISExternallyHostedPosterEntryPointWrapper_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestUUID];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendObject:self->_entryPoint];
  id v5 = (id)[v3 appendObject:self->_requestUUID];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(PRUISExternallyHostedPosterEntryPointWrapper *)self descriptionWithMultilinePrefix:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  unint64_t v6 = (void *)[(PRUISModalEntryPoint *)self->_entryPoint copyWithZone:a3];
  id v7 = (void *)[(NSUUID *)self->_requestUUID copyWithZone:a3];
  id v8 = (void *)[v5 _initWithEntryPoint:v6 requestUUID:v7];

  return v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRUISExternallyHostedPosterEntryPointWrapper)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeStringForKey:@"typeString"];
  id v6 = -[PRUISExternallyHostedPosterEntryPointWrapper _entryPointClassForTypeString:]((uint64_t)self, v5);
  if (v5)
  {
    id v7 = [v4 decodeObjectOfClass:v6 forKey:@"entryPoint"];
    id v8 = self;
    id v9 = [v4 decodeObjectOfClass:v8 forKey:@"requestUUID"];

    self = (PRUISExternallyHostedPosterEntryPointWrapper *)[(PRUISExternallyHostedPosterEntryPointWrapper *)self _initWithEntryPoint:v7 requestUUID:v9];
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_entryPointClassForTypeString:(uint64_t)a1
{
  v7[7] = *MEMORY[0x263EF8340];
  if (a1)
  {
    v6[0] = @"FocusPosterSelection";
    id v2 = a2;
    v7[0] = objc_opt_class();
    v6[1] = @"PosterSelection";
    v7[1] = objc_opt_class();
    v6[2] = @"Gallery";
    v7[2] = objc_opt_class();
    v6[3] = @"Editing";
    v7[3] = objc_opt_class();
    v6[4] = @"HomeScreenSwitcher";
    v7[4] = objc_opt_class();
    v6[5] = @"EditHomeScreen";
    v7[5] = objc_opt_class();
    v6[6] = @"AmbientEditingSwitcher";
    v7[6] = objc_opt_class();
    v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:7];
    id v4 = [v3 objectForKey:v2];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  entryPoint = self->_entryPoint;
  id v5 = a3;
  -[PRUISExternallyHostedPosterEntryPointWrapper _entryPointTypeStringForEntryPoint:](self, entryPoint);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"typeString"];
  [v5 encodeObject:self->_entryPoint forKey:@"entryPoint"];
  [v5 encodeObject:self->_requestUUID forKey:@"requestUUID"];
}

- (id)_entryPointTypeStringForEntryPoint:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v5 = [MEMORY[0x263F08690] currentHandler];
      [v5 handleFailureInMethod:sel__entryPointTypeStringForEntryPoint_, a1, @"PRUISExternallyHostedPosterEntryPointWrapper.m", 104, @"%@ should implement -_BSXPCSecureCodingEntryPointTypeString!", v3 object file lineNumber description];
    }
    a1 = [v3 _BSXPCSecureCodingEntryPointTypeString];
  }

  return a1;
}

- (id)succinctDescription
{
  id v2 = [(PRUISExternallyHostedPosterEntryPointWrapper *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x263F29C40] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(PRUISExternallyHostedPosterEntryPointWrapper *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(PRUISExternallyHostedPosterEntryPointWrapper *)self succinctDescriptionBuilder];
  [v5 setActiveMultilinePrefix:v4];

  id v6 = [v5 activeMultilinePrefix];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __86__PRUISExternallyHostedPosterEntryPointWrapper_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_26546B148;
  id v7 = v5;
  id v11 = v7;
  id v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v6 block:v10];

  id v8 = v7;
  return v8;
}

id __86__PRUISExternallyHostedPosterEntryPointWrapper_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"entryPoint"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"requestUUID"];
}

- (PRUISModalEntryPoint)entryPoint
{
  return self->_entryPoint;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestUUID, 0);

  objc_storeStrong((id *)&self->_entryPoint, 0);
}

@end