@interface SDAirDropSendStateMachine.Runner
@end

@implementation SDAirDropSendStateMachine.Runner

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine6Runner_nearbyAgent));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine6Runner_endpointService));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine6Runner_selectedConnection));
  swift_bridgeObjectRelease();
  sub_10000A7E8((uint64_t)self+ OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine6Runner____lazy_storage___senderContact, &qword_100970BB0);
}

@end