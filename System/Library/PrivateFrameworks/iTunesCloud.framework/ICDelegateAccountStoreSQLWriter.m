@interface ICDelegateAccountStoreSQLWriter
- (BOOL)_removeAccountForIdentityKey:(id)a3;
- (BOOL)_removeTokenForIdentityKey:(id)a3;
- (ICDelegateAccountStoreSQLWriter)initWithConnection:(id)a3;
- (void)_setToken:(id)a3 forIdentityKey:(id)a4;
- (void)addDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5;
- (void)invalidate;
- (void)removeAllTokensWithCompletionHandler:(id)a3;
- (void)removeDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5;
- (void)removeIdentityPropertiesForUserIdentity:(id)a3 completionHandler:(id)a4;
- (void)removeTokenForUserIdentity:(id)a3 completionHandler:(id)a4;
- (void)removeTokensExpiringBeforeDate:(id)a3 completionHandler:(id)a4;
- (void)setIdentityProperties:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5;
- (void)setToken:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5;
@end

@implementation ICDelegateAccountStoreSQLWriter

- (void).cxx_destruct
{
}

- (void)_setToken:(id)a3 forIdentityKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connection = self->_connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__ICDelegateAccountStoreSQLWriter__setToken_forIdentityKey___block_invoke;
  v11[3] = &unk_1E5ACC150;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(ICSQLiteConnection *)connection executeStatement:@"INSERT OR REPLACE INTO token (account_identity, data, expiration_date, type) VALUES(?, ?, ?, ?)" error:0 bindings:v11];
}

void __60__ICDelegateAccountStoreSQLWriter__setToken_forIdentityKey___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 bindString:*(void *)(a1 + 32) atPosition:1];
  v3 = [*(id *)(a1 + 40) data];
  [v6 bindData:v3 atPosition:2];

  v4 = [*(id *)(a1 + 40) expirationDate];
  if (v4)
  {
    +[ICDelegateAccountStoreSchema valueForDate:v4];
    objc_msgSend(v6, "bindDouble:atPosition:", 3);
  }
  else
  {
    [v6 bindNullAtPosition:3];
  }
  if ([*(id *)(a1 + 40) type] == 1) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  [v6 bindInt64:v5 atPosition:4];
}

- (BOOL)_removeTokenForIdentityKey:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__ICDelegateAccountStoreSQLWriter__removeTokenForIdentityKey___block_invoke;
  v8[3] = &unk_1E5ACC1A0;
  id v9 = v4;
  id v6 = v4;
  [(ICSQLiteConnection *)connection executeStatement:@"DELETE FROM token WHERE account_identity==?" error:0 bindings:v8];
  LOBYTE(self) = [(ICSQLiteConnection *)self->_connection lastChangeCount] > 0;

  return (char)self;
}

uint64_t __62__ICDelegateAccountStoreSQLWriter__removeTokenForIdentityKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindString:*(void *)(a1 + 32) atPosition:1];
}

- (BOOL)_removeAccountForIdentityKey:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__ICDelegateAccountStoreSQLWriter__removeAccountForIdentityKey___block_invoke;
  v8[3] = &unk_1E5ACC1A0;
  id v9 = v4;
  id v6 = v4;
  [(ICSQLiteConnection *)connection executeStatement:@"DELETE FROM account WHERE identity==?" error:0 bindings:v8];
  LOBYTE(self) = [(ICSQLiteConnection *)self->_connection lastChangeCount] > 0;

  return (char)self;
}

uint64_t __64__ICDelegateAccountStoreSQLWriter__removeAccountForIdentityKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindString:*(void *)(a1 + 32) atPosition:1];
}

- (void)setToken:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_isValid) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Out-of-scope transaction usage: %@", self format];
  }
  v11 = ICDelegateAccountStorePrimaryKeyForUserIdentity(v9);
  if (!v11) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Non-concrete user identity: %@", v9 format];
  }
  [(ICDelegateAccountStoreSQLWriter *)self _setToken:v8 forIdentityKey:v11];
  if (v10)
  {
    connection = self->_connection;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __78__ICDelegateAccountStoreSQLWriter_setToken_forUserIdentity_completionHandler___block_invoke;
    v13[3] = &unk_1E5ACD170;
    id v14 = v10;
    [(ICSQLiteConnection *)connection dispatchAfterTransaction:v13];
  }
}

uint64_t __78__ICDelegateAccountStoreSQLWriter_setToken_forUserIdentity_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setIdentityProperties:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_isValid) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Out-of-scope transaction usage: %@", self format];
  }
  v11 = ICDelegateAccountStorePrimaryKeyForUserIdentity(v9);
  if (!v11) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Non-concrete user identity: %@", v9 format];
  }
  connection = self->_connection;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __91__ICDelegateAccountStoreSQLWriter_setIdentityProperties_forUserIdentity_completionHandler___block_invoke;
  v18[3] = &unk_1E5ACC150;
  v18[4] = v11;
  id v13 = v8;
  id v19 = v13;
  [(ICSQLiteConnection *)connection executeStatement:@"INSERT OR REPLACE INTO account (identity, storefront) VALUES (?, ?)" error:0 bindings:v18];
  id v14 = [v13 delegateToken];
  if (!v14)
  {
    [(ICDelegateAccountStoreSQLWriter *)self _removeTokenForIdentityKey:v11];
    if (!v10) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  [(ICDelegateAccountStoreSQLWriter *)self _setToken:v14 forIdentityKey:v11];
  if (v10)
  {
LABEL_7:
    v15 = self->_connection;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __91__ICDelegateAccountStoreSQLWriter_setIdentityProperties_forUserIdentity_completionHandler___block_invoke_2;
    v16[3] = &unk_1E5ACD170;
    id v17 = v10;
    [(ICSQLiteConnection *)v15 dispatchAfterTransaction:v16];
  }
LABEL_8:
}

void __91__ICDelegateAccountStoreSQLWriter_setIdentityProperties_forUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindString:v3 atPosition:1];
  uint64_t v5 = [*(id *)(a1 + 40) storefrontIdentifier];
  id v6 = (id)v5;
  if (v5) {
    [v4 bindString:v5 atPosition:2];
  }
  else {
    [v4 bindNullAtPosition:2];
  }
}

uint64_t __91__ICDelegateAccountStoreSQLWriter_setIdentityProperties_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeTokensExpiringBeforeDate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_isValid) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Out-of-scope transaction usage: %@", self format];
  }
  connection = self->_connection;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__ICDelegateAccountStoreSQLWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke;
  v19[3] = &unk_1E5ACC1A0;
  id v9 = v6;
  id v20 = v9;
  [(ICSQLiteConnection *)connection executeStatement:@"DELETE FROM token WHERE expiration_date<?" error:0 bindings:v19];
  int64_t v10 = [(ICSQLiteConnection *)self->_connection lastChangeCount];
  v11 = self->_connection;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__ICDelegateAccountStoreSQLWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke_2;
  v17[3] = &unk_1E5ACC1A0;
  id v12 = v9;
  id v18 = v12;
  [(ICSQLiteConnection *)v11 executeStatement:@"INSERT OR REPLACE INTO metadata (key, value) VALUES (?, ?)" error:0 bindings:v17];
  if (v7)
  {
    id v13 = self->_connection;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __84__ICDelegateAccountStoreSQLWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke_3;
    v14[3] = &unk_1E5ACC128;
    id v15 = v7;
    BOOL v16 = v10 > 0;
    [(ICSQLiteConnection *)v13 dispatchAfterTransaction:v14];
  }
}

void __84__ICDelegateAccountStoreSQLWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  +[ICDelegateAccountStoreSchema valueForDate:v2];
  objc_msgSend(v3, "bindDouble:atPosition:", 1);
}

void __84__ICDelegateAccountStoreSQLWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v5 = a2;
  +[ICDelegateAccountStoreSchema valueForDate:v2];
  double v4 = v3;
  [v5 bindString:@"expiration_prune" atPosition:1];
  [v5 bindDouble:2 atPosition:v4];
}

uint64_t __84__ICDelegateAccountStoreSQLWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (void)removeTokenForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_isValid) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Out-of-scope transaction usage: %@", self format];
  }
  id v8 = ICDelegateAccountStorePrimaryKeyForUserIdentity(v6);
  if (!v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Non-concrete user identity: %@", v6 format];
  }
  BOOL v9 = [(ICDelegateAccountStoreSQLWriter *)self _removeTokenForIdentityKey:v8];
  if (v7)
  {
    BOOL v10 = v9;
    connection = self->_connection;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __80__ICDelegateAccountStoreSQLWriter_removeTokenForUserIdentity_completionHandler___block_invoke;
    v12[3] = &unk_1E5ACC128;
    id v13 = v7;
    BOOL v14 = v10;
    [(ICSQLiteConnection *)connection dispatchAfterTransaction:v12];
  }
}

uint64_t __80__ICDelegateAccountStoreSQLWriter_removeTokenForUserIdentity_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (void)removeIdentityPropertiesForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_isValid) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Out-of-scope transaction usage: %@", self format];
  }
  id v8 = ICDelegateAccountStorePrimaryKeyForUserIdentity(v6);
  if (!v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Non-concrete user identity: %@", v6 format];
  }
  BOOL v9 = [(ICDelegateAccountStoreSQLWriter *)self _removeAccountForIdentityKey:v8];
  BOOL v10 = [(ICDelegateAccountStoreSQLWriter *)self _removeTokenForIdentityKey:v8];
  if (v7)
  {
    BOOL v11 = v10;
    connection = self->_connection;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __93__ICDelegateAccountStoreSQLWriter_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke;
    v13[3] = &unk_1E5ACC178;
    id v14 = v7;
    BOOL v15 = v9;
    BOOL v16 = v11;
    [(ICSQLiteConnection *)connection dispatchAfterTransaction:v13];
  }
}

uint64_t __93__ICDelegateAccountStoreSQLWriter_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = *(unsigned __int8 *)(a1 + 41) != 0;
  }
  return (*(uint64_t (**)(uint64_t, BOOL, void))(v2 + 16))(v2, v3, 0);
}

- (void)removeDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_isValid) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Out-of-scope transaction usage: %@", self format];
  }
  v26 = ICDelegateAccountStorePrimaryKeyForUserIdentity(v9);
  if (!v26) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Non-concrete user identity: %@", v9 format];
  }
  connection = self->_connection;
  id v36 = 0;
  id v12 = [(ICSQLiteConnection *)connection prepareStatement:@"DELETE FROM delegation_uuid WHERE user_identity==? AND uuid=?" error:&v36];
  id v13 = v36;
  id v14 = v13;
  if (!v12)
  {
    LOBYTE(v19) = 0;
    if (!v10) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  id v24 = v13;
  id v25 = v8;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v15 = v8;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v33;
    int v19 = 1;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        v22 = self->_connection;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __91__ICDelegateAccountStoreSQLWriter_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke;
        v31[3] = &unk_1E5ACC150;
        v31[4] = v26;
        v31[5] = v21;
        v19 &= [(ICSQLiteConnection *)v22 executePreparedStatement:v12 error:0 bindings:v31];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v17);
  }
  else
  {
    LOBYTE(v19) = 1;
  }

  id v8 = v25;
  id v14 = v24;
  if (v10)
  {
LABEL_18:
    v23 = self->_connection;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __91__ICDelegateAccountStoreSQLWriter_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2;
    v27[3] = &unk_1E5ACD008;
    id v29 = v10;
    char v30 = v19;
    id v28 = v14;
    [(ICSQLiteConnection *)v23 dispatchAfterTransaction:v27];
  }
LABEL_19:
}

void __91__ICDelegateAccountStoreSQLWriter_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindString:v3 atPosition:1];
  [v4 bindString:*(void *)(a1 + 40) atPosition:2];
}

uint64_t __91__ICDelegateAccountStoreSQLWriter_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)removeAllTokensWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!self->_isValid) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Out-of-scope transaction usage: %@", self format];
  }
  [(ICSQLiteConnection *)self->_connection executeStatement:@"DELETE FROM token" error:0];
  if (v4)
  {
    BOOL v5 = [(ICSQLiteConnection *)self->_connection lastChangeCount] > 0;
    connection = self->_connection;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__ICDelegateAccountStoreSQLWriter_removeAllTokensWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E5ACC128;
    id v8 = v4;
    BOOL v9 = v5;
    [(ICSQLiteConnection *)connection dispatchAfterTransaction:v7];
  }
}

uint64_t __72__ICDelegateAccountStoreSQLWriter_removeAllTokensWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (void)invalidate
{
  connection = self->_connection;
  self->_connection = 0;

  self->_isValid = 0;
}

- (void)addDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_isValid) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Out-of-scope transaction usage: %@", self format];
  }
  id v29 = ICDelegateAccountStorePrimaryKeyForUserIdentity(v9);
  if (!v29) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Non-concrete user identity: %@", v9 format];
  }
  connection = self->_connection;
  id v39 = 0;
  id v12 = [(ICSQLiteConnection *)connection prepareStatement:@"INSERT OR REPLACE INTO delegation_uuid (user_identity, uuid, insertion_date) VALUES (?, ?, ?)" error:&v39];
  id v13 = v39;
  id v14 = v13;
  if (!v12)
  {
    LOBYTE(v22) = 0;
    if (!v10) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  id v27 = v13;
  id v15 = [MEMORY[0x1E4F1C9C8] date];
  +[ICDelegateAccountStoreSchema valueForDate:v15];
  uint64_t v17 = v16;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v28 = v8;
  id v18 = v8;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v36;
    int v22 = 1;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v24 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        id v25 = self->_connection;
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __88__ICDelegateAccountStoreSQLWriter_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke;
        v34[3] = &unk_1E5ACC100;
        v34[4] = v29;
        v34[5] = v24;
        v34[6] = v17;
        v22 &= [(ICSQLiteConnection *)v25 executePreparedStatement:v12 error:0 bindings:v34];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v20);
  }
  else
  {
    LOBYTE(v22) = 1;
  }

  id v8 = v28;
  id v14 = v27;
  if (v10)
  {
LABEL_18:
    v26 = self->_connection;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __88__ICDelegateAccountStoreSQLWriter_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2;
    v30[3] = &unk_1E5ACD008;
    id v32 = v10;
    char v33 = v22;
    id v31 = v14;
    [(ICSQLiteConnection *)v26 dispatchAfterTransaction:v30];
  }
LABEL_19:
}

void __88__ICDelegateAccountStoreSQLWriter_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindString:v3 atPosition:1];
  [v4 bindString:*(void *)(a1 + 40) atPosition:2];
  [v4 bindDouble:3 atPosition:*(double *)(a1 + 48)];
}

uint64_t __88__ICDelegateAccountStoreSQLWriter_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (ICDelegateAccountStoreSQLWriter)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDelegateAccountStoreSQLWriter;
  id v6 = [(ICDelegateAccountStoreSQLWriter *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v7->_isValid = 1;
  }

  return v7;
}

@end