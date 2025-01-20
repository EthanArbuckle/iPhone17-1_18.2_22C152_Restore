@interface NSArray
@end

@implementation NSArray

uint64_t __88__NSArray_Cinematography___firstIndexAtOrAfterTime_startIndex_lastIfEqual_timeSelector___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  memset(&v13[1], 0, sizeof(CMTime));
  v7 = *(void **)(a1 + 32);
  if (v7
    && ([v7 _timeForObject:v5 timeSelector:*(void *)(a1 + 40)],
        v8 = *(void **)(a1 + 32),
        memset(v13, 0, 24),
        v8))
  {
    [v8 _timeForObject:v6 timeSelector:*(void *)(a1 + 40)];
  }
  else
  {
    memset(v13, 0, 24);
  }
  CMTime time1 = v13[1];
  CMTime v11 = v13[0];
  uint64_t v9 = CMTimeCompare(&time1, &v11);

  return v9;
}

@end