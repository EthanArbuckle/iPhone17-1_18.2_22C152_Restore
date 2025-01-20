@interface TUSegmentedColorView
- (TUSegmentedColorView)initWithCoder:(id)a3;
- (TUSegmentedColorView)initWithFrame:(CGRect)a3;
- (UIColor)endColor;
- (UIColor)startColor;
- (int64_t)direction;
- (int64_t)numberOfSegments;
- (void)drawRect:(CGRect)a3;
- (void)setDirection:(int64_t)a3;
- (void)setEndColor:(id)a3;
- (void)setNumberOfSegments:(int64_t)a3;
- (void)setStartColor:(id)a3;
@end

@implementation TUSegmentedColorView

- (UIColor)startColor
{
  id v2 = SegmentedColorView.startColor.getter();
  return (UIColor *)v2;
}

- (void)setStartColor:(id)a3
{
  id v4 = a3;
  v5 = self;
  SegmentedColorView.startColor.setter();
}

- (UIColor)endColor
{
  id v2 = SegmentedColorView.endColor.getter();
  return (UIColor *)v2;
}

- (void)setEndColor:(id)a3
{
  id v4 = a3;
  v5 = self;
  SegmentedColorView.endColor.setter();
}

- (int64_t)numberOfSegments
{
  return SegmentedColorView.numberOfSegments.getter();
}

- (void)setNumberOfSegments:(int64_t)a3
{
  v3 = self;
  SegmentedColorView.numberOfSegments.setter();
}

- (int64_t)direction
{
  return SegmentedColorView.direction.getter();
}

- (void)setDirection:(int64_t)a3
{
  v3 = self;
  SegmentedColorView.direction.setter();
}

- (TUSegmentedColorView)initWithFrame:(CGRect)a3
{
  return (TUSegmentedColorView *)SegmentedColorView.init(frame:)();
}

- (TUSegmentedColorView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B6000F3C();
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  SegmentedColorView.draw(_:)(v9);
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TUSegmentedColorView_endColor);
}

@end