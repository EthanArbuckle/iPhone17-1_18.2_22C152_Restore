@interface RouteAssetView
- (CGRect)frame;
- (_TtC7Journal14RouteAssetView)initWithCoder:(id)a3;
- (_TtC7Journal14RouteAssetView)initWithFrame:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation RouteAssetView

- (_TtC7Journal14RouteAssetView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal14RouteAssetView *)sub_10010125C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RouteAssetView();
  [(RouteAssetView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for RouteAssetView();
  v7 = (char *)v10.receiver;
  -[RouteAssetView setFrame:](&v10, "setFrame:", x, y, width, height);
  v8 = *(void **)&v7[OBJC_IVAR____TtC7Journal14RouteAssetView_shadowView];
  [v7 bounds];
  [v8 setFrame:];
  v9 = *(void **)&v7[OBJC_IVAR____TtC7Journal14RouteAssetView_fillLayer];
  [v7 bounds];
  [v9 setFrame:];
}

- (_TtC7Journal14RouteAssetView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10010A224();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal14RouteAssetView_routeImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal14RouteAssetView_exerciseNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal14RouteAssetView_workoutDataLabel));

  swift_release();
  sub_10001457C((uint64_t)self + OBJC_IVAR____TtC7Journal14RouteAssetView_latestImageRequestID, &qword_100800950);
}

@end