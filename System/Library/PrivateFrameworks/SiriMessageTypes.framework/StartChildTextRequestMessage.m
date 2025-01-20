@interface StartChildTextRequestMessage
@end

@implementation StartChildTextRequestMessage

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC16SiriMessageTypes28StartChildTextRequestMessage_orchestrationTaskId;
  sub_25D0BCFE0();
  OUTLINED_FUNCTION_3_7();
  (*(void (**)(char *))(v4 + 8))(v3);
  sub_25D014910(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16SiriMessageTypes28StartChildTextRequestMessage_textRequestType), *(void *)&self->super.super.super.super.super._anon_0[OBJC_IVAR____TtC16SiriMessageTypes28StartChildTextRequestMessage_textRequestType]);
  uint64_t v5 = OUTLINED_FUNCTION_1_8((uint64_t)self + OBJC_IVAR____TtC16SiriMessageTypes28StartChildTextRequestMessage_routingDecision);
  sub_25CF99774(v5, v6, v7, v8, v9, v10);
}

@end