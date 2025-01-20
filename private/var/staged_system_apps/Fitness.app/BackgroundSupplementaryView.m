@interface BackgroundSupplementaryView
- (_TtC10FitnessApp27BackgroundSupplementaryView)initWithCoder:(id)a3;
- (_TtC10FitnessApp27BackgroundSupplementaryView)initWithFrame:(CGRect)a3;
@end

@implementation BackgroundSupplementaryView

- (_TtC10FitnessApp27BackgroundSupplementaryView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for BackgroundSupplementaryView();
  v7 = -[BackgroundSupplementaryView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  id v8 = [(BackgroundSupplementaryView *)v7 layer];
  [v8 setCornerRadius:8.0];

  id v9 = sub_10005DB50();
  [(BackgroundSupplementaryView *)v7 setBackgroundColor:v9];

  return v7;
}

- (_TtC10FitnessApp27BackgroundSupplementaryView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BackgroundSupplementaryView();
  return [(BackgroundSupplementaryView *)&v5 initWithCoder:a3];
}

@end