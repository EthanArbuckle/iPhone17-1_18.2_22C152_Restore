@interface FixedSizeView
- (CGSize)intrinsicContentSize;
- (_TtC16MusicApplication13FixedSizeView)initWithCoder:(id)a3;
- (_TtC16MusicApplication13FixedSizeView)initWithFrame:(CGRect)a3;
@end

@implementation FixedSizeView

- (_TtC16MusicApplication13FixedSizeView)initWithCoder:(id)a3
{
  result = (_TtC16MusicApplication13FixedSizeView *)sub_AB8280();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication13FixedSizeView_size);
  double v3 = *(double *)&self->size[OBJC_IVAR____TtC16MusicApplication13FixedSizeView_size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC16MusicApplication13FixedSizeView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC16MusicApplication13FixedSizeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end