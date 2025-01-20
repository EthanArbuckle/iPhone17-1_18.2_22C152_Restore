@interface TemplateXPCEnvelope
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSData)_template;
- (_TtC4Sage19TemplateXPCEnvelope)init;
- (_TtC4Sage19TemplateXPCEnvelope)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TemplateXPCEnvelope

- (NSData)_template
{
  return (NSData *)sub_25B971150((uint64_t)self, (uint64_t)a2, sub_25B9711C4);
}

+ (BOOL)supportsSecureCoding
{
  return static TemplateXPCEnvelope.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (_TtC4Sage19TemplateXPCEnvelope)initWithCoder:(id)a3
{
  return (_TtC4Sage19TemplateXPCEnvelope *)TemplateXPCEnvelope.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  TemplateXPCEnvelope.encode(with:)((NSCoder)v4);
}

- (_TtC4Sage19TemplateXPCEnvelope)init
{
}

- (void).cxx_destruct
{
}

@end