@interface ConversationLinkSyncIDSInteractor
- (_TtC13callservicesd33ConversationLinkSyncIDSInteractor)init;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
@end

@implementation ConversationLinkSyncIDSInteractor

- (void)service:(id)a3 devicesChanged:(id)a4
{
  if (a4) {
    uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = a3;
  v8 = self;
  sub_100248030(a3, v6);

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  if (a4) {
    uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = a3;
  v8 = self;
  sub_1002483C8((uint64_t)v8, v6);

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  v9 = a5;
  if (a5)
  {
    id v12 = a3;
    id v13 = a4;
    id v14 = a6;
    id v15 = a7;
    v16 = self;
    id v17 = v9;
    v9 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v19 = v18;

    if (a6)
    {
LABEL_3:
      v22 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
      v24 = v23;

      goto LABEL_6;
    }
  }
  else
  {
    id v25 = a3;
    id v26 = a4;
    id v27 = a6;
    id v28 = a7;
    v20 = self;
    unint64_t v19 = 0xF000000000000000;
    if (a6) {
      goto LABEL_3;
    }
  }
  v22 = 0;
  v24 = 0;
LABEL_6:
  sub_1002484C0((uint64_t)v20, v21, (uint64_t)v9, v19, v22, v24);
  swift_bridgeObjectRelease();
  sub_1001FCB18((uint64_t)v9, v19);
}

- (_TtC13callservicesd33ConversationLinkSyncIDSInteractor)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_100222678((uint64_t)self + OBJC_IVAR____TtC13callservicesd33ConversationLinkSyncIDSInteractor_delegate);

  swift_bridgeObjectRelease();
}

@end