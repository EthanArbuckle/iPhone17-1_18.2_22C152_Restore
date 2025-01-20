@interface NSString(SUS)
- (uint64_t)compareNumerically:()SUS;
@end

@implementation NSString(SUS)

- (uint64_t)compareNumerically:()SUS
{
  return [a1 compare:a3 options:64];
}

@end