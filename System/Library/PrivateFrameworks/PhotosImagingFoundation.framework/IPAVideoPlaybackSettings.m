@interface IPAVideoPlaybackSettings
+ (Class)expectedOperationClass;
+ (Class)operationClassForIdentifier:(id)a3;
+ (id)playbackSettingsForAdjustments:(id)a3;
+ (id)presetifyAdjustmentStack:(id)a3;
+ (void)initialize;
- ($222789CE95D16A76D31543149FD45E96)naturalPlaybackRange;
- ($222789CE95D16A76D31543149FD45E96)scaledPlaybackRangeForScaledDuration:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalTimeForPosterFrame;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalTimeFromScaledTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)scaledDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)scaledTimeFromNaturalTime:(SEL)a3;
- (BOOL)isEqualToDescription:(id)a3;
- (IPAVideoPlaybackSettings)initWithOperations:(id)a3;
- (IPAVideoPlaybackSettings)initWithOperations:(id)a3 naturalDuration:(id *)a4;
- (id)archivalRepresentation;
- (id)debugDescription;
- (id)descriptionByAddingOperation:(id)a3;
- (id)descriptionByAddingOperation:(id)a3 atIndex:(unint64_t)a4;
- (id)descriptionByInsertingOrReplacingOperation:(id)a3;
- (id)descriptionByReplacingOperation:(id)a3 atIndex:(unint64_t)a4;
- (id)descriptionWithOperations:(id)a3;
- (id)posterFrameOperation;
- (id)slomoOperation;
- (id)trimOperation;
- (unint64_t)sortOrderForOperationWithIdentifier:(id)a3;
@end

@implementation IPAVideoPlaybackSettings

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalTimeForPosterFrame
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA48];
  v5 = [(IPAVideoPlaybackSettings *)self posterFrameOperation];
  v6 = [(IPAVideoPlaybackSettings *)self trimOperation];
  v7 = v6;
  if (v5)
  {
    [v5 frameTime];
LABEL_5:
    *(_OWORD *)&retstr->var0 = v9;
    retstr->var3 = v10;
    goto LABEL_6;
  }
  if (v6)
  {
    [v6 startTime];
    goto LABEL_5;
  }
LABEL_6:

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalTimeFromScaledTime:(SEL)a3
{
  *retstr = *a4;
  v7 = [(IPAVideoPlaybackSettings *)self slomoOperation];
  v8 = v7;
  memset(v21, 0, sizeof(v21));
  long long v20 = 0u;
  if (v7)
  {
    [v7 timeRange];
    if ((BYTE12(v20) & 1) == 0
      || (BYTE4(v21[1]) & 1) == 0
      || *((void *)&v21[1] + 1)
      || (*((void *)&v21[0] + 1) & 0x8000000000000000) != 0
      || (long long v11 = *(_OWORD *)((char *)v21 + 8),
          *(void *)&long long v12 = *((void *)&v21[1] + 1),
          CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48],
          CMTimeCompare((CMTime *)&v11, &time2)))
    {
      memset(&time2, 0, sizeof(time2));
      [(IPAVideoPlaybackSettings *)self naturalDuration];
      [v8 rate];
      long long v15 = *(_OWORD *)&a4->var0;
      int64_t var3 = a4->var3;
      CMTime v14 = time2;
      long long v11 = v20;
      long long v12 = v21[0];
      long long v13 = v21[1];
      IPANaturalTimeFromScaledTime(&v15, (long long *)&v14.value, &v11, (uint64_t)&v17, v9);
      *(_OWORD *)&retstr->var0 = v17;
      retstr->int64_t var3 = v18;
    }
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)scaledTimeFromNaturalTime:(SEL)a3
{
  [(IPAVideoPlaybackSettings *)self naturalPlaybackRange];
  long long v12 = *(_OWORD *)&a4->var0;
  *(void *)&long long v13 = a4->var3;
  IPAClipTime((uint64_t)&v12, v22, (uint64_t)v21);
  *(_OWORD *)&a4->var0 = v21[0];
  int64_t v7 = *(void *)&v21[1];
  a4->int64_t var3 = *(void *)&v21[1];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&a4->var0;
  retstr->int64_t var3 = v7;
  v8 = [(IPAVideoPlaybackSettings *)self slomoOperation];
  unsigned int v9 = v8;
  memset(v21, 0, sizeof(v21));
  if (v8)
  {
    [v8 timeRange];
    if ((BYTE12(v21[0]) & 1) == 0
      || (BYTE4(v21[2]) & 1) == 0
      || *((void *)&v21[2] + 1)
      || (*((void *)&v21[1] + 1) & 0x8000000000000000) != 0
      || (long long v12 = *(_OWORD *)((char *)&v21[1] + 8),
          *(void *)&long long v13 = *((void *)&v21[2] + 1),
          CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48],
          CMTimeCompare((CMTime *)&v12, &time2)))
    {
      memset(&time2, 0, sizeof(time2));
      [(IPAVideoPlaybackSettings *)self naturalDuration];
      [v9 rate];
      long long v16 = *(_OWORD *)&a4->var0;
      int64_t var3 = a4->var3;
      CMTime v15 = time2;
      long long v12 = v21[0];
      long long v13 = v21[1];
      long long v14 = v21[2];
      IPAScaledTimeFromNaturalTime(&v16, (long long *)&v15.value, &v12, (uint64_t)&v18, v10);
      *(_OWORD *)&retstr->var0 = v18;
      retstr->int64_t var3 = v19;
    }
  }

  return result;
}

- ($222789CE95D16A76D31543149FD45E96)scaledPlaybackRangeForScaledDuration:(SEL)a3
{
  if (a4->var2)
  {
    memset(&time, 0, sizeof(time));
    [(IPAVideoPlaybackSettings *)self naturalPlaybackRange];
    CMTime start = time.start;
    memset(&v17, 0, sizeof(v17));
    CMTimeRange range = time;
    CMTimeRangeGetEnd(&v17, &range);
    memset(&range, 0, 24);
    memset(&v15, 0, sizeof(v15));
    int64_t v7 = [(IPAVideoPlaybackSettings *)self slomoOperation];
    if (v7)
    {
      CMTime time1 = start;
      CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      CMTimeMaximum(&range.start, &time1, &time2);
      memset(&time1, 0, sizeof(time1));
      CMTime time2 = v17;
      [(IPAVideoPlaybackSettings *)self scaledTimeFromNaturalTime:&time2];
      CMTime time2 = time1;
      CMTime v12 = (CMTime)*a4;
      CMTimeMinimum(&v15, &time2, &v12);
    }
    else
    {
      range.CMTime start = start;
      CMTime v15 = v17;
    }
    *(_OWORD *)&retstr->var0.int64_t var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
    CMTime time1 = range.start;
    CMTime time2 = v15;
    CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &time1, &time2);
  }
  else
  {
    time.CMTime start = (CMTime)*a4;
    CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &time.start);
    unsigned int v9 = (IPAVideoPlaybackSettings *)_PFAssertFailHandler();
    return [(IPAVideoPlaybackSettings *)v11 naturalPlaybackRange];
  }
  return result;
}

- ($222789CE95D16A76D31543149FD45E96)naturalPlaybackRange
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = [(IPAVideoPlaybackSettings *)self trimOperation];
  memset(&v19, 0, sizeof(v19));
  [(IPAVideoPlaybackSettings *)self naturalDuration];
  *(_OWORD *)&start.start.value = *MEMORY[0x1E4F1FA48];
  start.start.epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  CMTimeRangeMake(&v19, &start.start, &duration);
  *(_OWORD *)&retstr->var0.int64_t var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  if (!v5) {
    goto LABEL_4;
  }
  memset(&v17[1], 0, sizeof(CMTimeRange));
  [v5 trimRange];
  if (!((unsigned __int128)0 >> 96)
    || (v17[1].duration.flags & 1) == 0
    || v17[1].duration.epoch
    || v17[1].duration.value < 0)
  {
    CMTimeRange start = v17[1];
    CMTime v15 = (__CFString *)CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &start);
    _PFAssertContinueHandler();

LABEL_4:
    long long v6 = *(_OWORD *)&v19.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v19.start.value;
    *(_OWORD *)&retstr->var0.int64_t var3 = v6;
    long long v7 = *(_OWORD *)&v19.duration.timescale;
    goto LABEL_5;
  }
  CMTimeRange start = v17[1];
  CMTimeRange range2 = v19;
  memset(v17, 0, 48);
  IPAClipTimeRange((uint64_t)&start, (uint64_t)&range2, v17);
  CMTimeRange start = v17[1];
  CMTimeRange range2 = v17[0];
  if (!CMTimeRangeEqual(&start, &range2))
  {
    unsigned int v9 = IPAVideoGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      CMTimeRange start = v17[1];
      CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      long long v11 = (__CFString *)CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &start);
      CMTimeRange start = v19;
      CMTime v12 = (__CFString *)CMTimeRangeCopyDescription(v10, &start);
      CMTimeRange start = v17[0];
      long long v13 = (__CFString *)CMTimeRangeCopyDescription(v10, &start);
      LODWORD(start.start.value) = 138412802;
      *(CMTimeValue *)((char *)&start.start.value + 4) = (CMTimeValue)v11;
      LOWORD(start.start.flags) = 2112;
      *(void *)((char *)&start.start.flags + 2) = v12;
      HIWORD(start.start.epoch) = 2112;
      start.duration.value = (CMTimeValue)v13;
      _os_log_impl(&dword_1DD3FD000, v9, OS_LOG_TYPE_DEBUG, "trimRange %@ falls outside of natural playback range %@; clipping to %@ ",
        (uint8_t *)&start,
        0x20u);
    }
  }
  long long v14 = *(_OWORD *)&v17[0].start.epoch;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v17[0].start.value;
  *(_OWORD *)&retstr->var0.int64_t var3 = v14;
  long long v7 = *(_OWORD *)&v17[0].duration.timescale;
LABEL_5:
  *(_OWORD *)&retstr->var1.var1 = v7;

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)scaledDuration
{
  memset(&v14, 0, sizeof(v14));
  [(IPAVideoPlaybackSettings *)self naturalPlaybackRange];
  *retstr = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v14.duration;
  v5 = [(IPAVideoPlaybackSettings *)self slomoOperation];
  if (v5)
  {
    long long v12 = *(_OWORD *)&v14.start.value;
    CMTimeEpoch epoch = v14.start.epoch;
    memset(&v11, 0, sizeof(v11));
    CMTimeRange range = v14;
    CMTimeRangeGetEnd(&v11, &range);
    memset(&v9[1], 0, sizeof(CMTime));
    *(_OWORD *)&range.start.value = v12;
    range.start.CMTimeEpoch epoch = epoch;
    [(IPAVideoPlaybackSettings *)self scaledTimeFromNaturalTime:&range];
    memset(v9, 0, 24);
    range.CMTime start = v11;
    [(IPAVideoPlaybackSettings *)self scaledTimeFromNaturalTime:&range];
    memset(&range, 0, sizeof(range));
    CMTime start = v9[1];
    CMTime v7 = v9[0];
    CMTimeRangeFromTimeToTime(&range, &start, &v7);
    *retstr = ($3CC8671D27C23BF42ADDB32F2B5E48AE)range.duration;
  }

  return result;
}

- (id)descriptionByInsertingOrReplacingOperation:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    _PFAssertFailHandler();
  }
  v27 = v4;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obj = self;
  uint64_t v5 = [(IPAEditDescription *)obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v5)
  {
    CMTime v7 = 0;
    v28 = 0;
    v8 = 0;
    goto LABEL_18;
  }
  uint64_t v6 = v5;
  CMTime v7 = 0;
  v28 = 0;
  v8 = 0;
  uint64_t v9 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v37 != v9) {
        objc_enumerationMutation(obj);
      }
      CMTime v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      uint64_t v12 = objc_opt_class();
      if (v12 == objc_opt_class())
      {
        long long v13 = v8;
        CMTimeRange v14 = v7;
        v8 = v11;
      }
      else if (v12 == objc_opt_class())
      {
        long long v13 = v28;
        CMTimeRange v14 = v7;
        v28 = v11;
      }
      else
      {
        long long v13 = v7;
        CMTimeRange v14 = v11;
        if (v12 != objc_opt_class()) {
          continue;
        }
      }
      id v15 = v11;

      CMTime v7 = v14;
    }
    uint64_t v6 = [(IPAEditDescription *)obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  }
  while (v6);
LABEL_18:

  uint64_t v16 = objc_opt_class();
  if (v16 == objc_opt_class())
  {
    id v19 = v27;

    id v18 = v28;
    v8 = v19;
  }
  else if (v16 == objc_opt_class())
  {
    id v18 = v27;

    if (v7)
    {
      memset(&v35[1], 0, sizeof(CMTimeRange));
      [v7 timeRange];
      memset(v35, 0, 48);
      [v18 trimRange];
      CMTimeRange time1 = v35[1];
      memset(&v34, 0, sizeof(v34));
      CMTimeRange time2 = v35[0];
      IPAClipTimeRange((uint64_t)&time1, (uint64_t)&time2, &v34);
      if ((v34.start.flags & 1) != 0
        && (v34.duration.flags & 1) != 0
        && !v34.duration.epoch
        && (v34.duration.value & 0x8000000000000000) == 0)
      {
        time1.CMTime start = v34.duration;
        long long v29 = *MEMORY[0x1E4F1FA48];
        *(_OWORD *)&time2.start.value = *MEMORY[0x1E4F1FA48];
        CMTimeEpoch v24 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
        time2.start.CMTimeEpoch epoch = v24;
        if (!CMTimeCompare(&time1.start, &time2.start))
        {
          *(_OWORD *)&time1.start.value = *(_OWORD *)&v35[0].start.value;
          time1.start.CMTimeEpoch epoch = v35[0].start.epoch;
          *(_OWORD *)&time2.start.value = v29;
          time2.start.CMTimeEpoch epoch = v24;
          CMTimeRangeMake(&v34, &time1.start, &time2.start);
        }
      }
      CMTimeRange time1 = v35[1];
      CMTimeRange time2 = v34;
      if (!CMTimeRangeEqual(&time1, &time2))
      {
        v25 = [IPASloMoOperation alloc];
        [v7 rate];
        CMTimeRange time1 = v34;
        uint64_t v26 = -[IPASloMoOperation initWithTimeRange:rate:](v25, "initWithTimeRange:rate:", &time1);

        CMTime v7 = (void *)v26;
      }
      if (v8)
      {
        memset(&time2, 0, 24);
        [v8 frameTime];
        CMTimeRange time1 = v35[0];
        CMTime time = time2.start;
        if (!CMTimeRangeContainsTime(&time1, &time))
        {

          v8 = 0;
        }
      }
    }
  }
  else
  {
    if (v16 == objc_opt_class())
    {
      id v17 = v27;

      CMTime v7 = v17;
    }
    id v18 = v28;
  }
  long long v20 = objc_opt_new();
  uint64_t v21 = v20;
  if (v8) {
    [v20 addObject:v8];
  }
  if (v18) {
    [v21 addObject:v18];
  }
  if (v7) {
    [v21 addObject:v7];
  }
  v22 = [(IPAVideoPlaybackSettings *)obj descriptionWithOperations:v21];

  return v22;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (id)debugDescription
{
  v3 = [MEMORY[0x1E4F28E78] string];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(IPAVideoPlaybackSettings *)self posterFrameOperation];
  uint64_t v6 = [(IPAVideoPlaybackSettings *)self trimOperation];
  CMTime v7 = [(IPAVideoPlaybackSettings *)self slomoOperation];
  [v3 appendFormat:@"<%@:%p pf=%@ trim=%@ slomo=%@>", v4, self, v5, v6, v7];

  return v3;
}

- (id)archivalRepresentation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = self;
  uint64_t v5 = [(IPAEditDescription *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "archivalRepresentation", v12);
        if (v9)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v3 addObject:v9];
          }
          else
          {
            uint64_t v12 = v9;
            _PFAssertContinueHandler();
          }
        }
      }
      uint64_t v6 = [(IPAEditDescription *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  CFAllocatorRef v10 = objc_opt_new();
  [v10 setAdjustments:v3];

  return v10;
}

- (id)slomoOperation
{
  return [(IPAVideoPlaybackSettings *)self operationWithIdentifier:@"SloMo"];
}

- (id)trimOperation
{
  return [(IPAVideoPlaybackSettings *)self operationWithIdentifier:@"Trim"];
}

- (id)posterFrameOperation
{
  return [(IPAVideoPlaybackSettings *)self operationWithIdentifier:@"PosterFrame"];
}

- (id)descriptionByReplacingOperation:(id)a3 atIndex:(unint64_t)a4
{
  id v4 = a3;
  uint64_t v5 = (IPAVideoPlaybackSettings *)_PFAssertFailHandler();
  return [(IPAVideoPlaybackSettings *)v5 descriptionByAddingOperation:v7];
}

- (id)descriptionByAddingOperation:(id)a3
{
  id v3 = a3;
  id v4 = (IPAVideoPlaybackSettings *)_PFAssertFailHandler();
  return [(IPAVideoPlaybackSettings *)v4 descriptionByAddingOperation:v6 atIndex:v7];
}

- (id)descriptionByAddingOperation:(id)a3 atIndex:(unint64_t)a4
{
  id v4 = a3;
  SEL v5 = (IPAVideoPlaybackSettings *)_PFAssertFailHandler();
  return [(IPAVideoPlaybackSettings *)v5 descriptionWithOperations:v7];
}

- (id)descriptionWithOperations:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IPAVideoPlaybackSettings;
  uint64_t v4 = [(IPAEditDescription *)&v7 descriptionWithOperations:a3];
  if (v4)
  {
    int64_t epoch = self->_naturalDuration.epoch;
    *(_OWORD *)(v4 + 16) = *(_OWORD *)&self->_naturalDuration.value;
    *(void *)(v4 + 32) = epoch;
  }
  return (id)v4;
}

- (unint64_t)sortOrderForOperationWithIdentifier:(id)a3
{
  return 0;
}

- (BOOL)isEqualToDescription:(id)a3
{
  id v4 = a3;
  [(IPAVideoPlaybackSettings *)self naturalDuration];
  if (v4) {
    [v4 naturalDuration];
  }
  else {
    memset(&v20, 0, sizeof(v20));
  }
  if (CMTimeCompare(&time1, &v20)
    || (uint64_t v5 = [v4 operationCount], v5 != -[IPAEditDescription operationCount](self, "operationCount")))
  {
    char v10 = 0;
  }
  else
  {
    uint64_t v6 = [(IPAVideoPlaybackSettings *)self posterFrameOperation];
    uint64_t v7 = [v4 posterFrameOperation];
    v8 = (void *)v7;
    if (v6 && v7) {
      char v9 = [(id)v6 isEqual:v7];
    }
    else {
      char v9 = (v6 | v7) == 0;
    }
    uint64_t v12 = [(IPAVideoPlaybackSettings *)self trimOperation];
    uint64_t v13 = [v4 trimOperation];
    long long v14 = (void *)v13;
    if (v12 && v13) {
      char v15 = [(id)v12 isEqual:v13];
    }
    else {
      char v15 = (v12 | v13) == 0;
    }
    uint64_t v16 = [(IPAVideoPlaybackSettings *)self slomoOperation];
    uint64_t v17 = [v4 slomoOperation];
    uint64_t v18 = (void *)v17;
    if (v16 && v17) {
      char v19 = [(id)v16 isEqual:v17];
    }
    else {
      char v19 = (v16 | v17) == 0;
    }
    char v10 = v9 & v15 & v19;
  }
  return v10;
}

- (IPAVideoPlaybackSettings)initWithOperations:(id)a3 naturalDuration:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = MEMORY[0x1E4F1FA48];
  if ((a4->var2 & 0x1D) != 1
    || (time1 = (CMTime)*a4, CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&time1, &time2) < 0))
  {
    v8 = IPAVideoGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      CMTime time1 = (CMTime)*a4;
      char v9 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &time1);
      LODWORD(time1.value) = 138412290;
      *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v9;
      _os_log_impl(&dword_1DD3FD000, v8, OS_LOG_TYPE_DEBUG, "%@ is either invalid, non-numeric or negative", (uint8_t *)&time1, 0xCu);
    }
    *(_OWORD *)&a4->var0 = *(_OWORD *)v7;
    a4->int64_t var3 = *(void *)(v7 + 16);
  }
  char v10 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * v15);
        uint64_t v17 = (objc_class *)objc_opt_class();
        uint64_t v18 = NSStringFromClass(v17);
        [v10 setObject:v16 forKeyedSubscript:v18];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v13);
  }

  char v19 = [v10 allValues];
  v23.receiver = self;
  v23.super_class = (Class)IPAVideoPlaybackSettings;
  CMTime v20 = [(IPAEditDescription *)&v23 initWithOperations:v19];

  if (v20)
  {
    int64_t var3 = a4->var3;
    *(_OWORD *)&v20->_naturalDuration.value = *(_OWORD *)&a4->var0;
    v20->_naturalDuration.int64_t epoch = var3;
  }

  return v20;
}

- (IPAVideoPlaybackSettings)initWithOperations:(id)a3
{
  id v3 = a3;
  id v4 = (void *)_PFAssertFailHandler();
  return (IPAVideoPlaybackSettings *)+[IPAVideoPlaybackSettings presetifyAdjustmentStack:v6];
}

+ (id)presetifyAdjustmentStack:(id)a3
{
  return a3;
}

+ (Class)operationClassForIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = v3;
    SEL v5 = (objc_class *)(id)[(id)s_identifierToClassMapping objectForKeyedSubscript:v3];

    return v5;
  }
  else
  {
    uint64_t v7 = (void *)_PFAssertFailHandler();
    return (Class)+[IPAVideoPlaybackSettings playbackSettingsForAdjustments:v9];
  }
}

+ (id)playbackSettingsForAdjustments:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v22 = objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v21 = v3;
    id v4 = [v3 adjustments];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          char v10 = [v9 identifier];
          id v11 = +[IPAVideoPlaybackSettings operationClassForIdentifier:v10];

          if (v11)
          {
            id v12 = [v11 alloc];
            uint64_t v13 = [v9 settings];
            uint64_t v14 = [v12 initWithSettingsDictionary:v13];

            if (v14)
            {
              [v22 addObject:v14];
            }
            else
            {
              uint64_t v16 = IPAVideoGetLog();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v17 = [v9 settings];
                *(_DWORD *)buf = 138412546;
                long long v29 = v17;
                __int16 v30 = 2112;
                uint64_t v31 = v11;
                _os_log_impl(&dword_1DD3FD000, v16, OS_LOG_TYPE_DEFAULT, "failed to unarchive %@ via %@", buf, 0x16u);
              }
              uint64_t v14 = 0;
            }
          }
          else
          {
            uint64_t v14 = IPAVideoGetLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v15 = [v9 identifier];
              *(_DWORD *)buf = 138412290;
              long long v29 = v15;
              _os_log_impl(&dword_1DD3FD000, v14, OS_LOG_TYPE_DEFAULT, "missing adjustment class for identifier %@", buf, 0xCu);
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v6);
    }

    uint64_t v18 = [IPAVideoPlaybackSettings alloc];
    id v3 = v21;
    [v21 naturalDuration];
    char v19 = [(IPAVideoPlaybackSettings *)v18 initWithOperations:v22 naturalDuration:v23];
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

+ (Class)expectedOperationClass
{
  return (Class)objc_opt_class();
}

+ (void)initialize
{
  v5[3] = *MEMORY[0x1E4F143B8];
  if (!s_identifierToClassMapping)
  {
    v4[0] = @"PosterFrame";
    v5[0] = objc_opt_class();
    v4[1] = @"Trim";
    v5[1] = objc_opt_class();
    v4[2] = @"SloMo";
    v5[2] = objc_opt_class();
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
    id v3 = (void *)s_identifierToClassMapping;
    s_identifierToClassMapping = v2;
  }
}

@end