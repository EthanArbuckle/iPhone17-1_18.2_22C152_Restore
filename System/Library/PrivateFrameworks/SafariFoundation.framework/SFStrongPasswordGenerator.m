@interface SFStrongPasswordGenerator
- (SFStrongPasswordGenerator)init;
- (id)generatedPasswordForAppWithAppID:(id)a3 associatedDomains:(id)a4 passwordRules:(id)a5 confirmPasswordRules:(id)a6;
- (id)generatedPasswordForAppWithAssociatedDomains:(id)a3 passwordRules:(id)a4 confirmPasswordRules:(id)a5;
@end

@implementation SFStrongPasswordGenerator

- (SFStrongPasswordGenerator)init
{
  v13.receiver = self;
  v13.super_class = (Class)SFStrongPasswordGenerator;
  v2 = [(SFStrongPasswordGenerator *)&v13 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F66278]);
    v4 = objc_msgSend(MEMORY[0x263F086E0], "safari_safariCoreBundle");
    v5 = [v4 URLForResource:@"WBSAutoFillQuirks" withExtension:@"plist"];
    v6 = [MEMORY[0x263F08850] defaultManager];
    v7 = objc_msgSend(v6, "safari_autoFillQuirksDownloadDirectoryURL");
    v8 = (void *)[v3 initWithBuiltInQuirksURL:v5 downloadsDirectoryURL:v7 resourceName:@"AutoFillQuirks" resourceVersion:@"1" updateDateDefaultsKey:&stru_26CA7A2D0 updateInterval:0.0];

    [v8 setShouldAttemptToDownloadConfiguration:0];
    [v8 beginLoadingQuirksFromDisk];
    uint64_t v9 = [v8 passwordGenerationManager];
    passwordGenerationManager = v2->_passwordGenerationManager;
    v2->_passwordGenerationManager = (WBSPasswordGenerationManager *)v9;

    v11 = v2;
  }

  return v2;
}

- (id)generatedPasswordForAppWithAppID:(id)a3 associatedDomains:(id)a4 passwordRules:(id)a5 confirmPasswordRules:(id)a6
{
  return [(SFStrongPasswordGenerator *)self generatedPasswordForAppWithAssociatedDomains:a4 passwordRules:a5 confirmPasswordRules:a6];
}

- (id)generatedPasswordForAppWithAssociatedDomains:(id)a3 passwordRules:(id)a4 confirmPasswordRules:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 length];
  uint64_t v12 = [v10 length];
  if (v11 | v12)
  {
    objc_super v13 = (void *)v12;
    if (v11)
    {
      uint64_t v11 = [MEMORY[0x263F66310] parsePasswordRules:v9 error:0];
    }
    if (!v13) {
      goto LABEL_26;
    }
    v14 = [MEMORY[0x263F66310] parsePasswordRules:v10 error:0];
    objc_super v13 = v14;
    if (v11 && v14)
    {
      id v15 = [MEMORY[0x263F66310] mergePasswordRuleSet:v11 withPasswordRuleSet:v14];
    }
    else
    {
      if (!v14)
      {
LABEL_26:
        v26 = [MEMORY[0x263F662F0] requirementsForPasswordRuleSet:v11 respectingMinLength:0 maxLength:0];
        v24 = [(WBSPasswordGenerationManager *)self->_passwordGenerationManager generatedPasswordMatchingRequirements:v26];

        goto LABEL_27;
      }
      id v15 = v14;
      objc_super v13 = v15;
    }
    uint64_t v25 = (uint64_t)v15;

    uint64_t v11 = v25;
    goto LABEL_26;
  }
  if (![v8 count])
  {
    v24 = [(WBSPasswordGenerationManager *)self->_passwordGenerationManager generatedPasswordMatchingRequirements:MEMORY[0x263EFFA78]];
    goto LABEL_28;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = -[WBSPasswordGenerationManager defaultRequirementsForDomain:](self->_passwordGenerationManager, "defaultRequirementsForDomain:", *(void *)(*((void *)&v28 + 1) + 8 * i), (void)v28);
        if (v21)
        {
          v22 = (void *)v21;
          goto LABEL_19;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
  v22 = 0;
LABEL_19:

  v23 = (void *)MEMORY[0x263EFFA78];
  if (v22) {
    v23 = v22;
  }
  uint64_t v11 = v23;

  v24 = [(WBSPasswordGenerationManager *)self->_passwordGenerationManager generatedPasswordMatchingRequirements:v11];
LABEL_27:

LABEL_28:
  return v24;
}

- (void).cxx_destruct
{
}

@end