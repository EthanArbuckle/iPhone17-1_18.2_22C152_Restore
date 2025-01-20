@interface KCSharingMessagingdXPCServer
- (NSString)description;
- (_TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer)init;
- (void)cancelPendingInvitesForGroup:(KCSharingGroup *)a3 participantHandles:(NSArray *)a4 completion:(id)a5;
- (void)didAcceptInviteForGroupID:(NSString *)a3 completion:(id)a4;
- (void)didDeclineInviteForGroupID:(NSString *)a3 completion:(id)a4;
- (void)fetchReceivedInviteWithGroupID:(id)a3 completion:(id)a4;
- (void)fetchReceivedInvitesWithCompletion:(id)a3;
- (void)sendNewInvitesForGroup:(KCSharingGroup *)a3 completion:(id)a4;
@end

@implementation KCSharingMessagingdXPCServer

- (_TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer)init
{
  result = (_TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (NSString)description
{
  v2 = self;
  sub_10000204C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)sendNewInvitesForGroup:(KCSharingGroup *)a3 completion:(id)a4
{
  sub_100003F84(&qword_1000255A0);
  __chkstk_darwin();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100025670;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100025678;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  sub_1000043E0((uint64_t)v8, (uint64_t)&unk_100025680, (uint64_t)v13);
  swift_release();
}

- (void)cancelPendingInvitesForGroup:(KCSharingGroup *)a3 participantHandles:(NSArray *)a4 completion:(id)a5
{
  sub_100003F84(&qword_1000255A0);
  __chkstk_darwin();
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a5);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100025650;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100025658;
  v15[5] = v14;
  uint64_t v16 = a3;
  v17 = a4;
  v18 = self;
  sub_1000043E0((uint64_t)v10, (uint64_t)&unk_100025660, (uint64_t)v15);
  swift_release();
}

- (void)didAcceptInviteForGroupID:(NSString *)a3 completion:(id)a4
{
  sub_100003F84(&qword_1000255A0);
  __chkstk_darwin();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100025630;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100025638;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  sub_1000043E0((uint64_t)v8, (uint64_t)&unk_100025640, (uint64_t)v13);
  swift_release();
}

- (void)didDeclineInviteForGroupID:(NSString *)a3 completion:(id)a4
{
  sub_100003F84(&qword_1000255A0);
  __chkstk_darwin();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100025610;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100025618;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  sub_1000043E0((uint64_t)v8, (uint64_t)&unk_100025620, (uint64_t)v13);
  swift_release();
}

- (void)fetchReceivedInviteWithGroupID:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_100003F84(&qword_1000255A0);
  __chkstk_darwin(v6 - 8);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a4);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v9;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = v10;
  v15[6] = v12;
  v15[7] = sub_100004920;
  v15[8] = v13;
  uint64_t v16 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10000364C((uint64_t)v8, (uint64_t)&unk_1000255F8, (uint64_t)v15);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)fetchReceivedInvitesWithCompletion:(id)a3
{
  uint64_t v5 = sub_100003F84(&qword_1000255A0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1000255B0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1000255C0;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_1000043E0((uint64_t)v7, (uint64_t)&unk_1000255D0, (uint64_t)v12);
  swift_release();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer_connection));
  NSString v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer_invitationManagerDelegate);
}

@end