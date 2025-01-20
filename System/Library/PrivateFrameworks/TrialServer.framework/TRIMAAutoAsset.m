@interface TRIMAAutoAsset
- (MAAutoAssetSelector)assetSelector;
- (NSString)description;
- (TRIFullMAAssetId)assetId;
- (TRIMAAutoAsset)initWithAssetId:(id)a3 decryptionKey:(id)a4 error:(id *)a5;
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

@implementation TRIMAAutoAsset

- (TRIMAAutoAsset)initWithAssetId:(id)a3 decryptionKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)TRIMAAutoAsset;
  v10 = [(TRIMAAutoAsset *)&v27 init];
  v11 = v10;
  if (!v10) {
    goto LABEL_4;
  }
  [(TRIMAAutoAsset *)v10 setAssetId:v8];
  id v12 = objc_alloc(MEMORY[0x1E4F77FE0]);
  v13 = [v8 type];
  v14 = [v8 specifier];
  v15 = [v8 version];
  v16 = (void *)[v12 initForAssetType:v13 withAssetSpecifier:v14 matchingAssetVersion:v15 usingDecryptionKey:v9];
  [(TRIMAAutoAsset *)v11 setAssetSelector:v16];

  id v17 = objc_alloc(MEMORY[0x1E4F77FC8]);
  uint64_t v18 = *MEMORY[0x1E4FB04F0];
  assetSelector = v11->assetSelector;
  id v26 = 0;
  uint64_t v20 = [v17 initForClientName:v18 selectingAsset:assetSelector error:&v26];
  id v21 = v26;
  id v22 = v26;
  autoAsset = v11->_autoAsset;
  v11->_autoAsset = (MAAutoAsset *)v20;

  if (v11->_autoAsset)
  {

LABEL_4:
    v24 = v11;
    goto LABEL_8;
  }
  if (a5) {
    objc_storeStrong(a5, v21);
  }

  v24 = 0;
LABEL_8:

  return v24;
}

- (void)lockContent:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6
{
}

- (void)lockContent:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7
{
}

- (id)lockContentSync:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 lockedAssetSelector:(id *)a6 newerInProgress:(id *)a7 error:(id *)a8
{
  return (id)[(MAAutoAsset *)self->_autoAsset lockContentSync:a3 withUsagePolicy:a4 withTimeout:a5 lockedAssetSelector:a6 newerInProgress:a7 error:a8];
}

- (id)determineIfAvailableSync:(id)a3 withTimeout:(int64_t)a4 discoveredAttributes:(id *)a5 error:(id *)a6
{
  return (id)[(MAAutoAsset *)self->_autoAsset determineIfAvailableSync:a3 withTimeout:a4 discoveredAttributes:a5 error:a6];
}

- (id)endLockUsageSync:(id)a3
{
  return (id)[(MAAutoAsset *)self->_autoAsset endLockUsageSync:a3];
}

- (id)currentLocksSync:(id *)a3
{
  v5 = objc_opt_new();
  v6 = [(MAAutoAsset *)self->_autoAsset currentStatusSync:a3];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 currentLockUsage];
    id v9 = (void *)v8;
    if (v8) {
      v10 = (void *)v8;
    }
    else {
      v10 = v5;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = v5;
  }

  return v11;
}

- (id)currentAssetSizeOnDiskUsingStatus:(id *)a3
{
  v3 = [(MAAutoAsset *)self->_autoAsset currentStatusSync:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 availableForUseAttributes];
    v6 = [v5 valueForKey:@"_UnarchivedSize"];
  }
  else
  {
    v6 = [NSNumber numberWithInt:0];
  }

  return v6;
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRIMAAutoAsset | selector:%@ autoAsset:%@>", self->assetSelector, self->_autoAsset];
  return (NSString *)v2;
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
  objc_storeStrong((id *)&self->_autoAsset, 0);
}

@end