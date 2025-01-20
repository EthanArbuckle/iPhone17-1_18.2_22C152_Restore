@interface SSAppPurchaseHistoryDatabaseSchema
+ (BOOL)createSchemaInDatabase:(id)a3;
+ (id)databasePath;
@end

@implementation SSAppPurchaseHistoryDatabaseSchema

+ (BOOL)createSchemaInDatabase:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 userVersion];
  if (v4 == 11201)
  {
LABEL_83:
    LOBYTE(v45) = 1;
    return v45;
  }
  uint64_t v5 = v4;
  int v6 = 0;
  LOBYTE(v7) = 0;
  while (1)
  {
    v8 = (void *)MEMORY[0x1A6267F60]();
    v9 = v8;
    if (v5 <= 8001) {
      break;
    }
    if (v5 > 10199)
    {
      switch(v5)
      {
        case 10200:
          if (([a3 executeSQL:@"ALTER TABLE app_purchase_history ADD COLUMN is_32_bit_only INTEGER DEFAULT 0;"] & 1) == 0) {
            goto LABEL_50;
          }
          uint64_t v5 = 11000;
          goto LABEL_46;
        case 11000:
          if (([a3 executeSQL:@"ALTER TABLE app_purchase_history ADD COLUMN is_preorder INTEGER DEFAULT 0;"] & 1) == 0) {
            goto LABEL_50;
          }
          uint64_t v5 = 11200;
          goto LABEL_46;
        case 11200:
          if (![a3 executeSQL:@"ALTER TABLE app_purchase_history ADD COLUMN required_capabilities TEXT;"]) {
            goto LABEL_50;
          }
LABEL_9:
          uint64_t v5 = 11201;
LABEL_46:
LABEL_48:
          int v7 = 1;
          goto LABEL_76;
      }
LABEL_47:
      if ((v7 & 1) == 0) {
        goto LABEL_51;
      }
      goto LABEL_48;
    }
    if (v5 != 8002)
    {
      if (v5 == 10000)
      {
        if (![a3 executeSQL:@"ALTER TABLE app_purchase_history ADD COLUMN is_hidden_from_springboard INTEGER DEFAULT 0;"]
          || ![a3 executeSQL:@"ALTER TABLE app_purchase_history ADD COLUMN oval_icon_token TEXT;"]
          || ([a3 executeSQL:@"ALTER TABLE app_purchase_history ADD COLUMN oval_icon_url TEXT;"] & 1) == 0)
        {
          goto LABEL_50;
        }
        uint64_t v5 = 10200;
        goto LABEL_46;
      }
      goto LABEL_47;
    }
    char v15 = [a3 executeSQL:@"ALTER TABLE app_purchase_history ADD COLUMN has_messages_extension INTEGER DEFAULT 0;"];
    if ((v15 & 1) == 0)
    {
      uint64_t v5 = 10000;
      goto LABEL_51;
    }
    int v7 = 1;
    uint64_t v5 = 10000;
LABEL_76:
    if (v5 == 11201)
    {
      if (v7) {
        [a3 setUserVersion:11201];
      }
      goto LABEL_83;
    }
  }
  if (v5 > 7999)
  {
    if (v5 == 8000)
    {
      if (![a3 executeSQL:@"ALTER TABLE app_purchase_history ADD COLUMN is_family_shareable INTEGER DEFAULT 0;"]
        || ([a3 executeSQL:@"ALTER TABLE app_purchase_history ADD COLUMN vpp_is_licensed INTEGER DEFAULT 0;"] & 1) == 0)
      {
        goto LABEL_50;
      }
      uint64_t v5 = 8001;
      goto LABEL_46;
    }
    char v14 = [a3 executeSQL:@"ALTER TABLE app_purchase_history ADD COLUMN is_first_party INTEGER DEFAULT 0;"];
    if ((v14 & 1) == 0)
    {
      uint64_t v5 = 8002;
      goto LABEL_51;
    }
    int v7 = 1;
    uint64_t v5 = 8002;
    goto LABEL_76;
  }
  if (!v5)
  {
    if (![a3 executeSQL:@"PRAGMA legacy_file_format = 0;"]
      || ![a3 executeSQL:@"CREATE TABLE IF NOT EXISTS app_purchase_history (pid INTEGER, account_unique_identifier INTEGER,category TEXT, company_title TEXT, content_rating_flags INTEGER, bundle_id TEXT, date_updated INTEGER, date_purchased INTEGER, download_size INTEGER, flavors TEXT, has_messages_extension INTEGER DEFAULT 0, is_hidden_from_springboard INTEGER DEFAULT 0, icon_title TEXT, icon_token TEXT, icon_url TEXT, oval_icon_token TEXT, oval_icon_url TEXT, is_family_shareable INTEGER DEFAULT 0, is_first_party INTEGER DEFAULT 0, is_newsstand INTEGER DEFAULT 0, is_hidden INTEGER DEFAULT 0, long_title TEXT, minimum_os INTEGER, purchased_token INTEGER,store_id INTEGER, supports_ipad INTEGER DEFAULT 0, supports_iphone INTEGER DEFAULT 0, redownload_params TEXT, version_human_readable TEXT, version_itunes INTEGER, vpp_is_licensed INTEGER DEFAULT 0, is_32_bit_only INTEGER DEFAULT 0, is_preorder INTEGER DEFAULT 0, required_capabilities TEXT, PRIMARY KEY (pid));"]
      || ![a3 executeSQL:@"CREATE TABLE IF NOT EXISTS db_properties (key TEXT PRIMARY KEY, value TEXT)"]|| !objc_msgSend(a3, "executeSQL:", @"CREATE TABLE IF NOT EXISTS app_purchase_history_accounts (account_unique_identifier INTEGER, local_revision INTEGER, PRIMARY KEY (account_unique_identifier));")
      || ![a3 executeSQL:@"CREATE INDEX IF NOT EXISTS app_purchase_history_store_id ON app_purchase_history (store_id);"]
      || ![a3 executeSQL:@"CREATE INDEX IF NOT EXISTS app_purchase_history_category ON app_purchase_history (category);"]
      || ![a3 executeSQL:@"CREATE INDEX IF NOT EXISTS app_purchase_history_bundle_id ON app_purchase_history (bundle_id);"]
      || ([a3 executeSQL:@"CREATE INDEX IF NOT EXISTS app_purchase_history_account_unique_identifier ON app_purchase_history (account_unique_identifier);"] & 1) == 0)
    {
      goto LABEL_50;
    }
    goto LABEL_9;
  }
  if (v5 != 7000) {
    goto LABEL_47;
  }
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  char v74 = 0;
  char v10 = [a3 executeSQL:@"CREATE TABLE IF NOT EXISTS app_purchase_history_accounts (account_unique_identifier INTEGER, local_revision INTEGER, PRIMARY KEY (account_unique_identifier));"];
  *((unsigned char *)v72 + 24) = v10;
  if ((v10 & 1) == 0)
  {
    _Block_object_dispose(&v71, 8);
    uint64_t v5 = 7000;
LABEL_50:
    goto LABEL_51;
  }
  *(void *)v77 = 0;
  *(void *)&v77[8] = v77;
  *(void *)&v77[16] = 0x3052000000;
  *(void *)&v77[24] = __Block_byref_object_copy__70;
  *(void *)&v77[32] = __Block_byref_object_dispose__70;
  uint64_t v78 = 0;
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __updateAppPurchaseHistoryFrom7000to8000_block_invoke;
  v70[3] = &unk_1E5BACE58;
  v70[4] = a3;
  v70[5] = v77;
  objc_msgSend(a3, "prepareStatementForSQL:cache:usingBlock:", @"SELECT value FROM db_properties WHERE key=\"app_purchase_history.localRevision\";",
    0,
    v70);
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3052000000;
  v67 = __Block_byref_object_copy__70;
  v68 = __Block_byref_object_dispose__70;
  uint64_t v69 = 0;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __updateAppPurchaseHistoryFrom7000to8000_block_invoke_2;
  v63[3] = &unk_1E5BACE58;
  v63[4] = a3;
  v63[5] = &v64;
  objc_msgSend(a3, "prepareStatementForSQL:cache:usingBlock:", @"SELECT value FROM db_properties WHERE key=\"app_purchase_history.account_unique_identifier\";",
    0,
    v63);
  v11 = (void *)v65[5];
  if (v11)
  {
    uint64_t v12 = *(void *)(*(void *)&v77[8] + 40);
    if (v12)
    {
      v75[0] = @"account_unique_identifier";
      v75[1] = @"local_revision";
      v76[0] = v11;
      v76[1] = v12;

      v11 = (void *)v65[5];
    }
  }

  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __updateAppPurchaseHistoryFrom7000to8000_block_invoke_3;
  v62[3] = &unk_1E5BADFE0;
  v62[4] = a3;
  v62[5] = &v71;
  objc_msgSend(a3, "prepareStatementForSQL:cache:usingBlock:", @"DELETE FROM db_properties WHERE key=\"app_purchase_history.localRevision\";",
    0,
    v62);
  BOOL v13 = *((unsigned char *)v72 + 24) == 0;
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(v77, 8);
  _Block_object_dispose(&v71, 8);
  if (!v13)
  {
    int v7 = 1;
    uint64_t v5 = 8000;
    goto LABEL_76;
  }
  uint64_t v5 = 8000;
LABEL_51:
  uint64_t v16 = [a3 userVersion];
  int v17 = v16;
  if (v16 != v5)
  {
    id v31 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v31) {
      id v31 = +[SSLogConfig sharedConfig];
    }
    int v32 = [v31 shouldLog];
    if ([v31 shouldLogToDisk]) {
      int v33 = v32 | 2;
    }
    else {
      int v33 = v32;
    }
    if (os_log_type_enabled((os_log_t)[v31 OSLogObject], OS_LOG_TYPE_ERROR)) {
      int v34 = v33;
    }
    else {
      int v34 = v33 & 2;
    }
    if (v34)
    {
      uint64_t v35 = objc_opt_class();
      *(_DWORD *)v77 = 138413058;
      *(void *)&v77[4] = v35;
      *(_WORD *)&v77[12] = 1024;
      *(_DWORD *)&v77[14] = v5;
      *(_WORD *)&v77[18] = 1024;
      *(_DWORD *)&v77[20] = 11201;
      *(_WORD *)&v77[24] = 1024;
      *(_DWORD *)&v77[26] = v17;
      LODWORD(v61) = 30;
      v60 = v77;
      uint64_t v36 = _os_log_send_and_compose_impl();
      if (v36)
      {
        v37 = (void *)v36;
        uint64_t v38 = objc_msgSend(NSString, "stringWithCString:encoding:", v36, 4, v77, v61);
        free(v37);
        SSFileLog(v31, @"%@", v39, v40, v41, v42, v43, v44, v38);
      }
    }
    int v6 = 0;
    goto LABEL_75;
  }
  id v18 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v18) {
    id v18 = +[SSLogConfig sharedConfig];
  }
  int v19 = [v18 shouldLog];
  if ([v18 shouldLogToDisk]) {
    v19 |= 2u;
  }
  int v20 = v6 + 1;
  if (!os_log_type_enabled((os_log_t)[v18 OSLogObject], OS_LOG_TYPE_ERROR)) {
    v19 &= 2u;
  }
  if (v19)
  {
    uint64_t v21 = objc_opt_class();
    *(_DWORD *)v77 = 138413058;
    *(void *)&v77[4] = v21;
    *(_WORD *)&v77[12] = 2048;
    *(void *)&v77[14] = v5;
    *(_WORD *)&v77[22] = 2048;
    *(void *)&v77[24] = 11201;
    *(_WORD *)&v77[32] = 1024;
    *(_DWORD *)&v77[34] = v6 + 1;
    LODWORD(v61) = 38;
    v60 = v77;
    uint64_t v22 = _os_log_send_and_compose_impl();
    if (v22)
    {
      v23 = (void *)v22;
      uint64_t v24 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, v77, v61);
      free(v23);
      SSFileLog(v18, @"%@", v25, v26, v27, v28, v29, v30, v24);
    }
  }
  if (v6 < 5)
  {
    ++v6;
LABEL_75:
    uint64_t v5 = objc_msgSend(a3, "userVersion", v60);
    int v7 = 0;
    goto LABEL_76;
  }
  id v46 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v46) {
    id v46 = +[SSLogConfig sharedConfig];
  }
  int v47 = objc_msgSend(v46, "shouldLog", v60);
  if ([v46 shouldLogToDisk]) {
    int v48 = v47 | 2;
  }
  else {
    int v48 = v47;
  }
  if (os_log_type_enabled((os_log_t)[v46 OSLogObject], OS_LOG_TYPE_ERROR)) {
    int v49 = v48;
  }
  else {
    int v49 = v48 & 2;
  }
  if (v49)
  {
    uint64_t v50 = objc_opt_class();
    *(_DWORD *)v77 = 138413058;
    *(void *)&v77[4] = v50;
    *(_WORD *)&v77[12] = 1024;
    *(_DWORD *)&v77[14] = v20;
    *(_WORD *)&v77[18] = 2048;
    *(void *)&v77[20] = v5;
    *(_WORD *)&v77[28] = 2048;
    *(void *)&v77[30] = 11201;
    LODWORD(v61) = 38;
    uint64_t v45 = _os_log_send_and_compose_impl();
    if (!v45) {
      return v45;
    }
    v51 = (void *)v45;
    uint64_t v52 = objc_msgSend(NSString, "stringWithCString:encoding:", v45, 4, v77, v61);
    free(v51);
    SSFileLog(v46, @"%@", v53, v54, v55, v56, v57, v58, v52);
  }
  LOBYTE(v45) = 0;
  return v45;
}

+ (id)databasePath
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", CPSharedResourcesDirectory(), @"Library", @"Caches", @"com.apple.storeservices", @"AppPurchaseHistory.6.sqlitedb", 0);
  v3 = (void *)[NSString pathWithComponents:v2];

  return v3;
}

@end