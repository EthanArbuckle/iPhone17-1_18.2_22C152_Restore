@interface VAASRResult
- (NSString)description;
- (_TtC12VoiceActions11VAASRResult)init;
@end

@implementation VAASRResult

- (NSString)description
{
  v2 = self;
  sub_261480ECC();

  v3 = (void *)sub_2614D5378();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC12VoiceActions11VAASRResult)init
{
  result = (_TtC12VoiceActions11VAASRResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12VoiceActions11VAASRResult_audioBuffer);
}

@end