@interface AppSearchResultContentView
- (_TtC8AppStore21SmallSearchLockupView)accessibilityLockupView;
- (_TtC8AppStore26AppSearchResultContentView)initWithCoder:(id)a3;
- (_TtC8AppStore26AppSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AppSearchResultContentView

- (_TtC8AppStore26AppSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore26AppSearchResultContentView *)sub_10036A66C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore26AppSearchResultContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10036E4F4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10036A9E0();
}

- (_TtC8AppStore21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC8AppStore21SmallSearchLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                         + OBJC_IVAR____TtC8AppStore26AppSearchResultContentView_lockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppSearchResultContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppSearchResultContentView_screenshots));
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore26AppSearchResultContentView_impressionsUpdateBlock);

  sub_10006012C(v3);
}

@end