@interface TVPTimeRange
+ ($A0D62BC7BB322857EA05296DE7D5C3FF)forwardmostCMTimeRangeInCMTimeRanges:(SEL)a3;
- (BOOL)containsTime:(double)a3;
- (BOOL)isEqual:(id)a3;
- (TVPTimeRange)initWithCMTimeRange:(id *)a3;
- (TVPTimeRange)initWithStartTime:(double)a3 duration:(double)a4;
- (TVPTimeRange)initWithStartTime:(double)a3 endTime:(double)a4;
- (double)duration;
- (double)endTime;
- (double)startTime;
- (id)description;
- (id)intersectTimeRange:(id)a3;
- (void)setDuration:(double)a3;
- (void)setStartTime:(double)a3;
@end

@implementation TVPTimeRange

+ ($A0D62BC7BB322857EA05296DE7D5C3FF)forwardmostCMTimeRangeInCMTimeRanges:(SEL)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [v5 count];
  if (!v5 || !v6) {
    goto LABEL_37;
  }
  if (v6 == 1)
  {
    v7 = [v5 firstObject];
    v8 = v7;
    if (v7)
    {
      [v7 CMTimeRangeValue];
    }
    else
    {
      *(_OWORD *)&retstr->var0.var3 = 0u;
      *(_OWORD *)&retstr->var1.var1 = 0u;
      *(_OWORD *)&retstr->var0.$3CC8671D27C23BF42ADDB32F2B5E48AE var0 = 0u;
    }

    goto LABEL_40;
  }
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.$3CC8671D27C23BF42ADDB32F2B5E48AE var0 = 0u;
  *(_OWORD *)start = *MEMORY[0x263F010A0];
  *(void *)&start[16] = *(void *)(MEMORY[0x263F010A0] + 16);
  CMTime duration = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  CMTimeRangeMake((CMTimeRange *)retstr, (CMTime *)start, &duration);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v26 = 0u;
        memset(start, 0, sizeof(start));
        if (v14)
        {
          [v14 CMTimeRangeValue];
          if (start[12])
          {
            BOOL v15 = (BYTE4(v26) & 0x1D) == 1 && (start[12] & 0x1D) == 1;
            BOOL v16 = !v15 || (BYTE4(v26) & 0x11) == 17;
            BOOL v17 = v16 || (start[12] & 0x11) == 17;
            BOOL v18 = v17 || (BYTE4(v26) & 1) == 0;
            if (!v18 && *((void *)&v26 + 1) == 0 && (*(void *)&start[24] & 0x8000000000000000) == 0)
            {
              CMTime duration = *(CMTime *)start;
              $3CC8671D27C23BF42ADDB32F2B5E48AE var0 = retstr->var0;
              if (CMTimeCompare(&duration, (CMTime *)&var0) >= 1)
              {
                long long v20 = *(_OWORD *)&start[16];
                *(_OWORD *)&retstr->var0.$3CC8671D27C23BF42ADDB32F2B5E48AE var0 = *(_OWORD *)start;
                *(_OWORD *)&retstr->var0.var3 = v20;
                *(_OWORD *)&retstr->var1.var1 = v26;
              }
            }
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }

  if ((retstr->var0.var2 & 0x1D) != 1 || (retstr->var1.var2 & 0x1D) != 1)
  {
LABEL_37:
    uint64_t v21 = MEMORY[0x263F010D0];
    long long v22 = *(_OWORD *)(MEMORY[0x263F010D0] + 16);
    *(_OWORD *)&retstr->var0.$3CC8671D27C23BF42ADDB32F2B5E48AE var0 = *MEMORY[0x263F010D0];
    *(_OWORD *)&retstr->var0.var3 = v22;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v21 + 32);
  }
LABEL_40:

  return result;
}

- (TVPTimeRange)initWithStartTime:(double)a3 endTime:(double)a4
{
  return [(TVPTimeRange *)self initWithStartTime:a3 duration:a4 - a3];
}

- (TVPTimeRange)initWithCMTimeRange:(id *)a3
{
  double Seconds = 0.0;
  if ((a3->var0.var2 & 1) != 0
    && (a3->var1.var2 & 1) != 0
    && !a3->var1.var3
    && ((a3->var1.var2 & 0x1D) == 1 ? (BOOL v7 = (a3->var0.var2 & 0x1D) == 1) : (BOOL v7 = 0), v7))
  {
    p_var1 = &a3->var1;
    double v5 = 0.0;
    if ((a3->var1.var0 & 0x8000000000000000) == 0)
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE var0 = a3->var0;
      double Seconds = CMTimeGetSeconds((CMTime *)&var0);
      $3CC8671D27C23BF42ADDB32F2B5E48AE var0 = *p_var1;
      double v5 = CMTimeGetSeconds((CMTime *)&var0);
    }
  }
  else
  {
    double v5 = 0.0;
  }
  return [(TVPTimeRange *)self initWithStartTime:Seconds duration:v5];
}

- (TVPTimeRange)initWithStartTime:(double)a3 duration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TVPTimeRange;
  result = [(TVPTimeRange *)&v7 init];
  if (result)
  {
    result->_startTime = a3;
    result->_CMTime duration = a4;
  }
  return result;
}

- (double)endTime
{
  [(TVPTimeRange *)self startTime];
  double v4 = v3;
  [(TVPTimeRange *)self duration];
  return v4 + v5;
}

- (BOOL)containsTime:(double)a3
{
  [(TVPTimeRange *)self startTime];
  if (v5 > a3) {
    return 0;
  }
  [(TVPTimeRange *)self endTime];
  return v7 > a3;
}

- (id)intersectTimeRange:(id)a3
{
  id v4 = a3;
  double v5 = [[TVPTimeRange alloc] initWithStartTime:0.0 duration:0.0];
  if (v4)
  {
    memset(&v21, 0, sizeof(v21));
    [(TVPTimeRange *)self startTime];
    CMTimeMakeWithSeconds(&start, v6, 1000000);
    [(TVPTimeRange *)self duration];
    CMTimeMakeWithSeconds(&duration, v7, 1000000);
    CMTimeRangeMake(&v21, &start, &duration);
    memset(&v18, 0, sizeof(v18));
    [v4 startTime];
    CMTimeMakeWithSeconds(&v17, v8, 1000000);
    [v4 duration];
    CMTimeMakeWithSeconds(&v16, v9, 1000000);
    CMTimeRangeMake(&v18, &v17, &v16);
    CMTimeRange range = v21;
    memset(&v15, 0, sizeof(v15));
    CMTimeRange v13 = v18;
    CMTimeRangeGetIntersection(&v15, &range, &v13);
    uint64_t v10 = [TVPTimeRange alloc];
    CMTimeRange range = v15;
    uint64_t v11 = [(TVPTimeRange *)v10 initWithCMTimeRange:&range];

    double v5 = (TVPTimeRange *)v11;
  }

  return v5;
}

- (id)description
{
  [(TVPTimeRange *)self startTime];
  uint64_t v4 = v3;
  [(TVPTimeRange *)self duration];
  uint64_t v6 = v5;
  [(TVPTimeRange *)self endTime];
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Start time: %f End time: %f Duration: %f", v4, v7, v6);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [v5 startTime];
    double v7 = v6;
    [(TVPTimeRange *)self startTime];
    if (v7 == v8)
    {
      [v5 duration];
      double v10 = v9;
      [(TVPTimeRange *)self duration];
      BOOL v12 = v10 == v11;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_CMTime duration = a3;
}

@end