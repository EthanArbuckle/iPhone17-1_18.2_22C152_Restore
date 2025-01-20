@interface FMSeparationNotificationWelcomeViewController
- (_TtC6FindMy45FMSeparationNotificationWelcomeViewController)initWithCoder:(id)a3;
- (void)cancelAction;
- (void)scrollViewDidScroll:(id)a3;
- (void)secondaryAction;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FMSeparationNotificationWelcomeViewController

- (_TtC6FindMy45FMSeparationNotificationWelcomeViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100305458();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FMSeparationNotificationWelcomeViewController();
  id v4 = v7.receiver;
  [(FMSeparationNotificationWelcomeViewController *)&v7 viewWillAppear:v3];
  id v5 = [v4 parentViewController];
  if (v5)
  {
    v6 = v5;
    self;
    if (swift_dynamicCastObjCClass()) {
      sub_100139154();
    }
  }
  else
  {
    v6 = v4;
  }
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_10030035C();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FMSeparationNotificationWelcomeViewController();
  id v4 = v7.receiver;
  [(FMSeparationNotificationWelcomeViewController *)&v7 viewDidAppear:v3];
  id v5 = [v4 navigationItem];
  id v6 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v4 action:"cancelAction"];
  [v5 setLeftBarButtonItem:v6];
}

- (void)secondaryAction
{
  v2 = (char *)self + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v3 = *((void *)v2 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
    id v6 = self;
    v5(ObjectType, v3);
    swift_unknownObjectRelease();
  }
  else
  {
    objc_super v7 = self;
  }
  [(FMSeparationNotificationWelcomeViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)cancelAction
{
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v3 = *(void (**)(id))((char *)&self->super.super.super.super.isa
                                 + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_scrollHandler);
  if (v3)
  {
    id v5 = a3;
    id v6 = self;
    sub_1000B7838((uint64_t)v3);
    v3(v5);
    sub_100036B90((uint64_t)v3);
  }
}

- (void).cxx_destruct
{
  sub_100036B90(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_scrollHandler));
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_scrollContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_secondaryActionButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_informativeImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_heightConstraint));
  swift_bridgeObjectRelease();
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_singleItem, (uint64_t *)&unk_1006AFE30);
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_singleDevice, &qword_1006B2AF0);
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_safeLocationSuggestion, (uint64_t *)&unk_1006BEB20);
  swift_bridgeObjectRelease();
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_separationLocation, &qword_1006BA4E0);

  swift_release();
}

@end