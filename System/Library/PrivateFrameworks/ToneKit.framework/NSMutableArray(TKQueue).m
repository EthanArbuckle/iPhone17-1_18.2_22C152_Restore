@interface NSMutableArray(TKQueue)
- (id)tk_dequeueObject;
- (uint64_t)tk_enqueueObject:()TKQueue;
- (uint64_t)tk_lastEnqueuedObject;
@end

@implementation NSMutableArray(TKQueue)

- (uint64_t)tk_enqueueObject:()TKQueue
{
  return [a1 insertObject:a3 atIndex:0];
}

- (id)tk_dequeueObject
{
  v2 = [a1 lastObject];
  [a1 removeLastObject];

  return v2;
}

- (uint64_t)tk_lastEnqueuedObject
{
  return [a1 objectAtIndex:0];
}

@end