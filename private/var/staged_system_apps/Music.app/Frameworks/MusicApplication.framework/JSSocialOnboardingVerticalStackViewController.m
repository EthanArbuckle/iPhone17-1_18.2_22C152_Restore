@interface JSSocialOnboardingVerticalStackViewController
- (_TtC16MusicApplication45JSSocialOnboardingVerticalStackViewController)initWithCoder:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation JSSocialOnboardingVerticalStackViewController

- (_TtC16MusicApplication45JSSocialOnboardingVerticalStackViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1A2D20();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_19C90C(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for JSSocialOnboardingVerticalStackViewController();
  id v4 = v8.receiver;
  [(VerticalStackViewController *)&v8 viewDidAppear:v3];
  id v5 = [v4 presentingViewController];

  if (v5)
  {
    id v6 = [v4 navigationController];
    if (v6)
    {
      id v7 = v6;
      [v6 setModalInPresentation:1];

      id v4 = v7;
    }
  }
}

- (void)viewDidLoad
{
  v2 = self;
  sub_19CB5C();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_19DBFC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication45JSSocialOnboardingVerticalStackViewController_pageHeaderContentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication45JSSocialOnboardingVerticalStackViewController_promotionalParallaxViewController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication45JSSocialOnboardingVerticalStackViewController_onboardingVerticalStack));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication45JSSocialOnboardingVerticalStackViewController_pinnedButtonContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication45JSSocialOnboardingVerticalStackViewController____lazy_storage___nextStepButton));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication45JSSocialOnboardingVerticalStackViewController____lazy_storage___cancelStepButton);
}

@end