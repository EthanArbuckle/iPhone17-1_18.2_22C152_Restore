@interface ToolChoiceXPCEnvelope
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSData)_toolChoice;
- (_TtC4Sage21ToolChoiceXPCEnvelope)init;
- (_TtC4Sage21ToolChoiceXPCEnvelope)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)set_toolChoice:(id)a3;
@end

@implementation ToolChoiceXPCEnvelope

- (NSData)_toolChoice
{
  return (NSData *)sub_25B97457C((uint64_t)self, (uint64_t)a2, sub_25B96E474);
}

- (void)set_toolChoice:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return static ToolChoiceXPCEnvelope.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (_TtC4Sage21ToolChoiceXPCEnvelope)initWithCoder:(id)a3
{
  return (_TtC4Sage21ToolChoiceXPCEnvelope *)ToolChoiceXPCEnvelope.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ToolChoiceXPCEnvelope.encode(with:)((NSCoder)v4);
}

- (_TtC4Sage21ToolChoiceXPCEnvelope)init
{
}

- (void).cxx_destruct
{
}

@end