@interface PXConcreteAudioCueSource
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)cueTimeRange;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange;
- ($6C09B6239031FAA14F415FD72DC837AB)bestCueInRange:(SEL)a3 preferredTime:(id *)a4;
- ($6C09B6239031FAA14F415FD72DC837AB)cues;
- ($6C09B6239031FAA14F415FD72DC837AB)firstCueFollowingTime:(SEL)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (PXConcreteAudioCueSource)init;
- (PXConcreteAudioCueSource)initWithNumberOfCues:(int64_t)a3 configuration:(id)a4;
- (id)diagnosticStringForTimeRange:(id *)a3 indicatorTime:(id *)a4 rangeIndicatorTimeRange:(id *)a5 stringLength:(int64_t)a6;
- (int64_t)_indexOfFirstCueFollowingTime:(id *)a3;
- (int64_t)_indexOfFirstCueInRange:(id *)a3;
- (int64_t)firstCueIndex;
- (int64_t)numberOfCues;
- (void)dealloc;
- (void)enumerateCuesInRange:(id *)a3 withBlock:(id)a4;
@end

@implementation PXConcreteAudioCueSource

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange
{
  long long v3 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var1;
  return self;
}

- (int64_t)numberOfCues
{
  return self->_numberOfCues;
}

- ($6C09B6239031FAA14F415FD72DC837AB)cues
{
  return self->_cues;
}

- (int64_t)firstCueIndex
{
  if ([(PXConcreteAudioCueSource *)self numberOfCues] <= 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)cueTimeRange
{
  result = [(PXConcreteAudioCueSource *)self numberOfCues];
  if (result)
  {
    v6 = result;
    v7 = [(PXConcreteAudioCueSource *)self cues];
    v8 = &v7[(void)v6];
    long long v9 = *(_OWORD *)&v7->var0.var0;
    start.epoch = v7->var0.var3;
    *(_OWORD *)&start.value = v9;
    long long v10 = *(_OWORD *)&v8[-1].var0.var0;
    v13.epoch = v8[-1].var0.var3;
    *(_OWORD *)&v13.value = v10;
    return ($28FEB1B56BB3ED5175BFC6DE64DE503F *)CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, &v13);
  }
  else
  {
    uint64_t v11 = MEMORY[0x1E4F1FA20];
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
    *(_OWORD *)&retstr->var0.var3 = v12;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v11 + 32);
  }
  return result;
}

- (int64_t)_indexOfFirstCueInRange:(id *)a3
{
  if ((a3->var0.var2 & 1) == 0) {
    return [(PXConcreteAudioCueSource *)self firstCueIndex];
  }
  if ((a3->var1.var2 & 1) == 0) {
    return [(PXConcreteAudioCueSource *)self firstCueIndex];
  }
  if (a3->var1.var3) {
    return [(PXConcreteAudioCueSource *)self firstCueIndex];
  }
  if (a3->var1.var0 < 0) {
    return [(PXConcreteAudioCueSource *)self firstCueIndex];
  }
  [(PXConcreteAudioCueSource *)self cueTimeRange];
  long long v7 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v7;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  if (CMTimeRangeContainsTimeRange(&range, &otherRange)) {
    return [(PXConcreteAudioCueSource *)self firstCueIndex];
  }
  v8 = self;
  uint64_t v9 = [(PXConcreteAudioCueSource *)v8 cues];
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  range.start.epoch = a3->var0.var3;
  uint64_t v10 = [(PXConcreteAudioCueSource *)v8 _indexOfFirstCueFollowingTime:&range];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t v5 = v10;
  uint64_t v11 = v9 + 32 * v10;
  long long v12 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v12;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  long long v13 = *(_OWORD *)v11;
  uint64_t v14 = *(void *)(v11 + 16);
  if (!PXCMTimeRangeContainsTimeInclusive((uint64_t)&range, (uint64_t)&v13)) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (int64_t)_indexOfFirstCueFollowingTime:(id *)a3
{
  long long v3 = self;
  [(PXConcreteAudioCueSource *)v3 cues];
  [(PXConcreteAudioCueSource *)v3 numberOfCues];
  PXFirstIndexInSortedRangePassingTest();
}

BOOL __58__PXConcreteAudioCueSource__indexOfFirstCueFollowingTime___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32) + 32 * a2;
  long long v3 = *(_OWORD *)v2;
  time1.epoch = *(void *)(v2 + 16);
  *(_OWORD *)&time1.value = v3;
  CMTime v5 = *(CMTime *)(a1 + 40);
  return CMTimeCompare(&time1, &v5) >= 0;
}

- (id)diagnosticStringForTimeRange:(id *)a3 indicatorTime:(id *)a4 rangeIndicatorTimeRange:(id *)a5 stringLength:(int64_t)a6
{
  id v24 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:a6];
  CMTime var1 = (CMTime)a3->var1;
  memset(&v36, 0, sizeof(v36));
  long long v12 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v12;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v36, &range);
  memset(&v34, 0, sizeof(v34));
  range.CMTime start = var1;
  CMTimeMultiplyByRatio(&v34, &range.start, 1, a6);
  uint64_t v25 = [(PXConcreteAudioCueSource *)self numberOfCues];
  [(PXConcreteAudioCueSource *)self cues];
  CMTime var0 = (CMTime)a3->var0;
  id v13 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v13 appendString:@"           "];
  int64_t v14 = [v13 length];
  if ((a5->var0.var2 & 1) == 0 || (a5->var1.var2 & 1) == 0 || a5->var1.var3 || a5->var1.var0 < 0)
  {
    long long v15 = *(_OWORD *)&a3->var0.var0;
    long long v16 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&a5->var0.var3 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&a5->var1.CMTime var1 = v16;
    *(_OWORD *)&a5->var0.CMTime var0 = v15;
    v17 = @" ";
    v23 = @" ";
  }
  else
  {
    v23 = @"}";
    v17 = @"{";
  }
  while (1)
  {
    *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
    range.start.epoch = a5->var0.var3;
    CMTime rhs = v34;
    CMTimeSubtract(&time2, &range.start, &rhs);
    range.CMTime start = var0;
    if ((CMTimeCompare(&range.start, &time2) & 0x80000000) == 0 || v14 >= a6) {
      break;
    }
    range.CMTime start = var0;
    CMTime rhs = v34;
    CMTimeAdd(&var0, &range.start, &rhs);
    [v13 appendString:@" "];
    int64_t v14 = [v13 length];
  }
  if (v14 >= a6) {
    goto LABEL_14;
  }
  range.CMTime start = var0;
  CMTime rhs = (CMTime)a5->var0;
  if ((CMTimeCompare(&range.start, &rhs) & 0x80000000) == 0) {
    goto LABEL_14;
  }
  CMTime rhs = var0;
  CMTime time1 = v34;
  CMTimeAdd(&range.start, &rhs, &time1);
  CMTime var0 = range.start;
  while (1)
  {
    [v13 appendString:v17];
    int64_t v14 = [v13 length];
LABEL_14:
    *(_OWORD *)&range.start.value = *(_OWORD *)&a4->var0;
    range.start.epoch = a4->var3;
    CMTime rhs = v34;
    CMTimeSubtract(&v29, &range.start, &rhs);
    range.CMTime start = var0;
    if ((CMTimeCompare(&range.start, &v29) & 0x80000000) == 0 || v14 >= a6) {
      break;
    }
    CMTime rhs = var0;
    CMTime time1 = v34;
    CMTimeAdd(&range.start, &rhs, &time1);
    CMTime var0 = range.start;
    v17 = @" ";
  }
  if (v14 >= a6) {
    goto LABEL_21;
  }
  range.CMTime start = var0;
  CMTime rhs = (CMTime)*a4;
  if ((CMTimeCompare(&range.start, &rhs) & 0x80000000) == 0) {
    goto LABEL_21;
  }
  CMTime rhs = var0;
  CMTime time1 = v34;
  CMTimeAdd(&range.start, &rhs, &time1);
  CMTime var0 = range.start;
  for (i = @"◎"; ; i = @" ")
  {
    [v13 appendString:i];
    int64_t v14 = [v13 length];
LABEL_21:
    long long v19 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&range.start.epoch = v19;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a5->var1.var1;
    CMTimeRangeGetEnd(&lhs, &range);
    range.CMTime start = v34;
    CMTimeSubtract(&v28, &lhs, &range.start);
    range.CMTime start = var0;
    if ((CMTimeCompare(&range.start, &v28) & 0x80000000) == 0 || v14 >= a6) {
      break;
    }
    CMTime rhs = var0;
    CMTime time1 = v34;
    CMTimeAdd(&range.start, &rhs, &time1);
    CMTime var0 = range.start;
  }
  if (v14 >= a6)
  {
    v21 = v24;
  }
  else
  {
    long long v20 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&range.start.epoch = v20;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a5->var1.var1;
    CMTimeRangeGetEnd(&v26, &range);
    range.CMTime start = var0;
    v21 = v24;
    if (CMTimeCompare(&range.start, &v26) < 0)
    {
      [v13 appendString:v23];
      int64_t v14 = [v13 length];
    }
  }
  if (v14 < a6)
  {
    do
      [v13 appendString:@" "];
    while ([v13 length] < a6);
  }
  [v21 appendString:v13];
  [v21 appendString:@"\n"];
  if (v25 >= 1)
  {
    *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
    range.start.epoch = a3->var0.var3;
    PXFirstIndexInSortedRangePassingTest();
  }
  [v21 appendString:@"  Cues: --\n"];

  return v21;
}

BOOL __108__PXConcreteAudioCueSource_diagnosticStringForTimeRange_indicatorTime_rangeIndicatorTimeRange_stringLength___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32) + 32 * a2;
  long long v3 = *(_OWORD *)v2;
  time1.epoch = *(void *)(v2 + 16);
  *(_OWORD *)&time1.value = v3;
  CMTime v5 = *(CMTime *)(a1 + 40);
  return CMTimeCompare(&time1, &v5) >= 0;
}

- (void)enumerateCuesInRange:(id *)a3 withBlock:(id)a4
{
  v6 = a4;
  char v21 = 0;
  long long v18 = *(_OWORD *)&a3->var0.var0;
  *(void *)&long long v19 = a3->var0.var3;
  int64_t v7 = [(PXConcreteAudioCueSource *)self _indexOfFirstCueFollowingTime:&v18];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v7;
    uint64_t v9 = self;
    uint64_t v10 = [(PXConcreteAudioCueSource *)v9 cues];
    if (v8 < [(PXConcreteAudioCueSource *)v9 numberOfCues])
    {
      uint64_t v11 = v10 + 32 * v8;
      do
      {
        long long v12 = *(_OWORD *)&a3->var0.var3;
        long long v18 = *(_OWORD *)&a3->var0.var0;
        long long v19 = v12;
        long long v20 = *(_OWORD *)&a3->var1.var1;
        long long v16 = *(_OWORD *)v11;
        uint64_t v17 = *(void *)(v11 + 16);
        if (!PXCMTimeRangeContainsTimeInclusive((uint64_t)&v18, (uint64_t)&v16)) {
          break;
        }
        if (v21) {
          break;
        }
        id v13 = (void (*)(void *, long long *, char *))v6[2];
        long long v14 = *(_OWORD *)v11;
        long long v15 = *(_OWORD *)(v11 + 16);
        v11 += 32;
        long long v18 = v14;
        long long v19 = v15;
        v13(v6, &v18, &v21);
        ++v8;
      }
      while (v8 < [(PXConcreteAudioCueSource *)v9 numberOfCues]);
    }
  }
}

- ($6C09B6239031FAA14F415FD72DC837AB)bestCueInRange:(SEL)a3 preferredTime:(id *)a4
{
  result = [(PXConcreteAudioCueSource *)self numberOfCues];
  if (result
    && (long long v10 = *(_OWORD *)&a4->var0.var3,
        long long v34 = *(_OWORD *)&a4->var0.var0,
        long long v35 = v10,
        long long v36 = *(_OWORD *)&a4->var1.var1,
        result = [(PXConcreteAudioCueSource *)self _indexOfFirstCueInRange:&v34],
        result != ($6C09B6239031FAA14F415FD72DC837AB *)0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v11 = result;
    long long v12 = self;
    uint64_t v13 = [(PXConcreteAudioCueSource *)v12 cues];
    *(void *)&long long v34 = 0;
    *((void *)&v34 + 1) = &v34;
    *(void *)&long long v35 = 0x4010000000;
    *((void *)&v35 + 1) = &unk_1AB5D584F;
    long long v14 = (long long *)(v13 + 32 * (void)v11);
    long long v15 = v14[1];
    long long v36 = *v14;
    long long v37 = v15;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__PXConcreteAudioCueSource_bestCueInRange_preferredTime___block_invoke;
    aBlock[3] = &__block_descriptor_56_e20_d40__0______qiIq_q_8l;
    long long v32 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    long long v16 = _Block_copy(aBlock);
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    double v30 = 0.0;
    uint64_t v17 = (double (*)(void *, long long *))v16[2];
    long long v18 = *(_OWORD *)(*((void *)&v34 + 1) + 48);
    long long v22 = *(_OWORD *)(*((void *)&v34 + 1) + 32);
    long long v23 = v18;
    double v30 = v17(v16, &v22);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __57__PXConcreteAudioCueSource_bestCueInRange_preferredTime___block_invoke_2;
    v25[3] = &unk_1E5DC3330;
    long long v19 = v16;
    id v26 = v19;
    v27 = v29;
    CMTime v28 = &v34;
    long long v20 = *(_OWORD *)&a4->var0.var3;
    long long v22 = *(_OWORD *)&a4->var0.var0;
    long long v23 = v20;
    long long v24 = *(_OWORD *)&a4->var1.var1;
    [(PXConcreteAudioCueSource *)v12 enumerateCuesInRange:&v22 withBlock:v25];
    long long v21 = *(_OWORD *)(*((void *)&v34 + 1) + 48);
    *(_OWORD *)&retstr->var0.CMTime var0 = *(_OWORD *)(*((void *)&v34 + 1) + 32);
    *(_OWORD *)&retstr->var0.int64_t var3 = v21;

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(&v34, 8);
  }
  else
  {
    *(_OWORD *)&retstr->var0.CMTime var0 = 0u;
    *(_OWORD *)&retstr->var0.int64_t var3 = 0u;
  }
  return result;
}

double __57__PXConcreteAudioCueSource_bestCueInRange_preferredTime___block_invoke(uint64_t a1, CMTime *a2)
{
  *(_OWORD *)&time1.CMTimeValue value = *(_OWORD *)&a2->value;
  CMTimeValue value = a2[1].value;
  time1.epoch = a2->epoch;
  memset(&time2, 0, sizeof(time2));
  if (!CMTimeCompare(&time1, &time2) && !value) {
    return 2.22507386e-308;
  }
  double v5 = (double)a2[1].value;
  if ((*(_DWORD *)(a1 + 44) & 0x1D) == 1)
  {
    CMTime time1 = *a2;
    CMTime time2 = *(CMTime *)(a1 + 32);
    CMTimeSubtract(&time, &time1, &time2);
    return v5 + fabs(CMTimeGetSeconds(&time)) * -2.22044605e-16;
  }
  return v5;
}

__n128 __57__PXConcreteAudioCueSource_bestCueInRange_preferredTime___block_invoke_2(void *a1, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a1[4];
  int64_t v7 = *(double (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v6 + 16);
  long long v8 = a2[1];
  v13[0] = *a2;
  v13[1] = v8;
  result.n128_f64[0] = v7(v6, v13, a3, a4);
  uint64_t v10 = *(void *)(a1[5] + 8);
  if (result.n128_f64[0] > *(double *)(v10 + 24))
  {
    *(void *)(v10 + 24) = result.n128_u64[0];
    uint64_t v11 = *(void *)(a1[6] + 8);
    __n128 result = *(__n128 *)a2;
    long long v12 = a2[1];
    *(_OWORD *)(v11 + 32) = *a2;
    *(_OWORD *)(v11 + 48) = v12;
  }
  return result;
}

- ($6C09B6239031FAA14F415FD72DC837AB)firstCueFollowingTime:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
  __n128 result = [(PXConcreteAudioCueSource *)self _indexOfFirstCueFollowingTime:&v10];
  if (result == ($6C09B6239031FAA14F415FD72DC837AB *)0x7FFFFFFFFFFFFFFFLL)
  {
    *(_OWORD *)&retstr->var0.CMTime var0 = 0u;
    *(_OWORD *)&retstr->var0.int64_t var3 = 0u;
  }
  else
  {
    int64_t v7 = result;
    __n128 result = [(PXConcreteAudioCueSource *)self cues];
    long long v8 = &result[(void)v7];
    long long v9 = *(_OWORD *)&v8->var0.var3;
    *(_OWORD *)&retstr->var0.CMTime var0 = *(_OWORD *)&v8->var0.var0;
    *(_OWORD *)&retstr->var0.int64_t var3 = v9;
  }
  return result;
}

- (BOOL)isEmpty
{
  return [(PXConcreteAudioCueSource *)self numberOfCues] == 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXConcreteAudioCueSource *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      uint64_t v6 = [(PXConcreteAudioCueSource *)v5 numberOfCues];
      if (v6 != [(PXConcreteAudioCueSource *)self numberOfCues]) {
        goto LABEL_19;
      }
      if (v5) {
        [(PXConcreteAudioCueSource *)v5 timeRange];
      }
      else {
        memset(&range1, 0, sizeof(range1));
      }
      [(PXConcreteAudioCueSource *)self timeRange];
      if (CMTimeRangeEqual(&range1, &v17))
      {
        long long v8 = self;
        uint64_t v9 = [(PXConcreteAudioCueSource *)v8 cues];
        uint64_t v10 = [(PXConcreteAudioCueSource *)v5 cues];
        uint64_t v11 = [(PXConcreteAudioCueSource *)v8 numberOfCues];
        BOOL v7 = 1;
        if (v9 != v10)
        {
          unint64_t v12 = v11;
          if (v11)
          {
            BOOL v7 = 0;
            if (v9)
            {
              if (v10)
              {
                BOOL v7 = 0;
                uint64_t v13 = 0;
                do
                {
                  *(_OWORD *)&v20.CMTimeValue value = *(_OWORD *)v9;
                  uint64_t v14 = *(void *)(v9 + 24);
                  v20.epoch = *(void *)(v9 + 16);
                  *(_OWORD *)&v19.CMTimeValue value = *(_OWORD *)v10;
                  uint64_t v15 = *(void *)(v10 + 24);
                  v19.epoch = *(void *)(v10 + 16);
                  CMTime time1 = v20;
                  CMTime time2 = v19;
                  if (CMTimeCompare(&time1, &time2)) {
                    break;
                  }
                  if (v14 != v15) {
                    break;
                  }
                  v10 += 32;
                  v9 += 32;
                  BOOL v7 = ++v13 >= v12;
                }
                while (v12 != v13);
              }
            }
          }
        }
      }
      else
      {
LABEL_19:
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (void)dealloc
{
  free(self->_cues);
  v3.receiver = self;
  v3.super_class = (Class)PXConcreteAudioCueSource;
  [(PXConcreteAudioCueSource *)&v3 dealloc];
}

- (PXConcreteAudioCueSource)init
{
  return [(PXConcreteAudioCueSource *)self initWithNumberOfCues:0 configuration:0];
}

- (PXConcreteAudioCueSource)initWithNumberOfCues:(int64_t)a3 configuration:(id)a4
{
  uint64_t v6 = (void (**)(id, void))a4;
  v21.receiver = self;
  v21.super_class = (Class)PXConcreteAudioCueSource;
  BOOL v7 = [(PXConcreteAudioCueSource *)&v21 init];
  long long v8 = v7;
  if (v7)
  {
    v7->_numberOfCues = a3;
    if (a3 >= 1)
    {
      uint64_t v9 = ($6C09B6239031FAA14F415FD72DC837AB *)malloc_type_calloc(a3, 0x20uLL, 0x1000040E0EAB150uLL);
      v8->_cues = v9;
      int64_t v10 = a3;
      do
      {
        *(_OWORD *)&v9->var0.CMTime var0 = 0uLL;
        *(_OWORD *)&v9->var0.int64_t var3 = 0uLL;
        ++v9;
        --v10;
      }
      while (v10);
      ((void (**)(id, $6C09B6239031FAA14F415FD72DC837AB *))v6)[2](v6, v8->_cues);
      cues = v8->_cues;
      unint64_t v12 = &cues[a3];
      long long v13 = *(_OWORD *)&cues->var0.var0;
      start.epoch = cues->var0.var3;
      *(_OWORD *)&start.CMTimeValue value = v13;
      long long v14 = *(_OWORD *)&v12[-1].var0.var0;
      v18.epoch = v12[-1].var0.var3;
      *(_OWORD *)&v18.CMTimeValue value = v14;
      CMTimeRangeFromTimeToTime(&v20, &start, &v18);
      long long v16 = *(_OWORD *)&v20.start.epoch;
      long long v15 = *(_OWORD *)&v20.duration.timescale;
      *(_OWORD *)&v8->_timeRange.start.CMTimeValue value = *(_OWORD *)&v20.start.value;
      *(_OWORD *)&v8->_timeRange.start.epoch = v16;
      *(_OWORD *)&v8->_timeRange.duration.timescale = v15;
    }
  }

  return v8;
}

@end