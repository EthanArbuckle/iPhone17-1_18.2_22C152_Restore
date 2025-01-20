@interface GenerativeErrorXPCEnvelope
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSData)_error;
- (_TtC4Sage26GenerativeErrorXPCEnvelope)init;
- (_TtC4Sage26GenerativeErrorXPCEnvelope)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)set_error:(id)a3;
@end

@implementation GenerativeErrorXPCEnvelope

- (NSData)_error
{
  return (NSData *)sub_25B97457C((uint64_t)self, (uint64_t)a2, sub_25B96DFA0);
}

- (void)set_error:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return static GenerativeErrorXPCEnvelope.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (_TtC4Sage26GenerativeErrorXPCEnvelope)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC4Sage26GenerativeErrorXPCEnvelope *)GenerativeErrorXPCEnvelope.init(coder:)(v3, v4, v5);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  GenerativeErrorXPCEnvelope.encode(with:)((NSCoder)v4);
}

- (_TtC4Sage26GenerativeErrorXPCEnvelope)init
{
}

- (void).cxx_destruct
{
}

@end