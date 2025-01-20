@interface STAirPlayStatusDomainData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)description;
- (STAirPlayStatusDomainData)init;
- (STAirPlayStatusDomainData)initWithCoder:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)dataByApplyingDiff:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffFromData:(id)a3;
- (id)initWithAirPlayState:(void *)a3 bundleIdentifier:;
- (id)initWithData:(id *)a1;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)airPlayState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STAirPlayStatusDomainData

- (STAirPlayStatusDomainData)init
{
  return (STAirPlayStatusDomainData *)-[STAirPlayStatusDomainData initWithData:]((id *)&self->super.isa, 0);
}

- (id)initWithData:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = (void *)[v3 airPlayState];
    v5 = [v3 bundleIdentifier];

    v2 = -[STAirPlayStatusDomainData initWithAirPlayState:bundleIdentifier:](v2, v4, v5);
  }
  return v2;
}

- (id)initWithAirPlayState:(void *)a3 bundleIdentifier:
{
  id v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)STAirPlayStatusDomainData;
    v7 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      v7[1] = a2;
      objc_storeStrong(v7 + 2, a3);
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  unint64_t v6 = [(STAirPlayStatusDomainData *)self airPlayState];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __37__STAirPlayStatusDomainData_isEqual___block_invoke;
  v18[3] = &unk_1E6B63670;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendUnsignedInteger:v6 counterpart:v18];
  objc_super v9 = [(STAirPlayStatusDomainData *)self bundleIdentifier];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __37__STAirPlayStatusDomainData_isEqual___block_invoke_2;
  v16 = &unk_1E6B630A8;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendString:v9 counterpart:&v13];

  LOBYTE(v9) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);
  return (char)v9;
}

uint64_t __37__STAirPlayStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) airPlayState];
}

uint64_t __37__STAirPlayStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) bundleIdentifier];
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STAirPlayStatusDomainData airPlayState](self, "airPlayState"));
  v5 = [(STAirPlayStatusDomainData *)self bundleIdentifier];
  id v6 = (id)[v3 appendString:v5];

  unint64_t v7 = [v3 hash];
  return v7;
}

- (NSString)description
{
  return (NSString *)[(STAirPlayStatusDomainData *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[STMutableAirPlayStatusDomainData allocWithZone:a3];

  return -[STAirPlayStatusDomainData initWithData:]((id *)&v4->super.super.isa, self);
}

- (id)succinctDescription
{
  v2 = [(STAirPlayStatusDomainData *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STAirPlayStatusDomainData *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = -[STAirPlayStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  id v4 = [v3 build];

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v3 = a1;
  if (a1)
  {
    id v5 = a2;
    id v6 = [v3 succinctDescriptionBuilder];
    [v6 setUseDebugDescription:a3];
    [v6 setActiveMultilinePrefix:v5];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__STAirPlayStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STAirPlayStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __77__STAirPlayStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 40) airPlayState];
  if (v3 > 2) {
    id v4 = @"(unknown)";
  }
  else {
    id v4 = off_1E6B63F30[v3];
  }
  [v2 appendString:v4 withName:@"airPlayState"];
  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) bundleIdentifier];
  [v5 appendString:v6 withName:@"bundleIdentifier"];
}

- (id)diffFromData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = +[STAirPlayStatusDomainDataDiff diffFromData:v4 toData:self];
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
      id v5 = (void *)[(STAirPlayStatusDomainData *)self copy];
    }
    else
    {
      id v5 = (void *)[(STAirPlayStatusDomainData *)self mutableCopy];
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
  objc_msgSend(v4, "encodeInteger:forKey:", -[STAirPlayStatusDomainData airPlayState](self, "airPlayState"), @"airPlayState");
  id v5 = [(STAirPlayStatusDomainData *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];
}

- (STAirPlayStatusDomainData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 decodeIntegerForKey:@"airPlayState"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];

  id v7 = (STAirPlayStatusDomainData *)-[STAirPlayStatusDomainData initWithAirPlayState:bundleIdentifier:]((id *)&self->super.isa, v5, v6);
  return v7;
}

- (unint64_t)airPlayState
{
  return self->_airPlayState;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
}

@end