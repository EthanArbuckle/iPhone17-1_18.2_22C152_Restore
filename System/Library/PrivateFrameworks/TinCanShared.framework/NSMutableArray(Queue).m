@interface NSMutableArray(Queue)
- (id)dequeue;
- (id)enqueue:()Queue;
@end

@implementation NSMutableArray(Queue)

- (id)enqueue:()Queue
{
  objc_msgSend(a1, "addObject:");
  id result = (id)[a1 count];
  if ((unint64_t)result >= 0x21) {
    return (id)[a1 dequeue];
  }
  return result;
}

- (id)dequeue
{
  if ([a1 count])
  {
    v2 = [a1 objectAtIndexedSubscript:0];
    [a1 removeObjectAtIndex:0];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end