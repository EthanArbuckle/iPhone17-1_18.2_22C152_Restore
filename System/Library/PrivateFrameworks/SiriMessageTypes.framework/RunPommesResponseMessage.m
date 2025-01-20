@interface RunPommesResponseMessage
@end

@implementation RunPommesResponseMessage

- (void).cxx_destruct
{
  sub_25D00E868(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16SiriMessageTypes24RunPommesResponseMessage_pommesResult), self->super.super.super._anon_0[OBJC_IVAR____TtC16SiriMessageTypes24RunPommesResponseMessage_pommesResult]);
  sub_25D0BD170();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_2_3();
  v3();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16SiriMessageTypes24RunPommesResponseMessage_nlResponse));
  sub_25D0397BC(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16SiriMessageTypes24RunPommesResponseMessage_userInput), *(id *)&self->super.super.super._anon_0[OBJC_IVAR____TtC16SiriMessageTypes24RunPommesResponseMessage_userInput], self->super.super.super.postedOnTheBus[OBJC_IVAR____TtC16SiriMessageTypes24RunPommesResponseMessage_userInput]);
  swift_bridgeObjectRelease();
}

@end