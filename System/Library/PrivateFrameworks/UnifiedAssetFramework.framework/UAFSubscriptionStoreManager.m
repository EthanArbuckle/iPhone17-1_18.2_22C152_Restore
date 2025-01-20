@interface UAFSubscriptionStoreManager
+ (id)_getManagerReadOnly:(BOOL)a3;
+ (id)defaultManager;
+ (id)getSerialQueue;
+ (id)writeManager;
- (BOOL)_checkDbVersion;
- (BOOL)_createDbVersionTable;
- (BOOL)_isUsageLimitExceeded:(id)a3;
- (BOOL)_moveDatabase;
- (BOOL)_openDatabase:(id)a3;
- (BOOL)_removeAllSubscriptions;
- (BOOL)_removeAllSystemAssetSetUsages;
- (BOOL)_subscribeSubscription:(id)a3 subscriptionName:(id)a4 assetSetSubscription:(id)a5 expires:(id)a6;
- (BOOL)_unsubscribeSubscription:(id)a3 subscription:(id)a4;
- (BOOL)clearSystemAssetSetUsages:(id)a3;
- (BOOL)performDbUpgradeToVersion:(int)a3;
- (BOOL)removeAllSubscriptions;
- (BOOL)removeAllSystemAssetSetUsages;
- (BOOL)subscribe:(id)a3 subscriptions:(id)a4 expires:(id)a5;
- (BOOL)unsubscribe:(id)a3 subscriptions:(id)a4;
- (UAFSubscriptionStoreManager)initWithDbDirPath:(id)a3 dbName:(id)a4;
- (UAFSubscriptionStoreManager)initWithDbDirPath:(id)a3 dbName:(id)a4 readOnly:(BOOL)a5 allowCreate:(BOOL)a6;
- (id)_dataFromSystemAssetSetUsages:(id)a3;
- (id)_dataFromUAFAssetSubscription:(id)a3;
- (id)_getSubscription:(id)a3 subscription:(id)a4;
- (id)_getSubscription:(sqlite3_stmt *)a3;
- (id)_getSubscriptions:(id)a3;
- (id)_getSubscriptions:(sqlite3_stmt *)a3 subscriptionsFor:(id)a4;
- (id)_subscriptionTime:(id)a3;
- (id)_systemAssetSetUsagesFromData:(id)a3;
- (id)_uafAssetSetSubscriptionFromData:(id)a3;
- (id)getAllSubscriptions:(id *)a3;
- (id)getAllSystemAssetSetUsages:(id *)a3;
- (id)getAllSystemConfiguration;
- (id)getSubscribers;
- (id)getSubscription:(id)a3 subscriber:(id)a4;
- (id)getSubscriptions:(id)a3 error:(id *)a4;
- (id)getSystemAssetSetUsages:(id)a3;
- (id)getSystemConfigurationForKey:(id)a3;
- (id)readData:(sqlite3_stmt *)a3 col:(int)a4;
- (id)readString:(sqlite3_stmt *)a3 col:(int)a4;
- (id)updateSystemAssetSetUsages:(id *)a3;
- (id)updateSystemAssetSetUsages:(id *)a3 configurationManager:(id)a4;
- (int)_beginDatabaseTransaction;
- (int)_endDatabaseTransaction;
- (int)_performDbUpgrade:(int)a3;
- (int)_rollbackDatabaseTransaction;
- (int)_setDbVersion:(int)a3;
- (int)_setSystemAssetSetUsages:(id)a3;
- (int)_setSystemAssetSetUsages:(id)a3 usages:(id)a4;
- (int)_updateSystemAssetSetUsages:(id *)a3 assetSetUsages:(id *)a4 configurationManager:(id)a5;
- (int)bindData:(sqlite3_stmt *)a3 col:(int)a4 data:(id)a5;
- (int)bindDate:(sqlite3_stmt *)a3 col:(int)a4 date:(id)a5;
- (int)bindString:(sqlite3_stmt *)a3 col:(int)a4 string:(id)a5;
- (int)doDatabaseOperation:(id)a3 useTransaction:(BOOL)a4 logDescription:(id)a5 error:(id *)a6;
- (int)executeSQL:(const char *)a3;
- (unint64_t)updateCount;
- (void)_closeDatabase;
- (void)dealloc;
- (void)expireSubscriptions;
- (void)setSystemConfigurationForKey:(id)a3 withValue:(id)a4;
@end

@implementation UAFSubscriptionStoreManager

void __87__UAFSubscriptionStoreManager_doDatabaseOperation_useTransaction_logDescription_error___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) _openDatabase:*(void *)(*(void *)(a1 + 32) + 168)])
  {
    v2 = *(unsigned char **)(a1 + 32);
    if (v2[184] || ([v2 _checkDbVersion] & 1) != 0)
    {
      if (*(unsigned char *)(a1 + 64))
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _beginDatabaseTransaction];
        if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
        {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 48)
                                                                                             + 16))();
          int v3 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          if (v3 && v3 != 101)
          {
            v10 = UAFGetLogCategory((void **)&UAFLogContextStorage);
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v11 = *(void *)(a1 + 40);
              *(_DWORD *)v13 = 136315394;
              *(void *)&v13[4] = "-[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:error:]_block_invoke";
              *(_WORD *)&v13[12] = 2114;
              *(void *)&v13[14] = v11;
              _os_log_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEFAULT, "%s Rolling back exclusive transaction of %{public}@", v13, 0x16u);
            }

            if (![*(id *)(a1 + 32) _rollbackDatabaseTransaction]
              || *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 101)
            {
              goto LABEL_13;
            }
            v5 = UAFGetLogCategory((void **)&UAFLogContextStorage);
            if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
              goto LABEL_23;
            }
            uint64_t v12 = *(void *)(a1 + 40);
            *(_DWORD *)v13 = 136315394;
            *(void *)&v13[4] = "-[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:error:]_block_invoke";
            *(_WORD *)&v13[12] = 2114;
            *(void *)&v13[14] = v12;
            v7 = "%s Rollback exclusive transaction of %{public}@ failed";
          }
          else
          {
            *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _endDatabaseTransaction];
            int v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
            if (!v4 || v4 == 101) {
              goto LABEL_13;
            }
            v5 = UAFGetLogCategory((void **)&UAFLogContextStorage);
            if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
              goto LABEL_23;
            }
            uint64_t v6 = *(void *)(a1 + 40);
            *(_DWORD *)v13 = 136315394;
            *(void *)&v13[4] = "-[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:error:]_block_invoke";
            *(_WORD *)&v13[12] = 2114;
            *(void *)&v13[14] = v6;
            v7 = "%s Commit of exclusive transaction of %{public}@ failed";
          }
          _os_log_error_impl(&dword_23797A000, v5, OS_LOG_TYPE_ERROR, v7, v13, 0x16u);
LABEL_23:
        }
      }
      else
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
      }
LABEL_13:
      objc_msgSend(*(id *)(a1 + 32), "_closeDatabase", *(_OWORD *)v13, *(void *)&v13[16]);
      return;
    }
    v8 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)v13 = 136315394;
      *(void *)&v13[4] = "-[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:error:]_block_invoke";
      *(_WORD *)&v13[12] = 2114;
      *(void *)&v13[14] = v9;
      _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s Denying %{public}@ due to version mismatch", v13, 0x16u);
    }
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 3;
}

- (BOOL)_openDatabase:(id)a3
{
  v115[1] = *MEMORY[0x263EF8340];
  int v4 = a3;
  v5 = [MEMORY[0x263F08850] defaultManager];
  if (v4 || (int v4 = self->_databaseName) != 0)
  {
    uint64_t v6 = [v4 stringByDeletingLastPathComponent];
    if ([MEMORY[0x263F61E30] isClassCLocked])
    {
      v7 = UAFGetLogCategory((void **)&UAFLogContextStorage);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
        _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s Attempt to open database before class c unlock", buf, 0xCu);
      }
LABEL_119:

      BOOL v82 = 0;
LABEL_120:

      goto LABEL_121;
    }
    int v8 = [v5 fileExistsAtPath:v4];
    int v9 = v8;
    BOOL readOnly = self->_readOnly;
    if (!self->_readOnly && (v8 & 1) == 0 && v6)
    {
      if (!self->_allowCreate) {
        goto LABEL_17;
      }
      id v107 = 0;
      char v11 = [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v107];
      id v12 = v107;
      if ((v11 & 1) == 0)
      {
        v13 = UAFGetLogCategory((void **)&UAFLogContextStorage);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
          __int16 v110 = 2112;
          v111 = (const char *)v6;
          __int16 v112 = 2112;
          v113[0] = v12;
          _os_log_error_impl(&dword_23797A000, v13, OS_LOG_TYPE_ERROR, "%s Could not create database directory %@: %@", buf, 0x20u);
        }
      }
      BOOL readOnly = self->_readOnly;
    }
    if (readOnly)
    {
      int v14 = 1;
      goto LABEL_18;
    }
LABEL_17:
    int v14 = 2;
LABEL_18:
    if (self->_allowCreate) {
      int v15 = v14 | 4;
    }
    else {
      int v15 = v14;
    }
    v16 = v4;
    p_store = &self->_store;
    int v18 = sqlite3_open_v2((const char *)[v16 UTF8String], &self->_store, v15, 0);
    store = self->_store;
    if (v18)
    {
      v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v21 = v18;
      uint64_t v114 = *MEMORY[0x263F08320];
      if (store)
      {
        v22 = [NSString stringWithUTF8String:sqlite3_errmsg(store)];
        char v23 = 0;
LABEL_112:
        v115[0] = v22;
        v83 = [NSDictionary dictionaryWithObjects:v115 forKeys:&v114 count:1];
        v7 = [v20 errorWithDomain:@"SQLITE" code:v21 userInfo:v83];

        if ((v23 & 1) == 0) {
        v84 = UAFGetLogCategory((void **)&UAFLogContextStorage);
        }
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
          __int16 v110 = 2112;
          v111 = (const char *)v16;
          __int16 v112 = 2112;
          v113[0] = v7;
          _os_log_error_impl(&dword_23797A000, v84, OS_LOG_TYPE_ERROR, "%s Could not open database (%@): %@", buf, 0x20u);
        }

        if (*p_store) {
          sqlite3_close(*p_store);
        }
        *p_store = 0;
        goto LABEL_119;
      }
    }
    else
    {
      if (store)
      {
        sqlite3_busy_timeout(store, 60000);
        if (!self->_readOnly)
        {
          [(UAFSubscriptionStoreManager *)self executeSQL:"CREATE TABLE IF NOT EXISTS Subscriptions (k0 TEXT, k1 TEXT, k2 BLOB, k3 REAL)"];
          [(UAFSubscriptionStoreManager *)self executeSQL:"CREATE UNIQUE INDEX IF NOT EXISTS subscriptionIndex on Subscriptions (k0, k1)"];
          [(UAFSubscriptionStoreManager *)self executeSQL:"CREATE TABLE IF NOT EXISTS SystemAssetSetUsages (k0 TEXT, k1 BLOB)"];
          [(UAFSubscriptionStoreManager *)self executeSQL:"CREATE UNIQUE INDEX IF NOT EXISTS systemAssetSetUsageIndex on SystemAssetSetUsages (k0)"];
          [(UAFSubscriptionStoreManager *)self executeSQL:"CREATE TABLE IF NOT EXISTS DbVersion (k0 INTEGER)"];
          [(UAFSubscriptionStoreManager *)self executeSQL:"CREATE TABLE IF NOT EXISTS SystemConfiguration (k0 TEXT PRIMARY KEY NOT NULL, k1 TEXT NOT NULL)"];
        }
        int v24 = sqlite3_prepare_v2(self->_store, "INSERT OR REPLACE INTO Subscriptions (k0, k1, k2, k3) VALUES (?, ?, ?, ?)", 73, &self->_writeSubscription, 0);
        if (v24)
        {
          int v25 = v24;
          v26 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v88 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            __int16 v110 = 2080;
            v111 = "INSERT OR REPLACE INTO Subscriptions (k0, k1, k2, k3) VALUES (?, ?, ?, ?)";
            __int16 v112 = 1024;
            LODWORD(v113[0]) = v25;
            WORD2(v113[0]) = 2080;
            *(void *)((char *)v113 + 6) = v88;
            _os_log_error_impl(&dword_23797A000, v26, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }
        }
        int v27 = sqlite3_prepare_v2(self->_store, "SELECT k2 FROM Subscriptions WHERE k0 = ?", 41, &self->_readSubscriptionsForSubscriber, 0);
        if (v27)
        {
          int v28 = v27;
          v29 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v89 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            __int16 v110 = 2080;
            v111 = "SELECT k2 FROM Subscriptions WHERE k0 = ?";
            __int16 v112 = 1024;
            LODWORD(v113[0]) = v28;
            WORD2(v113[0]) = 2080;
            *(void *)((char *)v113 + 6) = v89;
            _os_log_error_impl(&dword_23797A000, v29, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }
        }
        int v30 = sqlite3_prepare_v2(self->_store, "SELECT k2 FROM Subscriptions WHERE k0 = ? AND k1 = ?", 52, &self->_readSubscription, 0);
        if (v30)
        {
          int v31 = v30;
          v32 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v90 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            __int16 v110 = 2080;
            v111 = "SELECT k2 FROM Subscriptions WHERE k0 = ? AND k1 = ?";
            __int16 v112 = 1024;
            LODWORD(v113[0]) = v31;
            WORD2(v113[0]) = 2080;
            *(void *)((char *)v113 + 6) = v90;
            _os_log_error_impl(&dword_23797A000, v32, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }
        }
        int v33 = sqlite3_prepare_v2(self->_store, "SELECT k2 FROM Subscriptions", 28, &self->_readAllSubscriptions, 0);
        if (v33)
        {
          int v34 = v33;
          v35 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v91 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            __int16 v110 = 2080;
            v111 = "SELECT k2 FROM Subscriptions";
            __int16 v112 = 1024;
            LODWORD(v113[0]) = v34;
            WORD2(v113[0]) = 2080;
            *(void *)((char *)v113 + 6) = v91;
            _os_log_error_impl(&dword_23797A000, v35, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }
        }
        int v36 = sqlite3_prepare_v2(self->_store, "SELECT k2, k0 FROM Subscriptions", 32, &self->_readAllSubscriptionsAndSubscribers, 0);
        if (v36)
        {
          int v37 = v36;
          v38 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v92 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            __int16 v110 = 2080;
            v111 = "SELECT k2, k0 FROM Subscriptions";
            __int16 v112 = 1024;
            LODWORD(v113[0]) = v37;
            WORD2(v113[0]) = 2080;
            *(void *)((char *)v113 + 6) = v92;
            _os_log_error_impl(&dword_23797A000, v38, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }
        }
        int v39 = sqlite3_prepare_v2(self->_store, "SELECT DISTINCT k0 FROM Subscriptions", 37, &self->_readAllSubscribers, 0);
        if (v39)
        {
          int v40 = v39;
          v41 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            v93 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            __int16 v110 = 2080;
            v111 = "SELECT DISTINCT k0 FROM Subscriptions";
            __int16 v112 = 1024;
            LODWORD(v113[0]) = v40;
            WORD2(v113[0]) = 2080;
            *(void *)((char *)v113 + 6) = v93;
            _os_log_error_impl(&dword_23797A000, v41, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }
        }
        int v42 = sqlite3_prepare_v2(self->_store, "DELETE FROM Subscriptions WHERE k0 = ? AND k1 = ?", 49, &self->_removeSubscription, 0);
        if (v42)
        {
          int v43 = v42;
          v44 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            v94 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            __int16 v110 = 2080;
            v111 = "DELETE FROM Subscriptions WHERE k0 = ? AND k1 = ?";
            __int16 v112 = 1024;
            LODWORD(v113[0]) = v43;
            WORD2(v113[0]) = 2080;
            *(void *)((char *)v113 + 6) = v94;
            _os_log_error_impl(&dword_23797A000, v44, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }
        }
        int v45 = sqlite3_prepare_v2(self->_store, "DELETE FROM Subscriptions", 25, &self->_removeAllSubscriptions, 0);
        if (v45)
        {
          int v46 = v45;
          v47 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            v95 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            __int16 v110 = 2080;
            v111 = "DELETE FROM Subscriptions";
            __int16 v112 = 1024;
            LODWORD(v113[0]) = v46;
            WORD2(v113[0]) = 2080;
            *(void *)((char *)v113 + 6) = v95;
            _os_log_error_impl(&dword_23797A000, v47, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }
        }
        int v48 = sqlite3_prepare_v2(self->_store, "SELECT k0, k2 FROM Subscriptions WHERE k3 <> 0.0 AND datetime(k3, 'unixepoch') < datetime('now')", 96, &self->_fetchExpiredSubscriptions, 0);
        if (v48)
        {
          int v49 = v48;
          v50 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            v96 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            __int16 v110 = 2080;
            v111 = "SELECT k0, k2 FROM Subscriptions WHERE k3 <> 0.0 AND datetime(k3, 'unixepoch') < datetime('now')";
            __int16 v112 = 1024;
            LODWORD(v113[0]) = v49;
            WORD2(v113[0]) = 2080;
            *(void *)((char *)v113 + 6) = v96;
            _os_log_error_impl(&dword_23797A000, v50, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }
        }
        int v51 = sqlite3_prepare_v2(self->_store, "INSERT OR REPLACE INTO SystemAssetSetUsages (k0, k1) VALUES (?, ?)", 66, &self->_setSystemAssetSetUsages, 0);
        if (v51)
        {
          int v52 = v51;
          v53 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            v97 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            __int16 v110 = 2080;
            v111 = "INSERT OR REPLACE INTO SystemAssetSetUsages (k0, k1) VALUES (?, ?)";
            __int16 v112 = 1024;
            LODWORD(v113[0]) = v52;
            WORD2(v113[0]) = 2080;
            *(void *)((char *)v113 + 6) = v97;
            _os_log_error_impl(&dword_23797A000, v53, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }
        }
        int v54 = sqlite3_prepare_v2(self->_store, "SELECT k1 FROM SystemAssetSetUsages WHERE k0 = ?", 48, &self->_fetchSystemAssetSetUsages, 0);
        if (v54)
        {
          int v55 = v54;
          v56 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            v98 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            __int16 v110 = 2080;
            v111 = "SELECT k1 FROM SystemAssetSetUsages WHERE k0 = ?";
            __int16 v112 = 1024;
            LODWORD(v113[0]) = v55;
            WORD2(v113[0]) = 2080;
            *(void *)((char *)v113 + 6) = v98;
            _os_log_error_impl(&dword_23797A000, v56, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }
        }
        int v57 = sqlite3_prepare_v2(self->_store, "SELECT k0, k1 FROM SystemAssetSetUsages", 39, &self->_fetchAllSystemAssetSetUsages, 0);
        if (v57)
        {
          int v58 = v57;
          v59 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            v99 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            __int16 v110 = 2080;
            v111 = "SELECT k0, k1 FROM SystemAssetSetUsages";
            __int16 v112 = 1024;
            LODWORD(v113[0]) = v58;
            WORD2(v113[0]) = 2080;
            *(void *)((char *)v113 + 6) = v99;
            _os_log_error_impl(&dword_23797A000, v59, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }
        }
        int v60 = sqlite3_prepare_v2(self->_store, "DELETE FROM SystemAssetSetUsages WHERE k0 = ?", 45, &self->_clearSystemAssetSetUsages, 0);
        if (v60)
        {
          int v61 = v60;
          v62 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            v100 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            __int16 v110 = 2080;
            v111 = "DELETE FROM SystemAssetSetUsages WHERE k0 = ?";
            __int16 v112 = 1024;
            LODWORD(v113[0]) = v61;
            WORD2(v113[0]) = 2080;
            *(void *)((char *)v113 + 6) = v100;
            _os_log_error_impl(&dword_23797A000, v62, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }
        }
        int v63 = sqlite3_prepare_v2(self->_store, "DELETE FROM SystemAssetSetUsages", 32, &self->_removeAllSystemAssetSetUsages, 0);
        if (v63)
        {
          int v64 = v63;
          v65 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            v101 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            __int16 v110 = 2080;
            v111 = "DELETE FROM SystemAssetSetUsages";
            __int16 v112 = 1024;
            LODWORD(v113[0]) = v64;
            WORD2(v113[0]) = 2080;
            *(void *)((char *)v113 + 6) = v101;
            _os_log_error_impl(&dword_23797A000, v65, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }
        }
        int v66 = sqlite3_prepare_v2(self->_store, "INSERT OR REPLACE INTO DbVersion (k0) VALUES (?)", 48, &self->_setDbVersion, 0);
        if (v66)
        {
          int v67 = v66;
          v68 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            v102 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            __int16 v110 = 2080;
            v111 = "INSERT OR REPLACE INTO DbVersion (k0) VALUES (?)";
            __int16 v112 = 1024;
            LODWORD(v113[0]) = v67;
            WORD2(v113[0]) = 2080;
            *(void *)((char *)v113 + 6) = v102;
            _os_log_error_impl(&dword_23797A000, v68, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }
        }
        int v69 = sqlite3_prepare_v2(self->_store, "SELECT * FROM DbVersion ORDER BY k0 DESC LIMIT 1", 48, &self->_readDbVersion, 0);
        if (v69)
        {
          int v70 = v69;
          v71 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            v103 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            __int16 v110 = 2080;
            v111 = "SELECT * FROM DbVersion ORDER BY k0 DESC LIMIT 1";
            __int16 v112 = 1024;
            LODWORD(v113[0]) = v70;
            WORD2(v113[0]) = 2080;
            *(void *)((char *)v113 + 6) = v103;
            _os_log_error_impl(&dword_23797A000, v71, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }
        }
        int v72 = sqlite3_prepare_v2(self->_store, "SELECT k1 FROM SystemConfiguration WHERE k0 = ?", 47, &self->_readConfigurationKey, 0);
        if (v72)
        {
          int v73 = v72;
          v74 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            v104 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            __int16 v110 = 2080;
            v111 = "SELECT k1 FROM SystemConfiguration WHERE k0 = ?";
            __int16 v112 = 1024;
            LODWORD(v113[0]) = v73;
            WORD2(v113[0]) = 2080;
            *(void *)((char *)v113 + 6) = v104;
            _os_log_error_impl(&dword_23797A000, v74, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }
        }
        int v75 = sqlite3_prepare_v2(self->_store, "INSERT OR REPLACE INTO SystemConfiguration (k0, k1) VALUES (?, ?)", 65, &self->_writeConfigurationKey, 0);
        if (v75)
        {
          int v76 = v75;
          v77 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          {
            v105 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            __int16 v110 = 2080;
            v111 = "INSERT OR REPLACE INTO SystemConfiguration (k0, k1) VALUES (?, ?)";
            __int16 v112 = 1024;
            LODWORD(v113[0]) = v76;
            WORD2(v113[0]) = 2080;
            *(void *)((char *)v113 + 6) = v105;
            _os_log_error_impl(&dword_23797A000, v77, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }
        }
        int v78 = sqlite3_prepare_v2(self->_store, "SELECT k0, k1 FROM SystemConfiguration", 38, &self->_fetchAllConfiguration, 0);
        if (v78)
        {
          int v79 = v78;
          v80 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
          {
            v106 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            __int16 v110 = 2080;
            v111 = "SELECT k0, k1 FROM SystemConfiguration";
            __int16 v112 = 1024;
            LODWORD(v113[0]) = v79;
            WORD2(v113[0]) = 2080;
            *(void *)((char *)v113 + 6) = v106;
            _os_log_error_impl(&dword_23797A000, v80, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }
        }
        v81 = UAFGetLogCategory((void **)&UAFLogContextStorage);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
          __int16 v110 = 2112;
          v111 = (const char *)v16;
          __int16 v112 = 1024;
          LODWORD(v113[0]) = v9;
          _os_log_impl(&dword_23797A000, v81, OS_LOG_TYPE_DEFAULT, "%s Opened database (%@), database existed:%d", buf, 0x1Cu);
        }

        if (v9)
        {
          BOOL v82 = 1;
        }
        else
        {
          int v86 = [(UAFSubscriptionStoreManager *)self _setDbVersion:1];
          BOOL v82 = v86 == 101 || v86 == 0;
        }
        goto LABEL_120;
      }
      uint64_t v21 = 0;
      v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v114 = *MEMORY[0x263F08320];
    }
    v22 = &stru_26EA999B8;
    char v23 = 1;
    goto LABEL_112;
  }
  int v4 = UAFGetLogCategory((void **)&UAFLogContextStorage);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v109 = "-[UAFSubscriptionStoreManager _openDatabase:]";
    _os_log_error_impl(&dword_23797A000, v4, OS_LOG_TYPE_ERROR, "%s nil database filename", buf, 0xCu);
  }
  BOOL v82 = 0;
LABEL_121:

  return v82;
}

- (void)_closeDatabase
{
  if (self->_store)
  {
    sqlite3_finalize(self->_writeSubscription);
    sqlite3_finalize(self->_readSubscriptionsForSubscriber);
    sqlite3_finalize(self->_readSubscription);
    sqlite3_finalize(self->_readAllSubscriptions);
    sqlite3_finalize(self->_readAllSubscriptionsAndSubscribers);
    sqlite3_finalize(self->_readAllSubscribers);
    sqlite3_finalize(self->_removeSubscription);
    sqlite3_finalize(self->_removeAllSubscriptions);
    sqlite3_finalize(self->_fetchExpiredSubscriptions);
    sqlite3_finalize(self->_setSystemAssetSetUsages);
    sqlite3_finalize(self->_fetchSystemAssetSetUsages);
    sqlite3_finalize(self->_fetchAllSystemAssetSetUsages);
    sqlite3_finalize(self->_clearSystemAssetSetUsages);
    sqlite3_finalize(self->_removeAllSystemAssetSetUsages);
    sqlite3_finalize(self->_setDbVersion);
    sqlite3_finalize(self->_readDbVersion);
    sqlite3_finalize(self->_readConfigurationKey);
    sqlite3_finalize(self->_writeConfigurationKey);
    sqlite3_finalize(self->_fetchAllConfiguration);
    sqlite3_close_v2(self->_store);
    self->_store = 0;
  }
}

- (BOOL)_checkDbVersion
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (![(UAFSubscriptionStoreManager *)self _createDbVersionTable])
  {
    uint64_t v6 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    int v11 = 136315138;
    id v12 = "-[UAFSubscriptionStoreManager _checkDbVersion]";
    v7 = "%s Creation or checking of DbVersion table failed";
    goto LABEL_12;
  }
  int v3 = sqlite3_step(self->_readDbVersion);
  if ((v3 & 0xFFFFFFFE) != 0x64)
  {
    if (!v3) {
      goto LABEL_16;
    }
    uint64_t v6 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    int v11 = 136315138;
    id v12 = "-[UAFSubscriptionStoreManager _checkDbVersion]";
    v7 = "%s Reading db version from DbVersion table failed";
LABEL_12:
    int v8 = v6;
    uint32_t v9 = 12;
    goto LABEL_13;
  }
  int v4 = sqlite3_column_int(self->_readDbVersion, 0);
  if (v4 == 1) {
    return v4;
  }
  int v5 = v4;
  if (v4 >= 2)
  {
    uint64_t v6 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315650;
      id v12 = "-[UAFSubscriptionStoreManager _checkDbVersion]";
      __int16 v13 = 1024;
      int v14 = 1;
      __int16 v15 = 1024;
      int v16 = v5;
      v7 = "%s Db upgrade requested a version %d lesser than the current stored version %d";
      int v8 = v6;
      uint32_t v9 = 24;
LABEL_13:
      _os_log_error_impl(&dword_23797A000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v11, v9);
    }
LABEL_14:

    LOBYTE(v4) = 0;
    return v4;
  }
LABEL_16:
  LOBYTE(v4) = 0;
  self->_dbUpToDate = 0;
  return v4;
}

- (BOOL)_createDbVersionTable
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS DbVersion (k0 INTEGER)"];
  ppStmt = 0;
  int v4 = sqlite3_prepare_v2(self->_store, (const char *)[v3 UTF8String], -1, &ppStmt, 0);
  if (v4)
  {
    int v5 = v4;
    uint64_t v6 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    int v14 = sqlite3_errmsg(self->_store);
    int v15 = sqlite3_extended_errcode(self->_store);
    *(_DWORD *)buf = 136315906;
    int v18 = "-[UAFSubscriptionStoreManager _createDbVersionTable]";
    __int16 v19 = 1024;
    int v20 = v5;
    __int16 v21 = 2080;
    v22 = v14;
    __int16 v23 = 1024;
    int v24 = v15;
    __int16 v13 = "%s Query preparation to create DbVersion table failed SQLite error: %d (%s, Extended: %d)";
LABEL_16:
    _os_log_error_impl(&dword_23797A000, v6, OS_LOG_TYPE_ERROR, v13, buf, 0x22u);
    goto LABEL_3;
  }
  int v10 = sqlite3_step(ppStmt);
  int v5 = v10;
  if (!v10 || v10 == 101) {
    goto LABEL_4;
  }
  uint64_t v6 = UAFGetLogCategory((void **)&UAFLogContextStorage);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v11 = sqlite3_errmsg(self->_store);
    int v12 = sqlite3_extended_errcode(self->_store);
    *(_DWORD *)buf = 136315906;
    int v18 = "-[UAFSubscriptionStoreManager _createDbVersionTable]";
    __int16 v19 = 1024;
    int v20 = v5;
    __int16 v21 = 2080;
    v22 = v11;
    __int16 v23 = 1024;
    int v24 = v12;
    __int16 v13 = "%s Creating DbVersion table failed SQLite error: %d (%s, Extended: %d)";
    goto LABEL_16;
  }
LABEL_3:

LABEL_4:
  sqlite3_reset(ppStmt);
  sqlite3_finalize(ppStmt);
  if (v5) {
    BOOL v7 = v5 == 101;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v8 = v7;

  return v8;
}

uint64_t __54__UAFSubscriptionStoreManager_getSubscriptions_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _getSubscriptions:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 0;
}

- (id)_getSubscriptions:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    p_readAllSubscriptions = &self->_readAllSubscriptions;
    goto LABEL_7;
  }
  p_readAllSubscriptions = &self->_readSubscriptionsForSubscriber;
  int v6 = [(UAFSubscriptionStoreManager *)self bindString:self->_readSubscriptionsForSubscriber col:1 string:v4];
  if (!v6)
  {
LABEL_7:
    uint32_t v9 = [(UAFSubscriptionStoreManager *)self _getSubscriptions:*p_readAllSubscriptions subscriptionsFor:v4];
    goto LABEL_8;
  }
  int v7 = v6;
  BOOL v8 = UAFGetLogCategory((void **)&UAFLogContextStorage);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v11 = sqlite3_errmsg(self->_store);
    int v12 = sqlite3_extended_errcode(self->_store);
    int v13 = 136316162;
    int v14 = "-[UAFSubscriptionStoreManager _getSubscriptions:]";
    __int16 v15 = 2114;
    id v16 = v4;
    __int16 v17 = 1024;
    int v18 = v7;
    __int16 v19 = 2080;
    int v20 = v11;
    __int16 v21 = 1024;
    int v22 = v12;
    _os_log_error_impl(&dword_23797A000, v8, OS_LOG_TYPE_ERROR, "%s Binding subscription name to the get subscriptions query failed for Subscriber: '%{public}@' SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v13, 0x2Cu);
  }

  uint32_t v9 = 0;
LABEL_8:

  return v9;
}

uint64_t __58__UAFSubscriptionStoreManager_getSubscription_subscriber___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _getSubscription:*(void *)(a1 + 40) subscription:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 0;
}

- (id)_getSubscription:(id)a3 subscription:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  readSubscription = self->_readSubscription;
  int v9 = [(UAFSubscriptionStoreManager *)self bindString:readSubscription col:1 string:v6];
  if (v9)
  {
    int v10 = v9;
    int v11 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    goto LABEL_6;
  }
  int v12 = [(UAFSubscriptionStoreManager *)self bindString:readSubscription col:2 string:v7];
  if (v12)
  {
    int v10 = v12;
    int v11 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_18:
      int v22 = sqlite3_errmsg(self->_store);
      int v23 = sqlite3_extended_errcode(self->_store);
      int v24 = 136316418;
      uint64_t v25 = "-[UAFSubscriptionStoreManager _getSubscription:subscription:]";
      __int16 v26 = 2114;
      id v27 = v6;
      __int16 v28 = 2114;
      id v29 = v7;
      __int16 v30 = 1024;
      int v31 = v10;
      __int16 v32 = 2080;
      int v33 = v22;
      __int16 v34 = 1024;
      int v35 = v23;
      __int16 v21 = "%s Error binding read subscription for '%{public}@' '%{public}@' SQLite error: %d (%s, Extended: %d)";
LABEL_19:
      _os_log_error_impl(&dword_23797A000, v11, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v24, 0x36u);
    }
LABEL_6:

    int v13 = 0;
    goto LABEL_7;
  }
  int v15 = sqlite3_step(readSubscription);
  if ((v15 - 100) >= 2 && v15 != 0)
  {
    int v17 = v15;
    int v11 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    __int16 v19 = sqlite3_errmsg(self->_store);
    int v20 = sqlite3_extended_errcode(self->_store);
    int v24 = 136316418;
    uint64_t v25 = "-[UAFSubscriptionStoreManager _getSubscription:subscription:]";
    __int16 v26 = 2114;
    id v27 = v6;
    __int16 v28 = 2114;
    id v29 = v7;
    __int16 v30 = 1024;
    int v31 = v17;
    __int16 v32 = 2080;
    int v33 = v19;
    __int16 v34 = 1024;
    int v35 = v20;
    __int16 v21 = "%s Error executing read subscription for '%{public}@' '%{public}@' SQLite error: %d (%s, Extended: %d)";
    goto LABEL_19;
  }
  int v13 = [(UAFSubscriptionStoreManager *)self _getSubscription:readSubscription];
LABEL_7:
  sqlite3_reset(readSubscription);
  sqlite3_clear_bindings(readSubscription);

  return v13;
}

- (int)bindString:(sqlite3_stmt *)a3 col:(int)a4 string:(id)a5
{
  id v7 = (const char *)[a5 UTF8String];

  return sqlite3_bind_text(a3, a4, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (id)_getSubscriptions:(sqlite3_stmt *)a3 subscriptionsFor:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (sqlite3_step(a3) == 100)
  {
    *(void *)&long long v8 = 136315650;
    long long v13 = v8;
    do
    {
      int v9 = -[UAFSubscriptionStoreManager _getSubscription:](self, "_getSubscription:", a3, v13);
      if (v9)
      {
        [v7 addObject:v9];
      }
      else
      {
        int v10 = UAFGetLogCategory((void **)&UAFLogContextStorage);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          int v11 = sqlite3_errmsg(self->_store);
          *(_DWORD *)buf = v13;
          int v15 = "-[UAFSubscriptionStoreManager _getSubscriptions:subscriptionsFor:]";
          __int16 v16 = 2114;
          id v17 = v6;
          __int16 v18 = 2080;
          __int16 v19 = v11;
          _os_log_error_impl(&dword_23797A000, v10, OS_LOG_TYPE_ERROR, "%s Failed to read subscription for %{public}@: %s", buf, 0x20u);
        }
      }
    }
    while (sqlite3_step(a3) == 100);
  }
  sqlite3_reset(a3);
  sqlite3_clear_bindings(a3);

  return v7;
}

- (id)_getSubscription:(sqlite3_stmt *)a3
{
  id v4 = [(UAFSubscriptionStoreManager *)self readData:a3 col:0];
  if (v4)
  {
    int v5 = [(UAFSubscriptionStoreManager *)self _uafAssetSetSubscriptionFromData:v4];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)readData:(sqlite3_stmt *)a3 col:(int)a4
{
  int v6 = sqlite3_column_bytes(a3, a4);
  id v7 = sqlite3_column_blob(a3, a4);
  if (v6 < 1)
  {
    long long v8 = 0;
  }
  else
  {
    long long v8 = [MEMORY[0x263EFF8F8] dataWithBytes:v7 length:v6];
  }

  return v8;
}

- (id)_uafAssetSetSubscriptionFromData:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v3 = (void *)MEMORY[0x263F08928];
    id v4 = a3;
    id v9 = 0;
    int v5 = [v3 unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v9];

    id v6 = v9;
    if (v6)
    {
      id v7 = UAFGetLogCategory((void **)&UAFLogContextStorage);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v11 = "-[UAFSubscriptionStoreManager _uafAssetSetSubscriptionFromData:]";
        __int16 v12 = 2112;
        id v13 = v6;
        _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s Failed to unarchive subscription asset set usages: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

+ (id)defaultManager
{
  if (qword_26AF0BA60 != -1) {
    dispatch_once(&qword_26AF0BA60, &__block_literal_global_284);
  }
  uint64_t v2 = (void *)qword_26AF0BA68;

  return v2;
}

- (id)getSubscription:(id)a3 subscriber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  __int16 v19 = __Block_byref_object_copy__4;
  uint64_t v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__UAFSubscriptionStoreManager_getSubscription_subscriber___block_invoke;
  v12[3] = &unk_264CEB9B0;
  int v15 = &v16;
  v12[4] = self;
  id v8 = v7;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  [(UAFSubscriptionStoreManager *)self doDatabaseOperation:v12 useTransaction:0 logDescription:@"get subscription" error:0];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)getSubscriptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__4;
  id v17 = __Block_byref_object_dispose__4;
  id v18 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__UAFSubscriptionStoreManager_getSubscriptions_error___block_invoke;
  v10[3] = &unk_264CEBA50;
  __int16 v12 = &v13;
  v10[4] = self;
  id v7 = v6;
  id v11 = v7;
  [(UAFSubscriptionStoreManager *)self doDatabaseOperation:v10 useTransaction:0 logDescription:@"get subscriptions" error:a4];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

- (int)doDatabaseOperation:(id)a3 useTransaction:(BOOL)a4 logDescription:(id)a5 error:(id *)a6
{
  v37[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  uint64_t v32 = 0;
  int v33 = &v32;
  uint64_t v34 = 0x2020000000;
  int v35 = 0;
  __int16 v12 = +[UAFSubscriptionStoreManager getSerialQueue];
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  uint64_t v25 = __87__UAFSubscriptionStoreManager_doDatabaseOperation_useTransaction_logDescription_error___block_invoke;
  __int16 v26 = &unk_264CEBA00;
  id v27 = self;
  __int16 v30 = &v32;
  id v13 = v11;
  id v28 = v13;
  BOOL v31 = a4;
  id v14 = v10;
  id v29 = v14;
  dispatch_sync(v12, &v23);

  uint64_t v15 = v33;
  if (a6)
  {
    int v16 = *((_DWORD *)v33 + 6);
    if (v16 && v16 != 101)
    {
      uint64_t v17 = v16;
      id v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v36 = *MEMORY[0x263F08338];
      __int16 v19 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_errstr(v16), v23, v24, v25, v26, v27, v28);
      v37[0] = v19;
      uint64_t v20 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
      *a6 = [v18 errorWithDomain:@"com.apple.UnifiedAssetFramework.Storage" code:v17 userInfo:v20];

      uint64_t v15 = v33;
    }
    else
    {
      *a6 = 0;
    }
  }
  int v21 = *((_DWORD *)v15 + 6);

  _Block_object_dispose(&v32, 8);
  return v21;
}

+ (id)getSerialQueue
{
  if (_MergedGlobals_10 != -1) {
    dispatch_once(&_MergedGlobals_10, &__block_literal_global_280);
  }
  uint64_t v2 = (void *)qword_26AF0BA58;

  return v2;
}

void __45__UAFSubscriptionStoreManager_getSerialQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("UAFSubscriptionStoreManager.Serial", 0);
  v1 = (void *)qword_26AF0BA58;
  qword_26AF0BA58 = (uint64_t)v0;
}

void __45__UAFSubscriptionStoreManager_defaultManager__block_invoke()
{
  uint64_t v0 = +[UAFSubscriptionStoreManager _getManagerReadOnly:1];
  v1 = (void *)qword_26AF0BA68;
  qword_26AF0BA68 = v0;
}

+ (id)_getManagerReadOnly:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[UAFCommonUtilities getDefaultStoragePath];
  if (v4) {
    int v5 = [[UAFSubscriptionStoreManager alloc] initWithDbDirPath:v4 dbName:@"/UAFAssetSubscriptions.db" readOnly:v3 allowCreate:v3 ^ 1];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (UAFSubscriptionStoreManager)initWithDbDirPath:(id)a3 dbName:(id)a4 readOnly:(BOOL)a5 allowCreate:(BOOL)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = (__CFString *)a4;
  v22.receiver = self;
  v22.super_class = (Class)UAFSubscriptionStoreManager;
  __int16 v12 = [(UAFSubscriptionStoreManager *)&v22 init];
  id v13 = v12;
  if (!v12) {
    goto LABEL_7;
  }
  v12->_store = 0;
  v12->_updateCount = 0;
  if (v11) {
    id v14 = v11;
  }
  else {
    id v14 = @"/UAFAssetSubscriptions.db";
  }
  uint64_t v15 = [v10 stringByAppendingString:v14];
  databaseName = v13->_databaseName;
  v13->_databaseName = (NSString *)v15;

  uint64_t v17 = [v10 stringByAppendingString:@"UAFOldVersionDbName.db"];
  oldDatabaseName = v13->_oldDatabaseName;
  v13->_oldDatabaseName = (NSString *)v17;

  if (v13->_databaseName)
  {
    v13->_dbUpToDate = 0;
    v13->_BOOL readOnly = a5;
    v13->_allowCreate = a6;
LABEL_7:
    __int16 v19 = v13;
    goto LABEL_11;
  }
  uint64_t v20 = UAFGetLogCategory((void **)&UAFLogContextStorage);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v24 = "-[UAFSubscriptionStoreManager initWithDbDirPath:dbName:readOnly:allowCreate:]";
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v14;
    _os_log_error_impl(&dword_23797A000, v20, OS_LOG_TYPE_ERROR, "%s Could not construct database path from %@ and %@", buf, 0x20u);
  }

  __int16 v19 = 0;
LABEL_11:

  return v19;
}

+ (id)writeManager
{
  if (qword_26AF0BA70 != -1) {
    dispatch_once(&qword_26AF0BA70, &__block_literal_global_286_0);
  }
  uint64_t v2 = (void *)qword_26AF0BA78;

  return v2;
}

uint64_t __43__UAFSubscriptionStoreManager_writeManager__block_invoke()
{
  uint64_t v0 = +[UAFSubscriptionStoreManager _getManagerReadOnly:0];
  v1 = (void *)qword_26AF0BA78;
  qword_26AF0BA78 = v0;

  uint64_t v2 = (void *)MEMORY[0x263F61E30];

  return [v2 runBlockWhenDeviceIsClassCUnlocked:&__block_literal_global_289];
}

uint64_t __43__UAFSubscriptionStoreManager_writeManager__block_invoke_2()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v0 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    BOOL v3 = "+[UAFSubscriptionStoreManager writeManager]_block_invoke_2";
    _os_log_impl(&dword_23797A000, v0, OS_LOG_TYPE_DEFAULT, "%s Device has been unlocked, performing database upgrade check", (uint8_t *)&v2, 0xCu);
  }

  return [(id)qword_26AF0BA78 performDbUpgradeToVersion:1];
}

- (UAFSubscriptionStoreManager)initWithDbDirPath:(id)a3 dbName:(id)a4
{
  return [(UAFSubscriptionStoreManager *)self initWithDbDirPath:a3 dbName:a4 readOnly:1 allowCreate:0];
}

- (void)dealloc
{
  BOOL v3 = +[UAFSubscriptionStoreManager getSerialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__UAFSubscriptionStoreManager_dealloc__block_invoke;
  block[3] = &unk_264CEAB50;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)UAFSubscriptionStoreManager;
  [(UAFSubscriptionStoreManager *)&v4 dealloc];
}

uint64_t __38__UAFSubscriptionStoreManager_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeDatabase];
}

- (int)_beginDatabaseTransaction
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v3 = [(UAFSubscriptionStoreManager *)self executeSQL:"BEGIN TRANSACTION;"];
  if (v3)
  {
    objc_super v4 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = sqlite3_errmsg(self->_store);
      int v7 = sqlite3_extended_errcode(self->_store);
      int v8 = 136315906;
      id v9 = "-[UAFSubscriptionStoreManager _beginDatabaseTransaction]";
      __int16 v10 = 1024;
      int v11 = v3;
      __int16 v12 = 2080;
      id v13 = v6;
      __int16 v14 = 1024;
      int v15 = v7;
      _os_log_error_impl(&dword_23797A000, v4, OS_LOG_TYPE_ERROR, "%s Failed to begin transaction with error SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v8, 0x22u);
    }
  }
  return v3;
}

- (int)_endDatabaseTransaction
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v3 = [(UAFSubscriptionStoreManager *)self executeSQL:"COMMIT;"];
  if (v3)
  {
    objc_super v4 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = sqlite3_errmsg(self->_store);
      int v7 = sqlite3_extended_errcode(self->_store);
      int v8 = 136315906;
      id v9 = "-[UAFSubscriptionStoreManager _endDatabaseTransaction]";
      __int16 v10 = 1024;
      int v11 = v3;
      __int16 v12 = 2080;
      id v13 = v6;
      __int16 v14 = 1024;
      int v15 = v7;
      _os_log_error_impl(&dword_23797A000, v4, OS_LOG_TYPE_ERROR, "%s Failed to commit transaction with error SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v8, 0x22u);
    }
  }
  return v3;
}

- (int)_rollbackDatabaseTransaction
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v3 = [(UAFSubscriptionStoreManager *)self executeSQL:"ROLLBACK;"];
  if (v3)
  {
    objc_super v4 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = sqlite3_errmsg(self->_store);
      int v7 = sqlite3_extended_errcode(self->_store);
      int v8 = 136315906;
      id v9 = "-[UAFSubscriptionStoreManager _rollbackDatabaseTransaction]";
      __int16 v10 = 1024;
      int v11 = v3;
      __int16 v12 = 2080;
      id v13 = v6;
      __int16 v14 = 1024;
      int v15 = v7;
      _os_log_error_impl(&dword_23797A000, v4, OS_LOG_TYPE_ERROR, "%s Failed to rollback transaction with error SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v8, 0x22u);
    }
  }
  return v3;
}

- (BOOL)_isUsageLimitExceeded:(id)a3
{
  id v4 = a3;
  int v5 = +[UAFConfigurationManager defaultManager];
  id v6 = [(UAFSubscriptionStoreManager *)self _getSubscriptions:0];
  int v7 = [v6 arrayByAddingObjectsFromArray:v4];

  int v8 = [v5 applySubscriptions:v7];
  LOBYTE(v4) = [v5 isUsageLimitExceeded:v8];

  return (char)v4;
}

- (BOOL)subscribe:(id)a3 subscriptions:(id)a4 expires:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __63__UAFSubscriptionStoreManager_subscribe_subscriptions_expires___block_invoke;
  v20[3] = &unk_264CEB960;
  v20[4] = self;
  id v21 = v9;
  id v22 = v8;
  id v23 = v10;
  int v11 = NSString;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  int v15 = [v11 stringWithFormat:@"subscribe for Subscriber: %@", v13];
  int v16 = [(UAFSubscriptionStoreManager *)self doDatabaseOperation:v20 useTransaction:1 logDescription:v15 error:0];

  if (v16) {
    BOOL v17 = v16 == 101;
  }
  else {
    BOOL v17 = 1;
  }
  BOOL v18 = v17;

  return v18;
}

uint64_t __63__UAFSubscriptionStoreManager_subscribe_subscriptions_expires___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) _isUsageLimitExceeded:*(void *)(a1 + 40)])
  {
    int v2 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136315394;
      id v21 = "-[UAFSubscriptionStoreManager subscribe:subscriptions:expires:]_block_invoke";
      __int16 v22 = 2112;
      uint64_t v23 = v3;
      _os_log_impl(&dword_23797A000, v2, OS_LOG_TYPE_DEFAULT, "%s Denying subscription due to exceeding usage limits for subscriber \"%@\"", buf, 0x16u);
    }

    return 3;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          int v11 = *(void **)(a1 + 32);
          uint64_t v12 = *(void *)(a1 + 48);
          id v13 = objc_msgSend(v10, "name", (void)v15);
          LODWORD(v10) = [v11 _subscribeSubscription:v12 subscriptionName:v13 assetSetSubscription:v10 expires:*(void *)(a1 + 56)];

          if (!v10)
          {
            int v14 = 0;
            goto LABEL_15;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    int v14 = 1;
LABEL_15:

    LODWORD(result) = [*(id *)(a1 + 32) _updateSystemAssetSetUsages:0 assetSetUsages:0 configurationManager:0];
    if (v14) {
      return result;
    }
    else {
      return 3;
    }
  }
}

- (BOOL)_subscribeSubscription:(id)a3 subscriptionName:(id)a4 assetSetSubscription:(id)a5 expires:(id)a6
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = [(UAFSubscriptionStoreManager *)self bindString:self->_writeSubscription col:1 string:v10];
  if (v14)
  {
    int v15 = v14;
    long long v16 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      long long v17 = sqlite3_errmsg(self->_store);
      int v18 = sqlite3_extended_errcode(self->_store);
      int v42 = 136316418;
      int v43 = "-[UAFSubscriptionStoreManager _subscribeSubscription:subscriptionName:assetSetSubscription:expires:]";
      __int16 v44 = 2114;
      id v45 = v10;
      __int16 v46 = 2112;
      id v47 = v11;
      __int16 v48 = 1024;
      int v49 = v15;
      __int16 v50 = 2080;
      int v51 = v17;
      __int16 v52 = 1024;
      int v53 = v18;
      __int16 v19 = "%s Binding subscriber name to the write subscription sql query failed for Subscriber: %{public}@, Subscripti"
            "onName: '%@' SQLite error: %d (%s, Extended: %d)";
LABEL_7:
      _os_log_error_impl(&dword_23797A000, v16, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v42, 0x36u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  int v20 = [(UAFSubscriptionStoreManager *)self bindString:self->_writeSubscription col:2 string:v11];
  if (v20)
  {
    int v15 = v20;
    long long v16 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v21 = sqlite3_errmsg(self->_store);
      int v22 = sqlite3_extended_errcode(self->_store);
      int v42 = 136316418;
      int v43 = "-[UAFSubscriptionStoreManager _subscribeSubscription:subscriptionName:assetSetSubscription:expires:]";
      __int16 v44 = 2114;
      id v45 = v10;
      __int16 v46 = 2112;
      id v47 = v11;
      __int16 v48 = 1024;
      int v49 = v15;
      __int16 v50 = 2080;
      int v51 = v21;
      __int16 v52 = 1024;
      int v53 = v22;
      __int16 v19 = "%s Binding subscription name to the write subscription sql query failed for Subscriber: %{public}@, Subscrip"
            "tionName: '%@' SQLite error: %d (%s, Extended: %d)";
      goto LABEL_7;
    }
LABEL_17:

    goto LABEL_18;
  }
  long long v16 = [(UAFSubscriptionStoreManager *)self _dataFromUAFAssetSubscription:v12];
  if (v16)
  {
    int v23 = [(UAFSubscriptionStoreManager *)self bindData:self->_writeSubscription col:3 data:v16];
    if (v23)
    {
      int v15 = v23;
      uint64_t v24 = UAFGetLogCategory((void **)&UAFLogContextStorage);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        __int16 v25 = sqlite3_errmsg(self->_store);
        int v26 = sqlite3_extended_errcode(self->_store);
        int v42 = 136316418;
        int v43 = "-[UAFSubscriptionStoreManager _subscribeSubscription:subscriptionName:assetSetSubscription:expires:]";
        __int16 v44 = 2114;
        id v45 = v10;
        __int16 v46 = 2112;
        id v47 = v11;
        __int16 v48 = 1024;
        int v49 = v15;
        __int16 v50 = 2080;
        int v51 = v25;
        __int16 v52 = 1024;
        int v53 = v26;
        __int16 v27 = "%s Binding asset set subscription data to the write subscription sql query failed for Subscriber: '%{publi"
              "c}@', SubscriptionName: '%@' SQLite error: %d (%s, Extended: %d)";
LABEL_32:
        _os_log_error_impl(&dword_23797A000, v24, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v42, 0x36u);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }

  long long v16 = v13;
  if (!v16)
  {
    long long v16 = [v12 expiration];
  }
  int v28 = [(UAFSubscriptionStoreManager *)self bindDate:self->_writeSubscription col:4 date:v16];
  if (v28)
  {
    int v15 = v28;
    uint64_t v24 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v38 = sqlite3_errmsg(self->_store);
      int v39 = sqlite3_extended_errcode(self->_store);
      int v42 = 136316418;
      int v43 = "-[UAFSubscriptionStoreManager _subscribeSubscription:subscriptionName:assetSetSubscription:expires:]";
      __int16 v44 = 2114;
      id v45 = v10;
      __int16 v46 = 2112;
      id v47 = v11;
      __int16 v48 = 1024;
      int v49 = v15;
      __int16 v50 = 2080;
      int v51 = v38;
      __int16 v52 = 1024;
      int v53 = v39;
      __int16 v27 = "%s Binding expiry field to the write subscription sql query failed for Subscriber: '%{public}@', Subscriptio"
            "nName: '%@' SQLite error: %d (%s, Extended: %d)";
      goto LABEL_32;
    }
LABEL_16:

    goto LABEL_17;
  }

  int v32 = sqlite3_step(self->_writeSubscription);
  int v15 = v32;
  if (v32 && v32 != 101)
  {
    int v33 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      int v40 = sqlite3_errmsg(self->_store);
      int v41 = sqlite3_extended_errcode(self->_store);
      int v42 = 136316418;
      int v43 = "-[UAFSubscriptionStoreManager _subscribeSubscription:subscriptionName:assetSetSubscription:expires:]";
      __int16 v44 = 2114;
      id v45 = v10;
      __int16 v46 = 2112;
      id v47 = v11;
      __int16 v48 = 1024;
      int v49 = v15;
      __int16 v50 = 2080;
      int v51 = v40;
      __int16 v52 = 1024;
      int v53 = v41;
      _os_log_error_impl(&dword_23797A000, v33, OS_LOG_TYPE_ERROR, "%s Executing write subscription failed for Subscriber: '%{public}@', SubscriptionName: '%@' SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v42, 0x36u);
    }

    uint64_t v34 = UAFLogContextStorage;
    int v35 = kUAFABCDatabaseFailure;
    uint64_t v36 = [NSNumber numberWithInt:sqlite3_extended_errcode(self->_store)];
    int v37 = [v36 stringValue];
    UAFFaultCapture(v34, (uint64_t)v35, @"subscription", (uint64_t)v37);
  }
  else
  {
    ++self->_updateCount;
  }
LABEL_18:
  sqlite3_reset(self->_writeSubscription);
  sqlite3_clear_bindings(self->_writeSubscription);
  if (v15) {
    BOOL v29 = v15 == 101;
  }
  else {
    BOOL v29 = 1;
  }
  BOOL v30 = v29;

  return v30;
}

- (id)getAllSubscriptions:(id *)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__4;
  id v12 = __Block_byref_object_dispose__4;
  id v13 = [MEMORY[0x263EFF9A0] dictionary];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__UAFSubscriptionStoreManager_getAllSubscriptions___block_invoke;
  v7[3] = &unk_264CEB988;
  v7[4] = self;
  v7[5] = &v8;
  [(UAFSubscriptionStoreManager *)self doDatabaseOperation:v7 useTransaction:0 logDescription:@"get all subscriptions" error:a3];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __51__UAFSubscriptionStoreManager_getAllSubscriptions___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v2 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 48);
  if (sqlite3_step(v2) == 100)
  {
    while (1)
    {
      uint64_t v3 = [*(id *)(a1 + 32) _getSubscription:v2];
      if (!v3) {
        break;
      }
      id v4 = v3;
      uint64_t v5 = [*(id *)(a1 + 32) readString:v2 col:1];
      if (!v5)
      {
        id v12 = UAFGetLogCategory((void **)&UAFLogContextStorage);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v14 = sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
          int v15 = 136315394;
          long long v16 = "-[UAFSubscriptionStoreManager getAllSubscriptions:]_block_invoke";
          __int16 v17 = 2080;
          int v18 = v14;
          _os_log_error_impl(&dword_23797A000, v12, OS_LOG_TYPE_ERROR, "%s Failed to read subscriber, SQL error: %s", (uint8_t *)&v15, 0x16u);
        }

        goto LABEL_13;
      }
      uint64_t v6 = (void *)v5;
      uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v5];

      if (!v7)
      {
        uint64_t v8 = [MEMORY[0x263EFF980] array];
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v8 forKeyedSubscript:v6];
      }
      id v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v6];
      [v9 addObject:v4];

      if (sqlite3_step(v2) != 100) {
        goto LABEL_7;
      }
    }
    id v4 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v11 = sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      int v15 = 136315394;
      long long v16 = "-[UAFSubscriptionStoreManager getAllSubscriptions:]_block_invoke";
      __int16 v17 = 2080;
      int v18 = v11;
      _os_log_error_impl(&dword_23797A000, v4, OS_LOG_TYPE_ERROR, "%s Failed to read subscription: %s", (uint8_t *)&v15, 0x16u);
    }
LABEL_13:

    uint64_t v10 = 3;
  }
  else
  {
LABEL_7:
    uint64_t v10 = 0;
  }
  sqlite3_reset(v2);
  sqlite3_clear_bindings(v2);
  return v10;
}

- (id)getSubscribers
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__4;
  uint64_t v10 = __Block_byref_object_dispose__4;
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__UAFSubscriptionStoreManager_getSubscribers__block_invoke;
  v5[3] = &unk_264CEB988;
  v5[4] = self;
  v5[5] = &v6;
  [(UAFSubscriptionStoreManager *)self doDatabaseOperation:v5 useTransaction:0 logDescription:@"get subscribers" error:0];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __45__UAFSubscriptionStoreManager_getSubscribers__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v2 = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 56));
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = (sqlite3_stmt *)v4[7];
  if (v2 == 100)
  {
    *(void *)&long long v3 = 136315394;
    long long v11 = v3;
    do
    {
      uint64_t v6 = objc_msgSend(v4, "readString:col:", v5, 0, v11);
      if (v6)
      {
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
      }
      else
      {
        uint64_t v7 = UAFGetLogCategory((void **)&UAFLogContextStorage);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          id v9 = sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
          *(_DWORD *)buf = v11;
          id v13 = "-[UAFSubscriptionStoreManager getSubscribers]_block_invoke";
          __int16 v14 = 2080;
          int v15 = v9;
          _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s Failed to read subscriber, SQL error: %s", buf, 0x16u);
        }
      }
      int v8 = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 56));
      id v4 = *(void **)(a1 + 32);
      uint64_t v5 = (sqlite3_stmt *)v4[7];
    }
    while (v8 == 100);
  }
  sqlite3_reset(v5);
  return 0;
}

- (BOOL)unsubscribe:(id)a3 subscriptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  int v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __57__UAFSubscriptionStoreManager_unsubscribe_subscriptions___block_invoke;
  v16[3] = &unk_264CEB9B0;
  id v8 = v7;
  int v20 = &v21;
  id v17 = v8;
  int v18 = self;
  id v9 = v6;
  id v19 = v9;
  uint64_t v10 = [NSString stringWithFormat:@"unsubscribe for Subscriber: %@", v9];
  int v11 = [(UAFSubscriptionStoreManager *)self doDatabaseOperation:v16 useTransaction:1 logDescription:v10 error:0];

  if (v11) {
    BOOL v12 = v11 == 101;
  }
  else {
    BOOL v12 = 1;
  }
  char v13 = v12;
  if (*((unsigned char *)v22 + 24)) {
    BOOL v14 = v13;
  }
  else {
    BOOL v14 = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v14;
}

uint64_t __57__UAFSubscriptionStoreManager_unsubscribe_subscriptions___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(v2);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "_unsubscribeSubscription:subscription:", *(void *)(a1 + 48), *(void *)(*((void *)&v10 + 1) + 8 * v6), (void)v10);
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  uint64_t result = [*(id *)(a1 + 40) _updateSystemAssetSetUsages:0 assetSetUsages:0 configurationManager:0];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v8 + 24)) {
    BOOL v9 = result == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9) {
    *(unsigned char *)(v8 + 24) = 0;
  }
  return result;
}

- (BOOL)_unsubscribeSubscription:(id)a3 subscription:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(UAFSubscriptionStoreManager *)self bindString:self->_removeSubscription col:1 string:v6];
  if (v8)
  {
    int v9 = v8;
    long long v10 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      long long v11 = sqlite3_errmsg(self->_store);
      int v12 = sqlite3_extended_errcode(self->_store);
      int v28 = 136316418;
      BOOL v29 = "-[UAFSubscriptionStoreManager _unsubscribeSubscription:subscription:]";
      __int16 v30 = 2112;
      id v31 = v6;
      __int16 v32 = 2112;
      id v33 = v7;
      __int16 v34 = 1024;
      int v35 = v9;
      __int16 v36 = 2080;
      int v37 = v11;
      __int16 v38 = 1024;
      int v39 = v12;
      long long v13 = "%s Binding of subscriber name failed in remove subscription query for Subscriber: '%@', Subscription: '%@' S"
            "QLite error: %d (%s, Extended: %d)";
LABEL_21:
      _os_log_error_impl(&dword_23797A000, v10, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v28, 0x36u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  int v14 = [(UAFSubscriptionStoreManager *)self bindString:self->_removeSubscription col:2 string:v7];
  if (v14)
  {
    int v9 = v14;
    long long v10 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      char v24 = sqlite3_errmsg(self->_store);
      int v25 = sqlite3_extended_errcode(self->_store);
      int v28 = 136316418;
      BOOL v29 = "-[UAFSubscriptionStoreManager _unsubscribeSubscription:subscription:]";
      __int16 v30 = 2112;
      id v31 = v6;
      __int16 v32 = 2112;
      id v33 = v7;
      __int16 v34 = 1024;
      int v35 = v9;
      __int16 v36 = 2080;
      int v37 = v24;
      __int16 v38 = 1024;
      int v39 = v25;
      long long v13 = "%s Binding of subscription name failed in remove subscription query for Subscriber: '%@', Subscription: '%@'"
            " SQLite error: %d (%s, Extended: %d)";
      goto LABEL_21;
    }
LABEL_6:

    goto LABEL_7;
  }
  int v18 = sqlite3_step(self->_removeSubscription);
  int v9 = v18;
  if (v18 && v18 != 101)
  {
    id v19 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v26 = sqlite3_errmsg(self->_store);
      int v27 = sqlite3_extended_errcode(self->_store);
      int v28 = 136316418;
      BOOL v29 = "-[UAFSubscriptionStoreManager _unsubscribeSubscription:subscription:]";
      __int16 v30 = 2112;
      id v31 = v6;
      __int16 v32 = 2112;
      id v33 = v7;
      __int16 v34 = 1024;
      int v35 = v9;
      __int16 v36 = 2080;
      int v37 = v26;
      __int16 v38 = 1024;
      int v39 = v27;
      _os_log_error_impl(&dword_23797A000, v19, OS_LOG_TYPE_ERROR, "%s Removal of subscription failed for Subscriber: '%@', Subscription: '%@' SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v28, 0x36u);
    }

    uint64_t v20 = UAFLogContextStorage;
    uint64_t v21 = kUAFABCDatabaseFailure;
    int v22 = [NSNumber numberWithInt:sqlite3_extended_errcode(self->_store)];
    uint64_t v23 = [v22 stringValue];
    UAFFaultCapture(v20, (uint64_t)v21, @"subscription", (uint64_t)v23);
  }
  else
  {
    ++self->_updateCount;
  }
LABEL_7:
  sqlite3_reset(self->_removeSubscription);
  sqlite3_clear_bindings(self->_removeSubscription);
  if (v9) {
    BOOL v15 = v9 == 101;
  }
  else {
    BOOL v15 = 1;
  }
  BOOL v16 = v15;

  return v16;
}

- (BOOL)_removeAllSubscriptions
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v3 = sqlite3_step(self->_removeAllSubscriptions);
  if (v3 == 101)
  {
    ++self->_updateCount;
  }
  else
  {
    uint64_t v4 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v7 = sqlite3_errmsg(self->_store);
      int v8 = sqlite3_extended_errcode(self->_store);
      int v9 = 136315906;
      long long v10 = "-[UAFSubscriptionStoreManager _removeAllSubscriptions]";
      __int16 v11 = 1024;
      int v12 = v3;
      __int16 v13 = 2080;
      int v14 = v7;
      __int16 v15 = 1024;
      int v16 = v8;
      _os_log_error_impl(&dword_23797A000, v4, OS_LOG_TYPE_ERROR, "%s Removal of all the subscriptions failed SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v9, 0x22u);
    }
  }
  sqlite3_reset(self->_removeAllSubscriptions);
  return !v3 || v3 == 101;
}

- (BOOL)removeAllSubscriptions
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__UAFSubscriptionStoreManager_removeAllSubscriptions__block_invoke;
  v5[3] = &unk_264CEB9D8;
  v5[4] = self;
  int v2 = [(UAFSubscriptionStoreManager *)self doDatabaseOperation:v5 useTransaction:1 logDescription:@"removing all subscriptions" error:0];
  return !v2 || v2 == 101;
}

uint64_t __53__UAFSubscriptionStoreManager_removeAllSubscriptions__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _removeAllSubscriptions]) {
    return 0;
  }
  else {
    return 3;
  }
}

- (int)_setSystemAssetSetUsages:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(UAFSubscriptionStoreManager *)self _removeAllSystemAssetSetUsages];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v18 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
      int v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v17);
      int v13 = [(UAFSubscriptionStoreManager *)self _setSystemAssetSetUsages:v11 usages:v12];

      if (v13 != 101 && v13 != 0) {
        int v3 = v13;
      }
      if (v13 != 101 && v13 != 0) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }
  }
  else
  {
LABEL_18:
    int v3 = 0;
  }

  return v3;
}

- (id)_subscriptionTime:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  id v5 = [MEMORY[0x263EFF960] currentLocale];
  [v4 setLocale:v5];

  [v4 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
  id v6 = [MEMORY[0x263EFFA18] localTimeZone];
  [v4 setTimeZone:v6];

  uint64_t v7 = [v4 stringFromDate:v3];

  return v7;
}

- (void)expireSubscriptions
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __50__UAFSubscriptionStoreManager_expireSubscriptions__block_invoke;
  v2[3] = &unk_264CEB9D8;
  v2[4] = self;
  [(UAFSubscriptionStoreManager *)self doDatabaseOperation:v2 useTransaction:1 logDescription:@"expiring subscriptions" error:0];
}

uint64_t __50__UAFSubscriptionStoreManager_expireSubscriptions__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v2 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 80);
  int v3 = sqlite3_step(v2);
  id v5 = *(sqlite3_stmt ***)(a1 + 32);
  if (v3 == 100)
  {
    *(void *)&long long v4 = 136315906;
    long long v19 = v4;
    do
    {
      id v6 = objc_msgSend(v5, "readString:col:", v2, 0, v19);
      uint64_t v7 = [*(id *)(a1 + 32) readData:v2 col:1];
      if (v7) {
        BOOL v8 = v6 == 0;
      }
      else {
        BOOL v8 = 1;
      }
      if (!v8)
      {
        uint64_t v9 = [*(id *)(a1 + 32) _uafAssetSetSubscriptionFromData:v7];
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          uint64_t v11 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            int v12 = *(void **)(a1 + 32);
            int v13 = [MEMORY[0x263EFF910] now];
            int v14 = [v12 _subscriptionTime:v13];
            *(_DWORD *)buf = v19;
            uint64_t v21 = "-[UAFSubscriptionStoreManager expireSubscriptions]_block_invoke";
            __int16 v22 = 2114;
            uint64_t v23 = v10;
            __int16 v24 = 2114;
            int v25 = v6;
            __int16 v26 = 2114;
            int v27 = v14;
            _os_log_impl(&dword_23797A000, v11, OS_LOG_TYPE_DEFAULT, "%s Removing expired sub '%{public}@' from subscriber '%{public}@' at '%{public}@'", buf, 0x2Au);
          }
          __int16 v15 = *(void **)(a1 + 32);
          int v16 = [v10 name];
          [v15 _unsubscribeSubscription:v6 subscription:v16];
        }
      }

      int v17 = sqlite3_step(v2);
      id v5 = *(sqlite3_stmt ***)(a1 + 32);
    }
    while (v17 == 100);
  }
  sqlite3_reset(v5[10]);
  return 0;
}

- (int)_updateSystemAssetSetUsages:(id *)a3 assetSetUsages:(id *)a4 configurationManager:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a5;
  uint64_t v9 = [(UAFSubscriptionStoreManager *)self _getSubscriptions:0];
  uint64_t v10 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 136315394;
    long long v20 = "-[UAFSubscriptionStoreManager _updateSystemAssetSetUsages:assetSetUsages:configurationManager:]";
    __int16 v21 = 2114;
    __int16 v22 = v9;
    _os_log_debug_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEBUG, "%s All subscriptions now %{public}@", (uint8_t *)&v19, 0x16u);
  }

  id v11 = v8;
  int v12 = v11;
  if (!v11)
  {
    int v12 = +[UAFConfigurationManager defaultManager];
  }
  int v13 = [v12 applySubscriptions:v9];
  int v14 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 136315394;
    long long v20 = "-[UAFSubscriptionStoreManager _updateSystemAssetSetUsages:assetSetUsages:configurationManager:]";
    __int16 v21 = 2114;
    __int16 v22 = v13;
    _os_log_debug_impl(&dword_23797A000, v14, OS_LOG_TYPE_DEBUG, "%s All asset set usages now %{public}@", (uint8_t *)&v19, 0x16u);
  }

  int v15 = [(UAFSubscriptionStoreManager *)self _setSystemAssetSetUsages:v13];
  if (v15 && (int v16 = v15, v15 != 101))
  {
    int v17 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315394;
      long long v20 = "-[UAFSubscriptionStoreManager _updateSystemAssetSetUsages:assetSetUsages:configurationManager:]";
      __int16 v21 = 2114;
      __int16 v22 = v13;
      _os_log_error_impl(&dword_23797A000, v17, OS_LOG_TYPE_ERROR, "%s Failed to update storage to reflect asset set usages %{public}@", (uint8_t *)&v19, 0x16u);
    }
  }
  else
  {
    if (a4) {
      *a4 = v13;
    }
    int v16 = 0;
    if (a3) {
      *a3 = v9;
    }
  }

  return v16;
}

- (id)updateSystemAssetSetUsages:(id *)a3 configurationManager:(id)a4
{
  id v6 = a4;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__4;
  __int16 v24 = __Block_byref_object_dispose__4;
  id v25 = 0;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x3032000000;
  int v17 = __Block_byref_object_copy__4;
  long long v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  if (!v6)
  {
    id v6 = +[UAFConfigurationManager defaultManager];
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__UAFSubscriptionStoreManager_updateSystemAssetSetUsages_configurationManager___block_invoke;
  v10[3] = &unk_264CEBA28;
  v10[4] = self;
  int v12 = &v20;
  int v13 = &v14;
  id v7 = v6;
  id v11 = v7;
  [(UAFSubscriptionStoreManager *)self doDatabaseOperation:v10 useTransaction:1 logDescription:@"updating system asset set usages" error:0];
  if (a3) {
    *a3 = (id) v21[5];
  }
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

uint64_t __79__UAFSubscriptionStoreManager_updateSystemAssetSetUsages_configurationManager___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 48) + 8);
  int v2 = *(void **)(v1 + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(id *)(v3 + 40);
  id obj = v2;
  uint64_t v4 = [*(id *)(a1 + 32) _updateSystemAssetSetUsages:&obj assetSetUsages:&v6 configurationManager:*(void *)(a1 + 40)];
  objc_storeStrong((id *)(v1 + 40), obj);
  objc_storeStrong((id *)(v3 + 40), v6);
  return v4;
}

- (id)updateSystemAssetSetUsages:(id *)a3
{
  return [(UAFSubscriptionStoreManager *)self updateSystemAssetSetUsages:a3 configurationManager:0];
}

- (int)_setSystemAssetSetUsages:(id)a3 usages:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(UAFSubscriptionStoreManager *)self bindString:self->_setSystemAssetSetUsages col:1 string:v6];
  if (!v8)
  {
    uint64_t v10 = [(UAFSubscriptionStoreManager *)self _dataFromSystemAssetSetUsages:v7];
    if (!v10)
    {
      uint64_t v14 = UAFGetLogCategory((void **)&UAFLogContextStorage);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136315394;
        uint64_t v23 = "-[UAFSubscriptionStoreManager _setSystemAssetSetUsages:usages:]";
        __int16 v24 = 2114;
        id v25 = v6;
        _os_log_error_impl(&dword_23797A000, v14, OS_LOG_TYPE_ERROR, "%s Getting system asset set usages data from the usages failed for AssetSetName: '%{public}@'", (uint8_t *)&v22, 0x16u);
      }
      int v9 = 3;
      goto LABEL_12;
    }
    int v13 = [(UAFSubscriptionStoreManager *)self bindData:self->_setSystemAssetSetUsages col:2 data:v10];
    if (v13)
    {
      int v9 = v13;
      uint64_t v14 = UAFGetLogCategory((void **)&UAFLogContextStorage);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v15 = sqlite3_errmsg(self->_store);
        int v16 = sqlite3_extended_errcode(self->_store);
        int v22 = 136316162;
        uint64_t v23 = "-[UAFSubscriptionStoreManager _setSystemAssetSetUsages:usages:]";
        __int16 v24 = 2114;
        id v25 = v6;
        __int16 v26 = 1024;
        int v27 = v9;
        __int16 v28 = 2080;
        BOOL v29 = v15;
        __int16 v30 = 1024;
        int v31 = v16;
        int v17 = "%s Binding system asset set usages data failed for AssetSetName: '%{public}@' SQLite error: %d (%s, Extended: %d)";
LABEL_8:
        _os_log_error_impl(&dword_23797A000, v14, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v22, 0x2Cu);
      }
    }
    else
    {
      int v19 = sqlite3_step(self->_setSystemAssetSetUsages);
      int v9 = v19;
      if (!v19 || v19 == 101) {
        goto LABEL_13;
      }
      uint64_t v14 = UAFGetLogCategory((void **)&UAFLogContextStorage);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = sqlite3_errmsg(self->_store);
        int v21 = sqlite3_extended_errcode(self->_store);
        int v22 = 136316162;
        uint64_t v23 = "-[UAFSubscriptionStoreManager _setSystemAssetSetUsages:usages:]";
        __int16 v24 = 2114;
        id v25 = v6;
        __int16 v26 = 1024;
        int v27 = v9;
        __int16 v28 = 2080;
        BOOL v29 = v20;
        __int16 v30 = 1024;
        int v31 = v21;
        int v17 = "%s Setting system asset set usages failed for AssetSetName: '%{public}@' SQLite error: %d (%s, Extended: %d)";
        goto LABEL_8;
      }
    }
LABEL_12:

    goto LABEL_13;
  }
  int v9 = v8;
  uint64_t v10 = UAFGetLogCategory((void **)&UAFLogContextStorage);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = sqlite3_errmsg(self->_store);
    int v12 = sqlite3_extended_errcode(self->_store);
    int v22 = 136316162;
    uint64_t v23 = "-[UAFSubscriptionStoreManager _setSystemAssetSetUsages:usages:]";
    __int16 v24 = 2114;
    id v25 = v6;
    __int16 v26 = 1024;
    int v27 = v9;
    __int16 v28 = 2080;
    BOOL v29 = v11;
    __int16 v30 = 1024;
    int v31 = v12;
    _os_log_error_impl(&dword_23797A000, v10, OS_LOG_TYPE_ERROR, "%s Binding asset set name to the set system asset set usages query failed for  AssetSetName: '%{public}@' SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v22, 0x2Cu);
  }
LABEL_13:

  sqlite3_reset(self->_setSystemAssetSetUsages);
  sqlite3_clear_bindings(self->_setSystemAssetSetUsages);

  return v9;
}

- (id)getSystemAssetSetUsages:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__4;
  int v15 = __Block_byref_object_dispose__4;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__UAFSubscriptionStoreManager_getSystemAssetSetUsages___block_invoke;
  v8[3] = &unk_264CEBA50;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [(UAFSubscriptionStoreManager *)self doDatabaseOperation:v8 useTransaction:0 logDescription:@"get system asset set usages" error:0];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __55__UAFSubscriptionStoreManager_getSystemAssetSetUsages___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) bindString:*(void *)(*(void *)(a1 + 32) + 96) col:1 string:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      int v7 = sqlite3_extended_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      int v24 = 136316162;
      id v25 = "-[UAFSubscriptionStoreManager getSystemAssetSetUsages:]_block_invoke";
      __int16 v26 = 2114;
      uint64_t v27 = v5;
      __int16 v28 = 1024;
      int v29 = v3;
      __int16 v30 = 2080;
      int v31 = v6;
      __int16 v32 = 1024;
      int v33 = v7;
      int v8 = "%s Binding asset set name failed for get system asset set usages query failed for AssetSetName: '%{public}@' "
           "SQLite error: %d (%s, Extended: %d)";
LABEL_4:
      _os_log_error_impl(&dword_23797A000, v4, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v24, 0x2Cu);
    }
  }
  else
  {
    uint64_t v9 = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 96));
    uint64_t v3 = v9;
    if ((v9 - 100) < 2 || v9 == 0)
    {
      uint64_t v11 = [*(id *)(a1 + 32) readData:*(void *)(*(void *)(a1 + 32) + 96) col:0];
      if (v11)
      {
        id v4 = v11;
        uint64_t v12 = [*(id *)(a1 + 32) _systemAssetSetUsagesFromData:v11];
        uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;
      }
      else
      {
        int v15 = UAFGetLogCategory((void **)&UAFLogContextStorage);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = *(void *)(a1 + 40);
          int v19 = sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
          int v20 = sqlite3_extended_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
          int v24 = 136316162;
          id v25 = "-[UAFSubscriptionStoreManager getSystemAssetSetUsages:]_block_invoke";
          __int16 v26 = 2114;
          uint64_t v27 = v18;
          __int16 v28 = 1024;
          int v29 = v3;
          __int16 v30 = 2080;
          int v31 = v19;
          __int16 v32 = 1024;
          int v33 = v20;
          _os_log_error_impl(&dword_23797A000, v15, OS_LOG_TYPE_ERROR, "%s Fetched nil system asset set usages for AssetSetName: '%{public}@' SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v24, 0x2Cu);
        }

        id v4 = 0;
      }
    }
    else
    {
      id v4 = UAFGetLogCategory((void **)&UAFLogContextStorage);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = *(void *)(a1 + 40);
        int v22 = sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
        int v23 = sqlite3_extended_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
        int v24 = 136316162;
        id v25 = "-[UAFSubscriptionStoreManager getSystemAssetSetUsages:]_block_invoke";
        __int16 v26 = 2114;
        uint64_t v27 = v21;
        __int16 v28 = 1024;
        int v29 = v3;
        __int16 v30 = 2080;
        int v31 = v22;
        __int16 v32 = 1024;
        int v33 = v23;
        int v8 = "%s Fetching system asset usages from database failed for AssetSetName: '%{public}@' SQLite error: %d (%s, Extended: %d)";
        goto LABEL_4;
      }
    }
  }

  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 96));
  sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 96));
  return v3;
}

- (id)getAllSystemAssetSetUsages:(id *)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__4;
  uint64_t v12 = __Block_byref_object_dispose__4;
  id v13 = (id)objc_opt_new();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__UAFSubscriptionStoreManager_getAllSystemAssetSetUsages___block_invoke;
  v7[3] = &unk_264CEB988;
  v7[4] = self;
  v7[5] = &v8;
  [(UAFSubscriptionStoreManager *)self doDatabaseOperation:v7 useTransaction:0 logDescription:@"get system asset set usages" error:a3];
  if ([(id)v9[5] count]) {
    id v5 = (id)v9[5];
  }
  else {
    id v5 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __58__UAFSubscriptionStoreManager_getAllSystemAssetSetUsages___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v2 = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 104));
  id v4 = *(void **)(a1 + 32);
  id v5 = (sqlite3_stmt *)v4[13];
  if (v2 == 100)
  {
    *(void *)&long long v3 = 136315138;
    long long v13 = v3;
    do
    {
      id v6 = objc_msgSend(v4, "readString:col:", v5, 0, v13);
      if (v6)
      {
        int v7 = [*(id *)(a1 + 32) readData:*(void *)(*(void *)(a1 + 32) + 104) col:1];
        if (v7)
        {
          uint64_t v8 = [*(id *)(a1 + 32) _systemAssetSetUsagesFromData:v7];
          if (v8)
          {
            uint64_t v9 = v8;
            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v8 forKeyedSubscript:v6];
          }
          else
          {
            uint64_t v10 = UAFGetLogCategory((void **)&UAFLogContextStorage);
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              int v15 = "-[UAFSubscriptionStoreManager getAllSystemAssetSetUsages:]_block_invoke";
              __int16 v16 = 2114;
              int v17 = v6;
              _os_log_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEFAULT, "%s Could not deserialize usages for assetset %{public}@", buf, 0x16u);
            }

            uint64_t v9 = 0;
          }
        }
        else
        {
          uint64_t v9 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            int v15 = "-[UAFSubscriptionStoreManager getAllSystemAssetSetUsages:]_block_invoke";
            __int16 v16 = 2114;
            int v17 = v6;
            _os_log_impl(&dword_23797A000, v9, OS_LOG_TYPE_DEFAULT, "%s Unexpectedly retrieved a nil usage for assetset %{public}@", buf, 0x16u);
          }
        }
      }
      else
      {
        int v7 = UAFGetLogCategory((void **)&UAFLogContextStorage);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          int v15 = "-[UAFSubscriptionStoreManager getAllSystemAssetSetUsages:]_block_invoke";
          _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEFAULT, "%s Unexpectedly retrieved a nil assetset name from SystemAssetSetUsages", buf, 0xCu);
        }
      }

      int v11 = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 104));
      id v4 = *(void **)(a1 + 32);
      id v5 = (sqlite3_stmt *)v4[13];
    }
    while (v11 == 100);
  }
  sqlite3_reset(v5);
  sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 104));
  return 0;
}

- (BOOL)clearSystemAssetSetUsages:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__UAFSubscriptionStoreManager_clearSystemAssetSetUsages___block_invoke;
  v10[3] = &unk_264CEBA78;
  v10[4] = self;
  id v11 = v4;
  id v5 = v4;
  int v6 = [(UAFSubscriptionStoreManager *)self doDatabaseOperation:v10 useTransaction:1 logDescription:@"clearing system asset set usages" error:0];
  if (v6) {
    BOOL v7 = v6 == 101;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v8 = v7;

  return v8;
}

uint64_t __57__UAFSubscriptionStoreManager_clearSystemAssetSetUsages___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) bindString:*(void *)(*(void *)(a1 + 32) + 112) col:1 string:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
LABEL_3:

      goto LABEL_4;
    }
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    int v13 = sqlite3_extended_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    int v14 = 136316162;
    int v15 = "-[UAFSubscriptionStoreManager clearSystemAssetSetUsages:]_block_invoke";
    __int16 v16 = 2114;
    uint64_t v17 = v11;
    __int16 v18 = 1024;
    int v19 = v3;
    __int16 v20 = 2080;
    uint64_t v21 = v12;
    __int16 v22 = 1024;
    int v23 = v13;
    uint64_t v10 = "%s Binding asset set name failed for removing system asset set usages query failed for AssetSetName: '%{public"
          "}@' SQLite error: %d (%s, Extended: %d)";
LABEL_10:
    _os_log_error_impl(&dword_23797A000, v4, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v14, 0x2Cu);
    goto LABEL_3;
  }
  uint64_t v6 = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 112));
  uint64_t v3 = v6;
  if (v6 && v6 != 101)
  {
    id v4 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    uint64_t v7 = *(void *)(a1 + 40);
    BOOL v8 = sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    int v9 = sqlite3_extended_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    int v14 = 136316162;
    int v15 = "-[UAFSubscriptionStoreManager clearSystemAssetSetUsages:]_block_invoke";
    __int16 v16 = 2114;
    uint64_t v17 = v7;
    __int16 v18 = 1024;
    int v19 = v3;
    __int16 v20 = 2080;
    uint64_t v21 = v8;
    __int16 v22 = 1024;
    int v23 = v9;
    uint64_t v10 = "%s Removing system asset set usages failed for AssetSetName: '%{public}@' SQLite error: %d (%s, Extended: %d)";
    goto LABEL_10;
  }
LABEL_4:
  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 112));
  sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 112));
  return v3;
}

- (BOOL)_removeAllSystemAssetSetUsages
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v3 = sqlite3_step(self->_removeAllSystemAssetSetUsages);
  if (v3 != 101)
  {
    id v4 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = sqlite3_errmsg(self->_store);
      int v8 = sqlite3_extended_errcode(self->_store);
      int v9 = 136315906;
      uint64_t v10 = "-[UAFSubscriptionStoreManager _removeAllSystemAssetSetUsages]";
      __int16 v11 = 1024;
      int v12 = v3;
      __int16 v13 = 2080;
      int v14 = v7;
      __int16 v15 = 1024;
      int v16 = v8;
      _os_log_error_impl(&dword_23797A000, v4, OS_LOG_TYPE_ERROR, "%s Removal of all the system asset set usages failed SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v9, 0x22u);
    }
  }
  sqlite3_reset(self->_removeAllSystemAssetSetUsages);
  return !v3 || v3 == 101;
}

- (BOOL)removeAllSystemAssetSetUsages
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__UAFSubscriptionStoreManager_removeAllSystemAssetSetUsages__block_invoke;
  v5[3] = &unk_264CEB9D8;
  v5[4] = self;
  int v2 = [(UAFSubscriptionStoreManager *)self doDatabaseOperation:v5 useTransaction:1 logDescription:@"remove all system asset set usages" error:0];
  return !v2 || v2 == 101;
}

uint64_t __60__UAFSubscriptionStoreManager_removeAllSystemAssetSetUsages__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _removeAllSystemAssetSetUsages]) {
    return 0;
  }
  else {
    return 3;
  }
}

- (int)_setDbVersion:(int)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v5 = [(UAFSubscriptionStoreManager *)self _beginDatabaseTransaction];
  if (v5)
  {
    int v6 = v5;
    uint64_t v7 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      __int16 v15 = "-[UAFSubscriptionStoreManager _setDbVersion:]";
      _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s Begin exclusive transaction of setting db version failed", (uint8_t *)&v14, 0xCu);
    }

    goto LABEL_15;
  }
  int v8 = sqlite3_bind_int(self->_setDbVersion, 1, a3);
  if (v8)
  {
    int v6 = v8;
    int v9 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = sqlite3_errmsg(self->_store);
      int v13 = sqlite3_extended_errcode(self->_store);
      int v14 = 136315906;
      __int16 v15 = "-[UAFSubscriptionStoreManager _setDbVersion:]";
      __int16 v16 = 1024;
      int v17 = v6;
      __int16 v18 = 2080;
      int v19 = v12;
      __int16 v20 = 1024;
      int v21 = v13;
      _os_log_error_impl(&dword_23797A000, v9, OS_LOG_TYPE_ERROR, "%s Binding db version failed SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v14, 0x22u);
    }
  }
  else
  {
    int v6 = sqlite3_step(self->_setDbVersion);
    if (!v6)
    {
LABEL_11:
      int v6 = [(UAFSubscriptionStoreManager *)self _endDatabaseTransaction];
      goto LABEL_15;
    }
  }
  if (v6 == 101) {
    goto LABEL_11;
  }
  uint64_t v10 = UAFGetLogCategory((void **)&UAFLogContextStorage);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    __int16 v15 = "-[UAFSubscriptionStoreManager _setDbVersion:]";
    _os_log_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEFAULT, "%s Rolling back exclusive transaction of setting db version", (uint8_t *)&v14, 0xCu);
  }

  [(UAFSubscriptionStoreManager *)self _rollbackDatabaseTransaction];
LABEL_15:
  sqlite3_reset(self->_setDbVersion);
  sqlite3_clear_bindings(self->_setDbVersion);
  return v6;
}

- (BOOL)_moveDatabase
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263F08850] defaultManager];
  oldDatabaseName = self->_oldDatabaseName;
  id v14 = 0;
  [v3 removeItemAtPath:oldDatabaseName error:&v14];
  id v5 = v14;

  int v6 = [MEMORY[0x263F08850] defaultManager];
  databaseName = self->_databaseName;
  int v8 = self->_oldDatabaseName;
  id v13 = v5;
  char v9 = [v6 moveItemAtPath:databaseName toPath:v8 error:&v13];
  id v10 = v13;

  if ((v9 & 1) == 0)
  {
    __int16 v11 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v16 = "-[UAFSubscriptionStoreManager _moveDatabase]";
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_error_impl(&dword_23797A000, v11, OS_LOG_TYPE_ERROR, "%s Moving the database failed with error: %@", buf, 0x16u);
    }
  }
  return v9;
}

- (int)_performDbUpgrade:(int)a3
{
  int v5 = 0;
  int v6 = 0;
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v7 = a3;
  while (!self->_dbUpToDate)
  {
    if (v7 <= 0)
    {
      int v8 = &upgradeBlocks + v7;
      while (1)
      {
        char v9 = (uint64_t (**)(void, void))MEMORY[0x237E26D50](*v8, a2);
        if ((((uint64_t (**)(void, UAFSubscriptionStoreManager *))v9)[2](v9, self) & 1) == 0) {
          break;
        }
        int v10 = v7 + 1;
        int v11 = [(UAFSubscriptionStoreManager *)self _setDbVersion:(v7 + 1)];
        int v5 = v11;
        if (v11 && v11 != 101) {
          goto LABEL_13;
        }

        ++v8;
        ++v7;
        if (v10 == 1) {
          goto LABEL_14;
        }
      }
      int v12 = UAFGetLogCategory((void **)&UAFLogContextStorage);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v19 = "-[UAFSubscriptionStoreManager _performDbUpgrade:]";
        __int16 v20 = 1024;
        int v21 = v7;
        __int16 v22 = 1024;
        int v23 = v6;
        _os_log_error_impl(&dword_23797A000, v12, OS_LOG_TYPE_ERROR, "%s Upgrading db failed at version %d in attempt %d", buf, 0x18u);
      }

      int v5 = 3;
LABEL_13:
    }
LABEL_14:
    if (v5) {
      BOOL v13 = v5 == 101;
    }
    else {
      BOOL v13 = 1;
    }
    BOOL v14 = v13;
    self->_dbUpToDate = v14;
    if (v5 && v5 != 101)
    {
      __int16 v15 = UAFGetLogCategory((void **)&UAFLogContextStorage);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v19 = "-[UAFSubscriptionStoreManager _performDbUpgrade:]";
        __int16 v20 = 1024;
        int v21 = v6;
        _os_log_error_impl(&dword_23797A000, v15, OS_LOG_TYPE_ERROR, "%s Couldn't upgrade the database so attempting db deletion and retrying during attempt %d", buf, 0x12u);
      }

      if (![(UAFSubscriptionStoreManager *)self _moveDatabase])
      {
LABEL_27:
        if (!self->_dbUpToDate)
        {
          __int16 v16 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v19 = "-[UAFSubscriptionStoreManager _performDbUpgrade:]";
            __int16 v20 = 1024;
            int v21 = 5;
            _os_log_error_impl(&dword_23797A000, v16, OS_LOG_TYPE_ERROR, "%s Couldn't upgrade the database even after %d attempts", buf, 0x12u);
          }
        }
        return v5;
      }
      int v5 = [(UAFSubscriptionStoreManager *)self _openDatabase:self->_databaseName];
      int v7 = a3;
    }
    if (++v6 == 5) {
      goto LABEL_27;
    }
  }
  return v5;
}

- (BOOL)performDbUpgradeToVersion:(int)a3
{
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  int v5 = +[UAFSubscriptionStoreManager getSerialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__UAFSubscriptionStoreManager_performDbUpgradeToVersion___block_invoke;
  block[3] = &unk_264CEBAA0;
  block[4] = self;
  void block[5] = &v12;
  int v11 = a3;
  dispatch_sync(v5, block);

  int v6 = *((_DWORD *)v13 + 6);
  if (v6) {
    BOOL v7 = v6 == 101;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v8 = v7;
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __57__UAFSubscriptionStoreManager_performDbUpgradeToVersion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(a1 + 32) _openDatabase:*(void *)(*(void *)(a1 + 32) + 168)];
  if ((result & 1) == 0)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 3;
    return result;
  }
  if ([*(id *)(a1 + 32) _createDbVersionTable])
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32)
                                                                                                + 136));
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    int v4 = *(_DWORD *)(v3 + 24);
    if ((v4 & 0xFFFFFFFE) == 0x64)
    {
      uint64_t v5 = sqlite3_column_int(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 136), 0);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
      if (*(_DWORD *)(v3 + 24)) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v5 = 0;
      if (v4)
      {
LABEL_5:
        *(_DWORD *)(v3 + 24) = 3;
        int v6 = UAFGetLogCategory((void **)&UAFLogContextStorage);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int v11 = 136315138;
          *(void *)&v11[4] = "-[UAFSubscriptionStoreManager performDbUpgradeToVersion:]_block_invoke";
          BOOL v7 = "%s Reading db version from DbVersion table failed";
LABEL_20:
          _os_log_error_impl(&dword_23797A000, v6, OS_LOG_TYPE_ERROR, v7, v11, 0xCu);
          goto LABEL_9;
        }
        goto LABEL_9;
      }
    }
    int v8 = *(_DWORD *)(a1 + 48);
    if (v5 == v8)
    {
      *(_DWORD *)(v3 + 24) = 0;
    }
    else if ((int)v5 <= v8)
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _performDbUpgrade:v5];
    }
    else
    {
      *(_DWORD *)(v3 + 24) = 3;
      char v9 = UAFGetLogCategory((void **)&UAFLogContextStorage);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)int v11 = 136315650;
        *(void *)&v11[4] = "-[UAFSubscriptionStoreManager performDbUpgradeToVersion:]_block_invoke";
        *(_WORD *)&v11[12] = 1024;
        *(_DWORD *)&v11[14] = v10;
        __int16 v12 = 1024;
        int v13 = v5;
        _os_log_error_impl(&dword_23797A000, v9, OS_LOG_TYPE_ERROR, "%s Db upgrade requested a version %d lesser than the current stored version %d", v11, 0x18u);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_closeDatabase", *(_OWORD *)v11);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 3;
  int v6 = UAFGetLogCategory((void **)&UAFLogContextStorage);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)int v11 = 136315138;
    *(void *)&v11[4] = "-[UAFSubscriptionStoreManager performDbUpgradeToVersion:]_block_invoke";
    BOOL v7 = "%s Creation or checking of DbVersion table failed";
    goto LABEL_20;
  }
LABEL_9:

  return objc_msgSend(*(id *)(a1 + 32), "_closeDatabase", *(_OWORD *)v11);
}

- (id)_dataFromUAFAssetSubscription:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v7 = 0;
  uint64_t v3 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v7];
  id v4 = v7;
  if (v4)
  {
    uint64_t v5 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      char v9 = "-[UAFSubscriptionStoreManager _dataFromUAFAssetSubscription:]";
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_error_impl(&dword_23797A000, v5, OS_LOG_TYPE_ERROR, "%s Failed to archive subscription asset set usages: %@", buf, 0x16u);
    }
  }

  return v3;
}

- (id)_dataFromSystemAssetSetUsages:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v7 = 0;
  uint64_t v3 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v7];
  id v4 = v7;
  if (v4)
  {
    uint64_t v5 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      char v9 = "-[UAFSubscriptionStoreManager _dataFromSystemAssetSetUsages:]";
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_error_impl(&dword_23797A000, v5, OS_LOG_TYPE_ERROR, "%s Failed to archive system asset set usages: %@", buf, 0x16u);
    }
  }

  return v3;
}

- (id)_systemAssetSetUsagesFromData:(id)a3
{
  v17[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F08928];
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  int v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  id v7 = [v4 setWithArray:v6];
  id v12 = 0;
  int v8 = [v3 unarchivedObjectOfClasses:v7 fromData:v5 error:&v12];

  id v9 = v12;
  if (v9)
  {
    __int16 v10 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "-[UAFSubscriptionStoreManager _systemAssetSetUsagesFromData:]";
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_error_impl(&dword_23797A000, v10, OS_LOG_TYPE_ERROR, "%s Failed to unarchive subscription asset set usages: %@", buf, 0x16u);
    }
  }

  return v8;
}

- (id)getSystemConfigurationForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = __Block_byref_object_copy__4;
  id v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  uint64_t v9 = MEMORY[0x263EF8330];
  id v5 = v4;
  id v10 = v5;
  id v11 = &v12;
  int v6 = [NSString stringWithFormat:@"get system configuration for key: %@", v5, v9, 3221225472, __60__UAFSubscriptionStoreManager_getSystemConfigurationForKey___block_invoke, &unk_264CEBA50, self];
  [(UAFSubscriptionStoreManager *)self doDatabaseOperation:&v9 useTransaction:0 logDescription:v6 error:0];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __60__UAFSubscriptionStoreManager_getSystemConfigurationForKey___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = (sqlite3_stmt *)v2[18];
  uint64_t v4 = [v2 bindString:v3 col:1 string:*(void *)(a1 + 40)];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    uint64_t v18 = *(void *)(a1 + 40);
    uint64_t v19 = sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    int v20 = sqlite3_extended_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    int v21 = 136316162;
    __int16 v22 = "-[UAFSubscriptionStoreManager getSystemConfigurationForKey:]_block_invoke";
    __int16 v23 = 2114;
    uint64_t v24 = v18;
    __int16 v25 = 1024;
    int v26 = v5;
    __int16 v27 = 2080;
    __int16 v28 = v19;
    __int16 v29 = 1024;
    int v30 = v20;
    id v17 = "%s Error binding read subscription for '%{public}@' SQLite error: %d (%s, Extended: %d)";
LABEL_14:
    _os_log_error_impl(&dword_23797A000, v6, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v21, 0x2Cu);
    goto LABEL_3;
  }
  uint64_t v7 = sqlite3_step(v3);
  uint64_t v5 = v7;
  if ((v7 - 100) < 2 || v7 == 0)
  {
    uint64_t v9 = [*(id *)(a1 + 32) readString:*(void *)(*(void *)(a1 + 32) + 144) col:0];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    goto LABEL_10;
  }
  int v6 = UAFGetLogCategory((void **)&UAFLogContextStorage);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    __int16 v15 = sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    int v16 = sqlite3_extended_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    int v21 = 136316162;
    __int16 v22 = "-[UAFSubscriptionStoreManager getSystemConfigurationForKey:]_block_invoke";
    __int16 v23 = 2114;
    uint64_t v24 = v14;
    __int16 v25 = 1024;
    int v26 = v5;
    __int16 v27 = 2080;
    __int16 v28 = v15;
    __int16 v29 = 1024;
    int v30 = v16;
    id v17 = "%s Error executing read SystemConfiguration key for '%{public}@' SQLite error: %d (%s, Extended: %d)";
    goto LABEL_14;
  }
LABEL_3:

LABEL_10:
  sqlite3_reset(v3);
  sqlite3_clear_bindings(v3);
  return v5;
}

- (void)setSystemConfigurationForKey:(id)a3 withValue:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(UAFSubscriptionStoreManager *)self getSystemConfigurationForKey:v6];
  uint64_t v9 = v8;
  if (v8 && [v8 isEqualToString:v7])
  {
    uint64_t v10 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v16 = "-[UAFSubscriptionStoreManager setSystemConfigurationForKey:withValue:]";
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEFAULT, "%s Skipping update of %{public}@ as value is unchanged", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v12 = MEMORY[0x263EF8330];
    id v13 = v6;
    id v14 = v7;
    id v11 = [NSString stringWithFormat:@"set system configuration for key: %@", v13, v12, 3221225472, __70__UAFSubscriptionStoreManager_setSystemConfigurationForKey_withValue___block_invoke, &unk_264CEBAC8, self];
    [(UAFSubscriptionStoreManager *)self doDatabaseOperation:&v12 useTransaction:0 logDescription:v11 error:0];
  }
}

uint64_t __70__UAFSubscriptionStoreManager_setSystemConfigurationForKey_withValue___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) bindString:*(void *)(*(void *)(a1 + 32) + 152) col:1 string:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      int v7 = sqlite3_extended_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      int v18 = 136316162;
      uint64_t v19 = "-[UAFSubscriptionStoreManager setSystemConfigurationForKey:withValue:]_block_invoke";
      __int16 v20 = 2114;
      uint64_t v21 = v5;
      __int16 v22 = 1024;
      int v23 = v3;
      __int16 v24 = 2080;
      __int16 v25 = v6;
      __int16 v26 = 1024;
      int v27 = v7;
      int v8 = "%s Binding key to SystemConfiguration: '%{public}@' SQLite error: %d (%s, Extended: %d)";
LABEL_13:
      _os_log_error_impl(&dword_23797A000, v4, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v18, 0x2Cu);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  uint64_t v9 = [*(id *)(a1 + 32) bindString:*(void *)(*(void *)(a1 + 32) + 152) col:2 string:*(void *)(a1 + 48)];
  if (v9)
  {
    uint64_t v3 = v9;
    uint64_t v4 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      int v16 = sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      int v17 = sqlite3_extended_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      int v18 = 136316162;
      uint64_t v19 = "-[UAFSubscriptionStoreManager setSystemConfigurationForKey:withValue:]_block_invoke";
      __int16 v20 = 2114;
      uint64_t v21 = v15;
      __int16 v22 = 1024;
      int v23 = v3;
      __int16 v24 = 2080;
      __int16 v25 = v16;
      __int16 v26 = 1024;
      int v27 = v17;
      int v8 = "%s Binding value to SystemConfiguration: '%{public}@' SQLite error: %d (%s, Extended: %d)";
      goto LABEL_13;
    }
    goto LABEL_6;
  }
  uint64_t v11 = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 152));
  uint64_t v3 = v11;
  if (v11 && v11 != 101)
  {
    uint64_t v4 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      id v13 = sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      int v14 = sqlite3_extended_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      int v18 = 136316162;
      uint64_t v19 = "-[UAFSubscriptionStoreManager setSystemConfigurationForKey:withValue:]_block_invoke";
      __int16 v20 = 2114;
      uint64_t v21 = v12;
      __int16 v22 = 1024;
      int v23 = v3;
      __int16 v24 = 2080;
      __int16 v25 = v13;
      __int16 v26 = 1024;
      int v27 = v14;
      int v8 = "%s Executing set SystemConfiguration failed for: '%{public}@' SQLite error: %d (%s, Extended: %d)";
      goto LABEL_13;
    }
LABEL_6:
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 152));
  sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 152));
  return v3;
}

- (id)getAllSystemConfiguration
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  int v8 = __Block_byref_object_copy__4;
  uint64_t v9 = __Block_byref_object_dispose__4;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__UAFSubscriptionStoreManager_getAllSystemConfiguration__block_invoke;
  v4[3] = &unk_264CEB988;
  v4[4] = self;
  v4[5] = &v5;
  [(UAFSubscriptionStoreManager *)self doDatabaseOperation:v4 useTransaction:1 logDescription:@"getting all system configuration keys & values" error:0];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __56__UAFSubscriptionStoreManager_getAllSystemConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v2 = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 160));
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = (sqlite3_stmt *)v4[20];
  if (v2 == 100)
  {
    *(void *)&long long v3 = 136315138;
    long long v16 = v3;
    do
    {
      id v6 = objc_msgSend(v4, "readString:col:", v5, 0, v16);
      if (v6)
      {
        uint64_t v7 = [*(id *)(a1 + 32) readString:*(void *)(*(void *)(a1 + 32) + 160) col:1];
        if (v7)
        {
          int v8 = v7;
          uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          if (!v9)
          {
            uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
            uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v12 = *(void **)(v11 + 40);
            *(void *)(v11 + 40) = v10;

            uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          }
          [v9 setObject:v8 forKeyedSubscript:v6];
        }
        else
        {
          id v13 = UAFGetLogCategory((void **)&UAFLogContextStorage);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            int v18 = "-[UAFSubscriptionStoreManager getAllSystemConfiguration]_block_invoke";
            _os_log_error_impl(&dword_23797A000, v13, OS_LOG_TYPE_ERROR, "%s Unexpectedly retrieved a nil value from SystemConfiguration", buf, 0xCu);
          }

          int v8 = 0;
        }
      }
      else
      {
        int v8 = UAFGetLogCategory((void **)&UAFLogContextStorage);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v16;
          int v18 = "-[UAFSubscriptionStoreManager getAllSystemConfiguration]_block_invoke";
          _os_log_error_impl(&dword_23797A000, v8, OS_LOG_TYPE_ERROR, "%s Unexpectedly retrieved a nil key from SystemConfiguration", buf, 0xCu);
        }
      }

      int v14 = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 160));
      uint64_t v4 = *(void **)(a1 + 32);
      uint64_t v5 = (sqlite3_stmt *)v4[20];
    }
    while (v14 == 100);
  }
  sqlite3_reset(v5);
  sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 160));
  return 0;
}

- (int)executeSQL:(const char *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!self->_store) {
    return 1;
  }
  errmsg = 0;
  uint64_t v5 = sqlite3_vmprintf(a3, &v18);
  int v6 = sqlite3_exec(self->_store, v5, 0, 0, &errmsg);
  if (v6) {
    BOOL v7 = errmsg == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    int v8 = UAFGetLogCategory((void **)&UAFLogContextStorage);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v12 = "-[UAFSubscriptionStoreManager executeSQL:]";
      __int16 v13 = 2080;
      int v14 = a3;
      __int16 v15 = 2080;
      long long v16 = errmsg;
      _os_log_error_impl(&dword_23797A000, v8, OS_LOG_TYPE_ERROR, "%s execute(%s) Error: %s", buf, 0x20u);
    }

    sqlite3_free(errmsg);
  }
  sqlite3_free(v5);
  return v6;
}

- (int)bindData:(sqlite3_stmt *)a3 col:(int)a4 data:(id)a5
{
  id v7 = a5;
  int v8 = (const void *)[v7 bytes];
  int v9 = [v7 length];

  return sqlite3_bind_blob(a3, a4, v8, v9, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (int)bindDate:(sqlite3_stmt *)a3 col:(int)a4 date:(id)a5
{
  [a5 timeIntervalSince1970];

  return sqlite3_bind_double(a3, a4, v7);
}

- (id)readString:(sqlite3_stmt *)a3 col:(int)a4
{
  uint64_t v4 = (void *)sqlite3_column_text(a3, a4);
  if (v4)
  {
    uint64_t v4 = [NSString stringWithUTF8String:v4];
  }

  return v4;
}

- (unint64_t)updateCount
{
  return self->_updateCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldDatabaseName, 0);

  objc_storeStrong((id *)&self->_databaseName, 0);
}

@end