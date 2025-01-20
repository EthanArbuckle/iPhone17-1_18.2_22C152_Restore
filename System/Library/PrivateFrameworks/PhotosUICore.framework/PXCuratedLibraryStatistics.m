@interface PXCuratedLibraryStatistics
- (NSString)summaryDescription;
- (int64_t)numberOfAssetsWithPlaybackStyle:(int64_t)a3 displayProminence:(int64_t)a4 autoPlaybackEligibility:(int64_t)a5;
@end

@implementation PXCuratedLibraryStatistics

- (int64_t)numberOfAssetsWithPlaybackStyle:(int64_t)a3 displayProminence:(int64_t)a4 autoPlaybackEligibility:(int64_t)a5
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  [v7 handleFailureInMethod:a2, self, @"PXCuratedLibraryStatistics.m", 184, @"Method %s is a responsibility of subclass %@", "-[PXCuratedLibraryStatistics numberOfAssetsWithPlaybackStyle:displayProminence:autoPlaybackEligibility:]", v9 object file lineNumber description];

  abort();
}

- (NSString)summaryDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke;
  aBlock[3] = &unk_1E5DD0510;
  id v4 = v3;
  uint64_t v25 = 20;
  id v23 = v4;
  v24 = @"  ";
  v5 = _Block_copy(aBlock);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_2;
  v20[3] = &unk_1E5DD36F8;
  id v6 = v4;
  id v21 = v6;
  v7 = _Block_copy(v20);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v14 = __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_3;
  v15 = &unk_1E5DC8698;
  id v8 = v6;
  id v18 = v5;
  id v19 = v7;
  id v16 = v8;
  v17 = self;
  id v9 = v7;
  id v10 = v5;
  __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_3((uint64_t)v13, 1uLL);
  v14((uint64_t)v13, 3uLL);
  v14((uint64_t)v13, 4uLL);
  v14((uint64_t)v13, 2uLL);
  v14((uint64_t)v13, 5uLL);
  v14((uint64_t)v13, 0);
  id v11 = v8;

  return (NSString *)v11;
}

uint64_t __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = [a2 description];
  v5 = v4;
  if (!v4) {
    id v4 = &stru_1F00B0030;
  }
  id v6 = [(__CFString *)v4 stringByPaddingToLength:a1[6] withString:@" " startingAtIndex:0];
  [v3 appendString:v6];

  v7 = (void *)a1[4];
  uint64_t v8 = a1[5];
  return [v7 appendString:v8];
}

uint64_t __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendString:@"\n"];
}

void __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_3(uint64_t a1, unint64_t a2)
{
  if (a2 >= 6)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"NSString *PlaybackStyleGroupDescription(PXDisplayAssetPlaybackStyle)"];
    [v7 handleFailureInFunction:v8 file:@"PXCuratedLibraryStatistics.m" lineNumber:41 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  [*(id *)(a1 + 32) appendFormat:@"== %@ ==\n\n", off_1E5DC86E0[a2]];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v55 = __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_4;
  v56 = &unk_1E5DD36A0;
  id v57 = *(id *)(a1 + 48);
  __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_4((uint64_t)v54, 2uLL);
  v55((uint64_t)v54, 1uLL);
  v55((uint64_t)v54, 0);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v48 = __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_5;
  v49 = &unk_1E5DC85F8;
  id v4 = *(id *)(a1 + 48);
  uint64_t v50 = *(void *)(a1 + 40);
  id v51 = v4;
  unint64_t v53 = a2;
  id v52 = *(id *)(a1 + 56);
  __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_5(v47, 0);
  v48(v47, 1uLL);
  v48(v47, 2uLL);
  [*(id *)(a1 + 32) appendString:@"\n"];
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v13 = __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_7;
  v14 = &unk_1E5DC8648;
  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = &v43;
  v17 = &v35;
  id v18 = &v27;
  id v19 = &v39;
  v20 = &v31;
  id v21 = &v23;
  unint64_t v22 = a2;
  v5 = v12;
  __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_7((uint64_t)v5, 0);
  v13((uint64_t)v5, 1);
  v13((uint64_t)v5, 2);

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_9;
  aBlock[3] = &unk_1E5DC8670;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v6 = (void (**)(void *, __CFString *, uint64_t, uint64_t))_Block_copy(aBlock);
  v6[2](v6, @"Total", v40[3], v44[3]);
  v6[2](v6, @"Large", v32[3], v36[3]);
  v6[2](v6, @"Key", v24[3], v28[3]);
  [*(id *)(a1 + 32) appendString:@"\n"];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
}

uint64_t __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_4(uint64_t a1, unint64_t a2)
{
  if (a2 >= 3)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    v5 = [NSString stringWithUTF8String:"NSString *AutoPlaybackElibilityDescription(PXCuratedLibraryAutoPlaybackElibility)"];
    [v4 handleFailureInFunction:v5 file:@"PXCuratedLibraryStatistics.m" lineNumber:83 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

void __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_5(void *a1, unint64_t a2)
{
  if (a2 >= 3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"NSString *DisplayProminenceDescription(PXCuratedLibraryAssetDisplayProminence)"];
    [v7 handleFailureInFunction:v8 file:@"PXCuratedLibraryStatistics.m" lineNumber:62 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  (*(void (**)(void))(a1[5] + 16))();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  id v10 = __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_6;
  id v11 = &unk_1E5DC85D0;
  uint64_t v4 = a1[7];
  v5 = (void *)a1[5];
  uint64_t v12 = a1[4];
  uint64_t v14 = v4;
  unint64_t v15 = a2;
  id v13 = v5;
  __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_6((uint64_t)v9, 2);
  v10((uint64_t)v9, 1);
  v10((uint64_t)v9, 0);
  (*(void (**)(void, uint64_t))(a1[6] + 16))(a1[6], v6);
}

uint64_t __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_7(uint64_t a1, uint64_t a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  uint64_t v8 = __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_8;
  id v9 = &unk_1E5DC8620;
  uint64_t v12 = *(void *)(a1 + 88);
  uint64_t v13 = a2;
  long long v4 = *(_OWORD *)(a1 + 48);
  long long v10 = *(_OWORD *)(a1 + 32);
  long long v11 = v4;
  __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_8((uint64_t)v7, 2);
  v8((uint64_t)v7, 1);
  v8((uint64_t)v7, 0);
  uint64_t result = [*(id *)(a1 + 32) numberOfAssetsWithPlaybackStyle:*(void *)(a1 + 88) displayProminence:a2 autoPlaybackEligibility:2];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += result;
  if (a2 == 2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += result;
    uint64_t v6 = a1 + 80;
  }
  else
  {
    if (a2 != 1) {
      return result;
    }
    uint64_t v6 = a1 + 72;
  }
  *(void *)(*(void *)(*(void *)v6 + 8) + 24) += result;
  return result;
}

uint64_t __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (a4 >= 1)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [NSNumber numberWithInteger:a3];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    uint64_t v9 = *(void *)(a1 + 32);
    long long v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"%0.1f%%", (double)a3 * 100.0 / (double)a4);
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = [NSNumber numberWithInteger:a4];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
  uint64_t v13 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v13();
}

uint64_t __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_8(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    v2 = (void *)result;
    uint64_t result = [*(id *)(result + 32) numberOfAssetsWithPlaybackStyle:v2[8] displayProminence:v2[9] autoPlaybackEligibility:a2];
    *(void *)(*(void *)(v2[5] + 8) + 24) += result;
    uint64_t v3 = v2[9];
    if (v3 == 2)
    {
      *(void *)(*(void *)(v2[6] + 8) + 24) += result;
      long long v4 = v2 + 7;
    }
    else
    {
      if (v3 != 1) {
        return result;
      }
      long long v4 = v2 + 6;
    }
    *(void *)(*(void *)(*v4 + 8) + 24) += result;
  }
  return result;
}

void __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) numberOfAssetsWithPlaybackStyle:*(void *)(a1 + 48) displayProminence:*(void *)(a1 + 56) autoPlaybackEligibility:a2];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3 <= 0)
  {
    v5 = *(void (**)(uint64_t, __CFString *))(v4 + 16);
    v5(v4, &stru_1F00B0030);
  }
  else
  {
    id v6 = [NSNumber numberWithInteger:v3];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

@end