@interface SUUIPredicateViewElement
- (NSPredicate)entityValuePredicate;
@end

@implementation SUUIPredicateViewElement

- (NSPredicate)entityValuePredicate
{
  return (NSPredicate *)[MEMORY[0x263F08A98] predicateWithValue:1];
}

@end