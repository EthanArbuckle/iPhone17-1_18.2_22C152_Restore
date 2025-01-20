@interface FullScreenGenericMapView
- (_TtC7Journal24FullScreenGenericMapView)initWithCoder:(id)a3;
- (_TtC7Journal24FullScreenGenericMapView)initWithFrame:(CGRect)a3;
@end

@implementation FullScreenGenericMapView

- (_TtC7Journal24FullScreenGenericMapView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal24FullScreenGenericMapView *)sub_10004EDF0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal24FullScreenGenericMapView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10004F6F8();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal24FullScreenGenericMapView_mapAsset);
}

@end