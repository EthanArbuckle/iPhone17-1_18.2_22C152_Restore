@interface PLAssetSharingUtilities
+ (CGImage)_thumbnailForAssetURL:(id)a3 library:(id)a4 useAspect:(BOOL)a5;
+ (CGImage)aspectRatioThumbnailForAssetURL:(id)a3 library:(id)a4;
+ (CGImage)thumbnailForAssetURL:(id)a3 library:(id)a4;
+ (double)_durationForVideoAssetURL:(id)a3 library:(id)a4;
+ (double)_durationForVideoFilePath:(id)a3;
+ (id)_objectBuilderFromVideoFilePath:(id)a3 metadata:(id)a4;
+ (id)_playerItemForVideoAssetURL:(id)a3 library:(id)a4;
+ (id)assetForVideoURL:(id)a3 metadata:(id)a4 library:(id)a5 outAudioMix:(id *)a6 outVideoComposition:(id *)a7;
+ (id)exportSessionForVideoFilePath:(id)a3 metadata:(id)a4 exportPreset:(id)a5;
+ (id)exportSessionForVideoURL:(id)a3 library:(id)a4 fallbackFilePath:(id)a5 exportPreset:(id)a6;
+ (id)filePathForVideoURL:(id)a3 library:(id)a4 outMetadata:(id *)a5;
+ (id)playerItemForVideoFilePath:(id)a3 metadata:(id)a4;
+ (id)playerItemForVideoURL:(id)a3 fallbackFilePath:(id)a4 library:(id)a5;
+ (int64_t)_estimatedOutputFileLengthForDuration:(double)a3 exportPreset:(id)a4 exportProperties:(id)a5;
+ (int64_t)estimatedOutputFileLengthForVideoFilePath:(id)a3 metadata:(id)a4 exportPreset:(id)a5 exportProperties:(id)a6;
+ (int64_t)estimatedOutputFileLengthForVideoURL:(id)a3 library:(id)a4 fallbackFilePath:(id)a5 exportPreset:(id)a6 exportProperties:(id)a7;
@end

@implementation PLAssetSharingUtilities

+ (id)assetForVideoURL:(id)a3 metadata:(id)a4 library:(id)a5 outAudioMix:(id *)a6 outVideoComposition:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__34711;
  v42 = __Block_byref_object_dispose__34712;
  id v43 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__34711;
  v36 = __Block_byref_object_dispose__34712;
  id v37 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__34711;
  v30 = __Block_byref_object_dispose__34712;
  id v31 = 0;
  if (([v12 isFileURL] & 1) == 0)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __93__PLAssetSharingUtilities_assetForVideoURL_metadata_library_outAudioMix_outVideoComposition___block_invoke;
    v20[3] = &unk_1E58696E0;
    id v21 = v14;
    id v22 = v12;
    v23 = &v38;
    v24 = &v32;
    v25 = &v26;
    [v21 performBlockAndWait:v20 completionHandler:0];
  }
  if (!v39[5] && [v12 isFileURL])
  {
    v15 = [v12 path];
    v16 = [a1 _objectBuilderFromVideoFilePath:v15 metadata:v13];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __93__PLAssetSharingUtilities_assetForVideoURL_metadata_library_outAudioMix_outVideoComposition___block_invoke_3;
    v19[3] = &unk_1E5868D70;
    v19[4] = &v38;
    v19[5] = &v32;
    v19[6] = &v26;
    [v16 requestAVAssetWithResultHandler:v19];
  }
  if (a6) {
    *a6 = (id) v33[5];
  }
  if (a7) {
    *a7 = (id) v27[5];
  }
  id v17 = (id)v39[5];
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v17;
}

void __93__PLAssetSharingUtilities_assetForVideoURL_metadata_library_outAudioMix_outVideoComposition___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) photoFromAssetURL:*(void *)(a1 + 40)];
  if (v2)
  {
    v3 = +[PLSlalomUtilities videoAVObjectBuilderForManagedAsset:v2 applyVideoAdjustments:1];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __93__PLAssetSharingUtilities_assetForVideoURL_metadata_library_outAudioMix_outVideoComposition___block_invoke_2;
    v4[3] = &unk_1E5868D70;
    long long v5 = *(_OWORD *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 64);
    [v3 requestAVAssetWithResultHandler:v4];
  }
}

void __93__PLAssetSharingUtilities_assetForVideoURL_metadata_library_outAudioMix_outVideoComposition___block_invoke_3(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1[4] + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v17 = v7;

  uint64_t v12 = *(void *)(a1[5] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
}

void __93__PLAssetSharingUtilities_assetForVideoURL_metadata_library_outAudioMix_outVideoComposition___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1[4] + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v17 = v7;

  uint64_t v12 = *(void *)(a1[5] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
}

+ (id)playerItemForVideoFilePath:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__34711;
  v18 = __Block_byref_object_dispose__34712;
  id v19 = 0;
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v9 = [v8 fileExistsAtPath:v6];

  if (v9)
  {
    uint64_t v10 = [a1 _objectBuilderFromVideoFilePath:v6 metadata:v7];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__PLAssetSharingUtilities_playerItemForVideoFilePath_metadata___block_invoke;
    v13[3] = &unk_1E5868D48;
    v13[4] = &v14;
    [v10 requestPlayerItemWithResultHandler:v13];
  }
  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __63__PLAssetSharingUtilities_playerItemForVideoFilePath_metadata___block_invoke(uint64_t a1, void *a2)
{
}

+ (id)_playerItemForVideoAssetURL:(id)a3 library:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__34711;
  id v19 = __Block_byref_object_dispose__34712;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__PLAssetSharingUtilities__playerItemForVideoAssetURL_library___block_invoke;
  v11[3] = &unk_1E5875340;
  id v7 = v6;
  id v12 = v7;
  id v8 = v5;
  id v13 = v8;
  uint64_t v14 = &v15;
  [v7 performBlockAndWait:v11 completionHandler:0];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __63__PLAssetSharingUtilities__playerItemForVideoAssetURL_library___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) photoFromAssetURL:*(void *)(a1 + 40)];
  if ([v2 isVideo])
  {
    v3 = +[PLSlalomUtilities videoAVObjectBuilderForManagedAsset:v2 applyVideoAdjustments:1];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __63__PLAssetSharingUtilities__playerItemForVideoAssetURL_library___block_invoke_2;
    v4[3] = &unk_1E5868D48;
    void v4[4] = *(void *)(a1 + 48);
    [v3 requestPlayerItemWithResultHandler:v4];
  }
}

void __63__PLAssetSharingUtilities__playerItemForVideoAssetURL_library___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (id)playerItemForVideoURL:(id)a3 fallbackFilePath:(id)a4 library:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v8 isFileURL] & 1) != 0
    || (!v10
      ? (+[PLPhotoLibrary assetsLibraryPhotoLibrary],
         id v11 = (id)objc_claimAutoreleasedReturnValue())
      : (id v11 = v10),
        id v12 = v11,
        [a1 _playerItemForVideoAssetURL:v8 library:v11],
        id v13 = objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
    if (![v8 isFileURL]
      || ([v8 path],
          uint64_t v14 = objc_claimAutoreleasedReturnValue(),
          [a1 playerItemForVideoFilePath:v14 metadata:0],
          id v13 = objc_claimAutoreleasedReturnValue(),
          v14,
          !v13))
    {
      id v13 = [a1 playerItemForVideoFilePath:v9 metadata:0];
    }
  }

  return v13;
}

+ (id)exportSessionForVideoFilePath:(id)a3 metadata:(id)a4 exportPreset:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__34711;
  id v21 = __Block_byref_object_dispose__34712;
  id v22 = 0;
  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v12 = [v11 fileExistsAtPath:v8];

  if (v12)
  {
    id v13 = [a1 _objectBuilderFromVideoFilePath:v8 metadata:v9];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __79__PLAssetSharingUtilities_exportSessionForVideoFilePath_metadata_exportPreset___block_invoke;
    v16[3] = &unk_1E5875398;
    v16[4] = &v17;
    [v13 requestExportSessionWithExportPreset:v10 resultHandler:v16];
  }
  id v14 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v14;
}

void __79__PLAssetSharingUtilities_exportSessionForVideoFilePath_metadata_exportPreset___block_invoke(uint64_t a1, void *a2)
{
}

+ (id)exportSessionForVideoURL:(id)a3 library:(id)a4 fallbackFilePath:(id)a5 exportPreset:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__34711;
  id v31 = __Block_byref_object_dispose__34712;
  id v32 = 0;
  if (([v10 isFileURL] & 1) == 0)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __90__PLAssetSharingUtilities_exportSessionForVideoURL_library_fallbackFilePath_exportPreset___block_invoke;
    v22[3] = &unk_1E5875368;
    id v23 = v11;
    id v24 = v10;
    id v25 = v13;
    uint64_t v26 = &v27;
    [v23 performBlockAndWait:v22 completionHandler:0];
  }
  if (!v28[5] && [v10 isFileURL])
  {
    id v14 = [v10 path];
    uint64_t v15 = [a1 exportSessionForVideoFilePath:v14 metadata:0 exportPreset:v13];
    uint64_t v16 = (void *)v28[5];
    v28[5] = v15;
  }
  uint64_t v17 = (void *)v28[5];
  if (!v17)
  {
    uint64_t v18 = [a1 exportSessionForVideoFilePath:v12 metadata:0 exportPreset:v13];
    uint64_t v19 = (void *)v28[5];
    v28[5] = v18;

    uint64_t v17 = (void *)v28[5];
  }
  id v20 = v17;
  _Block_object_dispose(&v27, 8);

  return v20;
}

void __90__PLAssetSharingUtilities_exportSessionForVideoURL_library_fallbackFilePath_exportPreset___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) photoFromAssetURL:*(void *)(a1 + 40)];
  if (v2)
  {
    v3 = +[PLSlalomUtilities videoAVObjectBuilderForManagedAsset:v2 applyVideoAdjustments:1];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __90__PLAssetSharingUtilities_exportSessionForVideoURL_library_fallbackFilePath_exportPreset___block_invoke_2;
    v5[3] = &unk_1E5875398;
    uint64_t v4 = *(void *)(a1 + 48);
    v5[4] = *(void *)(a1 + 56);
    [v3 requestExportSessionWithExportPreset:v4 resultHandler:v5];
  }
}

void __90__PLAssetSharingUtilities_exportSessionForVideoURL_library_fallbackFilePath_exportPreset___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (id)_objectBuilderFromVideoFilePath:(id)a3 metadata:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    a3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3 isDirectory:0];
  }
  id v6 = [MEMORY[0x1E4F166C8] assetWithURL:a3];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F8CE18]) initWithPropertyListDictionary:v5];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F8CE00]) initWithVideoAsset:v6 videoAdjustments:v7];

  return v8;
}

+ (int64_t)_estimatedOutputFileLengthForDuration:(double)a3 exportPreset:(id)a4 exportProperties:(id)a5
{
  if (a3 <= 0.0) {
    return 0;
  }
  id v7 = (void *)MEMORY[0x1E4F8CDA0];
  id v8 = a5;
  id v9 = a4;
  memset(&v13, 0, sizeof(v13));
  CMTimeMakeWithSeconds(&v13, a3, [v7 preferredTimeScale]);
  CMTime v12 = v13;
  int64_t v10 = [MEMORY[0x1E4F16360] estimatedOutputFileLengthForPreset:v9 duration:&v12 properties:v8];

  return v10;
}

+ (double)_durationForVideoFilePath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3];

  double Seconds = 0.0;
  if (v5)
  {
    id v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:0];
    id v8 = [MEMORY[0x1E4F166C8] assetWithURL:v7];
    id v9 = v8;
    if (v8) {
      [v8 duration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);
  }
  return Seconds;
}

+ (double)_durationForVideoAssetURL:(id)a3 library:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = (double *)&v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__PLAssetSharingUtilities__durationForVideoAssetURL_library___block_invoke;
  v11[3] = &unk_1E5875340;
  id v7 = v6;
  id v12 = v7;
  id v8 = v5;
  id v13 = v8;
  id v14 = &v15;
  [v7 performBlockAndWait:v11 completionHandler:0];
  double v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __61__PLAssetSharingUtilities__durationForVideoAssetURL_library___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) photoFromAssetURL:*(void *)(a1 + 40)];
  if ([v3 isVideo])
  {
    +[PLSlalomUtilities durationForManagedAsset:v3 applyVideoAdjustments:1];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2;
  }
}

+ (int64_t)estimatedOutputFileLengthForVideoFilePath:(id)a3 metadata:(id)a4 exportPreset:(id)a5 exportProperties:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [a1 _durationForVideoFilePath:a3];
  double v14 = v13;
  if (v13 > 0.0)
  {
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F8CE18]) initWithPropertyListDictionary:v10];
    +[PLSlalomUtilities durationForBaseDuration:v15 videoAdjustments:v14];
    double v14 = v16;
  }
  int64_t v17 = [a1 _estimatedOutputFileLengthForDuration:v11 exportPreset:v12 exportProperties:v14];

  return v17;
}

+ (int64_t)estimatedOutputFileLengthForVideoURL:(id)a3 library:(id)a4 fallbackFilePath:(id)a5 exportPreset:(id)a6 exportProperties:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  double v17 = 0.0;
  if (([v12 isFileURL] & 1) != 0
    || ([a1 _durationForVideoAssetURL:v12 library:v13], double v17 = v18, v18 == 0.0))
  {
    if ([v12 isFileURL])
    {
      uint64_t v19 = [v12 path];
      [a1 _durationForVideoFilePath:v19];
      double v17 = v20;
    }
  }
  if (v17 == 0.0)
  {
    [a1 _durationForVideoFilePath:v14];
    double v17 = v21;
  }
  int64_t v22 = [a1 _estimatedOutputFileLengthForDuration:v15 exportPreset:v16 exportProperties:v17];

  return v22;
}

+ (id)filePathForVideoURL:(id)a3 library:(id)a4 outMetadata:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__34711;
  uint64_t v29 = __Block_byref_object_dispose__34712;
  id v30 = 0;
  uint64_t v19 = 0;
  double v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int64_t v22 = __Block_byref_object_copy__34711;
  id v23 = __Block_byref_object_dispose__34712;
  id v24 = 0;
  if ([v7 isFileURL])
  {
    uint64_t v9 = [v7 path];
    id v10 = (id)v26[5];
    v26[5] = v9;
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__PLAssetSharingUtilities_filePathForVideoURL_library_outMetadata___block_invoke;
    v13[3] = &unk_1E586C338;
    id v14 = v8;
    id v15 = v7;
    id v16 = &v25;
    double v17 = &v19;
    double v18 = a5;
    [v14 performBlockAndWait:v13 completionHandler:0];

    id v10 = v14;
  }

  if (a5) {
    *a5 = (id) v20[5];
  }
  id v11 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v11;
}

void __67__PLAssetSharingUtilities_filePathForVideoURL_library_outMetadata___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) photoFromAssetURL:*(void *)(a1 + 40)];
  if ([v9 isVideo])
  {
    uint64_t v2 = [v9 pathForOriginalFile];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    if (*(void *)(a1 + 64))
    {
      if ([v9 isDefaultAdjustedSlomo])
      {
        id v5 = +[PLSlalomUtilities synchronouslyFetchVideoAdjustmentsFromManagedAsset:v9];
        uint64_t v6 = [v5 propertyListDictionary];
        uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
        id v8 = *(void **)(v7 + 40);
        *(void *)(v7 + 40) = v6;
      }
    }
  }
}

+ (CGImage)_thumbnailForAssetURL:(id)a3 library:(id)a4 useAspect:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v19 = 0;
  double v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int64_t v22 = __Block_byref_object_copy__34711;
  id v23 = __Block_byref_object_dispose__34712;
  id v24 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__PLAssetSharingUtilities__thumbnailForAssetURL_library_useAspect___block_invoke;
  v14[3] = &unk_1E5875318;
  id v9 = v8;
  id v15 = v9;
  id v10 = v7;
  BOOL v18 = a5;
  id v16 = v10;
  double v17 = &v19;
  [v9 performBlockAndWait:v14 completionHandler:0];
  if (v20[5])
  {
    id v11 = (const void *)DCIM_CGImageRefFromPLImage();
    id v12 = v11;
    if (v11)
    {
      CFRetain(v11);
      CFAutorelease(v12);
    }
  }
  else
  {
    id v12 = 0;
  }

  _Block_object_dispose(&v19, 8);
  return (CGImage *)v12;
}

void __67__PLAssetSharingUtilities__thumbnailForAssetURL_library_useAspect___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) photoFromAssetURL:*(void *)(a1 + 40)];
  uint64_t v3 = v2;
  if (v2)
  {
    id v14 = v2;
    char v4 = [v2 isDeleted];
    uint64_t v3 = v14;
    if ((v4 & 1) == 0)
    {
      if (![v14 isCloudSharedAsset]
        || (int v5 = [v14 cloudPlaceholderKind], v3 = v14, v5 >= 3))
      {
        int v6 = *(unsigned __int8 *)(a1 + 56);
        id v7 = [MEMORY[0x1E4F8B918] defaultFormatChooser];
        id v8 = v7;
        if (v6) {
          [v7 masterThumbnailFormat];
        }
        else {
        id v9 = [v7 indexSheetUnbakedFormat];
        }
        uint64_t v10 = [v9 formatID];

        PLPushPhotoLibraryClient(2);
        uint64_t v11 = [v14 imageWithFormat:v10];
        uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
        id v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;

        PLPopPhotoLibraryClient();
        uint64_t v3 = v14;
      }
    }
  }
}

+ (CGImage)aspectRatioThumbnailForAssetURL:(id)a3 library:(id)a4
{
  return (CGImage *)[a1 _thumbnailForAssetURL:a3 library:a4 useAspect:1];
}

+ (CGImage)thumbnailForAssetURL:(id)a3 library:(id)a4
{
  return (CGImage *)[a1 _thumbnailForAssetURL:a3 library:a4 useAspect:0];
}

@end