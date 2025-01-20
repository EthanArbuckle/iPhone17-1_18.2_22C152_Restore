@interface PLComputeSyncAttributes
+ (BOOL)resetLocalComputeSyncAttributesForAsset:(id)a3;
+ (BOOL)updateCloudComputeSyncAttributesForAsset:(id)a3 cloudVersion:(id)a4 cloudAdjustmentFingerprint:(id)a5 cloudLastUpdatedDate:(id)a6;
+ (BOOL)updateLocalComputeSyncAttributesForAsset:(id)a3 cloudRecordComputeState:(id)a4 originatedFromPrefetch:(BOOL)a5;
+ (id)_computeSyncAttributesForAsset:(id)a3;
+ (id)entityName;
+ (void)updateLocalComputeSyncStageAfterProcessingForAsset:(id)a3 stage:(signed __int16)a4;
- (BOOL)hasValidLocalProperties;
- (BOOL)isSyncableChange;
- (BOOL)supportsCloudUpload;
- (void)_updateLocalAnalysisStageHistoryWithStage:(signed __int16)a3 changeSource:(signed __int16)a4;
@end

@implementation PLComputeSyncAttributes

- (void)_updateLocalAnalysisStageHistoryWithStage:(signed __int16)a3 changeSource:(signed __int16)a4
{
  int v4 = a4;
  int v5 = a3;
  uint64_t v7 = [(PLComputeSyncAttributes *)self localAnalysisStageHistory];
  uint64_t v8 = v7;
  if (v5 <= 199)
  {
    if (!v5) {
      return;
    }
    uint64_t v12 = v7 | 4;
    uint64_t v13 = v7 | 2;
    uint64_t v14 = v7 | 1;
    if (v4) {
      uint64_t v14 = v7;
    }
    if (v4 != 1) {
      uint64_t v13 = v14;
    }
    if (v4 != 2) {
      uint64_t v12 = v13;
    }
    if (v5 == 100) {
      uint64_t v8 = v12;
    }
  }
  else
  {
    if (v5 == 200)
    {
      uint64_t v9 = v7 | 0x20;
      uint64_t v10 = v7 | 0x10;
      uint64_t v11 = v7 | 8;
      goto LABEL_17;
    }
    if (v5 == 900 || v5 == 950)
    {
      uint64_t v9 = v7 | 0x100;
      uint64_t v10 = v7 | 0x80;
      uint64_t v11 = v7 | 0x40;
LABEL_17:
      if (v4) {
        uint64_t v11 = v7;
      }
      if (v4 != 1) {
        uint64_t v10 = v11;
      }
      if (v4 == 2) {
        uint64_t v8 = v9;
      }
      else {
        uint64_t v8 = v10;
      }
    }
  }
  [(PLComputeSyncAttributes *)self setLocalAnalysisStageHistory:v8];
}

- (BOOL)hasValidLocalProperties
{
  return (int)[(PLComputeSyncAttributes *)self localAnalysisMajorVersion] >= 1
      && (int)[(PLComputeSyncAttributes *)self localAnalysisStage] > 0;
}

- (BOOL)isSyncableChange
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(PLComputeSyncAttributes *)self changedValues];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v16[0] = @"localAnalysisMajorVersion";
  v16[1] = @"localAnalysisStage";
  int v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v16, 2, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [v3 objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * i)];

        if (v9 && [(PLComputeSyncAttributes *)self hasValidLocalProperties])
        {
          BOOL v10 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_12:

  return v10;
}

- (BOOL)supportsCloudUpload
{
  v3 = [(PLComputeSyncAttributes *)self asset];
  if ([v3 supportsCloudUpload])
  {
    int v4 = [(PLComputeSyncAttributes *)self asset];
    char v5 = [v4 shouldPushComputeSync];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)resetLocalComputeSyncAttributesForAsset:(id)a3
{
  v3 = [a1 _computeSyncAttributesForAsset:a3];
  [v3 setLocalAnalysisMajorVersion:0];
  [v3 setLocalAnalysisStage:0];
  [v3 setLocalAnalysisStageHistory:0];

  return 1;
}

+ (BOOL)updateLocalComputeSyncAttributesForAsset:(id)a3 cloudRecordComputeState:(id)a4 originatedFromPrefetch:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [v9 version];
  uint64_t v11 = [v9 adjustmentFingerprint];
  long long v12 = [v9 lastUpdatedDate];
  int v13 = [a1 updateCloudComputeSyncAttributesForAsset:v8 cloudVersion:v10 cloudAdjustmentFingerprint:v11 cloudLastUpdatedDate:v12];

  if (v13)
  {
    long long v14 = [a1 _computeSyncAttributesForAsset:v8];
    id v15 = objc_alloc(MEMORY[0x1E4F59928]);
    v16 = [v9 version];
    v17 = (void *)[v15 initWithString:v16];

    LODWORD(v16) = [v14 localAnalysisStage];
    objc_msgSend(v14, "setLocalAnalysisMajorVersion:", (__int16)objc_msgSend(v17, "majorVersion"));
    objc_msgSend(v14, "setLocalAnalysisStage:", (__int16)objc_msgSend(v17, "stage"));
    if (v16 != [v14 localAnalysisStage]) {
      objc_msgSend(v14, "_updateLocalAnalysisStageHistoryWithStage:changeSource:", objc_msgSend(v14, "localAnalysisStage"), !v5);
    }
  }
  return v13;
}

+ (BOOL)updateCloudComputeSyncAttributesForAsset:(id)a3 cloudVersion:(id)a4 cloudAdjustmentFingerprint:(id)a5 cloudLastUpdatedDate:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  int v13 = [a1 _computeSyncAttributesForAsset:a3];
  long long v14 = (void *)[objc_alloc(MEMORY[0x1E4F59928]) initWithString:v10];
  uint64_t v15 = [v14 majorVersion];
  if (v15)
  {
    [v13 setCloudComputeStateVersion:v10];
    [v13 setCloudComputeStateAdjustmentFingerprint:v11];
    [v13 setCloudComputeStateLastUpdatedDate:v12];
  }

  return v15 != 0;
}

+ (void)updateLocalComputeSyncStageAfterProcessingForAsset:(id)a3 stage:(signed __int16)a4
{
  uint64_t v4 = a4;
  id v6 = [a1 _computeSyncAttributesForAsset:a3];
  int v5 = [v6 localAnalysisStage];
  [v6 setLocalAnalysisMajorVersion:1];
  [v6 setLocalAnalysisStage:v4];
  if (v5 != [v6 localAnalysisStage]) {
    objc_msgSend(v6, "_updateLocalAnalysisStageHistoryWithStage:changeSource:", objc_msgSend(v6, "localAnalysisStage"), 2);
  }
}

+ (id)_computeSyncAttributesForAsset:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 computeSyncAttributes];
  if (!v4)
  {
    int v5 = [v3 managedObjectContext];
    id v6 = +[PLComputeSyncAttributes entityName];
    uint64_t v4 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v6, (uint64_t)v5, 0);

    [v4 setAsset:v3];
  }

  return v4;
}

+ (id)entityName
{
  return @"ComputeSyncAttributes";
}

@end