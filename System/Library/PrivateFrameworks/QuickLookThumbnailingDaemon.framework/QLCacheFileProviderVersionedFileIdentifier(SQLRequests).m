@interface QLCacheFileProviderVersionedFileIdentifier(SQLRequests)
- (uint64_t)initWithSteppedStatement:()SQLRequests database:;
- (uint64_t)statementToInsertIntoDatabase:()SQLRequests;
- (uint64_t)statementToUpdateRecordWithCacheIdentifier:()SQLRequests inDatabase:;
@end

@implementation QLCacheFileProviderVersionedFileIdentifier(SQLRequests)

- (uint64_t)initWithSteppedStatement:()SQLRequests database:
{
  v6 = (void *)MEMORY[0x1E4F3A678];
  id v7 = a4;
  v8 = [v6 knownFileProviderIdentifiersSoFar];
  v9 = (void *)[v7 newStringFromColumn:1 inStatement:a3 uniqueInStringTable:v8];

  v10 = [MEMORY[0x1E4F3A678] knownFileProviderIdentifiersSoFar];
  v11 = (void *)[v7 newStringFromColumn:2 inStatement:a3 uniqueInStringTable:v10];

  v12 = (void *)[v7 newDataFromColumn:3 inStatement:a3 copyBytes:0];
  id v21 = 0;
  v13 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:&v21];
  id v14 = v21;
  if (!v13)
  {
    v15 = _log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[QLCacheFileProviderVersionedFileIdentifier(SQLRequests) initWithSteppedStatement:database:]((uint64_t)v14, v15);
    }
  }
  id v16 = objc_alloc(MEMORY[0x1E4F3A678]);
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F25D30]) initWithProviderDomainID:v9 itemIdentifier:v11];
  v18 = (void *)[v16 initWithItemID:v17];
  uint64_t v19 = [a1 initWithFileIdentifier:v18 version:v13];

  return v19;
}

- (uint64_t)statementToInsertIntoDatabase:()SQLRequests
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F28DB0];
  v6 = [a1 version];
  uint64_t v15 = 0;
  id v7 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v15];

  v8 = [a1 fileIdentifier];
  uint64_t v9 = objc_msgSend(v4, "prepareStatement:", "INSERT INTO provider_files (fileProviderId, itemId, version) VALUES (?, ?, ?)");
  if (v9)
  {
    v10 = [v8 itemID];
    v11 = [v10 providerDomainID];
    [v4 bindObject:v11 atIndex:1 inStatement:v9];

    v12 = [v8 itemID];
    v13 = [v12 identifier];
    [v4 bindObject:v13 atIndex:2 inStatement:v9];

    [v4 bindObject:v7 atIndex:3 inStatement:v9];
  }

  return v9;
}

- (uint64_t)statementToUpdateRecordWithCacheIdentifier:()SQLRequests inDatabase:
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F28DB0];
  v8 = [a1 version];
  uint64_t v17 = 0;
  uint64_t v9 = [v7 archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v17];

  v10 = [a1 fileIdentifier];
  uint64_t v11 = objc_msgSend(v6, "prepareStatement:", "UPDATE provider_files SET fileProviderId=?, itemId=?, version=? WHERE rowid=?");
  if (v11)
  {
    v12 = [v10 itemID];
    v13 = [v12 providerDomainID];
    [v6 bindObject:v13 atIndex:1 inStatement:v11];

    id v14 = [v10 itemID];
    uint64_t v15 = [v14 identifier];
    [v6 bindObject:v15 atIndex:2 inStatement:v11];

    [v6 bindObject:v9 atIndex:3 inStatement:v11];
    [v6 bindUnsignedLongLong:a3 atIndex:4 inStatement:v11];
  }

  return v11;
}

- (void)initWithSteppedStatement:()SQLRequests database:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DDC5E000, a2, OS_LOG_TYPE_ERROR, "Failed to unarchive version: %@", (uint8_t *)&v2, 0xCu);
}

@end