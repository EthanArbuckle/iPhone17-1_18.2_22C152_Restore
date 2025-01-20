@interface WFContextualAction(WFCSSearchableItemConvertible)
- (void)generateSearchableItemWithCompletionBlock:()WFCSSearchableItemConvertible;
@end

@implementation WFContextualAction(WFCSSearchableItemConvertible)

- (void)generateSearchableItemWithCompletionBlock:()WFCSSearchableItemConvertible
{
  v5 = a3;
  id v6 = [a1 spotlightItem];
  ((void (**)(void, id, void))a3)[2](v5, v6, 0);
}

@end