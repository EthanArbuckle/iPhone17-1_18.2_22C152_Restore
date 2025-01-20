@interface AppEventPlaceholderView
- (_TtC8AppStore23AppEventPlaceholderView)initWithCoder:(id)a3;
- (_TtC8AppStore23AppEventPlaceholderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AppEventPlaceholderView

- (_TtC8AppStore23AppEventPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore23AppEventPlaceholderView *)sub_1003340C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore23AppEventPlaceholderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003346E0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003343A8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23AppEventPlaceholderView_formattedDatePlaceholder));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore23AppEventPlaceholderView_appEventPlaceholder);
}

@end