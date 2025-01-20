@interface NSInvocation(TSUAdditions_Private)
+ (uint64_t)tsu_executeBlock:()TSUAdditions_Private;
@end

@implementation NSInvocation(TSUAdditions_Private)

+ (uint64_t)tsu_executeBlock:()TSUAdditions_Private
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

@end