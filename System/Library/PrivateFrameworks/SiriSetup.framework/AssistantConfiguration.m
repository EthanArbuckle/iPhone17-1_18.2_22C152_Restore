@interface AssistantConfiguration
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC9SiriSetup22AssistantConfiguration)init;
- (_TtC9SiriSetup22AssistantConfiguration)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AssistantConfiguration

- (NSString)description
{
  v2 = self;
  sub_235A4B5CC();

  v3 = (void *)sub_235A68AF0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return byte_26882D8E0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_26882D8E0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_235A4CD3C(v4);
}

- (_TtC9SiriSetup22AssistantConfiguration)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC9SiriSetup22AssistantConfiguration *)sub_235A4DAA0(v3);

  return v4;
}

- (_TtC9SiriSetup22AssistantConfiguration)init
{
  result = (_TtC9SiriSetup22AssistantConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriVoice);
}

@end