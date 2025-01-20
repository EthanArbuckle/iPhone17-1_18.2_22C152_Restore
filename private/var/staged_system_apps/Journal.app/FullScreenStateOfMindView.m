@interface FullScreenStateOfMindView
- (_TtC7Journal25FullScreenStateOfMindView)initWithCoder:(id)a3;
- (_TtC7Journal25FullScreenStateOfMindView)initWithFrame:(CGRect)a3;
@end

@implementation FullScreenStateOfMindView

- (_TtC7Journal25FullScreenStateOfMindView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal25FullScreenStateOfMindView *)sub_1004BC528(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal25FullScreenStateOfMindView)initWithCoder:(id)a3
{
  return (_TtC7Journal25FullScreenStateOfMindView *)sub_1004BC630(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal25FullScreenStateOfMindView_stateOfMindAsset));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal25FullScreenStateOfMindView_stateOfMindView));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal25FullScreenStateOfMindView_scrollView);
}

@end