@interface RTHint(RTExtensions)
+ (uint64_t)convertHintSource:()RTExtensions;
- (uint64_t)initWithRTPHint:()RTExtensions;
@end

@implementation RTHint(RTExtensions)

+ (uint64_t)convertHintSource:()RTExtensions
{
  if ((a3 - 1) >= 7) {
    return -1;
  }
  else {
    return (a3 - 1);
  }
}

- (uint64_t)initWithRTPHint:()RTExtensions
{
  v4 = (objc_class *)MEMORY[0x1E4F5CE00];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 location];
  v8 = (void *)[v6 initWithRTPLocation:v7];
  uint64_t v9 = [MEMORY[0x1E4F5CDF0] convertHintSource:[v5 hintSource]];
  v10 = (void *)MEMORY[0x1E4F1C9C8];
  [v5 timestamp];
  double v12 = v11;

  v13 = [v10 dateWithTimeIntervalSinceReferenceDate:v12];
  uint64_t v14 = [a1 initWithLocation:v8 source:v9 date:v13];

  return v14;
}

@end