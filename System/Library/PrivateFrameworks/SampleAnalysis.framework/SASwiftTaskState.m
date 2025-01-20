@interface SASwiftTaskState
+ (id)classDictionaryKey;
- (void)baseFunctionAddress;
@end

@implementation SASwiftTaskState

- (void)baseFunctionAddress
{
  if (result)
  {
    v1 = [result threadState];
    for (i = [v1 leafUserFrame];
    {
      v3 = v1;
      v1 = i;

      v4 = v1 ? (void *)v1[4] : 0;
      id v5 = v4;

      if (!v5) {
        break;
      }
      if (v1) {
        v6 = (void *)v1[4];
      }
      else {
        v6 = 0;
      }
    }
    uint64_t v7 = [v1 address];

    return (void *)v7;
  }
  return result;
}

+ (id)classDictionaryKey
{
  return @"SASwiftTaskState";
}

@end