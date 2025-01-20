@interface IPATrimOperation
- ($222789CE95D16A76D31543149FD45E96)trimRange;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)endTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime;
- (BOOL)isEqualToOperation:(id)a3;
- (IPATrimOperation)initWithOperation:(id)a3;
- (IPATrimOperation)initWithSettingsDictionary:(id)a3;
- (IPATrimOperation)initWithStartTime:(id *)a3 endTime:(id *)a4;
- (IPATrimOperation)initWithTrimRange:(id *)a3;
- (id)debugDescription;
- (id)identifier;
- (id)settingsDictionary;
- (id)trimRangeDictionary;
@end

@implementation IPATrimOperation

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)endTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- (BOOL)isEqualToOperation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (char *)v4;
    CMTime time1 = (CMTime)self->_startTime;
    long long v6 = *(_OWORD *)(v5 + 8);
    v10.epoch = *((void *)v5 + 3);
    *(_OWORD *)&v10.value = v6;
    if (CMTimeCompare(&time1, &v10))
    {
      BOOL v7 = 0;
    }
    else
    {
      CMTime time1 = (CMTime)self->_endTime;
      long long v8 = *((_OWORD *)v5 + 2);
      v10.epoch = *((void *)v5 + 6);
      *(_OWORD *)&v10.value = v8;
      BOOL v7 = CMTimeCompare(&time1, &v10) == 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  CMTime time = (CMTime)self->_startTime;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v6 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &time);
  CMTime time = (CMTime)self->_endTime;
  BOOL v7 = (__CFString *)CMTimeCopyDescription(v5, &time);
  long long v8 = [v3 stringWithFormat:@"<%@:%p startTime=%@ endTime=%@>", v4, self, v6, v7];

  return v8;
}

- (id)identifier
{
  v2 = @"Trim";
  return @"Trim";
}

- (id)settingsDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  $95D729B680665BEAEFA1D6FCA8238556 startTime = self->_startTime;
  CFDictionaryRef v3 = CMTimeCopyAsDictionary((CMTime *)&startTime, 0);
  $95D729B680665BEAEFA1D6FCA8238556 startTime = self->_endTime;
  CFDictionaryRef v4 = CMTimeCopyAsDictionary((CMTime *)&startTime, 0);
  CFDictionaryRef v5 = v4;
  long long v6 = 0;
  if (v3 && v4)
  {
    v9[0] = @"startTime";
    v9[1] = @"endTime";
    v10[0] = v3;
    v10[1] = v4;
    long long v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  }

  return v6;
}

- (id)trimRangeDictionary
{
  time1.start = (CMTime)self->_startTime;
  long long v6 = *MEMORY[0x1E4F1FA48];
  *(_OWORD *)&time2.start.value = *MEMORY[0x1E4F1FA48];
  CMTimeEpoch v3 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  time2.start.epoch = v3;
  if (CMTimeCompare(&time1.start, &time2.start)
    || (*(_OWORD *)&time1.start.value = *(_OWORD *)&self->_endTime.value,
        time1.start.epoch = self->_endTime.epoch,
        *(_OWORD *)&time2.start.value = v6,
        time2.start.epoch = v3,
        CMTimeCompare(&time1.start, &time2.start)))
  {
    memset(&time1, 0, sizeof(time1));
    [(IPATrimOperation *)self trimRange];
    CMTimeRange time2 = time1;
    CFDictionaryRef v4 = CMTimeRangeCopyAsDictionary(&time2, 0);
  }
  else
  {
    CFDictionaryRef v4 = 0;
  }
  return v4;
}

- ($222789CE95D16A76D31543149FD45E96)trimRange
{
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  CMTime start = (CMTime)self->_startTime;
  $95D729B680665BEAEFA1D6FCA8238556 endTime = self->_endTime;
  return ($222789CE95D16A76D31543149FD45E96 *)CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, (CMTime *)&endTime);
}

- (IPATrimOperation)initWithSettingsDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IPATrimOperation;
  CFDictionaryRef v5 = [(IPAEditOperation *)&v15 init];
  if (v5)
  {
    long long v6 = [v4 objectForKeyedSubscript:@"startTime"];

    BOOL v7 = [v4 objectForKeyedSubscript:@"endTime"];

    memset(&v14, 0, sizeof(v14));
    CMTimeMakeFromDictionary(&v14, (CFDictionaryRef)v6);
    memset(&v13, 0, sizeof(v13));
    CMTimeMakeFromDictionary(&v13, (CFDictionaryRef)v7);
    if ((v14.flags & 1) != 0 && (v13.flags & 1) != 0 && (CMTime time1 = v14, v11 = v13, CMTimeCompare(&time1, &v11) <= 0))
    {
      CMTimeEpoch epoch = v14.epoch;
      *(_OWORD *)(v5 + 8) = *(_OWORD *)&v14.value;
      *((void *)v5 + 3) = epoch;
      CMTimeEpoch v10 = v13.epoch;
      *((_OWORD *)v5 + 2) = *(_OWORD *)&v13.value;
      *((void *)v5 + 6) = v10;
    }
    else
    {

      CFDictionaryRef v5 = 0;
    }
  }

  return (IPATrimOperation *)v5;
}

- (IPATrimOperation)initWithOperation:(id)a3
{
  id v4 = (char *)a3;
  v10.receiver = self;
  v10.super_class = (Class)IPATrimOperation;
  CFDictionaryRef v5 = [(IPAEditOperation *)&v10 initWithOperation:v4];
  long long v6 = (IPATrimOperation *)v5;
  if (v5)
  {
    uint64_t v7 = *((void *)v4 + 3);
    *(_OWORD *)(v5 + 8) = *(_OWORD *)(v4 + 8);
    *((void *)v5 + 3) = v7;
    uint64_t v8 = *((void *)v4 + 6);
    *((_OWORD *)v5 + 2) = *((_OWORD *)v4 + 2);
    *((void *)v5 + 6) = v8;
  }

  return v6;
}

- (IPATrimOperation)initWithStartTime:(id *)a3 endTime:(id *)a4
{
  if ((a3->var2 & 1) == 0)
  {
    CMTime time = *(CMTime *)a3;
    long long v6 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &time);
LABEL_5:
    _PFAssertContinueHandler();

LABEL_6:
    return 0;
  }
  if ((a4->var2 & 1) == 0)
  {
    CMTime time = *(CMTime *)a4;
    long long v6 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &time);
    goto LABEL_5;
  }
  CMTime time = *(CMTime *)a3;
  CMTime time2 = *(CMTime *)a4;
  if (CMTimeCompare(&time, &time2) >= 1)
  {
    _PFAssertContinueHandler();
    goto LABEL_6;
  }
  v11.receiver = self;
  v11.super_class = (Class)IPATrimOperation;
  result = [(IPAEditOperation *)&v11 init];
  if (result)
  {
    int64_t var3 = a3->var3;
    *(_OWORD *)&result->_startTime.value = *(_OWORD *)&a3->var0;
    result->_startTime.CMTimeEpoch epoch = var3;
    int64_t v10 = a4->var3;
    *(_OWORD *)&result->_endTime.value = *(_OWORD *)&a4->var0;
    result->_endTime.CMTimeEpoch epoch = v10;
  }
  return result;
}

- (IPATrimOperation)initWithTrimRange:(id *)a3
{
  long long v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&v7.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&v7.start.CMTimeEpoch epoch = v5;
  *(_OWORD *)&v7.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v8, &v7);
  *(_OWORD *)&v7.start.value = *(_OWORD *)&a3->var0.var0;
  v7.start.CMTimeEpoch epoch = a3->var0.var3;
  return [(IPATrimOperation *)self initWithStartTime:&v7 endTime:&v8];
}

@end