@interface StringResponseSanitizerXPCEnvelope
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSData)_sanitizer;
- (_TtC4Sage34StringResponseSanitizerXPCEnvelope)init;
- (_TtC4Sage34StringResponseSanitizerXPCEnvelope)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)set_sanitizer:(id)a3;
@end

@implementation StringResponseSanitizerXPCEnvelope

- (NSData)_sanitizer
{
  return (NSData *)sub_25B97457C((uint64_t)self, (uint64_t)a2, sub_25B96FEC4);
}

- (void)set_sanitizer:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return static StringResponseSanitizerXPCEnvelope.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (_TtC4Sage34StringResponseSanitizerXPCEnvelope)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC4Sage34StringResponseSanitizerXPCEnvelope *)StringResponseSanitizerXPCEnvelope.init(coder:)(v3, v4, v5);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  StringResponseSanitizerXPCEnvelope.encode(with:)((NSCoder)v4);
}

- (_TtC4Sage34StringResponseSanitizerXPCEnvelope)init
{
}

- (void).cxx_destruct
{
}

@end