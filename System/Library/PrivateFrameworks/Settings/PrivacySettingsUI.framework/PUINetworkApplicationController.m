@interface PUINetworkApplicationController
- (LSApplicationProxy)application;
- (NSString)bundleIdentifier;
- (id)isLocalNetworkEnabled:(id)a3;
- (id)pathRuleCreate:(BOOL)a3;
- (id)specifiers;
- (void)setApplication:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setLocalNetworkEnabled:(id)a3 specifier:(id)a4;
- (void)setSpecifier:(id)a3;
@end

@implementation PUINetworkApplicationController

- (void)setSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUINetworkApplicationController;
  id v4 = a3;
  [(PUINetworkApplicationController *)&v7 setSpecifier:v4];
  objc_msgSend(v4, "propertyForKey:", @"PUINetworkApplicationKey", v7.receiver, v7.super_class);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v5;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
    objc_super v7 = [(PUINetworkApplicationController *)self bundleIdentifier];

    if (!v7) {
      goto LABEL_10;
    }
    v8 = (void *)MEMORY[0x1E4F223B8];
    v9 = [(PUINetworkApplicationController *)self bundleIdentifier];
    v10 = [v8 applicationProxyForIdentifier:v9];

    if (!v10) {
      goto LABEL_10;
    }
    uint64_t v11 = [v10 entitlementValueForKey:@"com.apple.developer.networking.bonjour-services" ofClass:objc_opt_class()];
    if (v11)
    {
      v12 = (void *)v11;
      v13 = [v10 entitlementValueForKey:@"com.apple.developer.networking.multicast" ofClass:objc_opt_class()];

      v14 = NSString;
      if (!v13)
      {
        v15 = @"LOCAL_NETWORK_BONJOUR";
LABEL_9:
        v16 = PUI_LocalizedStringForPrivacy(v15);
        v17 = [v10 localizedName];
        v18 = objc_msgSend(v14, "stringWithFormat:", v16, v17);

        [v6 setProperty:v18 forKey:*MEMORY[0x1E4F93170]];
LABEL_10:
        [v5 addObject:v6];
        v19 = (void *)MEMORY[0x1E4F92E70];
        v20 = PUI_LocalizedStringForPrivacy(@"LOCAL_NETWORK");
        v21 = [v19 preferenceSpecifierNamed:v20 target:self set:sel_setLocalNetworkEnabled_specifier_ get:sel_isLocalNetworkEnabled_ detail:0 cell:6 edit:0];

        [v5 addObject:v21];
        v22 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
        *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

        id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
        goto LABEL_11;
      }
    }
    else
    {
      v14 = NSString;
    }
    v15 = @"LOCAL_NETWORK_MULTICAST";
    goto LABEL_9;
  }
LABEL_11:
  return v4;
}

- (id)pathRuleCreate:(BOOL)a3
{
  BOOL v21 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = [(PUINetworkController *)self pathControllerConfiguration];
  id v5 = [v4 pathController];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v6 = [v5 pathRules];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v12 = [v11 matchSigningIdentifier];
        v13 = [(PUINetworkApplicationController *)self bundleIdentifier];
        int v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          id v17 = v11;
          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  if (v21)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F38D18]);
    v16 = [(PUINetworkApplicationController *)self bundleIdentifier];
    id v17 = (id)[v15 initWithSigningIdentifier:v16];

    v18 = [v5 pathRules];

    if (v18)
    {
      v6 = [v5 pathRules];
      v19 = [v6 arrayByAddingObject:v17];
      [v5 setPathRules:v19];
    }
    else
    {
      id v26 = v17;
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      [v5 setPathRules:v6];
    }
LABEL_13:
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)setLocalNetworkEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v7 = [(PUINetworkApplicationController *)self pathRuleCreate:1];
  int v6 = [v5 BOOLValue];

  [v7 setDenyMulticast:v6 ^ 1u];
  [v7 setMulticastPreferenceSet:1];
  [(PUINetworkController *)self saveConfiguration];
}

- (id)isLocalNetworkEnabled:(id)a3
{
  uint64_t v3 = [(PUINetworkApplicationController *)self pathRuleCreate:0];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28ED0]), "initWithBool:", objc_msgSend(v3, "denyMulticast") ^ 1);

  return v4;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (LSApplicationProxy)application
{
  return (LSApplicationProxy *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setApplication:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end