@interface ICServerChangeToken
+ (id)addServerChangeTokenForAccount:(id)a3 ckServerChangeToken:(id)a4 zoneID:(id)a5 databaseScope:(int64_t)a6 context:(id)a7;
+ (id)serverChangeTokenForAccount:(id)a3 zoneID:(id)a4 databaseScope:(int64_t)a5 context:(id)a6;
+ (id)serverChangeTokensMatchingPredicate:(id)a3 inContext:(id)a4;
- (CKRecordZoneID)zoneID;
- (CKServerChangeToken)ckServerChangeToken;
- (id)ic_loggingValues;
- (int64_t)databaseScope;
- (void)didTurnIntoFault;
- (void)setCkServerChangeToken:(id)a3;
- (void)setDatabaseScope:(int64_t)a3;
@end

@implementation ICServerChangeToken

- (CKServerChangeToken)ckServerChangeToken
{
  ckServerChangeToken = self->_ckServerChangeToken;
  if (!ckServerChangeToken)
  {
    v4 = [(ICServerChangeToken *)self ckServerChangeTokenData];
    if (v4)
    {
      v5 = (CKServerChangeToken *)[objc_alloc(MEMORY[0x1E4F1A388]) initWithData:v4];
      v6 = self->_ckServerChangeToken;
      self->_ckServerChangeToken = v5;
    }
    ckServerChangeToken = self->_ckServerChangeToken;
  }
  return ckServerChangeToken;
}

- (void)setCkServerChangeToken:(id)a3
{
  id v8 = a3;
  v5 = [(ICServerChangeToken *)self ckServerChangeToken];
  char v6 = [v5 isEqual:v8];

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_ckServerChangeToken, a3);
    v7 = [v8 data];
    [(ICServerChangeToken *)self setCkServerChangeTokenData:v7];
  }
}

+ (id)addServerChangeTokenForAccount:(id)a3 ckServerChangeToken:(id)a4 zoneID:(id)a5 databaseScope:(int64_t)a6 context:(id)a7
{
  id v11 = a5;
  v12 = (void *)MEMORY[0x1E4F1C0A8];
  id v13 = a4;
  id v14 = a3;
  v15 = [v12 insertNewObjectForEntityForName:@"ICServerChangeToken" inManagedObjectContext:a7];
  [v15 setAccount:v14];
  [v14 addServerChangeTokensObject:v15];

  [v15 setCkServerChangeToken:v13];
  v16 = [v11 zoneName];
  [v15 setZoneName:v16];

  v17 = [v11 ownerName];
  LOBYTE(v14) = [v17 isEqualToString:*MEMORY[0x1E4F19C08]];

  if ((v14 & 1) == 0)
  {
    v18 = [v11 ownerName];
    [v15 setOwnerName:v18];
  }
  [v15 setDatabaseScope:a6];

  return v15;
}

+ (id)serverChangeTokenForAccount:(id)a3 zoneID:(id)a4 databaseScope:(int64_t)a5 context:(id)a6
{
  v28[4] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v11
    && ([v11 ownerName],
        id v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v13 isEqualToString:*MEMORY[0x1E4F19C08]],
        v13,
        (v14 & 1) == 0))
  {
    v15 = [v11 ownerName];
  }
  else
  {
    v15 = 0;
  }
  v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"account == %@", v10];
  v28[0] = v16;
  v17 = (void *)MEMORY[0x1E4F28F60];
  [v11 zoneName];
  v18 = v27 = v10;
  v19 = [v17 predicateWithFormat:@"zoneName == %@", v18];
  v28[1] = v19;
  v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ownerName == %@", v15];
  v28[2] = v20;
  v21 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"databaseScope == %ld", a5);
  v28[3] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];

  v23 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v22];
  v24 = [a1 serverChangeTokensMatchingPredicate:v23 inContext:v12];
  v25 = [v24 firstObject];

  return v25;
}

+ (id)serverChangeTokensMatchingPredicate:(id)a3 inContext:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 fetchRequestWithEntityName:@"ICServerChangeToken"];
  [v8 setPredicate:v7];

  id v13 = 0;
  v9 = [v6 executeFetchRequest:v8 error:&v13];

  id v10 = v13;
  if (v10)
  {
    id v11 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[ICServerChangeToken serverChangeTokensMatchingPredicate:inContext:]((uint64_t)v10, v11);
    }
  }
  return v9;
}

- (void)setDatabaseScope:(int64_t)a3
{
  [(ICServerChangeToken *)self willChangeValueForKey:@"databaseScope"];
  v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [(ICServerChangeToken *)self setPrimitiveValue:v5 forKey:@"databaseScope"];

  [(ICServerChangeToken *)self didChangeValueForKey:@"databaseScope"];
}

- (int64_t)databaseScope
{
  [(ICServerChangeToken *)self willAccessValueForKey:@"databaseScope"];
  v3 = [(ICServerChangeToken *)self primitiveValueForKey:@"databaseScope"];
  int64_t v4 = [v3 integerValue];

  [(ICServerChangeToken *)self didAccessValueForKey:@"databaseScope"];
  return v4;
}

- (void)didTurnIntoFault
{
  v5.receiver = self;
  v5.super_class = (Class)ICServerChangeToken;
  [(ICServerChangeToken *)&v5 didTurnIntoFault];
  zoneID = self->_zoneID;
  self->_zoneID = 0;

  ckServerChangeToken = self->_ckServerChangeToken;
  self->_ckServerChangeToken = 0;
}

- (CKRecordZoneID)zoneID
{
  zoneID = self->_zoneID;
  if (!zoneID)
  {
    int64_t v4 = [(ICServerChangeToken *)self zoneName];
    if (v4)
    {
      id v5 = [(ICServerChangeToken *)self ownerName];
      if (!v5) {
        id v5 = (id)*MEMORY[0x1E4F19C08];
      }
      id v6 = (CKRecordZoneID *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:v4 ownerName:v5];
      id v7 = self->_zoneID;
      self->_zoneID = v6;
    }
    zoneID = self->_zoneID;
  }
  return zoneID;
}

- (id)ic_loggingValues
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int64_t v4 = [(ICServerChangeToken *)self managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__ICServerChangeToken_ic_loggingValues__block_invoke;
  v8[3] = &unk_1E64A4218;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  [v4 performBlockAndWait:v8];

  id v6 = v5;
  return v6;
}

void __39__ICServerChangeToken_ic_loggingValues__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) zoneName];
  v3 = (void *)v2;
  if (v2) {
    int64_t v4 = (__CFString *)v2;
  }
  else {
    int64_t v4 = &stru_1F1F2FFF8;
  }
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:@"zoneName"];

  id v5 = [*(id *)(a1 + 40) ckServerChangeToken];
  uint64_t v6 = objc_msgSend(v5, "ic_loggingDescription");
  id v7 = (void *)v6;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  else {
    id v8 = &stru_1F1F2FFF8;
  }
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"ckServerChangeToken"];

  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "databaseScope"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:@"databaseScope"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckServerChangeToken, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

+ (void)serverChangeTokensMatchingPredicate:(uint64_t)a1 inContext:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Error fetching server change tokens: %@", (uint8_t *)&v2, 0xCu);
}

@end