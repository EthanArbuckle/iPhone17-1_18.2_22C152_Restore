@interface STLocationStatusDomainDataChangeContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserInitiated;
- (BOOL)wantsProminentIndication;
- (NSString)description;
- (STLocationStatusDomainDataChangeContext)init;
- (STLocationStatusDomainDataChangeContext)initWithCoder:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initWithChangeContext:(id)result;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STLocationStatusDomainDataChangeContext

- (STLocationStatusDomainDataChangeContext)initWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [v4 decodeBoolForKey:@"userInitiated"];
  char v6 = [v4 decodeBoolForKey:@"wantsProminentIndication"];

  if (!self) {
    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)STLocationStatusDomainDataChangeContext;
  result = [(STLocationStatusDomainDataChangeContext *)&v8 init];
  if (result)
  {
    result->_userInitiated = v5;
    result->_wantsProminentIndication = v6;
  }
  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[STMutableLocationStatusDomainDataChangeContext allocWithZone:a3];

  return -[STLocationStatusDomainDataChangeContext initWithChangeContext:](v4, self);
}

- (STLocationStatusDomainDataChangeContext)init
{
  return (STLocationStatusDomainDataChangeContext *)-[STLocationStatusDomainDataChangeContext initWithChangeContext:](self, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[STLocationStatusDomainDataChangeContext isUserInitiated](self, "isUserInitiated"), @"userInitiated");
  objc_msgSend(v4, "encodeBool:forKey:", -[STLocationStatusDomainDataChangeContext wantsProminentIndication](self, "wantsProminentIndication"), @"wantsProminentIndication");
}

- (BOOL)wantsProminentIndication
{
  return self->_wantsProminentIndication;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (id)initWithChangeContext:(id)result
{
  if (result)
  {
    v2 = result;
    id v3 = a2;
    char v4 = [v3 isUserInitiated];
    char v5 = [v3 wantsProminentIndication];

    v6.receiver = v2;
    v6.super_class = (Class)STLocationStatusDomainDataChangeContext;
    result = objc_msgSendSuper2(&v6, sel_init);
    if (result)
    {
      *((unsigned char *)result + 8) = v4;
      *((unsigned char *)result + 9) = v5;
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  BOOL v6 = [(STLocationStatusDomainDataChangeContext *)self isUserInitiated];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __51__STLocationStatusDomainDataChangeContext_isEqual___block_invoke;
  v18[3] = &unk_1E6B630D0;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendBool:v6 counterpart:v18];
  uint64_t v9 = [(STLocationStatusDomainDataChangeContext *)self wantsProminentIndication];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __51__STLocationStatusDomainDataChangeContext_isEqual___block_invoke_2;
  v16 = &unk_1E6B630D0;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendBool:v9 counterpart:&v13];
  LOBYTE(v9) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return v9;
}

uint64_t __51__STLocationStatusDomainDataChangeContext_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) isUserInitiated];
}

uint64_t __51__STLocationStatusDomainDataChangeContext_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) wantsProminentIndication];
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendBool:", -[STLocationStatusDomainDataChangeContext isUserInitiated](self, "isUserInitiated"));
  id v5 = (id)objc_msgSend(v3, "appendBool:", -[STLocationStatusDomainDataChangeContext wantsProminentIndication](self, "wantsProminentIndication"));
  unint64_t v6 = [v3 hash];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(STLocationStatusDomainDataChangeContext *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STLocationStatusDomainDataChangeContext *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STLocationStatusDomainDataChangeContext *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v3 = self;
  if (self)
  {
    id v4 = a3;
    id v5 = [(STLocationStatusDomainDataChangeContext *)v3 succinctDescriptionBuilder];
    [v5 setUseDebugDescription:0];
    [v5 setActiveMultilinePrefix:v4];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __91__STLocationStatusDomainDataChangeContext__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v8[3] = &unk_1E6B63080;
    id v6 = v5;
    id v9 = v6;
    id v10 = v3;
    [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];

    id v3 = (STLocationStatusDomainDataChangeContext *)v6;
  }

  return v3;
}

id __91__STLocationStatusDomainDataChangeContext__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isUserInitiated"), @"userInitiated");
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "wantsProminentIndication"), @"wantsProminentIndication");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end