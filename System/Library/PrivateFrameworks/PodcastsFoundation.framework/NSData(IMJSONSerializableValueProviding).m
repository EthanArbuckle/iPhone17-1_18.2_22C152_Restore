@interface NSData(IMJSONSerializableValueProviding)
- (uint64_t)im_jsonSerializableValue;
@end

@implementation NSData(IMJSONSerializableValueProviding)

- (uint64_t)im_jsonSerializableValue
{
  return [a1 base64EncodedStringWithOptions:0];
}

@end