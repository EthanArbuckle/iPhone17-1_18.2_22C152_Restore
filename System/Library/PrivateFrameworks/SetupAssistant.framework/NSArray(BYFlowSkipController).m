@interface NSArray(BYFlowSkipController)
- (id)by_actionsByRemovingAction:()BYFlowSkipController;
@end

@implementation NSArray(BYFlowSkipController)

- (id)by_actionsByRemovingAction:()BYFlowSkipController
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  [v5 removeObject:v4];

  v6 = (void *)[v5 copy];
  return v6;
}

@end