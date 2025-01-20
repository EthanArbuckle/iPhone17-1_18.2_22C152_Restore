@interface NSNumber(ActionIdentifier)
- (uint64_t)re_actionIdentifierHashValue;
@end

@implementation NSNumber(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  uint64_t v2 = [a1 unsignedLongLongValue];
  return REHashDataUInt64((uint64_t)&v2, 8);
}

@end