@interface FloatingTabBarNavigationTitleView
- (NSString)description;
- (_TtC5TeaUI33FloatingTabBarNavigationTitleView)initWithCoder:(id)a3;
- (_TtC5TeaUI33FloatingTabBarNavigationTitleView)initWithFrame:(CGRect)a3;
- (double)contentAlpha;
- (double)verticalOffset;
- (void)contentDidChange;
- (void)layoutSubviews;
- (void)setContentAlpha:(double)a3;
@end

@implementation FloatingTabBarNavigationTitleView

- (_TtC5TeaUI33FloatingTabBarNavigationTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  FloatingTabBarNavigationTitleView.init(coder:)();
}

- (NSString)description
{
  v2 = self;
  sub_1B5E715B4();

  id v3 = (void *)sub_1B61B20C0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1B5E7198C();
}

- (void)contentDidChange
{
  v2 = self;
  sub_1B5E71D10();
}

- (_TtC5TeaUI33FloatingTabBarNavigationTitleView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI33FloatingTabBarNavigationTitleView_contentView));
}

- (double)contentAlpha
{
  v2 = self;
  FloatingTabBarNavigationTitleView.contentAlpha.getter();
  double v4 = v3;

  return v4;
}

- (void)setContentAlpha:(double)a3
{
  double v3 = self;
  FloatingTabBarNavigationTitleView.contentAlpha.setter();
}

- (double)verticalOffset
{
  return 0.0;
}

@end