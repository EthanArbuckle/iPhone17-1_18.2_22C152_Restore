@interface TRISQLiteMAAutoAsset
+ (void)setPaths:(id)a3;
- (MAAutoAssetSelector)assetSelector;
- (NSString)description;
- (TRIFullMAAssetId)assetId;
- (TRISQLiteMAAutoAsset)initWithAssetId:(id)a3 decryptionKey:(id)a4 error:(id *)a5;
- (id)_sqliteMADatabase;
- (id)currentAssetSizeOnDiskUsingStatus:(id *)a3;
- (id)currentLocksSync:(id *)a3;
- (id)determineIfAvailableSync:(id)a3 withTimeout:(int64_t)a4 discoveredAttributes:(id *)a5 error:(id *)a6;
- (id)endLockUsageSync:(id)a3;
- (id)lockContentSync:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 lockedAssetSelector:(id *)a6 newerInProgress:(id *)a7 error:(id *)a8;
- (void)lockContent:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6;
- (void)lockContent:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7;
- (void)setAssetId:(id)a3;
- (void)setAssetSelector:(id)a3;
@end

@implementation TRISQLiteMAAutoAsset

- (TRISQLiteMAAutoAsset)initWithAssetId:(id)a3 decryptionKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)TRISQLiteMAAutoAsset;
  v10 = [(TRISQLiteMAAutoAsset *)&v19 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->assetId, a3);
    id v12 = objc_alloc(MEMORY[0x1E4F77FE0]);
    v13 = [v8 type];
    v14 = [v8 specifier];
    v15 = [v8 version];
    uint64_t v16 = [v12 initForAssetType:v13 withAssetSpecifier:v14 matchingAssetVersion:v15 usingDecryptionKey:v9];
    assetSelector = v11->assetSelector;
    v11->assetSelector = (MAAutoAssetSelector *)v16;
  }
  return v11;
}

- (void)lockContent:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6
{
}

- (void)lockContent:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7
{
  id v17 = 0;
  id v18 = 0;
  id v16 = 0;
  v11 = (void (**)(id, MAAutoAssetSelector *, BOOL, void *, id, id))a7;
  id v12 = [(TRISQLiteMAAutoAsset *)self lockContentSync:a3 withUsagePolicy:a4 withTimeout:a5 lockedAssetSelector:&v18 newerInProgress:&v17 error:&v16];
  id v13 = v18;
  id v14 = v17;
  id v15 = v16;
  v11[2](v11, self->assetSelector, v12 != 0, v12, v14, v15);
}

- (id)lockContentSync:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 lockedAssetSelector:(id *)a6 newerInProgress:(id *)a7 error:(id *)a8
{
  id v14 = a4;
  id v15 = a3;
  id v16 = [(TRISQLiteMAAutoAsset *)self _sqliteMADatabase];
  id v17 = [v16 lockContentSync:v15 forAssetSelector:self->assetSelector withUsagePolicy:v14 withTimeout:a5 lockedAssetSelector:a6 newerInProgress:a7 error:a8];

  return v17;
}

- (id)determineIfAvailableSync:(id)a3 withTimeout:(int64_t)a4 discoveredAttributes:(id *)a5 error:(id *)a6
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = [(TRISQLiteMAAutoAsset *)self _sqliteMADatabase];
  uint64_t v9 = [v8 assetSizeForSelector:self->assetSelector];

  if (a5)
  {
    uint64_t v15 = *MEMORY[0x1E4F77F28];
    v10 = [NSNumber numberWithUnsignedLongLong:v9];
    v16[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

    id v12 = v11;
    *a5 = v12;
  }
  assetSelector = self->assetSelector;
  return assetSelector;
}

- (id)currentLocksSync:(id *)a3
{
  v4 = [(TRISQLiteMAAutoAsset *)self _sqliteMADatabase];
  v5 = [v4 locksForSelector:self->assetSelector];

  return v5;
}

- (id)endLockUsageSync:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(TRISQLiteMAAutoAsset *)self _sqliteMADatabase];
    [v5 endAllPreviousLocksOfReasonSync:v4 forAssetSelector:self->assetSelector];
  }
  return 0;
}

- (id)currentAssetSizeOnDiskUsingStatus:(id *)a3
{
  id v4 = NSNumber;
  v5 = [(TRISQLiteMAAutoAsset *)self _sqliteMADatabase];
  v6 = objc_msgSend(v4, "numberWithLong:", objc_msgSend(v5, "assetSizeForSelector:", self->assetSelector));

  return v6;
}

- (id)_sqliteMADatabase
{
  db = self->_db;
  if (!db)
  {
    if (sqliteMADatabasePaths)
    {
      id v5 = (id)sqliteMADatabasePaths;
    }
    else
    {
      id v5 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
    }
    v6 = v5;
    v7 = [v5 trialRootDir];
    id v8 = [v7 stringByAppendingPathComponent:@"MASQLiteMock"];

    uint64_t v9 = [v8 stringByAppendingPathComponent:@"Database"];
    v10 = [[TRISQLiteMADatabase alloc] initWithParentDir:v9];
    if (!v10)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"TRIMAProviding.m", 139, @"Expression was unexpectedly nil/false: %@", @"[[TRISQLiteMADatabase alloc] initWithParentDir:parentDir]" object file lineNumber description];
    }
    v11 = self->_db;
    self->_db = v10;

    db = self->_db;
  }
  return db;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  assetId = self->assetId;
  if (!assetId) {
    assetId = (TRIFullMAAssetId *)@"no asset id";
  }
  id v5 = (void *)[v3 initWithFormat:@"<TRISQLiteMAAutoAsset | id:%@>", assetId];
  return (NSString *)v5;
}

+ (void)setPaths:(id)a3
{
}

- (TRIFullMAAssetId)assetId
{
  return self->assetId;
}

- (void)setAssetId:(id)a3
{
}

- (MAAutoAssetSelector)assetSelector
{
  return self->assetSelector;
}

- (void)setAssetSelector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->assetSelector, 0);
  objc_storeStrong((id *)&self->assetId, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end