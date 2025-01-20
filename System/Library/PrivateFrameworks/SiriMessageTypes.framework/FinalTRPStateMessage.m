@interface FinalTRPStateMessage
- (NSString)description;
@end

@implementation FinalTRPStateMessage

- (NSString)description
{
  v2 = self;
  sub_25CF98F04();

  v3 = (void *)sub_25D0BD2D0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = OUTLINED_FUNCTION_1_8((uint64_t)self + OBJC_IVAR____TtC16SiriMessageTypes20FinalTRPStateMessage_routingDecision);
  sub_25CF99774(v3, v4, v5, v6, v7, v8);
}

@end