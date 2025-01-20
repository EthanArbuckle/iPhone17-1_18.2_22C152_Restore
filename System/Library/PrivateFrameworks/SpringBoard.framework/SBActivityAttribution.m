@interface SBActivityAttribution
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)hasMatchingAttributedEntity:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystemService;
- (NSString)activeEntityBundleIdentifier;
- (NSString)attributionGroup;
- (NSString)bundleIdentifier;
- (NSString)displayName;
- (NSString)executableDisplayName;
- (NSString)website;
- (SBActivityAttribution)initWithSTActivityAttribution:(id)a3;
- (id)_activityAttribution;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)pid;
- (unint64_t)hash;
@end

@implementation SBActivityAttribution

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(SBActivityAttribution *)self displayName];
  id v5 = (id)[v3 appendObject:v4 withName:@"displayName"];

  v6 = [(SBActivityAttribution *)self bundleIdentifier];
  id v7 = (id)[v3 appendObject:v6 withName:@"bundleIdentifier"];

  v8 = [(SBActivityAttribution *)self website];
  id v9 = (id)objc_msgSend(v3, "appendBool:withName:", objc_msgSend(v8, "length") != 0, @"website-non-nil");

  id v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBActivityAttribution isSystemService](self, "isSystemService"), @"isSystemService");
  return v3;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_attribution];
  unint64_t v5 = [v3 hash];

  return v5;
}

- (NSString)website
{
  v2 = [(STActivityAttribution *)self->_attribution attributedEntity];
  v3 = [v2 website];

  return (NSString *)v3;
}

- (NSString)bundleIdentifier
{
  v2 = [(STActivityAttribution *)self->_attribution attributedEntity];
  v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (BOOL)isSystemService
{
  v2 = [(STActivityAttribution *)self->_attribution attributedEntity];
  char v3 = [v2 isSystemService];

  return v3;
}

- (NSString)displayName
{
  v2 = [(STActivityAttribution *)self->_attribution attributedEntity];
  char v3 = [v2 localizedDisplayName];

  return (NSString *)v3;
}

- (NSString)executableDisplayName
{
  v2 = [(STActivityAttribution *)self->_attribution attributedEntity];
  char v3 = [v2 localizedExecutableDisplayName];

  return (NSString *)v3;
}

- (NSString)attributionGroup
{
  return self->_attributionGroup;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  attribution = self->_attribution;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __33__SBActivityAttribution_isEqual___block_invoke;
  v10[3] = &unk_1E6AF9E90;
  id v11 = v4;
  id v7 = v4;
  id v8 = (id)[v5 appendObject:attribution counterpart:v10];
  LOBYTE(attribution) = [v5 isEqual];

  return (char)attribution;
}

uint64_t __33__SBActivityAttribution_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activityAttribution];
}

- (id)_activityAttribution
{
  return self->_attribution;
}

- (NSString)activeEntityBundleIdentifier
{
  v2 = [(STActivityAttribution *)self->_attribution activeEntity];
  char v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (SBActivityAttribution)initWithSTActivityAttribution:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SBActivityAttribution;
  unint64_t v5 = [(SBActivityAttribution *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    attribution = v5->_attribution;
    v5->_attribution = (STActivityAttribution *)v6;

    id v8 = [v4 attributedEntity];
    id v9 = [v8 bundlePath];
    if (v9 || ([v8 executablePath], (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int v10 = BSPathExistsOnSystemPartition();
      id v11 = [v8 localizedDisplayName];
      if (v10)
      {
        v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v13 = [v12 localizedStringForKey:@"SYSTEM_ATTRIBUTION_STRING" value:&stru_1F3084718 table:@"SystemStatusServer"];
        if ([v11 isEqualToString:v13])
        {
        }
        else
        {
          v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v15 = [v14 localizedStringForKey:@"UNKNOWN_ATTRIBUTION_STRING" value:&stru_1F3084718 table:@"SystemStatusServer"];
          char v16 = [v11 isEqualToString:v15];

          if ((v16 & 1) == 0)
          {
            id v17 = v11;
            id v11 = v17;
LABEL_11:
            attributionGroup = v5->_attributionGroup;
            v5->_attributionGroup = (NSString *)v17;

            goto LABEL_12;
          }
        }
      }
    }
    else
    {
      id v11 = [v8 localizedDisplayName];
    }
    id v17 = [v8 bundleIdentifier];
    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionGroup, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  id v4 = [(STActivityAttribution *)self->_attribution attributedEntity];
  if (v4)
  {
    uint64_t v6 = v4;
    [v4 auditToken];
    id v4 = v6;
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (BOOL)hasMatchingAttributedEntity:(id)a3
{
  return [a3 isEqual:self->_attribution];
}

- (id)succinctDescription
{
  v2 = [(SBActivityAttribution *)self succinctDescriptionBuilder];
  char v3 = [v2 build];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  char v3 = [(SBActivityAttribution *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  uint64_t v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__SBActivityAttribution_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6AF5290;
  id v7 = v6;
  id v11 = v7;
  v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

id __63__SBActivityAttribution_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  char v3 = [*(id *)(a1 + 40) displayName];
  id v4 = (id)[v2 appendObject:v3 withName:@"displayName"];

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) bundleIdentifier];
  id v7 = (id)[v5 appendObject:v6 withName:@"bundleIdentifier"];

  id v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) website];
  id v10 = (id)[v8 appendObject:v9 withName:@"website"];

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isSystemService"), @"isSystemService");
}

- (int)pid
{
  return self->_pid;
}

@end