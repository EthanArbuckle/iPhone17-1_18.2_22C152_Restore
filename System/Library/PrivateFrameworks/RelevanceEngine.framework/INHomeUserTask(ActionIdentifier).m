@interface INHomeUserTask(ActionIdentifier)
- (uint64_t)re_actionIdentifierHashValue;
@end

@implementation INHomeUserTask(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  uint64_t v2 = [a1 taskType];
  uint64_t v3 = [a1 attribute] ^ v2;
  v4 = [a1 value];
  uint64_t v5 = v3 ^ objc_msgSend(v4, "re_actionIdentifierHashValue");

  return v5;
}

@end