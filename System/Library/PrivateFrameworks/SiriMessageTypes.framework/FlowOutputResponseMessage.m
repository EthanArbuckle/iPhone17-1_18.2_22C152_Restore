@interface FlowOutputResponseMessage
@end

@implementation FlowOutputResponseMessage

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC16SiriMessageTypes25FlowOutputResponseMessage_outputId;
  sub_25D0BCFE0();
  OUTLINED_FUNCTION_3_7();
  (*(void (**)(char *))(v4 + 8))(v3);
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16SiriMessageTypes25FlowOutputResponseMessage_commandResult);
}

@end