@interface IntelligenceFlowOutputMessage
@end

@implementation IntelligenceFlowOutputMessage

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16SiriMessageTypes29IntelligenceFlowOutputMessage_command));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16SiriMessageTypes29IntelligenceFlowOutputMessage_aceCommand));
  swift_bridgeObjectRelease();
}

@end