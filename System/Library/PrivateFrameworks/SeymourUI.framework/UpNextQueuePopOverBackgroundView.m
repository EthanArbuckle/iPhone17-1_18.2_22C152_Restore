@interface UpNextQueuePopOverBackgroundView
+ (UIEdgeInsets)contentViewInsets;
+ (double)arrowBase;
+ (double)arrowHeight;
- (_TtC9SeymourUI32UpNextQueuePopOverBackgroundView)initWithCoder:(id)a3;
- (_TtC9SeymourUI32UpNextQueuePopOverBackgroundView)initWithFrame:(CGRect)a3;
- (double)arrowOffset;
- (unint64_t)arrowDirection;
@end

@implementation UpNextQueuePopOverBackgroundView

- (unint64_t)arrowDirection
{
  return 1;
}

- (double)arrowOffset
{
  return 0.0;
}

+ (UIEdgeInsets)contentViewInsets
{
  double v2 = *MEMORY[0x263F834E8];
  double v3 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v4 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v5 = *(double *)(MEMORY[0x263F834E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (double)arrowBase
{
  return 20.0;
}

+ (double)arrowHeight
{
  return 12.0;
}

- (_TtC9SeymourUI32UpNextQueuePopOverBackgroundView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for UpNextQueuePopOverBackgroundView();
  v7 = -[UIPopoverBackgroundView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  [(UpNextQueuePopOverBackgroundView *)v7 setAlpha:0.0];
  return v7;
}

- (_TtC9SeymourUI32UpNextQueuePopOverBackgroundView)initWithCoder:(id)a3
{
  UIEdgeInsets result = (_TtC9SeymourUI32UpNextQueuePopOverBackgroundView *)sub_23A800DD8();
  __break(1u);
  return result;
}

@end