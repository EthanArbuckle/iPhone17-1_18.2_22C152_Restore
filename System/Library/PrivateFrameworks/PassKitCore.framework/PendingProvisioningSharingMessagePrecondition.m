@interface PendingProvisioningSharingMessagePrecondition
- (_TtC5passd45PendingProvisioningSharingMessagePrecondition)init;
- (void)channelWasRemotelyTerminatedWithTransportIdentifier:(id)a3;
- (void)dealloc;
- (void)handleOutstandingShareMessage:(id)a3 transportIdentifier:(id)a4;
@end

@implementation PendingProvisioningSharingMessagePrecondition

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC5passd45PendingProvisioningSharingMessagePrecondition_sharingChannelManager);
  v5 = self;
  [v4 removeDelegate:v5];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(PendingProvisioningSharingMessagePrecondition *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5passd45PendingProvisioningSharingMessagePrecondition_sharingChannelManager));
  swift_release();
  sub_1004D0850(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5passd45PendingProvisioningSharingMessagePrecondition_completion));
  swift_bridgeObjectRelease();
}

- (_TtC5passd45PendingProvisioningSharingMessagePrecondition)init
{
  result = (_TtC5passd45PendingProvisioningSharingMessagePrecondition *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)handleOutstandingShareMessage:(id)a3 transportIdentifier:(id)a4
{
  BOOL v6 = (Class)static String._unconditionallyBridgeFromObjectiveC(_:)() == *(Class *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____TtC5passd45PendingProvisioningSharingMessagePrecondition_transportIdentifier)
    && v5 == *(void *)&self->transportIdentifier[OBJC_IVAR____TtC5passd45PendingProvisioningSharingMessagePrecondition_transportIdentifier];
  if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    id v7 = a3;
    v8 = self;
    sub_1005005AC();
  }
  else
  {
    id v9 = a3;
  }
  swift_bridgeObjectRelease();
}

- (void)channelWasRemotelyTerminatedWithTransportIdentifier:(id)a3
{
  BOOL v5 = (Class)static String._unconditionallyBridgeFromObjectiveC(_:)() == *(Class *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____TtC5passd45PendingProvisioningSharingMessagePrecondition_transportIdentifier)
    && v4 == *(void *)&self->transportIdentifier[OBJC_IVAR____TtC5passd45PendingProvisioningSharingMessagePrecondition_transportIdentifier];
  if (v5 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    BOOL v6 = self;
    sub_1005005AC();
  }
  swift_bridgeObjectRelease();
}

@end