@interface CHInvitationDestinationCoordinator
- (CHInvitationDestinationCoordinator)init;
- (void)fetchReachableDestinationsFor:(id)a3 completion:(id)a4;
- (void)sendInvitationToDestinations:(id)a3 callerID:(id)a4 completion:(id)a5;
@end

@implementation CHInvitationDestinationCoordinator

- (CHInvitationDestinationCoordinator)init
{
  return (CHInvitationDestinationCoordinator *)sub_100068B58();
}

- (void)sendInvitationToDestinations:(id)a3 callerID:(id)a4 completion:(id)a5
{
  uint64_t v7 = sub_1000AFA94(&qword_10094B7A0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a5);
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v10;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v9, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = self;
  v17[5] = v11;
  v17[6] = v12;
  v17[7] = v14;
  v17[8] = sub_10060F7FC;
  v17[9] = v15;
  v18 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1000713D0((uint64_t)v9, (uint64_t)&unk_100965628, (uint64_t)v17);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)fetchReachableDestinationsFor:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_1000AFA94(&qword_10094B7A0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 1, 1, v12);
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = v13;
  v14[5] = v10;
  v14[6] = sub_10060F76C;
  v14[7] = v11;
  uint64_t v15 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1000713D0((uint64_t)v8, (uint64_t)&unk_10096A4C0, (uint64_t)v14);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___CHInvitationDestinationCoordinator_invitationDestinationService;
  uint64_t v4 = type metadata accessor for InvitationDestinationService();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___CHInvitationDestinationCoordinator_secureCloudClient;
  uint64_t v6 = type metadata accessor for SecureCloudClient();
  uint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end