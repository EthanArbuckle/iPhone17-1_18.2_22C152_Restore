@interface BRCDatabaseRestoreManager
- (BRCDatabaseRestoreManager)initWithUserURL:(id)a3;
- (NSURL)clientDatabaseURL;
- (NSURL)userURL;
- (void)restoreWithCompletionBlock:(id)a3;
- (void)setClientDatabaseURL:(id)a3;
- (void)setUserURL:(id)a3;
@end

@implementation BRCDatabaseRestoreManager

- (BRCDatabaseRestoreManager)initWithUserURL:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BRCDatabaseRestoreManager;
  v6 = [(BRCDatabaseRestoreManager *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userURL, a3);
    uint64_t v8 = [(NSURL *)v7->_userURL URLByAppendingPathComponent:@"Library/Application Support/CloudDocs/session/db/client.db"];
    clientDatabaseURL = v7->_clientDatabaseURL;
    v7->_clientDatabaseURL = (NSURL *)v8;

    v10 = brc_bread_crumbs();
    v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = [(NSURL *)v7->_clientDatabaseURL path];
      *(_DWORD *)buf = 138412546;
      v16 = v12;
      __int16 v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_INFO, "[INFO] Initializing restore manager with %@%@", buf, 0x16u);
    }
  }

  return v7;
}

- (void)restoreWithCompletionBlock:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = [[BRCDatabaseBackupManager alloc] initWithUserURL:self->_userURL outputUserURL:self->_userURL];
  v6 = [(BRCDatabaseBackupManager *)v5 databaseURL];
  v7 = [[BRCDatabaseBackupStorage alloc] initWithDatabaseURL:v6];
  uint64_t v8 = [(NSURL *)self->_userURL path];
  [(BRCDatabaseBackupStorage *)v7 populateNewColumnsWithBasePath:v8];
  clientDatabaseURL = self->_clientDatabaseURL;
  id v23 = 0;
  BOOL v10 = [(BRCDatabaseBackupStorage *)v7 attachDatabase:clientDatabaseURL error:&v23];
  id v11 = v23;
  if (v10)
  {
    if ([(BRCDatabaseBackupStorage *)v7 updateAttachedDatabase])
    {
      v12 = [(NSURL *)self->_userURL URLByAppendingPathComponent:@"Library/Application Support/CloudDocs/" isDirectory:1];
      id v22 = v11;
      BOOL v13 = BRCRecursivelyChangeOwnerAndGroupToMobile(v12, &v22);
      id v14 = v22;

      if (v13)
      {

        [(BRCDatabaseBackupManager *)v5 cleanOnDisk];
        v15 = brc_bread_crumbs();
        v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v15;
          _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] Calling completion block with success.%@", buf, 0xCu);
        }

        v4[2](v4, 1, 0);
        v7 = 0;
      }
      else
      {
        ((void (**)(id, uint64_t, id))v4)[2](v4, 0, v14);
      }
      id v11 = v14;
    }
    else
    {
      uint64_t v19 = brc_bread_crumbs();
      v20 = brc_default_log();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
        [(BRCDatabaseRestoreManager *)(uint64_t)v7 restoreWithCompletionBlock:v20];
      }

      v4[2](v4, 0, 0);
    }
  }
  else
  {
    __int16 v17 = brc_bread_crumbs();
    v18 = brc_default_log();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      v21 = [(NSURL *)self->_clientDatabaseURL path];
      *(_DWORD *)buf = 138412802;
      v25 = v21;
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 2112;
      v29 = v17;
      _os_log_error_impl(&dword_23FA42000, v18, (os_log_type_t)0x90u, "[ERROR] Unable to attach db %@: %@%@", buf, 0x20u);
    }
    ((void (**)(id, uint64_t, id))v4)[2](v4, 0, v11);
  }
}

- (NSURL)userURL
{
  return self->_userURL;
}

- (void)setUserURL:(id)a3
{
}

- (NSURL)clientDatabaseURL
{
  return self->_clientDatabaseURL;
}

- (void)setClientDatabaseURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDatabaseURL, 0);
  objc_storeStrong((id *)&self->_userURL, 0);
}

- (void)restoreWithCompletionBlock:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_23FA42000, log, (os_log_type_t)0x90u, "[ERROR] Failed to update attached database %@%@", (uint8_t *)&v3, 0x16u);
}

@end