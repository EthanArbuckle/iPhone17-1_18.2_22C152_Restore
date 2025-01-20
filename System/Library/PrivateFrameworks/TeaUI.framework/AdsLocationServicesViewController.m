@interface AdsLocationServicesViewController
- (_TtC5TeaUI33AdsLocationServicesViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC5TeaUI33AdsLocationServicesViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapContinue;
- (void)didTapManage;
- (void)updateViewConstraints;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation AdsLocationServicesViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1B61AD428();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1B61AD7CC();
}

- (void)updateViewConstraints
{
  v2 = self;
  sub_1B61AD8C0();
}

- (_TtC5TeaUI33AdsLocationServicesViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  if (a4)
  {
    sub_1B61B20F0();
    if (!a5) {
LABEL_3:
    }
      sub_1B61ADA98();
  }
  else if (!a5)
  {
    goto LABEL_3;
  }
  sub_1B61B20F0();
  sub_1B61ADA98();
}

- (_TtC5TeaUI33AdsLocationServicesViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  sub_1B61B20F0();
  if (a4) {
    sub_1B61B20F0();
  }
  id v8 = a5;
  sub_1B61ADB0C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI33AdsLocationServicesViewController_iconView));
  sub_1B5E3799C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI33AdsLocationServicesViewController_continueCallback));
  sub_1B5E3799C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI33AdsLocationServicesViewController_manageCallback));
  v3 = (char *)self + OBJC_IVAR____TtC5TeaUI33AdsLocationServicesViewController_onboardingFlowDelegate;
  sub_1B5E437C4((uint64_t)v3);
}

- (void)didTapContinue
{
  v2 = self;
  sub_1B61ADC5C(&OBJC_IVAR____TtC5TeaUI33AdsLocationServicesViewController_continueCallback);
}

- (void)didTapManage
{
  v2 = self;
  sub_1B61ADC5C(&OBJC_IVAR____TtC5TeaUI33AdsLocationServicesViewController_manageCallback);
}

@end