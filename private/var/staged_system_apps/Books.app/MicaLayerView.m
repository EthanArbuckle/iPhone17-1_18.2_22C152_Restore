@interface MicaLayerView
- (CGSize)intrinsicContentSize;
- (_TtC5Books13MicaLayerView)initWithCoder:(id)a3;
- (_TtC5Books13MicaLayerView)initWithFrame:(CGRect)a3;
- (void)micaPlayerDidChangePlaybackTime:(id)a3;
@end

@implementation MicaLayerView

- (_TtC5Books13MicaLayerView)initWithCoder:(id)a3
{
  result = (_TtC5Books13MicaLayerView *)sub_1007FF260();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books13MicaLayerView_micaSize);
  double v3 = *(double *)&self->mica[OBJC_IVAR____TtC5Books13MicaLayerView_micaSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC5Books13MicaLayerView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC5Books13MicaLayerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books13MicaLayerView_player);
}

- (void)micaPlayerDidChangePlaybackTime:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1006AB838(a3);
}

@end