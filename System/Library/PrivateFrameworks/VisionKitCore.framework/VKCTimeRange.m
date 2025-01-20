@interface VKCTimeRange
- (BOOL)contains:(BOOL)result;
- (double)duration;
- (double)end;
- (double)initWithStart:(double)a3 duration:;
- (double)start;
- (uint64_t)setDuration:(uint64_t)result;
- (uint64_t)setStart:(uint64_t)result;
@end

@implementation VKCTimeRange

- (double)initWithStart:(double)a3 duration:
{
  if (result)
  {
    v5.receiver = result;
    v5.super_class = (Class)VKCTimeRange;
    result = (double *)objc_msgSendSuper2(&v5, sel_init);
    if (result)
    {
      result[1] = a2;
      result[2] = a3;
    }
  }
  return result;
}

- (double)end
{
  if (a1) {
    return *(double *)(a1 + 8) + *(double *)(a1 + 16);
  }
  else {
    return 0.0;
  }
}

- (double)start
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

- (double)duration
{
  if (a1) {
    return *(double *)(a1 + 16);
  }
  else {
    return 0.0;
  }
}

- (BOOL)contains:(BOOL)result
{
  if (result)
  {
    double v2 = *(double *)(result + 8);
    return v2 <= a2 && v2 + *(double *)(result + 16) > a2;
  }
  return result;
}

- (uint64_t)setStart:(uint64_t)result
{
  if (result) {
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setDuration:(uint64_t)result
{
  if (result) {
    *(double *)(result + 16) = a2;
  }
  return result;
}

@end