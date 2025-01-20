@interface PXStoryAutoEditDurationConstraintSolver
- ($5EF5D5D6B68C46A6CC4A689629511B76)constrainedOverallDurationInfo;
- ($5EF5D5D6B68C46A6CC4A689629511B76)originalOverallDurationInfo;
- ($FF287EE8AFEAB54EC1BB010BF4A7F511)constrainedDurationInfoAtIndex:(SEL)a3;
- ($FF287EE8AFEAB54EC1BB010BF4A7F511)originalDurationInfoAtIndex:(SEL)a3;
- (BOOL)solveForMaximumDuration:(id *)a3;
- (BOOL)solveForPreferredDuration:(id *)a3;
- (PXStoryAutoEditDurationConstraintSolver)init;
- (id).cxx_construct;
- (id)diagnosticSwiftCodeForDurationUnitTestNamed:(id)a3 maximumDuration:(id *)a4;
- (id)diagnosticSwiftCodeForDurationUnitTestNamed:(id)a3 preferredDuration:(id *)a4;
- (unint64_t)count;
- (void)addClipWithDurationInfo:(id *)a3;
@end

@implementation PXStoryAutoEditDurationConstraintSolver

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_solveResults.__begin_;
  if (begin)
  {
    self->_solveResults.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_infos.__begin_;
  if (v4)
  {
    self->_infos.__end_ = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_log, 0);
}

- (id)diagnosticSwiftCodeForDurationUnitTestNamed:(id)a3 maximumDuration:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  memset(v16, 0, sizeof(v16));
  SumDurations(v16, (CMTime *)self->_infos.__begin_, (CMTime *)self->_infos.__end_);
  CMTime time = *(CMTime *)a4;
  Float64 Seconds = CMTimeGetSeconds(&time);
  [v7 appendFormat:@"func test%@MaximumDurationFromTTR() throws {\n", v6];
  [v7 appendFormat:@"    let solver = PXStoryAutoEditDurationConstraintSolver()\n"];
  [v7 appendFormat:@"\n"];
  begin = self->_infos.__begin_;
  for (i = self->_infos.__end_; begin != i; begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 72))
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("    solver.addClip(with: PFStoryDurationInfoMake("));
    [v7 appendFormat:@"CMTimeMake(value: %lld, timescale: %d), ", *(void *)begin, *((unsigned int *)begin + 2)];
    [v7 appendFormat:@"CMTimeMake(value: %lld, timescale: %d), ", *((void *)begin + 3), *((unsigned int *)begin + 8)];
    [v7 appendFormat:@"CMTimeMake(value: %lld, timescale: %d)]\n"), *((void *)begin + 6), *((unsigned int *)begin + 14));
  }
  [v7 appendFormat:@"\n"];
  [v7 appendFormat:@"    let originalOverall = solver.originalOverallDurationInfo\n"];
  CMTime v14 = v16[0];
  [v7 appendFormat:@"    XCTAssertEqual(originalOverall.specificDurationInfo.minimumSeconds, %f)\n", CMTimeGetSeconds(&v14)];
  CMTime v13 = v16[1];
  [v7 appendFormat:@"    XCTAssertEqual(originalOverall.specificDurationInfo.preferredSeconds, %f)\n", CMTimeGetSeconds(&v13)];
  CMTime v12 = v16[2];
  [v7 appendFormat:@"    XCTAssertEqual(originalOverall.specificDurationInfo.maximumSeconds, %f)\n", CMTimeGetSeconds(&v12)];
  [v7 appendFormat:@"\n"];
  [v7 appendFormat:@"    solver.solve(forMaximumDuration: CMTimeMake(value: %lld, timescale: %d))\n", a4->var0, a4->var1];
  [v7 appendFormat:@"\n"];
  [v7 appendFormat:@"    let constrainedOverall = solver.constrainedOverallDurationInfo\n"];
  [v7 appendFormat:@"    XCTAssertLessThanOrEqual(constrainedOverall.specificDurationInfo.minimumSeconds, %f)\n", *(void *)&Seconds];
  [v7 appendFormat:@"    XCTAssertLessThanOrEqual(constrainedOverall.specificDurationInfo.preferredSeconds, %f)\n", *(void *)&Seconds];
  [v7 appendFormat:@"    XCTAssertEqual(constrainedOverall.specificDurationInfo.maximumSeconds, %f)\n", *(void *)&Seconds];
  [v7 appendFormat:@"    XCTFail(\"Success criteria needs to be defined\""];
  [v7 appendFormat:@"}\n"];

  return v7;
}

- (id)diagnosticSwiftCodeForDurationUnitTestNamed:(id)a3 preferredDuration:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  memset(v16, 0, sizeof(v16));
  SumDurations(v16, (CMTime *)self->_infos.__begin_, (CMTime *)self->_infos.__end_);
  CMTime time = *(CMTime *)a4;
  Float64 Seconds = CMTimeGetSeconds(&time);
  [v7 appendFormat:@"func test%@PreferredDurationFromTTR() throws {\n", v6];
  [v7 appendFormat:@"    let solver = PXStoryAutoEditDurationConstraintSolver()\n"];
  [v7 appendFormat:@"\n"];
  begin = self->_infos.__begin_;
  for (i = self->_infos.__end_; begin != i; begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 72))
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("    solver.addClip(with: PFStoryDurationInfoMake("));
    [v7 appendFormat:@"CMTimeMake(value: %lld, timescale: %d), ", *(void *)begin, *((unsigned int *)begin + 2)];
    [v7 appendFormat:@"CMTimeMake(value: %lld, timescale: %d), ", *((void *)begin + 3), *((unsigned int *)begin + 8)];
    [v7 appendFormat:@"CMTimeMake(value: %lld, timescale: %d)]\n"), *((void *)begin + 6), *((unsigned int *)begin + 14));
  }
  [v7 appendFormat:@"\n"];
  [v7 appendFormat:@"    let originalOverall = solver.originalOverallDurationInfo\n"];
  CMTime v14 = v16[0];
  [v7 appendFormat:@"    XCTAssertEqual(originalOverall.specificDurationInfo.minimumSeconds, %f)\n", CMTimeGetSeconds(&v14)];
  CMTime v13 = v16[1];
  [v7 appendFormat:@"    XCTAssertEqual(originalOverall.specificDurationInfo.preferredSeconds, %f)\n", CMTimeGetSeconds(&v13)];
  CMTime v12 = v16[2];
  [v7 appendFormat:@"    XCTAssertEqual(originalOverall.specificDurationInfo.maximumSeconds, %f)\n", CMTimeGetSeconds(&v12)];
  [v7 appendFormat:@"\n"];
  [v7 appendFormat:@"    solver.solve(forPreferredDuration: CMTimeMake(value: %lld, timescale: %d))\n", a4->var0, a4->var1];
  [v7 appendFormat:@"\n"];
  [v7 appendFormat:@"    let constrainedOverall = solver.constrainedOverallDurationInfo\n"];
  [v7 appendFormat:@"    XCTAssertLessThanOrEqual(constrainedOverall.specificDurationInfo.minimumSeconds, %f)\n", *(void *)&Seconds];
  [v7 appendFormat:@"    XCTAssertEqual(constrainedOverall.specificDurationInfo.preferredSeconds, %f)\n", *(void *)&Seconds];
  [v7 appendFormat:@"    XCTAssertGreaterThanOrEqual(constrainedOverall.specificDurationInfo.maximumSeconds, %f)\n", *(void *)&Seconds];
  [v7 appendFormat:@"    XCTFail(\"Success criteria needs to be defined\""];
  [v7 appendFormat:@"}\n"];

  return v7;
}

- ($5EF5D5D6B68C46A6CC4A689629511B76)constrainedOverallDurationInfo
{
  int64_t v11 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  SumDurations((CMTime *)&v7, (CMTime *)self->_solveResults.__begin_, (CMTime *)self->_solveResults.__end_);
  long long v5 = v7;
  *(_OWORD *)&retstr->var1.var0.var3 = v8;
  long long v6 = v10;
  *(_OWORD *)&retstr->var1.var1.var1 = v9;
  *(_OWORD *)&retstr->var1.var2.var0 = v6;
  retstr->var1.var2.var3 = v11;
  *(_OWORD *)&retstr->var1.var0.var0 = v5;
  retstr->var0 = 2;
  return result;
}

- ($5EF5D5D6B68C46A6CC4A689629511B76)originalOverallDurationInfo
{
  int64_t v11 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  SumDurations((CMTime *)&v7, (CMTime *)self->_infos.__begin_, (CMTime *)self->_infos.__end_);
  long long v5 = v7;
  *(_OWORD *)&retstr->var1.var0.var3 = v8;
  long long v6 = v10;
  *(_OWORD *)&retstr->var1.var1.var1 = v9;
  *(_OWORD *)&retstr->var1.var2.var0 = v6;
  retstr->var1.var2.var3 = v11;
  *(_OWORD *)&retstr->var1.var0.var0 = v5;
  retstr->var0 = 2;
  return result;
}

- ($FF287EE8AFEAB54EC1BB010BF4A7F511)constrainedDurationInfoAtIndex:(SEL)a3
{
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || 0x8E38E38E38E38E39 * ((self->var1.var0 - self->var0.var3) >> 3) <= a4)
  {
    uint64_t v9 = MEMORY[0x1E4F1FA48];
    long long v10 = *MEMORY[0x1E4F1FA48];
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA48];
    int64_t v11 = *(void *)(v9 + 16);
    retstr->var0.int64_t var3 = v11;
    *(_OWORD *)&retstr->var1.var0 = v10;
    retstr->var1.int64_t var3 = v11;
    *(_OWORD *)&retstr->var2.var0 = v10;
    retstr->var2.int64_t var3 = v11;
  }
  else
  {
    int64_t var3 = self->var1.var3;
    if (var3 == self->var2.var0) {
      PXAssertGetLog();
    }
    unint64_t v6 = var3 + 72 * a4;
    long long v7 = *(_OWORD *)(v6 + 48);
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v6 + 32);
    *(_OWORD *)&retstr->var2.var0 = v7;
    retstr->var2.int64_t var3 = *(void *)(v6 + 64);
    long long v8 = *(_OWORD *)(v6 + 16);
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)v6;
    *(_OWORD *)&retstr->var0.int64_t var3 = v8;
  }
  return self;
}

- ($FF287EE8AFEAB54EC1BB010BF4A7F511)originalDurationInfoAtIndex:(SEL)a3
{
  if (a4 == 0x7FFFFFFFFFFFFFFFLL
    || (int64_t var3 = self->var0.var3, 0x8E38E38E38E38E39 * ((self->var1.var0 - var3) >> 3) <= a4))
  {
    uint64_t v8 = MEMORY[0x1E4F1FA48];
    long long v9 = *MEMORY[0x1E4F1FA48];
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA48];
    int64_t v10 = *(void *)(v8 + 16);
    retstr->var0.int64_t var3 = v10;
    *(_OWORD *)&retstr->var1.var0 = v9;
    retstr->var1.int64_t var3 = v10;
    *(_OWORD *)&retstr->var2.var0 = v9;
    retstr->var2.int64_t var3 = v10;
  }
  else
  {
    unint64_t v5 = var3 + 72 * a4;
    long long v6 = *(_OWORD *)(v5 + 48);
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v5 + 32);
    *(_OWORD *)&retstr->var2.var0 = v6;
    retstr->var2.int64_t var3 = *(void *)(v5 + 64);
    long long v7 = *(_OWORD *)(v5 + 16);
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)v5;
    *(_OWORD *)&retstr->var0.int64_t var3 = v7;
  }
  return self;
}

- (BOOL)solveForMaximumDuration:(id *)a3
{
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  long long v6 = self->_log;
  long long v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "StoryAutoEditDurationConstraintSolverMax", "", buf, 2u);
  }

  std::vector<PFStoryDurationInfo>::__assign_with_size[abi:ne180100]<PFStoryDurationInfo*,PFStoryDurationInfo*>(&self->_solveResults.__begin_, (char *)self->_infos.__begin_, (char *)self->_infos.__end_, 0x8E38E38E38E38E39 * ((self->_infos.__end_ - self->_infos.__begin_) >> 3));
  *(_OWORD *)buf = 0u;
  memset(v68, 0, 56);
  SumDurations((CMTime *)buf, (CMTime *)self->_infos.__begin_, (CMTime *)self->_infos.__end_);
  CMTime time1 = *(CMTime *)&v68[32];
  CMTime time2 = (CMTime)*a3;
  if (CMTimeCompare(&time1, &time2) < 1) {
    goto LABEL_14;
  }
  *(_OWORD *)&v64.value = *(_OWORD *)buf;
  v64.CMTimeEpoch epoch = *(void *)v68;
  CMTime v63 = (CMTime)*a3;
  if (CMTimeCompare(&v64, &v63) <= 0)
  {
    CMTime v62 = *(CMTime *)&v68[8];
    CMTime v61 = (CMTime)*a3;
    if (CMTimeCompare(&v62, &v61) <= 0)
    {
      memset(&v60, 0, sizeof(v60));
      CMTime v59 = *(CMTime *)&v68[32];
      CMTime v58 = *(CMTime *)&v68[8];
      CMTimeSubtract(&v60, &v59, &v58);
      memset(&v57, 0, sizeof(v57));
      CMTime v56 = *(CMTime *)&v68[32];
      CMTime v55 = (CMTime)*a3;
      CMTimeSubtract(&v57, &v56, &v55);
      begin = self->_solveResults.__begin_;
      end = self->_solveResults.__end_;
      while (begin != end)
      {
        memset(&v54, 0, sizeof(v54));
        long long v19 = *((_OWORD *)begin + 3);
        v53.CMTimeEpoch epoch = *((void *)begin + 8);
        *(_OWORD *)&v53.value = v19;
        long long v20 = *(_OWORD *)((char *)begin + 24);
        v52.CMTimeEpoch epoch = *((void *)begin + 5);
        *(_OWORD *)&v52.value = v20;
        CMTimeSubtract(&v54, &v53, &v52);
        memset(&v51, 0, sizeof(v51));
        CMTime v50 = v57;
        CMTime v49 = v54;
        CMTime v48 = v60;
        CMTimeMultiplyTimeByTimeRatio();
        CMTime v46 = v51;
        CMTimeConvertScale(&v47, &v46, 600, kCMTimeRoundingMethod_RoundAwayFromZero);
        CMTime v51 = v47;
        memset(&v47, 0, sizeof(v47));
        long long v21 = *((_OWORD *)begin + 3);
        v45.CMTimeEpoch epoch = *((void *)begin + 8);
        *(_OWORD *)&v45.value = v21;
        CMTime v44 = v51;
        CMTimeSubtract(&v47, &v45, &v44);
        CMTime v42 = v47;
        CMTimeEpoch v22 = *((void *)begin + 5);
        *(_OWORD *)&v41.value = *(_OWORD *)((char *)begin + 24);
        v41.CMTimeEpoch epoch = v22;
        CMTimeMaximum(&v43, &v42, &v41);
        long long v23 = *(_OWORD *)&v43.value;
        *((void *)begin + 8) = v43.epoch;
        *((_OWORD *)begin + 3) = v23;
        begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 72);
      }
    }
    else
    {
      memset(&v60, 0, sizeof(v60));
      CMTime lhs = *(CMTime *)&v68[8];
      *(_OWORD *)&rhs.value = *(_OWORD *)buf;
      rhs.CMTimeEpoch epoch = *(void *)v68;
      CMTimeSubtract(&v60, &lhs, &rhs);
      memset(&v57, 0, sizeof(v57));
      CMTime v38 = *(CMTime *)&v68[8];
      CMTime v37 = (CMTime)*a3;
      CMTimeSubtract(&v57, &v38, &v37);
      long long v9 = self->_solveResults.__begin_;
      int64_t v10 = self->_solveResults.__end_;
      while (v9 != v10)
      {
        memset(&v54, 0, sizeof(v54));
        long long v11 = *(_OWORD *)((char *)v9 + 24);
        v36.CMTimeEpoch epoch = *((void *)v9 + 5);
        *(_OWORD *)&v36.value = v11;
        long long v12 = *(_OWORD *)v9;
        v35.CMTimeEpoch epoch = *((void *)v9 + 2);
        *(_OWORD *)&v35.value = v12;
        CMTimeSubtract(&v54, &v36, &v35);
        memset(&v51, 0, sizeof(v51));
        CMTime v34 = v57;
        CMTime v33 = v54;
        CMTime v32 = v60;
        CMTimeMultiplyTimeByTimeRatio();
        CMTime time = v51;
        CMTimeConvertScale(&v47, &time, 600, kCMTimeRoundingMethod_RoundAwayFromZero);
        CMTime v51 = v47;
        memset(&v47, 0, sizeof(v47));
        long long v13 = *(_OWORD *)((char *)v9 + 24);
        v30.CMTimeEpoch epoch = *((void *)v9 + 5);
        *(_OWORD *)&v30.value = v13;
        CMTime v29 = v51;
        CMTimeSubtract(&v47, &v30, &v29);
        CMTime v28 = v47;
        CMTimeEpoch v14 = *((void *)v9 + 2);
        *(_OWORD *)&v27.value = *(_OWORD *)v9;
        v27.CMTimeEpoch epoch = v14;
        CMTimeMaximum(&v43, &v28, &v27);
        long long v15 = *(_OWORD *)&v43.value;
        CMTimeEpoch epoch = v43.epoch;
        *((void *)v9 + 5) = v43.epoch;
        *(_OWORD *)((char *)v9 + 24) = v15;
        *((_OWORD *)v9 + 3) = *(_OWORD *)((char *)v9 + 24);
        *((void *)v9 + 8) = epoch;
        long long v9 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v9 + 72);
      }
    }
LABEL_14:
    BOOL v8 = 1;
    goto LABEL_15;
  }
  BOOL v8 = 0;
LABEL_15:
  v24 = self->_log;
  v25 = v24;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v24))
  {
    LOWORD(v60.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v25, OS_SIGNPOST_INTERVAL_END, v5, "StoryAutoEditDurationConstraintSolverMax", "", (uint8_t *)&v60, 2u);
  }

  return v8;
}

- (BOOL)solveForPreferredDuration:(id *)a3
{
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  long long v6 = self->_log;
  long long v7 = v6;
  unint64_t v8 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "StoryAutoEditDurationConstraintSolverPreferred", "", buf, 2u);
  }

  std::vector<PFStoryDurationInfo>::__assign_with_size[abi:ne180100]<PFStoryDurationInfo*,PFStoryDurationInfo*>(&self->_solveResults.__begin_, (char *)self->_infos.__begin_, (char *)self->_infos.__end_, 0x8E38E38E38E38E39 * ((self->_infos.__end_ - self->_infos.__begin_) >> 3));
  *(_OWORD *)buf = 0u;
  memset(v79, 0, 56);
  SumDurations((CMTime *)buf, (CMTime *)self->_infos.__begin_, (CMTime *)self->_infos.__end_);
  *(_OWORD *)&time1.value = *(_OWORD *)buf;
  time1.CMTimeEpoch epoch = *(void *)v79;
  CMTime time2 = (CMTime)*a3;
  if (CMTimeCompare(&time1, &time2) > 0) {
    goto LABEL_5;
  }
  CMTime v75 = *(CMTime *)&v79[8];
  CMTime v74 = (CMTime)*a3;
  if (CMTimeCompare(&v75, &v74) < 0)
  {
    unint64_t v34 = v5 - 1;
    os_signpost_id_t v35 = v5;
    int64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, 0x8E38E38E38E38E39 * ((self->_solveResults.__end_ - self->_solveResults.__begin_) >> 3));
    CMTime v73 = *(CMTime *)&v79[8];
    while ([v10 count])
    {
      CMTime v72 = v73;
      CMTime v71 = (CMTime)*a3;
      if ((CMTimeCompare(&v72, &v71) & 0x80000000) == 0) {
        break;
      }
      memset(&v70, 0, sizeof(v70));
      CMTime v69 = *(CMTime *)&v79[32];
      CMTime v68 = v73;
      CMTimeSubtract(&v70, &v69, &v68);
      memset(&v67, 0, sizeof(v67));
      CMTime v66 = (CMTime)*a3;
      CMTime v65 = v73;
      CMTimeSubtract(&v67, &v66, &v65);
      CMTime v63 = v67;
      CMTime v62 = v70;
      CMTimeMinimum(&v64, &v63, &v62);
      CMTime v67 = v64;
      memset(&v64, 0, sizeof(v64));
      CMTime v61 = v67;
      CMTimeMultiplyByRatio(&v64, &v61, 1, [v10 count]);
      CMTime v73 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      begin = self->_solveResults.__begin_;
      if (self->_solveResults.__end_ != begin)
      {
        uint64_t v22 = 0;
        unint64_t v23 = 0;
        do
        {
          if ([v10 containsIndex:v23])
          {
            memset(&v60, 0, sizeof(v60));
            v24 = (char *)begin + v22;
            long long v25 = *(_OWORD *)((char *)begin + v22 + 48);
            v59.CMTimeEpoch epoch = *(void *)((char *)begin + v22 + 64);
            *(_OWORD *)&v59.value = v25;
            long long v26 = *(_OWORD *)((char *)begin + v22 + 24);
            v58.CMTimeEpoch epoch = *(void *)((char *)begin + v22 + 40);
            *(_OWORD *)&v58.value = v26;
            CMTimeSubtract(&v60, &v59, &v58);
            CMTime v57 = v60;
            CMTime v56 = v64;
            CMTime v27 = (long long *)((char *)begin + v22 + 24);
            if (CMTimeCompare(&v57, &v56) <= 0)
            {
              *CMTime v27 = *((_OWORD *)v24 + 3);
              *((void *)v24 + 5) = *((void *)v24 + 8);
              [v10 removeIndex:v23];
            }
            else
            {
              long long v28 = *v27;
              v54.CMTimeEpoch epoch = *((void *)v24 + 5);
              *(_OWORD *)&v54.value = v28;
              CMTime v53 = v64;
              CMTimeAdd(&v55, &v54, &v53);
              long long v29 = *(_OWORD *)&v55.value;
              *((void *)v24 + 5) = v55.epoch;
              *CMTime v27 = v29;
            }
          }
          CMTime v52 = v73;
          CMTimeEpoch v30 = *(void *)((char *)begin + v22 + 40);
          *(_OWORD *)&v51.value = *(_OWORD *)((char *)begin + v22 + 24);
          v51.CMTimeEpoch epoch = v30;
          CMTimeAdd(&v60, &v52, &v51);
          CMTime v73 = v60;
          ++v23;
          begin = self->_solveResults.__begin_;
          v22 += 72;
        }
        while (0x8E38E38E38E38E39 * ((self->_solveResults.__end_ - begin) >> 3) > v23);
      }
    }
    goto LABEL_30;
  }
  CMTime v50 = *(CMTime *)&v79[8];
  CMTime v49 = (CMTime)*a3;
  if (CMTimeCompare(&v50, &v49) >= 1)
  {
    unint64_t v34 = v5 - 1;
    os_signpost_id_t v35 = v5;
    int64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, 0x8E38E38E38E38E39 * ((self->_solveResults.__end_ - self->_solveResults.__begin_) >> 3));
    CMTime v73 = *(CMTime *)&v79[8];
    while ([v10 count])
    {
      CMTime v48 = v73;
      CMTime v47 = (CMTime)*a3;
      if (CMTimeCompare(&v48, &v47) < 1) {
        break;
      }
      memset(&v70, 0, sizeof(v70));
      CMTime lhs = v73;
      CMTime rhs = (CMTime)*a3;
      CMTimeSubtract(&v70, &lhs, &rhs);
      memset(&v67, 0, sizeof(v67));
      CMTime time = v70;
      CMTimeMultiplyByRatio(&v67, &time, 1, [v10 count]);
      CMTime v73 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      long long v11 = self->_solveResults.__begin_;
      if (self->_solveResults.__end_ != v11)
      {
        uint64_t v12 = 0;
        unint64_t v13 = 0;
        do
        {
          if ([v10 containsIndex:v13])
          {
            CMTimeEpoch v14 = (char *)v11 + v12;
            memset(&v64, 0, sizeof(v64));
            long long v15 = *(_OWORD *)((char *)v11 + v12 + 24);
            v43.CMTimeEpoch epoch = *(void *)((char *)v11 + v12 + 40);
            *(_OWORD *)&v43.value = v15;
            long long v16 = *(_OWORD *)((char *)v11 + v12);
            v42.CMTimeEpoch epoch = *(void *)((char *)v11 + v12 + 16);
            *(_OWORD *)&v42.value = v16;
            CMTimeSubtract(&v64, &v43, &v42);
            CMTime v41 = v64;
            CMTime v40 = v67;
            v17 = (long long *)((char *)v11 + v12 + 24);
            if (CMTimeCompare(&v41, &v40) <= 0)
            {
              long long *v17 = *(_OWORD *)v14;
              *(void *)((char *)v11 + v12 + 40) = *((void *)v14 + 2);
              [v10 removeIndex:v13];
            }
            else
            {
              long long v18 = *v17;
              v39.CMTimeEpoch epoch = *(void *)((char *)v11 + v12 + 40);
              *(_OWORD *)&v39.value = v18;
              CMTime v38 = v67;
              CMTimeSubtract(&v60, &v39, &v38);
              long long v19 = *(_OWORD *)&v60.value;
              *(void *)((char *)v11 + v12 + 40) = v60.epoch;
              long long *v17 = v19;
            }
          }
          CMTime v37 = v73;
          CMTimeEpoch v20 = *(void *)((char *)v11 + v12 + 40);
          *(_OWORD *)&v36.value = *(_OWORD *)((char *)v11 + v12 + 24);
          v36.CMTimeEpoch epoch = v20;
          CMTimeAdd(&v64, &v37, &v36);
          CMTime v73 = v64;
          ++v13;
          long long v11 = self->_solveResults.__begin_;
          v12 += 72;
        }
        while (v13 < 0x8E38E38E38E38E39 * ((self->_solveResults.__end_ - v11) >> 3));
      }
    }
LABEL_30:

    BOOL v9 = 1;
    unint64_t v8 = v34;
    os_signpost_id_t v5 = v35;
    goto LABEL_31;
  }
LABEL_5:
  BOOL v9 = 0;
LABEL_31:
  v31 = self->_log;
  CMTime v32 = v31;
  if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v31))
  {
    LOWORD(v73.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v32, OS_SIGNPOST_INTERVAL_END, v5, "StoryAutoEditDurationConstraintSolverPreferred", "", (uint8_t *)&v73, 2u);
  }

  return v9;
}

- (void)addClipWithDurationInfo:(id *)a3
{
  CMTime time1 = (CMTime)a3->var0;
  os_signpost_id_t v5 = (CMTime *)MEMORY[0x1E4F1FA48];
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (CMTimeCompare(&time1, &time2) <= 0) {
    PXAssertGetLog();
  }
  CMTime var1 = (CMTime)a3->var1;
  CMTime v30 = *v5;
  if (CMTimeCompare(&var1, &v30) <= 0) {
    PXAssertGetLog();
  }
  CMTime v29 = (CMTime)a3->var1;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var0 = a3->var0;
  if (CMTimeCompare(&v29, (CMTime *)&var0) < 0) {
    PXAssertGetLog();
  }
  end = self->_infos.__end_;
  value = self->_infos.__end_cap_.__value_;
  if (end >= value)
  {
    begin = self->_infos.__begin_;
    unint64_t v13 = 0x8E38E38E38E38E39 * ((end - begin) >> 3);
    unint64_t v14 = v13 + 1;
    if (v13 + 1 > 0x38E38E38E38E38ELL) {
      std::vector<PXStoryAutoEditComposabilityScores>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v15 = 0x8E38E38E38E38E39 * ((value - begin) >> 3);
    if (2 * v15 > v14) {
      unint64_t v14 = 2 * v15;
    }
    if (v15 >= 0x1C71C71C71C71C7) {
      unint64_t v16 = 0x38E38E38E38E38ELL;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16) {
      unint64_t v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<PFStoryDurationInfo>>(v16);
    }
    else {
      uint64_t v17 = 0;
    }
    unint64_t v18 = v16 + 72 * v13;
    long long v19 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v16 + 72 * v17);
    *(_OWORD *)unint64_t v18 = *(_OWORD *)&a3->var0.var0;
    long long v20 = *(_OWORD *)&a3->var0.var3;
    long long v21 = *(_OWORD *)&a3->var1.var1;
    long long v22 = *(_OWORD *)&a3->var2.var0;
    *(void *)(v18 + 64) = a3->var2.var3;
    *(_OWORD *)(v18 + 32) = v21;
    *(_OWORD *)(v18 + 48) = v22;
    *(_OWORD *)(v18 + 16) = v20;
    long long v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v18 + 72);
    v24 = self->_infos.__begin_;
    unint64_t v23 = self->_infos.__end_;
    if (v23 != v24)
    {
      do
      {
        *(_OWORD *)(v18 - 72) = *(_OWORD *)((char *)v23 - 72);
        long long v25 = *(_OWORD *)((char *)v23 - 56);
        long long v26 = *(_OWORD *)((char *)v23 - 40);
        long long v27 = *(_OWORD *)((char *)v23 - 24);
        *(void *)(v18 - 8) = *((void *)v23 - 1);
        *(_OWORD *)(v18 - 24) = v27;
        *(_OWORD *)(v18 - 40) = v26;
        *(_OWORD *)(v18 - 56) = v25;
        v18 -= 72;
        unint64_t v23 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v23 - 72);
      }
      while (v23 != v24);
      unint64_t v23 = self->_infos.__begin_;
    }
    self->_infos.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v18;
    self->_infos.__end_ = v11;
    self->_infos.__end_cap_.__value_ = v19;
    if (v23) {
      operator delete(v23);
    }
  }
  else
  {
    *(_OWORD *)end = *(_OWORD *)&a3->var0.var0;
    long long v8 = *(_OWORD *)&a3->var0.var3;
    long long v9 = *(_OWORD *)&a3->var1.var1;
    long long v10 = *(_OWORD *)&a3->var2.var0;
    *((void *)end + 8) = a3->var2.var3;
    *((_OWORD *)end + 2) = v9;
    *((_OWORD *)end + 3) = v10;
    *((_OWORD *)end + 1) = v8;
    long long v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 72);
  }
  self->_infos.__end_ = v11;
}

- (unint64_t)count
{
  return 0x8E38E38E38E38E39 * ((self->_infos.__end_ - self->_infos.__begin_) >> 3);
}

- (PXStoryAutoEditDurationConstraintSolver)init
{
  v13.receiver = self;
  v13.super_class = (Class)PXStoryAutoEditDurationConstraintSolver;
  v2 = [(PXStoryAutoEditDurationConstraintSolver *)&v13 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v5 = (const char *)[v4 UTF8String];
    os_log_t v6 = os_log_create((const char *)*MEMORY[0x1E4F8C518], v5);
    log = v2->_log;
    v2->_log = (OS_os_log *)v6;

    p_infos = &v2->_infos;
    begin = v2->_infos.__begin_;
    if (begin)
    {
      v2->_infos.__end_ = begin;
      operator delete(begin);
      p_infos->__begin_ = 0;
      v2->_infos.__end_ = 0;
      v2->_infos.__end_cap_.__value_ = 0;
    }
    p_solveResults = &v2->_solveResults;
    long long v10 = v2->_solveResults.__begin_;
    p_infos->__begin_ = 0;
    v2->_infos.__end_ = 0;
    v2->_infos.__end_cap_.__value_ = 0;
    if (v10)
    {
      v2->_solveResults.__end_ = v10;
      operator delete(v10);
      p_solveResults->__begin_ = 0;
      v2->_solveResults.__end_ = 0;
      v2->_solveResults.__end_cap_.__value_ = 0;
    }
    p_solveResults->__begin_ = 0;
    v2->_solveResults.__end_ = 0;
    v2->_solveResults.__end_cap_.__value_ = 0;
  }
  return v2;
}

@end