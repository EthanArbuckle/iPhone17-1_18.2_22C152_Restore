@interface RoundedContainerView
- (_TtC8BookEPUB20RoundedContainerView)initWithCoder:(id)a3;
- (_TtC8BookEPUB20RoundedContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation RoundedContainerView

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoundedContainerView();
  id v2 = v5.receiver;
  [(RoundedContainerView *)&v5 layoutSubviews];
  id v3 = [v2 layer];
  [v2 frame];
  [v3 setCornerRadius:v4 * 0.5];
}

- (_TtC8BookEPUB20RoundedContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RoundedContainerView();
  return -[RoundedContainerView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC8BookEPUB20RoundedContainerView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoundedContainerView();
  return [(RoundedContainerView *)&v5 initWithCoder:a3];
}

@end