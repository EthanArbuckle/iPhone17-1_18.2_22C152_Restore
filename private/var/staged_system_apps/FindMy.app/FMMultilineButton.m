@interface FMMultilineButton
- (CGSize)intrinsicContentSize;
- (_TtC6FindMy17FMMultilineButton)initWithCoder:(id)a3;
- (_TtC6FindMy17FMMultilineButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation FMMultilineButton

- (_TtC6FindMy17FMMultilineButton)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FMMultilineButton();
  id v4 = a3;
  v5 = [(FMMultilineButton *)&v9 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    sub_1002484A8();
  }
  return v6;
}

- (_TtC6FindMy17FMMultilineButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FMMultilineButton();
  v7 = -[FMMultilineButton initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  sub_1002484A8();

  return v7;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_1002485D8();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FMMultilineButton();
  id v2 = v9.receiver;
  [(FMMultilineButton *)&v9 layoutSubviews];
  id v3 = [v2 titleLabel];
  if (v3)
  {
    double v4 = v3;
    id v5 = [v2 titleLabel];
    if (v5)
    {
      double v6 = v5;
      [v5 frame];
      double v8 = v7;
    }
    else
    {
      double v8 = 0.0;
    }
    [v4 setPreferredMaxLayoutWidth:v8];
  }
  else
  {
    double v4 = v2;
  }
}

@end