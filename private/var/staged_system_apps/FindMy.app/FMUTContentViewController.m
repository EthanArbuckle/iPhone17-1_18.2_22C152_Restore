@interface FMUTContentViewController
- (_TtC6FindMy25FMUTContentViewController)initWithCoder:(id)a3;
- (void)dismissInformationalControllerWithSender:(id)a3;
- (void)dismissWelcomeController;
- (void)handleDisableTap;
- (void)handleFindButton;
- (void)handleLearnMoreTap;
- (void)handlePlaySound;
- (void)ignoreTag;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMUTContentViewController

- (_TtC6FindMy25FMUTContentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003185E4();
}

- (void)viewDidLoad
{
  v2 = self;
  id v3 = [(FMUTContentViewController *)v2 view];
  if (v3)
  {
    v4 = v3;
    [v3 setFrame:CGRectMake(0.0, 0.0, 100.0, 100.0)];

    v5.receiver = v2;
    v5.super_class = (Class)type metadata accessor for FMUTContentViewController();
    [(FMBaseContentViewController *)&v5 viewDidLoad];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMUTContentViewController();
  v4 = (char *)v5.receiver;
  [(FMUTContentViewController *)&v5 viewWillAppear:v3];
  *(unsigned char *)(*(void *)&v4[OBJC_IVAR____TtC6FindMy25FMUTContentViewController_dataSource]
           + OBJC_IVAR____TtC6FindMy20FMUTDetailDataSource_updatesEnabled) = 1;
  swift_retain();
  sub_100296A50();

  swift_release();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10030736C(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100307EEC();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_100308030(a3);
}

- (void)handleLearnMoreTap
{
  v2 = self;
  sub_10030F6D0();
}

- (void)ignoreTag
{
  v2 = self;
  sub_100310794();
}

- (void)handleDisableTap
{
  v2 = self;
  sub_1003112EC();
}

- (void)handlePlaySound
{
  v2 = self;
  sub_10031589C();
}

- (void)handleFindButton
{
  v2 = self;
  sub_1003148D8(0, 0);
}

- (void)dismissWelcomeController
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_welcomeController);
  if (v2)
  {
    v7[4] = State.rawValue.getter;
    v7[5] = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 1107296256;
    v7[2] = sub_10003C410;
    v7[3] = &unk_100633F58;
    v4 = _Block_copy(v7);
    objc_super v5 = self;
    id v6 = v2;
    [v6 dismissViewControllerAnimated:1 completion:v4];
    _Block_release(v4);
  }
}

- (void)dismissInformationalControllerWithSender:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_100317054();

  sub_10002CEFC((uint64_t)&v5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_welcomeController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_informationalController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_soundPendingAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_accessorySoundPendingAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_playSoundButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_ignoreButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_findButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_shareButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_firstRowStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_actionButtonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_verticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_footerLabel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_utImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_findingExperiencePresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_findingExperienceAttentionModule));
  swift_release();
  BOOL v3 = (char *)self + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_utAnalytics;
  uint64_t v4 = type metadata accessor for FMIPUTAlertEvent();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end