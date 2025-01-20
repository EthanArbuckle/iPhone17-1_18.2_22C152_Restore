@interface HiddenContentPlacardView
- (_TtC8NewsFeed24HiddenContentPlacardView)initWithCoder:(id)a3;
- (_TtC8NewsFeed24HiddenContentPlacardView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation HiddenContentPlacardView

- (_TtC8NewsFeed24HiddenContentPlacardView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed24HiddenContentPlacardView *)sub_1C10A1FB4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed24HiddenContentPlacardView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C10A240C();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  v10 = sub_1C10A2180((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24HiddenContentPlacardView_titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed24HiddenContentPlacardView_dismissalButton);
}

@end