@interface NSURL(ActionIdentifier)
- (uint64_t)re_actionIdentifierHashValue;
@end

@implementation NSURL(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  v1 = [a1 standardizedURL];
  v2 = [v1 absoluteString];
  uint64_t v3 = objc_msgSend(v2, "re_actionIdentifierHashValue");

  return v3;
}

@end