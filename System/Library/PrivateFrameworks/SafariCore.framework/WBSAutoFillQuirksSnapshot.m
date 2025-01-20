@interface WBSAutoFillQuirksSnapshot
- (NSArray)domainsIneligibleForPasswordAuditing;
- (NSArray)domainsToConsiderIdentical;
- (NSArray)domainsWithAssociatedCredentials;
- (NSArray)knownExtensionStorefronts;
- (NSArray)knownWebBrowsers;
- (NSDictionary)appIDsToDomainsAssociations;
- (NSDictionary)changePasswordURLsByDomain;
- (NSDictionary)passwordRequirementsByDomain;
- (NSSet)domainsForPasskeyFallbackUI;
- (NSSet)domainsIneligibleForAutomaticLogin;
- (NSSet)domainsIneligibleForPasskeys;
- (NSSet)domainsIneligibleForStreamlinedLogin;
- (NSSet)domainsKnownToDoSameDocumentNavigationInTextEditingCallback;
- (NSSet)domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices;
- (WBSAutoFillQuirksSnapshot)init;
- (WBSAutoFillQuirksSnapshot)initWithSnapshotData:(id)a3 error:(id *)a4;
- (id)_appIDsToDomainsAssociationsFromAutoFillQuirks:(id)a3 error:(id *)a4;
- (id)_changePasswordURLStringsByDomainFromAutoFillQuirks:(id)a3 error:(id *)a4;
- (id)_domainsIneligibleForPasswordAuditingFromAutoFillQuirks:(id)a3 error:(id *)a4;
- (id)_domainsSetFromAutoFillQuirks:(id)a3 forKey:(id)a4 error:(id *)a5;
- (id)_domainsToConsiderIdenticalFromAutoFillQuirls:(id)a3 error:(id *)a4;
- (id)_domainsWithAssociatedCredentialsFromAutoFillQuirks:(id)a3 error:(id *)a4;
- (id)_passwordRequirementsByDomainFromAutoFillQuirks:(id)a3 error:(id *)a4;
- (id)snapshotData;
@end

@implementation WBSAutoFillQuirksSnapshot

- (WBSAutoFillQuirksSnapshot)initWithSnapshotData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v41.receiver = self;
  v41.super_class = (Class)WBSAutoFillQuirksSnapshot;
  v7 = [(WBSAutoFillQuirksSnapshot *)&v41 init];
  if (!v7) {
    goto LABEL_6;
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "safari_dictionaryWithPropertyListData:", v6);
  autoFillQuirks = v7->_autoFillQuirks;
  v7->_autoFillQuirks = (NSDictionary *)v8;

  v10 = v7->_autoFillQuirks;
  if (!v10)
  {
    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
      v39 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v39 = 0;
    goto LABEL_7;
  }
  uint64_t v11 = [(WBSAutoFillQuirksSnapshot *)v7 _passwordRequirementsByDomainFromAutoFillQuirks:v10 error:a4];
  passwordRequirementsByDomain = v7->_passwordRequirementsByDomain;
  v7->_passwordRequirementsByDomain = (NSDictionary *)v11;

  uint64_t v13 = [(WBSAutoFillQuirksSnapshot *)v7 _domainsWithAssociatedCredentialsFromAutoFillQuirks:v7->_autoFillQuirks error:a4];
  domainsWithAssociatedCredentials = v7->_domainsWithAssociatedCredentials;
  v7->_domainsWithAssociatedCredentials = (NSArray *)v13;

  uint64_t v15 = [(WBSAutoFillQuirksSnapshot *)v7 _domainsIneligibleForPasswordAuditingFromAutoFillQuirks:v7->_autoFillQuirks error:a4];
  domainsIneligibleForPasswordAuditing = v7->_domainsIneligibleForPasswordAuditing;
  v7->_domainsIneligibleForPasswordAuditing = (NSArray *)v15;

  uint64_t v17 = [(WBSAutoFillQuirksSnapshot *)v7 _domainsToConsiderIdenticalFromAutoFillQuirls:v7->_autoFillQuirks error:a4];
  domainsToConsiderIdentical = v7->_domainsToConsiderIdentical;
  v7->_domainsToConsiderIdentical = (NSArray *)v17;

  uint64_t v19 = [(WBSAutoFillQuirksSnapshot *)v7 _changePasswordURLStringsByDomainFromAutoFillQuirks:v7->_autoFillQuirks error:a4];
  changePasswordURLsByDomain = v7->_changePasswordURLsByDomain;
  v7->_changePasswordURLsByDomain = (NSDictionary *)v19;

  uint64_t v21 = [(WBSAutoFillQuirksSnapshot *)v7 _appIDsToDomainsAssociationsFromAutoFillQuirks:v7->_autoFillQuirks error:a4];
  appIDsToDomainsAssociations = v7->_appIDsToDomainsAssociations;
  v7->_appIDsToDomainsAssociations = (NSDictionary *)v21;

  uint64_t v23 = [(WBSAutoFillQuirksSnapshot *)v7 _domainsSetFromAutoFillQuirks:v7->_autoFillQuirks forKey:@"DomainsIneligibleForAutomaticLogin" error:a4];
  domainsIneligibleForAutomaticLogin = v7->_domainsIneligibleForAutomaticLogin;
  v7->_domainsIneligibleForAutomaticLogin = (NSSet *)v23;

  uint64_t v25 = [(WBSAutoFillQuirksSnapshot *)v7 _domainsSetFromAutoFillQuirks:v7->_autoFillQuirks forKey:@"DomainsIneligibleForStreamlinedLogin" error:a4];
  domainsIneligibleForStreamlinedLogin = v7->_domainsIneligibleForStreamlinedLogin;
  v7->_domainsIneligibleForStreamlinedLogin = (NSSet *)v25;

  uint64_t v27 = [(WBSAutoFillQuirksSnapshot *)v7 _domainsSetFromAutoFillQuirks:v7->_autoFillQuirks forKey:@"DomainsIneligibleForPasskeys" error:a4];
  domainsIneligibleForPasskeys = v7->_domainsIneligibleForPasskeys;
  v7->_domainsIneligibleForPasskeys = (NSSet *)v27;

  uint64_t v29 = [(WBSAutoFillQuirksSnapshot *)v7 _domainsSetFromAutoFillQuirks:v7->_autoFillQuirks forKey:@"DomainsForPasskeyFallbackUI" error:a4];
  domainsForPasskeyFallbackUI = v7->_domainsForPasskeyFallbackUI;
  v7->_domainsForPasskeyFallbackUI = (NSSet *)v29;

  uint64_t v31 = [(WBSAutoFillQuirksSnapshot *)v7 _domainsSetFromAutoFillQuirks:v7->_autoFillQuirks forKey:@"DomainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices" error:a4];
  domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices = v7->_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices;
  v7->_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices = (NSSet *)v31;

  uint64_t v33 = [(WBSAutoFillQuirksSnapshot *)v7 _domainsSetFromAutoFillQuirks:v7->_autoFillQuirks forKey:@"DomainsKnownToDoSameDocumentNavigationInTextEditingCallback" error:a4];
  domainsKnownToDoSameDocumentNavigationInTextEditingCallback = v7->_domainsKnownToDoSameDocumentNavigationInTextEditingCallback;
  v7->_domainsKnownToDoSameDocumentNavigationInTextEditingCallback = (NSSet *)v33;

  uint64_t v35 = [(NSDictionary *)v7->_autoFillQuirks safari_arrayForKey:@"KnownWebBrowsers"];
  knownWebBrowsers = v7->_knownWebBrowsers;
  v7->_knownWebBrowsers = (NSArray *)v35;

  uint64_t v37 = [(NSDictionary *)v7->_autoFillQuirks safari_arrayForKey:@"KnownExtensionStorefronts"];
  knownExtensionStorefronts = v7->_knownExtensionStorefronts;
  v7->_knownExtensionStorefronts = (NSArray *)v37;

  v39 = v7;
LABEL_7:

  return v39;
}

- (id)_domainsSetFromAutoFillQuirks:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v6 = objc_msgSend(a3, "safari_arrayForKey:", a4);
  if (!v6) {
    goto LABEL_6;
  }
  uint64_t v7 = objc_opt_class();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__WBSAutoFillQuirksSnapshot__domainsSetFromAutoFillQuirks_forKey_error___block_invoke;
  v10[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v10[4] = v7;
  if (objc_msgSend(v6, "safari_allObjectsPassTest:", v10))
  {
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    goto LABEL_7;
  }
  if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
    uint64_t v8 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    uint64_t v8 = 0;
  }
LABEL_7:

  return v8;
}

uint64_t __72__WBSAutoFillQuirksSnapshot__domainsSetFromAutoFillQuirks_forKey_error___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)_passwordRequirementsByDomainFromAutoFillQuirks:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_msgSend(v5, "safari_dictionaryForKey:", @"PasswordGenerationRequirements");
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__WBSAutoFillQuirksSnapshot__passwordRequirementsByDomainFromAutoFillQuirks_error___block_invoke;
  v11[3] = &unk_1E615A828;
  v11[4] = &v12;
  uint64_t v7 = objc_msgSend(v6, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v11);
  uint64_t v8 = v7;
  if (*((unsigned char *)v13 + 24))
  {
    id v9 = v7;
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
    id v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }

  _Block_object_dispose(&v12, 8);
  return v9;
}

- (id)_domainsToConsiderIdenticalFromAutoFillQuirls:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a3, "safari_arrayForKey:", @"DomainsToConsiderIdentical");
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    uint64_t v18 = *(void *)v25;
    uint64_t v19 = a4;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v19)
          {
            *uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
          }
LABEL_21:

          id v16 = 0;
          goto LABEL_22;
        }
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v21;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (v19)
                {
                  *uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
                }

                goto LABEL_21;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        uint64_t v8 = v18;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v16 = v5;
LABEL_22:

  return v16;
}

- (id)_domainsIneligibleForPasswordAuditingFromAutoFillQuirks:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a3, "safari_arrayForKey:", @"SharedDomains");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 259, 0, v12);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }

          id v10 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v10 = v5;
LABEL_13:

  return v10;
}

- (id)_changePasswordURLStringsByDomainFromAutoFillQuirks:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v5, "safari_dictionaryForKey:", @"ChangePasswordURLs");
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__WBSAutoFillQuirksSnapshot__changePasswordURLStringsByDomainFromAutoFillQuirks_error___block_invoke;
  v11[3] = &unk_1E615A828;
  v11[4] = &v12;
  uint64_t v7 = objc_msgSend(v6, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v11);
  uint64_t v8 = v7;
  if (*((unsigned char *)v13 + 24))
  {
    id v9 = v7;
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
    id v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }

  _Block_object_dispose(&v12, 8);
  return v9;
}

- (id)_appIDsToDomainsAssociationsFromAutoFillQuirks:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v5, "safari_dictionaryForKey:", @"AppIDsToDomainsAssociations");
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__WBSAutoFillQuirksSnapshot__appIDsToDomainsAssociationsFromAutoFillQuirks_error___block_invoke;
  v11[3] = &unk_1E615A828;
  v11[4] = &v12;
  uint64_t v7 = objc_msgSend(v6, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v11);
  uint64_t v8 = v7;
  if (*((unsigned char *)v13 + 24))
  {
    id v9 = v7;
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
    id v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }

  _Block_object_dispose(&v12, 8);
  return v9;
}

- (id)_domainsWithAssociatedCredentialsFromAutoFillQuirks:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a3, "safari_arrayForKey:", @"DomainsWithAssociatedCredentials");
  long long v26 = 0u;
  long long v27 = 0u;
  BOOL v6 = v5 != 0;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    long long v21 = a4;
    uint64_t v10 = *(void *)v27;
    uint64_t v20 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_20;
        }
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v23 != v16) {
                objc_enumerationMutation(v13);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {

                goto LABEL_20;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        uint64_t v10 = v20;
        if (!v6)
        {
LABEL_20:

          a4 = v21;
          goto LABEL_21;
        }
        BOOL v6 = 1;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v9) {
        continue;
      }
      break;
    }

    goto LABEL_24;
  }

  if (v5)
  {
LABEL_24:
    id v18 = v7;
    goto LABEL_26;
  }
LABEL_21:
  if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
    id v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = 0;
  }
LABEL_26:

  return v18;
}

id __87__WBSAutoFillQuirksSnapshot__changePasswordURLStringsByDomainFromAutoFillQuirks_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  id v8 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v10 = v7;
  }
  else
  {
    id v10 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

  return v10;
}

id __83__WBSAutoFillQuirksSnapshot__passwordRequirementsByDomainFromAutoFillQuirks_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  id v8 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v10 = v7;
  }
  else
  {
    id v10 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

  return v10;
}

id __82__WBSAutoFillQuirksSnapshot__appIDsToDomainsAssociationsFromAutoFillQuirks_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
            *a4 = 1;

            id v14 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v14 = v9;
LABEL_14:
  }
  else
  {
    id v14 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

  return v14;
}

- (WBSAutoFillQuirksSnapshot)init
{
  return 0;
}

- (id)snapshotData
{
  return (id)[MEMORY[0x1E4F28F98] dataWithPropertyList:self->_autoFillQuirks format:200 options:0 error:0];
}

- (NSDictionary)passwordRequirementsByDomain
{
  return self->_passwordRequirementsByDomain;
}

- (NSArray)domainsWithAssociatedCredentials
{
  return self->_domainsWithAssociatedCredentials;
}

- (NSArray)domainsIneligibleForPasswordAuditing
{
  return self->_domainsIneligibleForPasswordAuditing;
}

- (NSArray)domainsToConsiderIdentical
{
  return self->_domainsToConsiderIdentical;
}

- (NSDictionary)changePasswordURLsByDomain
{
  return self->_changePasswordURLsByDomain;
}

- (NSDictionary)appIDsToDomainsAssociations
{
  return self->_appIDsToDomainsAssociations;
}

- (NSSet)domainsIneligibleForAutomaticLogin
{
  return self->_domainsIneligibleForAutomaticLogin;
}

- (NSSet)domainsIneligibleForStreamlinedLogin
{
  return self->_domainsIneligibleForStreamlinedLogin;
}

- (NSSet)domainsIneligibleForPasskeys
{
  return self->_domainsIneligibleForPasskeys;
}

- (NSSet)domainsForPasskeyFallbackUI
{
  return self->_domainsForPasskeyFallbackUI;
}

- (NSSet)domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices
{
  return self->_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices;
}

- (NSSet)domainsKnownToDoSameDocumentNavigationInTextEditingCallback
{
  return self->_domainsKnownToDoSameDocumentNavigationInTextEditingCallback;
}

- (NSArray)knownWebBrowsers
{
  return self->_knownWebBrowsers;
}

- (NSArray)knownExtensionStorefronts
{
  return self->_knownExtensionStorefronts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownExtensionStorefronts, 0);
  objc_storeStrong((id *)&self->_knownWebBrowsers, 0);
  objc_storeStrong((id *)&self->_domainsKnownToDoSameDocumentNavigationInTextEditingCallback, 0);
  objc_storeStrong((id *)&self->_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices, 0);
  objc_storeStrong((id *)&self->_domainsForPasskeyFallbackUI, 0);
  objc_storeStrong((id *)&self->_domainsIneligibleForPasskeys, 0);
  objc_storeStrong((id *)&self->_domainsIneligibleForStreamlinedLogin, 0);
  objc_storeStrong((id *)&self->_domainsIneligibleForAutomaticLogin, 0);
  objc_storeStrong((id *)&self->_appIDsToDomainsAssociations, 0);
  objc_storeStrong((id *)&self->_changePasswordURLsByDomain, 0);
  objc_storeStrong((id *)&self->_domainsToConsiderIdentical, 0);
  objc_storeStrong((id *)&self->_domainsIneligibleForPasswordAuditing, 0);
  objc_storeStrong((id *)&self->_passwordRequirementsByDomain, 0);
  objc_storeStrong((id *)&self->_domainsWithAssociatedCredentials, 0);
  objc_storeStrong((id *)&self->_autoFillQuirks, 0);
}

@end