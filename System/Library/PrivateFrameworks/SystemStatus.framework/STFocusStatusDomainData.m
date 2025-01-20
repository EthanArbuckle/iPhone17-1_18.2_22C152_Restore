@interface STFocusStatusDomainData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)modeIdentifier;
- (NSString)modeName;
- (NSString)modeSymbol;
- (STFocusStatusDomainData)init;
- (STFocusStatusDomainData)initWithCoder:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)dataByApplyingDiff:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffFromData:(id)a3;
- (id)initWithData:(id *)a1;
- (id)initWithModeIdentifier:(void *)a3 modeName:(void *)a4 modeSymbol:;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STFocusStatusDomainData

- (STFocusStatusDomainData)init
{
  return (STFocusStatusDomainData *)-[STFocusStatusDomainData initWithData:]((id *)&self->super.isa, 0);
}

- (id)initWithData:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = [v3 modeIdentifier];
    v5 = [v3 modeName];
    v6 = [v3 modeSymbol];

    v2 = -[STFocusStatusDomainData initWithModeIdentifier:modeName:modeSymbol:](v2, v4, v5, v6);
  }
  return v2;
}

- (id)initWithModeIdentifier:(void *)a3 modeName:(void *)a4 modeSymbol:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)STFocusStatusDomainData;
    v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  v6 = [(STFocusStatusDomainData *)self modeIdentifier];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __35__STFocusStatusDomainData_isEqual___block_invoke;
  v20[3] = &unk_1E6B630A8;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendString:v6 counterpart:v20];

  id v9 = [(STFocusStatusDomainData *)self modeName];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __35__STFocusStatusDomainData_isEqual___block_invoke_2;
  v18[3] = &unk_1E6B630A8;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendString:v9 counterpart:v18];

  v12 = [(STFocusStatusDomainData *)self modeSymbol];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __35__STFocusStatusDomainData_isEqual___block_invoke_3;
  v16[3] = &unk_1E6B630A8;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendString:v12 counterpart:v16];

  LOBYTE(v12) = [v5 isEqual];
  return (char)v12;
}

uint64_t __35__STFocusStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) modeIdentifier];
}

uint64_t __35__STFocusStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) modeName];
}

uint64_t __35__STFocusStatusDomainData_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) modeSymbol];
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(STFocusStatusDomainData *)self modeIdentifier];
  id v5 = (id)[v3 appendString:v4];

  v6 = [(STFocusStatusDomainData *)self modeName];
  id v7 = (id)[v3 appendString:v6];

  id v8 = [(STFocusStatusDomainData *)self modeSymbol];
  id v9 = (id)[v3 appendString:v8];

  unint64_t v10 = [v3 hash];
  return v10;
}

- (NSString)description
{
  return (NSString *)[(STFocusStatusDomainData *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[STMutableFocusStatusDomainData allocWithZone:a3];

  return -[STFocusStatusDomainData initWithData:]((id *)&v4->super.super.isa, self);
}

- (id)succinctDescription
{
  v2 = [(STFocusStatusDomainData *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STFocusStatusDomainData *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = -[STFocusStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  id v4 = [v3 build];

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v3 = a1;
  if (a1)
  {
    id v5 = a2;
    v6 = [v3 succinctDescriptionBuilder];
    [v6 setUseDebugDescription:a3];
    [v6 setActiveMultilinePrefix:v5];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__STFocusStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STFocusStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __75__STFocusStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) modeIdentifier];
  [v2 appendString:v3 withName:@"modeIdentifier"];

  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) modeName];
  [v4 appendString:v5 withName:@"modeName"];

  v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) modeSymbol];
  [v6 appendString:v7 withName:@"modeSymbol"];
}

- (id)diffFromData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = +[STFocusStatusDomainDataDiff diffFromData:v4 toData:self];
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
      id v5 = (void *)[(STFocusStatusDomainData *)self copy];
    }
    else
    {
      id v5 = (void *)[(STFocusStatusDomainData *)self mutableCopy];
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
  id v5 = [(STFocusStatusDomainData *)self modeIdentifier];
  [v4 encodeObject:v5 forKey:@"modeIdentifier"];

  v6 = [(STFocusStatusDomainData *)self modeName];
  [v4 encodeObject:v6 forKey:@"modeName"];

  id v7 = [(STFocusStatusDomainData *)self modeSymbol];
  [v4 encodeObject:v7 forKey:@"modeSymbol"];
}

- (STFocusStatusDomainData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modeIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modeName"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modeSymbol"];

  id v8 = (STFocusStatusDomainData *)-[STFocusStatusDomainData initWithModeIdentifier:modeName:modeSymbol:]((id *)&self->super.isa, v5, v6, v7);
  return v8;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (NSString)modeName
{
  return self->_modeName;
}

- (NSString)modeSymbol
{
  return self->_modeSymbol;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeSymbol, 0);
  objc_storeStrong((id *)&self->_modeName, 0);

  objc_storeStrong((id *)&self->_modeIdentifier, 0);
}

@end