@interface INHomeFilter(ActionIdentifier)
- (uint64_t)re_actionIdentifierHashValue;
@end

@implementation INHomeFilter(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  v1 = [a1 entityIdentifiers];
  uint64_t v2 = objc_msgSend(v1, "re_actionIdentifierHashValue");

  return v2;
}

@end