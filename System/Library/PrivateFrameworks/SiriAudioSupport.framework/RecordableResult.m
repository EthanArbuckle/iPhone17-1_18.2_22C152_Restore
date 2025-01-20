@interface RecordableResult
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC16SiriAudioSupport16RecordableResult)init;
- (_TtC16SiriAudioSupport16RecordableResult)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RecordableResult

+ (BOOL)supportsSecureCoding
{
  return byte_26894C680;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_26894C680 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23802793C(v4);
}

- (_TtC16SiriAudioSupport16RecordableResult)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC16SiriAudioSupport16RecordableResult *)sub_23802802C(v3);

  return v4;
}

- (_TtC16SiriAudioSupport16RecordableResult)init
{
  result = (_TtC16SiriAudioSupport16RecordableResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end