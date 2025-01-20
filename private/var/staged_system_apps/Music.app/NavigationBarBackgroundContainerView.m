@interface NavigationBarBackgroundContainerView
- (_TtC5Music36NavigationBarBackgroundContainerView)initWithCoder:(id)a3;
- (_TtC5Music36NavigationBarBackgroundContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NavigationBarBackgroundContainerView

- (_TtC5Music36NavigationBarBackgroundContainerView)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC5Music36NavigationBarBackgroundContainerView_visibleBackgroundBottom;
  *(void *)v4 = 0;
  v4[8] = 1;
  id v5 = a3;

  result = (_TtC5Music36NavigationBarBackgroundContainerView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10072A950();
}

- (_TtC5Music36NavigationBarBackgroundContainerView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music36NavigationBarBackgroundContainerView_backgroundView));
}

@end