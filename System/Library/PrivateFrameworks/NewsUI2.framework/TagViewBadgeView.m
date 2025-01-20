@interface TagViewBadgeView
- (_TtC7NewsUI216TagViewBadgeView)initWithCoder:(id)a3;
- (_TtC7NewsUI216TagViewBadgeView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TagViewBadgeView

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1DF7294F8(a3);
}

- (_TtC7NewsUI216TagViewBadgeView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI216TagViewBadgeView_color) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TagViewBadgeView();
  return -[TagViewBadgeView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7NewsUI216TagViewBadgeView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI216TagViewBadgeView_color) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TagViewBadgeView();
  return [(TagViewBadgeView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end