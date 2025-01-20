@interface ICDelegateAccountStoreSchema
+ (BOOL)_createDefaultSchemaWithConnection:(id)a3 error:(id *)a4;
+ (BOOL)setupWithConnection:(id)a3 error:(id *)a4;
+ (double)valueForDate:(id)a3;
+ (id)dateForValue:(double)a3;
+ (id)defaultDatabasePath;
+ (int64_t)currentVersion;
@end

@implementation ICDelegateAccountStoreSchema

+ (BOOL)_createDefaultSchemaWithConnection:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = objc_retain((id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"CREATE TABLE IF NOT EXISTS account(identity TEXT PRIMARY KEY,storefront TEXT);",
                         @"CREATE TABLE IF NOT EXISTS metadata(key TEXT PRIMARY KEY,value TEXT);",
                         @"CREATE TABLE IF NOT EXISTS token(account_identity TEXT UNIQUE,type INTEGER NOT NULL,expiration_date REAL,data BLOB NOT NULL);",
                         @"CREATE TABLE IF NOT EXISTS delegation_uuid(user_identity TEXT,uuid TEXT,insertion_date REAL,UNIQUE(user_identity, uuid));",
                         @"ANALYZE",
                         0));
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      uint64_t v11 = 0;
      v12 = v9;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
        id v17 = v12;
        int v14 = [v5 executeStatement:v13 error:&v17];
        id v9 = v17;

        if (!v14)
        {

          if (a4)
          {
            id v9 = v9;
            BOOL v15 = 0;
            *a4 = v9;
          }
          else
          {
            BOOL v15 = 0;
          }
          goto LABEL_15;
        }
        ++v11;
        v12 = v9;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v9 = 0;
  }

  BOOL v15 = 1;
LABEL_15:

  return v15;
}

+ (double)valueForDate:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  return result;
}

+ (BOOL)setupWithConnection:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__35829;
  long long v20 = __Block_byref_object_dispose__35830;
  id v21 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__ICDelegateAccountStoreSchema_setupWithConnection_error___block_invoke;
  v11[3] = &unk_1E5ACC5E8;
  id v7 = v6;
  id v12 = v7;
  uint64_t v13 = &v16;
  int v14 = &v22;
  id v15 = a1;
  [v7 performTransaction:v11];
  int v8 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((unsigned char *)v23 + 24))
  {
    *a4 = (id) v17[5];
    int v8 = *((unsigned __int8 *)v23 + 24);
  }
  BOOL v9 = v8 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

uint64_t __58__ICDelegateAccountStoreSchema_setupWithConnection_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v2 + 40);
  v3 = (id *)(v2 + 40);
  id v4 = v5;
  id v6 = *(id *)(a1 + 32);
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__35829;
  v33 = __Block_byref_object_dispose__35830;
  id v34 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = ____GetUserVersion_block_invoke;
  v20[3] = &unk_1E5ACC610;
  v20[4] = &v29;
  v20[5] = &v25;
  v20[6] = &v21;
  [v6 executeQuery:@"PRAGMA user_version" withResults:v20];
  if (*((unsigned char *)v26 + 24))
  {
    uint64_t v7 = v22[3];
    BOOL v8 = 1;
  }
  else
  {
    id v4 = (id) v30[5];
    uint64_t v7 = 0;
    BOOL v8 = *((unsigned char *)v26 + 24) != 0;
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  objc_storeStrong(v3, v4);
  if (v8)
  {
    if (v7)
    {
      if (v7 == 11000)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      }
      [*(id *)(a1 + 32) truncate];
    }
    BOOL v9 = *(void **)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v11 + 40);
    int v12 = [v9 _createDefaultSchemaWithConnection:v10 error:&obj];
    objc_storeStrong((id *)(v11 + 40), obj);
    if (v12)
    {
      uint64_t v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"PRAGMA user_version=%ld", 11000);
      int v14 = *(void **)(a1 + 32);
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      id v18 = *(id *)(v15 + 40);
      int v16 = [v14 executeStatement:v13 error:&v18];
      objc_storeStrong((id *)(v15 + 40), v18);
      if (v16) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
    }
  }
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

+ (id)defaultDatabasePath
{
  uint64_t v2 = MSVMobileHomeDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"Library/com.apple.iTunesCloud/ICDelegateAccountStore.db"];

  return v3;
}

+ (id)dateForValue:(double)a3
{
  return (id)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
}

+ (int64_t)currentVersion
{
  return 11000;
}

@end