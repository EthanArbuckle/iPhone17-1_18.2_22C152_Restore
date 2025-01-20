@interface NSDate(ActionIdentifier)
- (uint64_t)re_actionIdentifierHashValue;
@end

@implementation NSDate(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  v1 = NSNumber;
  [a1 timeIntervalSinceReferenceDate];
  v2 = objc_msgSend(v1, "numberWithDouble:");
  uint64_t v3 = objc_msgSend(v2, "re_actionIdentifierHashValue");

  return v3;
}

@end