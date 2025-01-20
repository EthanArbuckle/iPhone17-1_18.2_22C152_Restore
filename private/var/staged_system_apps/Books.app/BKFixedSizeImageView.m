@interface BKFixedSizeImageView
- (CGSize)intrinsicContentSize;
- (_TtC5Books20BKFixedSizeImageView)initWithCoder:(id)a3;
- (_TtC5Books20BKFixedSizeImageView)initWithFrame:(CGRect)a3;
- (_TtC5Books20BKFixedSizeImageView)initWithImage:(id)a3;
- (_TtC5Books20BKFixedSizeImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
@end

@implementation BKFixedSizeImageView

- (_TtC5Books20BKFixedSizeImageView)initWithCoder:(id)a3
{
  result = (_TtC5Books20BKFixedSizeImageView *)sub_1007FF260();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Books20BKFixedSizeImageView_fixedSize);
  double v3 = *(double *)&self->fixedSize[OBJC_IVAR____TtC5Books20BKFixedSizeImageView_fixedSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC5Books20BKFixedSizeImageView)initWithImage:(id)a3
{
  id v3 = a3;
  CGSize result = (_TtC5Books20BKFixedSizeImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Books20BKFixedSizeImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CGSize result = (_TtC5Books20BKFixedSizeImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Books20BKFixedSizeImageView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC5Books20BKFixedSizeImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end