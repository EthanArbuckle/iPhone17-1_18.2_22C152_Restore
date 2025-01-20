@interface InheritanceMessageProcessor
- (_TtC13appleaccountd27InheritanceMessageProcessor)init;
- (void)messageService:(id)a3 didReceiveMessage:(id)a4 fromID:(id)a5;
@end

@implementation InheritanceMessageProcessor

- (void)messageService:(id)a3 didReceiveMessage:(id)a4 fromID:(id)a5
{
  swift_unknownObjectRetain();
  id v8 = a4;
  id v9 = a5;
  v16 = self;
  v10 = (uint64_t (*)(void))static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;

  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;

  sub_10020ECF0(v10, v12, v13, v15);
  swift_bridgeObjectRelease();
  sub_100013198((uint64_t)v10, (unint64_t)v12);
  swift_unknownObjectRelease();
}

- (_TtC13appleaccountd27InheritanceMessageProcessor)init
{
  result = (_TtC13appleaccountd27InheritanceMessageProcessor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100008EA8((uint64_t)self + OBJC_IVAR____TtC13appleaccountd27InheritanceMessageProcessor_accountStore);
  sub_100008EA8((uint64_t)self + OBJC_IVAR____TtC13appleaccountd27InheritanceMessageProcessor_invitationHandler);
  sub_100008EA8((uint64_t)self + OBJC_IVAR____TtC13appleaccountd27InheritanceMessageProcessor_invitationResponseHandler);
  sub_100008EA8((uint64_t)self + OBJC_IVAR____TtC13appleaccountd27InheritanceMessageProcessor_accessKeyMessageHandler);
  v3 = (char *)self + OBJC_IVAR____TtC13appleaccountd27InheritanceMessageProcessor_beneficiaryRemovedMessageHandler;

  sub_100008EA8((uint64_t)v3);
}

@end