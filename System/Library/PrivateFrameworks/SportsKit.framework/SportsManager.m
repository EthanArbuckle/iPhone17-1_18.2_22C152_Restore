@interface SportsManager
- (_TtC9SportsKit13SportsManager)init;
- (_TtP9SportsKit21SportsManagerDelegate_)delegate;
- (int64_t)activitiesCount;
- (void)getEventForCanonicalId:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SportsManager

- (_TtP9SportsKit21SportsManagerDelegate_)delegate
{
  v2 = (void *)sub_23F8D7A9C();

  return (_TtP9SportsKit21SportsManagerDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_23F8D7B48();
}

- (_TtC9SportsKit13SportsManager)init
{
  return (_TtC9SportsKit13SportsManager *)SportsManager.init()();
}

- (int64_t)activitiesCount
{
  v2 = self;
  int64_t v3 = sub_23F8DB060();

  return v3;
}

- (void)getEventForCanonicalId:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_23F95BBB0();
  uint64_t v8 = v7;
  _Block_copy(v5);
  v9 = self;
  sub_23F8DB0F8(v6, v8, (uint64_t)v9, v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SportsKit13SportsManager_dataStore);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SportsKit13SportsManager_xpcConnectionProvider);

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_23F8E4548((uint64_t)self + OBJC_IVAR____TtC9SportsKit13SportsManager_delegate);
  swift_release();
  swift_release();

  swift_release();
}

@end