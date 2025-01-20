@interface CLPlacemark(ActionIdentifier)
- (uint64_t)re_actionIdentifierHashValue;
@end

@implementation CLPlacemark(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  v1 = [a1 location];
  [v1 coordinate];
  double v3 = v2;
  v4 = objc_msgSend(NSNumber, "numberWithDouble:");
  uint64_t v5 = objc_msgSend(v4, "re_actionIdentifierHashValue");
  v6 = [NSNumber numberWithDouble:v3];
  uint64_t v7 = objc_msgSend(v6, "re_actionIdentifierHashValue") ^ v5;

  return v7;
}

@end