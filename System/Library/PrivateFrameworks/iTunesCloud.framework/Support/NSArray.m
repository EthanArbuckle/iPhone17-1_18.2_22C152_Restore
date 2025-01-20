@interface NSArray
- (id)subarraysOfSize:(unint64_t)a3;
@end

@implementation NSArray

- (id)subarraysOfSize:(unint64_t)a3
{
  NSUInteger v5 = [(NSArray *)self count];
  id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v5 / a3 + 1];
  if (v5)
  {
    for (NSUInteger i = 0; i < v5; i += v8)
    {
      if (v5 - i >= a3) {
        unint64_t v8 = a3;
      }
      else {
        unint64_t v8 = v5 - i;
      }
      v9 = -[NSArray subarrayWithRange:](self, "subarrayWithRange:", i, v8);
      [v6 addObject:v9];
    }
  }

  return v6;
}

@end