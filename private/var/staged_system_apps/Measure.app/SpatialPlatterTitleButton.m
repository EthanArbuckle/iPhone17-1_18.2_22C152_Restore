@interface SpatialPlatterTitleButton
- (CGSize)intrinsicContentSize;
- (_TtC7Measure25SpatialPlatterTitleButton)initWithCoder:(id)a3;
- (_TtC7Measure25SpatialPlatterTitleButton)initWithFrame:(CGRect)a3;
- (void)onButtonTouchDown;
- (void)onButtonTouchUp;
@end

@implementation SpatialPlatterTitleButton

- (_TtC7Measure25SpatialPlatterTitleButton)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC7Measure25SpatialPlatterTitleButton_touchDownCallback);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC7Measure25SpatialPlatterTitleButton_touchUpCallback);
  void *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7Measure25SpatialPlatterTitleButton_fadeOutAnimator) = 0;
  id v6 = a3;

  result = (_TtC7Measure25SpatialPlatterTitleButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = *(double *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC7Measure25SpatialPlatterTitleButton_size);
  double v3 = *(double *)&self->size[OBJC_IVAR____TtC7Measure25SpatialPlatterTitleButton_size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)onButtonTouchDown
{
  double v2 = self;
  sub_1001097A0();
}

- (void)onButtonTouchUp
{
  double v2 = self;
  sub_100109840();
}

- (_TtC7Measure25SpatialPlatterTitleButton)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC7Measure25SpatialPlatterTitleButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100028914(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC7Measure25SpatialPlatterTitleButton_touchDownCallback));
  sub_100028914(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC7Measure25SpatialPlatterTitleButton_touchUpCallback));
  double v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Measure25SpatialPlatterTitleButton_fadeOutAnimator);
}

@end