@interface HomeScreenConfigurationView
- (_TtC11PosterBoard27HomeScreenConfigurationView)initWithCoder:(id)a3;
- (_TtC11PosterBoard27HomeScreenConfigurationView)initWithFrame:(CGRect)a3;
- (void)didSelectControl:(id)a3;
- (void)posterPairDidUpdateConfiguredProperties:(id)a3;
- (void)posterPairDidUpdateHomePosterAppearance:(id)a3;
- (void)posterPairDidUpdateLockPosterAppearance:(id)a3;
- (void)reloadLockPosterSnapshot;
- (void)toggleLegibilityBlur:(id)a3;
@end

@implementation HomeScreenConfigurationView

- (_TtC11PosterBoard27HomeScreenConfigurationView)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard27HomeScreenConfigurationView *)sub_1D32EB0E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard27HomeScreenConfigurationView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1D32EE090();
}

- (void)posterPairDidUpdateConfiguredProperties:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D32EB298((uint64_t)v4);
}

- (void)posterPairDidUpdateLockPosterAppearance:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D32EB460();
}

- (void)posterPairDidUpdateHomePosterAppearance:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D32EB958();
}

- (void)reloadLockPosterSnapshot
{
  v2 = self;
  sub_1D32EB460();
}

- (void)didSelectControl:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D32ED7D0((uint64_t)v4);
}

- (void)toggleLegibilityBlur:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D32EE17C();
}

- (void).cxx_destruct
{
  sub_1D32CE208((uint64_t)self + OBJC_IVAR____TtC11PosterBoard27HomeScreenConfigurationView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard27HomeScreenConfigurationView_posterPair));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard27HomeScreenConfigurationView_lockPosterPreviewView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard27HomeScreenConfigurationView_gradientPreviewView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard27HomeScreenConfigurationView_solidColorPreviewView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard27HomeScreenConfigurationView_homePosterPreviewView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard27HomeScreenConfigurationView_blurButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard27HomeScreenConfigurationView_stackView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11PosterBoard27HomeScreenConfigurationView_homeScreenConfiguration);
}

@end