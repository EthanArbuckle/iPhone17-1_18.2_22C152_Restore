@interface HistogramView
- (_TtC4Maps13HistogramView)initWithCoder:(id)a3;
- (_TtC4Maps13HistogramView)initWithFrame:(CGRect)a3;
@end

@implementation HistogramView

- (_TtC4Maps13HistogramView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(_DWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps13HistogramView_totalEventCount) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for HistogramView();
  v7 = -[HistogramView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  [(HistogramView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v7;
}

- (_TtC4Maps13HistogramView)initWithCoder:(id)a3
{
  *(_DWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps13HistogramView_totalEventCount) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HistogramView();
  return [(HistogramView *)&v5 initWithCoder:a3];
}

@end