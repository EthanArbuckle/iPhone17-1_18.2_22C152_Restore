@interface STPlaygroundsStatusDomainData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaygroundsActive;
- (NSString)description;
- (STPlaygroundsStatusDomainData)init;
- (STPlaygroundsStatusDomainData)initWithCoder:(id)a3;
- (id)dataByApplyingDiff:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffFromData:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STPlaygroundsStatusDomainData

- (STPlaygroundsStatusDomainData)init
{
  if (self)
  {
    v2 = self;
    char v3 = [0 isPlaygroundsActive];
    v4.receiver = v2;
    v4.super_class = (Class)STPlaygroundsStatusDomainData;
    self = [(STPlaygroundsStatusDomainData *)&v4 init];
    if (self) {
      self->_playgroundsActive = v3;
    }
  }
  return self;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  uint64_t v6 = [(STPlaygroundsStatusDomainData *)self isPlaygroundsActive];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__STPlaygroundsStatusDomainData_isEqual___block_invoke;
  v10[3] = &unk_1E6B630D0;
  id v11 = v4;
  id v7 = v4;
  id v8 = (id)[v5 appendBool:v6 counterpart:v10];
  LOBYTE(v6) = [v5 isEqual];

  return v6;
}

uint64_t __41__STPlaygroundsStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) isPlaygroundsActive];
}

- (unint64_t)hash
{
  char v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendBool:", -[STPlaygroundsStatusDomainData isPlaygroundsActive](self, "isPlaygroundsActive"));
  unint64_t v5 = [v3 hash];

  return v5;
}

- (NSString)description
{
  return (NSString *)[(STPlaygroundsStatusDomainData *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id result = +[STMutablePlaygroundsStatusDomainData allocWithZone:a3];
  if (result)
  {
    id v5 = result;
    BOOL v6 = [(STPlaygroundsStatusDomainData *)self isPlaygroundsActive];
    v7.receiver = v5;
    v7.super_class = (Class)STPlaygroundsStatusDomainData;
    id result = [(STPlaygroundsStatusDomainData *)&v7 init];
    if (result) {
      *((unsigned char *)result + 8) = v6;
    }
  }
  return result;
}

- (id)succinctDescription
{
  v2 = [(STPlaygroundsStatusDomainData *)self succinctDescriptionBuilder];
  char v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  char v3 = [(STPlaygroundsStatusDomainData *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(STPlaygroundsStatusDomainData *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__STPlaygroundsStatusDomainData_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6B63080;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __71__STPlaygroundsStatusDomainData_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isPlaygroundsActive"), @"playgroundsActive");
}

- (id)diffFromData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = +[STPlaygroundsStatusDomainDataDiff diffFromData:v4 toData:self];
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
      id v5 = (void *)[(STPlaygroundsStatusDomainData *)self copy];
    }
    else
    {
      id v5 = (void *)[(STPlaygroundsStatusDomainData *)self mutableCopy];
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
  objc_msgSend(v4, "encodeBool:forKey:", -[STPlaygroundsStatusDomainData isPlaygroundsActive](self, "isPlaygroundsActive"), @"playgroundsActive");
}

- (STPlaygroundsStatusDomainData)initWithCoder:(id)a3
{
  char v4 = [a3 decodeBoolForKey:@"playgroundsActive"];
  if (!self) {
    return 0;
  }
  BOOL v5 = v4;
  v7.receiver = self;
  v7.super_class = (Class)STPlaygroundsStatusDomainData;
  id result = [(STPlaygroundsStatusDomainData *)&v7 init];
  if (result) {
    result->_playgroundsActive = v5;
  }
  return result;
}

- (BOOL)isPlaygroundsActive
{
  return self->_playgroundsActive;
}

@end