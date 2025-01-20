@interface STLocationStatusDomainLocationAttribution
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (STActivityAttribution)activityAttribution;
- (STLocationStatusDomainLocationAttribution)initWithCoder:(id)a3;
- (STLocationStatusDomainLocationAttribution)initWithLocationState:(unint64_t)a3 activityAttribution:(id)a4;
- (STLocationStatusDomainLocationAttribution)initWithLocationState:(unint64_t)a3 activityAttribution:(id)a4 eligibleDisplayModes:(unint64_t)a5;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)eligibleDisplayModes;
- (unint64_t)hash;
- (unint64_t)locationState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STLocationStatusDomainLocationAttribution

uint64_t __53__STLocationStatusDomainLocationAttribution_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityAttribution];
}

uint64_t __53__STLocationStatusDomainLocationAttribution_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) locationState];
}

uint64_t __53__STLocationStatusDomainLocationAttribution_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) eligibleDisplayModes];
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  return (NSString *)[(STLocationStatusDomainLocationAttribution *)self descriptionWithMultilinePrefix:0];
}

void __93__STLocationStatusDomainLocationAttribution__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if ([*(id *)(a1 + 40) locationState]) {
    v3 = @"receiving";
  }
  else {
    v3 = @"requesting";
  }
  [v2 appendString:v3 withName:@"locationState"];
  v4 = *(void **)(a1 + 32);
  v5 = [*(id *)(a1 + 40) activityAttribution];
  id v6 = (id)[v4 appendObject:v5 withName:@"activityAttribution"];

  v7 = *(void **)(a1 + 32);
  STLocationStatusDomainLocationAttributionDisplayModeMaskDescription([*(id *)(a1 + 40) eligibleDisplayModes]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v7 appendString:v8 withName:@"eligibleDisplayModes"];
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[STLocationStatusDomainLocationAttribution locationState](self, "locationState"), @"locationState");
  v4 = [(STLocationStatusDomainLocationAttribution *)self activityAttribution];
  [v5 encodeObject:v4 forKey:@"activityAttribution"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[STLocationStatusDomainLocationAttribution eligibleDisplayModes](self, "eligibleDisplayModes"), @"eligibleDisplayModes");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  unint64_t v6 = [(STLocationStatusDomainLocationAttribution *)self locationState];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __53__STLocationStatusDomainLocationAttribution_isEqual___block_invoke;
  v20[3] = &unk_1E6B63670;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendUnsignedInteger:v6 counterpart:v20];
  v9 = [(STLocationStatusDomainLocationAttribution *)self activityAttribution];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__STLocationStatusDomainLocationAttribution_isEqual___block_invoke_2;
  v18[3] = &unk_1E6B63058;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendObject:v9 counterpart:v18];

  unint64_t v12 = [(STLocationStatusDomainLocationAttribution *)self eligibleDisplayModes];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__STLocationStatusDomainLocationAttribution_isEqual___block_invoke_3;
  v16[3] = &unk_1E6B63670;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendUnsignedInteger:v12 counterpart:v16];
  LOBYTE(v12) = [v5 isEqual];

  return v12;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STLocationStatusDomainLocationAttribution locationState](self, "locationState"));
  id v5 = [(STLocationStatusDomainLocationAttribution *)self activityAttribution];
  id v6 = (id)[v3 appendObject:v5];

  id v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STLocationStatusDomainLocationAttribution eligibleDisplayModes](self, "eligibleDisplayModes"));
  unint64_t v8 = [v3 hash];

  return v8;
}

- (STActivityAttribution)activityAttribution
{
  return self->_activityAttribution;
}

- (unint64_t)eligibleDisplayModes
{
  return self->_eligibleDisplayModes;
}

- (unint64_t)locationState
{
  return self->_locationState;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STLocationStatusDomainLocationAttribution *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STLocationStatusDomainLocationAttribution _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v3 = a1;
  if (a1)
  {
    id v5 = a2;
    id v6 = [v3 succinctDescriptionBuilder];
    [v6 setUseDebugDescription:a3];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __93__STLocationStatusDomainLocationAttribution__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v9[3] = &unk_1E6B63080;
    id v7 = v6;
    id v10 = v7;
    id v11 = v3;
    [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v9];

    id v3 = v7;
  }

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (STLocationStatusDomainLocationAttribution)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"locationState"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityAttribution"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"eligibleDisplayModes"];

  if (v6)
  {
    self = [(STLocationStatusDomainLocationAttribution *)self initWithLocationState:v5 activityAttribution:v6 eligibleDisplayModes:v7];
    unint64_t v8 = self;
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (STLocationStatusDomainLocationAttribution)initWithLocationState:(unint64_t)a3 activityAttribution:(id)a4 eligibleDisplayModes:(unint64_t)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STLocationStatusDomainLocationAttribution;
  v9 = [(STLocationStatusDomainLocationAttribution *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    v9->_locationState = a3;
    uint64_t v11 = [v8 copy];
    activityAttribution = v10->_activityAttribution;
    v10->_activityAttribution = (STActivityAttribution *)v11;

    v10->_eligibleDisplayModes = a5;
  }

  return v10;
}

- (STLocationStatusDomainLocationAttribution)initWithLocationState:(unint64_t)a3 activityAttribution:(id)a4
{
  return [(STLocationStatusDomainLocationAttribution *)self initWithLocationState:a3 activityAttribution:a4 eligibleDisplayModes:1];
}

- (NSString)debugDescription
{
  return (NSString *)[(STLocationStatusDomainLocationAttribution *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STLocationStatusDomainLocationAttribution *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = -[STLocationStatusDomainLocationAttribution _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  id v4 = [v3 build];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end