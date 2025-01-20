@interface BoundingBox
- (CGRect)rect;
- (CGSize)imageSize;
- (NSString)description;
- (_TtC15UIUnderstanding11BoundingBox)init;
- (_TtC15UIUnderstanding11BoundingBox)initWithRect:(CGRect)a3 imageSize:(CGSize)a4;
- (void)setImageSize:(CGSize)a3;
- (void)setRect:(CGRect)a3;
@end

@implementation BoundingBox

- (CGRect)rect
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC15UIUnderstanding11BoundingBox_rect);
  swift_beginAccess();
  double v3 = *v2;
  double v4 = v2[1];
  double v5 = v2[2];
  double v6 = v2[3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = (CGFloat *)((char *)self + OBJC_IVAR____TtC15UIUnderstanding11BoundingBox_rect);
  swift_beginAccess();
  CGFloat *v7 = x;
  v7[1] = y;
  v7[2] = width;
  v7[3] = height;
}

- (CGSize)imageSize
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC15UIUnderstanding11BoundingBox_imageSize);
  swift_beginAccess();
  double v3 = *v2;
  double v4 = v2[1];
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v5 = (CGFloat *)((char *)self + OBJC_IVAR____TtC15UIUnderstanding11BoundingBox_imageSize);
  swift_beginAccess();
  *double v5 = width;
  v5[1] = height;
}

- (_TtC15UIUnderstanding11BoundingBox)initWithRect:(CGRect)a3 imageSize:(CGSize)a4
{
  *(CGRect *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding11BoundingBox_rect) = a3;
  *(CGSize *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding11BoundingBox_imageSize) = a4;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BoundingBox();
  return [(BoundingBox *)&v5 init];
}

- (NSString)description
{
  v2 = self;
  sub_260635F54();

  double v3 = (void *)sub_260655788();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC15UIUnderstanding11BoundingBox)init
{
  CGSize result = (_TtC15UIUnderstanding11BoundingBox *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end