@interface ShowAllButton
- (CGSize)intrinsicContentSize;
- (_TtC10FitnessApp13ShowAllButton)initWithCoder:(id)a3;
- (_TtC10FitnessApp13ShowAllButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ShowAllButton

- (CGSize)intrinsicContentSize
{
  v2 = self;
  id v3 = [(ShowAllButton *)v2 titleLabel];
  if (v3)
  {
    v4 = v3;
    [v3 intrinsicContentSize];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {

    double v8 = 0.0;
    double v6 = 0.0;
  }
  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ShowAllButton();
  id v2 = v9.receiver;
  [(ShowAllButton *)&v9 layoutSubviews];
  id v3 = [v2 titleLabel];
  if (v3)
  {
    v4 = v3;
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
    v4 = v2;
  }
}

- (_TtC10FitnessApp13ShowAllButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ShowAllButton();
  return -[ShowAllButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC10FitnessApp13ShowAllButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ShowAllButton();
  return [(ShowAllButton *)&v5 initWithCoder:a3];
}

@end