@interface UserIdentificationMessage
- (NSString)description;
@end

@implementation UserIdentificationMessage

- (NSString)description
{
  v2 = self;
  sub_25D0B0974();

  v3 = (void *)sub_25D0BD2D0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16SiriMessageTypes25UserIdentificationMessage_voiceIdScoreCard));
  swift_bridgeObjectRelease();
}

@end