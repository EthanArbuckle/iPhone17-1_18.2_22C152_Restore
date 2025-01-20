@interface ShimToolInvokedMessage
@end

@implementation ShimToolInvokedMessage

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16SiriMessageTypes22ShimToolInvokedMessage_directInvocation);
}

@end