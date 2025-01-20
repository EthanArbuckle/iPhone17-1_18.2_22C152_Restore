@interface SSDatabaseCacheEntry
+ (id)allPropertyKeys;
+ (id)databaseTable;
+ (unint64_t)_fetchPersistentID:(id)a3 inDatabase:(id)a4;
- (SSDatabaseCacheEntry)initWithLookupKey:(id)a3 inDatabase:(id)a4;
- (id)dataBlob:(BOOL *)a3;
- (id)description;
- (void)dealloc;
- (void)setPersistentCache:(id)a3;
@end

@implementation SSDatabaseCacheEntry

- (SSDatabaseCacheEntry)initWithLookupKey:(id)a3 inDatabase:(id)a4
{
  uint64_t v6 = [(id)objc_opt_class() _fetchPersistentID:a3 inDatabase:a4];
  if (v6)
  {
    return [(SSSQLiteEntity *)self initWithPersistentID:v6 inDatabase:a4];
  }
  else
  {

    return 0;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSDatabaseCacheEntry;
  [(SSDatabaseCacheEntry *)&v3 dealloc];
}

- (void)setPersistentCache:(id)a3
{
  persistentCache = self->_persistentCache;
  if (persistentCache != a3)
  {

    self->_persistentCache = (SSPersistentCache *)a3;
  }
}

- (id)dataBlob:(BOOL *)a3
{
  v13[5] = *MEMORY[0x1E4F143B8];
  id result = [(SSSQLiteEntity *)self persistentID];
  if (result)
  {
    v13[0] = SSDatabaseCacheEntryLookupKey[0];
    v13[1] = SSDatabaseCacheEntryDataBlob[0];
    v13[2] = SSDatabaseCacheEntryDataBlobSize;
    v13[3] = SSDatabaseCacheEntryDateExpired;
    v13[4] = SSDatabaseCacheEntryDateRetired;
    [(SSSQLiteEntity *)self getValues:&v9 forProperties:v13 count:5];
    id result = (id)[v9 length];
    if (result)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      uint64_t v7 = (uint64_t)v6;
      if ([v12 longLongValue] <= (uint64_t)v6)
      {
        if (a3) {
          *a3 = 1;
        }
        [(SSSQLiteEntity *)self deleteFromDatabase];
        return 0;
      }
      else
      {
        uint64_t v8 = [v11 longLongValue];
        if (a3) {
          *a3 = v8 <= v7;
        }
        id result = v10;
        if (!v10) {
          return [(SSPersistentCache *)self->_persistentCache dataForKey:v9];
        }
      }
    }
  }
  return result;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ : %p> - Persistent ID: %llu", objc_opt_class(), self, -[SSSQLiteEntity persistentID](self, "persistentID")];
}

+ (unint64_t)_fetchPersistentID:(id)a3 inDatabase:(id)a4
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  if ([a3 length])
  {
    id v6 = [NSString alloc];
    uint64_t v7 = objc_msgSend(v6, "initWithFormat:", @"SELECT %@ FROM %@ WHERE %@ = ? LIMIT 1;",
                   SSDatabaseCacheEntryPID,
                   [(id)objc_opt_class() databaseTable],
                   SSDatabaseCacheEntryLookupKey[0]);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__SSDatabaseCacheEntry__fetchPersistentID_inDatabase___block_invoke;
    v10[3] = &unk_1E5BACE08;
    v10[4] = a3;
    v10[5] = a4;
    v10[6] = &v11;
    [a4 prepareStatementForSQL:v7 cache:1 usingBlock:v10];
  }
  unint64_t v8 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __54__SSDatabaseCacheEntry__fetchPersistentID_inDatabase___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_text(a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
  uint64_t result = [*(id *)(a1 + 40) statementHasRowAfterStepping:a2];
  if (result)
  {
    uint64_t result = sqlite3_column_type(a2, 0);
    if (result == 1)
    {
      uint64_t result = sqlite3_column_int64(a2, 0);
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
    }
  }
  return result;
}

+ (id)databaseTable
{
  return @"database_cache";
}

+ (id)allPropertyKeys
{
  if (allPropertyKeys_onceToken_1 != -1) {
    dispatch_once(&allPropertyKeys_onceToken_1, &__block_literal_global_37);
  }
  return (id)allPropertyKeys__allProperties;
}

id __39__SSDatabaseCacheEntry_allPropertyKeys__block_invoke()
{
  v1[8] = *MEMORY[0x1E4F143B8];
  v1[0] = SSDatabaseCacheEntryPID;
  v1[1] = SSDatabaseCacheEntryLookupKey[0];
  v1[2] = SSDatabaseCacheEntryDataBlob[0];
  v1[3] = SSDatabaseCacheEntryDataBlobSize;
  v1[4] = SSDatabaseCacheEntryDateInserted;
  v1[5] = SSDatabaseCacheEntryDateExpired;
  v1[6] = SSDatabaseCacheEntryDateRetired;
  v1[7] = SSDatabaseCacheEntryUserInfo;
  id result = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v1 count:8];
  allPropertyKeys__allProperties = (uint64_t)result;
  return result;
}

@end