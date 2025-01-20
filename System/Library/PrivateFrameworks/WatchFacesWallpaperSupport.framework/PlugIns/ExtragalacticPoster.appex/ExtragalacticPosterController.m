@interface ExtragalacticPosterController
- (_TtC19ExtragalacticPoster29ExtragalacticPosterController)init;
@end

@implementation ExtragalacticPosterController

- (_TtC19ExtragalacticPoster29ExtragalacticPosterController)init
{
  return (_TtC19ExtragalacticPoster29ExtragalacticPosterController *)sub_1000078A8();
}

- (void).cxx_destruct
{
  sub_100007D30((uint64_t)self + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_backgroundView));
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_rotationFrame;
  uint64_t v4 = sub_100018800();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1000070CC((uint64_t)self + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_colorProvider);
  v5 = (char *)self + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_progress;
  uint64_t v6 = sub_1000188D0();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
}

@end