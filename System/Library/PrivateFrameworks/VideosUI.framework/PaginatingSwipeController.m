@interface PaginatingSwipeController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC8VideosUI25PaginatingSwipeController)init;
- (void)didPanOnView:(id)a3;
@end

@implementation PaginatingSwipeController

- (_TtC8VideosUI25PaginatingSwipeController)init
{
}

- (void).cxx_destruct
{
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI25PaginatingSwipeController_dataSource);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8VideosUI25PaginatingSwipeController____lazy_storage___gesture));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8VideosUI25PaginatingSwipeController____lazy_storage___mediaShowcaseConfig);
}

- (void)didPanOnView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E37718F4(v4);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1E377302C();

  return self & 1;
}

@end