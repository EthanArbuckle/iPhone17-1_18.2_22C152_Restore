@interface PEVideoTrimBurnInUtility
+ (id)_compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim:(id)a3 trimController:(id)a4 cinematographyScript:(id)a5 error:(id *)a6;
+ (id)_error:(int64_t)a3 description:(id)a4;
+ (id)_fileExtension;
+ (id)_fileType;
+ (id)_renderComposition:(id)a3 toURL:(id)a4 completion:(id)a5;
+ (id)_renderURLForAssetFilename:(id)a3 error:(id *)a4;
+ (id)_trimOnlyCompositionControllerFor:(id)a3;
+ (id)burnInTrimToNewAsset:(id)a3 compositionController:(id)a4 asShotCompositionController:(id)a5 cinematographyScript:(id)a6 queue:(id)a7 completion:(id)a8;
+ (void)_contentEditingInputFor:(id)a3 completion:(id)a4;
+ (void)_duplicateAsset:(id)a3 withNewRenderURL:(id)a4 asShotCompositionController:(id)a5 completion:(id)a6;
@end

@implementation PEVideoTrimBurnInUtility

+ (id)_error:(int64_t)a3 description:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = *MEMORY[0x263F07F80];
  v12[0] = a4;
  v6 = NSDictionary;
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = [v5 errorWithDomain:@"PEVideoTrimBurnInUtilityErrorDomain" code:a3 userInfo:v8];

  return v9;
}

+ (id)_trimOnlyCompositionControllerFor:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = (void *)[v3 copy];
  v5 = (void *)MEMORY[0x263EFFA08];
  v6 = [v4 compositionKeys];
  id v7 = [v5 setWithArray:v6];
  v8 = (void *)[v7 mutableCopy];

  [v8 removeObject:*MEMORY[0x263F5D878]];
  [v8 removeObject:*MEMORY[0x263F5D870]];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v4, "removeAdjustmentWithKey:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x263F5D8D0], "compositionController:setInputOrientation:", v4, objc_msgSend(v3, "imageOrientation"));
  return v4;
}

+ (id)_fileExtension
{
  v2 = +[PEVideoTrimBurnInUtility _fileType];
  id v3 = [v2 preferredFilenameExtension];

  return v3;
}

+ (id)_fileType
{
  return (id)*MEMORY[0x263F1DC58];
}

+ (id)_renderURLForAssetFilename:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 stringByDeletingPathExtension];
    v8 = [v7 stringByAppendingString:@"_trim"];

    id v9 = +[PEVideoTrimBurnInUtility _fileExtension];
    uint64_t v10 = [v8 stringByAppendingPathExtension:v9];

    uint64_t v11 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
    v13 = [v12 temporaryDirectory];
    v14 = [v11 URLForDirectory:99 inDomain:1 appropriateForURL:v13 create:1 error:a4];

    if (v14)
    {
      long long v15 = [v14 URLByAppendingPathComponent:v10 isDirectory:0];
    }
    else
    {
      long long v15 = 0;
    }
  }
  else
  {
    uint64_t v10 = [NSString stringWithFormat:@"Missing asset filename."];
    if (a4)
    {
      +[PEVideoTrimBurnInUtility _error:5 description:v10];
      long long v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v15 = 0;
    }
  }

  return v15;
}

+ (id)_compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim:(id)a3 trimController:(id)a4 cinematographyScript:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a6)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v30 = [MEMORY[0x263F08690] currentHandler];
    [v30 handleFailureInMethod:a2, a1, @"PEVideoTrimBurnInUtility.m", 305, @"Invalid parameter not satisfying: %@", @"errorPointer" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v31 = [MEMORY[0x263F08690] currentHandler];
  [v31 handleFailureInMethod:a2, a1, @"PEVideoTrimBurnInUtility.m", 306, @"Invalid parameter not satisfying: %@", @"trimController" object file lineNumber description];

LABEL_3:
  v14 = (void *)[v11 copy];
  [v14 removeAdjustmentWithKey:*MEMORY[0x263F5D878]];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __141__PEVideoTrimBurnInUtility__compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim_trimController_cinematographyScript_error___block_invoke;
  aBlock[3] = &unk_2642BF858;
  id v15 = v12;
  id v44 = v15;
  long long v16 = _Block_copy(aBlock);
  long long v17 = [v14 slomoAdjustmentController];

  if (v17)
  {
    uint64_t v18 = *MEMORY[0x263F5D850];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __141__PEVideoTrimBurnInUtility__compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim_trimController_cinematographyScript_error___block_invoke_2;
    v41[3] = &unk_2642BF880;
    id v42 = v16;
    [v14 modifyAdjustmentWithKey:v18 modificationBlock:v41];
  }
  v19 = [v14 videoPosterFrameAdjustmentController];

  if (v19)
  {
    memset(&v40, 0, sizeof(v40));
    uint64_t v20 = [v14 videoPosterFrameAdjustmentController];
    v21 = v20;
    if (v20) {
      [v20 posterFrameTime];
    }
    else {
      memset(v39, 0, sizeof(v39));
    }
    (*((void (**)(CMTime *__return_ptr, void *, void *))v16 + 2))(&v40, v16, v39);

    CMTime time1 = v40;
    CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
    int32_t v22 = CMTimeCompare(&time1, &time2);
    uint64_t v23 = *MEMORY[0x263F5D880];
    if (v22)
    {
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __141__PEVideoTrimBurnInUtility__compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim_trimController_cinematographyScript_error___block_invoke_3;
      v35[3] = &__block_descriptor_56_e48_v16__0__PIVideoPosterFrameAdjustmentController_8l;
      CMTime v36 = v40;
      [v14 modifyAdjustmentWithKey:v23 modificationBlock:v35];
    }
    else
    {
      [v14 removeAdjustmentWithKey:v23];
    }
  }
  v24 = [v14 portraitVideoAdjustmentController];

  if (v24)
  {
    v25 = [v14 portraitVideoAdjustmentController];
    v26 = [v25 cinematographyState];

    if (v13 || !v26)
    {
      uint64_t v28 = *MEMORY[0x263F5D788];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __141__PEVideoTrimBurnInUtility__compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim_trimController_cinematographyScript_error___block_invoke_4;
      v32[3] = &unk_2642BF8C8;
      id v33 = v15;
      id v34 = v13;
      [v14 modifyAdjustmentWithKey:v28 modificationBlock:v32];

      v27 = v33;
    }
    else
    {
      *a6 = +[PEVideoTrimBurnInUtility _error:4 description:@"Cinematic adjustment is present, but cinematographyScript is nil."];
      v27 = v14;
      v14 = 0;
    }
  }
  return v14;
}

CMTime *__141__PEVideoTrimBurnInUtility__compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim_trimController_cinematographyScript_error___block_invoke@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, CMTime *a3@<X8>)
{
  memset(&v16, 0, sizeof(v16));
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    [v6 endTime];
    id v7 = *(void **)(a1 + 32);
    if (v7)
    {
      [v7 startTime];
      goto LABEL_6;
    }
  }
  else
  {
    memset(&lhs, 0, sizeof(lhs));
  }
  memset(&rhs, 0, sizeof(rhs));
LABEL_6:
  CMTimeSubtract(&duration, &lhs, &rhs);
  *(_OWORD *)&v10.start.value = *MEMORY[0x263F010E0];
  v10.start.epoch = *(void *)(MEMORY[0x263F010E0] + 16);
  CMTimeRangeMake(&v16, &v10.start, &duration);
  v8 = *(void **)(a1 + 32);
  if (v8) {
    [v8 startTime];
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  *(_OWORD *)&v10.start.value = *(_OWORD *)a2;
  v10.start.epoch = *(void *)(a2 + 16);
  CMTimeSubtract(&time, &v10.start, &v11);
  CMTimeRange v10 = v16;
  return CMTimeClampToRange(a3, &time, &v10);
}

void __141__PEVideoTrimBurnInUtility__compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim_trimController_cinematographyScript_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v3) {
    [v3 startTime];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  (*(void (**)(long long *__return_ptr, uint64_t, void *))(v5 + 16))(&v15, v5, v14);
  long long v12 = v15;
  uint64_t v13 = v16;
  [v4 setStartTime:&v12];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v4) {
    [v4 endTime];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  (*(void (**)(long long *__return_ptr, uint64_t, void *))(v6 + 16))(&v10, v6, v9);
  long long v7 = v10;
  uint64_t v8 = v11;
  [v4 setEndTime:&v7];
}

uint64_t __141__PEVideoTrimBurnInUtility__compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim_trimController_cinematographyScript_error___block_invoke_3(uint64_t a1, void *a2)
{
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  return [a2 setPosterFrameTime:&v3];
}

void __141__PEVideoTrimBurnInUtility__compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim_trimController_cinematographyScript_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (!v4)
  {
    memset(&start, 0, sizeof(start));
    goto LABEL_5;
  }
  [v4 startTime];
  uint64_t v5 = *(void **)(a1 + 32);
  if (!v5)
  {
LABEL_5:
    memset(&v6, 0, sizeof(v6));
    goto LABEL_6;
  }
  [v5 endTime];
LABEL_6:
  CMTimeRangeFromTimeToTime(&v8, &start, &v6);
  [v3 trimToTimeRange:&v8 usingScript:*(void *)(a1 + 40)];
}

+ (void)_contentEditingInputFor:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  long long v7 = objc_opt_new();
  [v7 setContentMode:0];
  [v7 setCanHandleRAW:&__block_literal_global_2850];
  [v7 setCanHandleAdjustmentData:&__block_literal_global_95];
  CMTimeRange v8 = dispatch_get_global_queue(25, 0);
  [v7 setResultHandlerQueue:v8];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__PEVideoTrimBurnInUtility__contentEditingInputFor_completion___block_invoke_3;
  v10[3] = &unk_2642BF830;
  id v11 = v5;
  id v9 = v5;
  [v6 requestContentEditingInputWithOptions:v7 completionHandler:v10];
}

void __63__PEVideoTrimBurnInUtility__contentEditingInputFor_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    uint64_t v5 = [a3 objectForKeyedSubscript:*MEMORY[0x263F15068]];
    if (!v5)
    {
      uint64_t v5 = +[PEVideoTrimBurnInUtility _error:3 description:@"Content editing input request failed."];
    }
    id v6 = (id)v5;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __63__PEVideoTrimBurnInUtility__contentEditingInputFor_completion___block_invoke_2()
{
  return 1;
}

uint64_t __63__PEVideoTrimBurnInUtility__contentEditingInputFor_completion___block_invoke()
{
  return 0;
}

+ (void)_duplicateAsset:(id)a3 withNewRenderURL:(id)a4 asShotCompositionController:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v12 = (void (**)(id, void, id))a6;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__2854;
  v46 = __Block_byref_object_dispose__2855;
  id v47 = 0;
  if (!v11) {
    goto LABEL_5;
  }
  uint64_t v13 = (void *)MEMORY[0x263F5D588];
  v14 = [v11 composition];
  id v41 = 0;
  long long v15 = [v13 adjustmentInformationForComposition:v14 error:&v41];
  id v16 = v41;

  if (!v15)
  {
    if (!v16)
    {
      id v16 = +[PEVideoTrimBurnInUtility _error:2 description:@"Failed to serialize original adjustment data."];
    }
    v12[2](v12, 0, v16);
    goto LABEL_10;
  }
  id v17 = objc_alloc(MEMORY[0x263F5DED8]);
  uint64_t v18 = [v15 objectForKeyedSubscript:*MEMORY[0x263F5D698]];
  v19 = [v15 objectForKeyedSubscript:*MEMORY[0x263F5D6A0]];
  uint64_t v20 = [v15 objectForKeyedSubscript:*MEMORY[0x263F5D690]];
  v21 = (void *)[v17 initWithFormatIdentifier:v18 formatVersion:v19 data:v20 baseVersion:0 editorBundleID:0 renderTypes:0];

  if (!v21)
  {
    v29 = +[PEVideoTrimBurnInUtility _error:2 description:@"Failed to create asset adjustments from original adjustment information."];
    v12[2](v12, 0, v29);

LABEL_10:
    goto LABEL_11;
  }
  int32_t v22 = [MEMORY[0x263F5DF98] supplementalResourceAAEType];
  uint64_t v23 = [v10 URLByDeletingPathExtension];
  v24 = [v22 preferredFilenameExtension];
  uint64_t v25 = [v23 URLByAppendingPathExtension:v24];
  v26 = (void *)v43[5];
  v43[5] = v25;

  [v21 writeToURL:v43[5] atomically:0];
LABEL_5:
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  void v39[3] = __Block_byref_object_copy__2854;
  v39[4] = __Block_byref_object_dispose__2855;
  id v40 = 0;
  v27 = [v9 photoLibrary];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __100__PEVideoTrimBurnInUtility__duplicateAsset_withNewRenderURL_asShotCompositionController_completion___block_invoke;
  v34[3] = &unk_2642BF7A0;
  id v35 = v9;
  id v36 = v10;
  v37 = &v42;
  v38 = v39;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __100__PEVideoTrimBurnInUtility__duplicateAsset_withNewRenderURL_asShotCompositionController_completion___block_invoke_2;
  v30[3] = &unk_2642BF7C8;
  v32 = v12;
  id v33 = v39;
  id v28 = v27;
  id v31 = v28;
  [v28 performChanges:v34 completionHandler:v30];

  _Block_object_dispose(v39, 8);
LABEL_11:
  _Block_object_dispose(&v42, 8);
}

void __100__PEVideoTrimBurnInUtility__duplicateAsset_withNewRenderURL_asShotCompositionController_completion___block_invoke(uint64_t a1)
{
  id v21 = [MEMORY[0x263F14D48] creationRequestForAsset];
  v2 = [*(id *)(a1 + 32) originalFilename];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) filename];
  }
  uint64_t v5 = v4;

  id v6 = [v5 stringByDeletingPathExtension];

  long long v7 = +[PEVideoTrimBurnInUtility _fileExtension];
  CMTimeRange v8 = [v6 stringByAppendingPathExtension:v7];

  id v9 = objc_opt_new();
  [v9 setOriginalFilename:v8];
  id v10 = +[PEVideoTrimBurnInUtility _fileType];
  id v11 = [v10 identifier];
  [v9 setUniformTypeIdentifier:v11];

  [v9 setShouldMoveFile:1];
  [v21 addResourceWithType:2 fileURL:*(void *)(a1 + 40) options:v9];
  long long v12 = [*(id *)(a1 + 32) creationDate];
  [v21 setCreationDate:v12];

  uint64_t v13 = [*(id *)(a1 + 32) location];
  [v21 setLocation:v13];

  objc_msgSend(v21, "setHidden:", objc_msgSend(*(id *)(a1 + 32), "isHidden"));
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    v14 = objc_opt_new();
    long long v15 = [MEMORY[0x263F5DF98] supplementalResourceAAEType];
    id v16 = [v15 identifier];
    [v14 setUniformTypeIdentifier:v16];

    [v21 addResourceWithType:16 fileURL:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) options:v14];
  }
  id v17 = [v21 placeholderForCreatedAsset];
  uint64_t v18 = [v17 localIdentifier];
  uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;
}

void __100__PEVideoTrimBurnInUtility__duplicateAsset_withNewRenderURL_asShotCompositionController_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    long long v7 = (void *)MEMORY[0x263F14D18];
    v12[0] = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    CMTimeRange v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    id v9 = [*(id *)(a1 + 32) librarySpecificFetchOptions];
    id v10 = [v7 fetchAssetsWithLocalIdentifiers:v8 options:v9];
    id v11 = [v10 lastObject];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (!v5)
    {
      id v6 = +[PEVideoTrimBurnInUtility _error:2 description:@"Failed to create new asset."];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (id)_renderComposition:(id)a3 toURL:(id)a4 completion:(id)a5
{
  id v7 = a5;
  CMTimeRange v8 = (void *)MEMORY[0x263F08850];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 defaultManager];
  id v21 = 0;
  [v11 removeItemAtURL:v9 error:&v21];
  id v12 = v21;

  uint64_t v13 = objc_opt_new();
  v14 = objc_opt_new();
  long long v15 = (void *)[objc_alloc(MEMORY[0x263F58670]) initWithLevel:0];
  [v14 setPriority:v15];

  [v14 setBypassOutputSettingsIfNoComposition:1];
  [v14 setApplyVideoOrientationAsMetadata:1];
  [v14 setIncludeCinematicVideoTracks:1];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __64__PEVideoTrimBurnInUtility__renderComposition_toURL_completion___block_invoke;
  v19[3] = &unk_2642BF778;
  id v20 = v7;
  id v16 = v7;
  id v17 = [v13 exportVideoToURL:v9 composition:v10 options:v14 completion:v19];

  return v17;
}

void __64__PEVideoTrimBurnInUtility__renderComposition_toURL_completion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = 0;
  id v3 = [a2 result:&v7];
  id v4 = v7;
  id v5 = v4;
  if (v3)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (!v4)
    {
      id v5 = +[PEVideoTrimBurnInUtility _error:1 description:@"Failed to render video."];
    }
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

+ (id)burnInTrimToNewAsset:(id)a3 compositionController:(id)a4 asShotCompositionController:(id)a5 cinematographyScript:(id)a6 queue:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v43 = a5;
  id v42 = a6;
  id v14 = a7;
  id v15 = a8;
  id v16 = (void *)MEMORY[0x263F08AB8];
  id v17 = a4;
  uint64_t v18 = [v16 progressWithTotalUnitCount:10];
  uint64_t v19 = (void *)[v17 copy];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __137__PEVideoTrimBurnInUtility_burnInTrimToNewAsset_compositionController_asShotCompositionController_cinematographyScript_queue_completion___block_invoke;
  aBlock[3] = &unk_2642BF6D8;
  id v20 = v14;
  id v55 = v20;
  id v21 = v15;
  id v56 = v21;
  int32_t v22 = _Block_copy(aBlock);
  uint64_t v23 = +[PEVideoTrimBurnInUtility _trimOnlyCompositionControllerFor:v19];
  [v13 filename];
  id v41 = v53 = 0;
  v24 = +[PEVideoTrimBurnInUtility _renderURLForAssetFilename:error:](PEVideoTrimBurnInUtility, "_renderURLForAssetFilename:error:");
  id v25 = 0;
  v26 = v24;
  if (v24)
  {
    id v39 = v25;
    id v40 = v21;
    v27 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v27, OS_LOG_TYPE_DEFAULT, "PEVideoTrimBurnInUtility beginning render", buf, 2u);
    }

    uint64_t v28 = [v23 composition];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __137__PEVideoTrimBurnInUtility_burnInTrimToNewAsset_compositionController_asShotCompositionController_cinematographyScript_queue_completion___block_invoke_59;
    v44[3] = &unk_2642BF750;
    id v51 = v22;
    id v45 = v43;
    id v46 = v19;
    id v47 = v42;
    id v48 = v13;
    id v49 = v24;
    v29 = v23;
    v30 = v22;
    id v31 = v18;
    id v32 = v18;
    id v50 = v32;
    id v33 = (void *)v28;
    id v34 = +[PEVideoTrimBurnInUtility _renderComposition:v28 toURL:v49 completion:v44];

    [v32 addChild:v34 withPendingUnitCount:8];
    id v35 = v32;
    uint64_t v18 = v31;
    int32_t v22 = v30;
    uint64_t v23 = v29;

    id v21 = v40;
    id v36 = v39;
  }
  else
  {
    id v36 = v25;
    (*((void (**)(void *, void, id))v22 + 2))(v22, 0, v25);
    id v37 = v18;
  }

  return v18;
}

void __137__PEVideoTrimBurnInUtility_burnInTrimToNewAsset_compositionController_asShotCompositionController_cinematographyScript_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    CMTimeRange v8 = PLPhotoEditGetLog();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    id v9 = "PEVideoTrimBurnInUtility successfully burned in trim to new asset";
    id v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 2;
    goto LABEL_8;
  }
  if (!v6)
  {
    id v7 = +[PEVideoTrimBurnInUtility _error:0 description:@"Unknown error."];
  }
  CMTimeRange v8 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v7;
    id v9 = "PEVideoTrimBurnInUtility failed with error: %@";
    id v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 12;
LABEL_8:
    _os_log_impl(&dword_217B65000, v10, v11, v9, buf, v12);
  }
LABEL_9:

  id v13 = *(NSObject **)(a1 + 32);
  if (v13)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __137__PEVideoTrimBurnInUtility_burnInTrimToNewAsset_compositionController_asShotCompositionController_cinematographyScript_queue_completion___block_invoke_56;
    block[3] = &unk_2642BF6B0;
    id v17 = *(id *)(a1 + 40);
    id v15 = v5;
    id v16 = v7;
    dispatch_async(v13, block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __137__PEVideoTrimBurnInUtility_burnInTrimToNewAsset_compositionController_asShotCompositionController_cinematographyScript_queue_completion___block_invoke_59(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(id *)(a1 + 32);
    if (v6)
    {
      id v7 = [*(id *)(a1 + 40) trimAdjustmentController];
      uint64_t v8 = *(void *)(a1 + 48);
      id v19 = 0;
      id v9 = +[PEVideoTrimBurnInUtility _compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim:v6 trimController:v7 cinematographyScript:v8 error:&v19];
      id v6 = v19;

      if (!v9)
      {
        (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      id v9 = 0;
    }
    id v10 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v10, OS_LOG_TYPE_DEFAULT, "PEVideoTrimBurnInUtility creating new asset", buf, 2u);
    }

    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 64);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __137__PEVideoTrimBurnInUtility_burnInTrimToNewAsset_compositionController_asShotCompositionController_cinematographyScript_queue_completion___block_invoke_60;
    v13[3] = &unk_2642BF728;
    id v14 = *(id *)(a1 + 72);
    id v17 = *(id *)(a1 + 80);
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    +[PEVideoTrimBurnInUtility _duplicateAsset:v11 withNewRenderURL:v12 asShotCompositionController:v9 completion:v13];

    goto LABEL_10;
  }
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
LABEL_11:
}

void __137__PEVideoTrimBurnInUtility_burnInTrimToNewAsset_compositionController_asShotCompositionController_cinematographyScript_queue_completion___block_invoke_60(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [a1[4] setCompletedUnitCount:9];
  if (v5)
  {
    id v7 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v7, OS_LOG_TYPE_DEFAULT, "PEVideoTrimBurnInUtility requesting content editing input", buf, 2u);
    }

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __137__PEVideoTrimBurnInUtility_burnInTrimToNewAsset_compositionController_asShotCompositionController_cinematographyScript_queue_completion___block_invoke_61;
    v8[3] = &unk_2642BF700;
    id v9 = a1[4];
    id v13 = a1[7];
    id v10 = a1[5];
    id v11 = a1[6];
    id v12 = v5;
    +[PEVideoTrimBurnInUtility _contentEditingInputFor:v12 completion:v8];
  }
  else
  {
    (*((void (**)(void))a1[7] + 2))();
  }
}

void __137__PEVideoTrimBurnInUtility_burnInTrimToNewAsset_compositionController_asShotCompositionController_cinematographyScript_queue_completion___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) setCompletedUnitCount:10];
  if (v5)
  {
    id v17 = 0;
    id v7 = +[PESerializationUtility editSourceForContentEditingInput:v5 error:&v17];
    id v8 = v17;
    if (v7)
    {
      id v9 = *(void **)(a1 + 40);
      id v10 = [v9 trimAdjustmentController];
      uint64_t v11 = *(void *)(a1 + 48);
      id v16 = 0;
      id v12 = +[PEVideoTrimBurnInUtility _compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim:v9 trimController:v10 cinematographyScript:v11 error:&v16];
      id v13 = v16;

      if (v12)
      {
        id v14 = [v7 source];
        objc_msgSend(v12, "setSource:mediaType:", v14, objc_msgSend(v7, "mediaType"));

        id v15 = objc_opt_new();
        [v15 setAsset:*(void *)(a1 + 56)];
        [v15 setCompositionController:v12];
        [v15 setContentEditingInput:v5];
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __137__PEVideoTrimBurnInUtility_burnInTrimToNewAsset_compositionController_asShotCompositionController_cinematographyScript_queue_completion___block_invoke_56(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end