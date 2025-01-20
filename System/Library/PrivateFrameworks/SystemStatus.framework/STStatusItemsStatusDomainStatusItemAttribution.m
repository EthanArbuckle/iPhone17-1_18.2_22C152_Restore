@interface STStatusItemsStatusDomainStatusItemAttribution
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)statusItemIdentifier;
- (STActivityAttribution)activityAttribution;
- (STStatusItemsStatusDomainStatusItemAttribution)initWithCoder:(id)a3;
- (STStatusItemsStatusDomainStatusItemAttribution)initWithStatusItemIdentifier:(id)a3 activityAttribution:(id)a4;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusItemsStatusDomainStatusItemAttribution

- (STStatusItemsStatusDomainStatusItemAttribution)initWithStatusItemIdentifier:(id)a3 activityAttribution:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STStatusItemsStatusDomainStatusItemAttribution;
  v8 = [(STStatusItemsStatusDomainStatusItemAttribution *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    statusItemIdentifier = v8->_statusItemIdentifier;
    v8->_statusItemIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    activityAttribution = v8->_activityAttribution;
    v8->_activityAttribution = (STActivityAttribution *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = [(STStatusItemsStatusDomainStatusItemAttribution *)self statusItemIdentifier];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __58__STStatusItemsStatusDomainStatusItemAttribution_isEqual___block_invoke;
  v18[3] = &unk_1E6B630A8;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendString:v6 counterpart:v18];

  uint64_t v9 = [(STStatusItemsStatusDomainStatusItemAttribution *)self activityAttribution];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __58__STStatusItemsStatusDomainStatusItemAttribution_isEqual___block_invoke_2;
  v16 = &unk_1E6B63058;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendObject:v9 counterpart:&v13];

  LOBYTE(v9) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);
  return (char)v9;
}

uint64_t __58__STStatusItemsStatusDomainStatusItemAttribution_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) statusItemIdentifier];
}

uint64_t __58__STStatusItemsStatusDomainStatusItemAttribution_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityAttribution];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(STStatusItemsStatusDomainStatusItemAttribution *)self statusItemIdentifier];
  id v5 = (id)[v3 appendString:v4];

  id v6 = [(STStatusItemsStatusDomainStatusItemAttribution *)self activityAttribution];
  id v7 = (id)[v3 appendObject:v6];

  unint64_t v8 = [v3 hash];
  return v8;
}

- (NSString)description
{
  return (NSString *)[(STStatusItemsStatusDomainStatusItemAttribution *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(STStatusItemsStatusDomainStatusItemAttribution *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STStatusItemsStatusDomainStatusItemAttribution *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STStatusItemsStatusDomainStatusItemAttribution *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STStatusItemsStatusDomainStatusItemAttribution *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STStatusItemsStatusDomainStatusItemAttribution *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(STStatusItemsStatusDomainStatusItemAttribution *)self succinctDescriptionBuilder];
  [v7 setUseDebugDescription:v4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __98__STStatusItemsStatusDomainStatusItemAttribution__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v11[3] = &unk_1E6B63080;
  id v8 = v7;
  id v12 = v8;
  uint64_t v13 = self;
  [v8 appendBodySectionWithName:0 multilinePrefix:v6 block:v11];

  id v9 = v8;
  return v9;
}

void __98__STStatusItemsStatusDomainStatusItemAttribution__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) statusItemIdentifier];
  BOOL v4 = STStatusItemIdentifierDescription(v3);
  [v2 appendString:v4 withName:@"statusItem"];

  id v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) activityAttribution];
  id v6 = (id)[v5 appendObject:v7 withName:@"activityAttribution"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(STStatusItemsStatusDomainStatusItemAttribution *)self statusItemIdentifier];
  [v4 encodeObject:v5 forKey:@"statusItemIdentifier"];

  id v6 = [(STStatusItemsStatusDomainStatusItemAttribution *)self activityAttribution];
  [v4 encodeObject:v6 forKey:@"activityAttribution"];
}

- (STStatusItemsStatusDomainStatusItemAttribution)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusItemIdentifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityAttribution"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    self = [(STStatusItemsStatusDomainStatusItemAttribution *)self initWithStatusItemIdentifier:v5 activityAttribution:v6];
    id v8 = self;
  }

  return v8;
}

- (NSString)statusItemIdentifier
{
  return self->_statusItemIdentifier;
}

- (STActivityAttribution)activityAttribution
{
  return self->_activityAttribution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityAttribution, 0);

  objc_storeStrong((id *)&self->_statusItemIdentifier, 0);
}

@end