@interface INMediaItem(ActionIdentifier)
- (uint64_t)re_actionIdentifierHashValue;
@end

@implementation INMediaItem(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  v1 = [a1 identifier];
  uint64_t v2 = objc_msgSend(v1, "re_actionIdentifierHashValue");

  return v2;
}

@end