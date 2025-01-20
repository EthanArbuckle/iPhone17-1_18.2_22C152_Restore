@interface SupplementalContentButton
- (CGSize)intrinsicContentSize;
- (_TtC5Books25SupplementalContentButton)initWithCoder:(id)a3;
- (_TtC5Books25SupplementalContentButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SupplementalContentButton

- (void)layoutSubviews
{
  v2 = self;
  sub_1006E5B60();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_1006E5EF8();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC5Books25SupplementalContentButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books25SupplementalContentButton_compactMode) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SupplementalContentButton();
  return -[SupplementalContentButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC5Books25SupplementalContentButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books25SupplementalContentButton_compactMode) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SupplementalContentButton();
  return [(SupplementalContentButton *)&v5 initWithCoder:a3];
}

@end