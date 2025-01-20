@interface PXFlexMusicPathfinder
- (FMSong)song;
- (PXFlexMusicPathfinder)init;
- (PXFlexMusicPathfinder)initWithSong:(id)a3;
- (void)_loadRenditionsIfNeeded;
- (void)findPathFromCurrentTime:(id *)a3 inRendition:(id)a4 withTargetRemainder:(id *)a5 tolerance:(id *)a6 result:(id)a7;
@end

@implementation PXFlexMusicPathfinder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_song, 0);
  objc_storeStrong((id *)&self->_renditions, 0);
}

- (FMSong)song
{
  return self->_song;
}

- (void)_loadRenditionsIfNeeded
{
  if (!self->_renditions)
  {
    v3 = [(PXFlexMusicPathfinder *)self song];
    v4 = [v3 idealDurations];
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __48__PXFlexMusicPathfinder__loadRenditionsIfNeeded__block_invoke;
    v13 = &unk_1E5DC0A50;
    id v14 = v3;
    id v15 = v5;
    id v6 = v5;
    id v7 = v3;
    [v4 enumerateObjectsUsingBlock:&v10];
    v8 = (NSArray *)objc_msgSend(v6, "copy", v10, v11, v12, v13);
    renditions = self->_renditions;
    self->_renditions = v8;
  }
}

void __48__PXFlexMusicPathfinder__loadRenditionsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  long long v7 = 0uLL;
  uint64_t v8 = 0;
  if (a2) {
    [a2 CMTimeValue];
  }
  v3 = *(void **)(a1 + 32);
  long long v5 = v7;
  uint64_t v6 = v8;
  v4 = [v3 renditionForDuration:&v5 withOptions:MEMORY[0x1E4F1CC08]];
  [*(id *)(a1 + 40) addObject:v4];
}

- (void)findPathFromCurrentTime:(id *)a3 inRendition:(id)a4 withTargetRemainder:(id *)a5 tolerance:(id *)a6 result:(id)a7
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a7;
  [(PXFlexMusicPathfinder *)self _loadRenditionsIfNeeded];
  v12 = [(PXFlexMusicPathfinder *)self song];
  v13 = [v10 trackA];
  id v14 = [v10 trackB];
  id v15 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v16 = [v13 clips];
  uint64_t v17 = [v16 count];
  v18 = [v14 clips];
  v19 = objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v18, "count") + v17);

  v20 = [v13 clips];
  [v19 addObjectsFromArray:v20];

  v21 = [v14 clips];
  [v19 addObjectsFromArray:v21];

  v22 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"position" ascending:1];
  v28[0] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  [v19 sortUsingDescriptors:v23];

  int32_t v24 = [v12 sampleRate];
  memset(&v26, 0, sizeof(v26));
  CMTime time = *(CMTime *)a3;
  CMTimeConvertScale(&v26, &time, v24, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  [v19 count];
  id v25 = v19;
  PXLastIndexInSortedRangePassingTest();
}

BOOL __98__PXFlexMusicPathfinder_findPathFromCurrentTime_inRendition_withTargetRemainder_tolerance_result___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  BOOL v4 = [v3 position] <= *(void *)(a1 + 40);

  return v4;
}

void __98__PXFlexMusicPathfinder_findPathFromCurrentTime_inRendition_withTargetRemainder_tolerance_result___block_invoke_12(uint64_t a1, void *a2)
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = v3;
  long long v40 = 0uLL;
  uint64_t v41 = 0;
  if (v3) {
    [v3 CMTimeValue];
  }
  long long v5 = *(void **)(a1 + 32);
  long long v28 = v40;
  uint64_t v29 = v41;
  uint64_t v6 = [v5 renditionForDuration:&v28 withOptions:MEMORY[0x1E4F1CC08]];
  memset(&v39, 0, sizeof(v39));
  CMTimeMake(&v39, [v6 duration], *(_DWORD *)(a1 + 48));
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__162127;
  v37 = __Block_byref_object_dispose__162128;
  id v38 = 0;
  *(void *)&long long v28 = 0;
  *((void *)&v28 + 1) = &v28;
  uint64_t v29 = 0x3810000000;
  v30 = &unk_1AB5D584F;
  long long v31 = *MEMORY[0x1E4F1F9F8];
  uint64_t v32 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  long long v7 = [v6 trackB];
  uint64_t v8 = [v7 clips];
  v9 = [v6 trackA];
  id v10 = [v9 clips];
  id v11 = [v8 arrayByAddingObjectsFromArray:v10];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __98__PXFlexMusicPathfinder_findPathFromCurrentTime_inRendition_withTargetRemainder_tolerance_result___block_invoke_13;
  v19[3] = &unk_1E5DC09E0;
  int v20 = *(_DWORD *)(a1 + 48);
  long long v21 = *(_OWORD *)(a1 + 52);
  uint64_t v22 = *(void *)(a1 + 68);
  CMTime v23 = v39;
  uint64_t v25 = *(void *)(a1 + 92);
  long long v24 = *(_OWORD *)(a1 + 76);
  uint64_t v27 = *(void *)(a1 + 116);
  long long v26 = *(_OWORD *)(a1 + 100);
  v19[4] = &v33;
  v19[5] = &v28;
  [v11 enumerateObjectsUsingBlock:v19];

  if (v34[5])
  {
    memset(&v18, 0, sizeof(v18));
    CMTime lhs = v39;
    CMTime v16 = *(CMTime *)(*((void *)&v28 + 1) + 32);
    CMTimeSubtract(&v18, &lhs, &v16);
    v42[0] = v6;
    CMTime lhs = *(CMTime *)(*((void *)&v28 + 1) + 32);
    v12 = [MEMORY[0x1E4F29238] valueWithCMTime:&lhs];
    v42[1] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    id v14 = *(void **)(a1 + 40);
    CMTime lhs = v18;
    id v15 = [MEMORY[0x1E4F29238] valueWithCMTime:&lhs];
    [v14 setObject:v13 forKeyedSubscript:v15];
  }
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v33, 8);
}

uint64_t __98__PXFlexMusicPathfinder_findPathFromCurrentTime_inRendition_withTargetRemainder_tolerance_result___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  memset(&v16, 0, sizeof(v16));
  if (v5) {
    [v5 CMTimeValue];
  }
  else {
    memset(&lhs, 0, sizeof(lhs));
  }
  CMTime rhs = *(CMTime *)(a1 + 32);
  CMTimeSubtract(&time, &lhs, &rhs);
  CMTimeAbsoluteValue(&v16, &time);
  memset(&rhs, 0, sizeof(rhs));
  if (v6) {
    [v6 CMTimeValue];
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  CMTime time1 = *(CMTime *)(a1 + 32);
  CMTimeSubtract(&v12, &v11, &time1);
  CMTimeAbsoluteValue(&rhs, &v12);
  CMTime time1 = v16;
  CMTime v9 = rhs;
  uint64_t v7 = CMTimeCompare(&time1, &v9);

  return v7;
}

void __98__PXFlexMusicPathfinder_findPathFromCurrentTime_inRendition_withTargetRemainder_tolerance_result___block_invoke_13(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  memset(&v18, 0, sizeof(v18));
  CMTimeMake(&v18, [v7 offset], *(_DWORD *)(a1 + 48));
  memset(&v17, 0, sizeof(v17));
  CMTimeMake(&duration, [v7 duration], *(_DWORD *)(a1 + 48));
  start.CMTimeRange start = v18;
  CMTimeRangeMake(&v17, &start.start, &duration);
  CMTimeRange start = v17;
  CMTime time = *(CMTime *)(a1 + 52);
  if (CMTimeRangeContainsTime(&start, &time))
  {
    memset(&start, 0, 24);
    CMTimeMake(&start.start, [v7 position], *(_DWORD *)(a1 + 48));
    memset(&time, 0, sizeof(time));
    CMTime lhs = *(CMTime *)(a1 + 52);
    CMTime rhs = v18;
    CMTimeSubtract(&time, &lhs, &rhs);
    memset(&lhs, 0, sizeof(lhs));
    CMTime rhs = start.start;
    CMTime time2 = time;
    CMTimeAdd(&lhs, &rhs, &time2);
    memset(&rhs, 0, sizeof(rhs));
    CMTime time2 = *(CMTime *)(a1 + 76);
    CMTime v10 = lhs;
    CMTimeSubtract(&rhs, &time2, &v10);
    CMTime time2 = rhs;
    CMTime v10 = *(CMTime *)(a1 + 100);
    CMTimeSubtract(&v8, &time2, &v10);
    CMTimeAbsoluteValue(&time1, &v8);
    CMTime time2 = *(CMTime *)(a1 + 124);
    if (CMTimeCompare(&time1, &time2) <= 0)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      *(CMTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = lhs;
    }
    *a4 = 1;
  }
}

- (PXFlexMusicPathfinder)init
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFlexMusicPathfinder.m", 34, @"%s is not available as initializer", "-[PXFlexMusicPathfinder init]");

  abort();
}

- (PXFlexMusicPathfinder)initWithSong:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXFlexMusicPathfinder;
  id v6 = [(PXFlexMusicPathfinder *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_song, a3);
  }

  return v7;
}

@end