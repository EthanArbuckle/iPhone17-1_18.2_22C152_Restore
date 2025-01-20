@interface NSArray(HigherOrder)
- (id)filterWithBlock:()HigherOrder;
@end

@implementation NSArray(HigherOrder)

- (id)filterWithBlock:()HigherOrder
{
  v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  if ([a1 count])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [a1 objectAtIndexedSubscript:v6];
      int v8 = v4[2](v4, v7);

      if (v8)
      {
        v9 = [a1 objectAtIndexedSubscript:v6];
        [v5 addObject:v9];
      }
      ++v6;
    }
    while ([a1 count] > v6);
  }
  v10 = (void *)[v5 copy];

  return v10;
}

@end