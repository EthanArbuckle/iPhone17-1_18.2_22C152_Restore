@interface STMediaStatusDomainScreenCaptureAttribution
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (STActivityAttribution)activityAttribution;
- (STMediaStatusDomainScreenCaptureAttribution)initWithActivityAttribution:(id)a3;
- (STMediaStatusDomainScreenCaptureAttribution)initWithCoder:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STMediaStatusDomainScreenCaptureAttribution

- (STMediaStatusDomainScreenCaptureAttribution)initWithActivityAttribution:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STMediaStatusDomainScreenCaptureAttribution;
  v5 = [(STMediaStatusDomainScreenCaptureAttribution *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    activityAttribution = v5->_activityAttribution;
    v5->_activityAttribution = (STActivityAttribution *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  uint64_t v6 = [(STMediaStatusDomainScreenCaptureAttribution *)self activityAttribution];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__STMediaStatusDomainScreenCaptureAttribution_isEqual___block_invoke;
  v10[3] = &unk_1E6B63058;
  id v11 = v4;
  id v7 = v4;
  id v8 = (id)[v5 appendObject:v6 counterpart:v10];

  LOBYTE(v6) = [v5 isEqual];
  return (char)v6;
}

uint64_t __55__STMediaStatusDomainScreenCaptureAttribution_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityAttribution];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(STMediaStatusDomainScreenCaptureAttribution *)self activityAttribution];
  id v5 = (id)[v3 appendObject:v4];

  unint64_t v6 = [v3 hash];
  return v6;
}

- (NSString)description
{
  return (NSString *)[(STMediaStatusDomainScreenCaptureAttribution *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STMediaStatusDomainScreenCaptureAttribution *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STMediaStatusDomainScreenCaptureAttribution *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(STMediaStatusDomainScreenCaptureAttribution *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__STMediaStatusDomainScreenCaptureAttribution_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6B63080;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __85__STMediaStatusDomainScreenCaptureAttribution_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) activityAttribution];
  id v2 = (id)[v1 appendObject:v3 withName:@"activityAttribution"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(STMediaStatusDomainScreenCaptureAttribution *)self activityAttribution];
  [v4 encodeObject:v5 forKey:@"activityAttribution"];
}

- (STMediaStatusDomainScreenCaptureAttribution)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityAttribution"];

  if (v5)
  {
    self = [(STMediaStatusDomainScreenCaptureAttribution *)self initWithActivityAttribution:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (STActivityAttribution)activityAttribution
{
  return self->_activityAttribution;
}

- (void).cxx_destruct
{
}

@end