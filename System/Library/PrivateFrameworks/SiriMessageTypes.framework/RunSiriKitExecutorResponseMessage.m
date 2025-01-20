@interface RunSiriKitExecutorResponseMessage
@end

@implementation RunSiriKitExecutorResponseMessage

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16SiriMessageTypes33RunSiriKitExecutorResponseMessage_response));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16SiriMessageTypes33RunSiriKitExecutorResponseMessage_error);
}

@end