@interface NSObject(TSUBlockUtility)
- (uint64_t)tsu_runBlock;
@end

@implementation NSObject(TSUBlockUtility)

- (uint64_t)tsu_runBlock
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

@end