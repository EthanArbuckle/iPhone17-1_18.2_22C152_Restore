@interface NSNull(ActionIdentifier)
- (uint64_t)re_actionIdentifierHashValue;
@end

@implementation NSNull(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  return 0;
}

@end