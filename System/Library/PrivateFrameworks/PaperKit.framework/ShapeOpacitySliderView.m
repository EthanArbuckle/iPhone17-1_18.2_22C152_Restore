@interface ShapeOpacitySliderView
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (_TtC8PaperKit22ShapeOpacitySliderView)initWithCoder:(id)a3;
- (_TtC8PaperKit22ShapeOpacitySliderView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
@end

@implementation ShapeOpacitySliderView

- (_TtC8PaperKit22ShapeOpacitySliderView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8PaperKit22ShapeOpacitySliderView_gradient;
  id v6 = objc_allocWithZone(MEMORY[0x263F157D0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit22ShapeOpacitySliderView_trackImage) = 0;

  result = (_TtC8PaperKit22ShapeOpacitySliderView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)didMoveToSuperview
{
  v2 = self;
  ShapeOpacitySliderView.didMoveToSuperview()();
}

- (void)layoutSubviews
{
  v2 = self;
  ShapeOpacitySliderView.layoutSubviews()();
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)swift_getObjectType();
  -[ShapeOpacitySliderView thumbRectForBounds:trackRect:value:](&v19, sel_thumbRectForBounds_trackRect_value_, v11, v10, v9, v8, x, y, width, height, LODWORD(a5));
  double v16 = a5 * -6.0 + 3.0 + v15;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v16;
  return result;
}

- (_TtC8PaperKit22ShapeOpacitySliderView)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC8PaperKit22ShapeOpacitySliderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit22ShapeOpacitySliderView_gradient));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit22ShapeOpacitySliderView_trackImage);
}

@end