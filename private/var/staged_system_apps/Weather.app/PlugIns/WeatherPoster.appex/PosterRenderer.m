@interface PosterRenderer
- (_TtC13WeatherPoster14PosterRenderer)init;
- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)rendererDidInvalidate:(id)a3;
@end

@implementation PosterRenderer

- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_1000199B4();

  swift_unknownObjectRelease();
}

- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_10001BA08(v8, a4, a5);

  swift_unknownObjectRelease();
}

- (void)rendererDidInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10001BD9C();
}

- (_TtC13WeatherPoster14PosterRenderer)init
{
}

- (void).cxx_destruct
{
  sub_10001F7A8((uint64_t)self + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_posterData, (uint64_t *)&unk_10006C4B0);
  sub_10001F7A8((uint64_t)self + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_lastRenderedAnimationViewModel, &qword_10006C320);
  swift_unknownObjectRelease();
  swift_release();

  swift_release();
  swift_release();

  swift_release();
}

@end