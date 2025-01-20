@interface STStewieStatusDomainData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStewieActive;
- (BOOL)isStewieConnected;
- (NSString)description;
- (STStewieStatusDomainData)init;
- (STStewieStatusDomainData)initWithCoder:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)dataByApplyingDiff:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffFromData:(id)a3;
- (id)initWithData:(id)result;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStewieStatusDomainData

- (STStewieStatusDomainData)init
{
  return (STStewieStatusDomainData *)-[STStewieStatusDomainData initWithData:](self, 0);
}

- (id)initWithData:(id)result
{
  if (result)
  {
    v2 = result;
    id v3 = a2;
    char v4 = [v3 isStewieActive];
    char v5 = [v3 isStewieConnected];

    v6.receiver = v2;
    v6.super_class = (Class)STStewieStatusDomainData;
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
  BOOL v6 = [(STStewieStatusDomainData *)self isStewieActive];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __36__STStewieStatusDomainData_isEqual___block_invoke;
  v18[3] = &unk_1E6B630D0;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendBool:v6 counterpart:v18];
  uint64_t v9 = [(STStewieStatusDomainData *)self isStewieConnected];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __36__STStewieStatusDomainData_isEqual___block_invoke_2;
  v16 = &unk_1E6B630D0;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendBool:v9 counterpart:&v13];
  LOBYTE(v9) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return v9;
}

uint64_t __36__STStewieStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) isStewieActive];
}

uint64_t __36__STStewieStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) isStewieConnected];
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendBool:", -[STStewieStatusDomainData isStewieActive](self, "isStewieActive"));
  id v5 = (id)objc_msgSend(v3, "appendBool:", -[STStewieStatusDomainData isStewieConnected](self, "isStewieConnected"));
  unint64_t v6 = [v3 hash];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(STStewieStatusDomainData *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[STMutableStewieStatusDomainData allocWithZone:a3];

  return -[STStewieStatusDomainData initWithData:](v4, self);
}

- (id)succinctDescription
{
  v2 = [(STStewieStatusDomainData *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STStewieStatusDomainData *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = -[STStewieStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  id v4 = [v3 build];

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v3 = a1;
  if (a1)
  {
    id v5 = a2;
    unint64_t v6 = [v3 succinctDescriptionBuilder];
    [v6 setUseDebugDescription:a3];
    [v6 setActiveMultilinePrefix:v5];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__STStewieStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STStewieStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

id __76__STStewieStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isStewieActive"), @"stewieActive");
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isStewieConnected"), @"stewieConnected");
}

- (id)diffFromData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = +[STStewieStatusDomainDataDiff diffFromData:v4 toData:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)dataByApplyingDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 isEmpty])
    {
      id v5 = (void *)[(STStewieStatusDomainData *)self copy];
    }
    else
    {
      id v5 = (void *)[(STStewieStatusDomainData *)self mutableCopy];
      [v4 applyToMutableData:v5];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[STStewieStatusDomainData isStewieActive](self, "isStewieActive"), @"stewieActive");
  objc_msgSend(v4, "encodeBool:forKey:", -[STStewieStatusDomainData isStewieConnected](self, "isStewieConnected"), @"stewieConnected");
}

- (STStewieStatusDomainData)initWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [v4 decodeBoolForKey:@"stewieActive"];
  char v6 = [v4 decodeBoolForKey:@"stewieConnected"];

  if (!self) {
    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)STStewieStatusDomainData;
  result = [(STStewieStatusDomainData *)&v8 init];
  if (result)
  {
    result->_stewieActive = v5;
    result->_stewieConnected = v6;
  }
  return result;
}

- (BOOL)isStewieActive
{
  return self->_stewieActive;
}

- (BOOL)isStewieConnected
{
  return self->_stewieConnected;
}

@end