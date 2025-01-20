@interface FollowingBadgingCoordinator
- (_TtC7NewsUI227FollowingBadgingCoordinator)init;
- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4;
- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6;
- (void)userInfoDidChangeDateLastViewedSaved:(id)a3 fromCloud:(BOOL)a4;
- (void)userInfoDidChangeDateLastViewedSharedWithYou:(id)a3 fromCloud:(BOOL)a4;
@end

@implementation FollowingBadgingCoordinator

- (_TtC7NewsUI227FollowingBadgingCoordinator)init
{
  result = (_TtC7NewsUI227FollowingBadgingCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI227FollowingBadgingCoordinator_delegate);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227FollowingBadgingCoordinator_sharedItemManager);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI227FollowingBadgingCoordinator_readingHistory);
}

- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6
{
  uint64_t v9 = sub_1DFDFE220();
  id v10 = a3;
  v11 = self;
  sub_1DF9DB830(v9, a6);

  swift_bridgeObjectRelease();
}

- (void)userInfoDidChangeDateLastViewedSaved:(id)a3 fromCloud:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_1DF9DB934();
}

- (void)userInfoDidChangeDateLastViewedSharedWithYou:(id)a3 fromCloud:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_1DF9DB6B4();
}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  sub_1DEA69724();
  uint64_t v6 = sub_1DFDFDAF0();
  id v7 = a3;
  v8 = self;
  sub_1DF9DBA28(v6);

  swift_bridgeObjectRelease();
}

@end