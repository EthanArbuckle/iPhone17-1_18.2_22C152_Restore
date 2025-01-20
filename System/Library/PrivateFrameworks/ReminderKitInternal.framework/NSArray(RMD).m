@interface NSArray(RMD)
- (id)shuffledArray;
- (uint64_t)shuffledArrayWithRandomSource:()RMD;
@end

@implementation NSArray(RMD)

- (uint64_t)shuffledArrayWithRandomSource:()RMD
{
  return [a3 arrayByShufflingObjectsInArray:a1];
}

- (id)shuffledArray
{
  v2 = +[RMDRandomSource sharedRandom];
  v3 = [a1 shuffledArrayWithRandomSource:v2];

  return v3;
}

@end