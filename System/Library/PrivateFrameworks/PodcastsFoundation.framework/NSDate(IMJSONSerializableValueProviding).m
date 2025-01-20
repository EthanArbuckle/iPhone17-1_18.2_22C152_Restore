@interface NSDate(IMJSONSerializableValueProviding)
- (uint64_t)im_jsonSerializableValue;
@end

@implementation NSDate(IMJSONSerializableValueProviding)

- (uint64_t)im_jsonSerializableValue
{
  v1 = (void *)MEMORY[0x1E4F28ED0];
  [a1 timeIntervalSinceReferenceDate];
  return objc_msgSend(v1, "numberWithDouble:");
}

@end