@interface CommunityIDMapsSync
+ (_TtC4Maps19CommunityIDMapsSync)shared;
- (_TtC4Maps19CommunityIDMapsSync)init;
- (_TtC8MapsSync13MapsSyncStore)store;
- (void)fetchAllAvailableCommunityIDsWithPredicate:(id)a3 completion:(id)a4;
- (void)fetchCommunityIDWithIdentifier:(id)a3 completion:(id)a4;
- (void)increaseUsedCountWithMsCommunityID:(id)a3 completion:(id)a4;
- (void)setExpiredWithMsCommunityID:(id)a3 completion:(id)a4;
- (void)setStore:(id)a3;
- (void)storeCommunityIDWithIdentifier:(id)a3 completion:(id)a4;
@end

@implementation CommunityIDMapsSync

+ (_TtC4Maps19CommunityIDMapsSync)shared
{
  if (qword_1015CBB20 != -1) {
    swift_once();
  }
  v2 = (void *)qword_101611218;

  return (_TtC4Maps19CommunityIDMapsSync *)v2;
}

- (_TtC8MapsSync13MapsSyncStore)store
{
  return (_TtC8MapsSync13MapsSyncStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                 + OBJC_IVAR____TtC4Maps19CommunityIDMapsSync_store));
}

- (void)setStore:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps19CommunityIDMapsSync_store);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps19CommunityIDMapsSync_store) = (Class)a3;
  id v3 = a3;
}

- (_TtC4Maps19CommunityIDMapsSync)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps19CommunityIDMapsSync_store) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CommunityIDMapsSync();
  return [(CommunityIDMapsSync *)&v3 init];
}

- (void).cxx_destruct
{
}

- (void)fetchAllAvailableCommunityIDsWithPredicate:(id)a3 completion:(id)a4
{
  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_10011AC70;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_100119DB0(v8, (uint64_t)v6, v7);
  sub_10006C5D8((uint64_t)v6);
}

- (void)fetchCommunityIDWithIdentifier:(id)a3 completion:(id)a4
{
  v5 = (uint64_t (*)())_Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  if (v5)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v5;
    v5 = sub_10011AC70;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10 = self;
  sub_10011A068(v6, v8, (uint64_t)v5, v9);
  sub_10006C5D8((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)storeCommunityIDWithIdentifier:(id)a3 completion:(id)a4
{
  v5 = (uint64_t (*)())_Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    v5 = sub_10011AC70;
  }
  uint64_t v9 = self;
  sub_10011A264(v6, v8, (void (*)(void, void))v5);
  sub_10006C5D8((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)setExpiredWithMsCommunityID:(id)a3 completion:(id)a4
{
  uint64_t v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    uint64_t v6 = sub_10011AC70;
  }
  id v7 = a3;
  uint64_t v8 = self;
  sub_10011A3EC(v7, (void (*)(uint64_t, void))v6);
  sub_10006C5D8((uint64_t)v6);
}

- (void)increaseUsedCountWithMsCommunityID:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void (*)(uint64_t, void))_Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    uint64_t v6 = (void (*)(uint64_t, void))sub_10011A748;
  }
  id v7 = a3;
  uint64_t v8 = self;
  sub_10011A58C(v7, v6);
  sub_10006C5D8((uint64_t)v6);
}

@end