@interface SearchBar
- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8VideosUI9SearchBar)initWithCoder:(id)a3;
- (_TtC8VideosUI9SearchBar)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setShowsScopeBar:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation SearchBar

- (void)layoutSubviews
{
  v2 = self;
  sub_1E2CE8AAC();
}

- (_TtC8VideosUI9SearchBar)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3731408();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_1E37314F0(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)setShowsScopeBar:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v5 = a3;
  double v6 = self;
  sub_1E3731B94(v5, a4);
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 1;
}

- (_TtC8VideosUI9SearchBar)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI9SearchBar____lazy_storage___categoryFilterBar));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI9SearchBar____lazy_storage___queryDescriptionBar);
}

@end