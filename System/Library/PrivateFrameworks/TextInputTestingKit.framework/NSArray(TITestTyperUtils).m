@interface NSArray(TITestTyperUtils)
- (id)arrayInterspersingSpaceStringsBetweenObjects;
@end

@implementation NSArray(TITestTyperUtils)

- (id)arrayInterspersingSpaceStringsBetweenObjects
{
  if ([a1 count])
  {
    v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", 2 * objc_msgSend(a1, "count") - 1);
    if ([a1 count])
    {
      unint64_t v3 = 0;
      do
      {
        v4 = [a1 objectAtIndexedSubscript:v3];
        [v2 addObject:v4];

        if (v3 < [a1 count] - 1) {
          [v2 addObject:@" "];
        }
        ++v3;
      }
      while (v3 < [a1 count]);
    }
    id v5 = [MEMORY[0x263EFF8C0] arrayWithArray:v2];
  }
  else
  {
    id v5 = a1;
  }
  return v5;
}

@end