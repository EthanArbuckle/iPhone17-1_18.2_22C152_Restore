@interface PTRow
@end

@implementation PTRow

uint64_t __36__PTRow_PhotosPlayer__is_increment___block_invoke(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  double v4 = *(double *)(a1 + 32) * round(v3 / *(double *)(a1 + 32));
  v5 = NSNumber;

  return [v5 numberWithDouble:v4];
}

@end