@interface PosterRackTopButton
- (_TtC11PosterBoard19PosterRackTopButton)initWithCoder:(id)a3;
- (_TtC11PosterBoard19PosterRackTopButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PosterRackTopButton

- (void)layoutSubviews
{
  v2 = self;
  sub_1D331142C();
}

- (_TtC11PosterBoard19PosterRackTopButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard19PosterRackTopButton_contentWidthForCalculatedFittingFont) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PosterRackTopButton();
  return -[PosterRackTopButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11PosterBoard19PosterRackTopButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard19PosterRackTopButton_contentWidthForCalculatedFittingFont) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PosterRackTopButton();
  return [(PosterRackTopButton *)&v5 initWithCoder:a3];
}

@end