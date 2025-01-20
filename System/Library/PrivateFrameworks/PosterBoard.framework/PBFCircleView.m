@interface PBFCircleView
+ (Class)layerClass;
- (UIColor)fillColor;
- (UIColor)strokeColor;
- (_TtC11PosterBoard13PBFCircleView)initWithCoder:(id)a3;
- (_TtC11PosterBoard13PBFCircleView)initWithFrame:(CGRect)a3;
- (double)strokeWidth;
- (void)layoutSubviews;
- (void)setFillColor:(id)a3;
- (void)setStrokeColor:(id)a3;
- (void)setStrokeWidth:(double)a3;
@end

@implementation PBFCircleView

- (double)strokeWidth
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_1D33725E8();
  swift_release();
  swift_release();

  return v5;
}

- (void)setStrokeWidth:(double)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_1D33725F8();
}

- (UIColor)strokeColor
{
  return (UIColor *)sub_1D331D06C(self);
}

- (void)setStrokeColor:(id)a3
{
}

- (UIColor)fillColor
{
  return (UIColor *)sub_1D331D06C(self);
}

- (void)setFillColor:(id)a3
{
}

+ (Class)layerClass
{
  sub_1D32CE184(0, &qword_1EA6A9568);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)layoutSubviews
{
  v2 = self;
  PBFCircleView.layoutSubviews()();
}

- (_TtC11PosterBoard13PBFCircleView)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard13PBFCircleView *)PBFCircleView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard13PBFCircleView)initWithCoder:(id)a3
{
  return (_TtC11PosterBoard13PBFCircleView *)PBFCircleView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11PosterBoard13PBFCircleView__strokeWidth;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6A9578);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  double v5 = (char *)self + OBJC_IVAR____TtC11PosterBoard13PBFCircleView__strokeColor;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6A9570);
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v8)((void *)(v6 - 8), v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC11PosterBoard13PBFCircleView__fillColor;
  v8(v7, v6);
}

@end