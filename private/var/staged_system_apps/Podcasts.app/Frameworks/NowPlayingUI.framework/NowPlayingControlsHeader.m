@interface NowPlayingControlsHeader
- (_TtC12NowPlayingUI24NowPlayingControlsHeader)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI24NowPlayingControlsHeader)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NowPlayingControlsHeader

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(NowPlayingControlsHeader *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC12NowPlayingUI24NowPlayingControlsHeader_controlsView];
  if (v3)
  {
    id v4 = v3;
    [v2 bounds];
    [v4 setFrame:];
  }
  else
  {
    __break(1u);
  }
}

- (_TtC12NowPlayingUI24NowPlayingControlsHeader)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingControlsHeader_controlsView) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[NowPlayingControlsHeader initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC12NowPlayingUI24NowPlayingControlsHeader)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingControlsHeader_controlsView) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(NowPlayingControlsHeader *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingControlsHeader_controlsView));
}

@end