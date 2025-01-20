@interface GenreRecommendationManager
- (_TtC5Books26GenreRecommendationManager)init;
- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4;
@end

@implementation GenreRecommendationManager

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books26GenreRecommendationManager_defaults);
  v9 = self;
  NSString v5 = sub_1007FDC30();
  [v4 removeObjectForKey:v5];

  v6 = *(os_unfair_lock_s **)((char *)&v9->super.isa + OBJC_IVAR____TtC5Books26GenreRecommendationManager_stateLock);
  uint64_t v7 = (uint64_t)&v6[4];
  v8 = v6 + 7;
  os_unfair_lock_lock(v6 + 7);
  sub_1005973EC(v7);
  os_unfair_lock_unlock(v8);
}

- (_TtC5Books26GenreRecommendationManager)init
{
  result = (_TtC5Books26GenreRecommendationManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC5Books26GenreRecommendationManager_service;

  _s5Books15CurrentPageViewVwxx_0((uint64_t)v3);
}

@end