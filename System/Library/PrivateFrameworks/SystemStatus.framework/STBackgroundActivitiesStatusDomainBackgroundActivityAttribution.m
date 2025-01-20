@interface STBackgroundActivitiesStatusDomainBackgroundActivityAttribution
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsWhenForeground;
- (NSString)backgroundActivityIdentifier;
- (NSString)debugDescription;
- (NSString)description;
- (STActivityAttribution)activityAttribution;
- (STBackgroundActivitiesStatusDomainBackgroundActivityAttribution)initWithBackgroundActivityIdentifier:(id)a3 activityAttribution:(id)a4;
- (STBackgroundActivitiesStatusDomainBackgroundActivityAttribution)initWithBackgroundActivityIdentifier:(id)a3 activityAttribution:(id)a4 showsWhenForeground:(BOOL)a5;
- (STBackgroundActivitiesStatusDomainBackgroundActivityAttribution)initWithCoder:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STBackgroundActivitiesStatusDomainBackgroundActivityAttribution

- (STBackgroundActivitiesStatusDomainBackgroundActivityAttribution)initWithBackgroundActivityIdentifier:(id)a3 activityAttribution:(id)a4 showsWhenForeground:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)STBackgroundActivitiesStatusDomainBackgroundActivityAttribution;
  v10 = [(STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    backgroundActivityIdentifier = v10->_backgroundActivityIdentifier;
    v10->_backgroundActivityIdentifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    activityAttribution = v10->_activityAttribution;
    v10->_activityAttribution = (STActivityAttribution *)v13;

    v10->_showsWhenForeground = a5;
  }

  return v10;
}

- (STBackgroundActivitiesStatusDomainBackgroundActivityAttribution)initWithBackgroundActivityIdentifier:(id)a3 activityAttribution:(id)a4
{
  return [(STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *)self initWithBackgroundActivityIdentifier:a3 activityAttribution:a4 showsWhenForeground:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  v6 = [(STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *)self backgroundActivityIdentifier];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __75__STBackgroundActivitiesStatusDomainBackgroundActivityAttribution_isEqual___block_invoke;
  v20[3] = &unk_1E6B630A8;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendString:v6 counterpart:v20];

  id v9 = [(STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *)self activityAttribution];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__STBackgroundActivitiesStatusDomainBackgroundActivityAttribution_isEqual___block_invoke_2;
  v18[3] = &unk_1E6B63058;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendObject:v9 counterpart:v18];

  uint64_t v12 = [(STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *)self showsWhenForeground];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__STBackgroundActivitiesStatusDomainBackgroundActivityAttribution_isEqual___block_invoke_3;
  v16[3] = &unk_1E6B630D0;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendBool:v12 counterpart:v16];
  LOBYTE(v12) = [v5 isEqual];

  return v12;
}

uint64_t __75__STBackgroundActivitiesStatusDomainBackgroundActivityAttribution_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) backgroundActivityIdentifier];
}

uint64_t __75__STBackgroundActivitiesStatusDomainBackgroundActivityAttribution_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityAttribution];
}

uint64_t __75__STBackgroundActivitiesStatusDomainBackgroundActivityAttribution_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) showsWhenForeground];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *)self backgroundActivityIdentifier];
  id v5 = (id)[v3 appendString:v4];

  v6 = [(STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *)self activityAttribution];
  id v7 = (id)[v3 appendObject:v6];

  id v8 = (id)objc_msgSend(v3, "appendBool:", -[STBackgroundActivitiesStatusDomainBackgroundActivityAttribution showsWhenForeground](self, "showsWhenForeground"));
  unint64_t v9 = [v3 hash];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *)self succinctDescriptionBuilder];
  [v7 setUseDebugDescription:v4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __115__STBackgroundActivitiesStatusDomainBackgroundActivityAttribution__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v11[3] = &unk_1E6B63080;
  id v8 = v7;
  id v12 = v8;
  id v13 = self;
  [v8 appendBodySectionWithName:0 multilinePrefix:v6 block:v11];

  id v9 = v8;
  return v9;
}

id __115__STBackgroundActivitiesStatusDomainBackgroundActivityAttribution__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) backgroundActivityIdentifier];
  BOOL v4 = STBackgroundActivityIdentifierDescription(v3);
  [v2 appendString:v4 withName:@"backgroundActivity"];

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) activityAttribution];
  id v7 = (id)[v5 appendObject:v6 withName:@"activityAttribution"];

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "showsWhenForeground"), @"showsWhenForeground", 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *)self backgroundActivityIdentifier];
  [v6 encodeObject:v4 forKey:@"backgroundActivityIdentifier"];

  id v5 = [(STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *)self activityAttribution];
  [v6 encodeObject:v5 forKey:@"activityAttribution"];

  objc_msgSend(v6, "encodeBool:forKey:", -[STBackgroundActivitiesStatusDomainBackgroundActivityAttribution showsWhenForeground](self, "showsWhenForeground"), @"showsWhenForeground");
}

- (STBackgroundActivitiesStatusDomainBackgroundActivityAttribution)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundActivityIdentifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityAttribution"];
  uint64_t v7 = [v4 decodeBoolForKey:@"showsWhenForeground"];

  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v9 = 0;
  }
  else
  {
    self = [(STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *)self initWithBackgroundActivityIdentifier:v5 activityAttribution:v6 showsWhenForeground:v7];
    id v9 = self;
  }

  return v9;
}

- (NSString)backgroundActivityIdentifier
{
  return self->_backgroundActivityIdentifier;
}

- (STActivityAttribution)activityAttribution
{
  return self->_activityAttribution;
}

- (BOOL)showsWhenForeground
{
  return self->_showsWhenForeground;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityAttribution, 0);

  objc_storeStrong((id *)&self->_backgroundActivityIdentifier, 0);
}

@end