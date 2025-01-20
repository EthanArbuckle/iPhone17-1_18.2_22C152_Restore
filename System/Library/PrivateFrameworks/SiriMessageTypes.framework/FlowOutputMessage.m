@interface FlowOutputMessage
@end

@implementation FlowOutputMessage

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16SiriMessageTypes17FlowOutputMessage_command));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16SiriMessageTypes17FlowOutputMessage_commandExecutionInfo));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25CF9ED08((uint64_t)self + OBJC_IVAR____TtC16SiriMessageTypes17FlowOutputMessage_legacyContext);
  swift_bridgeObjectRelease();
}

@end