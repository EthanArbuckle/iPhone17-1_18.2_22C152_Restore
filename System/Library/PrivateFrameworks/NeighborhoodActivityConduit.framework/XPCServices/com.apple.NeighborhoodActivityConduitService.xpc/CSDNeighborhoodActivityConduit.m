@interface CSDNeighborhoodActivityConduit
- (CSDNeighborhoodActivityConduit)init;
- (CSDNeighborhoodActivityConduit)initWithConversationManager:(id)a3 callCenter:(id)a4;
- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 changedActivityAuthorizationForBundleIdentifier:(id)a4;
- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 resolvedAudioVideoModeChangedForConversation:(id)a4;
- (void)conversationsChangedForConversationManager:(id)a3;
- (void)dealloc;
@end

@implementation CSDNeighborhoodActivityConduit

- (CSDNeighborhoodActivityConduit)initWithConversationManager:(id)a3 callCenter:(id)a4
{
  sub_10005E470(a3, a4);
  return result;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  os_state_remove_handler();
  [*(id *)((char *)&v4->super.isa + OBJC_IVAR___CSDNeighborhoodActivityConduit_systemMonitor) invalidate];
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(CSDNeighborhoodActivityConduit *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();

  sub_10000EC60((uint64_t)self + OBJC_IVAR___CSDNeighborhoodActivityConduit_conversationServerBag);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_10002BD04((uint64_t)self + OBJC_IVAR___CSDNeighborhoodActivityConduit_delegate);
  swift_unknownObjectRelease();
  swift_release();
  sub_100015EAC((uint64_t)self + OBJC_IVAR___CSDNeighborhoodActivityConduit_handoffState, &qword_1001171E0);
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_unknownObjectRelease();

  swift_release();
}

- (CSDNeighborhoodActivityConduit)init
{
  result = (CSDNeighborhoodActivityConduit *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)conversationsChangedForConversationManager:(id)a3
{
  uint64_t v5 = sub_100004D9C((uint64_t *)&unk_1001170B0);
  __chkstk_darwin(v5 - 8, v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000E25E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  uint64_t v10 = qword_1001161A0;
  v11 = self;
  id v13 = a3;
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_10011BF88;
  uint64_t v15 = sub_10009C328(&qword_100116C00, v12, (void (*)(uint64_t))type metadata accessor for ConduitActor);
  v16 = (void *)swift_allocObject();
  v16[2] = v14;
  v16[3] = v15;
  v16[4] = v11;
  swift_retain();
  sub_1000A82D8((uint64_t)v8, (uint64_t)&unk_100118380, (uint64_t)v16);

  swift_release();
}

- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4
{
}

- (void)conversationManager:(id)a3 changedActivityAuthorizationForBundleIdentifier:(id)a4
{
  uint64_t v6 = sub_100004D9C((uint64_t *)&unk_1001170B0);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000E23F0();
  uint64_t v12 = v11;
  uint64_t v13 = sub_1000E25E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 1, 1, v13);
  uint64_t v14 = qword_1001161A0;
  uint64_t v15 = self;
  id v16 = a3;
  swift_bridgeObjectRetain();
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v18 = qword_10011BF88;
  uint64_t v19 = sub_10009C328(&qword_100116C00, v17, (void (*)(uint64_t))type metadata accessor for ConduitActor);
  v20 = (void *)swift_allocObject();
  v20[2] = v18;
  v20[3] = v19;
  v20[4] = v15;
  v20[5] = v10;
  v20[6] = v12;
  swift_retain();
  sub_1000A82D8((uint64_t)v9, (uint64_t)&unk_100118310, (uint64_t)v20);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4
{
}

- (void)conversationManager:(id)a3 resolvedAudioVideoModeChangedForConversation:(id)a4
{
}

@end