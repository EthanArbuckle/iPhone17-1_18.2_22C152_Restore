@interface ICDelegateAccountStoreReader
- (ICDelegateAccountStoreReader)initWithConnection:(id)a3;
- (NSDate)lastExpirationPruningDate;
- (id)_tokenWithSQLiteRow:(id)a3;
- (id)_userIdentityWithSQLiteRow:(id)a3;
- (id)identityPropertiesForUserIdentity:(id)a3;
- (id)tokenForUserIdentity:(id)a3;
- (int64_t)overestimatedNumberOfTokens;
- (void)_enumerateQueryResults:(id)a3 usingBlock:(id)a4;
- (void)enumerateDelegationUUIDsForUserIdentity:(id)a3 usingBlock:(id)a4;
- (void)enumerateTokensUsingBlock:(id)a3;
- (void)enumerateTokensWithType:(int64_t)a3 usingBlock:(id)a4;
- (void)invalidate;
@end

@implementation ICDelegateAccountStoreReader

- (void).cxx_destruct
{
}

- (id)_userIdentityWithSQLiteRow:(id)a3
{
  v3 = [a3 stringForColumnName:@"account_identity"];
  uint64_t v4 = [v3 length];
  if (v4)
  {
    if (v4 < 40)
    {
      v5 = (void *)strtoull((const char *)[v3 UTF8String], 0, 10);
      if (v5)
      {
        v6 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:v5];
        v5 = +[ICUserIdentity specificAccountWithDSID:v6];
      }
    }
    else
    {
      v5 = +[ICUserIdentity carrierBundleWithDeviceIdentifier:v3];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_tokenWithSQLiteRow:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 int64ForColumnName:@"type"];
  if (v4 == 1)
  {
    uint64_t v6 = 0;
  }
  else
  {
    v5 = 0;
    if (v4 != 2) {
      goto LABEL_12;
    }
    uint64_t v6 = 1;
  }
  v7 = [v3 dataForColumnName:@"data"];
  if ([v7 length])
  {
    v8 = [v3 numberForColumnName:@"expiration_date"];
    v9 = v8;
    if (v8)
    {
      [v8 doubleValue];
      v10 = +[ICDelegateAccountStoreSchema dateForValue:](ICDelegateAccountStoreSchema, "dateForValue:");
    }
    else
    {
      v10 = 0;
    }
    v5 = [[ICDelegateToken alloc] initWithType:v6 data:v7 expirationDate:v10];
  }
  else
  {
    v5 = 0;
  }

LABEL_12:

  return v5;
}

- (void)_enumerateQueryResults:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__ICDelegateAccountStoreReader__enumerateQueryResults_usingBlock___block_invoke;
  v8[3] = &unk_1E5ACC9D0;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 enumerateRowsUsingBlock:v8];
}

void __66__ICDelegateAccountStoreReader__enumerateQueryResults_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v7 = [v3 _userIdentityWithSQLiteRow:v4];
    v5 = [*(id *)(a1 + 32) _tokenWithSQLiteRow:v4];

    if (v7) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (id)tokenForUserIdentity:(id)a3
{
  id v4 = a3;
  if (!self->_isValid) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Out-of-scope transaction usage: %@", self format];
  }
  v5 = ICDelegateAccountStorePrimaryKeyForUserIdentity(v4);
  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Non-concrete user identity: %@", v4 format];
  }
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__36755;
  v14 = __Block_byref_object_dispose__36756;
  id v15 = 0;
  connection = self->_connection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__ICDelegateAccountStoreReader_tokenForUserIdentity___block_invoke;
  v9[3] = &unk_1E5ACC9A8;
  v9[4] = v5;
  v9[5] = self;
  v9[6] = &v10;
  [(ICSQLiteConnection *)connection executeQuery:@"SELECT data, expiration_date, type FROM token WHERE account_identity==?" withResults:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __53__ICDelegateAccountStoreReader_tokenForUserIdentity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindString:v3 atPosition:1];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__ICDelegateAccountStoreReader_tokenForUserIdentity___block_invoke_2;
  v5[3] = &unk_1E5ACC980;
  long long v6 = *(_OWORD *)(a1 + 40);
  [v4 enumerateRowsUsingBlock:v5];
}

void __53__ICDelegateAccountStoreReader_tokenForUserIdentity___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (a2)
  {
    long long v6 = [*(id *)(a1 + 32) _tokenWithSQLiteRow:a2];
    if (([v6 isExpired] & 1) == 0) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v6);
    }
  }
  *a4 = 1;
}

- (int64_t)overestimatedNumberOfTokens
{
  if (!self->_isValid) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Out-of-scope transaction usage: %@", self format];
  }
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  connection = self->_connection;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__ICDelegateAccountStoreReader_overestimatedNumberOfTokens__block_invoke;
  v6[3] = &unk_1E5ACD198;
  v6[4] = &v7;
  [(ICSQLiteConnection *)connection executeQuery:@"SELECT count(account_identity) FROM token" withResults:v6];
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __59__ICDelegateAccountStoreReader_overestimatedNumberOfTokens__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 firstInt64Value];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (NSDate)lastExpirationPruningDate
{
  if (!self->_isValid) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Out-of-scope transaction usage: %@", self format];
  }
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__36755;
  v11 = __Block_byref_object_dispose__36756;
  id v12 = 0;
  connection = self->_connection;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__ICDelegateAccountStoreReader_lastExpirationPruningDate__block_invoke;
  v6[3] = &unk_1E5ACD198;
  v6[4] = &v7;
  [(ICSQLiteConnection *)connection executeQuery:@"SELECT value FROM metadata WHERE key==?" withResults:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

void __57__ICDelegateAccountStoreReader_lastExpirationPruningDate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bindString:@"expiration_prune" atPosition:1];
  id v8 = [v3 firstNumberValue];

  id v4 = v8;
  if (v8)
  {
    [v8 doubleValue];
    uint64_t v5 = +[ICDelegateAccountStoreSchema dateForValue:](ICDelegateAccountStoreSchema, "dateForValue:");
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v4 = v8;
  }
}

- (id)identityPropertiesForUserIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__36755;
  v18 = __Block_byref_object_dispose__36756;
  id v19 = 0;
  if (!self->_isValid) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Out-of-scope transaction usage: %@", self format];
  }
  uint64_t v5 = ICDelegateAccountStorePrimaryKeyForUserIdentity(v4);
  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Non-concrete user identity: %@", v4 format];
  }
  connection = self->_connection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__ICDelegateAccountStoreReader_identityPropertiesForUserIdentity___block_invoke;
  v10[3] = &unk_1E5ACC950;
  v10[4] = v5;
  v13 = &v14;
  id v7 = v4;
  id v11 = v7;
  id v12 = self;
  [(ICSQLiteConnection *)connection executeQuery:@"SELECT account.storefront AS storefront, token.data AS data, token.expiration_date AS expiration_date, token.type AS type FROM account LEFT OUTER JOIN token ON account.identity==token.account_identity WHERE account.identity==?" withResults:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v8;
}

void __66__ICDelegateAccountStoreReader_identityPropertiesForUserIdentity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindString:v3 atPosition:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__ICDelegateAccountStoreReader_identityPropertiesForUserIdentity___block_invoke_2;
  v7[3] = &unk_1E5ACC928;
  uint64_t v10 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  [v4 enumerateRowsUsingBlock:v7];
}

void __66__ICDelegateAccountStoreReader_identityPropertiesForUserIdentity___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a2)
  {
    id v6 = a2;
    id v7 = objc_alloc_init(ICMutableUserIdentityProperties);
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v11 = [*(id *)(a1 + 32) deviceIdentifier];
    [v10 setCarrierBundleDeviceIdentifier:v11];

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setDelegated:1];
    id v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v13 = [*(id *)(a1 + 32) DSID];
    [v12 setDSID:v13];

    uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v15 = [v6 stringForColumnName:@"storefront"];
    [v14 setStorefrontIdentifier:v15];

    uint64_t v16 = [*(id *)(a1 + 40) _tokenWithSQLiteRow:v6];

    if (v16 && ([v16 isExpired] & 1) == 0) {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setDelegateToken:v16];
    }
  }
  *a4 = 1;
}

- (void)enumerateTokensWithType:(int64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  if (!self->_isValid) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Out-of-scope transaction usage: %@", self format];
  }
  connection = self->_connection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__ICDelegateAccountStoreReader_enumerateTokensWithType_usingBlock___block_invoke;
  v9[3] = &unk_1E5ACC900;
  id v10 = v6;
  int64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [(ICSQLiteConnection *)connection executeQuery:@"SELECT data, expiration_date, type, account_identity FROM token WHERE (type == ?) AND ((expiration_date IS NULL) OR (expiration_date >= ?))" withResults:v9];
}

void __67__ICDelegateAccountStoreReader_enumerateTokensWithType_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v8 = a2;
  id v4 = [v3 date];
  +[ICDelegateAccountStoreSchema valueForDate:v4];
  double v6 = v5;

  if (*(void *)(a1 + 48) == 1) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [v8 bindInt64:v7 atPosition:1];
  [v8 bindDouble:2 atPosition:v6];
  [*(id *)(a1 + 32) _enumerateQueryResults:v8 usingBlock:*(void *)(a1 + 40)];
}

- (void)enumerateTokensUsingBlock:(id)a3
{
  id v4 = a3;
  if (!self->_isValid) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Out-of-scope transaction usage: %@", self format];
  }
  connection = self->_connection;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__ICDelegateAccountStoreReader_enumerateTokensUsingBlock___block_invoke;
  v7[3] = &unk_1E5ACC8D8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(ICSQLiteConnection *)connection executeQuery:@"SELECT data, expiration_date, type, account_identity FROM token WHERE (expiration_date IS NULL) OR (expiration_date >= ?)" withResults:v7];
}

void __58__ICDelegateAccountStoreReader_enumerateTokensUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a2;
  id v4 = [v3 date];
  +[ICDelegateAccountStoreSchema valueForDate:v4];
  double v6 = v5;

  [v7 bindDouble:1 atPosition:v6];
  [*(id *)(a1 + 32) _enumerateQueryResults:v7 usingBlock:*(void *)(a1 + 40)];
}

- (void)enumerateDelegationUUIDsForUserIdentity:(id)a3 usingBlock:(id)a4
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
  connection = self->_connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__ICDelegateAccountStoreReader_enumerateDelegationUUIDsForUserIdentity_usingBlock___block_invoke;
  v11[3] = &unk_1E5ACC8D8;
  v11[4] = v8;
  id v12 = v7;
  id v10 = v7;
  [(ICSQLiteConnection *)connection executeQuery:@"SELECT uuid FROM delegation_uuid WHERE user_identity==?" withResults:v11];
}

void __83__ICDelegateAccountStoreReader_enumerateDelegationUUIDsForUserIdentity_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindString:v3 atPosition:1];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__ICDelegateAccountStoreReader_enumerateDelegationUUIDsForUserIdentity_usingBlock___block_invoke_2;
  v5[3] = &unk_1E5ACC8B0;
  id v6 = *(id *)(a1 + 40);
  [v4 enumerateRowsUsingBlock:v5];
}

void __83__ICDelegateAccountStoreReader_enumerateDelegationUUIDsForUserIdentity_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 stringForColumnName:@"uuid"];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)invalidate
{
  connection = self->_connection;
  self->_connection = 0;

  self->_isValid = 0;
}

- (ICDelegateAccountStoreReader)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDelegateAccountStoreReader;
  id v6 = [(ICDelegateAccountStoreReader *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v7->_isValid = 1;
  }

  return v7;
}

@end