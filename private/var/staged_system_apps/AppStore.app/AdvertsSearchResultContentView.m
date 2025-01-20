@interface AdvertsSearchResultContentView
- (_TtC8AppStore21SmallSearchLockupView)accessibilityLockupView;
- (_TtC8AppStore30AdvertsSearchResultContentView)initWithCoder:(id)a3;
- (_TtC8AppStore30AdvertsSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)disableAdvertRotationTap;
- (void)layoutSubviews;
@end

@implementation AdvertsSearchResultContentView

- (_TtC8AppStore30AdvertsSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore30AdvertsSearchResultContentView *)sub_1006A295C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore30AdvertsSearchResultContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006A6B9C();
}

- (void)disableAdvertRotationTap
{
  id v3 = (void (**)(uint64_t))((char *)self
                                     + OBJC_IVAR____TtC8AppStore30AdvertsSearchResultContentView_disableAdvertRotation);
  swift_beginAccess();
  v4 = *v3;
  if (*v3)
  {
    v5 = self;
    uint64_t v6 = sub_100060050((uint64_t)v4);
    v4(v6);
    sub_10006012C((uint64_t)v4);
  }
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006A2BC4();
}

- (_TtC8AppStore21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC8AppStore21SmallSearchLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                         + OBJC_IVAR____TtC8AppStore30AdvertsSearchResultContentView_lockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30AdvertsSearchResultContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30AdvertsSearchResultContentView_screenshots));
  swift_bridgeObjectRelease();
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore30AdvertsSearchResultContentView_disableAdvertRotation));
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore30AdvertsSearchResultContentView_impressionsUpdateBlock);

  sub_10006012C(v3);
}

@end