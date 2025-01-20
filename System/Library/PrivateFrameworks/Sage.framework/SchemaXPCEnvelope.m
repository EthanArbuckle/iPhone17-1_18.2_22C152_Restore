@interface SchemaXPCEnvelope
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSData)_schema;
- (_TtC4Sage17SchemaXPCEnvelope)init;
- (_TtC4Sage17SchemaXPCEnvelope)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)set_schema:(id)a3;
@end

@implementation SchemaXPCEnvelope

- (NSData)_schema
{
  return (NSData *)sub_25B971150((uint64_t)self, (uint64_t)a2, sub_25B96F190);
}

- (void)set_schema:(id)a3
{
  v3 = a3;
  if (a3)
  {
    v4 = self;
    id v5 = v3;
    v3 = (void *)sub_25B9EC2A0();
    uint64_t v7 = v6;
  }
  else
  {
    v8 = self;
    uint64_t v7 = 0xF000000000000000;
  }
  sub_25B974628((uint64_t)v3, v7, &OBJC_IVAR____TtC4Sage17SchemaXPCEnvelope__schema, (uint64_t (*)(uint64_t, uint64_t))sub_25B958F08);
}

+ (BOOL)supportsSecureCoding
{
  return static SchemaXPCEnvelope.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (_TtC4Sage17SchemaXPCEnvelope)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC4Sage17SchemaXPCEnvelope *)SchemaXPCEnvelope.init(coder:)();
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  SchemaXPCEnvelope.encode(with:)((NSCoder)v4);
}

- (_TtC4Sage17SchemaXPCEnvelope)init
{
}

- (void).cxx_destruct
{
}

@end