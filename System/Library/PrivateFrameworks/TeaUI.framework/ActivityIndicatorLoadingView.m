@interface ActivityIndicatorLoadingView
- (_TtC5TeaUI28ActivityIndicatorLoadingView)initWithCoder:(id)a3;
- (_TtC5TeaUI28ActivityIndicatorLoadingView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ActivityIndicatorLoadingView

- (_TtC5TeaUI28ActivityIndicatorLoadingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B615A6C8();
}

- (void)layoutSubviews
{
  v2 = self;
  ActivityIndicatorLoadingView.layoutSubviews()();
}

- (_TtC5TeaUI28ActivityIndicatorLoadingView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI28ActivityIndicatorLoadingView_activityIndicatorView));

  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5TeaUI28ActivityIndicatorLoadingView_overrideColor);
}

@end