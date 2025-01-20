@interface SearchFindMyFriendshipCoordinator
- (_TtC4Maps33SearchFindMyFriendshipCoordinator)init;
- (_TtC4Maps33SearchFindMyFriendshipCoordinator)initWith:(id)a3;
- (_TtP4Maps30SearchFindMyFriendshipDelegate_)delegate;
- (void)getLatestLocationsFor:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)startMonitoringHandles;
- (void)stopMonitoringHandlesWithCompletionHandler:(id)a3;
@end

@implementation SearchFindMyFriendshipCoordinator

- (_TtP4Maps30SearchFindMyFriendshipDelegate_)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP4Maps30SearchFindMyFriendshipDelegate_ *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC4Maps33SearchFindMyFriendshipCoordinator)initWith:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps33SearchFindMyFriendshipCoordinator_session) = 0;
  swift_unknownObjectWeakInit();
  v7 = (char *)self + OBJC_IVAR____TtC4Maps33SearchFindMyFriendshipCoordinator_updateStream;
  uint64_t v8 = sub_1000FF33C(&qword_1015D60D8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps33SearchFindMyFriendshipCoordinator_handleId);
  uint64_t *v9 = v4;
  v9[1] = v6;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SearchFindMyFriendshipCoordinator();
  return [(SearchFindMyFriendshipCoordinator *)&v11 init];
}

- (void)getLatestLocationsFor:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_100233AB0(v8, (uint64_t)sub_100118770, v7);

  swift_release();
}

- (void)startMonitoringHandles
{
  v2 = self;
  sub_100235280();
}

- (void)stopMonitoringHandlesWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  objc_super v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1015D6128;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1015D5D10;
  v12[5] = v11;
  v13 = self;
  sub_1000A2D24((uint64_t)v7, (uint64_t)&unk_1015DA440, (uint64_t)v12);
  swift_release();
}

- (_TtC4Maps33SearchFindMyFriendshipCoordinator)init
{
  result = (_TtC4Maps33SearchFindMyFriendshipCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end