@interface ToolTypeXPCEnvelope
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSData)_tool;
- (_TtC4Sage19ToolTypeXPCEnvelope)init;
- (_TtC4Sage19ToolTypeXPCEnvelope)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)set_tool:(id)a3;
@end

@implementation ToolTypeXPCEnvelope

- (NSData)_tool
{
  return (NSData *)sub_25B97457C((uint64_t)self, (uint64_t)a2, sub_25B96EB7C);
}

- (void)set_tool:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return static ToolTypeXPCEnvelope.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (_TtC4Sage19ToolTypeXPCEnvelope)initWithCoder:(id)a3
{
  return (_TtC4Sage19ToolTypeXPCEnvelope *)ToolTypeXPCEnvelope.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ToolTypeXPCEnvelope.encode(with:)((NSCoder)v4);
}

- (_TtC4Sage19ToolTypeXPCEnvelope)init
{
}

- (void).cxx_destruct
{
}

@end