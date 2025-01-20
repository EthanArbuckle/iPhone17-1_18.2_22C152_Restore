@interface NSOperation(MSVAdditions)
- (uint64_t)decreasePriority;
- (uint64_t)increasePriority;
@end

@implementation NSOperation(MSVAdditions)

- (uint64_t)decreasePriority
{
  uint64_t result = [a1 queuePriority];
  *((void *)&v4 + 1) = result;
  *(void *)&long long v4 = result + 4;
  unint64_t v3 = v4 >> 2;
  if (v3 <= 3)
  {
    return [a1 setQueuePriority:4 * v3 - 8];
  }
  return result;
}

- (uint64_t)increasePriority
{
  uint64_t result = [a1 queuePriority];
  *((void *)&v4 + 1) = result;
  *(void *)&long long v4 = result + 8;
  unint64_t v3 = v4 >> 2;
  if (v3 <= 3)
  {
    return [a1 setQueuePriority:4 * v3 - 4];
  }
  return result;
}

@end