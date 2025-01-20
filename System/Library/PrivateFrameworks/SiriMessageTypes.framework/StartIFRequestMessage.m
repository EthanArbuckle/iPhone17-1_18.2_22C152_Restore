@interface StartIFRequestMessage
@end

@implementation StartIFRequestMessage

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16SiriMessageTypes21StartIFRequestMessage_requestContextData));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC16SiriMessageTypes21StartIFRequestMessage_orchestrationTaskId;
  sub_25D0BCFE0();
  OUTLINED_FUNCTION_3_7();
  v6 = *(void (**)(char *, uint64_t))(v5 + 8);
  v6(v3, v4);
}

@end