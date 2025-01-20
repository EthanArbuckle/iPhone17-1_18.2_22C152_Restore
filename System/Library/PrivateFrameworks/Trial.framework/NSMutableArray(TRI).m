@interface NSMutableArray(TRI)
- (BOOL)triMoveFirstItemToFrontPassingTest:()TRI;
@end

@implementation NSMutableArray(TRI)

- (BOOL)triMoveFirstItemToFrontPassingTest:()TRI
{
  uint64_t v2 = objc_msgSend(a1, "indexOfObjectPassingTest:");
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = [a1 objectAtIndexedSubscript:v2];
    [a1 removeObjectAtIndex:v2];
    [a1 insertObject:v3 atIndex:0];
  }
  return v2 != 0x7FFFFFFFFFFFFFFFLL;
}

@end