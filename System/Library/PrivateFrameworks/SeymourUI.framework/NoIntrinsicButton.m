@interface NoIntrinsicButton
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI17NoIntrinsicButton)initWithCoder:(id)a3;
- (_TtC9SeymourUI17NoIntrinsicButton)initWithFrame:(CGRect)a3;
@end

@implementation NoIntrinsicButton

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F83C20];
  double v3 = *MEMORY[0x263F83C20];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC9SeymourUI17NoIntrinsicButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NoIntrinsicButton();
  return -[NoIntrinsicButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SeymourUI17NoIntrinsicButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NoIntrinsicButton();
  return [(NoIntrinsicButton *)&v5 initWithCoder:a3];
}

@end