@interface MLMultiArray(ConvertToNSArray)
- (id)convert1dMLMultiArrayToNSArray;
@end

@implementation MLMultiArray(ConvertToNSArray)

- (id)convert1dMLMultiArrayToNSArray
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [a1 shape];
  v4 = [v3 lastObject];
  uint64_t v5 = [v4 unsignedIntegerValue];

  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      v7 = [a1 objectAtIndexedSubscript:i];
      [v2 addObject:v7];
    }
  }
  return v2;
}

@end