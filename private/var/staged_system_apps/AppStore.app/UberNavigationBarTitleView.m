@interface UberNavigationBarTitleView
- (_TtC8AppStore18RoundChevronButton)accessibilityNonStandardDismissButton;
- (_TtC8AppStore26UberNavigationBarTitleView)initWithCoder:(id)a3;
- (_TtC8AppStore26UberNavigationBarTitleView)initWithFrame:(CGRect)a3;
- (void)didTapNonStandardDismissButton;
- (void)layoutSubviews;
@end

@implementation UberNavigationBarTitleView

- (_TtC8AppStore26UberNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore26UberNavigationBarTitleView *)sub_10007DDA8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore26UberNavigationBarTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005A2148();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005A1D88();
}

- (void)didTapNonStandardDismissButton
{
  v2 = *(void (**)(uint64_t))&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC8AppStore26UberNavigationBarTitleView_nonStandardDismissHandler];
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_100060050((uint64_t)v2);
    v2(v3);
    sub_10006012C((uint64_t)v2);
  }
}

- (_TtC8AppStore18RoundChevronButton)accessibilityNonStandardDismissButton
{
  return (_TtC8AppStore18RoundChevronButton *)*(id *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC8AppStore26UberNavigationBarTitleView_nonStandardDismissButton];
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC8AppStore26UberNavigationBarTitleView_nonStandardDismissHandler];

  sub_10006012C(v3);
}

@end