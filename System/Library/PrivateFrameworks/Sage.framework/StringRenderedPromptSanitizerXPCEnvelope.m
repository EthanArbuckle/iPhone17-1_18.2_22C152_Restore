@interface StringRenderedPromptSanitizerXPCEnvelope
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSData)_sanitizer;
- (_TtC4Sage40StringRenderedPromptSanitizerXPCEnvelope)init;
- (_TtC4Sage40StringRenderedPromptSanitizerXPCEnvelope)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)set_sanitizer:(id)a3;
@end

@implementation StringRenderedPromptSanitizerXPCEnvelope

- (NSData)_sanitizer
{
  return (NSData *)sub_25B97457C((uint64_t)self, (uint64_t)a2, sub_25B96FAA8);
}

- (void)set_sanitizer:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return static StringRenderedPromptSanitizerXPCEnvelope.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (_TtC4Sage40StringRenderedPromptSanitizerXPCEnvelope)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC4Sage40StringRenderedPromptSanitizerXPCEnvelope *)StringRenderedPromptSanitizerXPCEnvelope.init(coder:)(v3, v4, v5);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  StringRenderedPromptSanitizerXPCEnvelope.encode(with:)((NSCoder)v4);
}

- (_TtC4Sage40StringRenderedPromptSanitizerXPCEnvelope)init
{
}

- (void).cxx_destruct
{
}

@end