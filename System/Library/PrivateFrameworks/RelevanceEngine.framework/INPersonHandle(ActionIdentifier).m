@interface INPersonHandle(ActionIdentifier)
- (uint64_t)re_actionIdentifierHashValue;
@end

@implementation INPersonHandle(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  v1 = [a1 value];
  uint64_t v2 = objc_msgSend(v1, "re_actionIdentifierHashValue");

  return v2;
}

@end