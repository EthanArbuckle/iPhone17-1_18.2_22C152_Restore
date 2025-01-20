@interface NSData(ActionIdentifier)
- (uint64_t)re_actionIdentifierHashValue;
@end

@implementation NSData(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  id v1 = a1;
  uint64_t v2 = [v1 bytes];
  uint64_t v3 = [v1 length];
  return REHashDataUInt64(v2, v3);
}

@end