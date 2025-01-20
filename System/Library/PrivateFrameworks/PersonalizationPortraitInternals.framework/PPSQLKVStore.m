@interface PPSQLKVStore
+ (id)loadBlobForKey:(id)a3 transaction:(id)a4;
+ (id)numberForKey:(id)a3 transaction:(id)a4;
+ (id)stringForKey:(id)a3 transaction:(id)a4;
+ (void)removeBlobForKey:(id)a3 transaction:(id)a4;
+ (void)setNumber:(id)a3 forKey:(id)a4 transaction:(id)a5;
+ (void)setString:(id)a3 forKey:(id)a4 transaction:(id)a5;
+ (void)storeBlob:(id)a3 forKey:(id)a4 transaction:(id)a5;
@end

@implementation PPSQLKVStore

uint64_t __43__PPSQLKVStore_loadBlobForKey_transaction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":key" toNSString:*(void *)(a1 + 32)];
}

+ (id)numberForKey:(id)a3 transaction:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 loadBlobForKey:v6 transaction:v7];
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4F28DC0];
    v10 = (void *)MEMORY[0x1CB79D060]();
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    id v17 = 0;
    v12 = [v9 unarchivedObjectOfClasses:v11 fromData:v8 error:&v17];
    id v13 = v17;

    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      v15 = pp_default_log_handle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v13;
        _os_log_error_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_ERROR, "PPSQLDatabase: unable to unarchive number: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)loadBlobForKey:(id)a3 transaction:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__10156;
  v18 = __Block_byref_object_dispose__10157;
  id v19 = 0;
  id v7 = [v6 db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__PPSQLKVStore_loadBlobForKey_transaction___block_invoke;
  v12[3] = &unk_1E65DBA80;
  id v8 = v5;
  id v13 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__PPSQLKVStore_loadBlobForKey_transaction___block_invoke_2;
  v11[3] = &unk_1E65D91D8;
  v11[4] = &v14;
  [v7 prepAndRunQuery:@"SELECT value FROM kv_blobs WHERE key = :key" onPrep:v12 onRow:v11 onError:0];

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

+ (id)stringForKey:(id)a3 transaction:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 loadBlobForKey:v6 transaction:v7];
  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F28DC0];
    v10 = (void *)MEMORY[0x1CB79D060]();
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    id v17 = 0;
    v12 = [v9 unarchivedObjectOfClasses:v11 fromData:v8 error:&v17];
    id v13 = v17;

    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      v15 = pp_default_log_handle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v13;
        _os_log_error_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_ERROR, "PPSQLDatabase: unable to unarchive string: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (void)setString:(id)a3 forKey:(id)a4 transaction:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v12 = 0;
  id v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v12];
  id v10 = v12;
  if (v9)
  {
    +[PPSQLKVStore storeBlob:v9 forKey:v7 transaction:v8];
  }
  else
  {
    v11 = pp_default_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v10;
      _os_log_error_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_ERROR, "PPSQLDatabase: unable to archive string: %@", buf, 0xCu);
    }
  }
}

+ (void)setNumber:(id)a3 forKey:(id)a4 transaction:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v12 = 0;
  id v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v12];
  id v10 = v12;
  if (v9)
  {
    +[PPSQLKVStore storeBlob:v9 forKey:v7 transaction:v8];
  }
  else
  {
    v11 = pp_default_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v10;
      _os_log_error_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_ERROR, "PPSQLDatabase: unable to archive number: %@", buf, 0xCu);
    }
  }
}

+ (void)removeBlobForKey:(id)a3 transaction:(id)a4
{
  id v5 = a3;
  id v6 = [a4 db];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__PPSQLKVStore_removeBlobForKey_transaction___block_invoke;
  v8[3] = &unk_1E65DBA80;
  id v9 = v5;
  id v7 = v5;
  [v6 prepAndRunQuery:@"DELETE FROM kv_blobs WHERE key = :key" onPrep:v8 onRow:0 onError:0];
}

uint64_t __45__PPSQLKVStore_removeBlobForKey_transaction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":key" toNSString:*(void *)(a1 + 32)];
}

+ (void)storeBlob:(id)a3 forKey:(id)a4 transaction:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__PPSQLKVStore_storeBlob_forKey_transaction___block_invoke;
  v12[3] = &unk_1E65D6F70;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  [v9 prepAndRunQuery:@"INSERT OR REPLACE INTO kv_blobs (key, value) VALUES (:key, :value)", v12, 0, 0 onPrep onRow onError];
}

void __45__PPSQLKVStore_storeBlob_forKey_transaction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":key" toNSString:v3];
  [v4 bindNamedParam:":value" toNSData:*(void *)(a1 + 40)];
}

uint64_t __43__PPSQLKVStore_loadBlobForKey_transaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSDataForColumn:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C10];
}

@end