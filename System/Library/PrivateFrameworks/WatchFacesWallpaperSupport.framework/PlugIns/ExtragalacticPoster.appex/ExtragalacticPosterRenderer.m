@interface ExtragalacticPosterRenderer
- (_TtC19ExtragalacticPoster27ExtragalacticPosterRenderer)init;
- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)rendererDidInvalidate:(id)a3;
@end

@implementation ExtragalacticPosterRenderer

- (_TtC19ExtragalacticPoster27ExtragalacticPosterRenderer)init
{
  return (_TtC19ExtragalacticPoster27ExtragalacticPosterRenderer *)sub_100010BB8();
}

- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_100010D64(v6, a4);

  swift_unknownObjectRelease();
}

- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_100010F90((uint64_t)v8, a4);
  if ((sub_100018850() & 1) == 0) {
    sub_1000075BC();
  }

  swift_unknownObjectRelease();
}

- (void)rendererDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000117D8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19ExtragalacticPoster27ExtragalacticPosterRenderer_controller));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19ExtragalacticPoster27ExtragalacticPosterRenderer_renderer));
  swift_release();
}

@end