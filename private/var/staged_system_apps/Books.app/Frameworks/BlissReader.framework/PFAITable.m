@interface PFAITable
- (BOOL)canAddColumnBreak:(id)a3;
@end

@implementation PFAITable

- (BOOL)canAddColumnBreak:(id)a3
{
  return [a3 paginatedIsCurrent];
}

@end