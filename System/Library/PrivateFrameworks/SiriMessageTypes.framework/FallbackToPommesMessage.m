@interface FallbackToPommesMessage
@end

@implementation FallbackToPommesMessage

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC16SiriMessageTypes23FallbackToPommesMessage_pommesCandidateId;
  sub_25D0BD140();
  OUTLINED_FUNCTION_3_7();
  v6 = *(void (**)(char *, uint64_t))(v5 + 8);
  v6(v3, v4);
}

@end