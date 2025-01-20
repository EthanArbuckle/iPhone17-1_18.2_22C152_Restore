@interface CustodianMessageProcessor
- (_TtC13appleaccountd25CustodianMessageProcessor)init;
- (void)messageService:(id)a3 didReceiveMessage:(id)a4 fromID:(id)a5;
@end

@implementation CustodianMessageProcessor

- (void)messageService:(id)a3 didReceiveMessage:(id)a4 fromID:(id)a5
{
  swift_unknownObjectRetain();
  id v8 = a4;
  id v9 = a5;
  v16 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;

  sub_1000B5678(v10, v12, v13, v15);
  swift_bridgeObjectRelease();
  sub_100013198(v10, v12);
  swift_unknownObjectRelease();
}

- (_TtC13appleaccountd25CustodianMessageProcessor)init
{
  result = (_TtC13appleaccountd25CustodianMessageProcessor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100008EA8((uint64_t)self + OBJC_IVAR____TtC13appleaccountd25CustodianMessageProcessor_accountStore);
  sub_100008EA8((uint64_t)self + OBJC_IVAR____TtC13appleaccountd25CustodianMessageProcessor_invitationHandler);
  sub_100008EA8((uint64_t)self + OBJC_IVAR____TtC13appleaccountd25CustodianMessageProcessor_invitationResponseHandler);
  sub_100008EA8((uint64_t)self + OBJC_IVAR____TtC13appleaccountd25CustodianMessageProcessor_shareHandler);
  sub_100008EA8((uint64_t)self + OBJC_IVAR____TtC13appleaccountd25CustodianMessageProcessor_setupFinalizationHandler);
  v3 = (char *)self + OBJC_IVAR____TtC13appleaccountd25CustodianMessageProcessor_custodianRemovedHandler;

  sub_100008EA8((uint64_t)v3);
}

@end