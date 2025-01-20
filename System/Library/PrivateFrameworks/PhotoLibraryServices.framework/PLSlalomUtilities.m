@interface PLSlalomUtilities
+ (double)durationForBaseDuration:(double)a3 videoAdjustments:(id)a4;
+ (double)durationForManagedAsset:(id)a3 applyVideoAdjustments:(BOOL)a4;
+ (id)synchronouslyFetchVideoAdjustmentsFromManagedAsset:(id)a3;
+ (id)videoAVObjectBuilderForManagedAsset:(id)a3 applyVideoAdjustments:(BOOL)a4;
@end

@implementation PLSlalomUtilities

+ (double)durationForBaseDuration:(double)a3 videoAdjustments:(id)a4
{
  if (a4)
  {
    v5 = (void *)MEMORY[0x1E4F8CDA0];
    id v6 = a4;
    [v6 slowMotionRate];
    int v8 = v7;
    [v6 slowMotionTimeRange];

    LODWORD(v9) = v8;
    v10 = [v5 timeRangeMapperForSourceDuration:&v15 slowMotionRate:1 slowMotionTimeRange:a3 forExport:v9];
    v12 = v10;
    if (v10)
    {
      *(float *)&double v11 = a3;
      [v10 scaledTimeForOriginalTime:v11];
      a3 = v13;
    }
  }
  return a3;
}

+ (double)durationForManagedAsset:(id)a3 applyVideoAdjustments:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 duration];
  double v8 = v7;
  if (v4 && [v6 isDefaultAdjustedSlomo])
  {
    double v9 = [a1 synchronouslyFetchVideoAdjustmentsFromManagedAsset:v6];
    [a1 durationForBaseDuration:v9 videoAdjustments:v8];
    double v8 = v10;
  }
  return v8;
}

+ (id)videoAVObjectBuilderForManagedAsset:(id)a3 applyVideoAdjustments:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v8 = [v6 pathForFullsizeRenderVideoFile];
  double v9 = (void *)v8;
  if (v4 && v8 && [v7 fileExistsAtPath:v8])
  {
    double v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9 isDirectory:0];
    double v11 = 0;
    goto LABEL_14;
  }
  v12 = [v6 pathForOriginalFile];
  if (![v7 fileExistsAtPath:v12] || (objc_msgSend(v6, "isPlayableVideo:", 0) & 1) == 0)
  {
    id v13 = [v6 pathForMediumVideoFile];
LABEL_11:
    double v11 = 0;
    if (!v13) {
      goto LABEL_9;
    }
LABEL_12:
    double v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:0];
    goto LABEL_13;
  }
  id v13 = v12;
  if (!v4) {
    goto LABEL_11;
  }
  double v11 = [a1 synchronouslyFetchVideoAdjustmentsFromManagedAsset:v6];
  if (v13) {
    goto LABEL_12;
  }
LABEL_9:
  double v10 = 0;
LABEL_13:

LABEL_14:
  v14 = [MEMORY[0x1E4F166C8] assetWithURL:v10];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F8CE00]) initWithVideoAsset:v14 videoAdjustments:v11];

  return v15;
}

+ (id)synchronouslyFetchVideoAdjustmentsFromManagedAsset:(id)a3
{
  id v3 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__74440;
  v20 = __Block_byref_object_dispose__74441;
  id v21 = 0;
  if ([v3 isDefaultAdjustedSlomo])
  {
    if (PLIsAssetsd())
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __72__PLSlalomUtilities_synchronouslyFetchVideoAdjustmentsFromManagedAsset___block_invoke;
      v15[3] = &unk_1E586EC70;
      v15[4] = &v16;
      [v3 synchronouslyFetchAdjustmentDataWithCompletionHandler:v15];
    }
    else
    {
      dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
      v5 = [v3 photoLibrary];
      id v6 = [v5 assetsdClient];

      double v7 = [v6 resourceClient];
      uint64_t v8 = [v3 objectID];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __72__PLSlalomUtilities_synchronouslyFetchVideoAdjustmentsFromManagedAsset___block_invoke_2;
      v12[3] = &unk_1E586EC98;
      v14 = &v16;
      double v9 = v4;
      id v13 = v9;
      [v7 adjustmentDataForAsset:v8 networkAccessAllowed:0 trackCPLDownload:0 completionHandler:v12];

      dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  id v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

void __72__PLSlalomUtilities_synchronouslyFetchVideoAdjustmentsFromManagedAsset___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6)
  {
    id v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a6 isDirectory:0];
  }
  else
  {
    id v10 = 0;
  }
  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F8CE18]) initWithURL:v10];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  double v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

intptr_t __72__PLSlalomUtilities_synchronouslyFetchVideoAdjustmentsFromManagedAsset___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v10 = a6;
  id v11 = a3;
  id v12 = a2;
  int64_t v13 = +[PLManagedAsset pfAdjustmentsBaseVersionFromAdjustmentBaseVersion:a5];
  uint64_t v14 = [objc_alloc(MEMORY[0x1E4F8CE18]) initWithFormatIdentifier:v12 formatVersion:v11 data:v10 baseVersion:v13 editorBundleID:0 renderTypes:0];

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  v17 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v17);
}

@end