@interface WBBookmarkDatabaseSyncData
+ (BOOL)supportsSecureCoding;
+ (WBBookmarkDatabaseSyncData)databaseSyncDataWithContentsOfData:(id)a3;
+ (id)databaseSyncDataInDatabase:(void *)a3 databaseAccessor:(id)a4;
- (BOOL)didNotSaveRecordsAfterMigration;
- (CKServerChangeToken)lastPrivateDatabaseServerChangeToken;
- (CKServerChangeToken)lastSharedDatabaseServerChangeToken;
- (NSData)encodedDatabaseSyncData;
- (NSDictionary)recordZoneIDsToHashGenerators;
- (NSDictionary)recordZoneIDsToLastServerChangeTokens;
- (NSSet)auxiliaryRecordIDsToDelete;
- (NSSet)idsOfRecordZonesToRefresh;
- (NSSet)recordIDsToRefresh;
- (WBBookmarkDatabaseSyncData)init;
- (WBBookmarkDatabaseSyncData)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)hashGeneratorForRecordZoneID:(id)a3;
- (id)lastServerChangeTokenForRecordZoneID:(id)a3;
- (int64_t)minimumSyncAPIVersion;
- (int64_t)nextChangeID;
- (void)clearAllLastServerChangeTokens;
- (void)encodeWithCoder:(id)a3;
- (void)setAuxiliaryRecordIDsToDelete:(id)a3;
- (void)setDidNotSaveRecordsAfterMigration:(BOOL)a3;
- (void)setHashGenerator:(id)a3 forRecordZoneID:(id)a4;
- (void)setIdsOfRecordZonesToRefresh:(id)a3;
- (void)setLastPrivateDatabaseServerChangeToken:(id)a3;
- (void)setLastServerChangeToken:(id)a3 forRecordZoneID:(id)a4;
- (void)setLastSharedDatabaseServerChangeToken:(id)a3;
- (void)setMinimumSyncAPIVersion:(int64_t)a3;
- (void)setRecordIDsToRefresh:(id)a3;
- (void)writeToDatabase:(void *)a3 databaseAccessor:(id)a4;
@end

@implementation WBBookmarkDatabaseSyncData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (WBBookmarkDatabaseSyncData)databaseSyncDataWithContentsOfData:(id)a3
{
  id v3 = a3;
  v4 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[WBBookmarkDatabaseSyncData databaseSyncDataWithContentsOfData:](v4, v3);
  }
  v5 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v3 error:0];
  [v5 setClass:objc_opt_class() forClassName:@"CloudBookmarkDatabaseSyncData"];
  v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F081D0]];
  [v5 finishDecoding];
  v7 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[WBBookmarkDatabaseSyncData databaseSyncDataWithContentsOfData:](v7);
  }

  return (WBBookmarkDatabaseSyncData *)v6;
}

+ (id)databaseSyncDataInDatabase:(void *)a3 databaseAccessor:(id)a4
{
  v5 = (void *)[a4 copySyncDataWithDatabase:a3];
  v6 = [a1 databaseSyncDataWithContentsOfData:v5];

  return v6;
}

- (WBBookmarkDatabaseSyncData)init
{
  v15.receiver = self;
  v15.super_class = (Class)WBBookmarkDatabaseSyncData;
  v2 = [(WBBookmarkDatabaseSyncData *)&v15 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    recordZoneIDsToLastServerChangeTokens = v2->_recordZoneIDsToLastServerChangeTokens;
    v2->_recordZoneIDsToLastServerChangeTokens = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFFA08] set];
    recordIDsToRefresh = v2->_recordIDsToRefresh;
    v2->_recordIDsToRefresh = (NSSet *)v5;

    uint64_t v7 = [MEMORY[0x263EFFA08] set];
    auxiliaryRecordIDsToDelete = v2->_auxiliaryRecordIDsToDelete;
    v2->_auxiliaryRecordIDsToDelete = (NSSet *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    recordZoneIDsToHashGenerators = v2->_recordZoneIDsToHashGenerators;
    v2->_recordZoneIDsToHashGenerators = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263EFFA08] set];
    idsOfRecordZonesToRefresh = v2->_idsOfRecordZonesToRefresh;
    v2->_idsOfRecordZonesToRefresh = (NSSet *)v11;

    v13 = v2;
  }

  return v2;
}

- (NSData)encodedDatabaseSyncData
{
  return (NSData *)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

- (void)writeToDatabase:(void *)a3 databaseAccessor:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(WBBookmarkDatabaseSyncData *)self encodedDatabaseSyncData];
  v8 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[WBBookmarkDatabaseSyncData writeToDatabase:databaseAccessor:](v8, v7);
  }
  [v6 setSyncData:v7 database:a3];
}

- (NSDictionary)recordZoneIDsToLastServerChangeTokens
{
  v2 = (void *)[(NSMutableDictionary *)self->_recordZoneIDsToLastServerChangeTokens copy];
  return (NSDictionary *)v2;
}

- (void)clearAllLastServerChangeTokens
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  recordZoneIDsToLastServerChangeTokens = self->_recordZoneIDsToLastServerChangeTokens;
  self->_recordZoneIDsToLastServerChangeTokens = v3;

  uint64_t v5 = [MEMORY[0x263EFFA08] set];
  recordIDsToRefresh = self->_recordIDsToRefresh;
  self->_recordIDsToRefresh = v5;

  lastPrivateDatabaseServerChangeToken = self->_lastPrivateDatabaseServerChangeToken;
  self->_lastPrivateDatabaseServerChangeToken = 0;

  lastSharedDatabaseServerChangeToken = self->_lastSharedDatabaseServerChangeToken;
  self->_lastSharedDatabaseServerChangeToken = 0;

  uint64_t v9 = [MEMORY[0x263EFFA08] set];
  idsOfRecordZonesToRefresh = self->_idsOfRecordZonesToRefresh;
  self->_idsOfRecordZonesToRefresh = v9;
  MEMORY[0x270F9A758](v9, idsOfRecordZonesToRefresh);
}

- (id)lastServerChangeTokenForRecordZoneID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_recordZoneIDsToLastServerChangeTokens objectForKeyedSubscript:a3];
}

- (void)setLastServerChangeToken:(id)a3 forRecordZoneID:(id)a4
{
}

- (WBBookmarkDatabaseSyncData)initWithCoder:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)WBBookmarkDatabaseSyncData;
  uint64_t v5 = [(WBBookmarkDatabaseSyncData *)&v49 init];
  if (v5)
  {
    v5->_lastChangeID = [v4 decodeInt64ForKey:@"LastChangeID"];
    v5->_didNotSaveRecordsAfterMigration = [v4 decodeBoolForKey:@"DidNotSaveRecordsAfterMigration"];
    v5->_minimumSyncAPIVersion = [v4 decodeIntegerForKey:@"MinimumAPIVersion"];
    id v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"RecordZoneIDsToLastServerChangeTokens"];
    uint64_t v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      v12 = [MEMORY[0x263EFF9A0] dictionary];
    }
    recordZoneIDsToLastServerChangeTokens = v5->_recordZoneIDsToLastServerChangeTokens;
    v5->_recordZoneIDsToLastServerChangeTokens = v12;

    v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v17 = [v4 decodeObjectOfClasses:v16 forKey:@"RecordIDsToRefresh"];
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      v19 = [MEMORY[0x263EFFA08] set];
    }
    recordIDsToRefresh = v5->_recordIDsToRefresh;
    v5->_recordIDsToRefresh = v19;

    v21 = (void *)MEMORY[0x263EFFA08];
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v24 = [v4 decodeObjectOfClasses:v23 forKey:@"AuxiliaryRecordIDsToDelete"];
    v25 = v24;
    if (v24)
    {
      v26 = v24;
    }
    else
    {
      v26 = [MEMORY[0x263EFFA08] set];
    }
    auxiliaryRecordIDsToDelete = v5->_auxiliaryRecordIDsToDelete;
    v5->_auxiliaryRecordIDsToDelete = v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastPrivateDatabaseServerChangeToken"];
    lastPrivateDatabaseServerChangeToken = v5->_lastPrivateDatabaseServerChangeToken;
    v5->_lastPrivateDatabaseServerChangeToken = (CKServerChangeToken *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastSharedDatabaseServerChangeToken"];
    lastSharedDatabaseServerChangeToken = v5->_lastSharedDatabaseServerChangeToken;
    v5->_lastSharedDatabaseServerChangeToken = (CKServerChangeToken *)v30;

    v32 = (void *)MEMORY[0x263EFFA08];
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    v35 = objc_msgSend(v32, "setWithObjects:", v33, v34, objc_opt_class(), 0);
    v36 = [v4 decodeObjectOfClasses:v35 forKey:@"RecordZoneIDsToHashGenerators"];
    v37 = v36;
    if (v36)
    {
      v38 = v36;
    }
    else
    {
      v38 = [MEMORY[0x263EFF9A0] dictionary];
    }
    recordZoneIDsToHashGenerators = v5->_recordZoneIDsToHashGenerators;
    v5->_recordZoneIDsToHashGenerators = v38;

    v40 = (void *)MEMORY[0x263EFFA08];
    uint64_t v41 = objc_opt_class();
    v42 = objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    v43 = [v4 decodeObjectOfClasses:v42 forKey:@"IDsOfRecordZonesToRefresh"];
    v44 = v43;
    if (v43)
    {
      v45 = v43;
    }
    else
    {
      v45 = [MEMORY[0x263EFFA08] set];
    }
    idsOfRecordZonesToRefresh = v5->_idsOfRecordZonesToRefresh;
    v5->_idsOfRecordZonesToRefresh = v45;

    v47 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeInt64:self->_lastChangeID forKey:@"LastChangeID"];
  [v6 encodeInteger:self->_minimumSyncAPIVersion forKey:@"MinimumAPIVersion"];
  if (self->_didNotSaveRecordsAfterMigration) {
    [v6 encodeBool:1 forKey:@"DidNotSaveRecordsAfterMigration"];
  }
  if ([(NSMutableDictionary *)self->_recordZoneIDsToLastServerChangeTokens count]) {
    [v6 encodeObject:self->_recordZoneIDsToLastServerChangeTokens forKey:@"RecordZoneIDsToLastServerChangeTokens"];
  }
  if ([(NSSet *)self->_recordIDsToRefresh count]) {
    [v6 encodeObject:self->_recordIDsToRefresh forKey:@"RecordIDsToRefresh"];
  }
  NSUInteger v4 = [(NSSet *)self->_auxiliaryRecordIDsToDelete count];
  uint64_t v5 = v6;
  if (v4)
  {
    [v6 encodeObject:self->_auxiliaryRecordIDsToDelete forKey:@"AuxiliaryRecordIDsToDelete"];
    uint64_t v5 = v6;
  }
  [v5 encodeObject:self->_lastPrivateDatabaseServerChangeToken forKey:@"LastPrivateDatabaseServerChangeToken"];
  [v6 encodeObject:self->_lastSharedDatabaseServerChangeToken forKey:@"LastSharedDatabaseServerChangeToken"];
  if ([(NSMutableDictionary *)self->_recordZoneIDsToHashGenerators count]) {
    [v6 encodeObject:self->_recordZoneIDsToHashGenerators forKey:@"RecordZoneIDsToHashGenerators"];
  }
  if ([(NSSet *)self->_idsOfRecordZonesToRefresh count]) {
    [v6 encodeObject:self->_idsOfRecordZonesToRefresh forKey:@"IDsOfRecordZonesToRefresh"];
  }
}

- (int64_t)nextChangeID
{
  int64_t v2 = self->_lastChangeID + 1;
  self->_lastChangeID = v2;
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSMutableDictionary *)self->_recordZoneIDsToLastServerChangeTokens mutableCopy];
  id v6 = (void *)*((void *)v4 + 1);
  *((void *)v4 + 1) = v5;

  uint64_t v7 = [(NSSet *)self->_recordIDsToRefresh copy];
  uint64_t v8 = (void *)*((void *)v4 + 8);
  *((void *)v4 + 8) = v7;

  uint64_t v9 = [(NSSet *)self->_auxiliaryRecordIDsToDelete copy];
  v10 = (void *)*((void *)v4 + 9);
  *((void *)v4 + 9) = v9;

  objc_storeStrong((id *)v4 + 5, self->_lastPrivateDatabaseServerChangeToken);
  objc_storeStrong((id *)v4 + 6, self->_lastSharedDatabaseServerChangeToken);
  uint64_t v11 = [(NSMutableDictionary *)self->_recordZoneIDsToHashGenerators mutableCopy];
  v12 = (void *)*((void *)v4 + 3);
  *((void *)v4 + 3) = v11;

  uint64_t v13 = [(NSSet *)self->_idsOfRecordZonesToRefresh mutableCopy];
  v14 = (void *)*((void *)v4 + 10);
  *((void *)v4 + 10) = v13;

  *((unsigned char *)v4 + 32) = self->_didNotSaveRecordsAfterMigration;
  *((void *)v4 + 2) = self->_lastChangeID;
  return v4;
}

- (NSDictionary)recordZoneIDsToHashGenerators
{
  int64_t v2 = (void *)[(NSMutableDictionary *)self->_recordZoneIDsToHashGenerators copy];
  return (NSDictionary *)v2;
}

- (id)hashGeneratorForRecordZoneID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_recordZoneIDsToHashGenerators objectForKeyedSubscript:a3];
}

- (void)setHashGenerator:(id)a3 forRecordZoneID:(id)a4
{
  id v6 = a4;
  id v7 = (id)[a3 copy];
  [(NSMutableDictionary *)self->_recordZoneIDsToHashGenerators setObject:v7 forKeyedSubscript:v6];
}

- (CKServerChangeToken)lastPrivateDatabaseServerChangeToken
{
  return self->_lastPrivateDatabaseServerChangeToken;
}

- (void)setLastPrivateDatabaseServerChangeToken:(id)a3
{
}

- (CKServerChangeToken)lastSharedDatabaseServerChangeToken
{
  return self->_lastSharedDatabaseServerChangeToken;
}

- (void)setLastSharedDatabaseServerChangeToken:(id)a3
{
}

- (BOOL)didNotSaveRecordsAfterMigration
{
  return self->_didNotSaveRecordsAfterMigration;
}

- (void)setDidNotSaveRecordsAfterMigration:(BOOL)a3
{
  self->_didNotSaveRecordsAfterMigration = a3;
}

- (int64_t)minimumSyncAPIVersion
{
  return self->_minimumSyncAPIVersion;
}

- (void)setMinimumSyncAPIVersion:(int64_t)a3
{
  self->_minimumSyncAPIVersion = a3;
}

- (NSSet)recordIDsToRefresh
{
  return self->_recordIDsToRefresh;
}

- (void)setRecordIDsToRefresh:(id)a3
{
}

- (NSSet)auxiliaryRecordIDsToDelete
{
  return self->_auxiliaryRecordIDsToDelete;
}

- (void)setAuxiliaryRecordIDsToDelete:(id)a3
{
}

- (NSSet)idsOfRecordZonesToRefresh
{
  return self->_idsOfRecordZonesToRefresh;
}

- (void)setIdsOfRecordZonesToRefresh:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsOfRecordZonesToRefresh, 0);
  objc_storeStrong((id *)&self->_auxiliaryRecordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordIDsToRefresh, 0);
  objc_storeStrong((id *)&self->_lastSharedDatabaseServerChangeToken, 0);
  objc_storeStrong((id *)&self->_lastPrivateDatabaseServerChangeToken, 0);
  objc_storeStrong((id *)&self->_recordZoneIDsToHashGenerators, 0);
  objc_storeStrong((id *)&self->_recordZoneIDsToLastServerChangeTokens, 0);
}

+ (void)databaseSyncDataWithContentsOfData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21C043000, log, OS_LOG_TYPE_DEBUG, "Successfully created WBBookmarkDatabaseSyncData", v1, 2u);
}

+ (void)databaseSyncDataWithContentsOfData:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_21C043000, log, OS_LOG_TYPE_ERROR, "Failed to create WBBookmarkDatabaseSyncData with exception: %{public}@", buf, 0xCu);
}

+ (void)databaseSyncDataWithContentsOfData:(void *)a1 .cold.3(void *a1, void *a2)
{
  id v3 = a1;
  [a2 length];
  OUTLINED_FUNCTION_0_4(&dword_21C043000, v4, v5, "Trying to create WBBookmarkDatabaseSyncData from data of size %lu", v6, v7, v8, v9, 0);
}

- (void)writeToDatabase:(void *)a1 databaseAccessor:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 length];
  OUTLINED_FUNCTION_0_4(&dword_21C043000, v4, v5, "Writing sync data of size %lu to database", v6, v7, v8, v9, 0);
}

@end