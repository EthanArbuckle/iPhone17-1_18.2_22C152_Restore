@interface NSArray(Cinematography)
- (uint64_t)_firstIndexAtOrAfterTime:()Cinematography;
- (uint64_t)_firstIndexAtOrAfterTime:()Cinematography startIndex:lastIfEqual:timeSelector:;
- (uint64_t)_firstIndexAtOrAfterTime:()Cinematography timeSelector:;
- (uint64_t)_indexAtOrBeforeTime:()Cinematography;
- (uint64_t)_indexAtOrBeforeTime:()Cinematography timeSelector:;
- (uint64_t)_indexNearestTime:()Cinematography;
- (uint64_t)_indexNearestTime:()Cinematography timeSelector:;
- (uint64_t)_indexRangeOfTimeRange:()Cinematography;
- (uint64_t)_indexRangeOfTimeRange:()Cinematography timeSelector:;
- (uint64_t)_timeRangeOfIndexRange:()Cinematography;
- (unint64_t)_firstIndexAfterTime:()Cinematography startIndex:timeSelector:;
- (void)_timeForObject:()Cinematography timeSelector:;
- (void)_timeRangeOfIndexRange:()Cinematography timeSelector:;
@end

@implementation NSArray(Cinematography)

- (uint64_t)_indexNearestTime:()Cinematography
{
  long long v4 = *a3;
  uint64_t v5 = *((void *)a3 + 2);
  return [a1 _indexNearestTime:&v4 timeSelector:sel_time];
}

- (uint64_t)_indexAtOrBeforeTime:()Cinematography
{
  long long v4 = *a3;
  uint64_t v5 = *((void *)a3 + 2);
  return [a1 _indexAtOrBeforeTime:&v4 timeSelector:sel_time];
}

- (uint64_t)_firstIndexAtOrAfterTime:()Cinematography
{
  long long v4 = *a3;
  uint64_t v5 = *((void *)a3 + 2);
  return [a1 _firstIndexAtOrAfterTime:&v4 timeSelector:sel_time];
}

- (uint64_t)_indexRangeOfTimeRange:()Cinematography
{
  long long v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  v5[2] = a3[2];
  return [a1 _indexRangeOfTimeRange:v5 timeSelector:sel_time];
}

- (uint64_t)_timeRangeOfIndexRange:()Cinematography
{
  return objc_msgSend(a1, "_timeRangeOfIndexRange:timeSelector:", a3, a4, sel_time);
}

- (uint64_t)_indexNearestTime:()Cinematography timeSelector:
{
  CMTime v16 = *a3;
  uint64_t v7 = [a1 _firstIndexAtOrAfterTime:&v16 startIndex:0 lastIfEqual:1 timeSelector:a4];
  if (v7 >= 1)
  {
    if (v7 >= (unint64_t)[a1 count])
    {
      --v7;
    }
    else
    {
      memset(&v16, 0, sizeof(v16));
      v8 = [a1 objectAtIndexedSubscript:v7 - 1];
      [a1 _timeForObject:v8 timeSelector:a4];

      memset(&v15, 0, sizeof(v15));
      v9 = [a1 objectAtIndexedSubscript:v7];
      [a1 _timeForObject:v9 timeSelector:a4];

      memset(&v14, 0, sizeof(v14));
      CMTime lhs = *a3;
      CMTime rhs = v16;
      CMTimeSubtract(&v14, &lhs, &rhs);
      memset(&lhs, 0, sizeof(lhs));
      CMTime rhs = v15;
      CMTime v11 = *a3;
      CMTimeSubtract(&lhs, &rhs, &v11);
      CMTime rhs = v14;
      CMTime v11 = lhs;
      if (CMTimeCompare(&rhs, &v11) == -1) {
        --v7;
      }
    }
  }
  return v7;
}

- (uint64_t)_indexAtOrBeforeTime:()Cinematography timeSelector:
{
  CMTime time1 = *a3;
  uint64_t v7 = objc_msgSend(a1, "_firstIndexAtOrAfterTime:timeSelector:", &time1);
  if (v7 == [a1 count])
  {
    if (v7) {
      --v7;
    }
    else {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    v8 = [a1 objectAtIndexedSubscript:v7];
    [a1 _timeForObject:v8 timeSelector:a4];
    CMTime time1 = *a3;
    int32_t v9 = CMTimeCompare(&time1, &time2);

    uint64_t v10 = v7 - 1;
    if (!v7) {
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v9 < 0) {
      return v10;
    }
  }
  return v7;
}

- (uint64_t)_firstIndexAtOrAfterTime:()Cinematography timeSelector:
{
  long long v5 = *a3;
  uint64_t v6 = *((void *)a3 + 2);
  return [a1 _firstIndexAtOrAfterTime:&v5 startIndex:0 lastIfEqual:0 timeSelector:a4];
}

- (uint64_t)_indexRangeOfTimeRange:()Cinematography timeSelector:
{
  memset(&v11, 0, sizeof(v11));
  CMTime lhs = *(CMTime *)a3;
  CMTime v9 = *(CMTime *)(a3 + 24);
  CMTimeAdd(&v11, &lhs, &v9);
  CMTime lhs = *(CMTime *)a3;
  uint64_t v7 = [a1 _firstIndexAtOrAfterTime:&lhs timeSelector:a4];
  CMTime lhs = v11;
  if ([a1 _firstIndexAfterTime:&lhs startIndex:v7 timeSelector:a4] <= v7) {
    return 0;
  }
  else {
    return v7;
  }
}

- (void)_timeRangeOfIndexRange:()Cinematography timeSelector:
{
  if (a2 >= [a1 count])
  {
    uint64_t v13 = MEMORY[0x1E4F1FA30];
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
    *(_OWORD *)a5 = *MEMORY[0x1E4F1FA30];
    *(_OWORD *)(a5 + 16) = v14;
    *(_OWORD *)(a5 + 32) = *(_OWORD *)(v13 + 32);
  }
  else
  {
    uint64_t v10 = [a1 objectAtIndex:a2];
    memset(&v18, 0, sizeof(v18));
    [a1 _timeForObject:v10 timeSelector:a4];
    unint64_t v11 = a2 + a3;
    if (v11 >= [a1 count])
    {
      CMTime v17 = v18;
      CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
      CMTimeRangeMake((CMTimeRange *)a5, &v17, &start);
    }
    else
    {
      v12 = [a1 objectAtIndex:v11];
      memset(&v17, 0, sizeof(v17));
      [a1 _timeForObject:v12 timeSelector:a4];
      CMTime start = v18;
      CMTime v15 = v17;
      CMTimeRangeFromTimeToTime((CMTimeRange *)a5, &start, &v15);
    }
  }
}

- (void)_timeForObject:()Cinematography timeSelector:
{
  id v8 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      ((void (*)(id, const char *))[v8 methodForSelector:a2])(v8, a2);
    }
    else
    {
      uint64_t v6 = NSStringFromSelector(a2);
      NSLog(&cfstr_TimeforobjectE.isa, v8, v6);

      uint64_t v7 = MEMORY[0x1E4F1FA48];
      *(_OWORD *)a3 = *MEMORY[0x1E4F1FA48];
      a3[2] = *(void *)(v7 + 16);
    }
    goto LABEL_7;
  }
  long long v5 = v8;
  if (v8)
  {
    [v8 CMTimeValue];
LABEL_7:
    long long v5 = v8;
    goto LABEL_9;
  }
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
LABEL_9:
}

- (uint64_t)_firstIndexAtOrAfterTime:()Cinematography startIndex:lastIfEqual:timeSelector:
{
  long long v16 = *a3;
  uint64_t v17 = *((void *)a3 + 2);
  uint64_t v10 = [MEMORY[0x1E4F29238] valueWithCMTime:&v16];
  uint64_t v11 = [a1 count] - a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__NSArray_Cinematography___firstIndexAtOrAfterTime_startIndex_lastIfEqual_timeSelector___block_invoke;
  v15[3] = &unk_1E68846B0;
  if (a5) {
    uint64_t v12 = 1536;
  }
  else {
    uint64_t v12 = 1280;
  }
  v15[4] = a1;
  v15[5] = a6;
  uint64_t v13 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v10, a4, v11, v12, v15);

  return v13;
}

- (unint64_t)_firstIndexAfterTime:()Cinematography startIndex:timeSelector:
{
  CMTime v13 = *a3;
  unint64_t v8 = [a1 _firstIndexAtOrAfterTime:&v13 startIndex:a4 lastIfEqual:1 timeSelector:a5];
  if (v8 < [a1 count])
  {
    memset(&v13, 0, sizeof(v13));
    CMTime v9 = [a1 objectAtIndexedSubscript:v8];
    [a1 _timeForObject:v9 timeSelector:a5];

    CMTime time1 = *a3;
    CMTime v11 = v13;
    if (!CMTimeCompare(&time1, &v11)) {
      ++v8;
    }
  }
  return v8;
}

@end