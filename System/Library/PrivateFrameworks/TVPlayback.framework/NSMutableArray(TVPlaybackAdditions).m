@interface NSMutableArray(TVPlaybackAdditions)
- (unint64_t)tvp_shuffle;
- (void)tvp_addObjectIfNotNil:()TVPlaybackAdditions;
@end

@implementation NSMutableArray(TVPlaybackAdditions)

- (unint64_t)tvp_shuffle
{
  unint64_t result = [a1 count];
  if (result >= 2)
  {
    unint64_t v3 = result - 1;
    do
    {
      unint64_t result = [a1 exchangeObjectAtIndex:arc4random() % v3 withObjectAtIndex:v3];
      --v3;
    }
    while (v3);
  }
  return result;
}

- (void)tvp_addObjectIfNotNil:()TVPlaybackAdditions
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

@end