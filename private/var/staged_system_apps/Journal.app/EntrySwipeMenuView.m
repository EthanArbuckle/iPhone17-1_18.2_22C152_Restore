@interface EntrySwipeMenuView
- (CGRect)bounds;
- (_TtC7Journal18EntrySwipeMenuView)initWithCoder:(id)a3;
- (_TtC7Journal18EntrySwipeMenuView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setBounds:(CGRect)a3;
@end

@implementation EntrySwipeMenuView

- (CGRect)bounds
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for EntrySwipeMenuView();
  [(EntrySwipeMenuView *)&v6 bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_100008720(x, y, width, height);
}

- (_TtC7Journal18EntrySwipeMenuView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal18EntrySwipeMenuView *)sub_100008860(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal18EntrySwipeMenuView)initWithCoder:(id)a3
{
  return (_TtC7Journal18EntrySwipeMenuView *)sub_100008A70(a3);
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_100009FC0();
}

- (void).cxx_destruct
{
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal18EntrySwipeMenuView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18EntrySwipeMenuView_contentScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18EntrySwipeMenuView_menuContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18EntrySwipeMenuView_menuContentViewLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18EntrySwipeMenuView_leftButtonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18EntrySwipeMenuView_rightButtonsStackView));
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal18EntrySwipeMenuView_hapticGenerator);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_10000AF70(v4);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7 = a3;
  v8 = self;
  sub_10000FA14((uint64_t)a5);
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_10000FC94();
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5 = a3;
  objc_super v6 = self;
  sub_10000FDEC();
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000100A0();
}

@end