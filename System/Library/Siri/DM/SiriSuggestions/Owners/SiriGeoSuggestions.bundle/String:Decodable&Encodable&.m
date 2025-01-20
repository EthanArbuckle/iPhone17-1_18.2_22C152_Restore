@interface String:Decodable&Encodable&
- (uint64_t)Sendable;
@end

@implementation String:Decodable&Encodable&

- (uint64_t)Sendable
{
  return swift_release();
}

@end