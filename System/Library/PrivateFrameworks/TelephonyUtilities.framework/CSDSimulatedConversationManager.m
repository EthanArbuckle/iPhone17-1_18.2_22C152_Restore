@interface CSDSimulatedConversationManager
- (CSDSimulatedConversationManager)init;
- (void)addRemoteParticipantWithHandle:(id)a3 update:(id)a4 toConversationWithGroupUUID:(id)a5;
- (void)createIncomingConversationWithHandles:(id)a3;
- (void)removeRemoteParticipant:(id)a3 fromConversationWithGroupUUID:(id)a4;
- (void)updateParticipant:(id)a3 withUpdate:(id)a4 onConversationWithGroupUUID:(id)a5;
@end

@implementation CSDSimulatedConversationManager

- (CSDSimulatedConversationManager)init
{
  return (CSDSimulatedConversationManager *)sub_100285174();
}

- (void).cxx_destruct
{
  sub_1001F081C(&qword_1005873C0);
  sub_1001F7664();
  v3();

  swift_bridgeObjectRelease();
}

- (void)updateParticipant:(id)a3 withUpdate:(id)a4 onConversationWithGroupUUID:(id)a5
{
}

- (void)addRemoteParticipantWithHandle:(id)a3 update:(id)a4 toConversationWithGroupUUID:(id)a5
{
}

- (void)removeRemoteParticipant:(id)a3 fromConversationWithGroupUUID:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_100288994();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)createIncomingConversationWithHandles:(id)a3
{
  sub_1001F6204(0, (unint64_t *)&unk_100586E00);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = self;
  sub_100289198();

  swift_bridgeObjectRelease();
}

@end