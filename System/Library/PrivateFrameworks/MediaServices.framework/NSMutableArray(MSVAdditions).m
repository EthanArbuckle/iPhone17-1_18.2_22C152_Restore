@interface NSMutableArray(MSVAdditions)
- (uint64_t)msv_removeFirstObject;
@end

@implementation NSMutableArray(MSVAdditions)

- (uint64_t)msv_removeFirstObject
{
  uint64_t result = [a1 count];
  if (result)
  {
    return [a1 removeObjectAtIndex:0];
  }
  return result;
}

@end