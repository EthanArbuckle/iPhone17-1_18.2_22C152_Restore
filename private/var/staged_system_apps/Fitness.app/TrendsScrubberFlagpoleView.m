@interface TrendsScrubberFlagpoleView
- (_TtC10FitnessApp26TrendsScrubberFlagpoleView)initWithCoder:(id)a3;
- (_TtC10FitnessApp26TrendsScrubberFlagpoleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TrendsScrubberFlagpoleView

- (void)layoutSubviews
{
  v2 = self;
  sub_100679374();
}

- (_TtC10FitnessApp26TrendsScrubberFlagpoleView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC10FitnessApp26TrendsScrubberFlagpoleView_platterColor;
  v9 = self;
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[v9 whiteColor];

  v12.receiver = v10;
  v12.super_class = (Class)type metadata accessor for TrendsScrubberFlagpoleView();
  return -[TrendsScrubberFlagpoleView initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (_TtC10FitnessApp26TrendsScrubberFlagpoleView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC10FitnessApp26TrendsScrubberFlagpoleView_platterColor;
  v6 = self;
  id v7 = a3;
  uint64_t v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 whiteColor];

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for TrendsScrubberFlagpoleView();
  v9 = [(TrendsScrubberFlagpoleView *)&v11 initWithCoder:v7];

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendsScrubberFlagpoleView_platterColor));
}

@end