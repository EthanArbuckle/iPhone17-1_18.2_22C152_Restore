@interface QLCacheFileProviderFileIdentifier(SQLRequests)
+ (__CFString)queryStringToFindCacheIds;
+ (__CFString)tableName;
+ (uint64_t)cacheIdFromRowId:()SQLRequests;
+ (uint64_t)removeFromDatabase:()SQLRequests fileWithCacheId:;
+ (uint64_t)rowIdFromCacheId:()SQLRequests;
+ (uint64_t)whereClauseToFindCacheId;
- (uint64_t)statementToFindCacheIdInDatabase:()SQLRequests;
- (void)bindInFindCacheIdStatement:()SQLRequests database:startingAtIndex:gettingNextIndex:;
@end

@implementation QLCacheFileProviderFileIdentifier(SQLRequests)

+ (uint64_t)cacheIdFromRowId:()SQLRequests
{
  return a3;
}

- (void)bindInFindCacheIdStatement:()SQLRequests database:startingAtIndex:gettingNextIndex:
{
  id v10 = a4;
  v11 = [a1 itemID];
  v12 = [v11 providerDomainID];
  [v10 bindObject:v12 atIndex:a5 inStatement:a3];

  v13 = [a1 itemID];
  v14 = [v13 identifier];
  [v10 bindObject:v14 atIndex:(a5 + 1) inStatement:a3];

  if (a6) {
    *a6 = a5 + 2;
  }
}

- (uint64_t)statementToFindCacheIdInDatabase:()SQLRequests
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "prepareStatement:", "SELECT rowid, version FROM provider_files WHERE fileProviderId=? AND itemId=?");
  if (v5)
  {
    v6 = [a1 itemID];
    v7 = [v6 providerDomainID];
    [v4 bindObject:v7 atIndex:1 inStatement:v5];

    v8 = [a1 itemID];
    v9 = [v8 identifier];
    [v4 bindObject:v9 atIndex:2 inStatement:v5];
  }
  return v5;
}

+ (uint64_t)whereClauseToFindCacheId
{
  return [NSString stringWithFormat:@"fileProviderId=? AND itemId=?"];
}

+ (__CFString)queryStringToFindCacheIds
{
  return @"SELECT rowid, fileProviderId, itemId, version FROM provider_files WHERE ";
}

+ (__CFString)tableName
{
  return @"provider_files";
}

+ (uint64_t)rowIdFromCacheId:()SQLRequests
{
  return a3;
}

+ (uint64_t)removeFromDatabase:()SQLRequests fileWithCacheId:
{
  id v5 = a3;
  uint64_t v6 = [v5 prepareStatement:"DELETE FROM provider_files WHERE rowid=?"];
  uint64_t v10 = v6;
  if (v6)
  {
    uint64_t v7 = v6;
    [v5 bindUnsignedLongLong:a4 atIndex:1 inStatement:v6];
    uint64_t v8 = [v5 stepStatement:v7];
    [v5 finalizeStatement:&v10];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end