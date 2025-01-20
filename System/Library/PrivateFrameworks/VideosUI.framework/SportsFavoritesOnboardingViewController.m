@interface SportsFavoritesOnboardingViewController
- (_TtC8VideosUI39SportsFavoritesOnboardingViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI39SportsFavoritesOnboardingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)doConfirmationAction;
- (void)doDeferAction;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SportsFavoritesOnboardingViewController

- (_TtC8VideosUI39SportsFavoritesOnboardingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E31581C0();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E315885C(v4);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3158A98(v4);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3158B84();
}

- (void)doConfirmationAction
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E315942C();
}

- (void)doDeferAction
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E315A920();
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_1E315AC74(v6, a4);

  swift_unknownObjectRelease();
}

- (_TtC8VideosUI39SportsFavoritesOnboardingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E315AD68();
}

- (void).cxx_destruct
{
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI39SportsFavoritesOnboardingViewController_completion));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI39SportsFavoritesOnboardingViewController____lazy_storage___controller));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI39SportsFavoritesOnboardingViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI39SportsFavoritesOnboardingViewController_confirmationButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI39SportsFavoritesOnboardingViewController_deferButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI39SportsFavoritesOnboardingViewController_lastRecordedPageEventData);
}

@end