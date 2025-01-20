@interface MTLToolsResourceGroupSPI
- (BOOL)containsResource:(id)a3;
@end

@implementation MTLToolsResourceGroupSPI

- (BOOL)containsResource:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  uint64_t v5 = [a3 baseObject];

  return [v4 containsResource:v5];
}

@end