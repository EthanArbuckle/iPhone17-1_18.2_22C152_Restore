@interface WBSPasswordAuditor
- (BOOL)_passwordIsReused:(id)a3 byOtherSavedAccount:(id)a4;
- (BOOL)_savedAccountQualifiesForReuseAuditing:(id)a3;
- (BOOL)accountStoreHasDuplicatedPasswords;
- (BOOL)savedAccount:(id)a3 reusesPasswordWithAccountInSavedAccounts:(id)a4;
- (WBSAutoFillQuirksManager)autoFillQuirksManager;
- (WBSPasswordAuditor)init;
- (WBSPasswordAuditor)initWithSavedAccountStore:(id)a3 autoFillQuirksManager:(id)a4;
- (WBSSavedAccountStore)savedAccountStore;
- (id)duplicatePasswordsInPasswords:(id)a3;
- (id)savedAccountsWithDuplicatedPassword:(id)a3;
@end

@implementation WBSPasswordAuditor

- (WBSPasswordAuditor)init
{
  return 0;
}

- (WBSPasswordAuditor)initWithSavedAccountStore:(id)a3 autoFillQuirksManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSPasswordAuditor;
  v9 = [(WBSPasswordAuditor *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_savedAccountStore, a3);
    objc_storeStrong((id *)&v10->_autoFillQuirksManager, a4);
    v11 = v10;
  }

  return v10;
}

- (BOOL)_savedAccountQualifiesForReuseAuditing:(id)a3
{
  id v4 = a3;
  v5 = [v4 password];
  v6 = [v4 highLevelDomain];
  char v7 = [v4 userIsNeverSaveMarker];

  if ((v7 & 1) == 0
    && [v6 length]
    && [v5 length]
    && !+[WBSPasswordGenerationManager passwordLooksLikePasswordManagerGeneratedPassword:v5])
  {
    v10 = [(WBSAutoFillQuirksManager *)self->_autoFillQuirksManager passwordAuditingEligibleDomainsManager];
    v11 = [v10 domainsIneligibleForPasswordAuditing];
    int v8 = [v11 containsObject:v6] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)_passwordIsReused:(id)a3 byOtherSavedAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isEqual:v7] & 1) == 0
    && [(WBSPasswordAuditor *)self _savedAccountQualifiesForReuseAuditing:v6]&& [(WBSPasswordAuditor *)self _savedAccountQualifiesForReuseAuditing:v7])
  {
    int v8 = [v6 highLevelDomain];
    v9 = [v7 highLevelDomain];
    if (([v8 isEqualToString:v9] & 1) != 0
      || ([v6 password],
          v10 = objc_claimAutoreleasedReturnValue(),
          [v7 password],
          v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v10 isEqualToString:v11],
          v11,
          v10,
          !v12))
    {
      LOBYTE(v15) = 0;
    }
    else
    {
      objc_super v13 = [(WBSAutoFillQuirksManager *)self->_autoFillQuirksManager associatedDomainsManager];
      v14 = [v13 domainsWithAssociatedCredentialsForDomain:v8];

      int v15 = [v14 containsObject:v9] ^ 1;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (BOOL)accountStoreHasDuplicatedPasswords
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v3 = [(WBSSavedAccountStore *)self->_savedAccountStore savedAccountsWithPasswords];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__WBSPasswordAuditor_accountStoreHasDuplicatedPasswords__block_invoke;
  v7[3] = &unk_1E615BD80;
  v7[4] = self;
  id v4 = v3;
  id v8 = v4;
  v9 = &v10;
  [v4 enumerateObjectsUsingBlock:v7];
  char v5 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __56__WBSPasswordAuditor_accountStoreHasDuplicatedPasswords__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([*(id *)(a1 + 32) _savedAccountQualifiesForReuseAuditing:v7])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__WBSPasswordAuditor_accountStoreHasDuplicatedPasswords__block_invoke_2;
    v12[3] = &unk_1E615BD58;
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    uint64_t v15 = a3;
    v12[4] = v8;
    id v10 = v7;
    uint64_t v11 = *(void *)(a1 + 48);
    id v13 = v10;
    uint64_t v14 = v11;
    [v9 enumerateObjectsUsingBlock:v12];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *a4 = 1;
    }
  }
}

uint64_t __56__WBSPasswordAuditor_accountStoreHasDuplicatedPasswords__block_invoke_2(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(void *)(a1 + 56) < a3)
  {
    id v9 = v7;
    if (objc_msgSend(*(id *)(a1 + 32), "_savedAccountQualifiesForReuseAuditing:"))
    {
      if ([*(id *)(a1 + 32) _passwordIsReused:*(void *)(a1 + 40) byOtherSavedAccount:v9])
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
  }
  return MEMORY[0x1F4181820]();
}

- (BOOL)savedAccount:(id)a3 reusesPasswordWithAccountInSavedAccounts:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (-[WBSPasswordAuditor _passwordIsReused:byOtherSavedAccount:](self, "_passwordIsReused:byOtherSavedAccount:", *(void *)(*((void *)&v14 + 1) + 8 * i), v6, (void)v14))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (id)savedAccountsWithDuplicatedPassword:(id)a3
{
  id v4 = a3;
  if ([(WBSPasswordAuditor *)self _savedAccountQualifiesForReuseAuditing:v4])
  {
    char v5 = [MEMORY[0x1E4F1CA80] set];
    id v6 = [(WBSSavedAccountStore *)self->_savedAccountStore savedAccountsWithPasswords];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__WBSPasswordAuditor_savedAccountsWithDuplicatedPassword___block_invoke;
    v10[3] = &unk_1E615BDA8;
    id v11 = v5;
    BOOL v12 = self;
    id v13 = v4;
    id v7 = v5;
    uint64_t v8 = objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v10);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __58__WBSPasswordAuditor_savedAccountsWithDuplicatedPassword___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 highLevelDomain];
  if (([*(id *)(a1 + 32) containsObject:v4] & 1) != 0
    || ![*(id *)(a1 + 40) _passwordIsReused:v3 byOtherSavedAccount:*(void *)(a1 + 48)])
  {
    uint64_t v5 = 0;
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v4];
    uint64_t v5 = 1;
  }

  return v5;
}

- (id)duplicatePasswordsInPasswords:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v6 = [v4 count];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __52__WBSPasswordAuditor_duplicatePasswordsInPasswords___block_invoke;
  long long v14 = &unk_1E615BDF8;
  long long v15 = self;
  id v16 = v5;
  id v17 = v4;
  uint64_t v18 = v6;
  id v7 = v4;
  id v8 = v5;
  [v7 enumerateObjectsUsingBlock:&v11];
  uint64_t v9 = objc_msgSend(v8, "copy", v11, v12, v13, v14, v15);

  return v9;
}

void __52__WBSPasswordAuditor_duplicatePasswordsInPasswords___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) _savedAccountQualifiesForReuseAuditing:v5]
    && ([*(id *)(a1 + 40) containsObject:v5] & 1) == 0)
  {
    uint64_t v6 = a3 + 1;
    id v7 = *(void **)(a1 + 48);
    id v8 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v6, *(void *)(a1 + 56) - v6);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__WBSPasswordAuditor_duplicatePasswordsInPasswords___block_invoke_2;
    v11[3] = &unk_1E615BDD0;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    id v12 = v9;
    uint64_t v13 = v10;
    id v14 = v5;
    [v7 enumerateObjectsAtIndexes:v8 options:0 usingBlock:v11];
  }
}

void __52__WBSPasswordAuditor_duplicatePasswordsInPasswords___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0
    && [*(id *)(a1 + 40) _savedAccountQualifiesForReuseAuditing:v3]
    && [*(id *)(a1 + 40) _passwordIsReused:*(void *)(a1 + 48) byOtherSavedAccount:v3])
  {
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (WBSSavedAccountStore)savedAccountStore
{
  return self->_savedAccountStore;
}

- (WBSAutoFillQuirksManager)autoFillQuirksManager
{
  return self->_autoFillQuirksManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoFillQuirksManager, 0);
  objc_storeStrong((id *)&self->_savedAccountStore, 0);
}

@end