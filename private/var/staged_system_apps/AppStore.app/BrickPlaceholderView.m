@interface BrickPlaceholderView
- (_TtC8AppStore20BrickPlaceholderView)initWithCoder:(id)a3;
- (_TtC8AppStore20BrickPlaceholderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BrickPlaceholderView

- (_TtC8AppStore20BrickPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore20BrickPlaceholderView *)sub_100609E14(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore20BrickPlaceholderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10060A394();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100609F80();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20BrickPlaceholderView_artworkPlaceholder));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore20BrickPlaceholderView_supplementaryTextPlaceholder);
}

@end