@interface FollowingFooterView
- (_TtC7NewsUI219FollowingFooterView)initWithCoder:(id)a3;
- (_TtC7NewsUI219FollowingFooterView)initWithFrame:(CGRect)a3;
@end

@implementation FollowingFooterView

- (_TtC7NewsUI219FollowingFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI219FollowingFooterView *)sub_1DF85C61C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI219FollowingFooterView)initWithCoder:(id)a3
{
  result = (_TtC7NewsUI219FollowingFooterView *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI219FollowingFooterView_backgroundView));

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI219FollowingFooterView_bottomHairline);
}

@end