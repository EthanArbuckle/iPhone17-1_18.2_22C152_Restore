@interface QLCacheBasicFileIdentifier(SQLRequests)
+ (__CFString)queryStringToFindCacheIds;
+ (__CFString)tableName;
+ (uint64_t)removeFromDatabase:()SQLRequests fileWithCacheId:;
+ (uint64_t)rowIdFromCacheId:()SQLRequests;
+ (uint64_t)whereClauseToFindCacheId;
+ (unint64_t)cacheIdFromRowId:()SQLRequests;
- (uint64_t)statementToFindCacheIdInDatabase:()SQLRequests;
- (void)bindInFindCacheIdStatement:()SQLRequests database:startingAtIndex:gettingNextIndex:;
@end

@implementation QLCacheBasicFileIdentifier(SQLRequests)

+ (unint64_t)cacheIdFromRowId:()SQLRequests
{
  return a3 | 0x8000000000000000;
}

+ (uint64_t)rowIdFromCacheId:()SQLRequests
{
  return a3 & 0x7FFFFFFFFFFFFFFFLL;
}

+ (__CFString)tableName
{
  return @"basic_files";
}

+ (__CFString)queryStringToFindCacheIds
{
  return @"SELECT rowid, fileId, fsid, version FROM basic_files WHERE ";
}

+ (uint64_t)whereClauseToFindCacheId
{
  return [NSString stringWithFormat:@"fileId=?"];
}

- (void)bindInFindCacheIdStatement:()SQLRequests database:startingAtIndex:gettingNextIndex:
{
  id v10 = a4;
  objc_msgSend(v10, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(a1, "fileId"), a5, a3);

  if (a6) {
    *a6 = a5 + 1;
  }
}

- (uint64_t)statementToFindCacheIdInDatabase:()SQLRequests
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "prepareStatement:", "SELECT rowid, version FROM basic_files WHERE fileId=?");
  if (v5) {
    objc_msgSend(v4, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(a1, "fileId"), 1, v5);
  }

  return v5;
}

+ (uint64_t)removeFromDatabase:()SQLRequests fileWithCacheId:
{
  id v5 = a3;
  uint64_t v6 = [v5 prepareStatement:"DELETE FROM basic_files WHERE rowid=?"];
  uint64_t v10 = v6;
  if (v6)
  {
    uint64_t v7 = v6;
    [v5 bindUnsignedLongLong:a4 & 0x7FFFFFFFFFFFFFFFLL atIndex:1 inStatement:v6];
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