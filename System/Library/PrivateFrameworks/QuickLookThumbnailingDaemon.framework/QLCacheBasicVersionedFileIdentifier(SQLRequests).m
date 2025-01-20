@interface QLCacheBasicVersionedFileIdentifier(SQLRequests)
- (uint64_t)initWithSteppedStatement:()SQLRequests database:;
- (uint64_t)statementToInsertIntoDatabase:()SQLRequests;
- (uint64_t)statementToUpdateRecordWithCacheIdentifier:()SQLRequests inDatabase:;
@end

@implementation QLCacheBasicVersionedFileIdentifier(SQLRequests)

- (uint64_t)statementToInsertIntoDatabase:()SQLRequests
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F28DB0];
  v6 = [a1 version];
  uint64_t v12 = 0;
  v7 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v12];

  v8 = [a1 fileIdentifier];
  uint64_t v9 = objc_msgSend(v4, "prepareStatement:", "INSERT INTO basic_files (fileId, fsid, version) VALUES (?, ?, ?)");
  if (v9)
  {
    uint64_t v10 = __ROR8__([v8 fsid], 32);
    objc_msgSend(v4, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(v8, "fileId"), 1, v9);
    [v4 bindUnsignedLongLong:v10 atIndex:2 inStatement:v9];
    [v4 bindObject:v7 atIndex:3 inStatement:v9];
  }

  return v9;
}

- (uint64_t)statementToUpdateRecordWithCacheIdentifier:()SQLRequests inDatabase:
{
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F28DB0];
  v8 = [a1 version];
  uint64_t v15 = 0;
  uint64_t v9 = [v7 archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v15];

  uint64_t v10 = objc_msgSend(v6, "prepareStatement:", "UPDATE basic_files SET fileId=?, fsid=?, version=? WHERE rowid=?");
  v11 = [a1 fileIdentifier];
  uint64_t v12 = v11;
  if (v10)
  {
    uint64_t v13 = __ROR8__([v11 fsid], 32);
    objc_msgSend(v6, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(v12, "fileId"), 1, v10);
    [v6 bindUnsignedLongLong:v13 atIndex:2 inStatement:v10];
    [v6 bindObject:v9 atIndex:3 inStatement:v10];
    objc_msgSend(v6, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(MEMORY[0x1E4F3A668], "rowIdFromCacheId:", a3), 4, v10);
  }

  return v10;
}

- (uint64_t)initWithSteppedStatement:()SQLRequests database:
{
  id v6 = a4;
  uint64_t v7 = [v6 unsignedLongLongFromColumn:1 inStatement:a3];
  uint64_t v8 = [v6 unsignedLongLongFromColumn:2 inStatement:a3];
  uint64_t v9 = (void *)[v6 newDataFromColumn:3 inStatement:a3 copyBytes:0];

  uint64_t v15 = 0;
  uint64_t v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v15];
  if (!v10)
  {
    v11 = _log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[QLCacheBasicVersionedFileIdentifier(SQLRequests) initWithSteppedStatement:database:](v11);
    }
  }
  uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F3A668]), "initWithFileId:fsid:", v7, __ROR8__(v8, 32));
  uint64_t v13 = [a1 initWithFileIdentifier:v12 version:v10];

  return v13;
}

- (void)initWithSteppedStatement:()SQLRequests database:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_1DDC5E000, log, OS_LOG_TYPE_ERROR, "Failed to unarchive version from data: %@", (uint8_t *)&v1, 0xCu);
}

@end