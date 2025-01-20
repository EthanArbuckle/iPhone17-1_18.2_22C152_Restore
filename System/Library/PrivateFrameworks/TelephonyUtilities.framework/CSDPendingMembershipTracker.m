@interface CSDPendingMembershipTracker
- (CSDPendingMembershipTracker)init;
- (CSDPendingMembershipTrackerDelegate)delegate;
- (CSDPendingMembershipTrackerMessenger)messenger;
- (id)pendingMembersByGroup;
- (id)retrievePendingMembersFor:(id)a3;
- (void)clearPendingMembershipFor:(id)a3;
- (void)handleDelegatedPendingMember:(id)a3 forConversation:(id)a4 withGroupUUID:(id)a5 from:(id)a6 transactionUUID:(id)a7;
- (void)handleLocalApprovalOfMember:(id)a3 forConversation:(id)a4;
- (void)handleLocalRejectionOfMember:(id)a3 forConversation:(id)a4;
- (void)handleNewPendingMember:(id)a3 responseKey:(id)a4 forConversation:(id)a5 withLink:(id)a6 dateInitiatedLMI:(id)a7;
- (void)handleRemoteApprovalOfMember:(id)a3 forConversation:(id)a4 from:(id)a5 transactionUUID:(id)a6;
- (void)handleRemoteRejectionOfMember:(id)a3 forConversation:(id)a4 from:(id)a5 transactionUUID:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setMessenger:(id)a3;
- (void)stopTrackingPendingMember:(id)a3 forConversation:(id)a4 triggeredLocally:(BOOL)a5;
@end

@implementation CSDPendingMembershipTracker

- (CSDPendingMembershipTrackerMessenger)messenger
{
  v2 = (void *)sub_10026CE94();

  return (CSDPendingMembershipTrackerMessenger *)v2;
}

- (void)setMessenger:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_10026CF00();
}

- (CSDPendingMembershipTrackerDelegate)delegate
{
  v2 = (void *)sub_10026CF40();

  return (CSDPendingMembershipTrackerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_10026CFAC();
}

- (CSDPendingMembershipTracker)init
{
  return (CSDPendingMembershipTracker *)sub_10026CFFC();
}

- (void)stopTrackingPendingMember:(id)a3 forConversation:(id)a4 triggeredLocally:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_10026D0A0();
}

- (void)clearPendingMembershipFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10026D35C(v4);
}

- (id)retrievePendingMembersFor:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = self;
  sub_10026D498();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_1001F6204(0, (unint64_t *)&unk_1005888A0);
  sub_100273C10((unint64_t *)&qword_1005858C0, (unint64_t *)&unk_1005888A0);
  v9.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v9.super.isa;
}

- (id)pendingMembersByGroup
{
  v2 = self;
  sub_10026D750();

  type metadata accessor for UUID();
  sub_1001F081C(&qword_100586D60);
  sub_100273D0C();
  v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (void)handleNewPendingMember:(id)a3 responseKey:(id)a4 forConversation:(id)a5 withLink:(id)a6 dateInitiatedLMI:(id)a7
{
  uint64_t v25 = type metadata accessor for Date();
  uint64_t v13 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = a3;
  id v17 = a4;
  id v24 = a5;
  id v18 = a6;
  id v19 = a7;
  v20 = self;
  uint64_t v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v23 = v22;

  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10026D838();
  sub_1001F7498(v21, v23);

  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v25);
}

- (void)handleDelegatedPendingMember:(id)a3 forConversation:(id)a4 withGroupUUID:(id)a5 from:(id)a6 transactionUUID:(id)a7
{
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  id v17 = (char *)&v23 - v16;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v18 = a3;
  id v19 = a4;
  id v20 = a6;
  uint64_t v21 = self;
  sub_10026ECD0();

  unint64_t v22 = *(void (**)(char *, uint64_t))(v12 + 8);
  v22(v15, v11);
  v22(v17, v11);
}

- (void)handleRemoteApprovalOfMember:(id)a3 forConversation:(id)a4 from:(id)a5 transactionUUID:(id)a6
{
  sub_10026F4D0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)sub_10026F470, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17,
    v18);
}

- (void)handleRemoteRejectionOfMember:(id)a3 forConversation:(id)a4 from:(id)a5 transactionUUID:(id)a6
{
  sub_10026F4D0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)sub_10026F4A0, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17,
    v18);
}

- (void)handleLocalApprovalOfMember:(id)a3 forConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_10026F5D4();
}

- (void)handleLocalRejectionOfMember:(id)a3 forConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_10026F660();
}

- (void).cxx_destruct
{
  sub_100222678((uint64_t)self + OBJC_IVAR___CSDPendingMembershipTracker_messenger);
  sub_100222678((uint64_t)self + OBJC_IVAR___CSDPendingMembershipTracker_delegate);
  sub_1002018DC((uint64_t)self + OBJC_IVAR___CSDPendingMembershipTracker_storage);
  NSDictionary v3 = (char *)self + OBJC_IVAR___CSDPendingMembershipTracker_serverBag;

  sub_1002018DC((uint64_t)v3);
}

@end