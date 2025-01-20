@interface SFDomainAssociationUtilities
+ (BOOL)domainIsProhibitedForSavingCredentials:(id)a3;
+ (BOOL)highLevelDomainHasSuiteOfAssociatedApps:(id)a3;
+ (id)domainByStrippingSubdomainWildcardPrefixIfNecessary:(id)a3;
@end

@implementation SFDomainAssociationUtilities

+ (id)domainByStrippingSubdomainWildcardPrefixIfNecessary:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"*."])
  {
    id v4 = [v3 substringFromIndex:2];
  }
  else
  {
    id v4 = v3;
  }
  v5 = v4;

  return v5;
}

+ (BOOL)domainIsProhibitedForSavingCredentials:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (domainIsProhibitedForSavingCredentials__onceToken != -1) {
    dispatch_once(&domainIsProhibitedForSavingCredentials__onceToken, &__block_literal_global_5);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)domainIsProhibitedForSavingCredentials__blocklist;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
LABEL_5:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
      BOOL v10 = 1;
      if (objc_msgSend(v3, "safari_hasCaseInsensitiveSuffix:", v9, (void)v14)) {
        break;
      }
      v11 = [v9 substringFromIndex:1];
      char v12 = objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", v11);

      if (v12) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        BOOL v10 = 0;
        if (v6) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

void __71__SFDomainAssociationUtilities_domainIsProhibitedForSavingCredentials___block_invoke()
{
  v0 = (void *)domainIsProhibitedForSavingCredentials__blocklist;
  domainIsProhibitedForSavingCredentials__blocklist = (uint64_t)&unk_26CA7EE20;
}

+ (BOOL)highLevelDomainHasSuiteOfAssociatedApps:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (highLevelDomainHasSuiteOfAssociatedApps__onceToken != -1) {
    dispatch_once(&highLevelDomainHasSuiteOfAssociatedApps__onceToken, &__block_literal_global_75);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = (id)highLevelDomainHasSuiteOfAssociatedApps__highLevelDomainsWithSuiteOfAssociatedApps;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9))
        {
          LOBYTE(v5) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v5;
}

void __72__SFDomainAssociationUtilities_highLevelDomainHasSuiteOfAssociatedApps___block_invoke()
{
  v0 = (void *)highLevelDomainHasSuiteOfAssociatedApps__highLevelDomainsWithSuiteOfAssociatedApps;
  highLevelDomainHasSuiteOfAssociatedApps__highLevelDomainsWithSuiteOfAssociatedApps = (uint64_t)&unk_26CA7EE38;
}

@end