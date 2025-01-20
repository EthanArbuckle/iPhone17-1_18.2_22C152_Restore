@interface STStatusDomainDataChangeContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserInitiated;
- (NSString)description;
- (STStatusDomainDataChangeContext)init;
- (STStatusDomainDataChangeContext)initWithCoder:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusDomainDataChangeContext

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id result = +[STMutableStatusDomainDataChangeContext allocWithZone:a3];
  if (result)
  {
    id v5 = result;
    BOOL v6 = [(STStatusDomainDataChangeContext *)self isUserInitiated];
    v7.receiver = v5;
    v7.super_class = (Class)STStatusDomainDataChangeContext;
    id result = [(STStatusDomainDataChangeContext *)&v7 init];
    if (result) {
      *((unsigned char *)result + 8) = v6;
    }
  }
  return result;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (STStatusDomainDataChangeContext)init
{
  if (self)
  {
    v2 = self;
    char v3 = [0 isUserInitiated];
    v4.receiver = v2;
    v4.super_class = (Class)STStatusDomainDataChangeContext;
    self = [(STStatusDomainDataChangeContext *)&v4 init];
    if (self) {
      self->_userInitiated = v3;
    }
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[STStatusDomainDataChangeContext isUserInitiated](self, "isUserInitiated"), @"userInitiated");
}

- (STStatusDomainDataChangeContext)initWithCoder:(id)a3
{
  char v4 = [a3 decodeBoolForKey:@"userInitiated"];
  if (!self) {
    return 0;
  }
  BOOL v5 = v4;
  v7.receiver = self;
  v7.super_class = (Class)STStatusDomainDataChangeContext;
  id result = [(STStatusDomainDataChangeContext *)&v7 init];
  if (result) {
    result->_userInitiated = v5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  uint64_t v6 = [(STStatusDomainDataChangeContext *)self isUserInitiated];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__STStatusDomainDataChangeContext_isEqual___block_invoke;
  v10[3] = &unk_1E6B630D0;
  id v11 = v4;
  id v7 = v4;
  id v8 = (id)[v5 appendBool:v6 counterpart:v10];
  LOBYTE(v6) = [v5 isEqual];

  return v6;
}

uint64_t __43__STStatusDomainDataChangeContext_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) isUserInitiated];
}

- (unint64_t)hash
{
  char v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendBool:", -[STStatusDomainDataChangeContext isUserInitiated](self, "isUserInitiated"));
  unint64_t v5 = [v3 hash];

  return v5;
}

- (NSString)description
{
  return (NSString *)[(STStatusDomainDataChangeContext *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STStatusDomainDataChangeContext *)self succinctDescriptionBuilder];
  char v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  char v3 = [(STStatusDomainDataChangeContext *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  char v3 = -[STStatusDomainDataChangeContext _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  id v4 = [v3 build];

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v3 = a1;
  if (a1)
  {
    id v5 = a2;
    uint64_t v6 = [v3 succinctDescriptionBuilder];
    [v6 setUseDebugDescription:a3];
    [v6 setActiveMultilinePrefix:v5];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__STStatusDomainDataChangeContext__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v9[3] = &unk_1E6B63080;
    id v7 = v6;
    id v10 = v7;
    id v11 = v3;
    [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v9];

    id v3 = v7;
  }

  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STStatusDomainDataChangeContext _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

id __83__STStatusDomainDataChangeContext__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isUserInitiated"), @"userInitiated");
}

@end