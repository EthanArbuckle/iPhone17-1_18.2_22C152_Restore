@interface NSString(ActionIdentifier)
- (uint64_t)re_actionIdentifierHashValue;
@end

@implementation NSString(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  return REHashString(a1);
}

@end