@interface INControlHomeIntent(ActionIdentifier)
- (uint64_t)re_actionIdentifierHashValue;
@end

@implementation INControlHomeIntent(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  v2 = [a1 userTask];
  uint64_t v3 = objc_msgSend(v2, "re_actionIdentifierHashValue");
  v4 = [a1 filters];
  uint64_t v5 = objc_msgSend(v4, "re_actionIdentifierHashValue") ^ v3;

  return v5;
}

@end