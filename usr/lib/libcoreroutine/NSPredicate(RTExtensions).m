@interface NSPredicate(RTExtensions)
+ (uint64_t)falsePredicate;
+ (uint64_t)truePredicate;
@end

@implementation NSPredicate(RTExtensions)

+ (uint64_t)truePredicate
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE"];
}

+ (uint64_t)falsePredicate
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"FALSEPREDICATE"];
}

@end