@interface PXStoryCompanionTimelineRequest
+ (BOOL)_transformConfiguration:(id)a3 intoStoryConfiguration:(id *)a4 extendedTraitCollection:(id *)a5 error:(id *)a6;
+ (id)_createCompanionTimelineFromModel:(id)a3;
+ (id)requestTimelineWithConfiguration:(id)a3 resultHandler:(id)a4;
+ (void)_waitForFinalTimelineWithProgress:(id)a3 model:(id)a4 resultHandler:(id)a5;
- (PXStoryCompanionTimelineRequest)init;
@end

@implementation PXStoryCompanionTimelineRequest

+ (id)_createCompanionTimelineFromModel:(id)a3
{
  id v3 = a3;
  v4 = [PXStoryConcreteCompanionTimeline alloc];
  v5 = [v3 timeline];
  uint64_t v6 = [v3 colorGradeKind];
  v7 = [v3 colorGradingRepository];

  v8 = [(PXStoryConcreteCompanionTimeline *)v4 initWithTimeline:v5 colorGradeKind:v6 colorGradingRepository:v7];
  return v8;
}

+ (void)_waitForFinalTimelineWithProgress:(id)a3 model:(id)a4 resultHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v8 performChanges:&__block_literal_global_103534];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__PXStoryCompanionTimelineRequest__waitForFinalTimelineWithProgress_model_resultHandler___block_invoke_2;
  v14[3] = &unk_1E5DB9C60;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  id v13 = (id)objc_msgSend(v11, "pxStory_enumerateStatesByWatchingChanges:usingBlock:", 0x20000000, v14);
}

uint64_t __89__PXStoryCompanionTimelineRequest__waitForFinalTimelineWithProgress_model_resultHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if ([*(id *)(a1 + 32) isCancelled]) {
    *a4 = 1;
  }
  uint64_t result = [*(id *)(a1 + 40) timelineAttributes];
  if ((result & 2) != 0)
  {
    *a4 = 1;
    id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v7();
  }
  return result;
}

uint64_t __89__PXStoryCompanionTimelineRequest__waitForFinalTimelineWithProgress_model_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setViewMode:1];
}

+ (BOOL)_transformConfiguration:(id)a3 intoStoryConfiguration:(id *)a4 extendedTraitCollection:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  [v9 viewportSize];
  double v11 = v10;
  double v13 = v12;
  BOOL v14 = v12 > 0.0 && v10 > 0.0;
  if (!v14) {
    PXSizeDescription();
  }
  id v15 = [PXStoryConfiguration alloc];
  id v16 = [v9 assetCollection];
  id v17 = [(PXStoryConfiguration *)v15 initWithAssetCollection:v16];
  v18 = [v9 queue];
  id v19 = [(PXStoryConfiguration *)v17 copyWithStoryQueue:v18];

  objc_msgSend(v19, "setSongsProducerKind:", objc_msgSend(v9, "songsProducerKind"));
  v20 = -[PXStoryExtendedTraitCollection initWithLayoutReferenceSize:]([PXStoryExtendedTraitCollection alloc], "initWithLayoutReferenceSize:", v11, v13);
  if (a4) {
    *a4 = v19;
  }
  if (a5) {
    *a5 = v20;
  }
  if (a6) {
    *a6 = 0;
  }

  return v14;
}

+ (id)requestTimelineWithConfiguration:(id)a3 resultHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PXStoryCompanionTimelineRequest.m", 28, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, a1, @"PXStoryCompanionTimelineRequest.m", 29, @"Invalid parameter not satisfying: %@", @"resultHandler != nil" object file lineNumber description];

LABEL_3:
  double v10 = [v7 queue];
  dispatch_assert_queue_V2(v10);

  id v29 = 0;
  id v27 = 0;
  id v28 = 0;
  char v11 = [a1 _transformConfiguration:v7 intoStoryConfiguration:&v29 extendedTraitCollection:&v28 error:&v27];
  id v12 = v29;
  id v13 = v28;
  id v14 = v27;
  if (v11)
  {
    if (v12)
    {
      if (v13)
      {
LABEL_6:
        id v15 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:0];
        id v16 = [[PXStoryModel alloc] initWithConfiguration:v12 extendedTraitCollection:v13];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __82__PXStoryCompanionTimelineRequest_requestTimelineWithConfiguration_resultHandler___block_invoke;
        v23[3] = &unk_1E5DB9C38;
        id v26 = a1;
        v24 = v16;
        v25 = v9;
        id v17 = v16;
        [a1 _waitForFinalTimelineWithProgress:v15 model:v17 resultHandler:v23];

        goto LABEL_8;
      }
    }
    else
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, a1, @"PXStoryCompanionTimelineRequest.m", 39, @"Invalid parameter not satisfying: %@", @"storyConfiguration != nil" object file lineNumber description];

      if (v13) {
        goto LABEL_6;
      }
    }
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"PXStoryCompanionTimelineRequest.m", 40, @"Invalid parameter not satisfying: %@", @"extendedTraitCollection != nil" object file lineNumber description];

    goto LABEL_6;
  }
  ((void (**)(void, void, id))v9)[2](v9, 0, v14);
  id v15 = 0;
LABEL_8:

  return v15;
}

void __82__PXStoryCompanionTimelineRequest_requestTimelineWithConfiguration_resultHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v4 = [*(id *)(a1 + 48) _createCompanionTimelineFromModel:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

- (PXStoryCompanionTimelineRequest)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryCompanionTimelineRequest.m", 104, @"%s is not available as initializer", "-[PXStoryCompanionTimelineRequest init]");

  abort();
}

@end