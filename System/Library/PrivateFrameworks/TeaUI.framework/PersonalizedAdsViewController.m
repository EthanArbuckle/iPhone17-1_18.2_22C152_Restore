@interface PersonalizedAdsViewController
- (_TtC5TeaUI29PersonalizedAdsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC5TeaUI29PersonalizedAdsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapLearnMore;
- (void)didTapTurnOff;
- (void)didTapTurnOn;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PersonalizedAdsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1B6197BA8();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1B6198370();
}

- (_TtC5TeaUI29PersonalizedAdsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  if (a4)
  {
    sub_1B61B20F0();
    if (!a5) {
LABEL_3:
    }
      sub_1B6198914();
  }
  else if (!a5)
  {
    goto LABEL_3;
  }
  sub_1B61B20F0();
  sub_1B6198914();
}

- (_TtC5TeaUI29PersonalizedAdsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  sub_1B61B20F0();
  if (a4) {
    sub_1B61B20F0();
  }
  id v8 = a5;
  sub_1B6198988();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI29PersonalizedAdsViewController_adPrivacyHeaderIconView));
  sub_1B5E3799C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI29PersonalizedAdsViewController_turnOnCallback));
  sub_1B5E3799C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI29PersonalizedAdsViewController_turnOffCallback));
  v3 = (char *)self + OBJC_IVAR____TtC5TeaUI29PersonalizedAdsViewController_onboardingFlowDelegate;
  sub_1B5E437C4((uint64_t)v3);
}

- (void)didTapLearnMore
{
  v2 = self;
  sub_1B6198A84();
}

- (void)didTapTurnOn
{
  v2 = self;
  sub_1B6198C30(&OBJC_IVAR____TtC5TeaUI29PersonalizedAdsViewController_turnOnCallback);
}

- (void)didTapTurnOff
{
  v2 = self;
  sub_1B6198C30(&OBJC_IVAR____TtC5TeaUI29PersonalizedAdsViewController_turnOffCallback);
}

@end