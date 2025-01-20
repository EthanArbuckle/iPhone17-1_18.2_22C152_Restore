@interface DimmerView
- (_TtC17PromotedContentUI10DimmerView)initWithCoder:(id)a3;
- (_TtC17PromotedContentUI10DimmerView)initWithFrame:(CGRect)a3;
@end

@implementation DimmerView

- (_TtC17PromotedContentUI10DimmerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC17PromotedContentUI10DimmerView_dimmed) = 0;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DimmerView();
  v7 = -[DimmerView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  v8 = self;
  v9 = v7;
  id v10 = objc_msgSend(v8, sel_clearColor);
  [(DimmerView *)v9 setBackgroundColor:v10];

  [(DimmerView *)v9 setAlpha:0.2];
  [(DimmerView *)v9 setIsAccessibilityElement:0];
  [(DimmerView *)v9 setUserInteractionEnabled:0];

  return v9;
}

- (_TtC17PromotedContentUI10DimmerView)initWithCoder:(id)a3
{
  return (_TtC17PromotedContentUI10DimmerView *)sub_1B5D934BC(a3);
}

@end